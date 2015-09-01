require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.enemies.Enemy")

Kate = Class(Super)

function Kate:initialize(config)
  local suffix = ""
  if config.type ~= nil then
    suffix =  config.type > 1 and ("-type-" .. config.type) or ""
  end

  config.name = "kate"
  config.sheetInfo = {
    walkFront = {
      class = require("com.vfiles.sprites.enemies.kate.kate-walk_front" .. suffix),
      path = "assets/images/enemies/kate/kate-walk_front" .. suffix ..".png"
    },
    walkBack = {
      class = require("com.vfiles.sprites.enemies.kate.kate-walk_back" .. suffix),
      path = "assets/images/enemies/kate/kate-walk_back" .. suffix ..".png"
    },
    fallFront = {
      class = require("com.vfiles.sprites.enemies.kate.kate-fall_front" .. suffix),
      path = "assets/images/enemies/kate/kate-fall_front" .. suffix ..".png"
    },
    fallBack = {
      class = require("com.vfiles.sprites.enemies.kate.kate-fall_back" .. suffix),
      path = "assets/images/enemies/kate/kate-fall_back" .. suffix ..".png"
    }  
  }  
  Super.initialize(self, config)
end