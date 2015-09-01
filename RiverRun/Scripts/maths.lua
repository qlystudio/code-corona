--[[ Supposedly initializing sqrt as a local function like this
     will improve the programs performance.
     For the record I think it's silly ]]
local sqrt = math.sqrt
-- A function to calculate the magnitude of a vector <x,y>
function magnitude(x, y)
   return sqrt(x*x+y*y)
end

-- A function to calculate the directional of a vector <x,y>
function directional(x, y)
   local mag = magnitude(x, y)
   return x/mag, y/mag
end

-- A function to calculate the distance between two lua objects
function magnitudeObj(A, B)
   return magnitude( (A.x - B.x) , (A.y - B.y) )
end