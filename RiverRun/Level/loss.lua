local storyboard = require( "storyboard" )
local sceneLoss = storyboard.newScene()
local backgroundMusic = audio.loadStream("Audio/Lose.mp3")
require("Scripts.won_lost")
local level, multiPlayMode, multiTempSIZE
-- include Corona's "widget" library
local widget = require "widget"

local storyboard = require "storyboard"

local water1, water2, physics

function scrollLoss(self, event)
   if(not(finished)) then    
	   
		if self.y <= -950 then
			self.y = 960
		else
			self.y = self.y - (speed+1)
		end
	end
end

function leave()
	print("leaving loss") 
   if multiPlayMode == "Singleplayer" or multiTempSIZE>3 then
      storyboard.gotoScene( "scores", "fade", 500 )
   else
      storyboard.gotoScene( "playerTwo", "fade", 500 )
	end
end

function sceneLoss:createScene( event )
	storyboard.removeAll()
	local group = self.view
	physics = require("physics")
	print("Create loss")
	
end

-- Called immediately after scene has moved onscreen:
function sceneLoss:enterScene( event )
	local group = self.view
	local backgroundMusicChannel = audio.play( backgroundMusic, { channel=3, loops=0, fadein=3000 }  )  -- play the background music on channel 1, loop infinitely, and fadein

	physics.start()
	
	local levelDirector =nil 
	local myLevel = {}
	local speed = 2

	levelDirector = require ("Level.lossBuild")

	myLevel = levelDirector.CreateLevel(physics)
		
	water1 = myLevel.layers['bg'].objects['water1']

	water2 = myLevel.layers['bg'].objects['water2']
	
	water1.enterFrame = scrollLoss
	Runtime:addEventListener("enterFrame", water1)

	water2.enterFrame = scrollLoss
	Runtime:addEventListener("enterFrame", water2)
	
	timer.performWithDelay(5000, leave)
	
	group:insert( water1 )
	group:insert( water2 )
	group:insert( myLevel )
	
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
   local savedArgs = won_lost()
   level=savedArgs[1]
   multiPlayMode=savedArgs[2]
   multiTempSIZE =savedArgs[3]
end

function sceneLoss:exitScene( event )
	local group = self.view
	physics.pause()
	audio.stop(3)
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function sceneLoss:destroyScene( event )
	local group = self.view
	physics.stop()
	package.loaded[physics] = nil
	physics = nil
end
-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
sceneLoss:addEventListener( "createScene", sceneLoss )

-- "enterScene" event is dispatched whenever scene transition has finished
sceneLoss:addEventListener( "enterScene", sceneLoss )

-- "exitScene" event is dispatched whenever before next scene's transition begins
sceneLoss:addEventListener( "exitScene", sceneLoss )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
sceneLoss:addEventListener( "destroyScene", sceneLoss )

-----------------------------------------------------------------------------------------

return sceneLoss