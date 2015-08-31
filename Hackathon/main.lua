-- Imports --
local assert = assert
local ipairs = ipairs
local pcall = pcall
local print = print
local type = type
local yield = coroutine.yield

-- Modules --
local physics = require("physics")

physics.start()

math.randomseed(os.time())

-- Seconds since last frame --
local Diff = 0

-- Timer --
local T = system.getTimer()

-- --
Handlers = {}

-- --
Layers = {}

require("Sky")
require("Water")
require("Boat")
require("Sharks")
require("Interface")

function DiffTo (time)
	return (time - T) / 1000
end

--
Runtime:addEventListener("enterFrame", function(event)
	Diff, T = (event.time - T) / 1000, event.time
end)

--
Runtime:addEventListener("collision", function(event)
	local o1, t1 = event.object1, event.object1.type
	local o2, t2 = event.object2, event.object2.type

	if Handlers[t1] then
		Handlers[t1](event.phase, o1, o2, t2)
	end

	if Handlers[t2] then
		Handlers[t2](event.phase, o2, o1, t1)
	end
end)