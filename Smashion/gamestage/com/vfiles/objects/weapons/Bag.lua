require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.weapons.Weapon")

Bag = Class(Super)

function Bag:initialize(config)
  config.name = "bag"
  config.width = 50
  config.height = 55
  config.weight = 7

  config.sheetInfo = {
      class = require("com.vfiles.sprites.weapons.bag"),
      path = "assets/images/weapons/bag.png",
      frames = 11
    }

  Super.initialize(self, config)
end 