

Bullets = {}


function Bullets:new(type)
	local mindex = 1
	local group = display.newGroup();
	local ship
	local canshoot = true
	local player_shoot = audio.loadSound("sounds/player_shoot.wav")
	local ship_shoot = audio.loadSound("sounds/ship_shoot.wav")
	local enemy_shoot = audio.loadSound("sounds/enemy_scatter_shoot.wav")
	local enemy_shoot2 = audio.loadSound("sounds/enemy_shoot2.wav")
	
	
	for i=1,8 do
		local missle
		
		local missleCollisionFilter
		if type == "enemy1" then
			missle = display.newRect( -1000, -1000, 3, 30 )
			missle:setFillColor(255,0,0)
			missleCollisionFilter = { categoryBits = 8, maskBits=21 } 
		elseif type == "enemy2" then
			missle = display.newCircle( -1000, -1000, 4 )
			missle:setFillColor(3,179,252)
			missleCollisionFilter = { categoryBits = 8, maskBits=21 }
		else
			missle = display.newCircle( -1000, -1000, 4 )
			missle:setFillColor(219, 3, 226)
			missleCollisionFilter = { categoryBits = 16, maskBits=6 } 
		end
		
		local missleBody = { density=0.1, filter=missleCollisionFilter }
		missle.isBullet = true
		physics.addBody(missle, missleBody)

		missle.name = "bullet"
		missle.active = true
		group:insert(missle)
	end
	
	local function getBullet()
		
		local b = group[mindex]
		b.active = true
		b.alpha = 1
		b.rotation = ship.rotation
		b.x = ship.x + ((ship.width * 0.5) - b.width * 0.5 ) * 0.0625
		b.y = ship.y + ((ship.height * 0.5) - b.height * 0.5 ) * 0.0625
		
		mindex = mindex + 1
		
		if mindex >= group.numChildren then
			mindex = 1
		end
		
		return b
	end
	local function randomNum(min, max)
		local num = min + (max - min) * math.random()
		return math.floor(num)
	end
	
	local function defaultShoot(direction)
		
		local bullet = getBullet()
		
		local speedX = 5 * (math.sin(direction*(math.pi/180)))
		local speedY = -5 * (math.cos(direction*(math.pi/180)))
		bullet:setLinearVelocity(speedX * 100, speedY * 100)	
		canshoot = false
		
	end
	
	local function scatter()
		if ship.width ~=  nil then
			local bullet = getBullet()
			local rotation = randomNum(0, 360)
			local speedX = 5 * (math.sin(rotation*(math.pi/180)))
			local speedY = -5 * (math.cos(rotation*(math.pi/180)))
			bullet:setLinearVelocity(speedX * 100, speedY * 100)
		end
	end
	
	local function timerCanShoot(event)
		canshoot = true
	end
	
	function group:shootMissle(ship_shooting, type)
		ship = ship_shooting
		
		if type == nil and canshoot == true then
			defaultShoot(ship.rotation)
			audio.play(player_shoot, {channel=7})
			audio.play(ship_shoot, {channel=6})
			canshoot = false
			timer.performWithDelay(250, timerCanShoot, 1)
		elseif type == "scatter" then
			scatter()
			audio.play(player_shoot, {channel=8 })
		elseif type == "lazer_down" then
			defaultShoot(180)
			audio.play(enemy_shoot2, {channel=8 })
		end
		
	end
	
	return group
end

return Bullets