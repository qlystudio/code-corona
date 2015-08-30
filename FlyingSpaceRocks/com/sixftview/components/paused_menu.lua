module(..., package.seeall)

function new()
	local group = display.newGroup()
	local Stars = require "com.sixftview.components.stars"
	local cur_level = app_data:getCurrentLevel()
	
	local function onButtonTouch(event)
		if event.phase == "began" then
			local tar_name = event.target.name
			if tar_name == "next" then
				app_data:setCurrentLevel( cur_level + 1)
				director:closePopUp()
			elseif tar_name == "replay" then
				app_data:setReload(true)
				director:closePopUp()
			elseif tar_name == "menu" then
				app_data:setReload(true)
				app_data.goto_menu = true
				director:closePopUp()
			elseif tar_name == "resume" or tar_name == "settings" or tar_name == "audio" then
				
				if tar_name == "settings" then
					app_data.show_settings = true
				elseif tar_name == "audio" then
					app_data.show_audio = true
				end
				
				director:closePopUp()
			end
		end
	end
		 
	local background = display.newRect(0,0, totalWidth, totalHeight)
	background:setFillColor(0,0,0,175)
	group:insert(background)
	
	local menu = display.newGroup()
	local menu_back = display.newImage("images/background_nxtlevel.png")
	
	
	
	local bn_next = display.newImage("images/bn_next.png")
	bn_next.name = "next"
	bn_next.x = 85
	bn_next.y = 40
	
	local stars = Stars:starRating( cur_level )
	stars:createStars()

	stars.alpha = 0

	if stars:getRating() >= 3 then
		bn_next:addEventListener("touch", onButtonTouch)
	else
		bn_next.alpha = 0.5
	end
	
	local bn_replay = display.newImage("images/bn_replay.png")
	bn_replay.name = "replay"
	bn_replay.x = bn_next.x
	bn_replay.y = bn_next.y + bn_next.height + 13
	bn_replay:addEventListener("touch", onButtonTouch)
	
	local bn_menu = display.newImage("images/bn_menu.png")
	bn_menu.name = "menu"
	bn_menu.x = bn_next.x
	bn_menu.y = bn_replay.y + bn_replay.height + 13
	bn_menu:addEventListener("touch", onButtonTouch)
	
	local resume_txt = display.newText( "Resume Game", 0, 0,
	 		app_data.font_Robofan, 20)
	resume_txt.name = "resume"
	resume_txt.x = bn_next.x + bn_next.width + 20
	resume_txt.y = bn_next.y
	resume_txt:addEventListener("touch", onButtonTouch)
	
	local bn_play = display.newImage("images/play_arrow.png")
	bn_play.y = resume_txt.y + 2
	bn_play.x = resume_txt.x + (resume_txt.width * 0.65)
	
	local settings_txt = display.newText( "Game Settings", 0, 0,
	 		app_data.font_Robofan, 20)
	settings_txt.name = "settings"
	settings_txt.x = bn_next.x + bn_next.width + 20
	settings_txt.y = bn_replay.y
	settings_txt:addEventListener("touch", onButtonTouch)
	
	local bn_settings = display.newImage("images/19-gear.png")
	bn_settings.x = settings_txt.x + (settings_txt.width * 0.65)
	bn_settings.y = settings_txt.y + 2
	
	local audio_text = display.newText( "Audio Settings", 0, 0,
	 		app_data.font_Robofan, 20)
	audio_text.name = "audio"
	audio_text.x = bn_next.x + bn_next.width + 20
	audio_text.y = bn_menu.y 
	audio_text:addEventListener("touch", onButtonTouch)
	
	local audio_icon = display.newImage("106-sliders.png")
	audio_icon.x = audio_text.x + (audio_text.width * 0.65)
	audio_icon.y = audio_text.y + 2
	
	menu:insert(menu_back)
	menu:insert(bn_next)
	menu:insert(bn_replay)
	menu:insert(bn_menu)
	menu:insert(resume_txt)
	menu:insert(bn_play)
	menu:insert(settings_txt)
	menu:insert(bn_settings)
	menu:insert(audio_text)
	menu:insert(audio_icon)
	
	
	menu.x = halfWidth - (menu.width * 0.5)
	menu.y = halfHeight - (menu.height * 0.5)
	--star rating
	group:insert(menu)
	
	-- best score on level
	
	-- back to main menu
	
	-- replay current level
	
	-- go to next level
	
	
	return group
end