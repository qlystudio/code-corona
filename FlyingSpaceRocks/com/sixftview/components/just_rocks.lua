

RockGroup = {}


----this is what gets everything going
function RockGroup:new()	
	local Rock = require "com.sixftview.components.rock"

	local rock_group
	local clearOfCenter = true
	local onCollisionFunction
	local checkLocationTimer
	local setRockPosission
	local level_num = app_data:getCurrentLevel()
	local level_dif = app_data.difficulty
	local large_rock_data
	local medium_rock_data
	local small_rock_data
		
	local large_sound = audio.loadSound("sounds/rock_explosion1.wav")
	local medium_sound = audio.loadSound("sounds/rock_explosion2.wav")
	local small_sound = audio.loadSound("sounds/rock_explosion3.wav")
	local deep_explotion = audio.loadSound("sounds/ship_shoot.wav")
	
	local sounds = {large_sound, medium_sound, small_sound}
	local rock_data = app_data:getRockData(20)
	
	for i=1, table.getn(rock_data) do
		if rock_data[i].size == "large" then
			large_rock_data = rock_data[i]
		elseif rock_data[i].size == "medium" then
			medium_rock_data = rock_data[i]
		elseif rock_data[i].size == "small" then
			small_rock_data = rock_data[i]
		end
	end
	
	

	local function newSmallerRocks(size, locationX, locationY)

		local function onWait(event)
			local rockd 
			
			if size == "medium" then
				rockd = medium_rock_data
			elseif size == "small" then
				rockd = small_rock_data
			elseif size == "large" then
				rockd = {regular= 2, green= 0, 
						with_health= 0, size= "large"}
			end
			
			for key,value in pairs(rockd) do
				if key ~= "size" and key ~= "type" then
					local how_many = value
					for i=1, how_many do
						local rock = Rock:new(size, key, i)
						
						rock.x = locationX
						rock.y = locationY
						rock.collision = onCollisionFunction
						rock:addEventListener("collision", rock)
						rock_group:insert(rock)
						
					end
				end
			end
		end

		timer.performWithDelay(250, onWait, 1)


	end
	
	local function randomNum(min, max)
		local num = min + (max - min) * math.random()
		return math.floor(num)
	end
	
	--handle collision
	local function onCollision( rock, event )
		if(event.phase == "began" and event.other.name == "bullet") then
			local size
			local points
			local multiply_points = 1
			local rname = rock.name
			local bullet = event.other
			
			local locationX = rock.x
			local locationY = rock.y
			
			if bullet.active == true then
				bullet.active = false
				bullet.alpha = 0
				
				if rock.health ~= nil then
					if rock.health > 0 then
						rock.health = rock.health - 1
						
						if rock.health == 0 then
							multiply_points = 2
						else
							multiply_points = 0
						end
				
					end
				end
				
				if rock.type ~= "green" and multiply_points > 0 then 
					if(rname == "large_rock") then
							size = "medium"
							points = app_data.large_rock_points * multiply_points
							
					elseif(rock.name == "medium_rock") then
						size = "small"
						points = app_data.medium_rock_points * multiply_points
						
					elseif(rock.name == "small_rock") then
						points = app_data.small_rock_points * multiply_points
						size = ""
						
					end
				elseif rock.type == "green" then
					size = "large"
					points = app_data.large_rock_points
				end
				
				
				if rock.health == nil or rock.health <= 0 then
					
					if size ~= "" then
					
						newSmallerRocks(size, locationX, locationY)
					end

					
					rock:removeSelf()
					
				end

				if points ~= nil then
					local e = {name = "addPoints", value = points, 
							x=locationX, y=locationY}
					rock_group:dispatchEvent(e)
				end
				
				local rockEvent = {name="rockExplosion", x=locationX, y=locationY}
				rock_group:dispatchEvent(rockEvent)
			end
			
			local num = randomNum(1, 4)
			audio.play(sounds[num], {channel=3})
			audio.play(deep_explotion, {channel=3})
			
		elseif(event.phase == "ended") then
			if(event.other.name == "bullet") then
				local bullet = event.other
				local function removeBullet( event )
					bullet.x = -5000
				end
				timer.performWithDelay(250, removeBullet, 1)
			end
		end
	end

	
	setRockPosission = function(rock, i)
		rock.x = (math.random() * ( 0- totalWidth)) + totalWidth
		 --0 - (rock.height - 2)
		if i % 2 == 0 then
			rock.y = 0 - rock.height
		else
			rock.y = totalHeight + rock.height
		end

		rock_group:insert(rock)

		rock.collision = onCollision
		rock:addEventListener("collision", rock)
	end


	local function createRocks()

		for i=1, 10 do
			local rock = Rock:new("large", "regular", i)
			setRockPosission(rock, i)
			rock_group:insert(rock)
		end

	end


	local function checkLocation(event)
		clearOfCenter = true
		
		for i=1, rock_group.numChildren do
			local rock = rock_group[i]
			if (rock.x > totalWidth) then
				rock.x = 0 ;
			end
			if (rock.x < 0 - rock.width) then	
				rock.x = totalWidth - rock.width 
			end
			if (rock.y > totalHeight) then
				rock.y = 0 - rock.height;
			end
			if (rock.y < 0 - rock.height) then
				rock.y = totalHeight - rock.width 
			end

			if rock.x > centerX - 90 and rock.x < centerX + 90 and
				rock.y > centerY - 90 and rock.y < centerY + 90 then
				clearOfCenter = false			
			end
		end

	end
	
	rock_group = display.newGroup()
	onCollisionFunction = onCollision
	
	createRocks()
	
	function rock_group:areClearOfCenter()
		return clearOfCenter
	end
	
	function rock_group:stopLocationCheck()
		timer.cancel(checkLocationTimer)
	end
	
	function rock_group:pause(value)
		if value == true then
			if checkLocationTimer ~= nil then
				timer.pause(checkLocationTimer)
			end
		else
			if checkLocationTimer ~= nil then
				timer.resume(checkLocationTimer)
			end
		end
	end
		
	checkLocationTimer = timer.performWithDelay(250, checkLocation, 0)

	
	return rock_group
end

return RockGroup