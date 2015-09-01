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

print("levelSelect")
--------------------------------------------

-- forward declarations and other locals
local singleBtn, singleImage
local returnBtn, topImage
local multiBtn, multiImage
local background
local background2
--local backgroundMusic = audio.loadStream("Audio/Menu.mp3")
local path = system.pathForFile("multiTemp.txt", system.TemporaryDirectory)
local kioskMode
local notLeaving

-- 'onRelease' event listener for playBtn
local function onSingleBtnRelease()	
	-- go to level1.lua scene
	saveMultiTempData("Level.level1")
	return true	-- indicates successful touch
end
local function onMultiBtnRelease()
	-- go to level2.lua scene
	saveMultiTempData("Level.level2")
	return true	-- indicates successful touch
end
function saveMultiTempData(level)
	print("Leaving levelSelect")
   print("Level selection choice: "..level)   
   print("writing a file for temporary data (level selection)")   
   -- path is defined at the top of this file
   local file = io.open(path,"w")
   file:write(level)
   io.close(file)
	storyboard.gotoScene( "multiplayer", "fade", 500 )
end

local function onReturnBtnRelease()
	
        print("Leaving levelSelect")
	storyboard.gotoScene( "menu", "fade", 500 )
	
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
	local group = self.view
	background = display.newImageRect( "Images/water.png", display.contentWidth, display.contentHeight )
	background2 = display.newImageRect( "Images/water2.png", display.contentWidth, display.contentHeight )

	-- display a background image
	background2.x = 160
	background2.y = -240
	background:setReferencePoint( display.TopLeftReferencePoint )
	background2:setReferencePoint( display.TopLeftReferencePoint )
	background.x, background.y = 0, 0
	
	-- create a widget button (which will loads options.lua on release)
	singleBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/level1.gif",
		overFile="Images/level1-over.gif",
		width=150, height=50,
		onRelease = onSingleBtnRelease	-- event listener function
	}
	singleBtn:setReferencePoint( display.CenterReferencePoint )
	singleBtn.x = display.contentWidth*0.25
	singleBtn.y = display.contentHeight - 150

	singleImage = widget.newButton{
		label="Simple",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/levelFirst.jpg",
		--overFile="Images/single-over.gif",
		width=150, height=178,
		onRelease = onSingleBtnRelease	-- event listener function
	}
	singleImage:setReferencePoint( display.CenterReferencePoint )
	singleImage.x = display.contentWidth*0.25
	singleImage.y = display.contentHeight - 275

	-- create a widget button (which will loads level1.lua on release)
	multiBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/level2.gif",
		overFile="Images/level2-over.gif",
		width=150, height=50,
		onRelease = onMultiBtnRelease	-- event listener function
	}
	multiBtn:setReferencePoint( display.CenterReferencePoint )
	multiBtn.x = display.contentWidth*0.75
	multiBtn.y = display.contentHeight - 150

	multiImage = widget.newButton{
		label="Challenge",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/levelSecond.jpg",
		--overFile="Images/single-over.gif",
		width=150, height=178,
		onRelease = onMultiBtnRelease	-- event listener function
	}
	multiImage:setReferencePoint( display.CenterReferencePoint )
	multiImage.x = display.contentWidth*0.75
	multiImage.y = display.contentHeight - 275

	topImage = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/top.gif",
		--overFile="Images/button-over.gif",
		width=display.contentWidth*1, height=75,
		--onRelease = onReturnBtnRelease	-- event listener function
	}
	topImage:setReferencePoint( display.CenterReferencePoint )
	topImage.x = display.contentWidth*0.5
	topImage.y = display.contentHeight*0.085

	returnBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/return.gif",
		--overFile="Images/button-over.gif",
		width=display.contentWidth*1, height=75,
		onRelease = onReturnBtnRelease	-- event listener function
	}
	returnBtn:setReferencePoint( display.CenterReferencePoint )
	returnBtn.x = display.contentWidth*0.5
	returnBtn.y = display.contentHeight - 40
	
	-- all display objects must be inserted into group
	group:insert( background )
	group:insert( background2 )
	group:insert( returnBtn )
	group:insert( singleBtn )
	group:insert( multiBtn )
	group:insert( topImage )
	group:insert( multiImage )
	group:insert( singleImage )
        
	
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	kioskMode = getKioskMode()
	notLeaving = true
		
	--local backgroundMusicChannel = audio.play( backgroundMusic, { channel=3, loops=-1, fadein=2000 }  )  -- play the background music on channel 1, loop infinitely, and fadein over 5 seconds 

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
	--audio.stop(3)
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
		timer.performWithDelay(1000, makeYourChoice)
	end
end

function makeYourChoice()
	local choice = selectChoice()
	if(choice == 1 or choice == 2) then
		onSingleBtnRelease()
	else
		onMultiBtnRelease()
	end
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