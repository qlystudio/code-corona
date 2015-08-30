--- eight minute corona lua game
-- by conor gilmer
--

--imports
local physics = require("physics")

-- start and set gravity
physics.start()
physics.setGravity(0, 9.8)
-- add background
local background = display.newImage("night_sky.png")
background.x = display.contentWidth/2
background.y = display.contentHeight/2

-- add sun
local sun = display.newImage("sun.png")
sun.x = display.contentWidth/2
-- turn sun into physics body
--physics.addBody(sun) - still bounced with this
physics.addBody(sun, {bounce = 0.3})

-- add floor
local floor = display.newImage("floor.png")
floor.x = display.contentWidth/2
floor.y = display.contentHeight - floor.stageHeight/2
floor.rotation = 0.2
physics.addBody(floor, "static", {bounce =0.2})
-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--- move function
function moveSun(event)
    sun:applyLinearImpulse(0, -0.1, sun.x, sun.y)
end

-- add listener
sun:addEventListener("touch", moveSun)
    

