require "com.vfiles.core.Class"
local Super = require ("com.vfiles.objects.slides.WorldMapSlide")

WorldMapNewYorkSlide = Class(Super)

function WorldMapNewYorkSlide:initialize(config)
  config.label = "NEW YORK CITY"
  config.name = "NewYork"
  config.filename = "slide-newyork.png"
  Super.initialize(self, config)
end