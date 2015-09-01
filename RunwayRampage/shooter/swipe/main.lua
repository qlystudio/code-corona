local beginX 
local beginY  
local endX  
local endY 
 
local xDistance  
local yDistance

local angleT = display.newText("", 100, 70)
 
function checkSwipeDirection()
 
        xDistance =  math.abs(endX - beginX) -- math.abs will return the absolute, or non-negative value, of a given value. 
        yDistance =  math.abs(endY - beginY)
        
        if xDistance > yDistance then
                if beginX > endX then
                        print("swipe left")
                        angleT.text = "swipe left"
                else 
                        print("swipe right")
                        angleT.text = "swipe right"
                end
        else 
                if beginY > endY then
                        print("swipe up")
                        angleT.text = "swipe up"
                else 
                        print("swipe down")
                        angleT.text = "swipe down"
                end
        end
        
end
 
 
function swipe(event)
        if event.phase == "began" then
                beginX = event.x
                beginY = event.y
        end
        
        if event.phase == "ended"  then
                endX = event.x
                endY = event.y
                checkSwipeDirection();
        end
end
 
Runtime:addEventListener("touch", swipe)