module(..., package.seeall)

--***********************************************************************************************--
--***********************************************************************************************--

-- 
-- Abstract: Martian Control sample project 
-- Designed and created by Jonathan and Biffy Beebe of Beebe Games exclusively for Ansca, Inc.
-- http://beebegamesonline.appspot.com/

-- (should work on all iOS and Android devices, optimized for retina display)
-- 
-- Version: 1.0
-- 
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.

--***********************************************************************************************--
--***********************************************************************************************--


-- Main function - MUST return a display.newGroup()
function new()
	local localGroup = display.newGroup()
	
	local ui = require("ui")
	
	local gameMusic = audio.loadStream( "gamemusic.mp3" )
	local tapSound = audio.loadSound( "tapsound.caf" )
	
	audio.setVolume( 1.0 )
	audio.setVolume( 0.75, { channel=1 } )
	
	local gameMusicChannel = audio.play( gameMusic, { channel=1, loops=-1 }  )
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local drawScreen = function()
		menuImage = display.newImageRect( "mainmenuscreen.png", 480, 320 )
		menuImage.x = 240; menuImage.y = 160
		
		localGroup:insert( menuImage )
		
		-- PLAY NOW BUTTON
		local onPlayNowTouch = function( event )
			if event.phase == "release" then
				audio.play( tapSound )
				audio.stop( gameMusic )
				
				-- Go to level 1 with default values
				numPlanets = 1
				levelQuota = 5
				flyingObjectSpawnRate = 3
				levelNumber = 1
				startScore = 0
				director:changeScene( "loadthegame" )
			end
		end
		
		local playNowBtn = ui.newButton{
			defaultSrc = "playnowbtn.png",
			defaultX = 222,
			defaultY = 62,
			overSrc = "playnowbtn-over.png",
			overX = 222,
			overY = 62,
			onEvent = onPlayNowTouch,
			id = "PlayNowButton",
			text = "",
			font = "Helvetica",
			textColor = { 255, 255, 255, 255 },
			size = 16,
			emboss = false
		}
		
		playNowBtn.x = 245; playNowBtn.y = 232
		localGroup:insert( playNowBtn )
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local onSystem = function( event )
		if event.type == "applicationExit" then
			if system.getInfo( "environment" ) == "device" then
				-- prevents iOS 4+ multi-tasking crashes
				os.exit()
			end
		end
	end
	
	drawScreen()
	
	Runtime:addEventListener( "system", onSystem )
	
	unloadMe = function()
		Runtime:removeEventListener( "system", onSystem )
	end
	
	-- MUST return a display.newGroup()
	return localGroup
end
