module(..., package.seeall)

local self = display.newGroup()
local floor = math.floor

new = function( params )
	
	physics.start( true )
	--physics.setDrawMode( "hybrid" )
	
	self._level = Level:new( self )
	self._player = Player:new( self )
	self._hud = Hud:new( self )
	
	Runtime:addEventListener( "tap", self )
	Runtime:addEventListener( "touch", self )
	Runtime:addEventListener( "enterFrame", self )
	Runtime:addEventListener( "newLevelSectionCreated", self )
	Runtime:addEventListener( "zapperHit", self )
	Runtime:addEventListener( "coinHit", self )
	Runtime:addEventListener( "laserHit", self )
	Runtime:addEventListener( "missileHit", self )
	Runtime:addEventListener( "playerFalling", self )
	Runtime:addEventListener( "playerDead", self )
	
	self._distance = 0
	self._collectedStars = 0
	self._hitZappers = 0
	self._hitMissiles = 0
	self._hitLasers = 0
	self._totalFrames = 0
	
	self._hud:setBestDistanceText( records:retrieve( "bestDistance" ) )
	
	self:pause()
	
	return self
	
end

function self:tap( event )
	if self._isPaused then
		self:resume()
	end
end

function self:touch( event )
	if not self._isPaused then
		if self._player then self._player:touch( event ) end
	end
end

function self:enterFrame( event )

	if not self._isPaused then
	
		self._totalFrames = self._totalFrames + 1
		
		if self._player and self._level then 
			
			self._player:enterFrame( event ) 

			if self._player:hasReachedStartingPoint() then
				self._level:startMoving()
			end
			
			self._level:enterFrame( event ) 
			self._distance  = floor( ( ( self._level:getSpeed() / 2 ) * self._totalFrames ) / 10 )
			self._hud:setDistanceText( self._distance  )
			
		end
		
	end
end

function self:newLevelSectionCreated( event )
	self._player:toFront()
end

function self:endGame()
	
	self._player:kill()
	self._player:getVisual().isVisible = false
	
	records:store( "lastGame", { stars = self._collectedStars, distance = self._distance } )
	records:storeIfHigher( "bestCoins", self._collectedStars )
	records:storeIfHigher( "bestDistance", self._distance )
	records:save()
	
	
	self:cleanUp()
	--self:pause()
	director:changeScene( "screen_MainMenu" )
	
end

function self:zapperHit()
	self:endGame()
end

function self:coinHit()
	self._collectedStars = self._collectedStars + 1
	self._hud:setScoreText( self._collectedStars )
end

function self:laserHit()
	self:endGame()
end

function self:missileHit()
	self:endGame()
end

function self:playerFalling()
	self._level:playerFalling()
end

function self:playerDead()
	self:endGame()
end

function self:restart()

	self._level:restart()
	self._player:restart()
	self._hud:restart()
	
	self._distance = 0
	self._collectedStars = 0
	self._hitZappers = 0
	self._hitMissiles = 0
	self._hitLasers = 0
	self._totalFrames = 0
	
	self:resume()
	
end

function self:pause()
	physics.pause()
	self._isPaused = true
	self._hud:gamePaused()
end

function self:resume()
	physics.start( true )
	self._isPaused = false
	self._hud:gameResumed()
end

function self:cleanUp()
	Runtime:removeEventListener( "tap", self )
	Runtime:removeEventListener( "touch", self )
	Runtime:removeEventListener( "enterFrame", self )
	Runtime:removeEventListener( "newLevelSectionCreated", self )
	Runtime:removeEventListener( "zapperHit", self )
	Runtime:removeEventListener( "coinHit", self )
	Runtime:removeEventListener( "laserHit", self )
	Runtime:removeEventListener( "missileHit", self )
	Runtime:removeEventListener( "playerFalling", self )
	Runtime:removeEventListener( "playerDead", self )
	self._level:cleanUp()
	self._player:cleanUp()
	self._hud:cleanUp()
end