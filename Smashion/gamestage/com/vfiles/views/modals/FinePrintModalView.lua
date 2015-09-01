local scene = require("composer").newScene()
local widget = require( "widget" )
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"
local _W, _H, localData = display.contentWidth, display.contentHeight, {}
local sceneGroup, stage, bg, titleLb, landScapeGroup, portraitGroup, closeBtn
local textPadding = 12

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function rotateScreenTo(isPortrait)
  _W, _H = display.contentWidth, display.contentHeight
  stage.width, stage.height = _W, _H
  bg.width, bg.height = _W, _H

  titleLb:moveTo(_W/2, 40)
  closeBtn:moveTo(_W - closeBtn.width - 12, 12)

  if isPortrait then
    landScapeGroup.isVisible = false
    portraitGroup.isVisible = true
  else
    landScapeGroup.isVisible = true
    portraitGroup.isVisible = false
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
      localData = localData
    }
    composer.showOverlay( "com.vfiles.views.modals.FinePrintModalView", {
      isModal = true,
      type = e.target.name,
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

  local _title, _content_filename
  if localData.type == "privacy" then
    _title = "PRIVACY POLICY"
    _content_filename = "privacy.txt"
  else
    _title = "TERMS OF USE"
    _content_filename = "terms.txt"
  end 
  
  titleLb = display.newBitmapText(stage, _title, 0, 0, "champion-80", 50)
  

  --------------------
  -- Content (Scroll)
  --------------------
  -- Creat two groups
  landScapeGroup = display.newGroup()
  portraitGroup = display.newGroup()
  stage:insert(landScapeGroup)
  stage:insert(portraitGroup)
  landScapeGroup.x, landScapeGroup.y = 20, 80
  portraitGroup.x, portraitGroup.y = 20, 80

  -- Load content text file from local storage
  local file = io.open( system.pathForFile( _content_filename, system.ResourceDirectory ), "r" )
  local content_text = file:read( "*a" )

  _height = 320
  if deviceInfo.screenScale == "letterbox" then
    _width = 480
  else 
    _width = 568
  end

  -- Scrollview for landScapeGroup
  local LSW = widget.newScrollView {
    top = 0,
    left = 0,
    width = _width - 40,
    height = _height - 100,
    hideBackground = true,
    horizontalScrollDisabled = true
  }
  landScapeGroup:insert(LSW)

  local LTB = display.newText({
    text = content_text, 
    x = textPadding, 
    y = textPadding, 
    width=LSW.width-(textPadding*2), 
    height =0, 
    font = native.systemFont, 
    fontSize = 8
  })
  LTB.anchorX, LTB.anchorY = 0, 0
  LSW:insert(LTB)


  -- Scrollview for portraitGroup
  local PSW = widget.newScrollView {
    top = 0,
    left = 0,
    width = _height - 40,
    height = _width - 100,
    hideBackground = true,
    horizontalScrollDisabled = true
  }
  portraitGroup:insert(PSW)

  local PTB = display.newText({
    text = content_text, 
    x = textPadding, 
    y = textPadding, 
    width=PSW.width-(textPadding*2), 
    height =0, 
    font = native.systemFont, 
    fontSize = 8
  })
  PTB.anchorX, PTB.anchorY = 0, 0
  PSW:insert(PTB)  





  --------------------
  -- Buttons
  --------------------
  closeBtn = SimpleButton:new({
    parent = stage,
    icon = {path = "assets/images/ui/global/ico-x.png", width = 16, height = 16},
    left = 0,
    top = 0,
    width = 42,
    height = 42,    
    color = {default= {1,1,1,0}},
    fontColor = {default= {1,1,0}, over = {1,1,1}},
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
  bg:removeSelf()
  closeBtn:destroy()


  bg= nil
  titleLb = nil

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