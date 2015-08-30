Stars = {}

function Stars:starRating(value)
	
	local group = display.newGroup()
	local level = app_data:getLevelData(value)
	local lev_num = level.level
	
	local function getTotalPossible()
		local rock_data = app_data:getRockData(lev_num)
		local enemy_data = app_data:getEnemyData(lev_num)
		local shield_count = app_data:getShieldCount(lev_num)
		local lives_count = app_data.life_count
		
		local num_large_rocks = 0
		local num_medium = 0
		local num_small = 0
		
		local shield_points = 200
		local live_points = 500
		local enemy_points = 0
		
		for i=1, table.getn(rock_data) do
			local rocks = rock_data[i]
			
			if rocks.size == "large" then
				num_large_rock = rocks.regular + (rocks.green * 1) +
								(rocks.with_health * 1)
			elseif rocks.size == "medium" then
				num_medium = rocks.regular + (rocks.green * 1) +
								(rocks.with_health * 1)
			elseif rocks.size == "small" then
				num_small = rocks.regular + (rocks.green * 1) +
								(rocks.with_health * 1)
			end
		end
		
		for i=1, table.getn(enemy_data) do
			local enemy = enemy_data[i]
			enemy_points = enemy_points + enemy.points
		end
		
		local total_points = (num_large_rocks * app_data.large_rock_points) + 
								(num_medium * app_data.medium_rock_points) + 
								(num_small * app_data.small_rock_points) + 
								enemy_points + (shield_points * shield_count) + 
								(live_points * lives_count)
		
		
		return total_points
	end
	
	
	local heigh_score = level.heigh_score
	
	local one_sixth = math.floor(getTotalPossible())
	--print("level "..lev_num.."'s total points: ".. getTotalPossible())
	--print ("one sixth: ".. one_sixth)
	local rating = -1
	
	local star1
	local star2
	local star3
	
	if heigh_score > 0 and heigh_score < one_sixth then
		rating = 0
	elseif heigh_score > one_sixth and heigh_score < one_sixth * 2 then
		rating = 1
	elseif heigh_score > one_sixth * 2 and heigh_score < one_sixth * 3 then
		rating = 2
	elseif heigh_score > one_sixth * 3 and heigh_score < one_sixth * 4 then
		rating = 3
	elseif heigh_score > one_sixth * 4 and heigh_score < one_sixth * 5 then
		rating = 4
	elseif heigh_score > one_sixth * 5 and heigh_score < one_sixth * 6 then
		rating = 5
	elseif heigh_score >= one_sixth * 6 then
		rating = 6
	end
		
	if lev_num < app_data.level_total then
		local next_lev = app_data:getLevelData(lev_num + 1)
		if rating >= 3 and next_lev.locked == true then
			app_data:setLevelData({level=lev_num+1, locked=false, score=next_lev.score})
		end
	end
	
	function group:getRating()	
		return rating
	end
	
	function group:createStars()
		
		if rating == 0 then
			star1 = display.newImage("images/star-half.png")
			star2 = display.newImage("images/star-empty.png")
			star3 = display.newImage("images/star-empty.png")
		elseif rating == 1 then
			star1 = display.newImage("images/star.png")
			star2 = display.newImage("images/star-empty.png")
			star3 = display.newImage("images/star-empty.png")
		elseif rating == 2 then
			star1 = display.newImage("images/star.png")
			star2 = display.newImage("images/star-half.png")
			star3 = display.newImage("images/star-empty.png")
		elseif rating == 3 then
			star1 = display.newImage("images/star.png")
			star2 = display.newImage("images/star.png")
			star3 = display.newImage("images/star-empty.png")
		elseif rating == 4 then
			star1 = display.newImage("images/star.png")
			star2 = display.newImage("images/star.png")
			star3 = display.newImage("images/star-half.png")
		elseif rating == 5 then
			star1 = display.newImage("images/star.png")
			star2 = display.newImage("images/star.png")
			star3 = display.newImage("images/star-half.png")
		elseif rating == 6 then
			star1 = display.newImage("images/star.png")
			star2 = display.newImage("images/star.png")
			star3 = display.newImage("images/star.png")
		else
			star1 = display.newImage("images/star-empty.png")
			star2 = display.newImage("images/star-empty.png")
			star3 = display.newImage("images/star-empty.png")
		end
		
		star1.x = 0
		star1.y = 0
		star2.x = star1.width + 5
		star2.y = 0
		star3.x = star2.x + star2.width + 5
		star3.y = 0

		group:insert(star1)
		group:insert(star2)
		group:insert(star3)
	end
	
	return group
end

return Stars