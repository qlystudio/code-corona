local ControlsSetup = {}

function ControlsSetup:new(current_setup)
	local group = display.newGroup()
	local gtween = require "com.vendor.gtween" 
	
	local setup = "right handed"
	
	local dpad = display.newImage("images/dpad_small.png")
	local bn_fire = display.newImage("images/bn_fire_small.png")
	local arrows = display.newImage("images/arrow_bothways.png")
	
	local title = display.newText("Controls Setup : ", 0, 0, app_data.font_Robofan, 15)
	title:setTextColor(85, 52, 89)
	local title_height = 30
	
	
	group:insert(title)
	group:insert(dpad)
	group:insert(bn_fire)
	group:insert(arrows)
	
	dpad.y = dpad.y + title_height
	dpad.x = dpad.x + title_height
	bn_fire.x = 200 + title_height
	bn_fire.y = group.height * 0.5 + 10
	arrows.x = group.width * 0.5 + (arrows.width * 0.25) + 10
	arrows.y = group.height * 0.5 + 10
	
	
	
	
	
	local function switch()
		local dpadX = dpad.x
		local bnfireX = bn_fire.x
		local bnfireRotation = 0
		
		if setup == "right handed" then
			setup = "left handed"
			dpadX = dpadX + 180
			bnfireX = bnfireX - 180
			bnfireRotation = 90
		elseif setup == "left handed" then
			setup = "right handed"
			dpadX = dpadX - 180
			bnfireX = bnfireX + 180
		end
		
		transition.to(dpad, {time=500, x=dpadX, transition=easing.outExpo})
		transition.to(bn_fire, {time=500, x=bnfireX, 
			rotation=bnfireRotation, transition=easing.outExpo})
		local e = {name="controlSetupChange", value=setup}
		group:dispatchEvent(e)
	end
	
	local function touchHandler(event)
		if event.phase == "ended" then
			switch()
		end
	end
	
	arrows:addEventListener("touch", touchHandler)
	
	
	if current_setup == "left handed" then
		switch()
	end
	
	
	return group
end

return ControlsSetup