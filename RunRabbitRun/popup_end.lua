module(..., package.seeall)
new = function ( params )
	local localGroup = display.newGroup()
	local distance = params.distance
	local carrots = params.carrots

	local function touched(event)
		if event.phase == "ended" then
			timer.performWithDelay(10, function () director:changeScene({carrots=carrots, distance=distance}, "stat") end)
		end
	end

	local initVars = function ()
--		if settings.game.best_score<distance then settings.game.best_score = distance end
		local background = display.newImage( "media/menu/bg.png" )
		localGroup:insert( background )
		background.x, background.y = display.contentWidth/2, display.contentHeight/2
		background:addEventListener( "touch" , touched )

		local background2 = display.newImage( "media/play/menu/popup_bg.png" )
		localGroup:insert( background2 )
		background2.x, background2.y = display.contentWidth/2, display.contentHeight/2

		local run_icon = display.newImage("media/play/run_icon.png", 90, 10)
		run_icon.x, run_icon.y = display.contentWidth/2-25, display.contentHeight/2-22
		localGroup:insert(run_icon)
		local lbl = display.newText( tostring(math.ceil(distance)), 0, 0, native.systemFontBold, 16 )
		lbl:setTextColor(255,255,0)
		localGroup:insert(lbl)
		lbl.x, lbl.y = display.contentWidth/2+25, display.contentHeight/2-20
		
		local carrots_icon = display.newImage("media/play/carrot.png", 90, 10) carrots_icon.xScale, carrots_icon.yScale = 0.5,0.5
		carrots_icon.x, carrots_icon.y = display.contentWidth/2-25, display.contentHeight/2+18
		localGroup:insert(carrots_icon)
		lbl = display.newText( carrots, 0, 0, native.systemFontBold, 16 )
		lbl:setTextColor(255,255,0)
		localGroup:insert(lbl)
		lbl.x, lbl.y = display.contentWidth/2+25, display.contentHeight/2+20

		
	end	
	
	
	initVars()
	return localGroup
end