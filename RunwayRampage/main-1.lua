-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- REQUIRE PHYSICS ENGINE
local physics = require "physics"
physics.start()


-- REQUIRE STORYBOARD
local storyboard = require ("storyboard")
-- REFERS TO SCENE - Event Listener Handler
local scene = storyboard.newScene()


-- CREATE SCENE
function scene:createScene(event)

	local screenGroup = self.view

	-- BASE BG
	local background = display.newImage("images/background/background-charles.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background:scale(1.25,1.25)
	screenGroup:insert(background)

	local runway = display.newRect( display.contentCenterX, 0, 300, display.contentHeight )
	screenGroup:insert(runway)

	local myRectangle = display.newRect( 0, 0, 150, 50 )
myRectangle.strokeWidth = 3
myRectangle:setFillColor( 0.5 )
myRectangle:setStrokeColor( 1, 0, 0 )

end



-- ENTER - put event listeners, call functions
function scene:enterScene(event)

end


--EXIT 
function scene:exitScene(event)

end


-- DESTROY
function scene:destroyScene(event)

end


-- ADD EVENT LISTNERS FOR STORYBOARD
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destoryScene", scene )

return scene