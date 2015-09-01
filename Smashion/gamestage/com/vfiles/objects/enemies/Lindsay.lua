require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.enemies.Enemy")

Lindsay = Class(Super)

function Lindsay:initialize(config)
  local suffix = ""
  if config.type ~= nil then
    suffix =  config.type > 1 and ("-type-" .. config.type) or ""
  end

  config.name = "lindsay"
  config.sheetInfo = {
    walkFront = {
      class = require("com.vfiles.sprites.enemies.lindsay.lindsay-walk_front" .. suffix),
      path = "assets/images/enemies/lindsay/lindsay-walk_front" .. suffix ..".png"
    },
    walkBack = {
      class = require("com.vfiles.sprites.enemies.lindsay.lindsay-walk_back" .. suffix),
      path = "assets/images/enemies/lindsay/lindsay-walk_back" .. suffix ..".png"
    },
    fallFront = {
      class = require("com.vfiles.sprites.enemies.lindsay.lindsay-fall_front" .. suffix),
      path = "assets/images/enemies/lindsay/lindsay-fall_front" .. suffix ..".png"
    },
    fallBack = {
      class = require("com.vfiles.sprites.enemies.lindsay.lindsay-fall_back" .. suffix),
      path = "assets/images/enemies/lindsay/lindsay-fall_back" .. suffix ..".png"
    }  
  }  
  Super.initialize(self, config)
end