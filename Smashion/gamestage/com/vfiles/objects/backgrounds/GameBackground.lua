require "com.vfiles.core.Class"
GameBackground = Class()
local bg
--------------------------------------------------
-- Listeners
--------------------------------------------------

--------------------------------------------------
-- Private workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
function GameBackground:initialize(config)
  local dimension = 568
  bg = display.newImageRect(config.parent, "assets/images/backgrounds/gamestage/"..config.city:lower().."-background.jpg", dimension, dimension)
  bg.anchorX, bg.anchorY = 0, 0
  self:rotate()
end

--------------------------------------------------
-- Public workers
--------------------------------------------------

function GameBackground:rotate()
  bg.x = -(bg.width - display.contentWidth)/2
  bg.y =  -(bg.height - display.contentHeight)/2
end

function GameBackground:destroy()
  bg:removeSelf()
  bg = nil
end
