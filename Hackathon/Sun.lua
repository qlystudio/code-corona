local cos = math.cos
local sin = math.sin

local physics = require("physics")
--local sailor = require("Sailor")

local sun = display.newCircle(Layers.sky, 0, 0, 25)

sun.is_enemy = true
sun.points = 500
sun.type = "sun"

local R, G, B = 0xF3, 0xCF, 0x9

sun:setFillColor(R, G, B)

physics.addBody(sun, "kinematic", { radius = 25 })

local Rotate = {}

local Fire

Runtime:addEventListener("time_of_day", function(event)
	local when = event.when

	if when == "dawn" then
		sun.angle = math.pi

		Rotate.time, Rotate.angle, Fire = 700, math.pi * .8
	elseif when == "morning" then
		Rotate.time, Rotate.angle, Fire = 800, math.pi * .625, 2000
	elseif when == "noon" then
		Rotate.time, Rotate.angle, Fire = 700, math.pi / 2, 750
	elseif when == "evening" then
		Rotate.time, Rotate.angle, Fire = 900, math.pi * .375, 3000
	elseif when == "night" then
		Rotate.time, Rotate.angle, Fire = 500, -math.pi * .3
	end

	transition.to(sun, Rotate)
end)

local cx = display.contentWidth / 2
local cy = display.contentHeight

local OrbitRadius = display.contentHeight * .65

function sun:Place ()
	self.x = cx + cos(self.angle) * OrbitRadius
	self.y = cy - sin(self.angle) * OrbitRadius
end

local X, Y

function sun:Tell (x, y)
	X, Y = x, y
end

local function Act ()
	if Fire then
		local fire = display.newCircle(sun.parent, sun.x, sun.y + 20, 15)
		local dx, dy = X - sun.x, Y - sun.y
		local len = math.sqrt(dx * dx + dy * dy)

		fire.points = 50
		fire.type = "attack"
		fire:setFillColor(R, G, B)

		physics.addBody(fire, "dynamic", { radius = 15 })

		fire:setLinearVelocity(dx * 300 / len, dy * 300 / len)
	end

	timer.performWithDelay(Fire or 1000, Act)
end

timer.performWithDelay(1000, Act)

function Handlers.attack (phase, fire, other, what)
	if phase == "began" and what ~= "sun" and what ~= "attack" then
		fire:removeSelf()
	end
end

return sun