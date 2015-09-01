require "com.vfiles.core.Class"
local Slide = Class()
local imgPath = "assets/images/ui/worldmapview/"
local bound = {x1=0,x2=0,y1=0,y2=0}

local function scaleTo(obj, n)
  transition.cancel()
  local _x = obj.ox + (obj.width - (obj.width*n))/2
  local _y = obj.oy + (obj.height - (obj.height*n))/2
  transition.to( obj, { xScale=n, yScale=n, x = _x, y = _y, delay=50, time=250, transition=easing.outExpo } )
end

local function loadCityMap(nm)
  -- composer.gotoScene( "com.vfiles.views.CityMapView", { time=450, effect="fade", params = { city = nm } })

  composer.gotoScene( "com.vfiles.views.LoadingGameView", {
    time = 450,
    effect = "fade",    
    params = { 
      sceneName = "com.vfiles.views.CityMapView",
      param = {
        city = nm
      }
    } 
  })
end

local function touchEvtListener(e)

  if e.phase == "began" then    
    -- Create boundary point 
    local padding = 10
    bound = {
      x1 = e.x - padding, 
      y1 = e.y - padding,
      x2 = e.x + padding,
      y2 = e.y + padding
    }
    scaleTo(e.target, .85)

  elseif e.phase == "moved" then
    -- Dispatch touch event to slider if moved and match condition
  
    if bound.x1 < e.x and bound.x2 > e.x and bound.y1 < e.y and bound.y2 > e.y then
      -- in safe zone
    else
      scaleTo(e.target, 1)
      e.target.slider:dispatchEvent({name = "touch", phase="began", x = e.x, y= e.y})
    end

  elseif e.phase == "ended" then    
    -- Proceed to next step if touch event ended from this slide w/o being moved
    if gameData:get("sfx") then audio.play(audioClick) end
    scaleTo(e.target, 1)
    loadCityMap(e.target.name)
  end



  return true
end

function Slide:initialize(_)
  local stage, img, panel, headerLb, levelLb, levelNumLb, lockIco, localData

  -- load Gamedata
  localData = gameData:get(_.name)

  -- Create stage (container)
  stage = display.newContainer( 200, 220 )
  stage.name = _.name
  stage.anchorChildren, stage.anchorX, stage.anchorY = false, 0, 0

  -- Add image
  img = display.newImageRect(stage, imgPath .. _.filename,  198, 169 )  
  img.anchorX, img.anchorY, img.x = 0,0,0

  -- Add back panel (bottom)
  panel = display.newRect(stage, 100, 157, 160, 56 )
  panel.anchorY = 0
  panel:setFillColor( .078, .078, .078 )

  -- Add text labels
  headerLb = display.newBitmapText(stage, "{yellow}" .._.label, 0, 0, "champion-40", 36)
  levelLb = display.newBitmapText(stage, "LEVEL", 0, 0, "champion-20", 15)
  levelNumLb = display.newBitmapText(stage, localData.currentLevel .. "/" .. localData.levelTotal, 0, 0, "champion-20", 20)
  headerLb:moveTo(100, 175)
  levelLb:moveTo(87, 201)
  levelNumLb:moveTo(110, 200)

  -- Add lock icon
  lockIco = display.newImageRect( stage, imgPath .. "ico-lock.png", 22, 28 )
  lockIco.x, lockIco.y = 160, 190

  if localData.locked then
    img.alpha =.5
    lockIco.isVisible = true
  else
    lockIco.isVisible = false
    stage:addEventListener( "touch", touchEvtListener )
  end
  self.stage = stage
end

function Slide:render()
  return  self.stage
end

function Slide:destroy()
  print("--X-- World Slide")


  self.stage:removeEventListener( "touch", touchEvtListener )
  for i=1, self.stage.numChildren do
    self.stage[1]:removeSelf()
    self.stage[1] = nil
  end
  self = nil
end

return Slide