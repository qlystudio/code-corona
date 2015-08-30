-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require "storyboard"
storyboard.currentStage = 1
storyboard.currentLevel = 1
storyboard.isPaused = false
storyboard.playerHealth = 55
storyboard.firstRun = true
storyboard.firstEntry = true
storyboard.isVibrateOn = true

dusk = require("Dusk.Dusk")
--lime = require("lime.lime")
display.setStatusBar( display.HiddenStatusBar )
--local lime = require("lime.lime")
-- load GameScene.lua
storyboard.gotoScene( "MainMenu" )
-- Add any objects that should appear on all scenes below (e.g. tab bar, HUD, etc.):

local bgm = audio.loadStream( "Audios/bgm.mp3" )
local bgmChn = audio.play( bgm, { channel=1, loops=-1, fadein=5000 } )