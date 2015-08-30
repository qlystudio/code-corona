TouchDestroy = {}

function TouchDestroy:new(value)
	local group = display.newImageRect("images/bn_touch_fire.png", 50, 50)
	local tm = require("com.vendor.awesomeTransitionManager")
	local count = value
	print(count)
	local current_count = 0
	local touchTimer
	local the_time
	local how_many_times = 0
	local is_animating = false

	local function show(event)
		if how_many_times < 10 then
			tm:newTransition(group, {time=500, alpha=1})
			tm:newTransition(group, {delay=500, time=500, alpha=0, onComplete=show})
			how_many_times = how_many_times + 1
			
			if is_animating == false then
				is_animating = true
				local e = {name="touchDestroy", value=true}
				group:dispatchEvent(e)
			end
		else
			current_count = current_count + 1
			if current_count < count then
				how_many_times = 0
				the_time = app_data:randomNum(5000, 90000)
				touchTimer = timer.performWithDelay(the_time, show, 1)				
			end
			
			is_animating = false
			local e = {name="touchDestroy", value=false}
			group:dispatchEvent(e)
		end
	end
	
	function group:pause(value)
			if value == true then
				if touchTimer ~= nil then timer.pause(touchTimer) end
				tm:pauseAllTransitions()
			elseif value == false then
				if touchTimer ~= nil then timer.resume(touchTimer) end
				tm:resumeAllTransitions()
			elseif value == "stop" then
				if touchTimer ~= nil then timer.cancel(touchTimer) end
				tm:cancelAllTransitions()
			end
	end
	
	the_time = app_data:randomNum(5000, 90000)
	touchTimer = timer.performWithDelay(the_time, show, 1)
	
	group.alpha = 0
	return group
end

return TouchDestroy