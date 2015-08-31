local B, C = 0, 0

local sky = require("Sky")

return {
	3000,

	sky.AdvanceTime,

	{ time = 2000, func = function() B = B + 1 end },

	sky.AdvanceTime,
require("Sharks"),
	{ until_cond = function() return C == 150 end, func = function() C = C + 1 end },

	sky.AdvanceTime,

	3000,

	sky.AdvanceTime,

	{ while_cond = function() return C > 0 end, func = function() C = C - 1 end }
}