local unpack = unpack

Layers.sky = display.newGroup()

local sky = display.newRect(Layers.sky, 0, 0, display.contentWidth, display.contentHeight)

local New = {}

local R, G, B

local ColorSwitch = { time = 1800, t = 1, transition = easing.inOutQuad }

function ColorSwitch.onComplete (new)
	R, G, B = new.r, new.g, new.b

	new.t = nil
end

local function SetColor (r, g, b)
	New.r, New.g, New.b = r, g, b
	New.t = 0

	transition.to(New, ColorSwitch)
end

local sun = require("Sun")

local TimeOfDay = {
	require("Dawn"),
	require("Morning"),
	require("Noon"),
	require("Evening"),
	require("Night"),
	index = 0
}

Runtime:addEventListener("enterFrame", function(event)
	local t = New.t

	if t then
		local s = 1 - t

		sky:setFillColor(s * R + t * New.r, s * G + t * New.g, s * B + t * New.b)
	end

	sun:Place()
end)

Runtime:addEventListener("time_of_day", function()
	timer.performWithDelay(5000, function()
		local index = (TimeOfDay.index + 1) % #TimeOfDay
		local tod = TimeOfDay[index + 1]

		TimeOfDay.index = index

		SetColor(unpack(tod))

		Runtime:dispatchEvent{ name = "time_of_day", when = tod.when }
	end)
end)

R, G, B = unpack(TimeOfDay[1])

sky:setFillColor(R, G, B)

Runtime:dispatchEvent{ name = "time_of_day", when = "dawn" }