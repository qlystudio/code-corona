require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.weapons.Weapon")

Cellphone = Class(Super)

function Cellphone:initialize(config)
  config.name = "cellphone"
  config.width = 30
  config.height = 100
  config.weight = 4

  config.sheetInfo = {
      class = require("com.vfiles.sprites.weapons.cellphone"),
      path = "assets/images/weapons/cellphone.png",
      frames = 10
    }

  Super.initialize(self, config)
end 