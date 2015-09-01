require "com.vfiles.core.Class"
local Super = require "com.vfiles.objects.maps.Map"
local Data = require "com.vfiles.data.maps.LondonMapData"

LondonMap = Class(Super)

function LondonMap:initialize(config) 
  config.mapData = Data
  config.name = "London"
  config.label = "LONDON"
  config.labelAnchorX = 1
  config.labelAnchorY = 0
  config.imgPath = "assets/images/maps/london.jpg"
  config.width = 2048 
  config.height = 1500

  Super.initialize(self, config)
end