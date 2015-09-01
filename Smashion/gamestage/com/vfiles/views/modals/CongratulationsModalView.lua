local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"

local sceneGroup, stage, blackScreen, bg, header, btn, btnImg, model
local continueBtn, nextScene, nextCity
local _W, _H, localData = display.contentWidth, display.contentHeight, {}
local imgPath = "assets/images/ui/congratulationsview/"

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function rotateScreenTo(isPortrait)
  _W, _H = display.contentWidth, display.contentHeight
  stage.width, stage.height = _W, _H
  blackScreen.width = _W
  blackScreen.height = _H


  bg.x = _W/2 
  bg.y = _H - bg.height
  bg.width = _W

  header.x, header.y = _W/2, 10

  btn.x = _W/2
    model.y = _H - model.height
  if isPortrait then
    btn.y = _H/2 - 30
    model.x = _W/2 - model.width/2
  else
    if localData.city == "AllClear" then 
      btn.y = _H/2
    else
      btn.y = _H - btn.height/2 - 30
    end
    model.x  = _W - model.width
  end

end


local function continueBtnTapEvent(e)
  composer.gotoScene( "com.vfiles.views.LoadingGameView", {  time=500, effect="fade", params = { sceneName = nextScene, param = {city = nextCity } } })
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

  sceneGroup = self.view

  -- Build graphic container named stage. This is a parent of all asset on screen.
  stage = display.newContainer(sceneGroup, _W, _H)
  stage.anchorChildren, stage.anchorX, stage.anchorY = false, 0, 0

  blackScreen = display.newRect(stage, 0, 0, _W, _H  )
  blackScreen:setFillColor(0,0,0)
  blackScreen.anchorX, blackScreen.anchorY, blackScreen.x, blackScreen.y = 0, 0, 0, 0

  -- Prep message
  local city1, city2, verse1, verse2, verse3, verse4, bgType, cityType, modelType

  verse1 = "YOU HAVE CONQUERED "
  verse2 = ", NOW\nGET READY TO TAKE OVER "
  verse3 = "YOU'VE CONQUERED THE\nFOUR MAJOR FASHION CITIES!"
  verse4 = "STAY TUNED FOR MORE CITY UPDATES"

  print("CITY!:", localData.city)

  if localData.city == "London" then
    city1 = "NEW YORK" 
    city2 = "LONDON"
    bgType = 1
    cityType = 1
    modelType = 1
    nextScene = "com.vfiles.views.CityMapView"
    nextCity = "London"
  elseif localData.city == "Milan" then
    city1 = "LONDON" 
    city2 = "MILAN"  
    bgType = 1
    cityType = 2
    modelType = 2
    nextScene = "com.vfiles.views.CityMapView"
    nextCity = "Milan"
  elseif localData.city == "Paris" then
    city1 = "MILAN" 
    city2 = "PARIS"
    bgType = 1
    cityType = 3
    modelType = 3
    nextScene = "com.vfiles.views.CityMapView"
    nextCity = "Paris"    
  elseif localData.city == "AllClear" then 
    bgType = 2
    cityType = nil
    modelType = 4
    nextScene = "com.vfiles.views.WorldMapView"    
  end

  -- BG
  bg = display.newImageRect(stage, imgPath .. "bg-type-".. bgType ..".jpg", 480, 320 )
  bg.anchorY =  0


  -- Build header (group)
  header = display.newGroup()
  stage:insert(header)
  header.x, header.y = _W/2, (_H - 320)/4
  
  local headerLb1 = display.newBitmapText(header, "{yellow}CONGRATULATIONS!", 0, 40, "champion-80-dek", 70)
  if localData.city == "AllClear" then  
    local headerLb2 = display.newBitmapText(header, verse3, 0, 110, "champion-40-dek", 36)
    local headerLb3 = display.newBitmapText(header, verse4, 0, 165, "champion-40-dek", 28)
  else
    local headerLb2 = display.newBitmapText(header, verse1 .. city1 .. verse2 .. city2 .. "!", 0, 100, "champion-40-dek", 28)
  end

  -- Btn (container)
  btn = display.newGroup( )
  stage:insert( btn )

  if cityType ~= nil then
    btnImg = display.newImageRect(btn, imgPath .. "city-" .. cityType .. ".png",  164, 133 )
  end
    
  continueBtn = SimpleButton:new({
    parent = btn,
    label = "CONTINUE",
    left = -65,
    top = 66,
    width = 130,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = continueBtnTapEvent
  })

  -- Model
  model = display.newImageRect(stage, imgPath .. "model-".. modelType ..".png", 168, 198 )
  model.anchorX, model.anchorY = 0, 0

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
  print("Destroy congratulations Modal view")

  for i=1, header.numChildren do
    header[1]:removeSelf()
    header[1] = nil
  end
  header = nil

  if btnImg ~=nil then
    btnImg:removeSelf( )
    btnImg = nil
  end

  model:removeSelf()
  model = nil

  continueBtn:destroy()

  blackScreen:removeSelf( )
  blackScreen = nil

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