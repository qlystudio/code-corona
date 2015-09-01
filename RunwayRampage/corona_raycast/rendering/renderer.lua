-- Class: Renderer
-- SDK: Corona - 09/12/11
-- Author: Andrew Burch
-- Date: 08/02/12
-- Site: http://www.newhighscore.net
-- Contact: andrew.burch@newhighscore.net
-- Note: Render a single frame from the raycasting engine
--			Very custom and unoptimised
--			Only handles flat filled walls - no textures (..yet)

local tablex = require('core.tablex')
local spritefactory = require('systems.spritefactory')

local floor = math.floor
local min = math.min

-- basic depth shading
local shadeDistanceMax = 600
local shadeConst = 1 / shadeDistanceMax

local colourTable = {
	{r = 140, g = 0, b = 0},
	{r = 0, g = 140, b = 0},
	{r = 0, g = 90, b = 140},
	{r = 90, g = 0, b = 140},
	{r = 90, g = 140, b = 0},
}

-- renderModes
local ModeTexture = 1
local ModeSolid = 2


local Renderer = {}
local Renderer_mt = {__index = Renderer}

function Renderer.new(params)	
	local renderer = {
		renderMode == ModeTexture,
	}

	return setmetatable(renderer, Renderer_mt)
end

function Renderer:initialise(params)
	local displayGroup = params.displayGroup
	
	local displayWidth = params.displayWidth
	local columnWidth = params.columnWidth
	local horizon = params.horizon

	local referencePoint = display.TopLeftReferencePoint
	local renderTable = {}
	
	for i = 0, displayWidth do
		local slice = display.newRect(displayGroup, i - 1, horizon, columnWidth, 0)
		slice:setFillColor(0, 0, 0)
		-- slice:setReferencePoint(referencePoint)
		
		table.insert(renderTable, slice)
	end
	
	local spriteFactory = spritefactory.new()
	spriteFactory:newUniformSpriteSheet {
						id = 'default',
						filename = 'assets/textures2.png',
						frameWidth = 1,
						frameHeight = 64,
					}
	
	-- texture image 256x64, contains 4 textures
	local textures = 1
	local textureWidth = 256
	for i = 1, textures do
		spriteFactory:createSet {
						id = 'default',
						setId = i,
						startFrame = 1 + ((i - 1) * textureWidth),
						frameCount = textureWidth,
					}
					
		for x = 1, textureWidth do
			spriteFactory:createSequence {
						id = 'default',
						setId = i,
						sequenceName = x,
						startFrame = x,
						frameCount = 1,
						duration = 100,
						loop = 1,
					}
		end
	end

	local renderSprites = {}
	for i = 1, displayWidth do
		local sprite = spriteFactory:createInstance('default', 1)
		sprite.x = i
		sprite.y = horizon
		table.insert(renderSprites, sprite)
		displayGroup:insert(sprite)
	end
		
	self.renderSprites = renderSprites
	self.spriteFactory = spriteFactory
	self.renderTable = renderTable
	
	self:setRenderMode(ModeTexture)	
end

function Renderer:setRenderMode(mode)
	self.renderMode = mode
	
	local renderTable = self.renderTable
	for _,v in ipairs(self.renderTable) do
		v.isVisible = mode == ModeSolid
	end
	
	local spriteFactory = self.spriteFactory
	local renderSprites = self.renderSprites
	for _, sprite in ipairs(renderSprites) do
		sprite.isVisible = mode == ModeTexture
	end
end

function Renderer:renderTexture(params)
	local displayGroup = params.displayGroup
	local renderTable = self.renderTable
	local horizon = params.horizon
	local sceneInfo = params.sceneInfo

	local renderSprites = self.renderSprites

	for i, sliceInfo in ipairs(sceneInfo) do
		local sliceHeight = sliceInfo.sliceHeight
		local halfSliceHeight = sliceHeight

		local wallId = sliceInfo.wallId
		sprite = renderSprites[i]
		sprite:prepare(((wallId - 1) * 64) + sliceInfo.offset)
		sprite.yScale = sliceHeight / 64

		local distance = sliceInfo.distance
		local shadeFactor = 1 - (min(distance, shadeDistanceMax) * shadeConst)
		local shade = 255 * shadeFactor
		sprite:setFillColor(shade, shade, shade)
	end	
end

function Renderer:renderSolid(params)
	local displayGroup = params.displayGroup
	local renderTable = self.renderTable
	local horizon = params.horizon
	local sceneInfo = params.sceneInfo

	for i, sliceInfo in ipairs(sceneInfo) do
		local sliceHeight = sliceInfo.sliceHeight
		local halfSliceHeight = sliceHeight

		local renderSlice = renderTable[i]
		renderSlice.height = sliceHeight

		local colourId = sliceInfo.wallId
		local col = colourTable[colourId]
		local distance = sliceInfo.distance
		local shadeFactor = 1 - (min(distance, shadeDistanceMax) * shadeConst)
		local r = col.r * shadeFactor
		local g = col.g * shadeFactor
		local b = col.b * shadeFactor
		renderSlice:setFillColor(r, g, b)
	end
end

function Renderer:renderScene(params)
	local renderTable = self.renderTable
	local displayGroup = params.displayGroup
	local horizon = params.horizon
	local sceneInfo = params.sceneInfo

	if self.renderMode == ModeTexture then
		self:renderTexture(params)
	else
		self:renderSolid(params)
	end
end

return Renderer