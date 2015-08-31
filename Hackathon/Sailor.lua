local cos = math.cos
local sin = math.sin
local sqrt = math.sqrt

local sdim = 40
local sailor = display.newRect(Layers.boat, 0, 0, sdim, sdim)

physics.addBody(sailor)

sailor.type = "sailor"

local X, Y

function sailor:HomePos (x, y)
	X, Y = x, y
end
--physics.setDrawMode("hybrid")
local Transition = {
	time = 300, transition = easing.inExpo,

	onComplete = function(object)
		object:removeSelf()
	end
}

local function Circle (r, g, b)
	local circle = display.newCircle(sailor.parent, sailor.x, sailor.y, 2)

	circle:setStrokeColor(r, g, b)
	circle.strokeWidth = 5

	Transition.xScale, Transition.yScale = 10, 10

	transition.to(circle, Transition)
end

function sailor:Spawn ()
	sailor.x, sailor.y = X, Y - sdim - 20

	Circle(0, 0, 255)

	sailor.dead = false

	timer.performWithDelay(500, function()
		sailor.hurtable = true
	end)
end

local function Die ()
	Circle(255, 0, 0)

	Runtime:dispatchEvent{ name = "sailor_died" }

	sailor.dead = true
	sailor.hurtable = false

	timer.performWithDelay(1500, function()
		sailor:Spawn()
	end)
end

function Handlers.sailor (phase, sailor, other, what)
	if phase == "began" and not sailor.dead then
		if what == "water" or (what == "attack" and sailor.hurtable) then
			Die()
		end
	end
end

function Handlers.spear (phase, spear, other, what)
	if phase == "began" then
		if what == "boat" or what == "sailor" or what == "spear" then
			return
		elseif other.is_enemy or what == "spear" then
			Runtime:dispatchEvent{ name = "scored_points", points = other.points }
		end

		spear:removeSelf()
	end
end

Runtime:addEventListener("tap", function(event)
	if event.numTaps >= 2 and not sailor.dead then
		local dx, dy = event.x - sailor.x, event.y - sailor.y
		local len = sqrt(dx * dx + dy * dy)

		if len > 1e-3 then
			local spear = display.newGroup()

			dx, dy = dx / len, dy / len

			local spear = display.newCircle(spear, sailor.x + dx * 10, sailor.y + dy * 10, 20)

			spear.points = 1000
			spear.type = "spear"

			physics.addBody(spear, "dynamic", { radius = 20 })

			spear:setLinearVelocity(dx * 600, dy * 600)
		end
	end
end)

return sailor