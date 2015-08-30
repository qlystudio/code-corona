module(..., package.seeall)

function new()
	physics.start()
	physics.setGravity(0,0)
	
	local group = display.newGroup()
	local Ship = require("com.sixftview.components.ship")
	local Dpad = require("com.sixftview.components.dpad")
	local Bullets = require("com.sixftview.components.bullets")
	local BNFire = require "com.sixftview.components.fire_button"
	local ship
	local shipTimer
	local addbodyTimer
	
	
	local function onFire(bn_fire, event)
		if ship.x ~= nil then
			bullets:shootMissle(ship)
		end
	end
	
	
	bullets = Bullets:new()
	group:insert(bullets)
	
	local function closeTouch(event)
		if event.phase == "ended" then
			if shipTimer ~= nil then timer.cancel(shipTimer) end
			
			if ship.x ~= nil then
				ship:killAll()
				ship:removeSelf()
				ship = nil
			end
			
			director:closePopUp()
			group = nil
		end
	end
	
	local function onDPad (self, event)
		if ship.x ~= nil  then
			ship:thrustAndRotate(event.joyTable)
		end
	end
	
	local function onDied(event)
		
		local function onTimer(event)
			shipTimer = nil
			ship = Ship:new()
			ship:addEventListener("died", onDied)
			group:insert(ship)
		end
		
		shipTimer = timer.performWithDelay(2000, onTimer, 1)
	end
	
	local rec = display.newRect(0,0, totalWidth, totalHeight)
	rec:setFillColor(0,0,0,50)
	group:insert(rec)
	
	local bn_close = display.newImage('images/bn_close.png')
	bn_close.x = totalWidth - 50
	bn_close.y = 50
	bn_close:addEventListener("touch", closeTouch)
	group:insert(bn_close)
	
	local dpad = Dpad:new()
	dpad.x = 10
	dpad.y = totalHeight - (dpad.height + 10)
	dpad.onDPad = onDPad
	dpad:addEventListener("onDPad", dpad)
	
	group:insert(dpad)
	
	
	local bn_fire = BNFire:new()
	bn_fire.fireBullet = onFire
	bn_fire:addEventListener("fireBullet", bn_fire)
	bn_fire.x, bn_fire.y = totalWidth - (bn_fire.width + 10), totalHeight - (bn_fire.height + 10 )
	group:insert(bn_fire)
	
	local function positionControls()
		local controls_setup = app_data:getControlsSetup()
		local dpadX = 10
		local dpadY = totalHeight - (dpad.height + 10)
		
		local fireX = totalWidth - (bn_fire.width + 10)
		local fireY = totalHeight - (bn_fire.height + 10 )
		local fireRotation = 0
		
		if controls_setup ~= "right handed" then
			dpadX = totalWidth - (dpad.width + 10)	
			fireX = bn_fire.width - (bn_fire.width * 0.1)
			fireY = totalHeight - (bn_fire.height * 0.25)
			fireRotation = 200
		end
		
		transition.to(dpad, {time=500, x=dpadX,y=dpadY, transition=easing.outExpo})
		transition.to(bn_fire, {time=500, x=fireX, y=fireY,
			rotation=fireRotation, transition=easing.outExpo})
			
	end
	
	
	ship = Ship:new()
	ship:addEventListener("died", onDied)
	group:insert(ship)
	
	positionControls()
	return group
end