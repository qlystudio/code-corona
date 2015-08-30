local ShieldInvisable = {}

function ShieldInvisable:new()
	local group = display.newGroup()
	local gtween = require "com.vendor.gtween"
	local shieldTimer
	local cir = display.newCircle(0,0, 50)
	cir:setFillColor(128,128,128, 150)
	
	print("new shield")
	
	group:insert(cir)
	
	local shieldBody = {density=1, friction=5, bounce=1.5, filter={categoryBits=18, maskBits=10}}
	physics.addBody(group, "static", shieldBody)
	
	
	local function killShield()
		cir:removeSelf()
		group:removeSelf()
		group = nil
		shieldTimer = nil
	end
	cir.width = 0
	cir.height = 0
	
	gtween.new(group, 2, {width=100, height=100})
	shieldTimer = timer.performWithDelay(10000, killShield, 1)
	
	return group
end

return ShieldInvisable