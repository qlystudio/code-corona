require "com.vfiles.core.Class"
local Super = require "com.vfiles.objects.maps.Map"
local Data = require "com.vfiles.data.maps.MilanMapData"

MilanMap = Class(Super)

function MilanMap:initialize(config) 
  config.mapData = Data
  config.name = "Milan"
  config.label = "MILAN"
  config.labelAnchorX = 1
  config.labelAnchorY = 0
  config.imgPath = "assets/images/maps/milan.jpg"
  config.width = 2048 
  config.height = 1500

  Super.initialize(self, config)
end