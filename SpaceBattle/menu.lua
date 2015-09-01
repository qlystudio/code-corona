local storyboard = require "storyboard"
local scene = storyboard.newScene()

local logo
local startButton
local scoreButton
local helpButton
local creditsButton
local background
local clickSound

local function onUpdate( event )

end

local function onTimerTicks(event)
	
	timer.cancel(event.source)
	storyboard.gotoScene("game")
	
end

local function onButtonTouch(event)


	if (event.phase == "began") then

		media.playEventSound(clickSound)
		
		if(event.target == startButton) then

			timer.performWithDelay(1000, onTimerTicks)

		elseif(event.target == scoreButton) then

			storyboard.gotoScene("rank")

		end
	end

end

function scene:createScene( event )

	local view = self.view
	
	clickSound = media.newEventSound( "sfx/menuClick.wav" )
	
	background = display.newImage("img/bg_menu.png")
	background:setReferencePoint(display.CenterReferencePoint)
	background.x = display.contentWidth/2; background.y = display.contentHeight/2
	background:scale(2.2,2.2)
	
	logo = display.newImage("img/logo_menu.png")
	startButton = display.newImage("img/btn_start.png")
	scoreButton = display.newImage("img/btn_score.png")
	helpButton = display.newImage("img/btn_help.png")
	creditsButton = display.newImage("img/btn_credits.png")
	
	logo:setReferencePoint(display.CenterReferencePoint)
	logo.x = display.contentWidth/2
	logo.y = display.contentHeight/2 - 200
	
	startButton:setReferencePoint(display.CenterReferencePoint)
	startButton.x = logo.x
	startButton.y = logo.y + logo.contentHeight/2 + 100
	startButton:scale(1.5, 1.5)

	scoreButton:setReferencePoint(display.CenterReferencePoint)
	scoreButton.x = logo.x
	scoreButton.y = startButton.y + startButton.contentHeight/2 + 50

	helpButton:setReferencePoint(display.CenterReferencePoint)
	helpButton.x = logo.x
	helpButton.y = scoreButton.y + scoreButton.contentHeight/2 + 50

	creditsButton:setReferencePoint(display.CenterReferencePoint)
	creditsButton.x = logo.x
	creditsButton.y = helpButton.y + helpButton.contentHeight/2 + 50

	view:insert(background)
	view:insert(logo)
	view:insert(startButton)
	view:insert(scoreButton)
	view:insert(helpButton)
	view:insert(creditsButton)

end

function scene:willEnterScene( event )
   
end

function scene:enterScene( event )
   
	startButton:addEventListener("touch", onButtonTouch)
	helpButton:addEventListener("touch", onButtonTouch)
	scoreButton:addEventListener("touch", onButtonTouch)
	creditsButton:addEventListener("touch", onButtonTouch)

	Runtime:addEventListener( "enterFrame", onUpdate )

end

function scene:exitScene( event )
   Runtime:removeEventListener( "enterFrame", onUpdate )
end

function scene:didExitScene( event )

end

function scene:destroyScene(event)
	
	background:removeSelf()
	background = nil

	logo:removeSelf()
	logo = nil

	startButton:removeSelf()
	startButton = nil

	helpButton:removeSelf()
	helpButton = nil

	scoreButton:removeSelf()
	scoreButton = nil

	clickSound = nil
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "didExitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene