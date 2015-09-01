-- onTouch.lua : STATIC CLASS for returning the: ANGLE, DISTANCE, DURATION, & SPEED of TOUCH EVENT for flicking weapons 
-- TO CALL CLASS in lua file:


-- local OnTouch = require( "OnTouch.OnTouch" )
-- local newOnTouch = OnTouch.new()

-- local function onTouchEvent(event)
--     print(event.angle)
--     print(event.distance)
--     print(event.time)
--     print(event.speed)
-- end

-- Runtime:addEventListener("onTouchEvent", onTouchEvent)

require "com.vfiles.core.Class"

OnTouchController = Class()

-------------------------------------------------
-- VARIABLES
-------------------------------------------------

local beginX 
local beginY

local endX  
local endY 
 
local xDistance  
local yDistance  

local beginSwipe
local endSwipe

local swipeDistance
local swipeAngle
local swipeTime
local speed

-------------------------------------------------
-- FUNCTIONS
-------------------------------------------------

local function checkSwipeDirection()
        -- LENGTH
        xDistance =  math.abs(endX - beginX)
        yDistance =  math.abs(endY - beginY)
        swipeDistance = math.round( math.sqrt( (math.pow(xDistance, 2) + math.pow(yDistance, 2) ) ) )

         -- SPEED & TIME
        swipeTime = math.round( endSwipe - beginSwipe )
        speed = swipeDistance/swipeTime

        -- ANGLE
        swipeAngle = math.round( math.atan2(yDistance,xDistance)*(180/math.pi) )
        if beginX > endX then
            swipeAngle = 180 -swipeAngle
            -- swipeAngle = swipeAngle * -1
        end

        -- Set up CUSTOM EVENT and RETURN VARIABLES
        local event = {
            name = "onTouchEvent",
            angle = swipeAngle,
            distance = swipeDistance,
            time = swipeTime,
            speed = speed
        }
        scene:dispatchEvent( event )
end
 
 
local function swipe(event)
  if gameOn then
    
    if event.phase == "began" then
      beginX = event.x
      beginY = event.y
      beginSwipe = event.time
      display.getCurrentStage():setFocus( event.target )
    end
    
    if event.phase == "ended"  then
      endX = event.x
      endY = event.y
      endSwipe = event.time
      display.getCurrentStage():setFocus( event.target )
      -- Only call CHECK SWIPE DIRECTION - if the swipe direction is upwards
      -- and  if touch starts in lower-middle-third of screen
     
      if( ( endY < beginY ) 
      and (beginY > (display.contentHeight/3)*2 ) 
      and (beginX > display.contentWidth/3) 
      and (beginX < (display.contentWidth/3)*2 ) ) then
        checkSwipeDirection();
      end 
    end
  end
end


-- -------------------------------------------------
-- -- PUBLIC FUNCTIONS
-- -------------------------------------------------
function OnTouchController:initialize()
    Runtime:addEventListener("touch", swipe)
end

function OnTouchController:destroy()
    print("--x-- OnTouchController")
    Runtime:removeEventListener("touch", swipe)
    self = nil
end

return OnTouchController