local storyboard = require( "storyboard" )
local sceneWin = storyboard.newScene()
local backgroundMusic = audio.loadStream("Audio/Win.mp3")
require("Scripts.won_lost")
local level, multiPlayMode, multiTempSIZE
local kioskMode
local notLeaving

-- include Corona's "widget" library
local widget = require "widget"

local storyboard = require "storyboard"

local menuBtn, water1, water2, physics

function scrollWin(self, event)
   if(not(finished)) then    
	   
		if self.y <= -950 then
			self.y = 950
		else
			self.y = self.y - (speed+1)
		end
	end
end

local function onMenuBtnRelease()
	
	-- go to splash.lua scene
--	storyboard.gotoScene( "Level.level1", "fade", 500 )
--	storyboard.gotoScene( "Level.loss", "fade", 500 )
   if multiPlayMode == "Singleplayer" or multiTempSIZE>3 then
      storyboard.gotoScene( "scores", "fade", 500 )
   else
      storyboard.gotoScene( "playerTwo", "fade", 500 )
	end
	return true	-- indicates successful touch
end

function sceneWin:createScene( event )
	storyboard.removeAll()
	local group = self.view
	physics = require("physics")
	print("Create win")

end

-- Called immediately after scene has moved onscreen:
function sceneWin:enterScene( event )
	local group = self.view
	kioskMode = getKioskMode()
	notLeaving = true
	
--	local physics = require ("physics")
	local backgroundMusicChannel = audio.play( backgroundMusic, { channel=3, loops=-1, fadein=1000 }  )  -- play the background music on channel 1, loop infinitely, and fadein over 5 seconds 	

	physics.start()
	
	local levelDirector =nil
	local myLevel = {}
	local speed = 2
	
	levelDirector = require ("Level.winBuild")

	myLevel = levelDirector.CreateLevel(physics)
		
	local water1 = myLevel.layers['bg'].objects['water1']
	local water2 = myLevel.layers['bg'].objects['water2']
	local y = myLevel.layers['fg'].objects['Y_w']
	local o = myLevel.layers['fg'].objects['O_w']
	local u = myLevel.layers['fg'].objects['U_w']
	local w = myLevel.layers['fg'].objects['W']
	local i = myLevel.layers['fg'].objects['I']
	local n = myLevel.layers['fg'].objects['N']
	
	-- create a widget button (which will loads level1.lua on release)
	menuBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/next.png",
		overFile="Images/next-over.png",
		width=200, height=75,
		onRelease = onMenuBtnRelease	-- event listener function
	}
	menuBtn:setReferencePoint( display.CenterReferencePoint )
	menuBtn.x = display.contentWidth*0.5
	menuBtn.y = display.contentHeight - 280
	
	group:insert( water1 )
	group:insert( water2 )
	group:insert( menuBtn )
	group:insert( myLevel )
	group:insert( y )
	group:insert( o )
	group:insert( u )
	group:insert( w )
	group:insert( i )
	group:insert( n )
	
	y.angularVelocity = 200 	
	o.angularVelocity = 150 
	u.angularVelocity = 200 
	w.angularVelocity = 200 
	i.angularVelocity = 150 
	n.angularVelocity = 200 
	
	water1.enterFrame = scrollWin
	Runtime:addEventListener("enterFrame", water1)

	water2.enterFrame = scrollWin
	Runtime:addEventListener("enterFrame", water2)
	
	Runtime:addEventListener("enterFrame", kioskListener)
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
   local savedArgs = won_lost()
   level=savedArgs[1]
   multiPlayMode=savedArgs[2]
   multiTempSIZE=savedArgs[3]
end

function sceneWin:exitScene( event )
	local group = self.view
	Runtime:removeEventListener("enterFrame", kioskListener)
	physics.pause()
   audio.stop(3)
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function sceneWin:destroyScene( event )
	local group = self.view
	
	if menuBtn then
		menuBtn:removeSelf()	-- widgets must be manually removed
		menuBtn = nil
	end
	
	physics.stop()
	package.loaded[physics] = nil
	physics = nil
end

function kioskListener(self, event)
	if(kioskMode and notLeaving) then
		notLeaving = false
		timer.performWithDelay(5000, onMenuBtnRelease)
	end
end
-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
sceneWin:addEventListener( "createScene", sceneWin )

-- "enterScene" event is dispatched whenever scene transition has finished
sceneWin:addEventListener( "enterScene", sceneWin )

-- "exitScene" event is dispatched whenever before next scene's transition begins
sceneWin:addEventListener( "exitScene", sceneWin )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
sceneWin:addEventListener( "destroyScene", sceneWin )

-----------------------------------------------------------------------------------------

return sceneWin