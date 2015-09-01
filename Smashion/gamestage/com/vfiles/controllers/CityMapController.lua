system.activate( "multitouch" )

require "com.vfiles.core.Class"
require "com.vfiles.objects.maps.NewYorkMap"
require "com.vfiles.objects.maps.LondonMap"
require "com.vfiles.objects.maps.MilanMap"
require "com.vfiles.objects.maps.ParisMap"

CityMapController = Class()

local mapClass, group
local _W, _H = display.contentWidth, display.contentHeight
local isDevice = (system.getInfo("environment") == "device")
local zoomMin, zoomMax, lockMove = .4, 1, false
local audioUnlockedSound


--------------------------------------------------
-- Private workers
--------------------------------------------------
-- local function showCityClearOverlay(city)
--   composer.gotoScene( "com.vfiles.views.modals.congratulationsModalView", { 
--     -- time = 250, 
--     -- effect = "fade",
--     -- isModal = true,
--     params = { 
--       city = city
--     }
--   })
--   return true
-- end

-- returns the distance between points a and b
local function lengthOf( a, b )
    local width, height = b.x-a.x, b.y-a.y
    return (width*width + height*height)^0.5
end

-- returns the degrees between (0,0) and pt
-- note: 0 degrees is 'east'
local function angleOfPoint( pt )
  local x, y = pt.x, pt.y
  local radian = math.atan2(y,x)
  local angle = radian*180/math.pi
  if angle < 0 then angle = 360 + angle end
  return angle
end

-- returns the degrees between two points
-- note: 0 degrees is 'east'
local function angleBetweenPoints( a, b )
  local x, y = b.x - a.x, b.y - a.y
  return angleOfPoint( { x=x, y=y } )
end

-- returns the smallest angle between the two angles
-- ie: the difference between the two angles via the shortest distance
local function smallestAngleDiff( target, source )
  local a = target - source
  
  if (a > 180) then
    a = a - 360
  elseif (a < -180) then
    a = a + 360
  end
  
  return a
end

-- rotates a point around the (0,0) point by degrees
-- returns new point object
local function rotatePoint( point, degrees )
  local x, y = point.x, point.y
  
  local theta = math.rad( degrees )
  
  local pt = {
    x = x * math.cos(theta) - y * math.sin(theta),
    y = x * math.sin(theta) + y * math.cos(theta)
  }

  return pt
end

-- rotates point around the centre by degrees
-- rounds the returned coordinates using math.round() if round == true
-- returns new coordinates object
local function rotateAboutPoint( point, centre, degrees, round )
  local pt = { x=point.x - centre.x, y=point.y - centre.y }
  pt = rotatePoint( pt, degrees )
  pt.x, pt.y = pt.x + centre.x, pt.y + centre.y
  if (round) then
    pt.x = math.round(pt.x)
    pt.y = math.round(pt.y)
  end
  return pt
end

