local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"
local enemyPanelClass = require "com.vfiles.objects.panels.EnemyPanel"

local sceneGroup, stage, bg, scorePanel, enemyPanel--, enemiesPanel, enemiesPanelTable
local startBtn, infoBtn, backBtn
local starSheet
local _W, _H, bgPadding, localData = display.contentWidth, display.contentHeight, 0, {}

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function rotateScreenTo(isPortrait)
  if isPortrait then
    scorePanel.x, scorePanel.y = _W/2 - scorePanel.width/2, 10
    infoBtn:moveTo(_W - infoBtn.width-15, 15)
    enemyPanel.x, enemyPanel.y = _W/2 - enemyPanel.width/2, scorePanel.height + 20
    startBtn:moveTo(_W/2 - startBtn.width/2, enemyPanel.y + enemyPanel.height + 20)
  else
    scorePanel.x, scorePanel.y = _W/2 - scorePanel.width/2 - 150, 70
    infoBtn:moveTo(15, _H - infoBtn.height-15)
    startBtn:moveTo(_W - startBtn.width-15, _H -startBtn.height-30)
    enemyPanel.x, enemyPanel.y = _W - enemyPanel.width-15, 20
  end
end

local function buildScoreInfoPanel()
  -- scorePanel is container
  scorePanel = display.newContainer(stage, 150, 150 )
  scorePanel.anchorChildren, scorePanel.anchorX, scorePanel.anchorY = false, 0, 0

  -- local temp = display.newRect(scorePanel, 0, 0, 150, 150 )
  -- temp.anchorX, temp.anchorY = 0,0
  -- temp:setFillColor( 1,1,0,.2 )

  local levelLb1 = display.newBitmapText(scorePanel, "LEVEL", 0, 0, "champion-40", 36)
  local levelLb2 = display.newBitmapText(scorePanel, tostring(localData.level), 0, 0, "champion-40-num-hollow-ol", 28)
  levelLb1:moveTo(scorePanel.width/2 - levelLb2.width/2, 20)
  levelLb2:moveTo(levelLb1.x + levelLb1.width/2 + levelLb2.width, 20)

  local targetLb = display.newBitmapText(scorePanel, "TARGET: " .. comma_value(localData.targetScore), 0, 0, "champion-40", 40)
  targetLb:moveTo(scorePanel.width/2, 85)

  local bestOutline = display.newRect(scorePanel, scorePanel.width/2, 125, 120, 32 )
  bestOutline.strokeWidth = 2
  bestOutline:setFillColor(0,0,0,0)
  bestOutline:setStrokeColor(1,1,0)

  starSheet = graphics.newImageSheet( "assets/images/ui/global/ico-bigStarSheet.png", {width = 92, height = 20, numFrames = 4, sheetContentWidth = 92, sheetContentHeight = 80})
  local stars = display.newSprite( scorePanel, starSheet, {start=1, count=4})
  stars.x, stars.y = scorePanel.width/2, 48 
  stars:setFrame(localData.achievement+1)

  local bestLb = display.newBitmapText(scorePanel, "YOUR BEST: " .. comma_value(localData.bestScore), 0, 0, "champion-40", 24)
  bestLb:moveTo(scorePanel.width/2, 125)
  bestLb:setTintColor(1,1,0)
end

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
  rotateScreenTo(isPortrait)
  
end

local function backBtnTapEvent(e)
  composer.hideOverlay("slideLeft", 650)
end

local function infoBtnTapEvent(e)
    -- Show instruction modal window
    local paramData = {
      screenName = "com.vfiles.views.modals.LevelPreviewModalView",
      localData = localData
    }
    composer.showOverlay( "com.vfiles.views.modals.InstructionModalView", {
      isModal=true,
      params = paramData
    })
end

local function startBtnTapEvent(e)
  composer.gotoScene( "com.vfiles.views.LoadingGameView", { 
    params = {
      sceneName = "com.vfiles.views.GameView",
      param = {
        city = localData.city,
        gameLevel = localData.level
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
  print("--------------------")
  print("Level:", localData.level)
  print("Star:", localData.achievement)
  print("Target:", localData.targetScore)
  print("Best:", localData.bestScore)
  print("--------------------")

  sceneGroup = self.view

  -- Build graphic container named stage. This is a parent of all asset on screen.
  stage = display.newContainer(sceneGroup, _W, _H)
  stage.anchorChildren, stage.anchorX, stage.anchorY = false, 0, 0
  
  -- Background
  bg = display.newRect(stage, 0, 0, _W - bgPadding, _H - bgPadding )
  bg:setFillColor(.094,.094,.094, .9)
  bg.anchorX, bg.anchorY, bg.x, bg.y = 0, 0, bgPadding/2, bgPadding/2

  -- BACK BUTTON
  backBtn = SimpleButton:new({
    parent = stage,
    icon = {path = "assets/images/ui/global/ico-back-arrow.png", width = 15, height = 18},
    left = 15,
    top = 15,
    width = 38,
    height = 35,    
    color = {default= {1,1,1}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = backBtnTapEvent
  })
  
  -- INFO BUTTON
  infoBtn = SimpleButton:new({
    parent = stage,
    icon = {path = "assets/images/ui/global/ico-questionmark.png", width = 25, height = 25},
    left = 0,
    top = 0,
    width = 38,
    height = 35,    
    color = {default= {1,1,1}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = infoBtnTapEvent
  })

  -- START BUTTON
  startBtn = SimpleButton:new({
    parent = stage,
    label = "START SMASHION!",
    left = 0,
    top = 0,
    width = 200,
    height = 50,
    fontSize = 40,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = startBtnTapEvent
  })

  -- Build info panel
  
  buildScoreInfoPanel()

  -- Build enemy panel
  enemyPanel = display.newGroup()
  stage:insert(enemyPanel)
  enemyPanelClass:new({
    parent = enemyPanel, 
    localData = localData
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
    -- transition.to( stage, {x=0, delay=0, time=400, transition=easing.outQuad} )
  end
end

function scene:hide( event )
end

function scene:destroy( event )
  print("Destroy Level preview Modal view")

  startBtn:destroy()
  infoBtn:destroy()
  backBtn:destroy()

  for i=1, scorePanel.numChildren do
    scorePanel[1]:removeSelf()
    scorePanel[1] = nil
  end
  scorePanel:removeSelf()
  scorePanel = nil

  enemyPanelClass:destroy()

  -- for i=1, #enemiesPanelTable do
  --   enemiesPanelTable[i]:destroy()
  -- end
  -- enemiesPanelTable = nil
  -- enemiesPanel:removeSelf()
  -- enemiesPanel = nil  

  bg:removeSelf()
  bg = nil

  scene:removeEventListener("create", scene)
  scene:removeEventListener("show", scene)
  scene:removeEventListener("hide", scene)
  scene:removeEventListener("destroy", scene)
  Runtime:removeEventListener("orientation", onOrientationChange)

  starSheet = nil
  self = nil

end
-- scene events
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
Runtime:addEventListener("orientation", onOrientationChange)
return scene