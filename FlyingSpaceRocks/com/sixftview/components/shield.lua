
local Shield = {}

function Shield:new(ship)
	local spriteData = require("com.sixftview.sprites.shield_spritesheet").getSpriteSheetData()
	local sheet = sprite.newSpriteSheetFromData("shield.png",
	 											spriteData)
	local spriteSet = sprite.newSpriteSet(sheet, 1, 150)
	
	
	local shield = sprite.newSprite(spriteSet)
	shield.health = 10
	
	local sheildTimer
	local onEnter
	local onCollision
	
	local function removeShield()
		local e = {name="shieldRemoved", value=""}
		shield:dispatchEvent(e)
		
		Runtime:removeEventListener("enterFrame", onShipEnter)
		shield:removeSelf()
		--timer:cancel(shieldTimer)
	end
	
	local function onShieldTimer(event)
		removeShield()
	end
	
	local onShipEnter = function(event)
		if ship.x ~= nil and shield ~= nil then
			shield.x = ship.x
			shield.y = ship.y
		end
	end
	
	onCollision = function(event)
		local other = event.other
		if event.phase == "began" and other.name == "bullet" then
			--other.alpha = 0
			
		elseif event.phase == "ended" and other.name == "bullet" then
			
			local function onbulletEndTimer(event)
				other.x = -20000
			end
			
			timer.performWithDelay(250, onbulletEndTimer, 1)
		end
	end
	
	shieldTimer = timer.performWithDelay(7500, onShieldTimer, 1)
	
	Runtime:addEventListener("enterFrame", onShipEnter)
	shield:addEventListener("collision", onCollision)
	
	shield:play()
	local shieldBody = {density=1, friction=5, bounce=1.5, radius = 50, 
						filter={categoryBits=18, maskBits=10}}
	physics.addBody(shield, "static", shieldBody)
	
	function shield:pauseStuff(value)
		
		if value == true then
			shield:pause()
			Runtime:removeEventListener("enterFrame", onShipEnter)
			shield:removeEventListener("collision", onCollision)
			
			timer.pause(shieldTimer)
		else
			shield:play()
			Runtime:addEventListener("enterFrame", onShipEnter)
			shield:addEventListener("collision", onCollision)
			timer.resume(shieldTimer)
		end
	end
	
	transition.from(shield, {time=500, alpha=0})
	return shield
end

return Shield