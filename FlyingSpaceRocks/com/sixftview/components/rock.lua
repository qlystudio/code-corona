
Rock = {}

local num = 1
function Rock:new(size, type, i, speed)
	require "sprite"
	if speed == nil then speed = 1 end
	local speed = speed
	
	local large_spriteData =
	 require("com.sixftview.sprites.large_rock_whealth").getSpriteSheetData()
	local medium_spriteData = 
		require("com.sixftview.sprites.medium_rock_spritesheet").getSpriteSheetData()
	local small_spriteData = 
		require("com.sixftview.sprites.small_rock_spritesheet").getSpriteSheetData()
	local large_greenSpriteData =
	 	require("com.sixftview.sprites.large_rock_green").getSpriteSheetData()
		
	local physicsData = (require "com.sixftview.components.physics_objects").physicsData()
	
	local rock
	local rock_physics_name = "rock_large"
	
	local function rockFromSpriteSheet(type)
		local data
		local startFrame = 1
		local endFrame = 30
		local health
		local png
		
		if type == "with_health" then
			png = "images/large_rock_whealth-hd.png"
			data = large_spriteData
			health = 3
			
		elseif type == "green" then
			png = "images/large_rock_green.png"
			data = large_greenSpriteData
		end
		
		local sheet = sprite.newSpriteSheetFromData(png, data)

		local spriteSet = sprite.newSpriteSet(sheet, startFrame, endFrame)
		
		rock = sprite.newSprite(spriteSet)
		
		if health ~= nil then
			rock.health = 3
		end
		rock:play()
		
		return rock
	end
	
	if size == "large" then
		if type == "regular" then
			if num == 1 then
				rock = display.newImage("images/rock_large.png")
				rock_physics_name = "rock_large"
			else
				rock = display.newImage("images/rock_large2.png")
				rock_physics_name = "rock_large2"
			end
		elseif type == "with_health" or type == "green" then
			rock = rockFromSpriteSheet(type)
		end
		
		rock.name = "large_rock"
	elseif size == "medium" then
		if type == "regular" then
			if num == 1 then
				rock = display.newImage("images/rock_medium.png")
				rock_physics_name = "rock_medium"
			else
				rock = display.newImage("images/rock_medium2.png")
				rock_physics_name = "rock_medium2"
			end
		elseif type == "with_health" then
			local sheet = sprite.newSpriteSheetFromData("images/medium_rock_spritesheet.png",
			 											medium_spriteData)

			local spriteSet = sprite.newSpriteSet(sheet, 1, 30)
			rock = sprite.newSprite(spriteSet)
			rock.health = 3
			rock:play()
		end
		rock.name = "medium_rock"
	elseif size == "small" then
		if type == "regular" then
			if num == 1 then
				rock = display.newImage("images/rock_small.png")
				rock_physics_name = "rock_small"
			else
				rock = display.newImage("images/rock_small2.png")
				rock_physics_name = "rock_small2"
			end
		elseif type == "with_health" then
			local sheet = sprite.newSpriteSheetFromData("images/small_rock_spritesheet.png",
			 											small_spriteData)

			local spriteSet = sprite.newSpriteSet(sheet, 1, 30)
			rock = sprite.newSprite(spriteSet)
			rock.health = 3
			rock:play()
		end
		rock.name = "small_rock"
	end
	
	if num == 1 then
		num = 2
	else
		num = 1
	end
	
	rock.type = type
	--rock.isBullet = true;
	physics.addBody(rock, physicsData:get(rock_physics_name) )
	
	if speed > 1 then speed = speed - 0.5 end
	
	local angle = math.random( 180 , 360 )
	local av = math.random( -50, 100)
	local sin = math.sin
	local cos = math.cos
	local pi = math.pi
	local force = 0.5 * speed
	local xFinal = ( sin( angle * pi / 180 ) * force )
	local yFinal = ( cos( angle * pi / 180 ) * force )

	local atorque = math.random() * (1000 - -1000)

	rock.angularVelocity = av
	if rock ~= nil then
		if i % 2 == 0 then
			rock:applyLinearImpulse(-xFinal,-yFinal, rock.x, rock.y)
		else
			rock:applyLinearImpulse(xFinal,yFinal, rock.x, rock.y)
		end
	end
	
	
	return rock
end

return Rock

