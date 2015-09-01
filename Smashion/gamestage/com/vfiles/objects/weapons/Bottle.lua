require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.weapons.Weapon")

Bottle = Class(Super)

function Bottle:initialize(config)
  config.name = "bottle"
  config.width = 17
  config.height = 51
  config.weight = 5

  config.sheetInfo = {
      class = require("com.vfiles.sprites.weapons.bottle"),
      path = "assets/images/weapons/bottle.png",
      frames = 10
    }

  Super.initialize(self, config)
end