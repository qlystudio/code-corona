--Class.lua
 
local Base -- base of the class hierarchy (forward reference)
 
function Class(Super)
   Super = Super or Base
   local prototype = setmetatable({}, Super)
   prototype.class = prototype
   prototype.super = Super
   prototype.__index = prototype
   return prototype
end
 
Base = Class()

function Base:new(opt)   
   local instance = setmetatable({}, self)
   instance:initialize(opt)
   return instance
end
 
function Base:initialize()
end

function Base:destroy()
end

-- function Base:get()
--    local Instances = self.Instances
--    if (not Instances[1]) then local obj = self:new() end
--    return table.remove(Instances, 1)
-- end
 
-- function Base:dispose()
--    table.insert(self.Instances, self)
-- end
