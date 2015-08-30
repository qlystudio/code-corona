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

local M = {}

function M.physicsData(scale)
	local physics = { data =
	{ 
		
		["cloud1"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "cloud1", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   61.5, 30.5  ,  -73.5, 30.5  ,  -71.5, -27.5  ,  63.5, -30.5  ,  85.5, 3.5  }
                    }
                    
                    
                    
		}
		
		, 
		["cloud2"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "cloud2", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 2, maskBits = 65535, groupIndex = 0 },
                    shape = {   -71, -23.5  ,  69, -23.5  ,  68, 25.5  ,  -70, 28.5  }
                    }
                    
                    
                    
		}
		
		, 
		["char_walk_2"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "angel", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 4, maskBits = 65535, groupIndex = 0 },
                    shape = {   -51, -8.5  ,  -29, -53.5  ,  12, -68.5  ,  -26, 21.5  ,  -51, 20.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "angel", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 4, maskBits = 65535, groupIndex = 0 },
                    shape = {   0, 71.5  ,  -26, 21.5  ,  18, 40.5  ,  22, 69.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "angel", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 4, maskBits = 65535, groupIndex = 0 },
                    shape = {   18, 40.5  ,  -26, 21.5  ,  12, -68.5  ,  58, -4.5  }
                    }
                    
                    
                    
		}
		
		, 
		["monster_blue"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   2, 39  ,  -14, 31  ,  -30, 19  ,  -14, -27  ,  31, 22  ,  34, 52  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   26, -22  ,  2, -34  ,  37, -49  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   31, 22  ,  37, 9  ,  52, 9  ,  60, 28  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   -14, -27  ,  -30, -11  ,  -49, -38  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   -14, 31  ,  2, 39  ,  -13, 66  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   55, -19  ,  37, 9  ,  26, -22  ,  53, -34  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   -54, 7  ,  -30, -11  ,  -30, 19  ,  -55, 19  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   2, -34  ,  -14, -27  ,  1, -64  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   37, 9  ,  31, 22  ,  -14, -27  ,  2, -34  ,  26, -22  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   -14, -27  ,  -30, 19  ,  -30, -11  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   -30, 19  ,  -24, 31  ,  -44, 56  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_blue", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 8, maskBits = 65535, groupIndex = 0 },
                    shape = {   -30, 19  ,  -14, 31  ,  -24, 31  }
                    }
                    
                    
                    
		}
		
		, 
		["monster_grey1"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "monster_grey1", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 16, maskBits = 65535, groupIndex = 0 },
                    shape = {   -5.5, 60  ,  -32.5, 1  ,  -32.5, -14  ,  35.5, -46  ,  46.5, -2  ,  37.5, 51  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_grey1", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 16, maskBits = 65535, groupIndex = 0 },
                    shape = {   -32.5, 1  ,  -5.5, 60  ,  -34.5, 45  ,  -48.5, 26  }
                    }
                     ,
                    {
                    pe_fixture_id = "monster_grey1", density = 2, friction = 1, bounce = 0, 
                    filter = { categoryBits = 16, maskBits = 65535, groupIndex = 0 },
                    shape = {   35.5, -46  ,  -32.5, -14  ,  3.5, -61  }
                    }
                    
                    
                    
		}
		
	} }

        -- apply scale factor
        local s = scale or 1.0
        for bi,body in pairs(physics.data) do
                for fi,fixture in ipairs(body) do
                    if(fixture.shape) then
                        for ci,coordinate in ipairs(fixture.shape) do
                            fixture.shape[ci] = s * coordinate
                        end
                    else
                        fixture.radius = s * fixture.radius
                    end
                end
        end
	
	function physics:get(name)
		return unpack(self.data[name])
	end

	function physics:getFixtureId(name, index)
                return self.data[name][index].pe_fixture_id
	end
	
	return physics;
end

return M
