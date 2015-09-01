--[[
  This is custom level preview panel class.
]]

require "com.vfiles.core.Class"
local Panel = Class()
local _W, _H = 145, 60

function Panel:initialize(_)
  self.container = display.newContainer( _.parent, _W, _H )
  self.container.anchorChildren, self.container.anchorX, self.container.anchorY = false, 0, 0  

  -- Background
  self.bg = display.newRect(self.container, 0, 0, _W, _H )
  self.bg.anchorX, self.bg.anchorY = 0, 0

  -- Model face
  self.model = display.newSprite( self.container, _.imgSheet , {frames={_.imgSheetInfo:getFrameIndex(_.name)}})
  if _.name ~= "basepoint" then self.model.rotation = -5 end

  local _scale, _x, _y
  local mW, mH = self.model.width, self.model.height

  --Check if model has pointException 
  if _.pointException ~= nil then
    _scale = .6
    _x = (mW*_scale)/2
    _y = (mH*_scale)/2

    -- Add Weapon on the right bottom side of model's face
    self.weapon = display.newSprite( self.container, _.imgSheet , {frames={_.imgSheetInfo:getFrameIndex(_.pointException.weapon)}})    
    self.weapon.x, self.weapon.y = self.weapon.width/2 + 20, _H - self.weapon.height/2 - 2

  else
    _scale = 1
    _x = (mW*_scale)/2 - 3
    _y = (mH*_scale)/2
  end

  self.model.width = mW * _scale
  self.model.height = mH * _scale
  self.model.x = _x
  self.model.y = _y

  -- Point label
  self.point = display.newBitmapText(self.container, tostring(comma_value( _.pointException ~= nil and _.pointException.point or _.point )), 0, 0, "champion-40-num-yellow-ol", 40)
  
  -- print(self.point.width)
  if self.point.width > 65 then
    local _s = 65/self.point.width
    self.point.xScale, self.point.yScale = _s, _s
  end
  self.point:moveTo(110, _H/2)

  -- Equal symbol
  self.equalSym = display.newSprite( self.container, _.imgSheet , {frames={_.imgSheetInfo:getFrameIndex("ico-equal")}})
  self.equalSym.x, self.equalSym.y = _W/2 - 7, _H/2
end

function Panel:moveTo(x,y)
  self.container.x, self.container.y = x,y
end

function Panel:destroy()
  print("--X-- Panel")
  self.bg:removeSelf()
  self.model:removeSelf()
  self.point:removeSelf()
  self.equalSym:removeSelf()
  self.bg = nil
  self.model = nil
  self.point = nil
  self.equalSym = nil

  if self.weapon ~= nil then 
    self.weapon:removeSelf()
    self.weapon = nil
  end

  self.container:removeSelf()
  self.bg = nil
  self.lb = nil
  self.ico = nil
  self.container = nil
  self = nil
end

return Panel