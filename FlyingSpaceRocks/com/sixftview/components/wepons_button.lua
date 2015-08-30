local WeponsButton = {}


function WeponsButton:new()
	local nuke_sound = audio.loadSound("sounds/nuke.wav")
	local nuke_sound2 = audio.loadSound("sounds/nuke2.wav")
	local button = display.newImageRect("images/bn_nuke.png", 50, 50)
	button.alpha = 0
	
	local bnTimer
	local limit = 5
	local count = 0
	local activate 
	
	local function onButtonTouch(event)
		if event.phase =="began" then
			local e = {name="nuke", something=""}
			button:dispatchEvent(e)
			audio.play(nuke_sound, {channel=11})
			audio.play(nuke_sound2, {channel=10})
		elseif event.phase == "ended" then
			button:removeEventListener("touch", onButtonTouch)
			transition.to(button, {time=1000, alpha=0})
			if count < limit then
				bnTimer = timer.performWithDelay(app_data:randomNum(10000, 90000), activate, 1)
			else
				bnTimer = nil
			end
		end
		
	end
	
	activate = function(event)
		button:addEventListener("touch", onButtonTouch)
		transition.to(button, {time=500, alpha=0.75})
		count = count + 1
	end

	bnTimer = timer.performWithDelay(app_data:randomNum(10000, 30000), activate, 1)
	
	function button:pause(value)
		if bnTimer ~= nil then
			if value == true then
				timer.pause(bnTimer)
			elseif value == false then
				timer.resume(bnTimer)
			elseif value == "stop" then
				timer.cancel(bnTimer)
			end
		end
	end
	
	return button
end
return WeponsButton