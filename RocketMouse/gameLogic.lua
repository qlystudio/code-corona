local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local parallaxNode = nil
local player = nil
local rocketFlame = nil
local playerVelocity = 0;
local playerWasFlying = false;
local playerShouldFly = false;
local globalGroup = nil;

local backgroundMusic = nil;
local laserSound = nil;
local coinSound = nil;
local groundSound = nil;
local bunnyHitSound = nil;
local flySound = nil;
local hitObjectSound = nil;
local loseSound = nil;

local scoreText = nil;

local rotatingLasers = nil
--------------------------------------------------------------------------------
local score = 0; --our global score value
function scoreHitAtPosition(position, points)  
    score = score + points;
    scoreText.text = "Score " .. tostring(score);
    
    
    tempPoint = display.newText(tostring(points), 0, 0, native.systemFont, 22)
    tempPoint.x = position.x
    tempPoint.y = position.y
	tempPoint:setTextColor(255, 255, 255)    

    local hideTempText = function( obj )
	    obj:removeSelf()
	end 
	transition.to( tempPoint, { time=1000, alpha=0, x=tempPoint.x, y=tempPoint.y - 50, onComplete=hideTempText } )
    
end
--------------------------------------------------------------------------------
function setupScore()
    score = 0;
    scoreText = display.newText("Score: 0", 0, 0, native.systemFont, 22)
    scoreText:setReferencePoint(display.TopLeftReferencePoint);
    scoreText.x = 40
	scoreText:setTextColor(255, 255, 255)    
    globalGroup:insert(scoreText)
end
--------------------------------------------------------------------------------
local function mouseCoinCollision(event)
 
 	local coin = event.spriteB;
        
    if(nil ~= coin)then
        if(coin.alpha == 1.0)then
	        scoreHitAtPosition({x = coin.x, y = coin.y}, 100);
	        audio.play( coinSound )
        end

        coin.alpha = 0.0;
    end
end
--------------------------------------------------------------------------------
local playerIsDead = false;
local function killPlayer()

	playerVelocity = 0.0;
    playerShouldFly = false;
    playerIsDead = true;
    playerWasFlying = false;
    rocketFlame.alpha = 0;
	player:startAnimationWithUniqueName("mouseDie")
	parallaxNode:setSpeed(0)
	
	local gameOverText = display.newText("Game Over!", 0, 0, native.systemFont, 32)
	gameOverText:setTextColor(255, 0, 0)
	gameOverText.x = display.viewableContentWidth / 2
	gameOverText.y = display.viewableContentHeight /2 - 40

	local restartText = display.newText("Restart", 0, 0, native.systemFont, 24)
	restartText:setTextColor(255, 255, 255)
	restartText.x = display.viewableContentWidth / 2
	restartText.y = display.viewableContentHeight /2
	
	local onRestartTouch = function( event ) 
		if(event.phase == "began")then
			local storyboard = require "storyboard"
			storyboard.gotoScene( "reset" )
			--restartText:removeEventListener( "touch", onRestartTouch )
			Runtime:removeEventListener("touch", restartText);
		end	
	end 
	restartText:addEventListener( "touch", onRestartTouch ) 
	
	globalGroup:insert(gameOverText)
	globalGroup:insert(restartText)
	
	audio.play( loseSound )
