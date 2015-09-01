local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"

local sceneGroup, stage, bg, header, body, footer
local replayBtn, quitBtn
local _W, _H, bgPadding, localData = display.contentWidth, display.contentHeight, 0, {}
local audioGameFail = audio.loadSound( "assets/audios/game-fail.wav" )

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
  if event.type == "faceUp" or event.type == "faceDown" then return false end  
  local isPortrait = (string.find(event.type, "portrait") == 1)
  _W, _H = display.contentWidth, display.contentHeight
  stage.width, stage.height = _W, _H
  bg.width, bg.height = _W - bgPadding, _H - bgPadding
  header.x, header.y = _W/2, (_H - 320)/4
  body.x, body.y = _W/2, _H/2
  footer.x, footer.y = _W/2, _H - (_H - 320)/4 - footer.height - 20
end

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function replayBtnTapEvent(e)
  composer.gotoScene( "com.vfiles.views.LoadingGameView", {
    params = {
      sceneName = "com.vfiles.views.GameView",
      param = {
        city = localData.city,
        gameLevel = localData.gameLevel
      }
    } 
  })
end

local function quitBtnTapEvent(e)
    composer.gotoScene( "com.vfiles.views.LoadingGameView", {
    params = { 
      sceneName = "com.vfiles.views.CityMapView",
      param = {
        city = localData.city
      }
    } 
  })
end

--------------------------------------------------
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
local function build(self)
  print("========================================")
  print("Code: ", localData.code)
  print("City: ", localData.city)
  print("Level: ", localData.gameLevel)
  print("Score: ", localData.result.score)
  print("Achievement: ", localData.result.achievement)
  print("========================================")

  sceneGroup = self.view

  -- Build graphic container named stage. This is a parent of all asset on screen.
  stage = display.newContainer(sceneGroup, _W, _H)
  stage.anchorChildren, stage.anchorX, stage.anchorY = false, 0, 0

  bg = display.newRect(stage, 0, 0, _W - bgPadding, _H - bgPadding )
  bg:setFillColor(.09, .09, .09, .9)
  bg.anchorX, bg.anchorY, bg.x, bg.y = 0, 0, bgPadding/2, bgPadding/2


  -- Build header (group)
  header = display.newGroup()
  stage:insert(header)
  header.x, header.y = _W/2, (_H - 320)/4

  local headerLb1 = display.newBitmapText(header, "LEVEL", 0, 20, "champion-40", 36)
  local headerLb2 = display.newBitmapText(header, tostring(localData.gameLevel), 0, 20, "champion-40-num-hollow-ol", 28)
  local headerLb3 = display.newBitmapText(header, "YOU FAILED!", 0, 70, "champion-80-dek", 80)
  headerLb1:moveTo(-(headerLb2.width + 5)/2, 20)
  headerLb2:moveTo(headerLb1.x + headerLb1.width/2 + headerLb2.width/2 + 5, 20)

  -- Build body (img)
  --[[
    code: 1 - Time over
    code: 2 - Out of ammo
  ]]  
  body = display.newImageRect( stage, "assets/images/ui/gameview/" .. (localData.code == 1 and "gamefail-stopwatch" or "gamefail-allweapons") .. ".png", 200, 200 )
  body.x, body.y = _W/2, _H/2

  -- Build Footer (group)
  footer = display.newGroup()
  stage:insert(footer)
  local footerLb = display.newBitmapText(footer, "{YELLOW}OH NO, YOU RAN OUT OF " .. (localData.code == 1 and "TIME" or "AMMO") .. "!", 0, 20, "champion-40-dek", 42)
    
  replayBtn = SimpleButton:new({
    parent = footer,
    label = "REPLAY",
    left = -135,
    top = 53,
    width = 130,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = replayBtnTapEvent
  })

  quitBtn = SimpleButton:new({
    parent = footer,
    label = "QUIT",
    left = 5,
    top = 53,
    width = 130,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,1}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = quitBtnTapEvent
  })

  footer.x, footer.y = _W/2, _H - (_H - 320)/4 - footer.height - 20
  
  audio.play(audioGameFail)

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
    -- transition.to( stage, {y=0, delay=0, time=400, transition=easing.outQuad} )
  end
end

function scene:hide( event )
end

function scene:destroy( event )
  print("Destroy GameFailed Modal view")

  audio.dispose( audioGameFail )
  audioGameFail = nil

  for i=1, header.numChildren do
    header[1]:removeSelf()
    header[1] = nil
  end
  header = nil

  body:removeSelf()
  body = nil

  footer[1]:removeSelf()
  footer[1] = nil
  replayBtn:destroy()
  quitBtn:destroy()
  footer = nil

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