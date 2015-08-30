module(..., package.seeall)

function new()
	local group = display.newGroup()
	local Slider = require "org.sixftview.minimalcomps.components.slider"
		
	local function onCloseTouch(event)
		if event.phase == "ended" then
			director:closePopUp()
		end
	end
	
	local background = display.newRect(0,0, totalWidth, totalHeight)
	background:setFillColor(0,0,0,100)
	group:insert(background)
	
	local menu = display.newGroup()
	local menu_back = display.newRect(0,0, halfWidth, halfHeight)
	menu_back.strokeWidth = 1
	menu_back:setFillColor(0,0,0,200)
	menu_back:setStrokeColor(255, 255, 255, 75)
	menu_back.x = centerX
	menu_back.y = centerY
	menu:insert(menu_back)
	
	local bn_close = display.newImage("images/circlex.png")
	bn_close.x = menu_back.x + (menu_back.width * 0.5)
	bn_close.y = menu_back.y - (menu_back.height * 0.5)
	bn_close.alpha = 0.5
	bn_close:addEventListener("touch", onCloseTouch)
	menu:insert(bn_close)
	
	local menuLeft = menu_back.x - (menu_back.width * 0.5)
	local menuTop = menu_back.y - (menu_back.height * 0.5)
	local menuRight = menu_back.x + (menu_back.width * 0.5)
	local menuBottom = menu_back.y + (menu_back.height * 0.5)
	
	local function controlSetupChangeHandler(event)
		app_data:setControls(event.value)
	end

	-- volume controls
	local function sliderListener(event)
		local new_value = event.value / 100
		local id = event.target.name
		
		if id == "sounds" then
			app_data:setGameSoundVolume(new_value)
			sound_track:setGameSoundVolume(new_value)
		elseif id == "tracks" then
			app_data:setTrackVolume(new_value)
			sound_track:setVolume(new_value)
		end
		
	end
	
	local headphone_icon = display.newImage("images/headphones-icon.png")
	headphone_icon.x = menuLeft + 35
	headphone_icon.y = menuTop + 40
	menu:insert(headphone_icon)
	
	local txt_music = display.newText("For extra awesomeness we suggest you wear earphones.", 
		headphone_icon.x + 35, menuTop + 20, 300, 100, native.systemFont, 20)
	menu:insert(txt_music)
	
	local text_credit = display.newText("Background track created and used with permission by Sean Moore. http://soundcloud.com/seantheflexguy.", menuLeft + 35, headphone_icon.y + 70, 350, 200)
		menu:insert(text_credit)
	
	local icon_sean = display.newImage("images/sean_avatar.png")
	icon_sean.x = menuRight - 70
	icon_sean.y = menuTop + 130
	menu:insert(icon_sean)
	
	
	local txt_gamesounds = display.newText("Game Sounds :", menuLeft + 35, 
										menuTop + 200, app_data.font_Robofan, 15)	
	txt_gamesounds:setTextColor(85, 52, 89)
	menu:insert(txt_gamesounds)
	
	local slider_sounds = Slider:new("horizontal", (txt_gamesounds.x  + 10) + 
						(txt_gamesounds.width * 0.5), (txt_gamesounds.y - 7))
	slider_sounds.name = "sounds"
	slider_sounds:setSliderParams(0, 100, app_data:getGameSoundVolume() * 100)
	slider_sounds:addEventListener("change", sliderListener)
	menu:insert(slider_sounds)

	
	local txt_tracks = display.newText("Music Volume :", menuLeft + 28, 
										txt_gamesounds.y + 25, app_data.font_Robofan, 15)
	txt_tracks:setTextColor(85, 52, 89)
	menu:insert(txt_tracks)
	
	local slider_tracks = Slider:new("horizontal", (txt_tracks.x + 10) +  
									(txt_tracks.width * 0.5), (txt_tracks.y - 7))
	slider_tracks.name = "tracks"
	slider_tracks:setSliderParams(0, 100, app_data:getTrackVol() * 100)
	slider_tracks:addEventListener("change", sliderListener)
	menu:insert(slider_tracks)

	group:insert(menu)
	
	
	
	
	
	return group
end

