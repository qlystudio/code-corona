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
		
		["trees4"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   0, 10  ,  2, 11  ,  0, 12  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   58, -7  ,  53, -7  ,  54, -11  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   57, 13  ,  66, 0  ,  68, 0  ,  70, 3  ,  70, 14  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -56, 25  ,  -56, 20  ,  -49, 19  ,  -48, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   34, 25  ,  35, 15  ,  40, 20  ,  40, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   10, 25  ,  10, 15  ,  16, 20  ,  16, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   10, 15  ,  22, 14  ,  16, 20  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -13, 25  ,  -13, 21  ,  -7, 14  ,  -5, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   35, 15  ,  53, -7  ,  58, -7  ,  47, 13  ,  40, 20  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -70, -2  ,  -68, -2  ,  0, 10  ,  -7, 14  ,  -42, 19  ,  -49, 19  ,  -58, 18  ,  -70, 15  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   24, 16  ,  32, 16  ,  30, 25  ,  25, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   43, -10  ,  22, -10  ,  37, -13  ,  43, -13  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -64, -10  ,  -45, -15  ,  -43, -10  ,  -68, -2  ,  -68, -7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   66, -6  ,  66, 0  ,  57, 13  ,  47, 13  ,  58, -7  ,  61, -10  ,  64, -10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   49, 25  ,  47, 13  ,  57, 13  ,  55, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -43, -10  ,  -45, -15  ,  -43, -14  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -35, 25  ,  -35, 22  ,  -27, 22  ,  -27, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   0, -15  ,  2, -11  ,  -23, -12  ,  -20, -15  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -45, -15  ,  -64, -10  ,  -63, -15  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -58, 18  ,  -49, 19  ,  -56, 20  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   34, -15  ,  37, -13  ,  22, -10  ,  22, -13  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -30, -13  ,  -28, -11  ,  -43, -10  ,  -37, -13  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -27, 22  ,  -35, 22  ,  -42, 19  ,  -7, 14  ,  -13, 21  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   22, 14  ,  53, -7  ,  35, 15  ,  32, 16  ,  24, 16  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2, 11  ,  53, -7  ,  22, 14  ,  10, 15  ,  3, 13  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   51, -7  ,  20, -8  ,  22, -10  ,  46, -10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   20, -8  ,  2, -11  ,  18, -11  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -28, -11  ,  20, -8  ,  -68, -2  ,  -43, -10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   20, -8  ,  -28, -11  ,  -23, -12  ,  2, -11  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   0, 10  ,  51, -7  ,  53, -7  ,  2, 11  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   51, -7  ,  0, 10  ,  -68, -2  ,  20, -8  }
                    }
                    
                    
                    
		}
		
		, 
		["trees3"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   16, 17  ,  23, 16  ,  23, 25  ,  16, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -32, 25  ,  -32, 10  ,  -25, 16  ,  -25, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -34, -7  ,  -42, -4  ,  -42, -6  ,  -38, -9  ,  -35, -9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   8, -12  ,  5, -9  ,  5, -11  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -10, 21  ,  -1, 22  ,  -1, 25  ,  -8, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -42, -4  ,  -48, 10  ,  -48, -3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   40, -4  ,  33, -7  ,  41, -7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -4, -12  ,  -3, -10  ,  -17, -5  ,  -15, -11  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -40, 14  ,  -45, 12  ,  -45, 10  ,  -32, 10  ,  -36, 14  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   29, -11  ,  8, -12  ,  9, -17  ,  27, -17  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   5, -9  ,  -32, 10  ,  -48, 10  ,  -17, -5  ,  -3, -10  ,  3, -11  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1, 22  ,  -10, 21  ,  5, -9  ,  8, -12  ,  29, -11  ,  33, -7  ,  16, 17  ,  12, 22  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   23, 16  ,  33, -7  ,  43, 7  ,  41, 11  ,  36, 16  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   43, 7  ,  33, -7  ,  40, -4  ,  43, -1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -32, 10  ,  5, -9  ,  -22, 15  ,  -25, 16  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -17, -5  ,  -34, -7  ,  -33, -9  ,  -20, -9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -34, -7  ,  -17, -5  ,  -48, 10  ,  -42, -4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -22, 15  ,  5, -9  ,  -10, 21  ,  -22, 18  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   16, 17  ,  33, -7  ,  23, 16  }
                    }
                    
                    
                    
		}
		
		, 
		["trees2"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -31, 25  ,  -31, 11  ,  -25, 19  ,  -24, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   19, 18  ,  26, 16  ,  26, 25  ,  19, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   15, -18  ,  32, -12  ,  36, -8  ,  47, 7  ,  11, -13  ,  11, -17  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   45, -2  ,  47, 7  ,  36, -8  ,  43, -8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -31, 11  ,  -21, 15  ,  -25, 19  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -9, 21  ,  1, 22  ,  -6, 23  ,  -8, 23  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   8, 21  ,  19, 18  ,  14, 23  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -10, -12  ,  8, -10  ,  -15, -6  ,  -14, -11  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   35, 15  ,  45, 8  ,  44, 12  ,  39, 17  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -34, -7  ,  -45, 10  ,  -48, 9  ,  -44, -3  ,  -38, -9  ,  -34, -9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -6, 25  ,  -6, 23  ,  1, 22  ,  1, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -45, 12  ,  -45, 10  ,  -34, -7  ,  -33, 11  ,  -35, 14  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   32, -12  ,  15, -18  ,  31, -17  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -44, -3  ,  -48, 9  ,  -47, -3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   47, 7  ,  45, -2  ,  47, -1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   26, 16  ,  -31, 11  ,  45, 8  ,  35, 15  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -21, 15  ,  19, 18  ,  8, 21  ,  1, 22  ,  -9, 21  ,  -20, 18  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -18, -7  ,  -33, 11  ,  -34, -7  ,  -32, -9  ,  -18, -9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -15, -6  ,  -33, 11  ,  -18, -7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   8, -10  ,  47, 7  ,  45, 8  ,  -31, 11  ,  -33, 11  ,  -15, -6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   47, 7  ,  8, -10  ,  11, -13  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -31, 11  ,  26, 16  ,  19, 18  ,  -21, 15  }
                    }
                    
                    
                    
		}
		
		, 
		["trees1"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   60, -7  ,  57, -7  ,  58, -10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   4, 25  ,  5, 20  ,  9, 19  ,  10, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -13, 25  ,  -12, 20  ,  -7, 19  ,  -7, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   21, 25  ,  21, 16  ,  27, 17  ,  28, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   21, 16  ,  28, 11  ,  27, 17  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -51, -17  ,  -36, -16  ,  -54, -13  ,  -54, -16  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -23, 21  ,  -15, 21  ,  -17, 25  ,  -23, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   53, 25  ,  53, 14  ,  58, 17  ,  58, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   53, 14  ,  51, 10  ,  60, -7  ,  60, 11  ,  58, 17  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   67, -6  ,  67, -1  ,  60, 11  ,  60, -7  ,  65, -9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2, 18  ,  31, 6  ,  21, 16  ,  5, 20  ,  3, 20  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -35, 18  ,  -31, 23  ,  -31, 25  ,  -35, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -21, -12  ,  1, -12  ,  5, -8  ,  -25, -5  ,  -25, -10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   36, -18  ,  11, -17  ,  27, -23  ,  32, -24  ,  36, -22  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   60, 11  ,  67, -1  ,  70, 0  ,  71, 5  ,  71, 11  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1, -12  ,  -21, -12  ,  -19, -18  ,  -2, -18  ,  1, -16  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -49, 25  ,  -49, 11  ,  -44, 12  ,  -43, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   41, 25  ,  41, 11  ,  46, 17  ,  45, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   41, 11  ,  60, -7  ,  51, 10  ,  46, 17  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   22, -25  ,  25, -25  ,  27, -23  ,  11, -17  ,  12, -23  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -60, -4  ,  -57, 8  ,  -68, 8  ,  -71, 5  ,  -71, 1  ,  -67, -4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -54, -13  ,  -36, -16  ,  -36, -13  ,  -41, 12  ,  -44, 12  ,  -58, -6  ,  -58, -10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -60, -4  ,  -58, -6  ,  -44, 12  ,  -49, 11  ,  -57, 8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   9, 19  ,  21, 16  ,  17, 20  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   48, -9  ,  33, 5  ,  5, -8  ,  40, -12  ,  48, -12  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -41, 12  ,  -7, 19  ,  -12, 20  ,  -23, 21  ,  -35, 18  ,  -39, 16  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -33, -4  ,  -41, 12  ,  -36, -13  ,  -33, -10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -19, -18  ,  -21, -12  ,  -21, -17  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   28, 11  ,  31, 6  ,  30, 10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   9, -17  ,  11, -17  ,  40, -12  ,  5, -8  ,  6, -14  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   33, 5  ,  53, -7  ,  60, -7  ,  41, 11  ,  37, 10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   40, -12  ,  11, -17  ,  36, -18  ,  38, -17  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   21, 16  ,  31, 6  ,  28, 11  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -35, 18  ,  -27, 20  ,  -31, 23  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -23, 21  ,  -12, 20  ,  -15, 21  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -41, 12  ,  -30, -3  ,  -25, -5  ,  33, 5  ,  31, 6  ,  2, 18  ,  -7, 19  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   33, 5  ,  48, -9  ,  53, -7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   33, 5  ,  -25, -5  ,  5, -8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.8, bounce = 0.01, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -30, -3  ,  -41, 12  ,  -33, -4  }
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
