local scene = require("composer").newScene()
require "com.vfiles.controllers.CityMapController"

local sceneGroup, cityMapController, localData
local audioUnlockedSound

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function rotateScreen(isPortrait)
	if cityMapController ~= nil then cityMapController:rotate(isPortrait) end
end

local function showCityClearOverlay(city)
  composer.showOverlay( "com.vfiles.views.modals.CongratulationsModalView", { 
    -- time = 250, 
    -- effect = "fade",
    -- isModal = true,
    params = { 
      city = city
    }
  })
  return true
end

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
  if event.type == "faceUp" or event.type == "faceDown" then 
    return false 
  end	
  rotateScreen(string.find(event.type, "portrait") == 1)
end

--------------------------------------------------
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
local function build(self)
	
  -- Show Congratulations overlay if city unlocked
  if localData.newCityUnlocked then
    audioUnlockedSound = audio.loadSound( "assets/audios/city-unlocked.wav" )
    audio.play( audioUnlockedSound )
    showCityClearOverlay(localData.newCity)
  -- end
	else

		sceneGroup = self.view
		cityMapController = CityMapController:new({
			parent = sceneGroup, 
			city = localData.city,
			newLevelUnlocked = localData.newLevelUnlocked,
			newCityUnlocked = localData.newCityUnlocked,
			newCity = localData.newCity
		})
		rotateScreen(display.contentWidth < display.contentHeight)
	end

end
-- build end

--------------------------------------------------
-- Scene listeners
--------------------------------------------------


-- scene listeners
function scene:create( event )
	localData = event.params
	build(self)
end

function scene:show( event )		
		if event.phase == "did" then			
			local prevScene = composer.getSceneName( "previous" )
			if prevScene ~= nil then composer.removeScene(prevScene) end
	end
end

function scene:hide( event )
end

function scene:destroy( event )
	print("Destroy citymapview")

  if audioUnlockedSound ~= nil then
    audio.dispose( audioUnlockedSound )
    audioUnlockedSound = nil
  end

	if cityMapController ~=nil then cityMapController:destroy() end
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