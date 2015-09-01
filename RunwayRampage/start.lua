-- REQUIRE STORYBOARD
local storyboard = require ("storyboard")
-- REFERS TO SCENE - Event Listener Handler
local scene = storyboard.newScene()


-- CREATE - add variables
function scene:createScene(event)

	local screenGroup = self.view

	-- BASE BG
	background = display.newImage("start.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	screenGroup:insert(background)

end


function start(event)
	if event.phase == "began" then
		-- print("start")
		storyboard.gotoScene("game", "fade", 400)
	end
end


-- ENTER - put event listeners, call functions
function scene:enterScene(event)
	background:addEventListener( "touch", start )
end

-- EXIT
function scene:exitScene(event)
	background:removeEventListener( "touch", start )
end


function scene:destroyScene(event)

end

-- ADD EVENT LISTNERS FOR STORYBOARD
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destoryScene", scene )

return scene