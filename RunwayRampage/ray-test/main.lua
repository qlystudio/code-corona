local physics = require( "physics" )
physics.start()

local Rect = display.newRect(30,30,30,30)
Rect:setFillColor(255,0,0)

local flooring = display.newRect(0,display.contentHeight/1.1, display.contentWidth, 10)
    physics.addBody(Rect,"dynamic")
    physics.addBody(flooring,"static")

    local activateDash = false
    local bx = 0
    local by = 0

    heroTouch = function(event)
        if Rect then
            if event.phase == "began" then
                bx = event.x
                by = event.y
            elseif event.phase == "moved" then
                activateDash = true
            elseif event.phase == "ended" then
                if activateDash then
                    if _G.gX == 0 and _G.gY ~= 0 then
                        Rect:setLinearVelocity(event.x-bx,0)
                    elseif _G.gX ~= 0 and _G.gY == 0 then
                        Rect:setLinearVelocity(0,event.y-by)
                    else
                        Rect:setLinearVelocity(event.x-bx,event.y-by)
                    end
                    activateDash = false
                end
            end
        end
    end
Runtime:addEventListener("touch",heroTouch)