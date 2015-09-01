local screenW, screenH = display.stageWidth, display.stageHeight
local friction = 0.8
local gravity = .9
local speedX, speedY = 0, 0
local prevX, prevY = 0, 0
 
local ball = display.newCircle( 0, 0, 25)
ball:setFillColor(255, 255, 0)
ball.x = screenW*.5
ball.y = 20
 
function onMoveCircle(event) 
        speedY = speedY + gravity
 
        ball.x = ball.x + speedX
        ball.y = ball.y + speedY        
 
        if( ball.x >= screenW - ball.width*.5 ) then
                ball.x = screenW - ball.width*.5
                speedX = speedX*friction
                speedX = speedX*-1 --change direction     
        elseif( ball.x <= ball.width*.5) then
            ball.x = ball.width*.5
                speedX = speedX*friction
                speedX = speedX*-1 --change direction     
        end
        if( ball.y >= screenH - ball.height*.5 ) then
                ball.y = screenH - ball.height*.5 
                speedY = speedY*friction
                speedX = speedX*friction
                speedY = speedY*-1  --change direction  
        elseif( ball.y <= ball.height*.5 ) then
                ball.y = ball.height*.5
                speedY = speedY*friction
                speedY = speedY*-1 --change direction     
        end
end
 
-- A general function for dragging objects
local function startDrag( event )
        local t = event.target
 
        local phase = event.phase
        if "began" == phase then
                display.getCurrentStage():setFocus( t )
                t.isFocus = true
 
                -- Store initial position
                t.x0 = event.x - t.x
                t.y0 = event.y - t.y
                                
                -- Stop current motion, if any
                Runtime:removeEventListener("enterFrame", onMoveCircle)
                -- Start tracking velocity
                Runtime:addEventListener("enterFrame", trackVelocity)
 
        elseif t.isFocus then
                if "moved" == phase then
                        t.x = event.x - t.x0
                        t.y = event.y - t.y0
 
                elseif "ended" == phase or "cancelled" == phase then
                        display.getCurrentStage():setFocus( nil )
                        t.isFocus = false
                        
                        Runtime:removeEventListener("enterFrame", trackVelocity)
                        Runtime:addEventListener("enterFrame", onMoveCircle)
 
                end
        end
 
        -- Stop further propagation of touch event!
        return true
end
 
function trackVelocity()        
        speedX = ball.x - prevX
        speedY = ball.y - prevY
 
        prevX = ball.x
        prevY = ball.y
end                     
 
ball:addEventListener("touch", startDrag)
Runtime:addEventListener("enterFrame", onMoveCircle)