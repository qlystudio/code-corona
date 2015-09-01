require "com.vfiles.core.Class"
require "com.vfiles.controllers.LevelController"
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"
local Map = Class()
local stage, mapImg, mapLabel, localData, mapDataName, blinkDot, backBtn, settingBtn
local levelController
local _W, _H, btnPadding, bound = display.contentWidth, display.contentHeight, 12, {}

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function dotTouchEvtListener(e)
  if e.phase == "began" then
    -- Create boundary point 
    local padding = 10
    bound = {
      x1 = e.x - padding, 
      y1 = e.y - padding,
      x2 = e.x + padding,
      y2 = e.y + padding
    }
  elseif e.phase =="moved" then
    if bound.x1 < e.x and bound.x2 > e.x and bound.y1 < e.y and bound.y2 > e.y then
      -- in safe zone
    else    
      stage:dispatchEvent({name = "touch", phase="began", x = e.x, y= e.y, id = e.id, target=stage})
    end
  elseif e.phase =="ended" then
 --[[
      Populate detail data from levelController which it has:
      level
      targetScore
      basePoint (for enemy)
      enemies (contains model's name, point and pointException data)
    ]]
    local lv = e.target.idx
    local data = levelController:getStageInfo(mapDataName, lv)
    --[[
      Add up some more prop from localData:
      city  
      bestScore
      achievement
    ]]
    data.city = mapDataName
    data.bestScore = localData.levelData[lv].score
    data.achievement = localData.levelData[lv].achievement
    -- Show preview modal window
    composer.showOverlay( "com.vfiles.views.modals.LevelPreviewModalView", {
      time=650,
      effect="slideLeft",
      isModal=true,
      params = data
    })
    if gameData:get("sfx") then audio.play(audioClick) end
  end
  return true
end

local function backBtnTapEvent(e)
  composer.gotoScene( "com.vfiles.views.WorldMapView", { time = 500, effect="fade" })
  return true
end

local function settingBtnTapEvent(e)
  composer.showOverlay( "com.vfiles.views.modals.GameSettingModalView", { 
    time = 250, 
    effect = "fade",
    isModal = true,
    params = { 
      type = 1
    }
  })
  return true
end

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function setLabelPosition()
  local x, y
  x = mapLabel.width/2 + (mapLabel.anchorX * (_W - mapLabel.width -20)) + 10
  y = mapLabel.height/2 + (mapLabel.anchorY * (_H - mapLabel.height -20)) + 10
  mapLabel:moveTo(x,y)
end


local function createDots(data)
  local lv = localData.currentLevel
  for i=1, #data do
    local btn = display.newContainer( stage, 120, 120)
    btn.anchorChildren, btn.x, btn.y, btn.idx = false, data[i].x, data[i].y + 10, i

    local dot = display.newCircle(btn, 0, -16, 40 )
    local num = display.newBitmapText(btn, tostring(i) ,0 ,-16 ,"champion-40",60)  
    local starSheet = graphics.newImageSheet( "assets/images/ui/citymapview/ico-mapStarSheet.png", {width = 80, height = 24, numFrames = 4, sheetContentWidth = 80, sheetContentHeight = 96})
    local stars = display.newSprite( btn, starSheet, {start=1, count=4})
    stars.anchorY, stars.y = 0, 26 

    -- Check if target stage is cleared or not
    
    if lv >= i then
      dot:setFillColor(.925, 0, .549) -- h0t pink
      stars:setFrame(localData.levelData[i].achievement+1)
      btn:addEventListener( "touch", dotTouchEvtListener)
    else
      dot:setFillColor(0,0,0)
    end
  end

  -- Create a blink circle on the back of current level
  blinkDot = display.newCircle(data[lv].x, data[lv].y -7 , 38 )
  blinkDot:setFillColor(1,1,1,.9)
  stage:insert( 2, blinkDot )
  -- transition.blink( blinkDot, { time=1300 } )
  function transFunc()
    blinkDot.xScale, blinkDot.yScale, blinkDot.alpha = 1, 1, .9
    transition.to( blinkDot, {delay=150, time=1500, xScale=2, yScale=2, alpha=0, transition=easing.eastOutQuad, onComplete=transFunc} )
  end
  transFunc()
end


local function build(config)
  -- build new stage 
  stage = display.newGroup()
  config.parent:insert(stage)
  -- add map image
  mapImg = display.newImageRect(stage, config.imgPath, config.width, config.height)
  mapImg.anchorX, mapImg.anchorY = 0, 0
  -- add label
  mapLabel = display.newBitmapText(config.parent, "{black}"..config.label,0, 0, "champion-40", 50)
  mapLabel.anchorX = config.labelAnchorX
  mapLabel.anchorY = config.labelAnchorY
  setLabelPosition()



  --------------------
  -- Buttons
  --------------------

  -- Add back button
  backBtn = SimpleButton:new({
    parent = config.parent,
    icon = {path = "assets/images/ui/global/ico-back-arrow.png", width = 15, height = 18},
    left = 0,
    top = 0,
    width = 38,
    height = 35,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = backBtnTapEvent
  })
  -- Backbtn will not responed on rotate event. Set the coord value from here.
  backBtn:moveTo(btnPadding, btnPadding)

  -- Add setting button
  settingBtn = SimpleButton:new({
    parent = config.parent,
    icon = {path = "assets/images/ui/global/ico-setting.png", width = 22, height = 22},
    left = 0,
    top = 0,
    width = 38,
    height = 35,    
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    onEvent = settingBtnTapEvent
  })


  -- add Dots (button) on map
  createDots(config.mapData)
end


--------------------------------------------------
-- Constructor
--------------------------------------------------
function Map:initialize(config)
  -- Get level data first
  localData = gameData:get(config.name) -- Data from saved state
  print("-[MAP CLASS]--------------------")
  print("Map Data name: " .. config.name)
  print("Level you can play: " .. localData.currentLevel)
  build(config)

  -- This is an initial coordinate when map loaded, defined by current level
  config.Xcoord = config.mapData[localData.currentLevel].x - display.contentWidth
  config.Ycoord = config.mapData[localData.currentLevel].y - display.contentHeight

  -- Init level controller and map data name
  mapDataName = config.name
  levelController = LevelController:new()

end

--------------------------------------------------
-- Public workers
--------------------------------------------------

function Map:getBody()
  return stage
end

function Map:rotate(isPortrait)
  _W, _H = display.contentWidth, display.contentHeight
  setLabelPosition()

  settingBtn:moveTo(_W - settingBtn.width - btnPadding, _H - settingBtn.height - btnPadding)
end

function Map:destroy()
  print("Destroy Map class")
  transition.cancel(blinkDot)
  mapImg:removeSelf()
  stage:removeSelf()
  backBtn:destroy()
  settingBtn:destroy()
  levelController:destroy()
  mapImg = nil
  stage = nil
  self = nil
end

return Map