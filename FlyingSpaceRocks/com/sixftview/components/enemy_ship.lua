EnemyShip = {}

function EnemyShip:new(type)
	local physicsData = (require "com.sixftview.components.physics_objects").physicsData()
	local gtween = require "com.vendor.gtween"
	local explotion = audio.loadSound("sounds/ship_blowup.wav")
	local bullets
	local isPaused = false
	
	local enemy_ship
	local createEnemyShip
	local moveEnemy 
	local timeWithDelay
	local shootTimer
	local setTimer
	local tm_array = {}
	
	local screenW = totalWidth
	local halfH = halfHeight
	
	
	local function destoryShip()
		if enemy_ship.active == true then
			enemy_ship.active = false
			enemy_ship:stopTimers()
			enemy_ship.alpha = 0
			
			local xpos, ypos = enemy_ship.x, enemy_ship.y
			local e = {name="enemyKilled", value=enemy_ship.points, 
						type=type, x=xpos, y=ypos}

			enemy_ship:dispatchEvent(e)
			audio.play(explotion, {channel=6})

			tm_array = nil

			local function onRemove(event)
				display.remove(enemy_ship)
			end

			timer.performWithDelay(100, onRemove, 1)
		end
	end
	
	
	local function onCollision(self, event)
		local bullet = event.other
		if event.phase == "began" then
			if bullet.active == true then
				
			for i=1, table.getn(tm_array) do
				local t=tm_array[i]
				
				if(t ~= nil) then
					t:toEnd()
				end

				t = nil
			end

				destoryShip()
				bullet.active = false
				bullet.alpha = 0
				display.remove(bullets)
			end
		elseif event.phase == "ended" then
		end
	end

	createEnemyShip = function()
		if type == nil or type == "enemy1" then
			enemy_ship = display.newImage("images/enemy1.png")
		elseif type == "enemy2" then
			enemy_ship = display.newImage("images/enemy2.png")
		end
		
		enemy_ship.alpha = 0
		enemy_ship.x = -20000
		enemy_ship.y = 100
		


		physics.addBody( enemy_ship, "static", 
							physicsData:get("enemy1"))

		enemy_ship.isSensor = true
		enemy_ship.collision = onCollision
		enemy_ship:addEventListener("collision", enemy_ship)
	end
	
	createEnemyShip()
	
	local function randomNum(min, max)
		local num = min + (max - min) * math.random()
		local num = math.floor(num)
		return num
	end
	
	local function shoot(event)
		if bullets ~= nil then
			local bullet_type 
			if type == "enemy2" then
				bullet_type = "scatter"
			elseif type == "enemy1" then
				bullet_type = "lazer_down"
			end
			
			bullets:shootMissle(enemy_ship, bullet_type)
		end
	end
	
	setTimer = function(func)
		
		local num = randomNum(5000, 90000)
		
		timeWithDelay = timer.performWithDelay(num, func, 1)
	--	timeWithDelay = timer.performWithDelay(randomNum(5000, 6000), func, 1)
	end
	
	function enemy_ship:stopTimers()
		if timeWithDelay ~= nil then
			timer.cancel(timeWithDelay)
		end
		
		if shootTimer ~= nil then
			timer.cancel(shootTimer)
		end
	end
	
	
	local function onShipTweenComplete()
		setTimer(moveEnemy)
	end
	
	moveEnemy = function(event)
		if enemy_ship ~= nil and enemy_ship.width ~= nil then
			enemy_ship.alpha = 1
			enemy_ship.x = -20
			tm_array = {
				gtween.new(enemy_ship, 10, {x=screenW + 100}, 
							{onComplete=onShipTweenComplete}),
				gtween.new(enemy_ship, 0.5, {y=randomNum(20, halfH)}, {delay=1}),
			 	gtween.new(enemy_ship, 0.5, {y=randomNum(20, halfH)}, {delay=3}),
				gtween.new(enemy_ship, 0.5, {y=randomNum(20, halfH)}, {delay=4}),
				gtween.new(enemy_ship, 0.5, {y=randomNum(20, halfH)}, {delay=8})
			}
				
			
			local delay = 500
			local count = 15
			
			if type == "enemy1" then				
				delay = delay * 2
				count = 6
			end
			
			shootTimer = timer.performWithDelay(delay, shoot, count)
		else
			
		end
		
	end
		
	function enemy_ship:bullets(enemy_bullets)
		bullets = enemy_bullets
	end
	
	function enemy_ship:pause(value)
		isPaused = value
		if isPaused == true then
			if timeWithDelay ~= nil then
				timer.pause(timeWithDelay)
			end

			if shootTimer ~= nil then
				timer.pause(shootTimer)
			end
			
			gtween.pauseAll = true
			
		else
			if timeWithDelay ~= nil then
				timer.resume(timeWithDelay)
			end

			if shootTimer ~= nil then
				timer.resume(shootTimer)
			end
			gtween.pauseAll = false
		end
	end

	function enemy_ship:killNow()
		enemy_ship:stopTimers()
		
		for i=1, table.getn(tm_array) do
			local t=tm_array[i]
			if(t ~= nil) then
				t:toEnd()
			end
			t = nil
		end

		for i=1, bullets.numChildren do
			local bullet = bullets[i]
			bullet.active = false
			bullet.alpha = 0
			bullet = nil
		end
		
		display.remove(enemy_ship)
		enemy_ship = nil
	end
	
	local function onEnemyTouch(event)
		if event.phase == "began" then
			destoryShip()
		end
	end
	
	function enemy_ship:addTouch(value)
		if value == true then
			enemy_ship:addEventListener("touch", onEnemyTouch)
		else
			enemy_ship:removeEventListener("touch", onEnemyTouch)
		end
	end
	
	setTimer(moveEnemy)
	enemy_ship.active = true
	return enemy_ship
end

return EnemyShip