local storyboard = require('storyboard')
local scene = storyboard.newScene()

function addMenuListener(event)
  background:addEventListener('touch', goToMenu)
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  background = display.newImage("./images/game_over.jpg")
  background.x = display.contentWidth / 2
  background.y = display.contentHeight / 2
  group:insert( background )
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
  timer.performWithDelay(500, addMenuListener)
  storyboard.purgeScene('game')
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
  background:removeEventListener('touch', goToMenu)
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
  local group = self.view
end

function goToMenu(event)
  if event.phase == 'ended' then
    storyboard.gotoScene('menu')
  end
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene)

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene
