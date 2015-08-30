module(..., package.seeall)

function new(text, image_path)
	local group = display.newGroup()
	group.alpha = 0
	local obj
	local value = text
	
	if value ~= nil then
		obj = display.newText(group, 	value, 0, 0, app_data.font_Robofan, 20)
		obj.alpha = 0.5
	elseif image_path ~= nil then
		obj = display.newImage(image_path)
		obj.x = 0
		obj.y = 0
	end
	
	group:insert(obj)
	
	local function onTransitionComplete(event)
		group:removeSelf()
	end
	
	function group:show(xpos, ypos, new_show, new_delay)
		local delay = 1000
		local show_delay = 0
		
		if new_delay ~= nil then delay = new_delay end
		if new_show ~= nill then show_delay = new_show end
		group.x = xpos
		group.y = ypos + 50
		
		transition.to(group, {delay=show_delay, time=500, 
							alpha= 1, y=ypos, transition=easing.outQuad})
		transition.to(group, {time=250, delay=delay, alpha=0, y=ypos+50, 
							transition=easing.outQuad, onComplete=onTransitionComplete})
	end
	
	return group
end