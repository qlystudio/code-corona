local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
  
function scene:enterScene( event )
    local group = self.view
    storyboard.purgeScene( "gameLogic" )
    storyboard.gotoScene( "gameLogic", "fade", 250 )
end
 
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
 
return scene