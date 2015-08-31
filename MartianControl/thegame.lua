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
	-- GROUPS
	local gameGroup = display.newGroup()
	local lineGroup = display.newGroup()
	local flyingObjectGroup = display.newGroup()
	local backgroundGroup = display.newGroup()
	local hudGroup = display.newGroup()
	local itemEnemyGroup = display.newGroup()
	
	gameGroup:insert( backgroundGroup )
	gameGroup:insert( lineGroup )
	gameGroup:insert( itemEnemyGroup )
	gameGroup:insert( flyingObjectGroup )
	gameGroup:insert( hudGroup )
	
	-- EXTERNALS
	local movieclip = require ("movieclip")	
	local ui = require("ui")
	local physics = require "physics"
	local mRand = math.random
	local mCeil = math.ceil
	
	-- ROTATION CODE : Uncomment 2 lines below if your object needs to point a specific direction during travel
	-- Also search code for 'ROTATION CODE' and uncomment lines throughout this module for this functionality.
	--[[
	local mAtan2 = math.atan2
	local mPi = math.pi
	]]--
	
	-- LOGIC VARIABLES
	local isDrawingLine = false
	local flyingObjectsCount
	
	-- GAME VARIABLES/SETTINGS
	local gameIsActive = true
	local gameScore = startScore
	local bestScore
	local flyingObjectSpawnFrameCount = 1
	local alienSpawnFrameCount = 1
	local isOnFirstFlyingObject = true
	local currentComeFrom = mRand( 1, 4 )	--> controls direction in which flying objects spawn from
	local landedAmount = 0
	local messageTween
	local message2Tween
	
	-- COLLISION FILTERS
	local flyingObjectFilter = { categoryBits = 2, maskBits = 6 }		--> Mask 6 collide with 4 & 2; flying saucers collide with themselves, items, and enemies
	local itemEnemyFilter = { categoryBits = 4, maskBits = 3 }	--> Mask 3 collide with 2 & 1; items and enemies collide with flying saucers, not each other
	
	-- OBJECTS
	local scoreText
	local quotaText
	local drawFromObject
	local lineObject = {}
	local planet1, planet2, planet3, planet4, planet5
	
	-- MUSIC/SOUND
	
	local gameMusic = audio.loadStream( "gamemusic.mp3" )
	local tapSound = audio.loadSound( "tapsound.caf" )
	local crashSound = audio.loadSound( "crash.wav" )
	local enterPlanetSound = audio.loadSound( "enterplanet.wav" )
	local noPathSound = audio.loadSound( "nopath.wav" )
	local pathStartSound = audio.loadSound( "pathstart.wav" )
	local pathCompleteSound = audio.loadSound( "pathcomplete.wav" )
	local rescueSound = audio.loadSound( "rescuealien.wav" )
	local levelUpSound = audio.loadSound( "youwin.wav" )
	
	audio.setVolume( 1.0 )
	audio.setVolume( 0.75, { channel=1 } )
	
	local gameMusicChannel = audio.play( gameMusic, { channel=1, loops=-1, fadein=5000 }  )
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local comma_value = function(amount)
		local formatted = amount
			while true do  
			formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
			if (k==0) then
		  		break
			end
	  	end
		
		return formatted
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local saveValue = function( strFilename, strValue )
		-- will save specified value to specified file
		local theFile = strFilename
		local theValue = strValue
		
		local path = system.pathForFile( theFile, system.DocumentsDirectory )
		
		-- io.open opens a file at path. returns nil if no file found
		local file = io.open( path, "w+" )
		if file then
		   -- write game score to the text file
		   file:write( theValue )
		   io.close( file )
		end
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local loadValue = function( strFilename )
		-- will load specified file, or create new file if it doesn't exist
		
		local theFile = strFilename
		
		local path = system.pathForFile( theFile, system.DocumentsDirectory )
		
		-- io.open opens a file at path. returns nil if no file found
		local file = io.open( path, "r" )
		if file then
		   -- read all contents of file into a string
		   local contents = file:read( "*a" )
		   io.close( file )
		   return contents
		else
		   -- create file b/c it doesn't exist yet
		   file = io.open( path, "w" )
		   file:write( "0" )
		   io.close( file )
		   return "0"
		end
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local drawBackground = function()
		local randBackgroundFile = "space" .. tostring( mRand( 1, 2 ) ) .. ".png"
		local gameBackground = display.newImageRect( randBackgroundFile, 480, 320 )
		gameBackground.x = 240; gameBackground.y = 160
		
		local stars1 = display.newImageRect( "stars1.png", 480, 320 )
		stars1.x = 240; stars1.y = 160
		
		local stars2 = display.newImageRect( "stars2.png", 480, 320 )
		stars2.x = 240; stars2.y = 160
		stars2.alpha = 0.1
		
		local stars1Tween, stars2Tween
		
		local function starsAnimation()
			local reAppear = function()
				stars1Tween = transition.to( stars1, { time=2000, alpha=0.1, onComplete=starsAnimation })
				stars2Tween = transition.to( stars2, { time=2000, alpha=1.0 })
			end
			
			stars1Tween = transition.to( stars1, { time=2000, alpha=1.0, onComplete=reAppear })
			stars2Tween = transition.to( stars2, { time=2000, alpha=0.1 })
		end
		
		stars1Tween = transition.to( stars1, { time=2000, alpha=0.1, onComplete=starsAnimation })
		stars2Tween = transition.to( stars2, { time=2000, alpha=1.0 })
		
		backgroundGroup:insert( gameBackground )
		backgroundGroup:insert( stars1 )
		backgroundGroup:insert( stars2 )
		
		gameGroup:insert( backgroundGroup )
		gameGroup:insert( lineGroup )
		gameGroup:insert( itemEnemyGroup )
		gameGroup:insert( flyingObjectGroup )
		gameGroup:insert( hudGroup )
	end
	
	local setScore = function( newScore )
		local theScore = newScore
		
		gameScore = theScore
		scoreText.text = comma_value( theScore )
		scoreText.xScale = 0.5; scoreText.yScale = 0.5
		scoreText.x = (480 - (scoreText.contentWidth * 0.5)) - 20
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local drawHUD = function()
		-- Bottom Bar
		local hudBar = display.newImageRect( "hudbar.png", 436, 24 )
		hudBar:setReferencePoint( display.BottomLeftReferencePoint )
		hudBar.x = 44; hudBar.y = 320
		hudGroup:insert( hudBar )
		
		-- Score Display
		scoreText = display.newText( "0", 310, 309, "Helvetica-Bold", 32 )
		scoreText.text = comma_value( gameScore )
		scoreText.xScale = 0.5; scoreText.yScale = 0.5
		scoreText.x = (480 - (scoreText.contentWidth * 0.5)) - 20
		scoreText.y = 309
		
		hudGroup:insert( scoreText )
		
		-- Quota Display
		local levelQuota = levelQuota
		quotaText = display.newText( "Ships Landed: 0 / 5", 50, 309, "Helvetica-Bold", 28 )
		quotaText.text = "Ships Landed: 0 / " .. tostring(levelQuota)
		quotaText.xScale = 0.5; quotaText.yScale = 0.5
		quotaText.x = (46 + (quotaText.contentWidth * 0.5)) + 20
		quotaText.y = 309
		
		hudGroup:insert( quotaText )
		
		
		-- PAUSE BUTTON
		local onPauseTouch = function( event )
			if event.phase == "release" then
				audio.play( tapSound )
				
				if gameIsActive then
					gameIsActive = false
					physics.pause()
				else
					gameIsActive = true
					physics.start()
				end
			end
		end
		
		local pauseBtn = ui.newButton{
			defaultSrc = "pausebtn.png",
			defaultX = 46,
			defaultY = 46,
			overSrc = "pausebtn-over.png",
			overX = 46,
			overY = 46,
			onEvent = onPauseTouch,
			id = "PauseButton",
			text = "",
			font = "Helvetica",
			textColor = { 255, 255, 255, 255 },
			size = 16,
			emboss = false
		}
		
		pauseBtn:setReferencePoint( display.BottomLeftReferencePoint )
		pauseBtn.x = 0; pauseBtn.y = 320
		
		hudGroup:insert( pauseBtn )
		
		-- LEVEL Display (shows once at start of module)
		local levelNum = levelNumber
		local levelDisplay = display.newText( "Level", 240, 80, "Helvetica-Bold", 84 )
		levelDisplay:setTextColor( 209, 209, 209, 255 )
		levelDisplay.text = "LEVEL " .. tostring(levelNum)
		levelDisplay.xScale = 0.01; levelDisplay.yScale = 0.01
		levelDisplay.alpha = 0.75
		levelDisplay.x = 240; levelDisplay.y = 80
		
		hudGroup:insert( levelDisplay)
		
		local hideLevelDisplay = function()
			local removeIt = function()
				levelDisplay:removeSelf()
				levelDisplay = nil
			end
			
			local newY = levelDisplay.y - 50
			
			transition.to( levelDisplay, { time=1000, alpha=0, y=newY, onComplete=removeIt } )
		end
		
		transition.to( levelDisplay, { time=500, xScale=0.5, yScale=0.5, onComplete=hideLevelDisplay } )
		
		gameGroup:insert( backgroundGroup )
		gameGroup:insert( lineGroup )
		gameGroup:insert( itemEnemyGroup )
		gameGroup:insert( flyingObjectGroup )
		gameGroup:insert( hudGroup )
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local callGameOver = function( isWin )
		local isWin = isWin
		
		if isWin == true then
			
			-- LEVEL COMPLETE set new level attributes and reload module
			levelNumber = levelNumber + 1
			levelQuota = levelQuota + 10
			numPlanets = numPlanets + 1
			startScore = gameScore
			
			if numPlanets >= 5 then
				numPlanets = 5
			end
			
			director:changeScene( "loadthegame" )
		else
			-- GAME OVER
			
			-- Check to see if there's a new high score
			if gameScore > bestScore then
				bestScore = gameScore
				saveValue( "bestscore.data", bestScore )
			end
			
			-- hide current hud elements
			for i = hudGroup.numChildren,1,-1 do
				local child = hudGroup[i]
				child.parent:remove( child )
				child = nil
			end
			
			local gameOverScreen = display.newImageRect( "gameoverscreen.png", 412, 274 )
			gameOverScreen.x = 240; gameOverScreen.y = 160
			
			hudGroup:insert( gameOverScreen )
			
			-- TRY AGAIN BUTTON
			local onTryAgainTouch = function( event )
				if event.phase == "release" then
					audio.play( tapSound )
					audio.stop( gameMusic )
					
					-- Go back to level 1 with default values
					numPlanets = 1
					levelQuota = 5
					flyingObjectSpawnRate = 3
					levelNumber = 1
					startScore = 0
					director:changeScene( "loadthegame" )
				end
			end
			
			local tryAgainBtn = ui.newButton{
				defaultSrc = "tryagainbtn.png",
				defaultX = 174,
				defaultY = 40,
				overSrc = "tryagainbtn-over.png",
				overX = 174,
				overY = 40,
				onEvent = onTryAgainTouch,
				id = "TryAgainButton",
				text = "",
				font = "Helvetica",
				textColor = { 255, 255, 255, 255 },
				size = 16,
				emboss = false
			}
			
			tryAgainBtn.x = 138; tryAgainBtn.y = 170
			hudGroup:insert( tryAgainBtn )
			
			-- MAIN MENU BUTTON
			local onMainMenuTouch = function( event )
				if event.phase == "release" then
					audio.play( tapSound )
					audio.stop( gameMusic )
					
					-- Go to main menu, but first reload default values
					numPlanets = 1
					levelQuota = 5
					flyingObjectSpawnRate = 3
					levelNumber = 1
					startScore = 0
					director:changeScene( "loadmainmenu" )
				end
			end
			
			local mainMenuBtn = ui.newButton{
				defaultSrc = "mainmenubtn.png",
				defaultX = 174,
				defaultY = 40,
				overSrc = "mainmenubtn-over.png",
				overX = 174,
				overY = 40,
				onEvent = onMainMenuTouch,
				id = "MainMenuButton",
				text = "",
				font = "Helvetica",
				textColor = { 255, 255, 255, 255 },
				size = 16,
				emboss = false
			}
			
			mainMenuBtn.x = 340; mainMenuBtn.y = 170
			hudGroup:insert( mainMenuBtn )
			
			-- GAME OVER INFO ( LEVEL, SCORE, BEST SCORE )
			local levelNum = levelNumber
			local gameScore = gameScore
			local bestScore = bestScore
			
			local levelText = display.newText( "LEVEL ", 240, 227, "Helvetica", 36 )
			levelText.text = "LEVEL " .. tostring(levelNum)
			levelText.xScale = 0.5; levelText.yScale = 0.5
			levelText.x = 240
			levelText.y = 229
			
			hudGroup:insert( levelText )
			
			local gameScoreText = display.newText( "Score: ", 240, 248, "Helvetica", 36 )
			gameScoreText.text = "Score: " .. comma_value(gameScore)
			gameScoreText.xScale = 0.5; gameScoreText.yScale = 0.5
			gameScoreText.x = 240
			gameScoreText.y = 251
			
			hudGroup:insert( gameScoreText )
			
			local bestScoreText = display.newText( "Best Score: ", 240, 267, "Helvetica", 36 )
			bestScoreText.text = "Best: " .. comma_value(bestScore)
			bestScoreText.xScale = 0.5; bestScoreText.yScale = 0.5
			bestScoreText.x = 240
			bestScoreText.y = 273
			
			hudGroup:insert( bestScoreText )
		end
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local flyingObjectLanded = function( xLoc, yLoc )
		-- This function is called when a flying object has successfully arrived at
		-- the correct destination.
		
		-- Play sound
		audio.play( enterPlanetSound )
		
		-- Update the score
		local newScore = gameScore + 1000
		setScore( newScore )
		
		-- The Code Below Shows Floating Score "+1000" (etc) display
		local xLoc = xLoc
		local yLoc = yLoc
		
		local writeTextAbovePlanet = function( textLineOne, theX, theY )
			
			local theString = textLineOne
			local theX = theX
			local theY = theY
			
			local screenMessage = display.newText( theString, 160, 240, "Helvetica-Bold", 44 )
			screenMessage:setTextColor( 255, 255, 255, 255 )
			screenMessage.alpha = 1.0
			screenMessage.xScale = 0.5; screenMessage.yScale = 0.5
			screenMessage.xOrigin = theX
			screenMessage.yOrigin = theY
			
			gameGroup:insert( screenMessage )
			
			local destroyMessage = function()
				if screenMessage ~= nil then
					screenMessage:removeSelf()
					screenMessage = nil
				end
			end
			
			local newY = theY - 35
			
			messageTween = transition.to( screenMessage, { time=1000, alpha=0, y=newY, onComplete=destroyMessage } )
		end
		
		writeTextAbovePlanet( "+1000", xLoc, yLoc )
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local alienRescued = function( xLoc, yLoc )
		-- This function is called when a flying object has successfully rescued
		-- a stranded alien (collided). Awards bonus points (+2000).
		
		-- Play sound
		audio.play( rescueSound )
		
		-- Update the score
		local newScore = gameScore + 2000
		setScore( newScore )
		
		-- The Code Below Shows Floating Score "+2000" (etc) display
		local xLoc = xLoc
		local yLoc = yLoc
		
		local writeTextAboveAlien = function( textLineOne, theX, theY )
			
			local theString = textLineOne
			local theX = theX
			local theY = theY
			
			local screenMessage = display.newText( theString, 160, 240, "Helvetica-Bold", 36 )
			screenMessage:setTextColor( 176, 208, 15, 255 )
			screenMessage.alpha = 1.0
			screenMessage.xScale = 0.5; screenMessage.yScale = 0.5
			screenMessage.xOrigin = theX
			screenMessage.yOrigin = theY
			
			gameGroup:insert( screenMessage )
			
			local destroyMessage = function()
				screenMessage:removeSelf()
				screenMessage = nil
			end
			
			local newY = theY - 30
			
			message2Tween = transition.to( screenMessage, { time=1000, alpha=0, y=newY, onComplete=destroyMessage } )
		end
		
		writeTextAboveAlien( "+2000", xLoc, yLoc )
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local newFlyingObject = function( params )
		local flyingObject, x, y, cameFrom
		
		local colorSetting = mRand( 1, 6 )
		local file1name = "flyingobject" .. tostring(colorSetting) .. "-1.png"
		local file2name = "flyingobject" .. tostring(colorSetting) .. "-2.png"
		
		flyingObject = movieclip.newAnim({ file1name, file2name }, 84, 84 )
		local flyingObjectRadius = 11
		physics.addBody( flyingObject, "dynamic", { density = 0, friction = 0, bounce = 0, radius=flyingObjectRadius, filter=flyingObjectFilter, isSensor=true } )
		
		flyingObject:stopAtFrame( 1 )
		flyingObject.x = params.x; flyingObject.y = params.y
		flyingObjectGroup:insert( flyingObject )
		
		flyingObjectsCount = #flyingObjectGroup
		
		flyingObject.myName = "flyingObject"
		flyingObject.framePosition = 1
		flyingObject.animInterval = 10	--> 15
		flyingObject.animFrameCount = 1
		flyingObject.selfCount = flyingObjectsCount
		flyingObject.moveSpeed = 1.0
		flyingObject.frameCount = 1
		flyingObject.hasPath = false
		flyingObject.nextX = 0
		flyingObject.nextY = 0
		flyingObject.readyForNextX = true
		flyingObject.readyForNextY = true
		flyingObject.nextIndice = 1
		flyingObject.touchPointsX = {}
		flyingObject.touchPointsY = {}
		flyingObject.touchIndice = 1
		flyingObject.cameFrom = params.cameFrom
		flyingObject.isWaiting = false
		
		flyingObject.lineObject = {}
		flyingObject.destination = mRand( 1, numPlanets )
		
		local onFlyingObjectCollision = function( self, event )
			if event.phase == "began" and event.other.myName == "flyingObject" then
				-- COLLISION with another flying saucer (flyingObject)
				gameIsActive = false
				
				-- REMOVE the flying saucer objects (both of them)
				self:removeEventListener( "touch", self )
				Runtime:removeEventListener( "enterFrame", self )
				
				-- START explosion effect
				audio.play( crashSound )
				
				local explodeObject = display.newImageRect( "explosion.png", 84, 84 )
				explodeObject.x = self.x; explodeObject.y = self.y
				explodeObject.alpha = 0
				explodeObject.isVisible = true
				
				local fadePoof = function()
					local goGameOver = function() callGameOver( false ); end
					transition.to( explodeObject, { time=1000, alpha=0, onComplete=goGameOver } )	
				end
				transition.to( explodeObject, { time=100, alpha=1.0, onComplete=fadePoof } )
				-- END explosion effect
				
				-- remove the object's line "path"
				if self.lineObject then
					for i = #self.lineObject,1,-1 do
						local child = self.lineObject[i]
						child.parent:remove( child )
						child = nil
					end
				end
				
				self.parent:remove( self )
				self = nil
				
				if event.other ~= nil then
					event.other:removeEventListener( "touch", event.other )
					Runtime:removeEventListener( "enterFrame", event.other )
					
					if event.other.lineObject then
						for i = #event.other.lineObject,1,-1 do
							local child = event.other.lineObject[i]
							child.parent:remove( child )
							child = nil
						end
					end
					
					event.other.parent:remove( event.other )
					event.other = nil
		 		end
			end
		end
			 
		flyingObject.collision = onFlyingObjectCollision
		flyingObject:addEventListener( "collision", flyingObject )
		
		--===================================================================================
		--
		--
		--===================================================================================
		
		function flyingObject:touch( event )
			if event.phase == "began" and not flyingObject.hasPath and gameIsActive then
				flyingObject.isWaiting = true
				drawFromObject = flyingObject
				isDrawingLine = true
				
				flyingObject.isBodyActive = false
				
				audio.play( pathStartSound )
			end
		end
		
		flyingObject:addEventListener( "touch", flyingObject )
		
		--===================================================================================
		--
		--
		--===================================================================================
		
		function flyingObject:enterFrame( event )	--> handles flyingObject movement
			
			if gameIsActive then
				
				-- animation
				if flyingObject.animFrameCount >= flyingObject.animInterval then
					
					if flyingObject.framePosition == 1 then
						flyingObject:stopAtFrame( 2 )
						flyingObject.framePosition = 2
						
						--if not flyingObject.hasPath then flyingObject.alpha = 0.4; end
						
					elseif flyingObject.framePosition == 2 then
						flyingObject:stopAtFrame( 1 )
						flyingObject.framePosition = 1
						
						--if not flyingObject.hasPath then flyingObject.alpha = 1.0; end
					end
					
					flyingObject.animFrameCount = 1
				
				else
					flyingObject.animFrameCount = flyingObject.animFrameCount + 1
				end
				
				if flyingObject.hasPath then
					if flyingObject.frameCount >= 1 then	--> every frame... (change to number for every Xth frame)
						-- reset the frame counter
						flyingObject.frameCount = 1
						
						if flyingObject.hasPath then
							
							local moveSpeed = flyingObject.moveSpeed
							
							-- ROTATION CODE : Uncomment line below if your object needs to point a certain direction during travel
							--local angleBetween = mCeil(mAtan2( (flyingObject.nextY - flyingObject.y), (flyingObject.nextX - flyingObject.x) ) * 180 / mPi) + 90
							
							
							-- X-axis movement
							if not flyingObject.readyForNextX then
								local theX = mCeil( flyingObject.x )
								
								if theX < flyingObject.nextX then
									flyingObject.x = flyingObject.x + moveSpeed
									
									-- ROTATION CODE : Uncomment line below if your object needs to point a certain direction during travel
									--flyingObject.rotation = angleBetween
								elseif theX > flyingObject.nextX then
									flyingObject.x = flyingObject.x - moveSpeed
									
									-- ROTATION CODE : Uncomment line below if your object needs to point a certain direction during travel
									--flyingObject.rotation = angleBetween
								elseif theX == flyingObject.nextX then
									flyingObject.readyForNextX = true
								end
							end
							
							-- Y-axis movement
							if not flyingObject.readyForNextY then
								local theY = mCeil( flyingObject.y )
								
								if theY < flyingObject.nextY then
									flyingObject.y = flyingObject.y + moveSpeed
								elseif theY > flyingObject.nextY then
									flyingObject.y = flyingObject.y - moveSpeed
								elseif theY == flyingObject.nextY then
									flyingObject.readyForNextY = true
								end
							end
							
							-- Object has reached last coordinate; move to the next one (or see if it has reached his destination)
							if flyingObject.readyForNextX and flyingObject.readyForNextY then
								
								--> move to the next indice so we know where to look in the table of coordinates
								flyingObject.nextIndice = flyingObject.nextIndice + 1
								
								-- If object hasn't reached end of flight path
								if flyingObject.nextIndice < flyingObject.touchIndice then
									local lastIndice1 = flyingObject.nextIndice - 1
									--local lastIndice2 = flyingObject.nextIndice - 2
									
									flyingObject.lineObject[ lastIndice1 ].isVisible = false
									--flyingObject.lineObject[ lastIndice2 ].isVisible = false
									
									flyingObject.nextX = flyingObject.touchPointsX[ flyingObject.nextIndice ]
									flyingObject.nextY = flyingObject.touchPointsY[ flyingObject.nextIndice ]
									flyingObject.readyForNextX = false
									flyingObject.readyForNextY = false
								else
									-- When object DOES reach end of flight path...
									flyingObject.hasPath = false
									
									-- remove the object's line "path"
									for i = #flyingObject.lineObject,1,-1 do
										local child = flyingObject.lineObject[i]
										child.parent:remove( child )
										child = nil
									end
									
									-- remove the flying object and corresponding event listeners
									if flyingObject.blinkTween then transition.cancel( flyingObject.blinkTween ); end
									flyingObject:removeEventListener( "touch", flyingObject )
									Runtime:removeEventListener( "enterFrame", flyingObject )
									
									-- Call function to give score bonus, etc.
									flyingObjectLanded( flyingObject.nextX, flyingObject.nextY )
									
									flyingObject:removeSelf()
									flyingObject = nil
									
									-- Increment the quota amount and check to see if next level needs to be called
									local levelQuota = levelQuota
									landedAmount = landedAmount + 1
									
									if landedAmount >= levelQuota then
										landedAmount = levelQuota
										gameIsActive = false
										
										-- Show level complete notification, then load next level
										local completeNotifier = display.newImageRect( "levelcomplete.png", 372, 30 )
										completeNotifier.x = 240; completeNotifier.y = 100
										completeNotifier.xScale = 0.1; completeNotifier.yScale = 0.1
										hudGroup:insert( completeNotifier )
										
										local onComplete = function()
											
											local goGameOver = function() audio.play( levelUpSound ); callGameOver( true ); end
											timer.performWithDelay( 500, goGameOver, 1 )
										end
										
										transition.to( completeNotifier, { time=2000, xScale=1.0, yScale=1.0, y=140, onComplete=onComplete, transition=easing.inOutExpo } )
									end
									
									-- Update quota display on HUD
									quotaText.text = "Ships Landed: " .. tostring(landedAmount) .." / " .. tostring(levelQuota)
									quotaText.xScale = 0.5; quotaText.yScale = 0.5
									quotaText.x = (46 + (quotaText.contentWidth * 0.5)) + 20
								end
							end
						end
					else
						-- increment the frame counter
						flyingObject.frameCount = flyingObject.frameCount + 1
					end
				else
					--> Flying object doesn't yet have a path (player hasn't made one yet)
					if flyingObject.frameCount >= 3 and not flyingObject.isWaiting then
						local moveSpeed = 0.5
						flyingObject.frameCount = 1	 --> reset frame count
						
						if flyingObject.cameFrom == 1 then
							--> came from LEFT
							flyingObject.x = flyingObject.x + moveSpeed
							
							--> moves off-screen
							if flyingObject.x >= 530 then
								flyingObject.x = -50
								flyingObject.y = mRand( 50, 270 )
							end
							
						elseif flyingObject.cameFrom == 2 then
							--> came from TOP
							flyingObject.y = flyingObject.y + moveSpeed
							
							--> moves off-screen
							if flyingObject.y >= 370 then
								flyingObject.x = mRand( 50, 430 )
								flyingObject.y = -50
							end
						
						elseif flyingObject.cameFrom == 3 then
							--> came from RIGHT
							flyingObject.x = flyingObject.x - moveSpeed
							
							--> moves off-screen
							if flyingObject.x <= -50 then
								flyingObject.x = 530
								flyingObject.y = mRand( 50, 270 )
							end
						
						elseif flyingObject.cameFrom == 4 then
							--> came from BOTTOM
							flyingObject.y = flyingObject.y - moveSpeed
							
							--> moves off-screen
							if flyingObject.y <= -50 then
								flyingObject.x = mRand( 50, 430 )
								flyingObject.y = 370
							end
						end
						
					else
						-- increment the frame counter
						flyingObject.frameCount = flyingObject.frameCount + 1
					end
				end
			end
		end
		
		Runtime:addEventListener( "enterFrame", flyingObject )
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local newAlienObject = function()
		if gameIsActive then
			local alienObject
		
			local colorSetting = mRand( 1, 5 )	--> for different aliens colors
			local alienFile = "alien" .. tostring(colorSetting) .. ".png"
			
			alienObject = display.newImageRect( alienFile, 20, 20 )
			local alienObjectRadius = 8
			physics.addBody( alienObject, "dynamic", { density = 0, friction = 0, bounce = 0, radius=alienObjectRadius, filter=itemEnemyFilter, isSensor=true } )
			
			alienObject.isBodyActive = false
			
			alienObject.x = mRand( 50, 430 ); alienObject.y = mRand( 50, 270 )
			alienObject.xScale = 0.1; alienObject.yScale = 0.1
			itemEnemyGroup:insert( alienObject )
			
			alienObject.frameCount = 1
			
			local makeBodyActive = function() alienObject.isBodyActive = true; end
			
			local zoomTween = transition.to( alienObject, { time=1000, xScale=1.0, yScale=1.0, onComplete=makeBodyActive } )
			
			--===================================================================================
			--
			--
			--===================================================================================
			
			local onAlienCollision = function( self, event )
				if event.phase == "began" and event.other.myName == "flyingObject" then
		 			-- COLLISION WITH FLYING SAUCER (flyingObject)
		 			Runtime:removeEventListener( "enterFrame", self )
		 			alienRescued( self.x, self.y )
		 			self.parent:remove( self )
		 			self = nil
		 			
				end
			end
			 
			alienObject.collision = onAlienCollision
			alienObject:addEventListener( "collision", alienObject )

			--===================================================================================
			--
			--
			--===================================================================================
			
			function alienObject:enterFrame( event )	--> handles alien animation movement
			
				if gameIsActive then
					if alienObject.frameCount >= 2 then
						alienObject.frameCount = 1	--> reset frame count
						
						if alienObject.rotation >= 359 then alienObject.rotation = 0; else
							alienObject.rotation = alienObject.rotation + 1
						end
					else
						alienObject.frameCount = alienObject.frameCount + 1
					end
				end
			end
			
			Runtime:addEventListener( "enterFrame", alienObject )
		end
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local createPlanets = function( event )
		
		local numPlanets = numPlanets	--> store global variable locally, to increase speed
		
		if numPlanets == 5 then		--> maximum amount of planets
			
			planet1 = display.newImageRect( "planet1.png", 218, 218 )
			planet1.x = 285; planet1.y = 205
			planet1.bounds = { planet1.x - 36, planet1.x + 36, planet1.y - 36, planet1.y + 36 }	 --> x1, x2, y1, y2
			
			planet2 = display.newImageRect( "planet2.png", 156, 156 )
			planet2.x = 400; planet2.y = 60
			planet2.bounds = { planet2.x - 34, planet2.x + 34, planet2.y - 34, planet2.y + 34 }	 --> x1, x2, y1, y2
			
			planet3 = display.newImageRect( "planet3.png", 146, 146 )
			planet3.x = 61; planet3.y = 123
			planet3.bounds = { planet3.x - 32, planet3.x + 32, planet3.y - 32, planet3.y + 32 }	 --> x1, x2, y1, y2
			
			planet4 = display.newImageRect( "planet4.png", 110, 110 )
			planet4.x = 91; planet4.y = 273
			planet4.bounds = { planet4.x - 32, planet4.x + 32, planet4.y - 32, planet4.y + 32 }	 --> x1, x2, y1, y2
			
			planet5 = display.newImageRect( "planet5.png", 74, 74 )
			planet5.x = 142; planet5.y = 23
			planet5.bounds = { planet5.x - 32, planet5.x + 32, planet5.y - 32, planet5.y + 32 }	 --> x1, x2, y1, y2
			
			gameGroup:insert( backgroundGroup )
			gameGroup:insert( lineGroup )
			gameGroup:insert( planet1 )
			gameGroup:insert( planet2 )
			gameGroup:insert( planet3 )
			gameGroup:insert( planet4 )
			gameGroup:insert( planet5 )
		
		elseif numPlanets == 4 then
			
			planet1 = display.newImageRect( "planet1.png", 218, 218 )
			planet1.x = 285; planet1.y = 205
			planet1.bounds = { planet1.x - 36, planet1.x + 36, planet1.y - 36, planet1.y + 36 }	 --> x1, x2, y1, y2
			
			planet2 = display.newImageRect( "planet2.png", 156, 156 )
			planet2.x = 400; planet2.y = 60
			planet2.bounds = { planet2.x - 34, planet2.x + 34, planet2.y - 34, planet2.y + 34 }	 --> x1, x2, y1, y2
			
			planet3 = display.newImageRect( "planet3.png", 146, 146 )
			planet3.x = 61; planet3.y = 123
			planet3.bounds = { planet3.x - 32, planet3.x + 32, planet3.y - 32, planet3.y + 32 }	 --> x1, x2, y1, y2
			
			planet4 = display.newImageRect( "planet4.png", 110, 110 )
			planet4.x = 91; planet4.y = 273
			planet4.bounds = { planet4.x - 32, planet4.x + 32, planet4.y - 32, planet4.y + 32 }	 --> x1, x2, y1, y2
			
			gameGroup:insert( backgroundGroup )
			gameGroup:insert( lineGroup )
			gameGroup:insert( planet1 )
			gameGroup:insert( planet2 )
			gameGroup:insert( planet3 )
			gameGroup:insert( planet4 )
		
		elseif numPlanets == 3 then
			
			planet1 = display.newImageRect( "planet1.png", 218, 218 )
			planet1.x = 285; planet1.y = 205
			planet1.bounds = { planet1.x - 36, planet1.x + 36, planet1.y - 36, planet1.y + 36 }	 --> x1, x2, y1, y2
			
			planet2 = display.newImageRect( "planet2.png", 156, 156 )
			planet2.x = 400; planet2.y = 60
			planet2.bounds = { planet2.x - 34, planet2.x + 34, planet2.y - 34, planet2.y + 34 }	 --> x1, x2, y1, y2
			
			planet3 = display.newImageRect( "planet3.png", 146, 146 )
			planet3.x = 61; planet3.y = 123
			planet3.bounds = { planet3.x - 32, planet3.x + 32, planet3.y - 32, planet3.y + 32 }	 --> x1, x2, y1, y2
			
			gameGroup:insert( backgroundGroup )
			gameGroup:insert( lineGroup )
			gameGroup:insert( planet1 )
			gameGroup:insert( planet2 )
			gameGroup:insert( planet3 )
		
		elseif numPlanets == 2 then
			
			planet1 = display.newImageRect( "planet1.png", 218, 218 )
			planet1.x = 285; planet1.y = 205
			planet1.bounds = { planet1.x - 36, planet1.x + 36, planet1.y - 36, planet1.y + 36 }	 --> x1, x2, y1, y2
			
			planet2 = display.newImageRect( "planet2.png", 156, 156 )
			planet2.x = 400; planet2.y = 60
			planet2.bounds = { planet2.x - 34, planet2.x + 34, planet2.y - 34, planet2.y + 34 }	 --> x1, x2, y1, y2
			
			gameGroup:insert( backgroundGroup )
			gameGroup:insert( lineGroup )
			gameGroup:insert( planet1 )
			gameGroup:insert( planet2 )
		
		elseif numPlanets == 1 then
			
			planet1 = display.newImageRect( "planet1.png", 218, 218 )
			planet1.x = 285; planet1.y = 205
			planet1.bounds = { planet1.x - 36, planet1.x + 36, planet1.y - 36, planet1.y + 36 }	 --> x1, x2, y1, y2
			
			gameGroup:insert( backgroundGroup )
			gameGroup:insert( lineGroup )
			gameGroup:insert( planet1 )
		end
		
		
		gameGroup:insert( itemEnemyGroup )
		gameGroup:insert( flyingObjectGroup )
		gameGroup:insert( hudGroup )
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local touchListener = function( event )
		if drawFromObject  and gameIsActive then
			if event.phase == "began" and not drawFromObject.hasPath then
				-- Blink the destination planet
				local thePlanet = drawFromObject.destination
				
				if thePlanet == 1 then
					thePlanet = planet1
				elseif thePlanet == 2 then
					thePlanet = planet2
				elseif thePlanet == 3 then
					thePlanet = planet3
				elseif thePlanet == 4 then
					thePlanet = planet4
				elseif thePlanet == 5 then
					thePlanet = planet5
				end
				
				local function blinkAnimation()
					local reAppear = function()
						if thePlanet then
							thePlanet.blinkTween = transition.to( thePlanet, { time=150, alpha=0.1, onComplete=blinkAnimation })
						end
					end
					
					if thePlanet then
						thePlanet.blinkTween = transition.to( thePlanet, { time=200, alpha=0.98, onComplete=reAppear })
					end
				end
				
				thePlanet.blinkTween = transition.to( thePlanet, { time=150, alpha=0.1, onComplete=blinkAnimation })
				
			elseif event.phase == "ended" and not drawFromObject.hasPath then
				-- Stop logging touch coordinates
				isDrawingLine = false
				
				-- Make physics body active again
				drawFromObject.isBodyActive = true
				
				-- Determine the destination
				local thePlanet = drawFromObject.destination
				
				if thePlanet == 1 then
					thePlanet = planet1
				elseif thePlanet == 2 then
					thePlanet = planet2
				elseif thePlanet == 3 then
					thePlanet = planet3
				elseif thePlanet == 4 then
					thePlanet = planet4
				elseif thePlanet == 5 then
					thePlanet = planet5
				end
				
				local x1 = thePlanet.bounds[1]
				local x2 = thePlanet.bounds[2]
				local y1 = thePlanet.bounds[3]
				local y2 = thePlanet.bounds[4]
				
				-- stop blinking animation (if still going)
				if thePlanet.blinkTween then transition.cancel( thePlanet.blinkTween ); thePlanet.alpha = 1.0; end
				
				-- BELOW: If path has been completed
				if event.x > x1 and event.x < x2 and event.y > y1 and event.y < y2 then
					
					-- Play sound
					audio.play( pathCompleteSound )
					
					-- Disable creating a new path for this object
					drawFromObject.hasPath = true
					drawFromObject.alpha = 1.0
					
					-- Draw a line between each coordinate
					local i
					local j = drawFromObject.selfCount
					local pointCount = drawFromObject.touchIndice - 1	--> no need to draw a line when at last coordinate
					
					for i=1, pointCount do
						if i < pointCount then
							local nexti = i + 1
							local lasti = pointCount - 1
							
							if i < lasti then
								drawFromObject.lineObject[i] = display.newLine( drawFromObject.touchPointsX[i], drawFromObject.touchPointsY[i], drawFromObject.touchPointsX[nexti], drawFromObject.touchPointsY[nexti] )
								drawFromObject.lineObject[i]:setColor( 0, 204, 250, 255 )
								drawFromObject.lineObject[i].width = 2.75
								drawFromObject.lineObject[i].alpha = 0.45
								lineGroup:insert(drawFromObject.lineObject[i])			
							elseif i >= lasti then
								local middleX = x2 - ((x2 - x1) * 0.5)
								local middleY = y2 - ((y2 - y1) * 0.5)
								drawFromObject.lineObject[i] = display.newLine( drawFromObject.touchPointsX[i], drawFromObject.touchPointsY[i], middleX, middleY )
								drawFromObject.lineObject[i]:setColor( 0, 204, 250, 255 )
								drawFromObject.lineObject[i].width = 2.75
								drawFromObject.lineObject[i].alpha = 0.45
								lineGroup:insert(drawFromObject.lineObject[i])
							end
							
							i = i + 1	--> increment to the next coordinate
						end
					end
					
					drawFromObject = nil
				else
					-- play sound
					audio.play( noPathSound )
					
					drawFromObject.hasPath = false
					drawFromObject.isWaiting = false
					local theIndice = drawFromObject.touchIndice
					local i
					
					-- clear previous line coordinates
					for i=1,theIndice do
						drawFromObject.touchPointsX[i] = nil
						drawFromObject.touchPointsY[i] = nil
					end
					
					drawFromObject.touchIndice = 1
				end
			end
			
			-- For every frame finger is touching, store the coordinates in a variable
			if isDrawingLine and not drawFromObject.hasPath then
				drawFromObject.touchPointsX[ drawFromObject.touchIndice ] = event.x
				drawFromObject.touchPointsY[ drawFromObject.touchIndice ] = event.y
				drawFromObject.touchIndice = drawFromObject.touchIndice + 1
				
				-- Line below is to help you figure some of this out:
				--print( drawFromObject.touchIndice-1 .. ": Stored coordinates: " .. drawFromObject.touchPointsX[ drawFromObject.touchIndice-1 ] .. ", " .. drawFromObject.touchPointsY[ drawFromObject.touchIndice-1 ])
			end
		end
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local spawnNewFlyingObject = function()
			-- First decide what side of the screen object will come from
			local theX, theY
			currentComeFrom = currentComeFrom + 1
			
			if currentComeFrom > 4 then
				currentComeFrom = 1
			end
			
			local comeFrom = currentComeFrom
			
			if comeFrom == 1 then		--> left side of screen
				if isOnFirstFlyingObject then
					isOnFirstFlyingObject = false
					theX = 0
				else
					theX = 0
				end
				theY = mRand( 50, 270 )
				
			elseif comeFrom == 2 then	--> top of screen
				if isOnFirstFlyingObject then
					isOnFirstFlyingObject = false
					theY = 0
				else
					theY = 0
				end
				theX = mRand( 50, 430 )
				
			elseif comeFrom == 3 then	--> right side of screen
				if isOnFirstFlyingObject then
					isOnFirstFlyingObject = false
					theX = 480
				else
					theX = 480
				end
				theY = mRand( 50, 270 )
				
			elseif comeFrom == 4 then	--> bottom of screen
				if isOnFirstFlyingObject then
					isOnFirstFlyingObject = false
					theY = 320
				else
					theY = 320
				end
				theX = mRand( 50, 430 )
			end
			
			newFlyingObject( {
				x = theX,
				y = theY,
				cameFrom = comeFrom
			})
			
		end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local objectSpawner = function( event )
		if gameIsActive then
			-- FLYING SAUCERS (flyingObject)
			
			local spawnRate = mCeil(flyingObjectSpawnRate * 60)
			
			if flyingObjectSpawnFrameCount >= spawnRate then
				flyingObjectSpawnFrameCount = 1		--> reset the counter
				
				-- Spawn a new flying object
				spawnNewFlyingObject()
			else
				flyingObjectSpawnFrameCount = flyingObjectSpawnFrameCount + 1
			end
			
			-- STRANDED ALIENS (alienObject)
			if alienSpawnFrameCount >= 600 then		--> every 10 seconds (every 600th frame @ 60 fps)
				alienSpawnFrameCount = 1	--> reset frame counter
				
				-- collect previous garbage and THEN spawn new alien
				local garbageCollect = function() collectgarbage("collect"); newAlienObject(); end
        		timer.performWithDelay(1, garbageCollect, 1)
				
			else
				alienSpawnFrameCount = alienSpawnFrameCount + 1
			end
		end
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local onSystem = function( event )
		if event.type == "applicationSuspend" then
			
			if gameIsActive then
				gameIsActive = false
				physics.pause()
			end
			
		elseif event.type == "applicationExit" then
			if system.getInfo( "environment" ) == "device" then
				-- prevents iOS 4+ multi-tasking crashes
				os.exit()
			end
		end
	end
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	local gameInit = function()
		physics.start()
		physics.setGravity( 0, 0 )
		math.randomseed(os.time())
		
		-- Load best score from file
		bestScore = tonumber(loadValue( "bestscore.data" ))
		
		drawBackground()
		drawHUD()
		createPlanets()
		
		Runtime:addEventListener( "touch", touchListener )
		Runtime:addEventListener( "enterFrame", objectSpawner )
		Runtime:addEventListener( "system", onSystem )
		
		-- Start the game off with the first flying object
		spawnNewFlyingObject()
		
		-- Spawn a new one every 3 seconds
		timer.performWithDelay( 3000, spawnNew, 50 )
		
	end
	
	gameInit()
	
	--===================================================================================
	--
	--
	--===================================================================================
	
	unloadMe = function()
		-- STOP physics engine
		physics.stop()
		
		-- STOP Timers, Runtime Listeners, Transitions, etc.
		Runtime:removeEventListener( "touch", touchListener )
		Runtime:removeEventListener( "enterFrame", objectSpawner )
		Runtime:removeEventListener( "system", onSystem )
		
		if messageTween then transition.cancel( messageTween ); end
		if message2Tween then transition.cancel( message2Tween ); end
	end
	
	-- MUST return a display.newGroup()
	return gameGroup
end