-- calculates the average centre of a list of points
local function calcAvgCentre( points )
  local x, y = 0, 0
  
  for i=1, #points do
    local pt = points[i]
    x = x + pt.x
    y = y + pt.y
  end
  
  return { x = x / #points, y = y / #points }
end

-- calculate each tracking dot's distance and angle from the midpoint
local function updateTracking( centre, points )
  for i=1, #points do
    local point = points[i]
    
    point.prevAngle = point.angle
    point.prevDistance = point.distance
    
    point.angle = angleBetweenPoints( centre, point )
    point.distance = lengthOf( centre, point )
  end
end

-- calculates rotation amount based on the average change in tracking point rotation
local function calcAverageRotation( points )
  local total = 0
  
  for i=1, #points do
    local point = points[i]
    total = total + smallestAngleDiff( point.angle, point.prevAngle )
  end
  
  return total / #points
end

--calculates scaling amount based on the average change in tracking point distances
local function calcAverageScaling( points )
  local total, result = 0, 0
  
  for i=1, #points do
    local point = points[i]
    total = total + point.distance / point.prevDistance
  end
  
  return total / #points
end


-- creates an object to be moved
local function newTrackDot(e)
  -- create a user interface object
  local circle = display.newCircle( e.x, e.y, 25 )
  
  -- make it less imposing
  if isDevice then
    circle.isVisible = false
  else
    circle.alpha = .5
  end
  
  -- keep reference to the rectangle
  local rect = e.target
  
  -- standard multi-touch event listener
  function circle:touch(e)    
    -- get the object which received the touch event
    local target = circle
    
    -- store the parent object in the event
    e.parent = rect
    
    -- handle each phase of the touch event life cycle...
    if (e.phase == "began") then
      -- tell corona that following touches come to this display object
      print("FOCUS", e.id)
      display.getCurrentStage():setFocus(target, e.id)
      -- remember that this object has the focus
      target.hasFocus = true
      -- indicate the event was handled
      return true
    elseif (target.hasFocus) then
      -- this object is handling touches
      if (e.phase == "moved") then
        -- move the display object with the touch (or whatever)
        target.x, target.y = e.x, e.y
      else -- "ended" and "cancelled" phases
        -- stop being responsible for touches
        display.getCurrentStage():setFocus(target, nil)
        -- remember this object no longer has the focus
        target.hasFocus = false
      end
      
      -- send the event parameter to the rect object
      rect:touch(e)
      
      -- indicate that we handled the touch and not to propagate it
      return true
    end
    
    -- if the target is not responsible for this touch event return false
    return false
  end
  
  -- listen for touches starting on the touch layer
  circle:addEventListener("touch")
  
  -- listen for a tap when running in the simulator
  function circle:tap(e)
    if (e.numTaps == 2) then
      -- set the parent
      e.parent = rect
      
      -- call touch to remove the tracking dot
      rect:touch(e)
    end
    return true
  end
  
  -- only attach tap listener in the simulator
  if (not isDevice) then
    circle:addEventListener("tap")
  end
  
  -- pass the began phase to the tracking dot
  circle:touch(e)
  
  -- return the object for use
  return circle
end

local function setScale(scale)
  if scale < zoomMin then
    lockMove = true
    return zoomMin
  elseif scale > zoomMax then
    lockMove = true
    return zoomMax
  else
    lockMove = false
    return scale
  end
end


local function setPosition(coord, size)

  if coord > 0 then
    return 0
  elseif coord < size then
    return size
  else
    return 
    coord
  end
end

--------------------------------------------------
-- Listener
--------------------------------------------------

-- advanced multi-touch event listener
function touch(self, e)
  -- get the object which received the touch event
  local target = e.target
  
  -- get reference to self object
  local rect = self

  -- handle began phase of the touch event life cycle...
  if (e.phase == "began") then
    -- print( e.phase, e.x, e.y )
    
    -- create a tracking dot
    local dot = newTrackDot(e)
    
    -- add the new dot to the list
    rect.dots[ #rect.dots+1 ] = dot
    
    -- pre-store the average centre position of all touch points
    rect.prevCentre = calcAvgCentre( rect.dots )
    
    -- pre-store the tracking dot scale and rotation values
    updateTracking( rect.prevCentre, rect.dots )
    
    -- we handled the began phase
    return true
  elseif (e.parent == rect) then
    if (e.phase == "moved") then        
      
      -- declare working variables
      local centre, scale, rotate = {}, 1, 0
      
      -- calculate the average centre position of all touch points
      centre = calcAvgCentre( rect.dots )
      
      -- refresh tracking dot scale and rotation values
      updateTracking( rect.prevCentre, rect.dots )
      
      -- if there is more than one tracking dot, calculate the rotation and scaling
      if (#rect.dots > 1) then
        -- lockMove = true
        -- [DISABLED] calculate the average rotation of the tracking dots
        -- rotate = calcAverageRotation( rect.dots )
        
        -- calculate the average scaling of the tracking dots
        scale = calcAverageScaling( rect.dots )
        
        -- [DISABLED] apply rotation to rect
        -- rect.rotation = rect.rotation + rotate
        
        -- apply scaling to rect [KEEP zoomMin and Max size]
        local scaleX = setScale(rect.xScale * scale)
        local scaleY = setScale(rect.yScale * scale)
        rect.xScale, rect.yScale = scaleX, scaleY
      end
      
      -- declare working point for the rect location
      local pt = {}
      
      -- translation relative to centre point move
      pt.x = rect.x + (centre.x - rect.prevCentre.x)
      pt.y = rect.y + (centre.y - rect.prevCentre.y)
      
      -- scale around the average centre of the pinch
      -- (centre of the tracking dots, not the rect centre)
      pt.x = centre.x + ((pt.x - centre.x) * scale)
      pt.y = centre.y + ((pt.y - centre.y) * scale)
      
      -- rotate the rect centre around the pinch centre
      -- (same rotation as the rect is rotated!)
      -- pt = rotateAboutPoint( pt, centre, rotate, false )
      
      -- [MODIFIED]apply pinch translation, scaling and rotation to the rect centre
      -- rect.x, rect.y = pt.x, pt.y

      local pos = {}

      if lockMove == false then
        pos.x = setPosition(pt.x, (rect.width * rect.xScale-_W) *-1) 
        pos.y = setPosition(pt.y, (rect.height *rect.yScale-_H) *-1)
        rect.prevCentre = centre
      else
        pos.x = setPosition(rect.x, (rect.width * rect.xScale-_W) *-1) 
        pos.y = setPosition(rect.y, (rect.height *rect.yScale-_H) *-1)
        -- rect.prevCentre = centre
      end
      
      rect.x, rect.y = pos.x, pos.y
      -- store the centre of all touch points
      -- rect.prevCentre = centre
    else -- "ended" and "cancelled" phases
      
      
      -- remove the tracking dot from the list
      if (isDevice or e.numTaps == 2) then
        -- get index of dot to be removed
        local index = table.indexOf( rect.dots, e.target )
        
        -- remove dot from list
        table.remove( rect.dots, index )
        
        -- remove tracking dot from the screen
        e.target:removeSelf()
        
        -- store the new centre of all touch points
        rect.prevCentre = calcAvgCentre( rect.dots )
        
        -- refresh tracking dot scale and rotation values
        updateTracking( rect.prevCentre, rect.dots )

        -- release lock
        lockMove = false
      end


    end
    return true
  end  
  -- if the target is not responsible for this touch event return false
  return false
end

--------------------------------------------------
-- Constructor
--------------------------------------------------
function CityMapController:initialize(config)

  -- build the map field with map class
  
  if config.city == "NewYork" then
    mapClass = NewYorkMap:new(config)
  elseif config.city == "London" then
    mapClass = LondonMap:new(config)
  elseif config.city == "Milan" then
    mapClass = MilanMap:new(config)
  elseif config.city == "Paris" then
    mapClass = ParisMap:new(config)
  end

  group = mapClass:getBody()
  group.dots = {}
  group.touch = touch
  group:addEventListener("touch")

  -- resize and move the map at certain coordinate
  group.xScale = setScale(zoomMin)
  group.yScale = setScale(zoomMin)
  group.x = setPosition(-config.Xcoord * .5, (group.width * group.xScale-_W) *-1) 
  group.y = setPosition(-config.Ycoord * .5, (group.height *group.yScale-_H) *-1)  

  -- Check unlocked level / city

  function playAudio(e)
    audio.play( audioUnlockedSound )
  end

  
  -- Play sound if level unlocked
  if config.newLevelUnlocked then
    audioUnlockedSound = audio.loadSound( "assets/audios/level-unlocked.wav" )
    timer.performWithDelay( 500, playAudio )
  end

  -- -- Show Congratulations overlay if city unlocked
  -- if config.newCityUnlocked then
  --   audioUnlockedSound = audio.loadSound( "assets/audios/city-unlocked.wav" )
  --   timer.performWithDelay( 500, playAudio )
  --   showCityClearOverlay(config.newCity)
  -- end

end

--------------------------------------------------
-- Public workers
--------------------------------------------------


function CityMapController:rotate(isPortrait)
  _W, _H = display.contentWidth, display.contentHeight
  group.x = setPosition(group.x, (group.width * group.xScale-_W) *-1) 
  group.y = setPosition(group.y, (group.height *group.yScale-_H) *-1)
  mapClass:rotate(isPortrait)
end

function CityMapController:destroy()
  print("Destroy CityMapController")

  if audioUnlockedSound ~= nil then
    audio.dispose( audioUnlockedSound )
    audioUnlockedSound = nil
  end

  mapClass:destroy()
  self = nil
end