module(..., package.seeall)


function new()
	local group
	local function splashComplete(obj)
		director:changeScene("com.sixftview.start.start_view")
	end
	
	group = display.newGroup()
	
	centerX = display.contentWidth * 0.5
	centerY = display.contentHeight * 0.5
	dlish = display.newImage("images/sixft_logo.png")
	dlish.x = centerX
	dlish.y = centerY
	
	group:insert(dlish)

	transition.from(dlish, {time=1000, alpha=0})
	transition.to(dlish, {time=500, alpha=0, delay=3000, onComplete = splashComplete})
	--transition.to(dlish, {time=500, delay=1250, alpha=0, onComplete = splashComplete})
	return group
end

