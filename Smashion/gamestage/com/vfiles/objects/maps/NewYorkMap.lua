require "com.vfiles.core.Class"
local Super = require "com.vfiles.objects.maps.Map"
local Data = require "com.vfiles.data.maps.NewYorkMapData"

NewYorkMap = Class(Super)

function NewYorkMap:initialize(config) 
  config.mapData = Data
  config.name = "NewYork"
  config.label = "NEW YORK CITY"
  config.labelAnchorX = 1
  config.labelAnchorY = 0
  config.imgPath = "assets/images/maps/newyork.jpg"
  config.width = 2048 
  config.height = 1500

  Super.initialize(self, config)
end