require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.slides.WorldMapSlide")

WorldMapParisSlide = Class(Super)

function WorldMapParisSlide:initialize(config)
  config.label = "PARIS"
  config.name = "Paris"
  config.filename = "slide-paris.png"
  Super.initialize(self, config)
end