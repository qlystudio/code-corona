
Ship = {}

function Ship:new()
	local physicsData = (require "com.sixftview.components.physics_objects").physicsData()
	local gtween = require "com.vendor.gtween"
	local explotion = audio.loadSound("sounds/ship_blowup.wav")
	
	local ship
	local shipTimer
	local Shield = require "com.sixftview.components.shield"
	local shield 
	local isPaused = false
	local addBodyTimer
	local addBody
	
	local speedX = 0
	local speedY = 0
	local velocity = 0.8
	local speed = 0.005
	local ship_sin = 0
	local ship_cos = 0
	local tweens = {}
	
	
	local function checkLocation(event)
		if(ship.x ~= nil) then
			if (ship.x > totalWidth) then
				ship.x = 0 ;
			end
			if (ship.x < 0 - ship.width) then
				ship.x = totalWidth - ship.width 
			end
			if (ship.y > totalHeight) then
				ship.y = 0 - ship.height;
			end
			if (ship.y < 0 - ship.height) then
				ship.y = totalHeight - ship.width 
			end
		else
			timer.cancel(event.source)
		end
	end

	local function onCollision(self, event)	
		local obj = event.other
		if(event.phase == "began") then
			local e = {name="died", something=""}
			
			if obj.active ~= nil and obj.active == true then
				obj.active = false
				obj.alpha = 0
			end
			
			for i=1, table.getn(tweens) do
				local t = tweens[i]
					
					if(t ~= nil) then
						t:toEnd()
					end

					t = nil
			end
			
			ship:dispatchEvent(e)
			display.remove(ship)
			audio.play(explotion, {channel=3})
		elseif(event.phase == "ended") then
			local function onshiptimer(event)
				ship = nil
				
				if obj.active ~= nil and obj.active == false then
					obj.x = -5000
				end
			end
			timer.performWithDelay(250, onshiptimer, 1)
		end
	end
	
	local function applyRotation(joyX)	
		if ship.rotation ~= nil then
			local new_rotation = ship.rotation
			
			if(joyX < -0.2) then
				new_rotation = ship.rotation - (-20 * joyX)
			elseif(joyX > 0.2) then
				new_rotation = ship.rotation + (20 * joyX)

			end
			table.insert(tweens, gtween.new(ship, 0.2, {rotation=new_rotation}))
		end
	end
	
	local function applyThrust(joyY)
		ship_sin = (math.sin(ship.rotation*(math.pi/180)))
		ship_cos = (math.cos(ship.rotation*(math.pi/180)))
		
		if joyY > velocity or joyY < -velocity then
			if joyY > velocity then
				speedX = -speed * ship_sin
				speedY = speed * ship_cos
			elseif joyY < -velocity then
				speedX = speed * ship_sin
				speedY = -speed * ship_cos
			end
			
			if ship.angularVelocity == nil then 
				addBody() 
				if addBodyTimer ~= nil then
					timer.cancel(addBodyTimer)
					addBodyTimer = nil
				end
			end
			
			ship:applyLinearImpulse(speedX, speedY, ship.x, ship.y)
		end
	end
	
	ship = display.newImage("images/ship1.png")
	ship.name = "ship"
	ship.x = app_data:randomNum(centerX - (halfWidth * 0.5), centerX + (halfWidth * 0.5))
	ship.y = app_data:randomNum(centerY - (halfHeight * 0.5), centerY + (halfHeight * 0.5))
	
	addBody = function(event)
		if ship ~= nil and ship.angularVelocity == nil then
			if addBodyTimer ~= nil then addBodyTimer = nil end
			
			physics.addBody( ship, physicsData:get("ship1"))
			ship.isSensor = true

			for i=0, 10 do
				applyThrust(-0.9)
			end
		end	
	end
	
	
	
	function ship:thrustAndRotate( joyVector )
		applyRotation(joyVector.joyX)
		applyThrust(joyVector.joyY)
	end
	
	ship.collision = onCollision
	ship:addEventListener("collision", ship)
	
	local function onShieldRemoved(event)
		shield:removeEventListener("shieldRemoved", onShieldRemoved)
		shield = nil
	end
	
	function ship:createShield()
		local container = ship.parent
		shield = Shield:new(ship)
		container:insert(shield)
		
		shield:addEventListener("shieldRemoved", onShieldRemoved)
	end
	
	function ship:killAll()
		if shipTimer ~= nil then timer.cancel(shipTimer) end
		if addBodyTimer ~= nil then timer.cancel(addBodyTimer) end
	end
	
	local function onTouch(event)
	
		if shield == nil and isPaused == false then
			local shield_count = app_data:getShieldCount()

			if shield_count > 0 and event.phase == "began" then
				ship:createShield()
				
				local e = {name="onShield", value=""}
				ship:dispatchEvent(e)
			end
		end
	end
	
	function ship:shieldsUp()
		if shield == nil and isPaused == false then
			local shield_count = app_data:getShieldCount()

			if shield_count > 0 then
				ship:createShield()
				
				local e = {name="onShield", value=""}
				ship:dispatchEvent(e)
			end
		end
	end
	
	function ship:pause(value)
		isPaused = value
		if isPaused == true then
			timer.pause(shipTimer)
		else
			timer.resume(shipTimer)
		end
		
		if shield ~= nil then 
			shield:pauseStuff(isPaused)
		end
	end
	
	ship:addEventListener("touch", onTouch)
	
	shipTimer = timer.performWithDelay(1000, checkLocation, 0)
	addBodyTimer = timer.performWithDelay(10000, addBody, 1)
	
	local function fade()
		if ship ~= nil and ship.angularVelocity == nil then
			gtween.new(ship, 1, {alpha=0.25})
			gtween.new(ship, 1, {alpha=1}, {delay=1, onComplete=fade})
		end
	end
	
	fade()
	
	return ship
end

return Ship