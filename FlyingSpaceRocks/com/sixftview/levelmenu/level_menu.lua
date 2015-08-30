module (..., package.seeall)

new = function()
	
	physics.start()
	physics.setGravity(0,0)
	
	local RockGroup = require "com.sixftview.components.just_rocks"
	local rock_group

	local gtween = require "com.vendor.gtween"
	local ButtonMenu = require "com.sixftview.levelmenu.button_menu"
	
	local function stopRocks()
		physics.stop()
		rock_group:stopLocationCheck()
		rock_group:removeSelf()
	end
	
	local function onLevelSelected(self, event)
		stopRocks()
		app_data:setCurrentLevel(event.level)
		director:changeScene("com.sixftview.game.game_load", "fade")
	end
	
	local group = display.newGroup()
	local w, h = totalWidth, totalHeight
	
	local stars = display.newImage( "images/stars.png" )
	group:insert(stars)
	
	rock_group = RockGroup:new()
	rock_group.nextLevel = nextLevel
	group:insert(rock_group)
	
	local background = display.newRect(0,0, totalWidth, totalHeight)
	background:setFillColor(0,0,0,65)
	group:insert(background)
	
	local modal = display.newGroup()

	
	local fog = display.newImage( "images/fog_purple.png" )
	fog.x = halfWidth
	fog.y = halfHeight + 50
	
	group:insert(fog)
	
	local buttons = ButtonMenu:new()
	buttons.alpha = 0
	group:insert(buttons)
	
	local function setX(event)
		local menu_half = (470 * 0.5)
		local newx = halfWidth - menu_half
		buttons.x = newx
		
		local screen = 1
		local cur_level = app_data:getCurrentLevel()
		
		if cur_level > 10 and cur_level < 21 then
			newx = newx - totalWidth 
			buttons:setScreenNum(2)
		elseif cur_level > 20  and cur_level < 30 then
			newx = newx - (totalWidth * 2) 
			buttons:setScreenNum(3)
		end
		
		transition.to(buttons, {delay=1000, time=250, alpha=1})
		
		if cur_level > 10 then
			buttons.x = newx
		end
		--buttons.x = newx
	end
	timer.performWithDelay(250, setX, 1)
	
	buttons.y = (halfHeight + 50) - (buttons.height * 0.5)
	buttons.levelSelected = onLevelSelected
	buttons:addEventListener("levelSelected", buttons)
	
	modal:insert(buttons)
	
	local selectTitle = display.newImage("images/select_level_title.png")
	selectTitle.alpha=0
	selectTitle.x = halfWidth
	selectTitle.y = buttons.y - 50
		
	modal:insert(selectTitle)
	
	group:insert(modal)
	local score = tostring(app_data:getOverallHighScore())
	local txt_overall = display.newText("your best overall", centerX, centerY + 
							(buttons.height * 0.65), 
							app_data.font_Robofan, 30)
	txt_overall:setTextColor(127, 110, 129)
	txt_overall.alpha = 0
	modal:insert(txt_overall)
	
	local txt_score = display.newText(score, centerX, totalHeight - 50, 
							app_data.font_Robofan, 25)
	txt_score:setTextColor(255, 191, 251)
	txt_score.alpha = 0
	modal:insert(txt_score)
	
	local function goHome()
		stopRocks()
		director:changeScene("com.sixftview.start.start_view", "fade")
	end
	
	local function settingsClosed()
		if app_data:getResetClicked() == true then
			app_data:setReset(false)
			goHome()
		end
	end
	
	local function bnTouchHandler(event)
		if event.phase == "ended" then
			if event.target.name == "settings" then
				director:openPopUp("com.sixftview.settings.game_settings", settingsClosed)
			elseif event.target.name == "home" then
				goHome()
			elseif event.target.name == "music" then
				director:openPopUp("com.sixftview.settings.music_info")
			end
		end
	end
	
	local bnbackground = display.newRoundedRect(10,10, 160, 60, 10)
	bnbackground:setFillColor(255,255,255,50)
	group:insert(bnbackground)
	
	local bn_house = display.newImage("images/house.png")
	bn_house.x = 40
	bn_house.y = 40
	bn_house.alpha = 0.5
	bn_house.name = "home"
	bn_house:addEventListener("touch", bnTouchHandler)
	
	group:insert(bn_house)
	
	local bn_music = display.newImage("images/106-sliders@2x.png")
	bn_music.x = bn_house.x + (bn_music.width + 20)
	bn_music.y = bn_house.y
	bn_music.alpha = 0.5
	bn_music.name = "music"
	bn_music:addEventListener("touch", bnTouchHandler)
	group:insert(bn_music)
	
	local bn_gear = display.newImage("images/gear.png")
	bn_gear.x = bn_music.x + (bn_gear.width + 20)
	bn_gear.y = bn_music.y
	bn_gear.alpha = 0.5
	bn_gear.name = "settings"
	bn_gear:addEventListener("touch", bnTouchHandler)
	group:insert(bn_gear)
	
	local function onTextDelay(event)
		txt_overall.x = centerX
		txt_score.x = centerX
	end
	
	timer.performWithDelay(250, onTextDelay, 1)
	
	gtween.new(selectTitle, 0.25, {alpha=1}, {delay=0.75})
	gtween.new(buttons, 0.25, {alpha=1}, {delay=0.5})
	
	if score ~= "0" then
		gtween.new(txt_overall, 0.25, {alpha=1}, {delay=0.5})
		gtween.new(txt_score, 0.5, {y=txt_overall.y + 35}, 
			{delay=0.5, ease=gtween.easing.outBack})
		gtween.new(txt_score, 0.75, {alpha=1}, 
			{delay=0.5})
	end
	
	
	
	return group
end