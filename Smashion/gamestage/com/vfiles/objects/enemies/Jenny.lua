require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.enemies.Enemy")

Jenny = Class(Super)

function Jenny:initialize(config)
local suffix = ""
  if config.type ~= nil then
    suffix =  config.type > 1 and ("-type-" .. config.type) or ""
  end

  config.name = "jenny"
  config.sheetInfo = {
    walkFront = {
      class = require("com.vfiles.sprites.enemies.jenny.jenny-walk_front" .. suffix),
      path = "assets/images/enemies/jenny/jenny-walk_front" .. suffix ..".png"
    },
    walkBack = {
      class = require("com.vfiles.sprites.enemies.jenny.jenny-walk_back" .. suffix),
      path = "assets/images/enemies/jenny/jenny-walk_back" .. suffix ..".png"
    },
    fallFront = {
      class = require("com.vfiles.sprites.enemies.jenny.jenny-fall_front" .. suffix),
      path = "assets/images/enemies/jenny/jenny-fall_front" .. suffix ..".png"
    },
    fallBack = {
      class = require("com.vfiles.sprites.enemies.jenny.jenny-fall_back" .. suffix),
      path = "assets/images/enemies/jenny/jenny-fall_back" .. suffix ..".png"
    }  
  }
  Super.initialize(self, config)
end