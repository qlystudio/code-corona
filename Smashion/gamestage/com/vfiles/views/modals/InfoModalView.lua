local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"
local _W, _H, localData = display.contentWidth, display.contentHeight, {}
local sceneGroup, stage, bg, titleLb, instructionBtn, policyBtn, termsBtn, closeBtn

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function rotateScreenTo(isPortrait)
  _W, _H = display.contentWidth, display.contentHeight
  stage.width, stage.height = _W, _H
  bg.width, bg.height = _W, _H

  titleLb:moveTo(_W/2, 40)
  closeBtn:moveTo(_W/2 - closeBtn.width/2, _H - closeBtn.height - 20)

  if isPortrait then
    instructionBtn:moveTo(_W/2 - instructionBtn.width/2, _H/2 - instructionBtn.height/2 - 100)
    policyBtn:moveTo(_W/2 - policyBtn.width/2, _H/2 - policyBtn.height/2)
    termsBtn:moveTo(_W/2 - termsBtn.width/2, _H/2 - termsBtn.height/2 + 100)
  else
    instructionBtn:moveTo(20, _H/2 - instructionBtn.height/2)
    policyBtn:moveTo(_W/2 - policyBtn.width/2, _H/2 - policyBtn.height/2)
    termsBtn:moveTo(_W - termsBtn.width - 20, _H/2 - termsBtn.height/2)
  end

end

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
  if event.type == "faceUp" or event.type == "faceDown" then return false end  
  rotateScreenTo(string.find(event.type, "portrait") == 1)
end

local function instructionBtnTapEvent(e)
  -- Show instruction modal window
  local paramData = {
    screenName = "com.vfiles.views.modals.InfoModalView",
    localData = localData
  }
  composer.showOverlay( "com.vfiles.views.modals.InstructionModalView", {
    isModal=true,
    params = paramData
  })
  return true
end

local function finePrintBtnTapEvent(e)
  local paramData = {
    screenName = "com.vfiles.views.modals.InfoModalView",
    localData = localData,
    type = e.target.name
  }
  composer.showOverlay( "com.vfiles.views.modals.FinePrintModalView", {
    isModal = true,
    params = paramData
  })
  return true
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
  bg = display.newRect(stage, 0, 0, _W, _H)
  bg:setFillColor(.094,.094,.094, .9)
  bg.anchorX, bg.anchorY, bg.x, bg.y = 0, 0, 0, 0
 
  titleLb = display.newBitmapText(stage, "INFORMATION", 0, 0, "champion-80", 50)
  

  --------------------
  -- Buttons
  --------------------
  instructionBtn = SimpleButton:new({
    parent = stage,
    label = "INSTRUCTIONS",
    left = 0,
    top = 0,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = instructionBtnTapEvent
  })

  policyBtn = SimpleButton:new({
    parent = stage,
    label = "PRIVACY POLICY",
    name = "privacy",
    left = 0,
    top = 0,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = finePrintBtnTapEvent
  })

  termsBtn = SimpleButton:new({
    parent = stage,
    label = "TERMS OF USE",
    name = "terms",
    left = 0,
    top = 0,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = finePrintBtnTapEvent
  })    

  closeBtn = SimpleButton:new({
    parent = stage,
    label = "CLOSE",
    left = 0,
    top = 0,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,01}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = closeBtnTapEvent
  })


  rotateScreenTo(_W < _H)

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
  print("Destroy Information Modal view")
  
  titleLb:removeSelf()
  titleLb = nil
  instructionBtn:destroy()
  policyBtn:destroy()
  termsBtn:destroy()
  closeBtn:destroy()
  
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