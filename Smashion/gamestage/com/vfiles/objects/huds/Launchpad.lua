require "com.vfiles.core.Class"

Launchpad = Class()

local stage
local stageW = 120
local stageH = 120
local stagePadding = 0
local pad

--------------------------------------------------
-- Listeners
--------------------------------------------------
-- local function weaponChangeEventListener(e)
--   pad:setSequence(e.target)
-- end

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function build(prop, spriteSheet, spriteSheetInfo)  

  -- Create sequence data
  -- local seqData = {}
  -- -- for value in string.gmatch(prop, "%w+") do
  -- for i=1, #prop do
  --     local index = 'launchpad-' .. prop[i].name
  --       table.insert(seqData, {name=prop[i].name, frames= { spriteSheetInfo:getFrameIndex(index)} })      
  -- end
  -- Set pad
  -- pad = display.newSprite(stage, spriteSheet, seqData)
  -- pad = display.newSprite(stage, spriteSheet, { frames= { spriteSheetInfo:getFrameIndex("launchpad")} })
  -- pad:setFillColor( 0,0,0 )
  -- pad
end

--------------------------------------------------
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
function Launchpad:initialize(config)
  stage = display.newContainer(config.parent, stageW, stageH)  
  stage.x = display.contentWidth/2
  stage.y = display.contentHeight - stage.height/2 - stagePadding
  -- stage.alpha = .2

  pad = display.newCircle(stage, 0, 0, 36 )
  pad.strokeWidth = 12
  pad:setFillColor( 0,0,0,0 )
  pad:setStrokeColor(0,0,0,.2)
  pad.y = 10
  -- pad:sets

  -- build(config.prop, config.spriteSheet, config.spriteSheetInfo)
  -- scene:addEventListener("weaponChangeEvent", weaponChangeEventListener)
end

function Launchpad:rotate(isPortrait)
  stage.x = display.contentWidth/2
  stage.y = display.contentHeight - stage.height/2 - stagePadding
end

function Launchpad:destroy()
  -- scene:removeEventListener("weaponChangeEvent", weaponChangeEventListener)
end