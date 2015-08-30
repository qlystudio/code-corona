module(..., package.seeall)

function new()
	local group = display.newGroup()
	local cur_level = app_data:getCurrentLevel()
	local RockGroup = require "com.sixftview.components.just_rocks"
	local Background = require "com.sixftview.components.background"
	local back
	local stars
	local rock_group
	local welcome_logo
	local frs_logo 
	local learn_txt
	local playnow_txt
	local rec
	local me

	local skill_level = app_data:getSkillLevel()

	physics.start()
	physics.setGravity(0,0)

	local function onAlertComplete(event)
		if event.action == "clicked" then
			local i = event.index 
			if i == 1 then
				os.exit()
			else 
				director:changeScene("com.sixftview.start.start_view", "fade")
			end
		end
	end

	local function onBNTouch(event)
		if event.phase == "began" then
			local name = event.target.name
			app_data:setCurrentLevel(1)
			if name == "yes" then
				skill_level = skill_level + 1
				if skill_level > 3 then skill_level = 3 end
				app_data:setSkillLevel(skill_level)
				director:changeScene("com.sixftview.start.start_view", "fade")
			elseif name == "no" then
				alert = native.showAlert("Start Game Over", 
					"Click OK to Play Again",
					{"Quit", "OK"}, onAlertComplete)
			end
		end
	end
	
	local function endStuff()
		physics.stop()
		rock_group:stopLocationCheck()
		rock_group:removeSelf()
	end

	back = Background:new()
	group:insert(back)

	local congrats_txt = display.newText("Congratulations!", 
							0,0, app_data.font_Robofan, 60)
		
	congrats_txt:setTextColor(37, 188, 36)
	congrats_txt.x = centerX
	congrats_txt.y = centerY - 100
	
	--playnow_txt:addEventListener("touch", onPlayTouch)
	group:insert(congrats_txt)

	local score = tostring(app_data:getOverallHighScore())
	local overall_txt = display.newText("Your Heigh Score: " ..
		 			score, 0, 0, app_data.font_TektonPro, 40)
	overall_txt:setTextColor(255, 191, 251)
	overall_txt.x = centerX
	overall_txt.y = congrats_txt.y + (congrats_txt.height + 20)
	group:insert(overall_txt)

	local back_startover = display.newRoundedRect(0, 0, halfWidth + 200, 60, 10)
	back_startover.strokeWidth = 1
	back_startover:setFillColor(0, 0, 0, 130)
	back_startover:setStrokeColor(255, 191, 251)
	back_startover.x = centerX + 30
	back_startover.y = overall_txt.y + 80

	local start_overtxt = display.newText("Play again with" ..
	 						" increased difficulty level?", 
					0, 0, app_data.font_TektonPro, 30)
	start_overtxt.x = centerX - 50
	start_overtxt.y = overall_txt.y + 80
	group:insert(start_overtxt)

	local bn_yes = display.newText("YES", 0, 0, 
					app_data.font_TektonPro, 40)
	bn_yes:setTextColor(37, 188, 36)
	bn_yes.x = start_overtxt.x + ((start_overtxt.width * 0.5) + 60)
	bn_yes.y = start_overtxt.y
	bn_yes.name = "yes"
	group:insert(bn_yes)

	bn_yes:addEventListener("touch", onBNTouch)

	local bn_no = display.newText("NO", 0, 0, 
					app_data.font_TektonPro, 40)
	bn_no:setTextColor(130, 72, 152)
	bn_no.x = bn_yes.x + ((bn_yes.width * 0.5) + 50)
	bn_no.y = start_overtxt.y
	bn_no.name = "no"
	group:insert(bn_no)

	bn_no:addEventListener("touch", onBNTouch)

	return group
end
