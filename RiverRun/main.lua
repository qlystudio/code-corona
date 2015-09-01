-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

_G.sprite = require ("sprite")
-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "storyboard" module
local storyboard = require "storyboard"

local physics = require "physics"
--physics.setDrawMode( "hybrid" )

-- load menu screen
storyboard.gotoScene( "splash" )