require "com.vfiles.core.Class"
local Slide = Class()
local imgPath = "assets/images/slides/"
  
function Slide:initialize(_)
  local stage = display.newGroup()

  local img = display.newImageRect(stage, imgPath .. _.filename,  _.width, _.height )
  img.anchorX, img.anchorY = 0,0
  self.stage = stage
  self.hasAnimation = true
  

  local redGdnt = {
    type = "gradient",
    color1 = { .749,.071, .306 },
    color2 = { .325, 0, .235 },
    direction = "down"
  }

  local powerMeter = display.newRect(stage, 90, 215.5, 198, 15.5 )
  powerMeter.anchorX, powerMeter.anchorY = 0, 0
  powerMeter:setFillColor( redGdnt )

  self.powerMeter = powerMeter

end  

function Slide:render()
  return  self.stage
end

function Slide:play()
  function doTransition()
    local _w = self.powerMeter.width == 50 and 198 or 50
    transition.to( self.powerMeter, {width = _w, time = 3500, transition = easing.inOutQuad, onComplete = doTransition} )
  end
  doTransition()
end

function Slide:stop()
  transition.cancel( self.powerMeter )
  self.powerMeter.width = 198
end

function Slide:destroy()
  print("--X-- Slide")
  for i=1, self.stage.numChildren do
    self.stage[1]:removeSelf()
    self.stage[1] = nil
  end
  self.stage:removeSelf()
  self.stage = nil
  self = nil
end

return Slide