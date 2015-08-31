local boat = require("Boat")
local physics = require("physics")

local x1 = boat.aft.x - 110
local x2 = boat.stern.x + 60

local function NewShark (group)
	local shark = display.newGroup()

	group:insert(shark)

	local top = display.newRect(shark, 10, 0, 20, 20)
	local bottom = display.newRect(shark, 0, 20, 40, 20)

	top:setFillColor(192, 192, 192)
	bottom:setFillColor(192, 192, 192)

	return shark
end

local shark = NewShark(Layers.over_water)

shark.x = display.contentWidth
shark.y = display.contentHeight * .9

local y = shark.y

local Move = { time = 1600, x = 20, transition = easing.inOutQuad }
local Vert = { time = 750, transition = easing.inOutQuad }

function Move.onComplete (shark)
	if shark.go_right then
		Move.x = x2
		shark:toBack()
		Vert.y = y - 5
	else
		Move.x = x1
		shark:toFront()
		Vert.y = y + 20
	end

	shark.go_right = not shark.go_right

	transition.to(shark, Move)
	transition.to(shark, Vert)
end

Move.onComplete(shark)

local FadeOut = {
	time = 500, alpha = .05, transition = easing.outExpo,

	onComplete = function(object)
		object:removeSelf()
	end
}

local function SpawnAttack ()
	local x = x1 + (.1 + .8 * math.random()) * (x2 - x1)
	local attack = NewShark(Layers.over_water)

	attack.x = x
	attack.y = y

	timer.performWithDelay(800, function()
		attack.is_enemy = true
		attack.points = 150
		attack.type = "shark"

		physics.addBody(attack, "kinematic")

		attack:setLinearVelocity(0, math.random(-400, -250))

		timer.performWithDelay(750, function()
			transition.to(attack, FadeOut)

			timer.performWithDelay(math.random(750, 3500), SpawnAttack)
		end)
	end)
end

timer.performWithDelay(3000, SpawnAttack)