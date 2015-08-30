
local EnemyGroup = {}

function EnemyGroup:new(data)
	local enemy_data = data
	local Bullets = require "com.sixftview.components.bullets"
	local EnemyShip = require "com.sixftview.components.enemy_ship"
	
	local group = display.newGroup()
	
	local function onEnemyKilled(event)
		group:dispatchEvent(event)
	end
	
	local function createEnemy( type, points )
		local bullets_scatter = Bullets:new( type )
		group:insert(bullets_scatter)
		
		local enemy = EnemyShip:new(type)
		enemy.name = "enemy ship"
		enemy.points = points
		enemy:bullets(bullets_scatter)
		enemy:addEventListener("enemyKilled", onEnemyKilled)
		group:insert(enemy)
	end

	for i=1, table.getn(enemy_data) do
		local e_data = enemy_data[i]
		local points = e_data.points
		
		for j=1, e_data.count do
			createEnemy(e_data.type, points)
		end
	end
	
	function group:pause(value)
		for i=1, group.numChildren do
			local obj = group[i]
			
			if obj.name ~= nil and obj.name == "enemy ship" then
				obj:pause(value)
			end
		end
	end

	function group:killAll()
		for i=1, group.numChildren do
			local obj = group[i]
			
			if obj ~= nil and obj.name ~= nil and obj.name == "enemy ship" then
				obj:killNow()
			end
		end
	end
	
	function group:addTouchEvents(value)
		for i=1, group.numChildren do
			local obj = group[i]
			
			if obj ~= nil and obj.name ~= nil and obj.name == "enemy ship" then
				obj:addTouch(value)	
			end
		end
	end
	
	return group
end

return EnemyGroup