local boat = require("Boat")
local sailor = require("Sailor")
local sun = require("Sun")

-- Controls
local Held

local function Touch (event)
	if event.phase == "ended" or event.phase == "cancelled" then
		Held = nil
	elseif event.phase == "began" then
		Held = event.target.dir
	end

	return true
end

local function Circle (source, dir)
	local x, y = source.x, source.y
	local circle = display.newCircle(source.parent, x + dir * source.width / 2, y, 25)

	circle:setFillColor(0, 255, 0)
	circle:setStrokeColor(255, 0, 0)
	circle.strokeWidth = 3

	circle.dir = dir

	return circle
end

local ac = Circle(boat.aft, -1)
local sc = Circle(boat.stern, 1)

ac:addEventListener("touch", Touch)
sc:addEventListener("touch", Touch)

-- Updates
Runtime:addEventListener("enterFrame", function(event)
	if Held then
		sailor.x = sailor.x + Held * DiffTo(event.time) * 50

		sun:Tell(sailor.x, sailor.y)
	end
end)

local Lives = 5
local Points = 0

Layers.hud = display.newGroup()

local li = display.newText(Layers.hud, "Lives: ", 20, 20, native.systemFont, 24)
local pi = display.newText(Layers.hud, "Points: ", 20, 100, native.systemFont, 24)

li:setTextColor(255, 0, 0)
pi:setTextColor(0, 255, 0)

local function I (n)
	return string.format("%i", n)
end

local function After (object, n)
	return display.newText(Layers.hud, I(n), object.x + object.width / 2 + 20, object.y - object.height / 2, native.systemFont, 24)
end

local lc = After(li, Lives)
local pc = After(pi, Points)

Runtime:addEventListener("sailor_died", function(event)
	Lives = Lives - 1

	if Lives == 0 then
		Lives = 5
		Points = 0

		pc.text = I(Points)
	end

	Held = nil

	lc.text = I(Lives)
end)

Runtime:addEventListener("scored_points", function(event)
	Points = Points + event.points

	pc.text = I(Points)
end)

return {}