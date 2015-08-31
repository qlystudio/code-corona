local cos = math.cos
local ipairs = ipairs
local random = math.random
local sin = math.sin
local two_pi = math.pi * 2

local Stars

local GrowStar = { transition = easing.outExpo }

function GrowStar.onComplete (object)
	if object == Stars then
		object:removeSelf()

		Stars = nil
	end
end

local Rows = 3
local Cols = 4

local dw = display.contentWidth / Cols
local dh = .9 * display.contentHeight / Rows

local function SetGrow (alpha, scale)
	GrowStar.alpha, GrowStar.xScale, GrowStar.yScale = alpha, scale, scale
end

Runtime:addEventListener("time_of_day", function(event)
	if event.when == "night" then
		SetGrow(.3, 10)

		Stars = display.newGroup()

		Layers.sky:insert(Stars)

		for row = 1, Rows do
			local y = (row - .5) * dh

			for col = 1, Cols do
				local x = (col - .5) * dw
				local radius = (.5 - random()) * .4
				local angle = random() * two_pi
				local star = display.newCircle(Stars, x + radius * cos(angle) * dw, y + radius * sin(angle) * dh, 1)

				star.alpha = .125

				GrowStar.time = random(1500, 2500)

				transition.to(star, GrowStar)
			end
		end

	elseif Stars then
		SetGrow(.125, 1)

		GrowStar.time = random(1300, 1700)

		transition.to(Stars, GrowStar)
	end
end)

return { 0, 0, 0, when = "night" }