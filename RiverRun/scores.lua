-----------------------------------------------------------------------------------------
--
-- scores.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- include Corona's "widget" library
local widget = require "widget"

print("Top Scores")
--------------------------------------------

-- forward declarations and other locals
local singleBtn, singleImage
local returnBtn, topImage
local background
local background2
local backgroundMusic = audio.loadStream("Audio/Scores.mp3")
local path = system.pathForFile("multiTemp.txt", system.TemporaryDirectory)
local pathTS
local kioskMode
local notLeaving
local score1, score2, score3, score4, score5, levelName


local function onReturnBtnRelease()
	
    print("Leaving Top Scores")
	storyboard.gotoScene( "menu", "fade", 500 )
	audio.stop(1)
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
	
	background = display.newImageRect( "Images/water.jpg", display.contentWidth, display.contentHeight )
	background2 = display.newImageRect( "Images/water2.jpg", display.contentWidth, display.contentHeight )

	-- display a background image
	background2.x = 160
	background2.y = -240
	background:setReferencePoint( display.TopLeftReferencePoint )
	background2:setReferencePoint( display.TopLeftReferencePoint )
	background.x, background.y = 0, 0
	
	levelName = display.newText("Loading",70,90,native.systemFont,50)
	levelName:setTextColor(0,0,0)
	score1 = display.newText("Loading",90,150,native.systemFont,40)
	score1:setTextColor(0,0,0)
	score2 = display.newText("Loading",90,200,native.systemFont,40)
	score2:setTextColor(0,0,0)
	score3 = display.newText("Loading",90,250,native.systemFont,40)
	score3:setTextColor(0,0,0)
	score4 = display.newText("Loading",90,300,native.systemFont,40)
	score4:setTextColor(0,0,0)
	score5 = display.newText("Loading",90,350,native.systemFont,40)
	score5:setTextColor(0,0,0)
	
	local tempFile = io.open(path, "r")
	if (tempFile:read() == "Level.level1") then
		levelName.text = "Level 1"
		pathTS = system.pathForFile("lvl1TopScores.txt", system.DocumentsDirectory)
	else
		levelName.text = "Level 2"
		pathTS = system.pathForFile("lvl2bTopScores.txt", system.DocumentsDirectory)
	end
	io.close(tempFile)
	local tempFile = io.open(pathTS, "r")
	local scores = {}
	for i=1, 5 do
		scores[i] = tempFile:read()
	end
	if (scores[1]) then
		score1.text = scores[1] .. " Seconds"
	else
		score1.text = "N/A"
	end
	if (scores[2]) then
		score2.text = scores[2] .. " Seconds"
	else
		score2.text = "N/A"
	end
	if (scores[3]) then
		score3.text = scores[3] .. " Seconds"
	else
		score3.text = "N/A"
	end
	if (scores[4]) then
		score4.text = scores[4] .. " Seconds"
	else
		score4.text = "N/A"
	end
	if (scores[5]) then
		score5.text = scores[5] .. " Seconds"
	else
		score5.text = "N/A"
	end
	
	-- create a widget button (which will loads options.lua on release)
	

	singleImage = widget.newButton{
		label="",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/white-space.jpg",
		--overFile="Images/single-over.gif",
		width=250, height=300,
		--onRelease = onSingleBtnRelease	-- event listener function
	}
	singleImage:setReferencePoint( display.CenterReferencePoint )
	singleImage.x = display.contentWidth*0.5
	singleImage.y = display.contentHeight - 235

	topImage = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/scores.png",
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
		defaultFile="Images/menu.gif",
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
	--group:insert( singleBtn )
	group:insert( topImage )
	group:insert( singleImage )
	group:insert( levelName )
	group:insert( score1 )
	group:insert( score2 )
	group:insert( score3 )
	group:insert( score4 )
	group:insert( score5 )
        
	
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	kioskMode = getKioskMode()
	notLeaving = true
	
	local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=0 }  )  -- play the background music on channel 1, loop infinitely, and fadein over 5 seconds 

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
		timer.performWithDelay(5000, onReturnBtnRelease)
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