-- Hide status bar from screen
display.setStatusBar(display.HiddenStatusBar)

-- Enable audio channel mix in game
if audio.supportsSessionProperty == true then
  audio.setSessionProperty(audio.MixMode, audio.AmbientMixMode)
end

-- IMPORT
require "com.vfiles.core.Helper"
require "com.vfiles.core.Fontmanager"
composer  = require "composer"
widget    = require "widget"
gameData  = require "com.vfiles.storage.GameData"

-- DEBUG
-- memoryUsageMonitor() -- Shows memory suage log in consople window

-- ========================================
-- pre-populate gameData
if gameData:load() == nil then
  print("gameData is empty. Popoulate data w/ preset value.")
  gameData:set("__init__", true)

  -- [Global]
  gameData:set("firstTimePlay", true)
  gameData:set("bgm", true)
  gameData:set("sfx", true)
  
  -- [Game data. See GameData.lua for detail]
  gameData:reset()
end
-- gameData:reset()


-- Global audio track
audioClick = audio.loadSound( "assets/audios/button-click.wav" )


-- ========================================
-- DEV
-- ========================================

local options =
    {
      isModal = true,
      params = {
        code = 1,
        city = "Milan",
        gameLevel = 2,
        result = {
          score = 100,
          achievement = 1
        }
      }
    }

-- composer.showOverlay( "com.vfiles.views.modals.CongratulationsModalView", options )
-- composer.showOverlay( "com.vfiles.views.modals.GameFailedModalView", options )
-- composer.showOverlay( "com.vfiles.views.modals.GameClearedModalView", options )
-- composer.showOverlay( "com.vfiles.views.modals.GamePausedModalView", options )
-- composer.showOverlay( "com.vfiles.views.modals.InstructionModalView" )
-- composer.showOverlay( "com.vfiles.views.modals.GameSettingModalView", {params={type=1}} )
-- composer.gotoScene( "com.vfiles.views.LoadingGameView", { params = { sceneName = "com.vfiles.views.GameView", param = {city ="London", gameLevel = 1} } })
-- composer.gotoScene( "com.vfiles.views.CityMapView", { params = { city ="NewYork" } })
-- composer.gotoScene( "com.vfiles.views.WorldMapView" )

-- composer.gotoScene( "com.vfiles.views.HomeView" )
composer.showOverlay( "com.vfiles.views.modals.HighScoresModalView", { params = {localData = nil} } )

-- local options =
--       {
--         effect = "fade",
--         time = 250,
--         isModal = true,
--         params = {
--           code = 1,
--           city = "Milan",
--           gameLevel = 2,
--           result = {
--             score = 4500,
--             achievement = 1
--           }
--         }
--       }
--  composer.showOverlay( "com.vfiles.views.modals.GameClearedModalView", options )

