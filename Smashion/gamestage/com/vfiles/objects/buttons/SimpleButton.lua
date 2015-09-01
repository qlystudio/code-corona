--[[
  This is custom button class.
]]

require "com.vfiles.core.Class"
local SimpleButton = Class()

local function touchEventHander(e, _)
  if ( e.phase == "began" ) then
    display.getCurrentStage():setFocus(e.target)
    if _.c.over ~= nil then
      _.bg:setFillColor( _.c.over[1], _.c.over[2], _.c.over[3], _.c.over[4] or 1)
    end
    if _.lb ~=nil then
      if _.fc.over ~= nil then _.lb:setTintColor( _.fc.over[1], _.fc.over[2], _.fc.over[3], _.fc.over[4] or 1) end
    end

    if _.ico ~=nil and _.fc ~=nil then
      _.ico:setFillColor(_.fc.over[1], _.fc.over[2], _.fc.over[3], _.fc.over[4] or 1)
    end 

  elseif e.phase == "ended" or e.phase == "cancelled" then
    display.getCurrentStage():setFocus(nil)
    _.bg:setFillColor( _.c.default[1], _.c.default[2], _.c.default[3], _.c.default[4] or 1)
    if _.lb ~= nil then _.lb:setTintColor( _.fc.default[1], _.fc.default[2], _.fc.default[3], _.fc.default[4] or 1) end

    if _.ico ~=nil and _.fc ~=nil then
      _.ico:setFillColor(_.fc.default[1], _.fc.default[2], _.fc.default[3], _.fc.default[4] or 1)
    end 

    if gameData:get("sfx") then audio.play(audioClick) end
  end
end

function SimpleButton:initialize(_)
  self.container = display.newContainer( _.parent, _.width, _.height )
  self.bg = display.newRect(self.container, 0, 0, _.width, _.height )
  self.bg.isHitTestable = true -- BG should always clickable

  if _.label ~= nil then
    local fontName =  _.fontName == nil and "champion-40" or _.fontName
    self.lb = display.newBitmapText(self.container, _.label, 0 ,0 , fontName,_.fontSize)
  end

if _.icon ~= nil then
    self.ico = display.newImageRect( self.container, _.icon.path, _.icon.width, _.icon.height)
  end

  local c, b, l, ico = self.container, self.bg, self.lb, self.ico
  c.anchorX, c.anchorY, c.x, c.y = 0, 0, _.left, _.top
  b:setFillColor( _.color.default[1], _.color.default[2], _.color.default[3], _.color.default[4] or 1)
  
  if l ~=nil then
    l:setTintColor(_.fontColor.default[1], _.fontColor.default[2], _.fontColor.default[3], _.color.default[4] or 1)
  end

  if ico ~=nil and _.fontColor ~=nil then
    ico:setFillColor(_.fontColor.default[1], _.fontColor.default[2], _.fontColor.default[3], _.fontColor.default[4] or 1)
  end  

  self.width    = _.width
  self.height   = _.height
  self.c        = _.color
  self.fc       = _.fontColor
  self.onEvent  = _.onEvent  
  self.enabled  = _.enabled
  c.name = _.name
  c:addEventListener( "touch", function(e) if self.enabled ~= false then touchEventHander(e,self) end return true end )
  c:addEventListener( "tap", function(e) if self.enabled ~= false then _.onEvent(e) end return true end )
end

function SimpleButton:moveTo(x,y)
  self.container.x, self.container.y = x,y
end

function SimpleButton:setEnabled( isEnabled, color )
  self.enabled = isEnabled

  if self.enabled then
    self.bg:setFillColor( self.c.default[1], self.c.default[2], self.c.default[3], self.c.default[4] or 1)
  end

  if color ~= nil then
    self.bg:setFillColor( color[1], color[2], color[3], color[4] or 1)
  end
end

function SimpleButton:setVisible( visible )
  self.container.isVisible = visible
end

function SimpleButton:destroy()
  print("--X-- SimpleButton")
  self.bg:removeSelf()
  if self.lb ~= nil then self.lb:removeSelf() end
  if self.ico ~= nil then self.ico:removeSelf() end

  self.container:removeEventListener( "touch", function(e) if self.enabled ~= false then touchEventHander(e,self) end return true end )
  self.container:removeEventListener( "tap", function(e) if self.enabled ~= false then _.onEvent(e) end return true end )

  self.container:removeSelf()
  self.bg = nil
  self.lb = nil
  self.ico = nil
  self.container = nil
  self = nil
end

return SimpleButton