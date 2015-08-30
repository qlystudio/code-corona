SlideExtras = {}

function SlideExtras:new()
	local group = display.newGroup()
	local txt_title = display.newText("Earn extra lives and force fields by "..
										"shooting them as they appear on screen.",
										0, 0, 400, 75, native.systemFont, 15)
	group:insert(txt_title)	
					
	local player = display.newImage("images/extra_man.png")
	player.x = 150
	player.y = txt_title.y + txt_title.height
	group:insert(player)
	
	local shield = display.newImage("images/extra_shield.png")
	shield.x = 250
	shield.y = txt_title.y + txt_title.height
	group:insert(shield)
	
	function group:clean() end
	
	return group
end

return SlideExtras