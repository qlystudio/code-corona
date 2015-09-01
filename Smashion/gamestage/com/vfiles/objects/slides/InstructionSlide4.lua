require "com.vfiles.core.Class"
local Slide = Class()
local imgPath = "assets/images/slides/"
  
function Slide:initialize(_)
  local stage = display.newContainer( 315, 315 )
  stage.anchorChildren, stage.anchorX, stage.anchorY = false, 0,0
  local img = display.newImageRect(stage, imgPath .. _.filename,  _.width, _.height )
  img.anchorX, img.anchorY = 0,0

  local dot = display.newCircle(stage, 254, 265, 22 )
  dot:setFillColor( 1,0,1 )


  local hand = display.newImageRect(stage, imgPath .. "hand.png",  156, 187 )
  hand.anchorX, hand.anchorY, hand.x, hand.y = 0,0, 170, 320


  self.dot = dot
  self.hand = hand
  self.stage = stage
  self.hasAnimation = true
end  

function Slide:render()
  return  self.stage
end

function Slide:play()
  function doTransition()
    self.dot.alpha, self.dot.xScale, self.dot.yScale = 0, .8, .8

    self.hand.x, self.hand.y = 170, 320
    transition.to(self.hand, {x = 170, y = 250, time = 1000, delay = 0, transition = easing.inOutQuad })

    transition.to(self.dot, {alpha = .7 , xScale = 1.2, yScale = 1.2, time = 300, delay = 1000, transition = easing.inQuad })
    transition.to(self.dot, {alpha = 0 , xScale = 1.5, yScale = 1.5, time = 600, delay = 1300, transition = easing.outQuad })

    transition.to(self.hand, {x = 70, y = 250, time = 1100, delay = 1700, transition = easing.inOutQuad })
    transition.to(self.hand, {x = 10, y = 170, time = 300, delay = 3000, transition = easing.outQuad })
    transition.to(self.hand, {x = 70, y = 250, time = 800, delay = 4000, transition = easing.outQuad })
    transition.to(self.hand, {x = 140, y = 170, time = 300, delay = 5000, transition = easing.outQuad })
    transition.to(self.hand, {x = 70, y = 250, time = 800, delay = 6000, transition = easing.outQuad })
    transition.to(self.hand, {x = 70, y = 320, time = 1200, delay = 7000, transition = easing.outQuad, onComplete = doTransition })
  end
    doTransition()
end

function Slide:stop()
  transition.cancel( self.dot )
  transition.cancel( self.hand )
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