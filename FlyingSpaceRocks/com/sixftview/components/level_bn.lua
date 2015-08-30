
LevelButton = {}

function LevelButton:new(num, locked)
	
	local gtween = require "com.vendor.gtween"
	local level_num
	local txt_level
	local group = display.newGroup()
	
	local myRoundedRect
	
	if locked == true then
		myRoundedRect = display.newImage("images/level-button-locked.png")
	else
		myRoundedRect = display.newImage("images/level-button.png")
	end
	

	group:insert(myRoundedRect)
	
	if num ~= nil and locked == false then
		level_num = num
		txt_level = display.newText(tostring(level_num), 0,0, app_data.font_Teknobe, 25)
		group:insert(txt_level)
		txt_level.x = myRoundedRect.width * 0.5
		txt_level.y = myRoundedRect.height * 0.5
	end
	
	local function onTouch(self, event)
		if event.phase == "began" then
			local e = {name="levelSelected", level=level_num}
			group:dispatchEvent(e)
			return true
		end
	end
	
	if locked == false then
		group.touch = onTouch
		group:addEventListener("touch", group)
	end
	
	return group
end

return LevelButton