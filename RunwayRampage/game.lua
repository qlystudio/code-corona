-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- REQUIRE PHYSICS ENGINE
local math, physics = require("math"), require('physics')
physics.start()
physics.setGravity( 0, 2 )


-- REQUIRE STORYBOARD
local storyboard = require ("storyboard")
-- REFERS TO SCENE - Event Listener Handler
local scene = storyboard.newScene()


-- CREATE SCENE
function scene:createScene(event)

	local screenGroup = self.view

	-- BASE BG
	local background = display.newImage("images/background/background-charles.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background:scale(1.25,1.25)
	screenGroup:insert(background)

	local runway = display.newRect( display.contentCenterX, display.contentCenterY*1.33, 200, 600 )
	screenGroup:insert(runway)
	runway.path.x1 = 75
	runway.path.y1 = 200

	runway.path.y2 = -125
	runway.path.x2 = -125

	runway.path.y3 = -125
	runway.path.x3 = 125

	runway.path.x4 = -75
	runway.path.y4 = 200


	--  SPRITE SHEET EXPERIMENTS -- WALKING MAN

	local sheetData = { width=51.375, height=72.5, numFrames=32, sheetContentWidth=411, sheetContentHeight=290 }

	local mySheet = graphics.newImageSheet( "images/sprites/sprites/man-walk.png", sheetData )
	 
	local sequenceData = {
	    { name = "forward", start=1, count=8, time=800, loopCount=10 },
	    { name = "left", start=9, count=8, time=800, loopCount=3 },
	    { name = "backward", start=25, count=8, time=800, loopCount=10 }
	}
	 
	local animation = display.newSprite( mySheet, sequenceData )
	animation.x = display.contentWidth/2  --center the sprite horizontally
	animation.y = display.contentHeight/2  --center the sprite vertically
	 
	animation:play()

	

	local function mySpriteListener( event )
 
		if ( event.phase == "ended" ) then
			local thisSprite = event.target  --"event.target" references the sprite

			if ( thisSprite.sequence == "left") then
				thisSprite:setSequence( "backward" )  --switch to "fastRun" sequence
				thisSprite:play()  --play the new sequence; it won't play automatically!
				transition.to(animation, {time=6000, x=(animation.x + 125), y=(animation.y - 190), xScale = 1, yScale = 1})
			end


			if ( thisSprite.sequence == "forward") then
				thisSprite:setSequence( "left" )  --switch to "fastRun" sequence
				thisSprite:play()  --play the new sequence; it won't play automatically!
				transition.to(animation, {time=1500, x=(animation.x - 250), y=(animation.y)})
			end

		end
	 
	end
	 
	animation:addEventListener( "sprite", mySpriteListener )  --add a sprite listener to your sprite


	transition.to(animation, {time=6000, delay=1500, x=(animation.x + 125), y=(animation.y + 190), xScale = 4, yScale = 4})




	-- transition.to(animation, {time=6000, delay=1500, x=(animation.x + 125), y=(animation.y + 190), xScale = 4, yScale = 4})
	-- transition.to(animation, {time=3000, x=(animation.x - 150), y=animation.y})

end



-- ENTER - put event listeners, call functions
function scene:enterScene(event)

end


--EXIT 
function scene:exitScene(event)

end


-- DESTROY
function scene:destroyScene(event)

end


-- ADD EVENT LISTNERS FOR STORYBOARD
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destoryScene", scene )

return scene