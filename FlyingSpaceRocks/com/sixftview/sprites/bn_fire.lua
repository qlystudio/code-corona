-- This file is for use with Corona(R) SDK
--
-- This file is automatically generated with PhysicsEdtior (http://physicseditor.de). Do not edit
--
-- Usage example:
--			local scaleFactor = 1.0
--			local physicsData = (require "shapedefs").physicsData(scaleFactor)
--			local shape = display.newImage("objectname.png")
--			physics.addBody( shape, physicsData:get("objectname") )
--

-- copy needed functions to local scope
local unpack = unpack
local pairs = pairs
local ipairs = ipairs

module(...)

function physicsData(scale)
	local physics = { data =
	{ 
		
		["bn_shield"] = {
			
				{
                                    pe_fixture_id = "shield", density = 0, friction = 0, bounce = 0, 
					filter = { categoryBits = 0, maskBits = 0 },
					shape = {   69.5, -41.5  ,  33.5, -34.5  ,  -8.5, -52.5  ,  39.5, -71.5  ,  69.5, -71.5  }
				}  ,
				{
                                    pe_fixture_id = "shield", density = 0, friction = 0, bounce = 0, 
					filter = { categoryBits = 0, maskBits = 0 },
					shape = {   -5.5, -11.5  ,  -53.5, -7.5  ,  -8.5, -52.5  ,  33.5, -34.5  }
				}  ,
				{
                                    pe_fixture_id = "shield", density = 0, friction = 0, bounce = 0, 
					filter = { categoryBits = 0, maskBits = 0 },
					shape = {   -33.5, 31.5  ,  -68.5, 28.5  ,  -53.5, -7.5  ,  -5.5, -11.5  }
				}  ,
				{
                                    pe_fixture_id = "shield", density = 0, friction = 0, bounce = 0, 
					filter = { categoryBits = 0, maskBits = 0 },
					shape = {   -39.5, 67.5  ,  -69.5, 70.5  ,  -68.5, 28.5  ,  -33.5, 31.5  }
				}  
		}
		
		, 
		["bn_fire"] = {
			
				{
                                    pe_fixture_id = "fire", density = 0, friction = 0, bounce = 0, 
					filter = { categoryBits = 0, maskBits = 0 },
					shape = {   -53.5, 57  ,  -52.5, 21  ,  -36.5, -14  ,  -9.5, -41  ,  35.5, -58  ,  53.5, -58  ,  54.5, 56  }
				}  
		}
		
	} }

	-- apply scale factor
	local s = scale or 1.0
	for bi,body in pairs(physics.data) do
		for fi,fixture in ipairs(body) do
			for ci,coordinate in ipairs(fixture.shape) do
				fixture.shape[ci] = s * coordinate
			end
		end
	end
	
	function physics:get(name)
		return unpack(self.data[name])
	end
	
	return physics;
end


