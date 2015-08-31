local physics = require("physics")

Layers.boat = display.newGroup()
Layers.over_water = display.newGroup()

local bg = Layers.boat

-- Coordinate system
local x = 50
local y = display.contentHeight * .85
local w = display.contentWidth * .75
local h = display.contentHeight * .1

-- The boat!
local adx = .2 * w
local sdx = .8 * w

local boat = display.newRect(bg, x + adx, y, sdx - adx, h)

local N = 3
local dh = h / N

local body = { filter = { categoryBits = 0x1, maskBits = 0xFFFF } }

local function SetColor (object)
	object:setFillColor(255, 64, 64)

	physics.addBody(object, "static")

	object.type = "boat"
end

local aft, stern = {}, {}

for i = 1, N do
	local yi = y + (i - 1) * dh
	local wi = (N - i + 1) * (w - sdx) / N

	aft[i] = display.newRect(bg, x + adx - wi, yi, wi, dh)
	stern[i] = display.newRect(bg, x + sdx, yi, wi, dh)

	SetColor(aft[i])
	SetColor(stern[i])
end

SetColor(boat)

-- The mast!
local mw, mh = 30, 220
local mast = display.newRect(bg, x + .35 * w - mw / 2, y - mh, mw, mh)

mast:setFillColor(192, 32, 32)

-- A boat requires a sailor!
local sailor = require("Sailor")

sailor:HomePos(mast.x, y)
sailor:Spawn()

-- Start rocking the boat.
local RockBoat = { time = 1500, rotation = 2.5, transition = easing.inOutQuad }

function RockBoat.onComplete (object)
	RockBoat.rotation = -RockBoat.rotation

	transition.to(object, RockBoat)
end

transition.to(bg, RockBoat)

Layers.over_water:insert(bg)

return { aft = aft[1], stern = stern[1] }