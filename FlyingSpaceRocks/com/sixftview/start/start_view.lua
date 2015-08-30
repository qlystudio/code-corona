module(..., package.seeall)


function new()
	local RockGroup = require "com.sixftview.components.just_rocks"
	physics.start()
	physics.setGravity(0,0)
	local group
	local stars
	local rock_group
	local welcome_logo
	local frs_logo 
	local learn_txt
	local playnow_txt
	local rec
	local me
	
	local function endStuff()
		physics.stop()
		rock_group:stopLocationCheck()
		rock_group:removeSelf()
	end
	
	local function onPlayTouch(event)
		
		if event.phase == "began" then
			endStuff()
		end
		
		if event.phase == "ended" then
			director:changeScene("com.sixftview.levelmenu.level_menu", "fade")
			--director:changeScene("com.sixftview.components.gameend_view", "fade")
		end
	end
	
	local function onMeTouch(event)
		if event.phase == "began" then
			endStuff()
		end
		if event.phase == "ended" then
			director:changeScene("com.sixftview.splash.splash_view", "fade")
		end
	end
	

	local function onLearnTouch(event)
		if event.phase == "ended" then
			director:openPopUp("com.sixftview.tips.game_tips")
		end
	end
	
	group = display.newGroup()
	
	
	
	stars = display.newImage("images/stars.png")
	stars.x = centerX
	stars.y = centerY
	
	group:insert(stars)
	
	--rocks	
	rock_group = RockGroup:new()
	rock_group.nextLevel = nextLevel
	group:insert(rock_group)
	
	
	frs_logo = display.newImage("images/blasteroids.png")
	frs_logo.x = centerX
	frs_logo.y = centerY - (frs_logo.height * 0.65)
	group:insert(frs_logo)
	
	rec = display.newRoundedRect(0, 0, 300, 150, 10)
	rec:setFillColor(0,0,0, 200)
	rec.x = centerX
	rec.y = centerY + 35
	group:insert(rec)
	
	learn_txt = display.newText( "How To", 0, 0,
	 		app_data.font_Robofan, 30)
	
	learn_txt:setTextColor( 64, 0, 255)
	learn_txt.x = centerX
	learn_txt.y = frs_logo.y + (frs_logo.height * 0.85)
	learn_txt:addEventListener("touch", onLearnTouch)
	group:insert(learn_txt)
	
	
	playnow_txt = display.newText("PLAY NOW", 0,0,
		app_data.font_Robofan, 45)
		
	playnow_txt:setTextColor(37, 188, 36)
	playnow_txt.x = centerX
	playnow_txt.y = learn_txt.y - 50
	
	playnow_txt:addEventListener("touch", onPlayTouch)
	group:insert(playnow_txt)
	
	transition.from(frs_logo, {time=250, alpha=0})
	transition.from(stars, {time=250, alpha=0})
	

	
	return group
end
