--------------------------------------------------------------------------------
--[[
Dusk Engine Component: Core

Wraps up all core libraries and provides an interface for them.
--]]
--------------------------------------------------------------------------------

local core = {}

--------------------------------------------------------------------------------
-- Localize
--------------------------------------------------------------------------------
local require = require

local tprint = require("Dusk.dusk_core.misc.tprint")
local screen = require("Dusk.dusk_core.misc.screen")
local lib_data = require("Dusk.dusk_core.load.data")
local lib_stats = require("Dusk.dusk_core.load.stats")
local lib_tilesets = require("Dusk.dusk_core.load.tilesets")
local lib_settings = require("Dusk.dusk_core.misc.settings")
local lib_tilelayer = require("Dusk.dusk_core.layer.tilelayer")
local lib_objectlayer = require("Dusk.dusk_core.layer.objectlayer")
local lib_imagelayer = require("Dusk.dusk_core.layer.imagelayer")
local lib_functions = require("Dusk.dusk_core.misc.functions")
local lib_update = require("Dusk.dusk_core.run.update")

local display_newGroup = display.newGroup
local type = type
local table_insert = table.insert
local math_ceil = math.ceil
local getSetting = lib_settings.get
local setVariable = lib_settings.setEvalVariable
local removeVariable = lib_settings.removeEvalVariable
local tprint_add = tprint.add
local tprint_remove = tprint.remove
local tprint_clear = tprint.clear
local tprint_assert = tprint.assert
local fnn = lib_functions.fnn
local getXY = lib_functions.getXY

--------------------------------------------------------------------------------
-- Load Map
--------------------------------------------------------------------------------
function core.loadMap(filename, base)
	local f1, f2 = filename:find("/?([^/]+%..+)$")
	local actualFileName = filename:sub(f1 + 1, f2)
	local dirTree = {}; for dir in filename:sub(1, f1):gmatch("(.-)/") do table_insert(dirTree, dir) end

	-- Load other things
	tprint_add("Load Data"); local data = lib_data.get(filename, base); tprint_remove()
	tprint_add("Load Stats"); local stats = lib_stats.get(data); tprint_remove(); data.stats = stats

	data._dusk = {}
	data._dusk.dirTree = dirTree

	return data, stats
end

