require "com.vfiles.core.Class"

local Enemy = Class()
local startY = 220
local endY = 20
local upscale = 1 -- upscaling the enemy size from 100%
local debugMode = false

--------------------------------------------------
-- Listeners
--------------------------------------------------

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function resizeAndMove(self, diff, speed)
  -- Do only when sprite has new frame
  if(self.currentFrame == self.sprite.frame) then
      return false
  end
  
  -- Resize visual
  self.body.width = self.preset.w * diff * upscale
  self.body.height = self.preset.h * diff * upscale 
  
  self.sprite.xScale = diff * upscale 
  self.sprite.yScale = diff * upscale 

  -- self.shadow.xScale = diff * upscale 
  -- self.shadow.yScale = diff * upscale/2

  -- Resize hit areas
  -- for i=1, #self.hitAreas do
  --   -- self.hitAreas[i].width = self.hitAreas[i].ow * diff * upscale
  --   -- self.hitAreas[i].height = self.hitAreas[i].oh * diff * upscale 
  --   self.hitAreas[i].xScale = diff * upscale 
  --   self.hitAreas[i].yScale = diff * upscale     
  --   self.hitAreas[i].y = self.hitAreas[i].oy * diff * upscale 

  -- end

    self.hitAreas.width = self.hitAreas.ow * diff * upscale
    self.hitAreas.height = self.hitAreas.oh * diff * upscale 
    -- self.hitAreas.xScale = diff * upscale 
    -- self.hitAreas.yScale = diff * upscale     
    -- self.hitAreas.y = self.hitAreas.oy * diff * upscale 
    self.hitAreas.y = self.sprite.y - self.hitAreas.height - (24 * diff)

  -- Update position
  -- self.body.x = display.contentWidth/2 + (self.preset.offsetX * diff)
  self.body.x = (self.preset.offsetX * diff)
  self.body.y = self.body.y + speed

  

  -- Update values
  self.scale = self.scale - speed
  self.planeY = self.planeY - speed    
  self.body.z = self.planeY
  self.currentFrame = self.sprite.frame
end

local function sendScoreAndPlaySfx(self, weaponNm)
  --[[
    Eveny enemy has basePoint and pointException which defined from level file (com.vfiles.data.gamelevel..)
    pointException can be nil or array(table) contains key[weapon] and key[point]
    Check the pointException first. Match with weaponNm and see if it's eligible to give a special point instead of basePoint 
  ]]

  -- default point is always basePoint
  local pxp, point = self.levelData.pointException, self.levelData.basePoint

  if pxp ~= nil and pxp.weapon == weaponNm then  
    point = pxp.point
    sfx("hitCombo")
  else
    sfx("hit")
  end



  scene:dispatchEvent({name = "scoreEvent", data = {point = point}})
end

