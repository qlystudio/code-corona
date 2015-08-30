local storyboard = require('storyboard')
local widget = require('widget')
local scene = storyboard.newScene()

-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view

  local background = display.newImage("./images/menu_bg.jpg")
  background.x = display.contentWidth / 2
  background.y = display.contentHeight / 2
  group:insert( background )

  local menuSheet = graphics.newImageSheet(
    './images/menu_buttons.png',
    { width = 120, height = 40, numFrames = 2 }
  )
  local playButton = widget.newButton {
    id = 'btnPlay',
    label = 'Play',
    left = 100,
    top = 200,
    width = 120,
    height = 40,
    cornerRadius = 10,
    sheet = menuSheet,
    defaultFrame = 1,
    overFrame = 2,
    onEvent = goToGame
  }
  group:insert(playButton)
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
  storyboard.purgeScene('gameover')
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
  local group = self.view
end

function goToGame(event)
  if event.phase == 'ended' then
    storyboard.gotoScene('game')
  end
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene)
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene
