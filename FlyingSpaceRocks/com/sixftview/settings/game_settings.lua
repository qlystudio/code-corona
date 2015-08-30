module(..., package.seeall)

function new()
	local group = display.newGroup()
	local ControlsSetup = require "com.sixftview.components.controls_setup"
	local RadioButton = require "org.sixftview.minimalcomps.components.radio_button"
	local ButtonGroup = require "org.sixftview.minimalcomps.components.button_group"
	local widget = require "widget"
	widget.setTheme( "theme_ios" )
	
	local alert
	
	local function onButtonEvent(event)
		print("on button")
	end
	
	local function onCloseTouch(event)
		if event.phase == "ended" then
			director:closePopUp()
		end
	end
	
	local background = display.newRect(0,0, totalWidth, totalHeight)
	background:setFillColor(0,0,0,100)
	group:insert(background)
	
	local menu = display.newGroup()
	local menu_back = display.newRect(0,0, halfWidth, 250)
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
	
	-- controls setup
	local controls_setup = ControlsSetup:new(app_data:getControlsSetup())
	controls_setup.x = menuLeft + 40
	controls_setup.y = menuTop + 20
	controls_setup:addEventListener("controlSetupChange", controlSetupChangeHandler)
	menu:insert(controls_setup)
	
	-- divider
	local line1 = display.newLine(menu, controls_setup.x - 10,
										controls_setup.y + (controls_setup.height + 30),
										controls_setup.x + (controls_setup.width + 30),
										controls_setup.y + (controls_setup.height + 30))
	line1.alpha = 0.25
	menu:insert(line1)
	
	local function onAlertComplete(event)
		if event.action == "clicked" then
			local i = event.index
			if i == 2 then
				app_data:resetGameData()
				app_data:setReset(true) 
				director:closePopUp()
				os.exit()
			end
		end
	end
	
	local function showResetAlert(event)
		if event.phase == "ended" then
			alert = native.showAlert("Reset Game Data",
				"Choosing 'OK' will reset all level scores and heigh score data and the app will close so that you can restart.",
				{"Cancel", "OK"}, onAlertComplete)
		end
	end
	-- reset button
	local bn_reset = display.newGroup()
	local txt_reset = display.newText("Reset Game Data :", 0,2.5, app_data.font_Robofan, 15)
	txt_reset:setTextColor(85, 52, 89)
	local reset_icons = display.newImage("images/bn_reset.png")
	bn_reset:addEventListener("touch", showResetAlert)
	reset_icons.x = 150
	reset_icons.y = 16
	bn_reset:insert(txt_reset)
	bn_reset:insert(reset_icons)
	bn_reset.x = controls_setup.x 
	bn_reset.y = line1.y + 15
	menu:insert(bn_reset)
	
	
	
	local function onRadioChanged(event)
		app_data:setSkillLevel(event.value)
	end
	
	local radio_buttons = display.newGroup()
	menu:insert(radio_buttons)
	
	local txt_skill = display.newText("Skill Level:", 0, 0, app_data.font_Robofan, 15)
	txt_skill:setTextColor(85, 52, 89)
	radio_buttons:insert(txt_skill)
	
	local radio_easy = RadioButton:new(0,35,"Easy")
	radio_buttons:insert(radio_easy)
	
	local radio_dif = RadioButton:new(0,65,"Difficult")
	radio_buttons:insert(radio_dif)
	
	local radio_insane = RadioButton:new(0,95,"Insanity")
	radio_buttons:insert(radio_insane)
	
	
	local radio_group = ButtonGroup:new({radio_easy, radio_dif, radio_insane}, app_data:getSkillLevel())
	radio_group:addEventListener("selectionChanged", onRadioChanged)
	
	radio_buttons.x = controls_setup.x + (controls_setup.width + 60)
	radio_buttons.y = controls_setup.y
	
	group:insert(menu)
	
	
	
	
	
	return group
end