--------------------------------------------------
-- Constructor
--------------------------------------------------
  function Enemy:initialize(config)
    local hitAreas = {}
    local container, imgSheet, seqData, sprite, shadow, head, torso, legs
    local preset = {
        w = 150,
        h = 320,
        startY = startY,
        endY = endY
    }
    self.name = config.name
    self.levelData = config.levelData
    self.currentFrame = 0

    -- Build graphic container
    container = display.newContainer(config.parent, preset.w, preset.h)
    container.anchorChildren = false
    container.anchorY = 1
    container.y = -500

    if debugMode then
        dummyBg = display.newRect(container, 0, 0, preset.w, preset.h)
        dummyBg:setFillColor(1,0,1,.5)
        dummyBg.anchorY = 1
    end

    --Build shadow
    -- shadow = display.newCircle(container, 0, 0, 18 )
    -- shadow.anchorY = 1
    -- shadow.y = -40
    -- shadow:setFillColor( 0,0,0,.1 )
    -- shadow.height = shadow.height/2

    -- Build spirte (body image)
    imgSheet = {
        walkFront = graphics.newImageSheet(config.sheetInfo.walkFront.path , config.sheetInfo.walkFront.class:getSheet()),
        walkBack = graphics.newImageSheet(config.sheetInfo.walkBack.path , config.sheetInfo.walkBack.class:getSheet()),
        fallFront = graphics.newImageSheet(config.sheetInfo.fallFront.path , config.sheetInfo.fallFront.class:getSheet()),
        fallBack = graphics.newImageSheet(config.sheetInfo.fallBack.path , config.sheetInfo.fallBack.class:getSheet())
    }

    seqData =
    {
      {
        name="walk-front",
        frames={config.sheetInfo.walkFront.class:getFrameIndex("sprite")},
        start=1,
        count=15,
        time=1200,
        loopCount = 0,
        sheet = imgSheet.walkFront
      },
      {
        name="walk-back",
        frames={config.sheetInfo.walkBack.class:getFrameIndex("sprite")},
        start=1,
        count=15,
        time=1200,
        loopCount = 0,
        sheet = imgSheet.walkBack
      },
      {
        name="fall-front",
        frames={config.sheetInfo.fallFront.class:getFrameIndex("sprite")},
        start=1,
        count=15,
        time=1000,
        loopCount = 1,
        sheet = imgSheet.fallFront
      },
      {
        name="fall-back",
        frames={config.sheetInfo.fallBack.class:getFrameIndex("sprite")},
        start=1,
        count=15,
        time=700,
        loopCount = 1,
        sheet = imgSheet.fallBack
      }
    }

    sprite = display.newSprite(container, imgSheet.walkFront , seqData)
    sprite.anchorY = 1
    sprite.y = -30




    -- Build hitArea
    local offsetY = 0

    head = display.newRect(container, 0, 0, 50, 200)
    head.anchorY = 0
    head.y = 0 -- -preset.h/2 + offsetY
    head.ow = head.width
    head.oh = head.height
    head.oy = head.y
    if debugMode then
        head:setFillColor(0,1,0,.4)
      else
        head.isVisible = false
    end

    -- torso = display.newRect(container, 0, 0, 50, 30)
    -- torso.y = -preset.h/2 + head.height + offsetY
    -- torso.anchorY = 0
    -- torso.ow = torso.width
    -- torso.oh = torso.height
    -- torso.oy = torso.y
    -- if debugMode then
    --   torso:setFillColor(0,1,0,.4)
    -- else
    --   torso.isVisible = false
    -- end

    -- legs = display.newRect(container, 0, 0, 40, 120)
    -- legs.y = -preset.h/2 + head.height + torso.height + offsetY
    -- legs.anchorY = 0
    -- legs.ow = legs.width
    -- legs.oh = legs.height
    -- legs.oy = legs.y
    -- if debugMode then
    --   legs:setFillColor(0,1,0,.4)      
    -- else
    --   legs.isVisible = false
    -- end
    -- table.insert(hitAreas, head)
    -- table.insert(hitAreas, torso)
    -- table.insert(hitAreas, legs)

    self.body = container
    self.sprite = sprite    
    -- self.shadow = shadow
    -- self.hitAreas = hitAreas
    self.hitAreas = head
    self.preset = preset
    self.scale =  preset.startY
    self.planeY = startY
    self.collision = false
    self.groupTable = config.groupTable
  end

