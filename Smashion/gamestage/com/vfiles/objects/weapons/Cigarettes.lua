require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.weapons.Weapon")

Cigarettes = Class(Super)

function Cigarettes:initialize(config)
  config.name = "cigarettes"
  config.width = 37
  config.height = 56
  config.weight = 5

  config.sheetInfo = {
    class = require("com.vfiles.sprites.weapons.cigarettes"),
    path = "assets/images/weapons/cigarettes.png",
    frames = 10
  }

  Super.initialize(self, config)
end