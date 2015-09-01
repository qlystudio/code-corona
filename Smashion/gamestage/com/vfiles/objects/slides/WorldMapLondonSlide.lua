require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.slides.WorldMapSlide")

WorldMapLondonSlide = Class(Super)

function WorldMapLondonSlide:initialize(config)
  config.label = "LONDON"
  config.name = "London"
  config.filename = "slide-london.png"
  Super.initialize(self, config)
end