--------------------------------------------------------------------------------
-- Build Map
--------------------------------------------------------------------------------
function core.buildMap(data)
	tprint_add("Load Tilesets"); local imageSheets, imageSheetConfig, tileProperties, tileIndex = lib_tilesets.get(data, data._dusk.dirTree); tprint_remove()

	setVariable("mapWidth", data.stats.mapWidth)
	setVariable("mapHeight", data.stats.mapHeight)
	setVariable("pixelWidth", data.stats.width)
	setVariable("pixelHeight", data.stats.height)
	setVariable("tileWidth", data.stats.tileWidth)
	setVariable("tileHeight", data.stats.tileHeight)
	setVariable("rawTileWidth", data.stats.rawTileWidth)
	setVariable("rawTileHeight", data.stats.rawTileHeight)
	setVariable("scaledTileWidth", data.stats.tileWidth)
	setVariable("scaledTileHeight", data.stats.tileHeight)
	
	------------------------------------------------------------------------------
	-- Map Object
	------------------------------------------------------------------------------
	local map = display_newGroup()
	local update
	
	-- Make sure map appears in same position for all devices
	--map:setReferencePoint(display.TopLeftReferencePoint) -- For older versions of Corona, just uncomment it to use
	map.anchorX, map.anchorY = 0, 0
	map.x, map.y = screen.left, screen.top

	map.layer = {}
	map.props = {}
	map.data = data.stats

	local mapProperties = lib_functions.getProperties(data.properties or {}, "map")
	lib_functions.addProperties(mapProperties, "object", map)
	lib_functions.addProperties(mapProperties, "props", map.props)

	------------------------------------------------------------------------------
	-- Create Layers
	------------------------------------------------------------------------------
	tprint_add("Create Layers")

	local enableTileCulling = getSetting("enableTileCulling")
	local layerIndex = 0 -- Use a separate variable so that we can keep track of !inactive! layers
	local numLayers = 0

	for i = 1, #data.layers do
		if (data.layers[i].properties or {})["!inactive!"] ~= "true" then	
			numLayers = numLayers + 1
		end
	end

	map.data.numLayers = numLayers

	local layerList = {
		tile = {},
		object = {},
		image = {}
	}

	for i = 1, #data.layers do
		tprint_add("Layer #" .. i .. " - \"" .. data.layers[i].name .. "\"")

		if (data.layers[i].properties or {})["!inactive!"] ~= "true" then
			local layer

			-- Pass each layer type to that layer builder
			if data.layers[i].type == "tilelayer" then
				layer = lib_tilelayer.createLayer(data, data.layers[i], i, tileIndex, imageSheets, imageSheetConfig, tileProperties)
				layer._type = "tile"
				
				-- Tile layer-specific code
				layer.tileCullingEnabled = fnn(layer.tileCullingEnabled, true)
			elseif data.layers[i].type == "objectgroup" then
				layer = lib_objectlayer.createLayer(data, data.layers[i], i, tileIndex, imageSheets, imageSheetConfig)				
				layer._type = "object"

				-- Object layer-specific code
			elseif data.layers[i].type == "imagelayer" then
				layer = lib_imagelayer.createLayer(data.layers[i], data._dusk.dirTree)
				layer._type = "image"
				
				-- Image layer-specific code
			end

			layer._name = (data.layers[i].name ~= "" and data.layers[i].name) or "layer" .. layerIndex
			layer.cameraTrackingEnabled = fnn(layer.cameraTrackingEnabled, true)
			layer.xParallax = fnn(layer.xParallax, 1)
			layer.yParallax = fnn(layer.yParallax, 1)
			layer.isVisible = data.layers[i].visible

			--------------------------------------------------------------------------
			-- Add Layer to Map
			--------------------------------------------------------------------------

			map.layer[numLayers - layerIndex] = layer
			map.layer[layer._name] = layer
			map:insert(layer)

			layerIndex = layerIndex + 1
		end

		tprint_remove()
	end

	-- Now we add each layer to the layer list, for quick layer iteration of a specific type
	for i = 1, #map.layer do
		if map.layer[i]._type == "tile" then
			table_insert(layerList.tile, i)
		elseif map.layer[i]._type == "object" then
			table_insert(layerList.object, i)
		elseif map.layer[i]._type == "image" then
			table_insert(layerList.image, i)
		end
	end

	tprint_remove()

	------------------------------------------------------------------------------
	-- Map Methods
	------------------------------------------------------------------------------

	------------------------------------------------------------------------------
	-- Tiles/Pixel Conversion
	------------------------------------------------------------------------------
	function map.tilesToPixels(x, y)
		tprint_add("Convert Tiles to Pixels")
		local x, y = getXY(x, y)

		tprint_assert((x ~= nil) and (y ~= nil), "Missing argument(s).")

		x, y = x - 0.5, y - 0.5
		
		tprint_remove()
		return (x * map.data.tileWidth), (y * map.data.tileHeight)
	end

	map.tilesToLocalPixels = map.tilesToPixels

	function map.tilesToContentPixels(x, y)
		local _x, _y = map.tilesToPixels(x, y)
		return map:localToContent(_x, _y)
	end

	------------------------------------------------------------------------------
	-- Pixels/Tiles Conversion
	------------------------------------------------------------------------------
	function map.pixelsToTiles(x, y)
		tprint_add("Convert Pixels to Tiles")
		local x, y = getXY(x, y)

		tprint_assert((x ~= nil) and (y ~= nil), "Missing argument(s).")

		x, y = map:contentToLocal(x, y)
		tprint_remove()
		return math_ceil(x / map.data.tileWidth), math_ceil(y / map.data.tileHeight)
	end

	------------------------------------------------------------------------------
	-- Is Tile in Map
	------------------------------------------------------------------------------
	function map.tileWithinMap(x, y)
		tprint_add("Tile Within Map")
		local x, y = getXY(x, y)

		tprint_assert((x ~= nil) and (y ~= nil), "Missing argument(s).")

		tprint_remove()
		return (x >= 1 and x <= map.data.mapWidth) and (y >= 1 and y <= map.data.mapHeight)
	end

	------------------------------------------------------------------------------
	-- Iterators
	------------------------------------------------------------------------------
	function map.tileLayers()
		local i = 0
		return function()
			i = i + 1
			if layerList.tile[i] then
				return map.layer[layerList.tile[i] ], i
			else
				return nil
			end
		end
	end

	function map.objectLayers()
		local i = 0
		return function()
			i = i + 1
			if layerList.object[i] then
				return map.layer[layerList.object[i] ], i
			else
				return nil
			end
		end
	end

	function map.imageLayers()
		local i = 0
		return function()
			i = i + 1
			if layerList.image[i] then
				return map.layer[layerList.image[i] ], i
			else
				return nil
			end
		end
	end

	------------------------------------------------------------------------------
	-- Destroy Map
	------------------------------------------------------------------------------
	function map.destroy()
		tprint_clear()

		update.destroy()

		for i = 1, #map.layer do
			map.layer[i].destroy()
			map.layer[i] = nil
		end

		display.remove(map)
		map = nil
		return true
	end

	------------------------------------------------------------------------------
	-- Finish Up
	------------------------------------------------------------------------------
	update = lib_update.register(map)

	return map
end

return core