require "com.vfiles.controllers.LevelController"

local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"
local enemyPanelClass = require "com.vfiles.objects.panels.EnemyPanel"

local sceneGroup, stage, bg, header, scorePanel, enemyPanel
local backBtn, restartBtn, quitBtn, lbg
local _W, _H, localData = display.contentWidth, display.contentHeight, {}

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function rotateScreenTo(isPortrait)
  -- Layer does not get effect from any value
  _W, _H = display.contentWidth, display.contentHeight
  stage.width, stage.height = _W, _H
  bg.width, bg.height = _W, _H
  
  header[1].x = _W/2
  header[1].width = _W/2
  header[2].x = _W/4 - 30
  header[3].x = _W/4
  header[4].x = _W/4*3

  if isPortrait then
    scorePanel.x, scorePanel.y = _W/2 - scorePanel.width/2, 55
    enemyPanel.x, enemyPanel.y = _W/2 - enemyPanel.width/2, scorePanel.height + 65
    backBtn:moveTo(_W/2- backBtn.width/2, 425)
    restartBtn:moveTo(enemyPanel.x, 376)
    quitBtn:moveTo(enemyPanel.x + (enemyPanel.width-quitBtn.width), 376)
  else
    scorePanel.x, scorePanel.y = _W/2 - scorePanel.width/2 - 150, 70
    enemyPanel.x, enemyPanel.y = _W - enemyPanel.width-15, 60
    backBtn:moveTo(scorePanel.x + (scorePanel.width-backBtn.width)/2, 200)
    restartBtn:moveTo(enemyPanel.x, 270)
    quitBtn:moveTo(enemyPanel.x + (enemyPanel.width-quitBtn.width), 270)
  end

end

local function buildScoreInfoPanel()
  scorePanel = display.newContainer(stage, 150, 100 )
  scorePanel.anchorChildren, scorePanel.anchorX, scorePanel.anchorY = false, 0, 0

  -- local temp = display.newRect(scorePanel, 0, 0, 150, 150 )
  -- temp.anchorX, temp.anchorY = 0,0
  -- temp:setFillColor( 1,1,0,.2 )

  local pausedLb = display.newBitmapText(scorePanel, "PAUSED", 0, 0, "champion-80", 70)
  local levelLb1 = display.newBitmapText(scorePanel, "LEVEL", 0, 0, "champion-40", 36)
  local levelLb2 = display.newBitmapText(scorePanel, tostring(localData.gameLevel), 0, 0, "champion-40-num-hollow-ol", 28)
 
  pausedLb:moveTo(scorePanel.width/2, 30)
  levelLb1:moveTo(scorePanel.width/2 - levelLb2.width/2, 80)
  levelLb2:moveTo(levelLb1.x + levelLb1.width/2 + levelLb2.width, 80)
end


--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
  if event.type == "faceUp" or event.type == "faceDown" then return false end  
  rotateScreenTo(string.find(event.type, "portrait") == 1)
end

local function backBtnTapEvent(e)
  composer.hideOverlay("fade", 250)
  gameResume()
  return true
end

local function restartBtnTapEvent(e)
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
  composer.showOverlay( "com.vfiles.views.modals.GameSettingModalView", { 
    isModal = true,
    params = { 
     type = 2,
     city = localData.city,
     gameLevel = localData.gameLevel,
   }
  })
  
  return true
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
  lbg = display.newRect(header, _W/2, 0, _W/2, 50 ) -- gray tab bg
  local lul = display.newLine( header, _W/4 - 30, 44, _W/4 + 30, 44 ) -- underline
  lbg.anchorX, lbg.anchorY = 0, 0
  lbg:setFillColor( .3,.3,.3 )
  lul.strokeWidth = 2
  lul:setStrokeColor( 1,1,0 )
  display.newBitmapText(header, "{yellow}PAUSED", _W/4, 26, "champion-40", 36)
  display.newBitmapText(header, "SETTING", _W/4*3, 26, "champion-40", 36)
  lbg:addEventListener( "tap", tabTapEvent )


  -- Load level detail
  local levelController = LevelController:new()


  -- Build scoreInfo panel (Wrong, this only contains big PAUSED text and current level. Whole code was duped from LevelPreviewModal window because I have NO TIME.)
  buildScoreInfoPanel()

  -- Build enemy panel
  enemyPanel = display.newGroup()
  stage:insert(enemyPanel)
  enemyPanelClass:new({
    parent = enemyPanel, 
    localData = levelController:getStageInfo(localData.city, localData.gameLevel)
  })

  --------------------
  -- Buttons
  --------------------

  backBtn = SimpleButton:new({
    parent = footer,
    label = "BACK TO GAME",
    left = 0,
    top = 0,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,1}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = backBtnTapEvent
  })

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
    -- transition.to( stage, {y=0, delay=0, time=400, transition=easing.outQuad} )
  end
end

function scene:hide( event )
end

function scene:destroy( event )
  print("Destroy GamePaused Modal view")

  for i=1, header.numChildren do
    header[1]:removeSelf()
    header[1] = nil
  end
  header = nil

 for i=1, scorePanel.numChildren do
    scorePanel[1]:removeSelf()
    scorePanel[1] = nil
  end
  scorePanel = nil

  enemyPanelClass:destroy()
  backBtn:destroy()
  restartBtn:destroy()
  quitBtn:destroy()

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