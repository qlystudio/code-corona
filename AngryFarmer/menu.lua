-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- include Corona's "widget" library
local widget = require "widget"

local _W = display.contentWidth
local _H = display.contentHeight

--------------------------------------------

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
    
    -- go to level1.lua scene
    storyboard.gotoScene( "level1", {
        effect = "fade", 
        time = 250,
        params = {
            moleCount = 1,
            stumpCount = 1,
            spudCount = 1,
            levelNo = 1                
        }
    })
    
    return true	-- indicates successful touch
end

-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view
    
    -- display a background image
    local background = display.newImageRect( "bg.png", _W, _H )
    background:setReferencePoint( display.TopLeftReferencePoint )
    background.x, background.y = 0, 0
    
    
    -- display potato
    local spud = display.newImageRect( "Potato.png", _W, _H )
    spud:setReferencePoint( display.CenterReferencePoint )
    spud:scale(0.4, 0.4)
    spud.x, spud.y = _W*0.5, _H*0.5 - 20
    
    local title = display.newText( "ANGRY FARMER", 0, 0, native.systemFontBold, 35 )
    title:setReferencePoint( display.CenterReferencePoint )
    title:setTextColor( 255, 255, 0)
    title.x = _W*0.5
    title.y = 45
    group:insert( title )
    
    -- swap for text candy = no time
    
    -- create/position logo/title image on upper-half of the screen
    local titleShadow = display.newText( "ANGRY FARMER", 0, 0, native.systemFontBold, 35 )
    titleShadow:setReferencePoint( display.CenterReferencePoint )
    titleShadow:setTextColor( 0, 0, 0, 150)
    titleShadow.x = title.x - 2
    titleShadow.y = title.y - 2
    group:insert( titleShadow )
    
    local tires = display.newImageRect( "tires.png", _W, 45)
    tires:setReferencePoint( display.CenterReferencePoint )
    tires:rotate(25)
    tires:scale( 1.1, 1.2)
    tires.x = _W*0.5
    tires.y = _H*0.5 - 15
    
    --swap this for widget candy = no time
    
    -- create a widget button (which will loads level1.lua on release)
    playBtn = widget.newButton{
        label="START",
        labelColor = { default={0}, over={128} },
        default="button.png",
        over="button-over.png",
        width=154, height=40,
        onRelease = onPlayBtnRelease	-- event listener function
    }
    playBtn:setReferencePoint( display.CenterReferencePoint )
    playBtn.x = _W*0.5
    playBtn.y = _H - 85
    
    -- all display objects must be inserted into group
    group:insert( background )
    group:insert( spud )
    group:insert( tires )
    group:insert( titleShadow )
    group:insert( title )
    group:insert( playBtn )
    
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view
    
    -- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
    
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view
    
    -- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
    
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
    local group = self.view
    
    if playBtn then
        playBtn:removeSelf()	-- widgets must be manually removed
        playBtn = nil
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