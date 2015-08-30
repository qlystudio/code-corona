ButtonMenu = {}


function ButtonMenu:new()
	local group = display.newGroup()
	
	local level_data = app_data:getAllLevelData()
	
	local LevelButton = require "com.sixftview.components.level_bn"
	local Stars = require "com.sixftview.components.stars"
	local gtween = require "com.vendor.gtween"
	local is_animating = false
	local nextX = 0
	local locationY = 0
	local locationX = 0
	local dif_group_x = 0
	local orig_x
	local diff_x
	local orig_group_x 
	
	local xDistance  
	local yDistance  
	local beginX 
	local beginY  
	local endX  
	local endY
	
	local enterFrameMove
	
	local screen_count = app_data.level_total / 10
	local screen_num = 1
	
	function group:setScreenNum(value)
		screen_num = value
	end

	local function checkSwipeDirection()

	        xDistance =  math.abs(endX - beginX) 
	        yDistance =  math.abs(endY - beginY)
			local gx
			
	        if xDistance > yDistance then
                if beginX > endX then
					gx = group.x - totalWidth
                else 
					gx = group.x + totalWidth
                end
	        else 
                if beginY > endY then
                        --print("swipe up")
                else
                        --print("swipe down")
                end
				is_animating = false
	        end
	
			if gx ~= nil then
				gx = gx + dif_group_x
				--print(dif_group_x)
				if dif_group_x > 160  and screen_num ~= screen_count  then
					screen_num = screen_num + 1
				elseif dif_group_x < -160 and screen_num ~= 1 then
					screen_num = screen_num - 1
				else
					if screen_num == 1 then
						gx = orig_group_x
					elseif screen_num == screen_count then
						gx = orig_group_x
					end
					--gtween.new(group, 0.5, {x=orig_x}, {ease=gtween.easing.outBack})
				end
				
				local function onAnimationComplete()
					is_animating = false
				end
				
				gtween.new(group, 0.5, {x=gx}, {ease=gtween.easing.outBack,
				 								onComplete=onAnimationComplete})
			end
	end
	
	

	local function swipe(event)
	  if is_animating == false then
		if event.phase == "began" then
			
	          beginX = event.x
	          beginY = event.y
			  diff_x = event.x - group.x
			  orig_x = group.x

				if screen_num == 1 or screen_num == screen_count then
					orig_group_x = group.x
				end
				--return true
		  end

		  if event.phase == "ended"  then
			display.getCurrentStage():setFocus(event.target, nil)
			  is_animating = true
	          endX = event.x
	          endY = event.y
	          checkSwipeDirection()
			--return true
		  end

		  if event.phase == "moved" then
			display.getCurrentStage():setFocus(event.target, event.id)
			group.x = event.x - diff_x
			dif_group_x = orig_x - group.x
		--	group.x = event.x - group.x 
			return true
		  end
	  end
		
	end
	
	enterFrameMove = function(event)
		
	end
	
	local function buttonClicked(bt, event)
		group:dispatchEvent(event)
		return true
	end
	
	local bn_group
	for i=1, screen_count do
		bn_group = display.newGroup()
		bn_group.screen = i
		group:insert(bn_group)
		local rect = display.newRoundedRect(-15,-30, 490, 250, 20)
		rect:setFillColor(0,0,0, 75)
		local rect_group = display.newGroup()
		bn_group:insert(rect)
		
		local nextX = (i - 1) * totalWidth

		bn_group.x = 0 + nextX
		
		locationX = 0
		locationY = 0
		for j=1, 10 do
			local j_x_i = j + (10 * (i - 1))

			if level_data[j_x_i] == nil then
				local level = {level=j_x_i, score=0, locked=true, heigh_score=0}
				app_data:setLevelData(level)

				level_data[j_x_i] = level
			end

			local level_bn = LevelButton:new(j_x_i, level_data[j_x_i].locked)
			
			if level_data[j_x_i].locked == false then
				level_bn.levelSelected = buttonClicked
				level_bn:addEventListener("levelSelected", level_bn)
			end
			bn_group:insert(level_bn)
			local addto = 10
			if j == 1 or j == 6 then
				addto = 5
			end
			
			level_bn.x = (95 * locationX) + 10
			level_bn.y = 100 * locationY

			local stars = Stars:starRating( j_x_i )
			stars:createStars()
			bn_group:insert(stars)
			stars.x = level_bn.x + 5
			stars.y = (level_bn.y + level_bn.height) + 15

			if stars:getRating() == -1 then
				stars.alpha = 0.25
			end

			locationX = locationX + 1

			if locationX == 5 then
				locationX = 0
				locationY = locationY + 1
			end

			if i % 20 == 0 then
				nextX = nextX + 270
			end
		end
		
	end
	
	orig_group_x = group.x
	group:addEventListener("touch", swipe)
	
	return group
end

return ButtonMenu