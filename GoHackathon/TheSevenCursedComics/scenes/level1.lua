----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local player = require("game.player")
local prefabs = require("game.prefabs")
local dialogs = require("game.dialogs")
local scene = storyboard.newScene()
----------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	game:setGroup(group)
	prefabs:createBackground(16,198,232)
	
	local pSprite = player:loadPlayer(100,300, 50, 75)
	
	local physics = require "physics"	
	game:setPhysics(physics)
	physics.start()
	physics.setGravity(0, 90)
	physics.setDrawMode("normal")	
	
	--Level Design
	prefabs:createClouds(100,100, 1)
	prefabs:createPlatform(100,420, 1)
	prefabs:createPlatform(100,600, 1)
	prefabs:createPlatform(300,400, 2)
	prefabs:createPlatform(300,540, 2)
	prefabs:createPlatform(450,350, 1)
	prefabs:createPlatform(450,540, 1)
	prefabs:createPlatform(700,500, 2)
	prefabs:createPlatform(700,650, 2)
	prefabs:createPlatform(850,400, 2)
	prefabs:createPlatform(850,530, 2)
	--prefabs:createDoor(200,200, "level1")
	game:setPlayer(pSprite)
	playBackgroundMusic("JauntyGumption(gum_monster).mp3")
	--Level Design
	--Enemies
		prefabs:createChocolateBat(400, 200, 2)
		prefabs:createChocolateBat(650, 200, 2)
		prefabs:createChocolateBat(800, 100, 2)
	--Enemies
	
	game:setScene("level1")
    group:insert(pSprite)
	
	local text = display.newText(dialogs["level1"](), 10, 110, display.contentWidth - 10, display.contentHeight , game:getFont(), game:getFontSize())
	text:setTextColor(255,255,0)
	text.alpha = 0
	transition.to( text, { time=500, alpha = 1} )
	
	local text2 = display.newText(dialogs["level1"](), 11, 108, display.contentWidth - 10, display.contentHeight , game:getFont(), game:getFontSize())
	text2:setTextColor(0,0,0)
	text2.alpha = 0
	transition.to( text2, { time=500, alpha = 1} )
	
	group:insert(text)
	group:insert(text2)
	
	local v = function()
		transition.to( text, { time=500, alpha = 0} )
		transition.to( text2, { time=500, alpha = 0} )
	end
	
	timer.performWithDelay(7000, v)
end
scene:addEventListener( "createScene", scene )


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	prefabs:createDoor(1024,200, "level2")
	group:insert(game:loadUI())
	storyboard.purgeAll()
end
scene:addEventListener( "enterScene", scene )

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
end
scene:addEventListener( "exitScene", scene )

-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
end
scene:addEventListener( "destroyScene", scene )


return scene