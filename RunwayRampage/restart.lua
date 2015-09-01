-- REQUIRE STORYBOARD
local storyboard = require ("storyboard")
-- REFERS TO SCENE - Event Listener Handler
local scene = storyboard.newScene()


-- CREATE - add variables
function scene:createScene(event)

	local screenGroup = self.view

	-- BASE BG
	background = display.newImage("big/restart.png")
	background.x = 480
	background.y = 320

	screenGroup:insert(background)

	local background2 = display.newImage("big/restart.png")
	background2.x = 1440
	background2.y = 320
	screenGroup:insert(background2)

	-- PARALLAX IMAGES TO BE STITCHED TOGETHER
	city1 = display.newImage("big/city2.png")
	city1.x = 480
	city1.y = 420
	screenGroup:insert(city1)

end


function start(event)
	if event.phase == "began" then
		-- print("start")
		storyboard.gotoScene("game", "fade", 400)
	end
end


-- ENTER - put event listeners, call functions
function scene:enterScene(event)
	storyboard.purgeScene( "game" )
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