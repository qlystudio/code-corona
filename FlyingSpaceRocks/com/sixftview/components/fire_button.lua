
BNFire = {}


function BNFire:new()
	local group = display.newGroup()

	
	local bn_shield = display.newImageRect("images/bn_shield.png", 80, 80)
	bn_shield.name = "shield"
	bn_shield:translate(0,30)
	bn_shield.alpha = 0.7
	group:insert(bn_shield)
	
	local bn_fire = display.newImageRect("images/bn_fire.png", 100, 100)
	bn_fire.name = "fire"	
	bn_fire:translate(120,15)
	bn_fire.alpha = 0.7
	group:insert(bn_fire)
	
	
	
	local function onBN_shieldTouch(event)
		if (event.phase == "ended") then
				local sheildEvent = {name="shieldsUp", something=""}
				group:dispatchEvent( sheildEvent )
		end
		return true
	end
	
	
	local function onBN_fireTouch(event)
		if event.phase == "began" then
			local fireEvent = { name="fireBullet", something="" }
			group:dispatchEvent( fireEvent )
		end
		return true
	end
	
	bn_fire:addEventListener("touch", onBN_fireTouch)
	bn_shield:addEventListener("touch", onBN_shieldTouch)
		
	return group
end

return BNFire