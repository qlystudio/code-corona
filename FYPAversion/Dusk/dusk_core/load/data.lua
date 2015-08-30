--------------------------------------------------------------------------------
--[[
Dusk Engine Component: Data

Loads map data from a filename.
--]]
--------------------------------------------------------------------------------

local lib_data = {}

--------------------------------------------------------------------------------
-- Localize
--------------------------------------------------------------------------------
local require = require

local json = require("json")
--local lib_tmx = require("Dusk.dusk_core.load.tmx")
local tprint = require("Dusk.dusk_core.misc.tprint")
local preprocessor_lua = require("Dusk.dusk_core.load.preprocessor_lua")

local system_pathForFile = system.pathForFile
local json_decode = json.decode
local pcall = pcall
local tprint_add = tprint.add
local tprint_error = tprint.error
local tprint_remove = tprint.remove

local function getFileContents(filename, base) local base = base or system.ResourceDirectory local path = system.pathForFile(filename, base) local contents local file = io.open(path, "r") if file then contents = file:read("*a") io.close(file) file = nil end return contents end

--------------------------------------------------------------------------------
-- Get Map Data
--------------------------------------------------------------------------------
function lib_data.get(filename, base)
	local extension = filename:match("%.[^%.]-$") or "[no extension]"
	if extension ~= ".json" and extension ~= ".lua" then tprint_error("Unsupported file extension \"" .. extension .. "\".") end

	local path = system_pathForFile(filename, base)

	-- Check for nonexistent files
	if path == nil then tprint_error("No file found at path \""..filename.."\".") end

	------------------------------------------------------------------------------
	-- Load JSON
	------------------------------------------------------------------------------
	if extension == ".json" then
		tprint_add("Read JSON")
		local contents = getFileContents(filename, base)
		local data, _, msg = json_decode(contents) -- Ignore the second value - it's the character the issue was found on

		if not data then
			tprint("\n\n" .. msg .. "\n\n")
			tprint_error("Failed to parse JSON data. Error message shown above.")
		end

		tprint_remove()
		return data

	------------------------------------------------------------------------------
	-- Load Lua
	------------------------------------------------------------------------------
	elseif extension == ".lua" then
		tprint_add("Read Lua")

		local luaName = filename:gsub("%.[^%.]-$", "")
		luaName = luaName:gsub("/", ".")
		local success, result = pcall(function() return require(luaName) end)

		if not success then
			tprint("\n\n" .. result .. "\n\n")
			tprint_error("Failed to load Lua data. Error shown above.")
		end

		tprint_remove()

		preprocessor_lua.process(result) -- We need to preprocess Lua files because of the difference in formats
		return result

	end -- No need to check for other extensions because we already safeguarded with a check earlier

	return data
end

return lib_data