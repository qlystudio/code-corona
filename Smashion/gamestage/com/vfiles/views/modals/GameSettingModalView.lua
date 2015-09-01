local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"

local sceneGroup, stage, bg, header, body, footer
local bgmOnBtn, bgmOffBtn, sfxOnBtn, sfxOffBtn, infoBtn, resetBtn, backBtn, restartBtn, quitBtn, lbg
local _W, _H, localData = display.contentWidth, display.contentHeight, {}

--------------------------------------------------
-- Private workers
--------------------------------------------------

local function rotateScreenTo(isPortrait)
  _W, _H = display.contentWidth, display.contentHeight
  stage.width, stage.height = _W, _H
  bg.width, bg.height = _W, _H

  -- Layer does not get effect on ratio but need repostion by type
  if localData.type == 1 then
    header[1].x = _W/2
  elseif localData.type == 2 then
    header[1].width = _W/2
    header[2].x = _W/4*3 - 30
    header[3].x = _W/4
    header[4].x = _W/4*3
  end

  -- Layer changes by ratio
  if isPortrait then
    bgmOffBtn:moveTo(120, 30)
    sfxOffBtn:moveTo(120, 30)
    resetBtn:moveTo(-15, 50)
    backBtn:moveTo(120, 50)    

    -- Type 1
    if localData.type == 1 then    
    elseif localData.type == 2 then
      restartBtn:moveTo(-15, 100)
      quitBtn:moveTo(120, 100)
    end
  
  else
    bgmOffBtn:moveTo(260, -18)
    sfxOffBtn:moveTo(260, -18)
    resetBtn:moveTo(260, 0)
    

    -- Type 2
    if localData.type == 1 then    
      backBtn:moveTo(260, 50)
    elseif localData.type == 2 then
      backBtn:moveTo(-15, 50)
      restartBtn:moveTo(122, 50)
      quitBtn:moveTo(260, 50)
    end

  end

  -- Layer does not get effect from any value
  body[2].y = body[1].height + 25
  body.x = _W/2 - body.width/2 + 15
  body.y = _H/2 - body.height/2 - 15
  footer.x = _W/2 - footer.width/2 + 15
  footer.y = _H - footer.height - 20
end

local function audioBtnTapEvent(e)
  local nm = e.target.name
  if nm == "bgmOn" then
    bgmOnBtn:setEnabled(false, {1,1,0})
    bgmOffBtn:setEnabled(true)
    gameData:set("bgm", true)

    if localData.type == 2 then
      bgm(true)
    end

  elseif nm == "bgmOff" then
    bgmOnBtn:setEnabled(true)
    bgmOffBtn:setEnabled(false, {1,1,0})
    gameData:set("bgm", false)

    if localData.type == 2 then
      bgm(false)
    end

  elseif nm == "sfxOn" then
    sfxOnBtn:setEnabled(false, {1,1,0})
    sfxOffBtn:setEnabled(true)
    gameData:set("sfx", true)
  elseif nm == "sfxOff" then
    sfxOnBtn:setEnabled(true)
    sfxOffBtn:setEnabled(false, {1,1,0})
    gameData:set("sfx", false)
  end
end

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
  if event.type == "faceUp" or event.type == "faceDown" then return false end  
  rotateScreenTo(string.find(event.type, "portrait") == 1)
end

local function infoBtnTapEvent(e)
  local paramData = {
    screenName = "com.vfiles.views.modals.GameSettingModalView",
    localData = localData
  }
  composer.showOverlay( "com.vfiles.views.modals.InfoModalView", {
    isModal=true,
    params = paramData
  })
  return true
end

local function resetBtnTapEvent(e)

  function onComplete( e )
    if "clicked" == e.action and e.index == 1 then
      gameData:reset()
      composer.gotoScene( "com.vfiles.views.HomeView", {time =500, effect="fade"})
    end
  end

  native.showAlert( "Smashion", "This will erase all of your current high score and levels. Are you sure that you want to permanently delete score?", { "YES", "CANCEL" }, onComplete )

  return true
end

local function backBtnTapEvent(e)
  composer.hideOverlay("fade", 250)
  if localData.type == 2 then  
    gameResume()
  end
  return true
end

----------------------------------------
-- Type 2 mode only events
local function restartBtnTapEvent(e)
  print("restartBtn")
  composer.gotoScene( "com.vfiles.views.LoadingGameView", {
    params = {
      sceneName = "com.vfiles.views.GameView",
      param = {
        city = localData.city,
        gameLevel = localData.gameLevel
      }
    } 
  })  
  return true
end

local function quitBtnTapEvent(e)
  print("quitBtnTapEvent")
  composer.gotoScene( "com.vfiles.views.LoadingGameView", {
    params = { 
      sceneName = "com.vfiles.views.CityMapView",
      param = {
        city = localData.city
      }
    } 
  })
  return true
end

local function tabTapEvent(e)
  composer.showOverlay( "com.vfiles.views.modals.GamePausedModalView", { 
    isModal = true,
    params = { 
     type = 2,
     city = localData.city,
     gameLevel = localData.gameLevel,
   }
  })
  return true
end
----------------------------------------

