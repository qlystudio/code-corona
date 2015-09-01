local math, physics = require("math"), require('physics')

physics.start()
physics.setGravity( 0, 4 )

display.setStatusBar( display.HiddenStatusBar )

local screenW, screenH = display.contentWidth, display.contentHeight
-- local playerX, playerY = (screenW / 2), (screenH / 2)
local playerX, playerY = (screenW / 2), ((screenH / 10) * 9)

local player = display.newRect( 0, 0, 30, 30 )
player.x = playerX
player.y = playerY

-- local sinT = display.newText("", 100, 10)
-- local cosT = display.newText("", 100, 30)
local angleT = display.newText("", 100, 70)

local function onScreenTouch( event )
  if (event.phase == "began") then
    speed = 300
    deltaX = event.x - playerX
    deltaY = event.y - playerY


    normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
    normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))


    angle = math.atan2( deltaY, deltaX ) * 180 / math.pi

    -- sin, cos = math.sin( angle ), math.cos( angle )

    -- sinT.text = sin
    -- cosT.text = cos
    angleT.text = angle

    -- ORIGINAL CODE
    -- bullet = display.newRect( 0, 0, 6, 6 )
    -- bullet.x = playerX
    -- bullet.y = playerY


    -- bullet = display.newRect( 0, 0, 6, 6 )
    bullet = display.newImage("images/throwing-items/shoe.png")
    bullet:scale( .25, .25 )
    bullet.x = playerX
    bullet.y = playerY



    -- local background = display.newImage("big/bg.png")
    -- background.x = 480
    -- background.y = 32
    -- screenGroup:insert(background)0



    physics.addBody( bullet )

    -- bullet:setLinearVelocity( math.cos( angle ) * speed, math.sin( angle ) * speed )
    bullet:setLinearVelocity( normDeltaX  * speed, normDeltaY  * speed )

  end
end

Runtime:addEventListener( "touch", onScreenTouch )