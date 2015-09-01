local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"
local SlideController = require "com.vfiles.controllers.SlideController"

local SimpleSlide = require "com.vfiles.objects.slides.SimpleSlide"
local InstructionSlide4 = require "com.vfiles.objects.slides.InstructionSlide4"
local InstructionSlide5 = require "com.vfiles.objects.slides.InstructionSlide5"
local InstructionSlide7 = require "com.vfiles.objects.slides.InstructionSlide7"

local _W, _H, bgPadding, localData = display.contentWidth, display.contentHeight, 0, {}
local sceneGroup, stage, bg, frame, closeBtn
local slider

--------------------------------------------------
-- Private workers
--------------------------------------------------

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
  if event.type == "faceUp" or event.type == "faceDown" then 
    return false 
  end

  local isPortrait = (string.find(event.type, "portrait") == 1)  
  _W, _H = display.contentWidth, display.contentHeight
  stage.width, stage.height = _W, _H
  bg.width, bg.height = _W - bgPadding, _H - bgPadding
  slider:moveTo(_W/2-157, _H/2-157)
  frame.x, frame.y = _W/2-157, _H/2-157
  closeBtn:moveTo(_W/2+157-42, _H/2-157)
end

local function closeBtnTapEvent(e)
  -- Check of localData has assigned screenNam and load scene if true 
  if localData ~= nil then
    composer.showOverlay( localData.screenName, {
      isModal = true,
      params = localData.localData
    })
  else
    composer.hideOverlay("fade", 250)
  end
end

--------------------------------------------------
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
local function build(self)
  
  sceneGroup = self.view

  -- Build graphic container named stage. This is a parent of all asset on screen.
  stage = display.newContainer(sceneGroup, _W, _H)
  stage.anchorChildren, stage.anchorX, stage.anchorY = false, 0, 0

  -- Background
  bg = display.newRect(stage, 0, 0, _W - bgPadding, _H - bgPadding )
  bg:setFillColor(.094,.094,.094, .9)
  bg.anchorX, bg.anchorY, bg.x, bg.y = 0, 0, bgPadding/2, bgPadding/2

  -- Add slides
  
  local slides = {
    SimpleSlide:new({ filename = "instruction1.jpg", width = 315, height = 315 }),
    SimpleSlide:new({ filename = "instruction2.jpg", width = 315, height = 315 }),
    SimpleSlide:new({ filename = "instruction3.jpg", width = 315, height = 315 }),
    InstructionSlide4:new({ filename = "instruction4.jpg", width = 315, height = 315 }),
    InstructionSlide5:new({ filename = "instruction5.jpg", width = 315, height = 315 }),
    SimpleSlide:new({ filename = "instruction6.jpg", width = 315, height = 315 }),
    InstructionSlide7:new({ filename = "instruction7.jpg", width = 315, height = 315 })
  }

  slider = SlideController:new({
    parent = stage,
    screenW = 315,
    screenH = 315,
    viewableScreenW = 315,
    viewableScreenH = 315,
    padding = 20,
    pagination = true,
    bgColor = {0,0,0},
    imageSet = slides,
  })
  slider:moveTo(_W/2-157, _H/2-157)

  -- Add frame
  frame = display.newRect(stage, 2, 2, 314, 314 )
  frame.anchorX, frame.anchorY = 0, 0
  frame.strokeWidth = 4
  frame:setFillColor(0,0,0,0)
  frame:setStrokeColor(1,1,0)
  frame.x, frame.y = _W/2-157, _H/2-157

  -- BACK BUTTON
  closeBtn = SimpleButton:new({
    parent = stage,
    icon = {path = "assets/images/ui/global/ico-x.png", width = 16, height = 16},
    left = 0,
    top = 0,
    width = 42,
    height = 42,    
    color = {default= {1,1,1,0}},
    fontColor = {default= {1,1,1}, over = {1,1,0}},
    onEvent = closeBtnTapEvent
  })
  closeBtn:moveTo(_W/2+157-42, _H/2-157)

end

--------------------------------------------------
-- Scene listeners
--------------------------------------------------
function scene:create( event )
  localData = event.params
  build(self)
end

function scene:show( event )
  if event.phase == "did" then
  end
end

function scene:hide( event )
end

function scene:destroy( event )
  print("Destroy Level Instruction Modal view")
  slider:destroy()
  closeBtn:destroy()
  frame:removeSelf()
  bg:removeSelf()
  bg = nil
  bg= nil

  scene:removeEventListener("create", scene)
  scene:removeEventListener("show", scene)
  scene:removeEventListener("hide", scene)
  scene:removeEventListener("destroy", scene)
  Runtime:removeEventListener("orientation", onOrientationChange)

  self = nil
end

-- scene events
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
Runtime:addEventListener("orientation", onOrientationChange)
return scene