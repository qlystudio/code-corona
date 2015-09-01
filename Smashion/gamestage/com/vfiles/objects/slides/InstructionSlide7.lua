require "com.vfiles.core.Class"
local Slide = Class()
local imgPath = "assets/images/slides/"
  
function Slide:initialize(_)
  local img = display.newImageRect( imgPath .. _.filename,  _.width, _.height )
  self.img = img
end  

function Slide:render()
  return  self.img
end

function Slide:destroy()
  print("--X-- Slide")
  self.img:removeSelf()
  self.img = nil
  self = nil
end

return Slide