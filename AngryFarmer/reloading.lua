-----------------------------------------------------------------------------------------
--
-- reloading.lua
-- http://www.coronalabs.com/blog/2013/08/20/tutorial-reloading-storyboard-scenes/
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local _W = display.contentWidth
local _H = display.contentHeight

local paramsTable

local function restartLevel()
    storyboard.removeScene("level1")
    storyboard.gotoScene("level1", {time=750, effect="crossFade", params = paramsTable} )
end


-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view
    paramsTable = event.params
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view
    
    local playerScoreDisplay = display.newText( paramsTable.playerScore .. " PLAYER -vs- CPU " .. paramsTable.cpuScore, 10, 10, native.systemFontBold, 25 )
    playerScoreDisplay:setReferencePoint( display.TopCenterReferencePoint )
    playerScoreDisplay:setTextColor( 255, 255, 0)
    playerScoreDisplay.x = _W*0.5
    group:insert( playerScoreDisplay )
    
    if paramsTable.levelSuccess == true then
        local winDisplay = display.newText( "YOU WIN", 0, _H*0.5, native.systemFontBold, 45)
        winDisplay:setReferencePoint( display.CenterReferencePoint )
        winDisplay.x = _W*0.5
        winDisplay:setTextColor(255,255,0)   
        group:insert( winDisplay )
        
        local winDisplay2 = display.newText( "Next Level", 0, _H*0.5, native.systemFontBold, 25)
        winDisplay2:setReferencePoint( display.CenterReferencePoint )
        winDisplay2.x = _W*0.5
        winDisplay2.y = winDisplay.y + 85
        winDisplay2:setTextColor(255,255,255)   
        group:insert( winDisplay2 )
    else
        local loseDisplay = display.newText( "YOU LOSE", 0, _H*0.5, native.systemFontBold, 45)
        loseDisplay:setReferencePoint( display.CenterReferencePoint )
        loseDisplay.x = _W*0.5
        loseDisplay:setTextColor(255,50,0)
        group:insert( loseDisplay )

        local loseDisplay2 = display.newText( "Try Again", 0, _H*0.5, native.systemFontBold, 25)
        loseDisplay2:setReferencePoint( display.CenterReferencePoint )
        loseDisplay2.x = _W*0.5
        loseDisplay2.y = loseDisplay.y + 85
        loseDisplay2:setTextColor(255,255,255)
        group:insert( loseDisplay2 )
    end
    timer.performWithDelay(1500, restartLevel )
    
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view
    
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
    local group = self.view
    
    -- basic cleanup
    for i=group.numChildren,1,-1 do
        local child = group[i]
        child.parent:remove( child )
        child = nil
    end
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene