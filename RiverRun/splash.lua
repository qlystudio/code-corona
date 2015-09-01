-----------------------------------------------------------------------------------------
--
-- splash.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- include Corona's "widget" library
local widget = require "widget"

print("splash")
--------------------------------------------

-- forward declarations and other locals
local background
local backgroundMusic = audio.loadStream("Audio/Intro.mp3")

-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	background = display.newImageRect( "Images/entryLogo.jpg", display.contentWidth, display.contentHeight )

	-- display a background image
	background:setReferencePoint( display.TopLeftReferencePoint )
	background.x, background.y = 0, 0
	
	-- all display objects must be inserted into group
	group:insert( background )
	
	timer.performWithDelay(5000, leave)
	
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=0, fadein=1000 }  )  -- play the background music on channel 1, loop infinitely, and fadein over 5 seconds 
	
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
end

function leave()
	print("leaving splash")
    storyboard.gotoScene( "menu", "fade", 500 )
 end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	--audio.stop(1)
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
end


-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene