require "com.vfiles.core.Class"
require "com.vfiles.objects.slides.WorldMapNewYorkSlide"
require "com.vfiles.objects.slides.WorldMapLondonSlide"
require "com.vfiles.objects.slides.WorldMapMilanSlide"
require "com.vfiles.objects.slides.WorldMapParisSlide"

WorldMapController = Class()

local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"
local SlideController = require "com.vfiles.controllers.SlideController"

local stage, bg, slider, backBtn, highScoreBtn, settingBtn
local _W, _H, sliderMinWidth, sliderMaxWidth, btnPadding = display.contentWidth, display.contentHeight, 200, 420, 12


--------------------------------------------------
-- Private workers
--------------------------------------------------

local function backBtnTapEvent(e)
  composer.gotoScene( "com.vfiles.views.HomeView", { time = 500, effect="fade" } )
  return true
end

local function highScoreBtnTapEvent(e)
  -- print( gameData:get("TotalScore") )
  composer.showOverlay( "com.vfiles.views.modals.HighScoresModalView", { 
    time = 250, 
    effect = "fade",
    isModal = true,
    params = { 
      type = 1
    }
  })

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
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
function WorldMapController:initialize(config)
  stage = config.parent

  bg = display.newImageRect( stage, "assets/images/backgrounds/worldmap.jpg", 568, 320)
  bg.anchorX, bg.anchorY = 0, 0

  --------------------
  -- Build slider
  --------------------
  local slides = {
    WorldMapNewYorkSlide:new({}),
    WorldMapLondonSlide:new({}),
    WorldMapMilanSlide:new({}),
    WorldMapParisSlide:new({})
  }

  slider = SlideController:new({
    parent = stage,
    screenW = 200,
    screenH = 220,
    viewableScreenW = sliderMaxWidth,
    viewableScreenH = 220,
    padding = 20,
    pagination = false,
    arrow = true,
    imageSet = slides,
  })

  --------------------
  -- Buttons
  --------------------

  -- Add slider forward button
  backBtn = SimpleButton:new({
    parent = config.parent,
    icon = {path = "assets/images/ui/global/ico-back-arrow.png", width = 15, height = 22},
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

  -- Add highScore button
  highScoreBtn = SimpleButton:new({
    parent = config.parent,
    label = "HIGH SCORES",
    left = 0,
    top = 0,
    width = 120,
    height = 35,    
    fontSize = 32,
    color = {default= {1,1,1}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = highScoreBtnTapEvent
  })

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



end

--------------------------------------------------
-- Public workers
--------------------------------------------------


function WorldMapController:rotate(isPortrait)
  _W, _H = display.contentWidth, display.contentHeight
  
  -- slider:changeViewableScreenWidth( isPortrait and sliderMinWidth or sliderMaxWidth )
  if isPortrait then
    local offY = (_H-480)/2
    bg.xScale = _H/bg.height
    bg.yScale = _H/bg.height
    bg.x = _W/2 - bg.width/2
    slider:changeViewableScreenWidth(sliderMinWidth)
    slider:scaleTo(1.4)
    slider:moveTo(20, offY + 40 )
  else
    bg.xScale = 1
    bg.yScale = 1
    bg.x = _W/2 - bg.width/2
    slider:changeViewableScreenWidth(sliderMaxWidth)
    slider:scaleTo(1)
    slider:moveTo(_W/2-slider.width/2, 30)
  end
  
  highScoreBtn:moveTo(btnPadding, _H - highScoreBtn.height - btnPadding)
  settingBtn:moveTo(_W - settingBtn.width - btnPadding, _H - settingBtn.height - btnPadding)

end

function WorldMapController:destroy()
  print("Destroy WorldMapController")  
  slider:destroy()
  backBtn:destroy()
  settingBtn:destroy()
  self = nil
end