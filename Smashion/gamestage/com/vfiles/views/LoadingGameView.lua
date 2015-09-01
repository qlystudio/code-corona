local composer = require( "composer" )
local scene = require( "composer" ).newScene()

local localData
local bg, loadingLb, faceImgSheet, faceSprite
local _W, _H = display.contentWidth, display.contentHeight

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
  if event.type == "faceUp" or event.type == "faceDown" then return false end  
  local isPortrait = (string.find(event.type, "portrait") == 1)
  _W, _H = display.contentWidth, display.contentHeight
  bg.width, bg.height = _W, _H
  loadingLb:moveTo(_W/2+10, _H/2 -20)
  faceSprite.x, faceSprite.y = _W/2, _H/2 + 50  
end

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function loadNextView()
  composer.gotoScene( localData.sceneName,{ effect="fade", time=250, params = localData.param }) 
end

--------------------------------------------------
-- Scene listeners
--------------------------------------------------
function scene:create( event )
  localData = event.params
  sceneGroup = self.view

  bg = display.newRect(sceneGroup, 0, 0, _W, _H )
  bg:setFillColor(1,.949,0)
  bg.anchorX, bg.anchorY, bg.x, bg.y = 0, 0, 0, 0

  loadingLb = display.newBitmapText(sceneGroup, "{black}LOADING...", 0, 0, "champion-80", 90)
  loadingLb:moveTo(_W/2 +10, _H/2 -20)
  
  faceImgSheet = graphics.newImageSheet( "assets/images/ui/loadingview/gameloading-faces.png", { width=50, height=50, numFrames=4, sheetContentWidth=200, sheetContentHeight=50 } )
  faceSprite = display.newSprite(sceneGroup, faceImgSheet, { start=1, count=4, time=1600 } )
  faceSprite.x, faceSprite.y = _W/2, _H/2 + 50 
  faceSprite:play()

end

function scene:show( event )  
  if event.phase == "did" then    
    -- Destroy prev scene if any
    local prevScene = composer.getSceneName( "previous" )
    if prevScene ~= nil then composer.removeScene( prevScene ) end        
    timer.performWithDelay( 1000, loadNextView )
  end
end

function scene:hide( event )
end

function scene:destroy( event )
  bg:removeSelf()  
  loadingLb:removeSelf()
  faceSprite:removeSelf()
  bg = nil  
  loadingLb = nil
  faceSprite = nil
  faceImgSheet = nil
  self = nil
  scene:removeEventListener("create", scene)
  scene:removeEventListener("show", scene)
  scene:removeEventListener("hide", scene)
  scene:removeEventListener("destroy", scene)
  Runtime:removeEventListener("orientation", onOrientationChange)  
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
Runtime:addEventListener("orientation", onOrientationChange)  

return scene