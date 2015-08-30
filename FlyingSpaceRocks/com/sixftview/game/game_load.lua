module(..., package.seeall)

function new()
	local group = display.newGroup()
	local loadTimer
	local learn_txt
	local bn_background
	local txt_loading = display.newText("Loading Game ", 0, 0, app_data.font_Robofan, 60)
	txt_loading.x = centerX
	txt_loading.y = halfHeight
	
	group:insert(txt_loading)
	
	local function nextLevel(event)
		director:changeScene("com.sixftview.game.game_view", "fade")
	end
	
	local function onLearnTouch(event)
		if event.phase == "ended" then
			if loadTimer ~= nil then timer.cancel(loadTimer) end
			display.remove(txt_loading)
			display.remove(learn_txt)
			display.remove(bn_background)
			director:openPopUp("com.sixftview.tips.game_tips",  nextLevel)
		end
	end
	
	bn_background = display.newRoundedRect(0,0, 225, 50, 10)
	bn_background:setFillColor(64, 0, 255, 50)
	bn_background.x = centerX 
	bn_background.y = txt_loading.y + txt_loading.height + 25
	
	learn_txt = display.newText( "How To Play", 0, 0,
	 		app_data.font_Robofan, 30)
	
	learn_txt:setTextColor( 64, 0, 255)
	learn_txt.x = centerX
	learn_txt.y = txt_loading.y + (txt_loading.height + 25 )
	learn_txt:addEventListener("touch", onLearnTouch)
	group:insert(learn_txt)
	
	
	loadTimer = timer.performWithDelay(6000, nextLevel, 1)
	
	return group
end