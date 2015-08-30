SlideController = {}

function SlideController:new()
	local group = display.newGroup()
	local tm = require("com.vendor.awesomeTransitionManager")
	local tran = 1
	
	local txt_title = display.newText("Use the dpad to rotate and control your ship",
										0, 0, native.systemFont, 20)
	group:insert(txt_title)
	local dpad_start = display.newImage("images/dpad_small.png")
	dpad_start.x = 125
	dpad_start.y = 10 + dpad_start.height
	group:insert(dpad_start)
	
	local dpad = display.newImage("images/dpad_left.png")
	dpad.x = 125
	dpad.y = 10 + dpad.height
	dpad.alpha = 0
	group:insert(dpad)
	
	local ship = display.newImage("images/ship1.png")
	ship.x = dpad.x + (125 + ship.width)
	ship.y = dpad.y
	group:insert(ship)
	
	local function animate()
		if ship.y ~= nil then
			if tran == 1 then
				tran = 2
				dpad.rotation = 0
				ship.y = dpad.y
				tm:newTransition(dpad, {delay=2000, time=0, alpha=1})
				tm:newTransition(dpad_start, {delay=2000, time=0, alpha=0})
				tm:newTransition(ship, { delay=2000, time=2000, rotation=360, onComplete=animate})
			elseif tran == 2 then
				tran = 3
				dpad.rotation = 180
				ship.rotation = 0
				tm:newTransition(ship, {time=2000, rotation= -360, onComplete=animate})
			elseif tran == 3 then
				tran = 4
				dpad.rotation = 90
				ship.rotation=0
				tm:newTransition(ship, {time=2000, y= ship.y - ship.width, onComplete=animate})
			elseif tran == 4 then
				tran = 1
				dpad.rotation = -90
				tm:newTransition(dpad, {delay=2000, time=0, alpha=0})
				tm:newTransition(dpad_start, {delay=2000, time=0, alpha=1})
				tm:newTransition(ship, {time=2000, y= ship.y + ship.width, onComplete=animate})
			end
		end
		
	end
	
	function group:clean()
		tm:cancelAllTransitions()
	end
	
	animate()
	return group
end

return SlideController