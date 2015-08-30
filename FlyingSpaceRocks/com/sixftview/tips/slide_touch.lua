SlideTouch = {}

function SlideTouch:new()
	local group = display.newGroup()
	local tm = require("com.vendor.awesomeTransitionManager")
	local txt_title = display.newText("When the touch destroy icon is flashing you can destroy "..
										"enemies and rocks by tapping them.",
										0, 0, 400, 75, native.systemFont, 15)
	group:insert(txt_title)
	
	local top_right = display.newImage("images/upper_right_display.png")
	top_right.x = 200
	top_right.y = txt_title.y + (txt_title.height + 20)
	group:insert(top_right)
	
	local icon = display.newImage("images/bn_touch_fire.png")
	icon.x = top_right.x 
	icon.y = top_right.y + 20
	icon.alpha = 0
	group:insert(icon)
	
	local function blink()
		tm:newTransition(icon, {time=500, alpha=1})
		tm:newTransition(icon, {delay=500, time=500, alpha=0, onComplete=blink})
	end
	
	function group:clean()
		tm:cancelAllTransitions()
	end
	
	blink()
	return group
end

return SlideTouch