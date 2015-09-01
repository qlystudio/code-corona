require "com.vfiles.controllers.LevelController"
local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"

local sceneGroup, stage, bg, header, body, footer
local starSheet
local replayBtn, continueBtn, shareBtn
local _W, _H, bgPadding, localData = display.contentWidth, display.contentHeight, 0, {}
local newLevelUnlocked, newCityUnlocked, newCity = false, false, nil
local audioGameWon = audio.loadSound( "assets/audios/game-won.wav" )
local levelController

--------------------------------------------------
-- Private workers
--------------------------------------------------

local function rotateScreenTo(isPortrait)
  _W, _H = display.contentWidth, display.contentHeight
  stage.width, stage.height = _W, _H
  bg.width, bg.height = _W - bgPadding, _H - bgPadding

  if isPortrait then
    header.x, header.y = _W/2, (_H - 320)/4
    body.x, body.y = _W/2, _H/2

    continueBtn:moveTo(-140,0)
    replayBtn:moveTo(10,0)
    shareBtn:moveTo(-65,60)

  else
    header.x, header.y = _W/2 - header.width/2 - 20, 30
    body.x, body.y = _W/2 + body.width/2 + 20, body.height/2 + 20

    continueBtn:moveTo(-210,0)
    replayBtn:moveTo(-65,0)
    shareBtn:moveTo(80,0)

  end
  footer.x, footer.y = _W/2, _H - (_H - 320)/4 - footer.height - 20
  
end

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

local function continueBtnTapEvent(e)
    composer.gotoScene( "com.vfiles.views.LoadingGameView", {
    params = { 
      sceneName = "com.vfiles.views.CityMapView",
      param = {
        city = localData.city,
        newLevelUnlocked = newLevelUnlocked,
        newCityUnlocked = newCityUnlocked,
        newCity = newCity,
      }
    } 
  })
end

local function shareBtnTapEvent(e)

end

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
  if event.type == "faceUp" or event.type == "faceDown" then return false end  
  -- local isPortrait = (string.find(event.type, "portrait") == 1)
  rotateScreenTo(string.find(event.type, "portrait") == 1)
end

--------------------------------------------------
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
local function build(self)
  local myData = gameData:get(localData.city)
  local levelTotal = myData.levelTotal -- Total level of current city

  local lastScore = myData.levelData[localData.gameLevel].score
  local lastAchievement = myData.levelData[localData.gameLevel].achievement

  -- Set the new value with old data
  local newScore = lastScore
  local newAchievement = lastAchievement
  local newLevel = localData.gameLevel

  -- ==================================================
  -- Update gameData values
  -- ==================================================

  -- Set new level value (can not greater than levelTotal)
  if levelTotal > newLevel  then
    -- Increase level
    newLevel = newLevel + 1 

    -- Also create the new empty table for next level if not avaiable
    if myData.levelData[newLevel] == nil then
      newLevelUnlocked = true
      myData.currentLevel = newLevel
      myData.levelData[newLevel] = {
        score = 0,
        achievement = 0
      }
    end

  else    
    -- Unlock the new City if lastAchievement was 0 (which means never cleared this level before)
    print("lastAchievement", lastAchievement)
    if lastAchievement == 0 then
      levelController = LevelController:new()
      newCity = levelController:unlockNextCity(localData.city)
      newCityUnlocked = true
    end
  end

  -- Update new Score
  if lastScore < localData.result.score then
    -- if newScore is greater than last, update the score as new, and add up the difference to total score
    newScore = localData.result.score

    local currentTotalScore = gameData:get("TotalScore")
    local newTotalScore = currentTotalScore + (newScore-lastScore)
    gameData:set("TotalScore", newTotalScore)
    print("NEW TOTAL IS: ", newTotalScore)
  end
  
  -- update current game data
  myData.levelData[localData.gameLevel] = {
    score = newScore,
    achievement = localData.result.achievement
  }



  -- Write data
  gameData:set(localData.city, myData)

  print("========================================")
  print("Code: ", localData.code)
  print("City: ", localData.city)
  print("This Level: ", localData.gameLevel)
  print("Next Level: ", newLevel)
  print("Last Score: ", localData.result.score)
  print("New(Best) Score: ", newScore)
  print("Last Achievement: ", localData.result.achievement)
  print("New Achievement: ", localData.result.achievement)
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
  local headerLb3 = display.newBitmapText(header, "COMPLETED!", 0, 70, "champion-80", 80)
  headerLb1:moveTo(-(headerLb2.width + 5)/2, 20)
  headerLb2:moveTo(headerLb1.x + headerLb1.width/2 + headerLb2.width/2 + 5, 20)

  -- Build body (group)
  body = display.newGroup()
  stage:insert(body)
  body.x, body.y = _W/2, _H/2
  local bodyFrame = display.newRect(body, 0, 0, 150, 160 )
  bodyFrame.strokeWidth = 2
  bodyFrame:setFillColor( 0,0,0,0 )
  local bodyDivider = display.newLine( body, -75, 40, 75, 40 )
  bodyDivider.strokeWidth = 2

  local bodyLb1 = display.newBitmapText(body, "SCORE:", 0, -62, "champion-40", 26)
  local bodyLb2 = display.newBitmapText(body, comma_value(localData.result.score), 0, -18, "champion-80", 70)
  local bodyLb3 = display.newBitmapText(body, "{yellow}MY BEST: " .. comma_value(newScore), 0, 60, "champion-40", 28)

  starSheet = graphics.newImageSheet( "assets/images/ui/global/ico-bigStarSheet.png", {width = 92, height = 20, numFrames = 4, sheetContentWidth = 92, sheetContentHeight = 80})
  local stars = display.newSprite( body, starSheet, {start=1, count=4})
  stars.y = 23
  stars:setFrame(localData.result.achievement+1)


  -- Build Footer (group)
  footer = display.newGroup()
  stage:insert(footer)
    
  replayBtn = SimpleButton:new({
    parent = footer,
    label = "REPLAY",
    left = 0,
    top = 0,
    width = 130,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,1}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = replayBtnTapEvent
  })

  continueBtn = SimpleButton:new({
    parent = footer,
    label = "CONTINUE",
    left = 0,
    top = 0,
    width = 130,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = continueBtnTapEvent
  })

  shareBtn = SimpleButton:new({
    parent = footer,
    label = "          SHARE",
    icon = {path = "assets/images/ui/global/ico-fb-btn.png", width = 130, height = 29},
    left = 0,
    top = 0,
    width = 130,
    height = 37,
    fontSize = 32,
    color = {default= {.329, .482, .741}, over = {.173, .369, .694}},
    fontColor = {default= {1,1,1}, over = {1,1,1}},
    onEvent = shareBtnTapEvent
  })

   
  audio.play(audioGameWon)

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
end

function scene:hide( event )
end

function scene:destroy( event )
  print("Destroy GameFailed Modal view")

  audio.dispose( audioGameWon )
  audioGameWon = nil

  for i=1, header.numChildren do
    header[1]:removeSelf()
    header[1] = nil
  end
  header = nil
  body = nil

  replayBtn:destroy()
  continueBtn:destroy()
  shareBtn:destroy()
  footer = nil

  if levelController then levelController:destroy() end

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