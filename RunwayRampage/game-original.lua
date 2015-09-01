-- REQUIRE PHYSICS ENGINE
local physics = require "physics"
physics.start()

-- REQUIRE SPRITE
-- require "sprite"

-- REQUIRE STORYBOARD
local storyboard = require ("storyboard")
-- REFERS TO SCENE - Event Listener Handler
local scene = storyboard.newScene()


-- CREATE - add variables
function scene:createScene(event)

	local screenGroup = self.view

	-- BASE BG
	local background = display.newImage("images/background/background-charles.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background:scale(1.25,1.25)
	screenGroup:insert(background)


	-- JET SPRITE SHEET
	jetOptions =
	{
	    --required parameters
	    width = 50,
	    height = 17,
	    numFrames = 4
	}

	jetSpriteSheet = graphics.newImageSheet( "jet.png", jetOptions )
	
	sequenceData =
	{
	    name="walking",
	    start=1,
	    count=4,
	    time=1000,
	    loopCount = 0
	}
	
	jet= display.newSprite( jetSpriteSheet, sequenceData )
	jet:scale( 2, 2 )
	jet.x = 200
	jet.y = 200
	jet:play()
	jet.collided = false
	physics.addBody(jet, "dynamic", {density=.1, bounce=0.1, friction=.2, radius=12})
	screenGroup:insert(jet)


	-- EXPLOSION SPRITE SHEET
	exOptions =
	{
	    width = 24,
	    height = 23,
	    numFrames = 8
	}

	explosionSpriteSheet = graphics.newImageSheet( "explosion.png", exOptions )
	
	sequenceData =
	{
	    name="explosion",
	    start=1,
	    count=8,
	    time=2000,
	    loopCount = 1
	}
	
	explosion= display.newSprite( explosionSpriteSheet, sequenceData )
	explosion:scale( 4, 4 )
	explosion.x = 200
	explosion.y = 200
	-- explosion:play()
	explosion.isVisible = false
	screenGroup:insert(explosion)


	-- MINES
	mine1 = display.newImage("mine.png")
	mine1:scale( 2, 2 )
	mine1.x = 1200
	mine1.y = math.random(30, 700)
	mine1.speed = math.random(2,30)
	mine1.initY = mine1.y
	mine1.amp = math.random(20, 100)
	mine1.angle = math.random(1, 360)
	physics.addBody(mine1, "static", {density=.1, bounce=0.1, friction=.2, radius=50})
	screenGroup:insert(mine1)

	-- MINE2
	mine2 = display.newImage("mine.png")
	mine2:scale( 2, 2 )
	mine2.x = 1200
	mine2.y = math.random(30, 700)
	mine2.speed = math.random(2,30)
	mine2.initY = mine2.y
	mine2.amp = math.random(20, 100)
	mine2.angle = math.random(1, 360)
	physics.addBody(mine2, "static", {density=.1, bounce=0.1, friction=.2, radius=50})
	screenGroup:insert(mine2)

	-- MINE3
	mine3 = display.newImage("mine.png")
	mine3:scale( 2, 2 )
	mine3.x = 1200
	mine3.y = math.random(30, 700)
	mine3.speed = math.random(2,30)
	mine3.initY = mine3.y
	mine3.amp = math.random(20, 100)
	mine3.angle = math.random(1, 360)
	physics.addBody(mine3, "static", {density=.1, bounce=0.1, friction=.2, radius=50})
	screenGroup:insert(mine3)

end


-- MINE MOVER
function moveMines(self, event)
	if self.x < -480 then
		self.x = 1200
		self.y = math.random(30, 700)
		self.speed = math.random(2,30)
		self.amp = math.random(20, 100)
		self.angle = math.random(1, 360)
	else
		-- SINE CURVE MOVEMENT
		self.x = self.x-self.speed
		self.angle = self.angle + .1
		self.y = self.amp * math.sin(self.angle)+self.initY
	end
end


-- ADD FORCE ON TOUCH - This affets physics variables
function activateJets(self, event)
	self:applyForce(0, -1.5, self.x, self.y)
end


--ON TOUCH
function touchScreen(event)
	print("touch")
	if event.phase == "began" then
		jet.enterFrame = activateJets
		Runtime:addEventListener( "enterFrame", jet )
	end

	if event.phase == "ended" then 
		print("ended")
		Runtime:removeEventListener( "enterFrame", jet )
	end

end

-- GAME OVER
function gameOver()
	storyboard.gotoScene("restart", "fade", 800)
end


--EXPLODE
function explode()
	-- Make explosion location same as jet
	explosion.x = jet.x
	explosion.y = jet.y
	explosion.isVisible = true
	explosion:play()
	jet.isVisible = false
	timer.performWithDelay( 2000, gameOver,1 )  

	-- gameOver()

end

	
--ON COLLISION
function onCollision(event)
	if event.phase == "began" then
		print("collide!");
		-- GO TO RESTART ON COLLISION
		if jet.collided == false then
			jet.collided = true
			jet.bodyType = "static"
			explode()
			-- storyboard.gotoScene("restart", "fade", 800)
		end
	end
end


-- ENTER - put event listeners, call functions
function scene:enterScene(event)
	-- ADD EVENT LISTENERS

	mine1.enterFrame = moveMines
	Runtime:addEventListener( "enterFrame", mine1 )

	mine2.enterFrame = moveMines
	Runtime:addEventListener( "enterFrame", mine2 )

	mine3.enterFrame = moveMines
	Runtime:addEventListener( "enterFrame", mine3 )

	Runtime:addEventListener( "touch", touchScreen )

	Runtime:addEventListener( "collision", onCollision )

end

-- EXIT
function scene:exitScene(event)

	-- REMOVE EVENT LISTENERS
	Runtime:removeEventListener( "enterFrame", mine1 )
	Runtime:removeEventListener( "enterFrame", mine2 )
	Runtime:removeEventListener( "enterFrame", mine3 )
	Runtime:removeEventListener( "collision", onCollision )
	Runtime:removeEventListener( "touch", touchScreen )

end


function scene:destroyScene(event)

end

-- ADD EVENT LISTNERS FOR STORYBOARD
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destoryScene", scene )

return scene