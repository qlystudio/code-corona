-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )
system.setIdleTimer( false )

local storyboard = require "storyboard"

storyboard.gotoScene( "intro_scene", "fade", 400 )

