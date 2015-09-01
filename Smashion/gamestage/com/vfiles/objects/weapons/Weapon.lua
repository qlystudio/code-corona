require "com.vfiles.core.Class"

local Weapon = Class()
local gravity = 1.13

--------------------------------------------------
-- Listeners
--------------------------------------------------

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function createPuff(self)
    local _x, _y = self.body.x , self.body.y 
    -- local _x, _y = self.body.x + display.contentWidth/2, self.body.y + display.contentHeight/2 + 60        
    local puff= display.newImageRect(self.parent, "assets/images/weapons/puff-".. math.random(1,4) .. ".png", 86, 49)
    puff.x, puff.y = self.body.x, self.body.y
    puff.xScale, puff.yScale = self.body.xScale, self.body.yScale
    
    function removePuff()
        puff:removeSelf()
    end

    timer.performWithDelay( 700, removePuff)
end

--------------------------------------------------
-- Constructor
--------------------------------------------------
function Weapon:initialize(config)

    local preset = {
        width = config.width,
        height = config.height,
        x = 0,
        y = 100
    }

    self.shadow = display.newImageRect(config.parent, "assets/images/weapons/shadow.png", preset.width, preset.height/2)
    self.shadow.x = preset.x
    self.shadow.y = preset.y

    self.imgSheet = graphics.newImageSheet(config.sheetInfo.path , config.sheetInfo.class:getSheet())

    local  seqData = {
        name= config.name,
        frames={config.sheetInfo.class:getFrameIndex("sprite")},
        start=1,
        count=config.sheetInfo.frames,
        time=500,
        loopCount = 0
    }

    self.body = display.newSprite(config.parent, self.imgSheet , seqData)
    self.body.x = preset.x
    self.body.y = preset.y    
    self.body:play()

    self.name = config.name
    self.groupTable = config.groupTable
    self.preset = preset
    self.parent = config.parent
    
    self.weight = config.weight
    self.fired = false
    self.collision = false

    self.planeData = {x = 0, y = 0, z = 0, dx = 0, dy = 0, dz = 0}
    self.persData = {x = 0, y = 0, z = 0, dx = 0, dy = 0}

    table.insert(self.groupTable, self)
end

--------------------------------------------------
-- Public workers
--------------------------------------------------

function Weapon:fire(topDeg, sideDeg, velocity)
    --------------------------------------------------
    -- planeData
    -- based on topview coordinate
    --
    --             | y+
    --             |
    --             |
    --             |
    --  -x <------ z -------> x+
    --------------------------------------------------    
    -- planeData.dx = math.cos(topDeg) * velocity

    self.planeData.dy = math.cos(sideDeg) * velocity
    self.planeData.dz = math.sin(sideDeg) * velocity
    self.persData.dx = math.cos(topDeg) * velocity
    self.persData.dy = math.cos(sideDeg) * velocity
    self.fired = true
end


function Weapon:move()
    if self.fired == false or self.collision == true then
        return false
    end
    --------------------------------------------------
    -- Update planeData
    --------------------------------------------------
    -- planeData.x = planeData.x + planeData.dx
    self.planeData.y = math.floor(self.planeData.y + self.planeData.dy)
    self.planeData.z = self.planeData.z + self.planeData.dz - self.weight

    --------------------------------------------------
    -- Update Perspective
    --------------------------------------------------
    local _diff = convertToPerspectivePos(self.planeData.y)
    local _z = self.planeData.z * _diff
    if _z < 0 then
     _z = 0
    end
    self.persData.x = (self.persData.x + self.persData.dx * _diff)
    self.persData.y = (self.persData.y - self.persData.dy * _diff)
    self.persData.z = (self.persData.y  - _z)


    --Check the floor collision
    if self.planeData.z <= 0 then
     self:collide(true)
     return false
    end
    
    --------------------------------------------------
    -- Update position and size
    --------------------------------------------------

    self.shadow.x = self.preset.x + self.persData.x
    local shadowY = self.preset.y + self.persData.y  + self.shadow.height
    
    if shadowY < 0 then
        shadowY = shadowY/4
    end
    self.shadow.y = shadowY

    self.shadow.width = self.preset.width * _diff
    self.shadow.height = self.preset.height * _diff  /8
    self.shadow.z = self.planeData.y

    self.body.x = self.preset.x + self.persData.x
    self.body.y = self.preset.y + self.persData.z

    self.body.xScale = _diff
    self.body.yScale = _diff
    self.body.z = self.planeData.y

    --------------------------------------------------
    -- Update Weight
    --------------------------------------------------
    self.weight = self.weight  * gravity
    

end

function Weapon:getPlaneY()
    return self.planeData.y
end

function Weapon:getWeight()
    return self.weight
end

function Weapon:getPointData()

    -- This function is returning the stage coordinate (x,y) of four corners (See the diagram below) 
    --
    --  1            4
    --    + ------ + 
    --    |        |
    --    |    5   |
    --    |        |
    --    + ------ + 
    --  2            3
    -- 
    -- 

    if self.body == nil then return false end

    local point = {}
    local localX, localY = self.body:localToContent(0,0) -- Center point
    local _wd = self.body.width/2
    local _ht = self.body.height/2

    point[1] = {x = localX - _wd, y = localY - _ht}
    point[2] = {x = localX - _wd, y = localY + _ht}
    point[3] = {x = localX + _wd, y = localY + _ht}
    point[4] = {x = localX + _wd, y = localY - _ht}
    point[5] = {x = localX, y = localY}

    return point
end

function Weapon:collide(hitFloor)
    self.collision = true
    self.body:pause()
    -- Remove self from groupTable
    for i=1, table.maxn(self.groupTable) do        
        if self.groupTable[i] == self then
            table.remove(self.groupTable,i)
        end
    end
    
    if hitFloor then 
        checkAmmoState()
    else
        createPuff(self) 
    end   
    self:destroy()
end

function Weapon:zAxis()
    return 0
    end

function Weapon:destroy()   
  self.body:removeSelf()
  self.shadow:removeSelf()
  self.imgSheet = nil
  self.body = nil
  self.shadow = nil
  self = nil
end

return Weapon