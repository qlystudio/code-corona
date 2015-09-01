local scene = require("composer").newScene()
require "com.vfiles.controllers.WorldMapController"

local sceneGroup, worldMapController

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function rotateScreen(isPortrait)
	worldMapController:rotate(isPortrait)
end

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
	if event.type == "faceUp" or event.type == "faceDown" then return false end	
  rotateScreen(string.find(event.type, "portrait") == 1)
end

--------------------------------------------------
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
local function build(self)
	sceneGroup = self.view
	worldMapController = WorldMapController:new({parent = sceneGroup })
	rotateScreen(display.contentWidth < display.contentHeight)
end
-- build end

--------------------------------------------------
-- Scene listeners
--------------------------------------------------


-- scene listeners
function scene:create( event )	
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
	print("Destroy worldmapview")

	worldMapController:destroy()
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