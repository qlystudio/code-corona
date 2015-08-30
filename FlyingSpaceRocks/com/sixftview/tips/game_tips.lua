module(..., package.seeall)

function new()
	local group = display.newGroup()
	local tm = require("com.vendor.awesomeTransitionManager")
	local RadioButton = require "org.sixftview.minimalcomps.components.radio_button"
	local BGroup = require "org.sixftview.minimalcomps.components.button_group"
	local slides = {"com.sixftview.tips.slide_controller", "com.sixftview.tips.slide_touch",
					"com.sixftview.tips.slide_extras", "com.sixftview.tips.slide_bonus"}
					
	local slide_count = app_data:randomNum(1, table.getn(slides))
	local theTimer
	local switch
	local b_group 
	local test
	
	local function onCloseTouch(event)
		if event.phase == "ended" then
			local function onTransComplete()
				tm:cancelAllTransitions()
				if slide ~= nil then
					slide:clean()
					slide:removeSelf()
					slide = nil
					Slide = nil
				end
				timer.cancel(theTimer)
				director:closePopUp()
			end
			transition.to(group, {time=250, alpha=0, onComplete=onTransComplete})
		end
	end

	local Slide
	local slide 
	
	local background = display.newRect(0,0, totalWidth, totalHeight)
	background:setFillColor(0,0,0,150)
	group:insert(background)
	
	local menu = display.newGroup()
	local menu_back = display.newRect(0,0, halfWidth, 300)
	menu_back.strokeWidth = 1
	menu_back:setFillColor(0,0,0,200)
	menu_back:setStrokeColor(255, 255, 255, 75)
	menu_back.x = centerX
	menu_back.y = centerY
	menu:insert(menu_back)
	
	local menu_left = menu_back.x - (menu_back.width * 0.5)
	local menu_top = menu_back.y - (menu_back.height * 0.5)
	
	local bn_close = display.newImage("images/circlex.png")
	bn_close.x = menu_back.x + (menu_back.width * 0.5)
	bn_close.y = menu_back.y - (menu_back.height * 0.5)
	bn_close.alpha = 0.5
	bn_close:addEventListener("touch", onCloseTouch)
	menu:insert(bn_close)
	
	local radio_buttons = display.newGroup()
	group:insert(radio_buttons)
	
	local radio_array = {}
	for i=1, table.getn(slides) do
		local radioX = 35 * i
		local radio = RadioButton:new(radioX, 0, "")
		radio.num = i
		radio_buttons:insert(radio)
		
		radio_array[i] = radio
	end
	
	radio_buttons.x = centerX - (radio_buttons.width * 0.75)
	radio_buttons.y = menu_top + (menu_back.height - 35)
	
	local function onRadioChanged(event)
		if theTimer ~= nil then timer.cancel(theTimer) end
		switch(event.value)
	end
	
 	switch = function(value)
		if value ~= nil then
			slide_count = value
		else 
			slide_count = slide_count + 1
			if slide_count > table.getn(slides) then slide_count = 1 end
			b_group.setIndex(slide_count)
		end
		
		if slide ~= nil then
			slide:clean()
			slide:removeSelf()
			slide = nil
			Slide = nil
		end
		
		Slide = require(slides[slide_count])
		slide = Slide:new()
		slide.alpha = 0
		slide.x = centerX - (slide.width * 0.5)
		slide.y = menu_top + 20
		menu:insert(slide)
		
		tm:newTransition(slide, {time=500, alpha=1})
	end
	
	
	
	local function switchSlide(event)
		switch()
	end
	
	switch(slide_count)

	
	theTimer = timer.performWithDelay(12000, switchSlide, -1)

	group:insert(menu)
	
	transition.from(group, {time=250, alpha=0})
	
	b_group = BGroup:new(radio_array, slide_count)
	b_group:addEventListener("selectionChanged", onRadioChanged)
	
	return group
end