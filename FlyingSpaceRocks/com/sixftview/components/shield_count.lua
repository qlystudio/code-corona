
ShieldCount = {}

function ShieldCount:new()
	
	local group = display.newGroup()
	local shield = display.newImage("images/shield_small.png")
	local shield_up = audio.loadSound("sounds/shields.wav")

	
	group:insert(shield)
	
	local shield_count = app_data:getShieldCount()
	
	shield.y = 25
	local txt_count = display.newText( shield_count .. " x", 0, 0, app_data.font_Robofan, 14)
	group:insert(txt_count)
	txt_count.x = shield.x - (txt_count.width + 15)
	txt_count.y = 15

	function group:removeFromCount()
		if shield_count > -1 then 
			audio.play(shield_up, {channel=8})
			
			shield_count = shield_count - 1
			local new_txt =  tostring(shield_count) .. " x"
			if shield_count == 0 then
				new_txt = ""
				shield.alpha = 0
			end

			txt_count.text = new_txt
		end
	end
	
	function group:addCount(value)
		shield_count = shield_count + value
		txt_count.text = tostring(shield_count) .. " x"
		if shield_count > 0 then
			shield.alpha = 1
		end
	end
	
	function group:getCount()
		return shield_count
	end
	
	
	
	return group
end

return ShieldCount