end
--------------------------------------------------------------------------------
local lasersThatNeedHandling = {};
local function mouseLaserCollision(event)

	local laser = event.spriteB;

    -- If we make the laser a sensor, the callback will be called only once - at first collision.
    -- This is not good as we want to kill the player when the laser changes to active.
    -- So we make the laser sensor, so that the player and laser don't collide, durring this collision.
    -- Then we keep track of the lasers that needs to change back to not being sensors
    -- and in the enterFrame we set back the lasers to isSensor = false
      
    laser.isSensor = true;  
    lasersThatNeedHandling[#lasersThatNeedHandling+1] = laser;

        
    if(playerIsDead == true)then
        return;
    end

    if(laser:activeFrame() ~= 1)then
	    audio.play( laserSound )
	    killPlayer();
    end

end
--------------------------------------------------------------------------------
function mouseDogCatCollision(event)  

	audio.play( hitObjectSound );

	loader:cancelPreCollisionCallbackBetweenTags(LevelHelper_TAG.PLAYER, LevelHelper_TAG.DOG);
	
	loader:cancelPreCollisionCallbackBetweenTags(LevelHelper_TAG.PLAYER, LevelHelper_TAG.CAT);
	
	killPlayer();
end
--------------------------------------------------------------------------------
function mouseGroundCollision(event)

    if(playerIsDead == true)then
        return;
    end
 
    if(playerWasFlying == true)then
    
    	audio.play(groundSound);
    
 		player:startAnimationWithUniqueName("mouseFall");
 		
		local function onAnimationEnded( event ) 
	 		if(event.phase == "end")then
	 			player:startAnimationWithUniqueName("mouseRun")
	 			player:removeEventListener("sprite", onAnimationEnded);
			end
		end
		player:addEventListener("sprite", onAnimationEnded)
 
    end
    playerWasFlying = false;
end
--------------------------------------------------------------------------------
function mouseBunnyCollision(event)    
    if(playerIsDead)then
        return;
    end
    
    local bunny = event.spriteB;
    
    if(nil ~= bunny)then
    
    	if(bunny.sequence == "bunnyRun")then
	        scoreHitAtPosition({x = bunny.x, y = bunny.y}, 500);
			audio.play(bunnyHitSound);
			bunny:startAnimationWithUniqueName("bunnyDie")
			bunny.lhPathNode:setPaused(true)
        end
        
    end
end
--------------------------------------------------------------------------------
function setupCollisionHandling()

	loader:useLevelHelperCollisionHandling();
	loader:registerBeginOrEndCollisionCallbackBetweenTags(LevelHelper_TAG.PLAYER, LevelHelper_TAG.COIN, mouseCoinCollision);
	loader:registerPreColisionCallbackBetweenTags(LevelHelper_TAG.PLAYER, LevelHelper_TAG.LASER, mouseLaserCollision);
	
	loader:registerPreColisionCallbackBetweenTags(LevelHelper_TAG.PLAYER, LevelHelper_TAG.DOG, mouseDogCatCollision);

	loader:registerPreColisionCallbackBetweenTags(LevelHelper_TAG.PLAYER, LevelHelper_TAG.CAT, mouseDogCatCollision);
	
	loader:registerPreColisionCallbackBetweenTags(LevelHelper_TAG.PLAYER, LevelHelper_TAG.GROUND, mouseGroundCollision);
	
	loader:registerPreColisionCallbackBetweenTags(LevelHelper_TAG.PLAYER, LevelHelper_TAG.ROTATING_LASERS, mouseLaserCollision);

	loader:registerBeginOrEndCollisionCallbackBetweenTags(LevelHelper_TAG.PLAYER, LevelHelper_TAG.BUNNY, mouseBunnyCollision);
	
end
--------------------------------------------------------------------------------
function startPlayerFly()

if(playerIsDead == true)then
	return
end

	playerVelocity = 0.5;
    playerShouldFly = true;
   	rocketFlame.alpha = 1;
   	player:startAnimationWithUniqueName("mouseFly")
end
--------------------------------------------------------------------------------
function cancelPlayerFly()
    playerShouldFly = false;
    rocketFlame.alpha = 0;
    playerWasFlying = true;
    playerVelocity = 0.0;
end
--------------------------------------------------------------------------------
local onTouch = function( event ) 

	if(event.phase == "began")then
		startPlayerFly()
	elseif (event.phase == "ended" or event.phase == "cancelled")then
		cancelPlayerFly()
	end
		
end 
--------------------------------------------------------------------------------
local onEnterFrame = function( event ) 

	if(playerShouldFly == true)then

    	player:applyLinearImpulse(0, -playerVelocity, player.x, player.y);        
 
	    playerVelocity = playerVelocity + 0.01;
 
		audio.play( flySound )
		
    	if(playerVelocity > 1.5)then
        	playerVelocity = 1.5;
        end
	end

	for i=1, #lasersThatNeedHandling do
		lasersThatNeedHandling[i].isSensor = false;
	end
	lasersThatNeedHandling = nil
	lasersThatNeedHandling = {};
	
	for i=1, #rotatingLasers do
		local rotLaser = rotatingLasers[i];
		rotLaser.rotation = rotLaser.rotation+1;
	end

end 
--------------------------------------------------------------------------------
function spriteInParallaxHasReset(sprite)
    if(LevelHelper_TAG.COIN == sprite.lhTag)then
		sprite.alpha = 1;
    elseif(LevelHelper_TAG.BUNNY == sprite.lhTag)then
		sprite:startAnimationWithUniqueName("bunnyRun");
		sprite.lhPathNode:setPaused(false);
    end    
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function scene:enterScene( event )
	globalGroup = self.view
	

local ui = require ("ui")
local physics = require("physics")
local fps = require("fps");
physics.start()
--comment next line to disable debug drawing
physics.setDrawMode( "hybrid" ) 
display.setStatusBar( display.HiddenStatusBar )
physics.setGravity( 0, 10 );


backgroundMusic = audio.loadStream("Music/backgroundMusic.m4a")
laserSound = audio.loadSound("Music/laser.wav")
coinSound = audio.loadSound("Music/coin.wav")
 
groundSound = audio.loadSound("Music/ground.wav")
bunnyHitSound = audio.loadSound("Music/bunnyHit.wav")
flySound = audio.loadSound("Music/fly.wav")
hitObjectSound = audio.loadSound("Music/hitObject.wav")
loseSound = audio.loadSound("Music/lose.wav")

audio.play( backgroundMusic, { channel=1, loops=-1, fadein=5000 })


parallaxNode = nil
player = nil
rocketFlame = nil
playerVelocity = 0;
playerIsDead = false;
playerWasFlying = false;
playerShouldFly = false;
lasersThatNeedHandling = nil
lasersThatNeedHandling = {};
score = 0;

require "LevelHelperLoader"

local animationMgr = LHAnimationsMgr:sharedInstance();
animationMgr:registerAnimationWithNameOnSpriteWithName("mouseFly", "player");
animationMgr:registerAnimationWithNameOnSpriteWithName("mouseDie", "player");
animationMgr:registerAnimationWithNameOnSpriteWithName("mouseFall", "player");

animationMgr:registerAnimationWithNameOnSpritesWithTag("bunnyDie", LevelHelper_TAG.BUNNY);


application.LevelHelperSettings.directorGroup = self.view;
loader = LevelHelperLoader:initWithContentOfFile("level04.plhs")
loader:instantiateObjects(physics)
loader:createPhysicBoundaries(physics)

parallaxNode = loader:parallaxNodeWithUniqueName("Parallax_1")
if(nil == parallaxNode)then  print("Could not find parallax node.") end

parallaxNode:registerSpriteHasMovedToEndListener(spriteInParallaxHasReset)

player = loader:spriteWithUniqueName("player")
if(nil == player)then  print("Could not find player.") end

rocketFlame = loader:spriteWithUniqueName("flame")
if(nil == rocketFlame)then  print("Could not find rocket flame.") end

rocketFlame.alpha = 0 --You can do it in LH, but I do it here so you guys can see it in LH

rotatingLasers = loader:spritesWithTag(LevelHelper_TAG.ROTATING_LASERS);

setupCollisionHandling()

setupScore()

Runtime:addEventListener( "touch", onTouch ) 
Runtime:addEventListener( "enterFrame", onEnterFrame )

end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function scene:exitScene( event )
	local group = self.view
	
	loader:removeSelf()
	loader = nil;
	player = nil;
	Runtime:removeEventListener( "enterFrame", onEnterFrame )
	Runtime:removeEventListener( "touch", onTouch ) 
	physics.stop()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

return scene