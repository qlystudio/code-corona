require "com.vfiles.core.Class"
local Super = require "com.vfiles.objects.maps.Map"
local Data = require "com.vfiles.data.maps.ParisMapData"

ParisMap = Class(Super)

function ParisMap:initialize(config) 
  config.mapData = Data
  config.name = "Paris"
  config.label = "PARIS"
  config.labelAnchorX = 1
  config.labelAnchorY = 0
  config.imgPath = "assets/images/maps/paris.jpg"
  config.width = 2048 
  config.height = 1500

  Super.initialize(self, config)
end