
local RockWithHealth = {}

function RockWidthHeath:new(size, i)
	require "sprite"
	local physicsData = (require "com.sixftview.components.physics_objects").physicsData()
	local rock_physics_name = "rock_large"
	local group = display.newGroup()
	group.health = 3
	
	local large_spriteData =
	 require("com.sixftview.sprites.large_rock_whealth").getSpriteSheetData()

	local sheet = sprite.newSpriteSheetFromData("large_rock_whealth-hd.png",
	 											large_spriteData)

	local spriteSet = sprite.newSpriteSet(sheet, 1, 30)

	local rock = sprite.newSprite(spriteSet)
	rock.health = 3
	rock:play()
	
	group:insert(rock)
	
	physics.addBody(group, physicsData:get(rock_physics_name) )
	
	local angle = math.random( 180 , 360 )
	local av = math.random( -50, 100)
	local sin = math.sin
	local cos = math.cos
	local pi = math.pi
	local force = 0.5
	local xFinal = ( sin( angle * pi / 180 ) * force )
	local yFinal = ( cos( angle * pi / 180 ) * force )

	local atorque = math.random() * (1000 - -1000)

	group.angularVelocity = av

	if i % 2 == 0 then
		group:applyLinearImpulse(-xFinal,-yFinal, group.x, group.y)
	else
		group:applyLinearImpulse(xFinal,yFinal, group.x, group.y)
	end
	
	return group
end
return RockWidthHealth