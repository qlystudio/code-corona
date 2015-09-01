require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.slides.WorldMapSlide")

WorldMapMilanSlide = Class(Super)

function WorldMapMilanSlide:initialize(config)
  config.label = "MILAN"
  config.name = "Milan"
  config.filename = "slide-milan.png"
  Super.initialize(self, config)
end