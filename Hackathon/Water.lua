local random = math.random

local physics = require("physics")

local wg = display.newGroup()

local h = display.contentHeight * .1

local Undulate = { transition = easing.inOutQuad }

local function Y (frac, init)
	return display.contentHeight - (.45 + frac * .06) * h + (init and -h / 2 or 0)
end

local function ToY (incy)
	Undulate.time = random(400, 700)
	Undulate.y = Y(incy and 1 or -1)
end

function Undulate.onComplete (object)
	ToY(object.incy)

	object.incy = not object.incy

	transition.to(object, Undulate)
end

local N = 15
local dw = display.contentWidth / N

local water = {}

for i = 1, N do
	water[i] = display.newRect(wg, (i - 1) * dw, Y(math.random() * 2 - 1, true), dw, h)

	water[i]:setFillColor(0, 0, 255) 

	ToY(i % 2 == 0)

	transition.to(water[i], Undulate)
end

Layers.water = wg

local function CollRect (x, y, w, h, type)
	local coll = display.newRect(wg, x, y, w, h)

	physics.addBody(coll, "static")

	coll.isVisible = false
	coll.type = type
end

CollRect(-100, display.contentHeight - h, display.contentWidth + 200, h + 100, "water")
CollRect(-100, -100, 100, display.contentHeight + 200, "wall")
CollRect(display.contentWidth, -100, 100, display.contentHeight + 200, "wall")
CollRect(-100, -100, display.contentWidth + 200, 100, "wall")
CollRect(-100, display.contentHeight, display.contentWidth + 200, 100, "wall")