--------------------------------------------------
-- Public workers
--------------------------------------------------
  function Enemy:set(speed, offsetX, slot)
    --set the offset and speed in this function
    -- transition.cancel(self.blink)
    print(self.blink)
    if self.blink ~= nil then
      transition.cancel(self.blink)
      self.blink = nil
    end
    self.sprite.alpha = 0
    self.slot = slot
    self.preset.speed = speed
    self.preset.offsetX = offsetX
    self.preset.x = offsetX
    self.body.x = offsetX
    self.body.y = 0 --self.preset.startY
    self.scale = self.preset.startY

    self.planeY = startY
    self.collision = false
    self.flip = false    
    self.sprite:setSequence('walk-front')
    resizeAndMove(self, convertToPerspectivePos(self.scale), 0)
    self.body.isVisible = true

  end

  function Enemy:play()
    table.insert(self.groupTable, self)
    self.sprite:play()
    transition.fadeIn( self.sprite, { time=1000 } )
  end

  function Enemy:move()
    local diff, spd, frm, movable
    diff = convertToPerspectivePos(self.scale)
    spd = self.preset.speed
    frm = self.sprite.frame    

    -- Move only when collision is false
    if self.collision == true then 
        return false
    end
    

    -- Move the enemy in different frame by sequence
    if(self.flip == false) then
        movable = (frm >= 5 and frm <= 7) or (frm >= 12 and frm <= 14)
    else
        movable = (frm >= 2 and frm <= 5) or (frm >= 12 and frm <= 15)
    end
    
    if movable == true then
        -- Flip
        if (self.planeY < self.preset.endY or self.planeY > self.preset.startY) then            
            if self.flip == true then
                -- Leave to backstage
                self:leave()
                return false
            else
                self.flip = true
                self.sprite:setSequence('walk-back')
                self.sprite:play()
            end

            self.preset.speed = self.preset.speed * -1
            spd = self.preset.speed
        end
    else
        spd = spd * 0
    end
    resizeAndMove(self, diff, spd)
  end

  function Enemy:checkCollision(weapons)
    
    -- Return false if collision is true
    if self.collision == true then 
        return false
    end

    -- Check if there's a collision in y-axis (field distance) between weapon and enemy
    for i=1, table.maxn(weapons) do

        -- Return false if target weapon is nil
        if(weapons[i] == nil) then
            return false
        end

        local _distance_gap_diff = 50
        local weapon = weapons[i]
        local weaponPlaneY = weapon:getPlaneY()

        if weaponPlaneY < self.planeY and weaponPlaneY > self.planeY - _distance_gap_diff then
            
            local weaponPoint = weapon:getPointData()
                if weaponPoint == false then
                    -- print("Weapon is not available -- ")
                else
                    for j=1, table.maxn(weaponPoint) do
                        
                        -- When collision is true
                        if checkBound(self, weaponPoint[j]) == true then                                                     
                            self:collide(weapon.name)
                            weapon:collide()
                            break 
                        end
                    end -- for[j] end
                end

        end
    end -- for[i] end

    -- helper function
    function checkBound(self, point)
        local collide = false

        --[[

        -- Loop each of hitArea
        for i=1, table.maxn(self.hitAreas) do
            
            -- Create a bound value
            --  x1,y1      x2
            --     + ---- + 
            --     |      |
            --     |      |
            --     + ---- + 
            --  y2
            --

            local bound = {}
            local localX, localY = self.hitAreas[i]:localToContent(0,0) -- Center point
            local _wd = self.hitAreas[i].width/2
            local _ht = self.hitAreas[i].height/2
            bound.x1 = localX - _wd
            bound.y1 = localY - _ht
            bound.x2 = localX + _wd
            bound.y2 = localY + _ht

            collide = 
            bound.x1 < point.x and
            bound.x2 > point.x and
            bound.y1 < point.y and
            bound.y2 > point.y

            if collide == true then 
                -- print('------------------------------------------------------------')
                -- print('[x1]: ', math.floor(bound.x1), ' < ', math.floor(point.x))
                -- print('[x2]: ', math.floor(bound.x2), ' > ', math.floor(point.x))
                -- print('[y1]: ', math.floor(bound.y1), ' < ', math.floor(point.y))
                -- print('[y2]: ', math.floor(bound.y2), ' > ', math.floor(point.y))
                -- print('Collision detected on hitArea ', i)
                -- print('------------------------------------------------------------')
            break end
        end

        ]]

            local bound = {}
            local localX, localY = self.hitAreas:localToContent(0,0) -- Center point
            local _wd = self.hitAreas.width/2
            local _ht = self.hitAreas.height/2
            bound.x1 = localX - _wd
            bound.y1 = localY - _ht
            bound.x2 = localX + _wd
            bound.y2 = localY + _ht

            collide = 
            bound.x1 < point.x and
            bound.x2 > point.x and
            bound.y1 < point.y and
            bound.y2 > point.y        

        return collide
    end

  end

function Enemy:collide(weaponNm)
  self.collision = true

  ---------------
  -- Helpers
  ---------------
  function destroy(_self)
    if _self.collision then
      print("Enemy: collision destroy ", _self.name, _self.collision)
      _self.collision = false
      -- transition.cancel(_self.name .. "-blink")
      transition.cancel(_self.blink)
      scene:dispatchEvent( {name = "removeEnemyEvent", target = _self} )
      checkAmmoState()
    end
  end

  function spriteEndListener(e)
    if e.phase == 'ended' then      
      timer.performWithDelay(1000, function() destroy(self) end)
      e.target:removeEventListener( "sprite", spriteEndListener )
      self.blink = transition.blink(e.target, { time=400, tag = self.name .. "-blink"})
    end
  end

  -- send score 
  sendScoreAndPlaySfx(self, weaponNm)

  -- load different sequence based on flip status
  if self.flip == false then
    self.sprite:setSequence('fall-front')
  else
    self.sprite:setSequence('fall-back')
  end

  -- Play sprite and add listener to sprite
  self.sprite:addEventListener("sprite", spriteEndListener)
  self.sprite:play()
end

function Enemy:leave()
    self.collision = true
    function destroy(_self)
        -- print("Enemy: stage out destroy ", _self.name)
        scene:dispatchEvent( {name = "removeEnemyEvent", target = _self} )
    end
    transition.fadeOut( self.sprite, { time=400, onComplete=function() destroy(self) end})
end

function Enemy:destroy()
  -- for i=1, #self.hitAreas do
  --   self.hitAreas[i]:removeSelf()
  --   self.hitAreas[i] = nil
  -- end

    self.hitAreas:removeSelf()
    self.hitAreas = nil


    self.body:removeSelf()
    self.sprite:removeSelf()
    self.body = nil
    self.sprite = nil
    self = nil
end

return Enemy