--------------------------------------------------
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
local function build(self)
  --[[ 
  Note: 
    Setting modal has type type of layout (localData.type {int})
    1: Sole window (in world/city map)
    2: Tab page (in puased screen)
  ]]

  sceneGroup = self.view

  -- Build graphic container named stage. This is a parent of all asset on screen.
  stage = display.newContainer(sceneGroup, _W, _H)
  stage.anchorChildren, stage.anchorX, stage.anchorY = false, 0, 0

  bg = display.newRect(stage, 0, 0, _W, _H )
  bg:setFillColor(.09, .09, .09, .95)
  bg.anchorX, bg.anchorY, bg.x, bg.y = 0, 0, 0, 0

  -- Build header, body, footer (group)
  header = display.newGroup()
  body = display.newGroup()
  footer = display.newGroup()
  stage:insert(header)
  stage:insert(body)
  stage:insert(footer)

  -- Header
  if localData.type == 1 then
    display.newBitmapText(header, "SETTING", _W/2, 36, "champion-80", 52)
  elseif localData.type == 2 then
    lbg = display.newRect(header, 0, 0, _W/2, 50 ) -- gray tab bg
    local lul = display.newLine( header, _W/4*3 - 30, 44, _W/4*3 + 30, 44 ) -- underline
    lbg.anchorX, lbg.anchorY = 0, 0
    lbg:setFillColor( .3,.3,.3 )
    lul.strokeWidth = 2
    lul:setStrokeColor( 1,1,0 )
    display.newBitmapText(header, "PAUSED", _W/4, 26, "champion-40", 36)
    display.newBitmapText(header, "{yellow}SETTING", _W/4*3, 26, "champion-40", 36)
    lbg:addEventListener( "tap", tabTapEvent )
  end

  -- Body (contain two groups)
  local bgmGrp = display.newGroup()
  local sfxGrp = display.newGroup()
  body:insert(bgmGrp)
  body:insert(sfxGrp)

  display.newImageRect(bgmGrp, "assets/images/ui/global/ico-volume.png", 28, 19)
  display.newBitmapText(bgmGrp, "MUSIC", 50, 0, "champion-40", 36)
  bgmOnBtn = SimpleButton:new({
    parent = bgmGrp,
    label = "ON",
    name = "bgmOn",
    left = 120,
    top = -18,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {.5,.5,.5}, over = {1,1,0}},
    fontColor = {default= {0,0,0}, over = {0,0,0}},
    onEvent = audioBtnTapEvent,
  })

  bgmOffBtn = SimpleButton:new({
    parent = bgmGrp,
    label = "OFF",
    name = "bgmOff",
    left = 260,
    top = -18,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {.5,.5,.5}, over = {1,1,0}},
    fontColor = {default= {0,0,0}, over = {0,0,0}},
    onEvent = audioBtnTapEvent
  })  
  if gameData:get("bgm") then
    bgmOnBtn:setEnabled(false, {1,1,0})
    bgmOffBtn:setEnabled(true)
  else
    bgmOnBtn:setEnabled(true)
    bgmOffBtn:setEnabled(false, {1,1,0})
  end

  display.newImageRect(sfxGrp, "assets/images/ui/global/ico-volume.png", 28, 19)
  display.newBitmapText(sfxGrp, "EFFECTS", 55, 0, "champion-40", 36)  
  sfxOnBtn = SimpleButton:new({
    parent = sfxGrp,
    label = "ON",
    name = "sfxOn",
    left = 120,
    top = -18,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {.5,.5,.5}, over = {1,1,0}},
    fontColor = {default= {0,0,0}, over = {0,0,0}},
    onEvent = audioBtnTapEvent
  })
  sfxOffBtn = SimpleButton:new({
    parent = sfxGrp,
    label = "OFF",
    name = "sfxOff",
    left = 260,
    top = -18,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {.5,.5,.5}, over = {1,1,0}},
    fontColor = {default= {0,0,0}, over = {0,0,0}},
    onEvent = audioBtnTapEvent,
  })  
  if gameData:get("sfx") then
    sfxOnBtn:setEnabled(false, {1,1,0})
    sfxOffBtn:setEnabled(true)
  else
    sfxOnBtn:setEnabled(true)
    sfxOffBtn:setEnabled(false, {1,1,0})
  end

  -- Footer (group)
  infoBtn = SimpleButton:new({
    parent = footer,
    icon = {path = "assets/images/ui/global/ico-info.png", width = 10, height = 23},
    left = -14,
    top = 0,
    width = 38,
    height = 35,    
    color = {default= {1,1,1}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = infoBtnTapEvent
  })

  resetBtn = SimpleButton:new({
    parent = footer,
    label = "RESET SCORE",
    left = 0,
    top = 0,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,1}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = resetBtnTapEvent
  })

  backBtn = SimpleButton:new({
    parent = footer,
    label = localData.type == 1 and "BACK" or "BACK TO GAME",
    left = 0,
    top = 0,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = backBtnTapEvent
  })  


  if localData.type == 2 then
  restartBtn = SimpleButton:new({
    parent = footer,
    label = "RESTART",
    left = 0,
    top = 0,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = restartBtnTapEvent
  })

  quitBtn = SimpleButton:new({
    parent = footer,
    label = "QUIT",
    left = 0,
    top = 0,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = quitBtnTapEvent
  })
  end
   
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
  print("Destroy GameSetting Modal view")

  for i=1, header.numChildren do
    header[1]:removeSelf()
    header[1] = nil
  end

  bgmOnBtn:destroy()
  bgmOffBtn:destroy()
  sfxOnBtn:destroy()
  sfxOffBtn:destroy()
  infoBtn:destroy()
  resetBtn:destroy()
  backBtn:destroy()

  if localData.type == 2 then
    restartBtn:destroy()
    quitBtn:destroy()
    lbg:removeEventListener( "tap", tabTapEvent )
  end

  header = nil
  body = nil
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