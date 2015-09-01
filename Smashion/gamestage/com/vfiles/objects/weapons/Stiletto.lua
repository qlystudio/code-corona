require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.weapons.Weapon")

Stiletto = Class(Super)

function Stiletto:initialize(config)
  config.name = "stiletto"
  config.width = 42
  config.height = 47
  config.weight = 7

  config.sheetInfo = {
    class = require("com.vfiles.sprites.weapons.stiletto"),
    path = "assets/images/weapons/stiletto.png",
    frames = 11
  }

  Super.initialize(self, config)
end