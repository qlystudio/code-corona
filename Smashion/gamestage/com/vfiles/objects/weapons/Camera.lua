require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.weapons.Weapon")

Camera = Class(Super)

function Camera:initialize(config)
  config.name = "camera"
  config.width = 50
  config.height = 70
  config.weight = 6

  config.sheetInfo = {
      class = require("com.vfiles.sprites.weapons.camera"),
      path = "assets/images/weapons/camera.png",
      frames = 10
    }

  Super.initialize(self, config)
end 