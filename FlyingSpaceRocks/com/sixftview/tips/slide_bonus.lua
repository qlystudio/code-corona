SlideBonus = {}

function SlideBonus:new()
	local group = display.newGroup()
	local txt_title = display.newText("Earn bonus points for each shield and player "..
										"life that you have left at the end of each level.",
										0, 0, 400, 75, native.systemFont, 15)
										
	group:insert(txt_title)
	
	local bonus = display.newImage("images/bonus_points.png")
	bonus.x = 200
	bonus.y = txt_title.y + (txt_title.height + 30)
	group:insert(bonus)
	
	function group:clean()
		
	end
	
	return group
end

return SlideBonus