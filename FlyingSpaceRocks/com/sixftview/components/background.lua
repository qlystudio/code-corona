local Background = {}

function Background:new()
	local background 
	
	local backgrounds = {"images/stars.png", "images/stars1.png", 
						"images/stars2.png", "images/stars3.png"}
	background = display.newImage(backgrounds[app_data:randomNum(1, table.getn(backgrounds))])
	
--	print("")
	
	return background
end

return Background