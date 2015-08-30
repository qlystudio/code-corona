Extras = {}

function Extras:new(shield_count, player_count)
	local group = display.newGroup()
	local tm = require("com.vendor.awesomeTransitionManager")
	local s_count = shield_count
	local p_count = player_count
	local current_shield_count = 0
	local current_player_count = 0
	
	local extra_sound = audio.loadSound("sounds/extra.wav", {channel=10})
	
	local extra_man
	local extra_shield

	local manTimer
	local shieldTimer
	local createTimer
	
	local extraBody = {friction=0, bounce=0, density=0, 
						radius=40, filter = { categoryBits = 4, maskBits = 16 }}
						
	local shieldTransition
	local manTransition
	local all_timers = {}			
	
	local function destroyObject(obj)
		createTimer(obj.name)	
		obj.transition:cancel()	
		local e = {name="extraCollected", value=obj.name, x=obj.x, y=obj.y}
		group:dispatchEvent(e)
		obj:removeSelf()
	end

	
	local function onCollision(obj, event)
		if event.phase == "began" and event.other.name == "bullet" then
			local bullet = event.other
			if bullet.active == true then
				print("is active")
				bullet.active = false
				bullet.alpha = 0
				destroyObject(obj)
				audio.play(extra_sound, {channel=11})
			end			
		elseif event.phase == "ended" then
			obj = nil
			if(event.other.name == "bullet") then
				local bullet = event.other
				local function removeBullet( event )
					bullet.x = -5000
				end
				timer.performWithDelay(250, removeBullet, 1)
			end
		end
	end
	
	local function onAnimationComplete(event)
		createTimer(event.name)
		event.target:removeSelf()
		event.target = nil
	end
	
	local function animate(obj)
		obj.x = app_data:randomNum(100, totalHeight - 100)
		local name 
		if obj.name == "man" then
			name = man
		elseif obj.name == "shield" then
			name = "shield"					
		end
		
		local trans = tm:newTransition(obj, 
									{time=10000, y=totalHeight, 
									onComplete=onAnimationComplete
									}, name, obj)
		obj.transition = trans
	end
	
	local function onManTimer(event)
		if current_player_count < p_count then
			extra_man = display.newImage("images/extra_man.png")
			extra_man.name = "man"
			group:insert(extra_man, "static", extraBody)
			physics.addBody(extra_man, extraBody)
			extra_man.isSensor = true
			extra_man.collision = onCollision
			extra_man:addEventListener("collision", extra_man)
			animate(extra_man)
			current_player_count = current_player_count + 1
		end
	end
	
	local function onShieldTimer(event)
		if current_shield_count < s_count then
			extra_shield = display.newImage("images/extra_shield.png")
			extra_shield.name = "shield"
			group:insert(extra_shield, "static", extraBody)
			physics.addBody(extra_shield, extraBody)
			extra_shield.isSensor = true
			extra_shield.collision = onCollision
			extra_shield:addEventListener("collision", extra_shield)
			animate(extra_shield)
			current_shield_count = current_shield_count + 1
		end
	end
	
	createTimer = function(what_timer)
		if what_timer == "man" then
			manTimer = timer.performWithDelay(app_data:randomNum(5000, 90000), onManTimer, 1)
		elseif what_timer == "shield" then
			shieldTimer = timer.performWithDelay(app_data:randomNum(5000, 90000), onShieldTimer, 1)
		end
		
		all_timers = {manTimer, shieldTimer}
	end
	
	local function onTouchDestory(event)
		if event.phase == "began" then
			destroyObject(event.target)
		elseif event.phase == "ended" then
			event.target = nil
		end
	end
	
	function group:addTouchEvents(value)
		for i=1, group.numChildren do
			local obj = group[i]
			if value == true then
				obj:addEventListener("touch", onTouchDestory)
			else
				obj:removeEventListener("touch", onTouchDestory)
			end
		end
	end
	
	function group:pause(value)
		
		if value == true then
			tm:pauseAllTransitions()
		elseif value == false then
			tm:resumeAllTransitions()
		elseif value == "stop" then
			tm:cancelAllTransitions()
		end
		
		for i=1, table.getn(all_timers) do
			local the_timer = all_timers[i]
			if the_timer ~= nil then
				if value == true then
					timer.pause(the_timer)
				elseif value == false then
					timer.resume(the_timer)
				elseif value == "stop" then
					timer.cancel(the_timer)
				end
			end
		end
	end
	
	if p_count > 0 then createTimer("man") end
	if s_count > 0 then createTimer("shield") end
	
	return group
end

return Extras