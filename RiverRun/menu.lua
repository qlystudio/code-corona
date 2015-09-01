-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- include Corona's "widget" library
local widget = require "widget"
kiosk = require "Scripts.clickLogger"

print("menu")
--------------------------------------------

-- forward declarations and other locals
local playBtn
local titleLogo
local optionBtn
local creditsBtn
local kioskBtn
local background
local background2
local backgroundMusic = audio.loadStream("Audio/Menu.mp3")
local kioskMode
local notLeaving

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
	-- go to level1.lua scene
        print("Leaving Menu")
	storyboard.gotoScene( "Level.levelSelect", "fade", 500 )
	--storyboard.gotoScene( "scores", "fade", 500 )
	
	return true	-- indicates successful touch
end

local function onOptBtnRelease()
	
	print("Leaving Menu")
	storyboard.gotoScene( "options", "fade", 500 )
	--startKioskMode()
	--kioskMode = getKioskMode()
	return true	-- indicates successful touch
end

local function onCreditsBtnRelease()
	
    storyboard.gotoScene( "creditsScreen", "fade", 500 )
	audio.stop(2)
	return true	-- indicates successful touch
end

local function onKioskBtnRelease()
	storyboard.gotoScene( "kiosk", "fade", 500 )
	audio.stop(2)
	return true	-- indicates successful touch
end

-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	storyboard.removeAll()
	Runtime:addEventListener("touch", endKiosk)
	local group = self.view
	background = display.newImageRect( "Images/water.png", display.contentWidth, display.contentHeight )
	background2 = display.newImageRect( "Images/water2.png", display.contentWidth, display.contentHeight )

	-- display a background image
	background2.x = 160
	background2.y = -240
	background:setReferencePoint( display.TopLeftReferencePoint )
	background2:setReferencePoint( display.TopLeftReferencePoint )
	background.x, background.y = 0, 0
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect( "Images/logo.gif", 300, 120 )
	titleLogo:setReferencePoint( display.CenterReferencePoint )
	titleLogo.x = display.contentWidth * 0.5
	titleLogo.y = 80
	
	-- create a widget button (which will loads options.lua on release)
	optionBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/options.gif",
		overFile="Images/options-over.gif",
		width=200, height=75,
		onRelease = onOptBtnRelease	-- event listener function
	}
	optionBtn:setReferencePoint( display.CenterReferencePoint )
	optionBtn.x = display.contentWidth*0.5
	optionBtn.y = display.contentHeight - 175

	-- create a widget button (which will loads level1.lua on release)
	playBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/button.gif",
		overFile="Images/button-over.gif",
		width=200, height=75,
		onRelease = onPlayBtnRelease	-- event listener function
	}
	playBtn:setReferencePoint( display.CenterReferencePoint )
	playBtn.x = display.contentWidth*0.5
	playBtn.y = display.contentHeight - 275

	-- create a widget button (which will loads credits.lua on release)
	creditsBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/credits.gif",
		overFile="Images/credits_over.gif",
		width=147, height=160,
		onRelease = onCreditsBtnRelease	-- event listener function
	}
	creditsBtn:setReferencePoint( display.CenterReferencePoint )
	creditsBtn.x = display.contentWidth*.78
	creditsBtn.y = display.contentHeight - 25
	
	kioskBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		width=10, height=10,
		onRelease = onKioskBtnRelease	-- event listener function
	}
	kioskBtn.x = 0
	kioskBtn.y = 0
	
	-- all display objects must be inserted into group
	group:insert( background )
	group:insert( background2 )
	group:insert( titleLogo )
	group:insert( playBtn )
	group:insert( optionBtn )
	group:insert( creditsBtn )
	group:insert( kioskBtn )
        
	
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	kioskMode = getKioskMode()
	notLeaving = true
	
	local backgroundMusicChannel = audio.play( backgroundMusic, { channel=2, loops=-1, fadein=2000 }  )  -- play the background music on channel 1, loop infinitely, and fadein over 5 seconds 

	background.enterFrame = scroll
	Runtime:addEventListener("enterFrame", background)

	background2.enterFrame = scroll
	Runtime:addEventListener("enterFrame", background2)
	
	Runtime:addEventListener("enterFrame", kioskListener)
	
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	Runtime:removeEventListener("enterFrame", background)
	
	Runtime:removeEventListener("enterFrame", background2)
	
	Runtime:removeEventListener("enterFrame", kioskListener)

	--audio.stop(2)
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
	
	if optionBtn then
		optionBtn:removeSelf()	-- widgets must be manually removed
		optionBtn = nil
	end
	
	if creditsBtn then
		creditsBtn:removeSelf()	-- widgets must be manually removed
		creditsBtn = nil
	end
end

function scroll(self, event)
		speed = 1.5
		if self.y >= 475 then
			self.y = -480
		else
			self.y = self.y + (speed+1)
		end
end

function kioskListener(self, event)
	if(kioskMode and notLeaving) then
		notLeaving = false
		timer.performWithDelay(1000, onPlayBtnRelease)
	end
end

function endKiosk(self, event)
	if (getKioskMode()) then
		endKioskMode()
		timer.performWithDelay(3000, returnToSplash)
	end
end

function returnToSplash()
	audio.pause(2)
	storyboard.gotoScene( "splash", "fade", 500 )
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