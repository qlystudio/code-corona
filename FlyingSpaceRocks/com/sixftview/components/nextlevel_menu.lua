module(..., package.seeall)

function new()
	local group = display.newGroup()
	local Stars = require "com.sixftview.components.stars"
	local cur_level = app_data:getCurrentLevel()
	local gtween = require "com.vendor.gtween"
	
	local function onButtonTouch(event)
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
			end
	end
		 
	local background = display.newRect(0,0, totalWidth, totalHeight)
	background:setFillColor(0,0,0,175)
	group:insert(background)
	
	local menu = display.newGroup()
	local menu_back = display.newImage("images/background_nxtlevel.png")
	
	local txt_stars = display.newText("stars: ", 25, 70, app_data.font_TektonPro, 20)
	txt_stars:setTextColor(62, 3, 64)
	
	local stars = Stars:starRating( cur_level )
	stars:createStars()
	stars.x = txt_stars.x + 40
	stars.y = txt_stars.y - 2
	
	
	local bn_next = display.newImage("images/bn_next.png")
	bn_next.name = "next"
	bn_next.x = 260
	bn_next.y = 40
	
	if stars:getRating() >= 3 and cur_level < app_data.level_total then
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
	
	local txt_levelinfo = display.newText(cur_level .. "   " .. app_data.level_total, 
							18,0, app_data.font_Teknobe, 60)
	txt_levelinfo.y =  -(txt_levelinfo.height * 0.1)
	txt_levelinfo:setTextColor(251, 254, 2)
	
	local txt_of = display.newText("of", 57, -30, app_data.font_Teknobe, 35)
	txt_of:setTextColor(251, 254, 2)
	
	local score = app_data:getLevelData(cur_level ).score
	local txt_score = display.newText("score: "..score, 25, 30, app_data.font_TektonPro, 20)
	txt_score:setTextColor(62, 3, 64)
	
	local heigh_score = app_data:getLevelData(cur_level).heigh_score
	local txt_heigh_score = display.newText("heigh score: "..heigh_score, 25, 110, 
											app_data.font_TektonPro, 16)
	txt_heigh_score:setTextColor(62, 3, 64, 204)
	
	
	menu:insert(menu_back)
	menu:insert(txt_levelinfo)
	menu:insert(txt_of)
	menu:insert(txt_score)
	menu:insert(txt_stars)
	menu:insert(stars)
	menu:insert(txt_heigh_score)
	menu:insert(bn_next)
	menu:insert(bn_replay)
	menu:insert(bn_menu)
	
	
	menu.x = halfWidth - (menu.width * 0.5)
	menu.y = halfHeight - (menu.height * 0.5)
	
	local score = tostring(app_data:getOverallHighScore())
	local txt_overall = display.newText("your best overall", centerX, centerY + 
							(menu.height), 
							app_data.font_Robofan, 25)
	txt_overall:setTextColor(127, 110, 129)
	txt_overall.alpha = 0
	
	local txt_score = display.newText(score, centerX, totalHeight - 50, 
							app_data.font_Robofan, 20)
	txt_score:setTextColor(255, 191, 251)
	txt_score.alpha = 0
	--star rating
	group:insert(menu)
	group:insert(txt_overall)
	group:insert(txt_score)
	
	local function showHighScore(event)
		txt_overall.x = centerX
		txt_overall.y = centerY + (menu.height * 0.5)
		txt_score.x = centerX
		
		gtween.new(txt_overall, 0.5, {alpha=1})
		gtween.new(txt_score, 1, {alpha=1})
		gtween.new(txt_score, 0.5, {y=txt_overall.y + 30}, {ease=gtween.easing.outBack})
	end
	
	timer.performWithDelay(250, showHighScore, 1)
	
	-- best score on level
	
	-- back to main menu
	
	-- replay current level
	
	-- go to next level
	
	
	return group
end