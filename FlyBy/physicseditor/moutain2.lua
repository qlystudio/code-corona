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
		
		["Mountain_01"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   56.5, -27  ,  -62.5, -26  ,  -38.5, -46  ,  -25.5, -53  ,  22.5, -55  ,  46.5, -47  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   71.5, -10  ,  -101.5, 47  ,  -97.5, 44  ,  67.5, -13  ,  69.5, -13  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   141.5, 68  ,  138.5, 63  ,  140.5, 64  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   106.5, 37  ,  -101.5, 47  ,  71.5, -10  ,  76.5, -8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   134.5, 56  ,  119.5, 44  ,  131.5, 50  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   11.5, -59  ,  -25.5, -53  ,  1.5, -61  ,  9.5, -61  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   138.5, 63  ,  134.5, 56  ,  136.5, 57  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   88.5, 2  ,  106.5, 37  ,  78.5, -5  ,  83.5, -3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   61.5, -18  ,  -62.5, -26  ,  56.5, -27  ,  58.5, -26  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -101.5, 47  ,  106.5, 37  ,  138.5, 63  ,  141.5, 68  ,  -145.5, 68  ,  -136.5, 58  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   22.5, -55  ,  -25.5, -53  ,  11.5, -59  ,  20.5, -57  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   138.5, 63  ,  106.5, 37  ,  119.5, 44  ,  134.5, 56  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -62.5, -24  ,  -81.5, -2  ,  -81.5, -6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -62.5, -24  ,  -85.5, 10  ,  -81.5, -2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   119.5, 44  ,  106.5, 37  ,  118.5, 42  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -38.5, -46  ,  -62.5, -26  ,  -43.5, -45  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -85.5, 10  ,  -97.5, 44  ,  -87.5, 12  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -62.5, -24  ,  67.5, -13  ,  -97.5, 44  ,  -85.5, 10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   67.5, -13  ,  -62.5, -24  ,  -62.5, -26  ,  61.5, -18  }
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
