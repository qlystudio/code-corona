-----------------------------------------------------------------------------------------
--
-- multiplayer.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- include Corona's "widget" library
local widget = require "widget"

print("multiplayer")
--------------------------------------------

-- forward declarations and other locals
local singleBtn
local returnBtn, topImage
local multiBtn, vsImage, singleImage
local background
local background2
--local backgroundMusic = audio.loadStream("Audio/SoundFX/power-up.mp3")
local path = system.pathForFile("multiTemp.txt", system.TemporaryDirectory)
local level
local kioskMode
local notLeaving

-- 'onRelease' event listener for playBtn
local function onSingleBtnRelease()
	saveMultiTempData("Singleplayer")
   return true -- indicates a successful touch
end
local function onMultiBtnRelease()
	saveMultiTempData("Multiplayer")
	--audio.stop(2)
   return true -- indicates a successful touch
end
function saveMultiTempData(multiPlayMode)
	print("Leaving multiplayer select")
   print("selection choice: "..multiPlayMode)
   print("writing a file for temporary data (multiPlayMode)")
   -- path is defined at the top of this file
   local file = io.open(path,"w")
   file:write(level.."\n"
            ..multiPlayMode.."\n"
            .."Player1")
   io.close(file)
	storyboard.gotoScene( "playerOne" , "fade", 500 )
end

local function onReturnBtnRelease()
	print("Leaving multiplayer")
	storyboard.gotoScene( "Level.levelSelect", "fade", 500 )
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
		defaultFile="Images/single.gif",
		overFile="Images/single-over.gif",
		width=150, height=50,
		onRelease = onSingleBtnRelease	-- event listener function
	}
	singleBtn:setReferencePoint( display.CenterReferencePoint )
	singleBtn.x = display.contentWidth*0.25
	singleBtn.y = display.contentHeight - 150

	singleImage = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/singlePlayer.png",
		--overFile="Images/single-over.gif",
		width=253, height=300,
		onRelease = onSingleBtnRelease	-- event listener function
	}
	singleImage:setReferencePoint( display.CenterReferencePoint )
	singleImage.x = display.contentWidth*0.25
	singleImage.y = display.contentHeight - 350

	-- create a widget button (which will loads level1.lua on release)
	multiBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/multi.gif",
		overFile="Images/multi-over.gif",
		width=150, height=50,
		onRelease = onMultiBtnRelease	-- event listener function
	}
	multiBtn:setReferencePoint( display.CenterReferencePoint )
	multiBtn.x = display.contentWidth*0.75
	multiBtn.y = display.contentHeight - 150

	vsImage = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/multiPlayer.png",
		--overFile="Images/single-over.gif",
		width=253, height=300,
		onRelease = onMultiBtnRelease	-- event listener function
	}
	vsImage:setReferencePoint( display.CenterReferencePoint )
	vsImage.x = display.contentWidth*0.75
	vsImage.y = display.contentHeight - 350

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
	group:insert( singleImage )
	group:insert( vsImage )
	group:insert( topImage )
        
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	kioskMode = getKioskMode()
	notLeaving = true

	background.enterFrame = scroll
	Runtime:addEventListener("enterFrame", background)

	background2.enterFrame = scroll
	Runtime:addEventListener("enterFrame", background2)
	
	Runtime:addEventListener("enterFrame", kioskListener)	
   
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	local file = io.open(path,"r")
   if not file then
      level = "level.level1"
   else
      level = file:read()
   end
   io.close(file)
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	Runtime:removeEventListener("enterFrame", background)
	
	Runtime:removeEventListener("enterFrame", background2)
	
	Runtime:removeEventListener("enterFrame", kioskListener)

	--audio.stop(4)
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
	local choice = getChoice()
	if(choice == 1 or choice == 3) then
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