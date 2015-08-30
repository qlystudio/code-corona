
LivesCount = {}

function LivesCount:new()
	
	local group = display.newGroup()
	
	local ship = display.newImage("images/ship_small.png")
	
	group:insert(ship)
	ship.y = 20
	
	local player_count = app_data.life_count
	local txt_count = display.newText( app_data.life_count .. " x", 0, 0,
	 		app_data.font_Robofan, 14)
	txt_count.x = ship.x - txt_count.width
	txt_count.y = 10
	
	group:insert(txt_count)
	
	ship.x = 25

	function group:removeLife()
		player_count = player_count - 1
		local new_txt =  tostring(player_count) .. " x"
	
		if player_count == 0 then
			new_txt = ""
			ship:removeSelf()
		end
		
		--game over
		if player_count < 0 then
			new_txt = ""
			local e = {name="gameOver"}
			group:dispatchEvent(e)
		end
		
		txt_count.text = new_txt
	end
	
	function group:playerUp(value)
		player_count = player_count + value
		txt_count.text = tostring(player_count) .. " x"
	end
	
	function group:getCount()
		return player_count
	end
	
	return group
end

return LivesCount