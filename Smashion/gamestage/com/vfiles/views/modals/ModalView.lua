require "com.vfiles.core.Class"
local scene = require("composer").newScene()

local sceneGroup, stage, smokeGlass, bg
local startBtn, helpBtn, exitBtn, fbBtn
local _W, _H, bgPadding = display.contentWidth, display.contentHeight, 20

local Modal = Class()

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
  local isPortrait = (string.find(event.type, "portrait") == 1)
  _W, _H = display.contentWidth, display.contentHeight
  smokeGlass.width, smokeGlass.height = _W, _H
  stage.width, stage.height = _W, _H
  bg.width, bg.height = _W - bgPadding, _H - bgPadding

end

local function startBtnEvtListener(e)
  -- print("START")
  composer.gotoScene( "com.vfiles.scenes.LoadingGame", { effect="fade", time=100, params = {gameLevel = 2} })
end

local function exitBtnEvtListener(e)
  print("EXIT")
  composer.hideOverlay( "fade", 400 )
end

local function helpBtnEvtListener(e)
  print("HELP")
end

function Modal.fbBtnEvtListener(e)
  print("FB")
end


--------------------------------------------------
-- Private workers
--------------------------------------------------
local function newBtn(lb, x, y, event)
  local buttonSheet = graphics.newImageSheet( "assets/images/ui/dummy-button-sheet.png", { width=48, height=48, numFrames=2, sheetContentWidth = 48, sheetContentHeight =96 } )

  -- Create the widget
  local button = widget.newButton
  {
    left = x,
    top = y,
    sheet = buttonSheet,
    defaultFrame = 1,
    overFrame = 2,
    label = lb,
    onRelease = event
  }
  stage:insert(button)
  return button
end

--------------------------------------------------
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
local function build(self)
  sceneGroup = self.view

  -- Add smokeGlass to parentView
  smokeGlass = display.newRect(sceneGroup, 0, 0, _W, _H )
  smokeGlass:setFillColor( 0,0,0,.5 )
  smokeGlass.anchorX, smokeGlass.anchorY = 0, 0

  -- Build graphic container named stage. This is a parent of all asset on screen.
  stage = display.newContainer(sceneGroup, _W, _H)
  stage.anchorChildren, stage.anchorX, stage.anchorY = false, 0, 0
  stage.y = -_H
  
  bg = display.newRect(stage, 0, 0, _W - bgPadding, _H - bgPadding )
  bg:setFillColor( 1, .949, 0 ) -- #fff200
  bg.anchorX, bg.anchorY, bg.x, bg.y = 0, 0, bgPadding/2, bgPadding/2


  timerLabel = display.newBitmapText(stage, "{green}THIS IS\nSTEELFISH {blue}FONT\nWITH multi Tinted {red}color",0 ,0 ,"steel_fish",40)
  timerLabel:moveTo(timerLabel.width/2,timerLabel.height/2)
  -- timerLabel:setTintColor(0,0,1)

  --
  exitBtn = newBtn("EXIT", 20, 240, exitBtnEvtListener)
  startBtn = newBtn("HELP!", 100, 240, helpBtnEvtListener)
  startBtn = newBtn("START", 200, 240, startBtnEvtListener)
  startBtn = newBtn("FB", 300, 240, Modal.fbBtnEvtListener)
  
end

--------------------------------------------------
-- Scene listeners
--------------------------------------------------

function Modal:initialize()
  print("initialize")
end

function Modal:test()
  print("Modal test")
end

function Modal:scene()
  return scene
end

function scene:create( event )
  build(self)
  print("build complete")
end

function scene:show( event )
  if event.phase == "did" then
    transition.to( stage, {y=0, delay=0, time=1000, transition=easing.outBack} )
  end
end

function scene:hide( event )
end

function scene:destroy( event )
  print("Destroy Level preview Modal view")
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
-- return scene
return Modal