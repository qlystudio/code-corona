-- Class: Raycast Engine
-- SDK: Corona - 09/12/11
-- Author: Andrew Burch
-- Date: 08/02/12
-- Site: http://www.newhighscore.net
-- Contact: andrew.burch@newhighscore.net
-- Note: Basic raycasting engine - minimal feature set

-- minor optimisation
local floor = math.floor
local ceil = math.ceil
local min = math.min
local abs = math.abs
local rad = math.rad
local tan = math.tan
local cos = math.cos
local sin = math.sin

local MAX_DISTANCE = 99999


local RaycastEngine = {}
local RaycastEngine_mt = {__index = RaycastEngine}

function RaycastEngine.new(params)
	local engine = {
	}
	
	return setmetatable(engine, RaycastEngine_mt)
end

function RaycastEngine:initialise(params)
	local visibleWidth = params.visibleWidth
	local visibleHeight = params.visibleHeight
	
	local mapRowCount = params.mapRowCount
	local mapColumnCount = params.mapColumnCount

	local fov = params.fov
	local mapCellSize = params.mapCellSize			
	local halfFov = fov * 0.5
	local halfVisibleWidth = visibleWidth * 0.5
	local distanceConst = halfVisibleWidth / tan(rad(halfFov))

	local angleStep = fov / visibleWidth				
	local angleCount = ceil(360 / angleStep)

	-- build common angles table
	local commonAngleList = params.commonAngleList
	local commonAngles = {}
	for _, angle in ipairs(commonAngleList) do
		commonAngles[angle] = floor((angleCount / 360) * angle)
	end

	-- build slice height look up table
	local heightTableSize = ceil((mapCellSize * mapRowCount) / sin(rad(45)))
	local heightTable = {}
	for i = 1, heightTableSize do
		local sliceHeight = (mapCellSize / i) * distanceConst
		heightTable[i] = floor(sliceHeight)
	end

	-- build intercept and math tables
	local xNextTable = {}
	local yNextTable = {}
	local cosTable = {}
	local sinTable = {}
	local tanTable = {}

	local invalidAngles = {
		[commonAngles[0]] = true,
		[commonAngles[90]] = true,
		[commonAngles[180]] = true,
		[commonAngles[270]] = true,
		[commonAngles[360]] = true,
	}

	local nextAngle = 0
	for i = 0, angleCount + 1 do
		local angleRad = rad(nextAngle)

		if invalidAngles[i] then
			tanTable[i] = 0
			xNextTable[i] = 0
			yNextTable[i] = 0
		else
			local angleTan = tan(angleRad)
			
			tanTable[i] = angleTan
			xNextTable[i] = mapCellSize / angleTan
			yNextTable[i] = mapCellSize * angleTan
		end

		local angle = (i * math.pi) / commonAngles[180]
		cosTable[i] = cos(angle) 
		sinTable[i] = sin(angle)

		nextAngle = nextAngle + angleStep
	end

	self.foundWalls = {}

	self.mapCellSize = mapCellSize
	self.mapColumnCount = mapColumnCount
	self.mapRowCount = mapRowCount

	self.heightTable = heightTable
	self.commonAngles = commonAngles
	self.xNextTable = xNextTable
	self.yNextTable = yNextTable
	self.cosTable = cosTable
	self.sinTable = sinTable
	self.tanTable = tanTable
end

function RaycastEngine:getFirstHorizontalIntercept(xpos, ypos, rayAngle)
	local commonAngles = self.commonAngles
	local mapCellSize = self.mapCellSize
	local xNextTable = self.xNextTable
	local tanTable = self.tanTable
	
	local rayInfo = {
		x = 0,
		y = 0,
	}
	
	local rayPast180 = rayAngle > commonAngles[180]
	local yModifier = rayPast180 and -1 or mapCellSize
	rayInfo.y = (floor(ypos / mapCellSize) * mapCellSize) + yModifier

	local invalidAngles = {
		[commonAngles[90]] = true,
		[commonAngles[270]] = true,
	}
	
	local invalidAngle = invalidAngles[rayAngle]
	rayInfo.x = invalidAngle and xpos or (xpos + (rayInfo.y - ypos) / tanTable[rayAngle])

	rayInfo.rayYStep = rayPast180 and -mapCellSize or mapCellSize
	rayInfo.rayXStep = rayPast180 and -xNextTable[rayAngle] or xNextTable[rayAngle]

	return rayInfo
end

function RaycastEngine:getFirstVerticalIntercept(xpos, ypos, rayAngle)
	local commonAngles = self.commonAngles
	local mapCellSize = self.mapCellSize
	local yNextTable = self.yNextTable
	local tanTable = self.tanTable
	
	local rayInfo = {
		x = 0,
		y = 0,
	}

	local rayFacingDown = rayAngle > commonAngles[90] and rayAngle < commonAngles[270]
	
	local xModifier = rayFacingDown and -1 or mapCellSize
	rayInfo.x = (floor(xpos / mapCellSize) * mapCellSize) + xModifier

	rayInfo.y = ypos + (rayInfo.x - xpos) * tanTable[rayAngle]

	rayInfo.rayYStep = rayFacingDown and -yNextTable[rayAngle] or yNextTable[rayAngle]
	rayInfo.rayXStep = rayFacingDown and -mapCellSize or mapCellSize

	return rayInfo
end

function RaycastEngine:performHorizontalCheck(xpos, ypos, rayAngle, worldMap, wallDefList, rayInfo)
	local mapColumnCount = self.mapColumnCount
	local mapRowCount = self.mapRowCount
	local mapCellSize = self.mapCellSize
	local sinTable = self.sinTable

	local rayY = rayInfo.y
	local rayX = rayInfo.x
	local rayYStep = rayInfo.rayYStep
	local rayXStep = rayInfo.rayXStep

	local wallFound = false
	while not wallFound do
		local mapX = floor(rayX / mapCellSize)
		local mapY = floor(rayY / mapCellSize)

		local validX = mapX > 0 and mapX <= mapColumnCount
		local validY = mapY > 0 and mapY <= mapRowCount
		local withinMap = validX and validY
		if not withinMap then
			rayInfo.distance = MAX_DISTANCE
			break
		end

		local wallId = worldMap[mapX][mapY]
		wallFound = wallId > 0
		
		if wallFound then
			local wallInfo = wallDefList[wallId]
			local isTransparent = wallInfo.isTransparent

			local distance
			local offset
			
			if isTransparent then
				local halfYStep = rayYStep * 0.5
				local offsetRayY = rayY + halfYStep
				local yvalue = abs(offsetRayY - ypos)
				distance = abs(yvalue) / sinTable[rayAngle]
				
				local halfStep = rayXStep * 0.5
				offset = min((rayX + halfStep) - (mapX * mapCellSize), mapCellSize)
			else
				local yvalue = abs(rayY - ypos)
				distance = abs(yvalue / sinTable[rayAngle])
				offset = min(rayX - (mapX * mapCellSize), mapCellSize)
			end
			
			rayInfo.wallId = wallId
			rayInfo.distance = distance
			rayInfo.offset = offset
			rayInfo.mapHitX = mapX
			rayInfo.mapHitY = mapY
			rayInfo.x = rayX
			rayInfo.y = rayY
		else
			rayY = rayY + rayYStep
			rayX = rayX + rayXStep
		end
	end
		
	return rayInfo		
end

function RaycastEngine:performVerticalCheck(xpos, ypos, rayAngle, worldMap, wallDefList, rayInfo)
	local mapColumnCount = self.mapColumnCount
	local mapRowCount = self.mapRowCount
	local mapCellSize = self.mapCellSize
	local cosTable = self.cosTable

	local rayX = rayInfo.x
	local rayY = rayInfo.y
	local rayXStep = rayInfo.rayXStep
	local rayYStep = rayInfo.rayYStep

	local wallFound = false	

	while not wallFound do
		local mapX = floor(rayX / mapCellSize)
		local mapY = floor(rayY / mapCellSize)

		local validX = mapX > 0 and mapX <= mapColumnCount 
		local validY = mapY > 0 and mapY <= mapRowCount
		local withinMap = validX and validY
		
		if not withinMap then
			rayInfo.distance = MAX_DISTANCE
			break
		end

		local wallId = worldMap[mapX][mapY]
		wallFound = wallId > 0

		if wallFound then
			local wallInfo = wallDefList[wallId]
			local isTransparent = wallInfo.isTransparent

			local distance
			local offset
			
			if isTransparent then
				local halfXStep = rayXStep * 0.5
				local offsetRayX = rayX + halfXStep
				local xvalue = abs(offsetRayX - xpos)
				distance = abs(xvalue) / cosTable[rayAngle]
				
				local halfYStep = rayYStep * 0.5
				offset = min((newY + halfYStep) - (mapY * mapCellSize), mapCellSize)
			else
				local xvalue = abs(rayX - xpos)
				distance = abs(xvalue / cosTable[rayAngle])			
				offset = min(rayY - (mapY * mapCellSize), mapCellSize)
			end

			rayInfo.wallId = wallId
			rayInfo.distance = distance
			rayInfo.offset = offset
			rayInfo.mapHitX = mapX
			rayInfo.mapHitY = mapY
			rayInfo.x = rayX
			rayInfo.y = rayY
		else
			rayY = rayY + rayYStep
			rayX = rayX + rayXStep
		end
	end
	
	return rayInfo
end

function RaycastEngine:processFrame(dt, time, params)
	local commonAngles = self.commonAngles
	local heightTable = self.heightTable
	local cosTable = self.cosTable
	
	local wallDefList = params.wallDefList
	local viewAngle = floor(params.viewAngle)
	local halfFov = commonAngles[30]
	local currentAngle = viewAngle - halfFov
	if currentAngle < commonAngles[0] then
		currentAngle = currentAngle + commonAngles[360]
	end
		
	local sliceCount = 0
	local visibleWidth = params.visibleWidth
	local maxRayDepth = params.maxRayDepth
	local xpos = params.xpos
	local ypos = params.ypos
	local worldMap = params.worldMap
	
	local illegalHorizontalAngles = {
		[commonAngles[0]] = true,
		[commonAngles[180]] = true,
	}
	
	local illegalVerticalAngles = {
		[commonAngles[90]] = true,
		[commonAngles[270]] = true,
	}
	
	local foundWalls = {}
	
	for i = 0, visibleWidth - 1 do
		local solidWallFound = false
		local hitDepth = 0
		
		local hrayResult = self:getFirstHorizontalIntercept(xpos, ypos, currentAngle)
		local vrayResult = self:getFirstVerticalIntercept(xpos, ypos, currentAngle)
		
		while not solidWallFound and hitDepth < maxRayDepth do
			local ignoreHorizontalCheck = illegalHorizontalAngles[currentAngle]
			if not ignoreHorizontalCheck then
				hrayResult = self:performHorizontalCheck(xpos, ypos, currentAngle, worldMap, wallDefList, hrayResult)
			end

			local ignoreVerticalCheck = illegalVerticalAngles[currentAngle]
			if not ignoreVerticalCheck then
				vrayResult = self:performVerticalCheck(xpos, ypos, currentAngle, worldMap, wallDefList, vrayResult)
			end

			local closestVerticalDistance = vrayResult.distance or MAX_DISTANCE
			local closestHorizontalDistance = hrayResult.distance or MAX_DISTANCE
			local useVerticalInfo = closestVerticalDistance	< closestHorizontalDistance
			local result = useVerticalInfo and vrayResult or hrayResult

			-- fix fisheye
			local nangle = (commonAngles[330] + i) % commonAngles[360]
			local cosAngle = cosTable[nangle]
			local rayDistance = result.distance
			rayDistance = floor(rayDistance * cosAngle)

			local sliceHeight = heightTable[rayDistance]
			local offset = 1 + floor(result.offset)
			
			-- add wall to render list
			table.insert(foundWalls, {
								wallId = result.wallId,
								offset = offset,
								mapHitX = result.mapHitX,
								mapHitY = result.mapHitY,
								distance = rayDistance,
								sliceHeight = sliceHeight,
								drawColumn = i,
							})

			result.x = result.x + result.rayXStep
			result.y = result.y + result.rayYStep

			local wallTypeInfo = wallDefList[result.wallId]
			local isSolid = wallTypeInfo.isSolid
			
			solidWallFound = isSolid
			hitDepth = isSolid and hitDepth or (hitDepth + 1)
		end		

		local nextAngle = currentAngle + 1
		local resetAngle = nextAngle > commonAngles[360]
		
		currentAngle = resetAngle and (currentAngle - commonAngles[360]) or nextAngle		
	end
	
	return foundWalls
end

function RaycastEngine:updateCameraPosition(params)
	local commonAngles = self.commonAngles
	local cameraInfo = params.cameraInfo
	local worldMap = params.worldMap
	local movementSpeed = params.movementSpeed
	local turnSpeed = params.turnSpeed
	local viewAngle = cameraInfo.viewAngle
	local xpos = cameraInfo.xpos
	local ypos = cameraInfo.ypos
	
	if movementSpeed ~= 0 then
		local cosTable = self.cosTable
		local sinTable = self.sinTable
		local newX = floor(xpos + (cosTable[viewAngle] * movementSpeed))
		local newY = floor(ypos + (sinTable[viewAngle] * movementSpeed))
		
		local clampedX, clampedY = self:clipPlayerMovement {
											oldX = xpos,
											oldY = ypos,
											newX = newX, 
											newY = newY,
											worldMap = worldMap,
										}
		
		cameraInfo.xpos = clampedX
		cameraInfo.ypos = clampedY
	end

	if turnSpeed ~= 0 then
		local newViewAngle = floor(viewAngle + turnSpeed)
		
		if newViewAngle < commonAngles[0] then
			newViewAngle = newViewAngle + commonAngles[360]
		end
		
		if newViewAngle > commonAngles[360] then
			newViewAngle = newViewAngle - commonAngles[360]
		end

		cameraInfo.viewAngle = newViewAngle		
	end
end

function RaycastEngine:clipPlayerMovement(params)
	local mapCellSize = self.mapCellSize
	local worldMap = params.worldMap
	local oldX = params.oldX
	local oldY = params.oldY
	local newX = params.newX
	local newY = params.newY
	
	local wallImpact = false
	local clipDistance = 15

	local mapX = floor(newX / mapCellSize)
	local mapY = floor(newY / mapCellSize)

	local left = mapX * mapCellSize
	local top = mapY * mapCellSize
	local right = left + mapCellSize
	local bottom = top + mapCellSize

	local oldX = params.oldX
	local oldY = params.oldY
	local newX = params.newX
	local newY = params.newY
	
	local leftMap = mapX - 1
	local rightMap = mapX + 1
	local topMap = mapY - 1
	local bottomMap = mapY + 1
	
	
	-- movement left
	if newX < oldX then
		if worldMap[leftMap][mapY] > 0 then
			if newX < left or (abs(newX - left) < clipDistance) then
				newX = oldX
				wallImpact = true
			end
		end
	end
	
	-- movement right
	if newX > oldX then
		if worldMap[rightMap][mapY] > 0 then
			if newX > right or (abs(right - newX) < clipDistance) then
				newX = oldX
				wallImpact = true
			end
		end
	end

	-- movement up	
	if newY < oldY then
		if worldMap[mapX][topMap] > 0 then
			if newY < top or (abs(newY - top) < clipDistance) then
				newY = oldY
				wallImpact = true
			end
		end
	end
	-- movement down
	if newY > oldY then
		if worldMap[mapX][bottomMap] > 0 then
			if newY > bottom or (abs(newY - bottom) < clipDistance) then
				newY = oldY
				wallImpact = true
			end
		end
	end
	

	-- if no wall impact yes, break cell into quads and inspect further
	if not wallImpact then
		local halfCellSize = floor(mapCellSize * 0.5)
		local leftPlusClip = left + clipDistance
		local topPlusClip = top + clipDistance

		-- region A
		if newY < (top + halfCellSize) then
			if newX < (left + halfCellSize) then
				if worldMap[leftMap][topMap] > 0 and (newY < topPlusClip) then
					if newX < leftPlusClip then
						if oldX > leftPlusClip then
							newX = oldX
						else
							newY = oldY
						end
						wallImpact = true
					end
				end

				if worldMap[leftMap][topMap] > 0 and (newX < leftPlusClip) then
					if newY < topPlusClip then
						if oldY > topPlusClip then
							newY = oldY
						else
							newX = oldX
						end
						wallImpact = true
					end
				end
			end
		end		
		
		-- region B
		if not wallImpact and newX > (right - halfCellSize) then
			if worldMap[rightMap][topMap] > 0 and newY < topPlusClip then
				if newX > (right - clipDistance) then
					if oldX < (right - clipDistance) then
						newX = oldX
					else
						newY = oldY
					end
					wallImpact = true
				end
			end
			
			if worldMap[rightMap][topMap] > 0 and newX > (right - clipDistance) then
				if newY < topPlusClip then
					if oldY > topPlusClip then
						newY = oldY
					else
						newX = oldX
					end
					wallImpact = true
				end
			end
		end
		
		-- region C
		if not wallImpact and newY > (top + halfCellSize) then
			if newX < (left + halfCellSize) then
				if worldMap[leftMap][bottomMap] > 0 and newY > (bottom - halfCellSize) then
					if newX < (left + clipDistance) then
						if oldX > (left + clipDistance) then
							newX = oldX
						else
							newY = oldY
						end
					end
				end

				if worldMap[leftMap][bottomMap] > 0 and newX < (left + clipDistance) then
					if newY > (bottom - clipDistance) then
						if oldY < (bottom - clipDistance) then
							newY = oldY
						else
							newX = oldX
						end
						wallImpact = true
					end
				end
			end
		end
			
		-- region D
		if not wallImpact and newX > (right - halfCellSize) then
			if worldMap[rightMap][bottomMap] > 0 and newY > (bottom - clipDistance) then
				if newX > (right - clipDistance) then
					if oldX < (right - clipDistance) then
						newX = oldX
					else
						newY = oldY
					end
					wallImpact = true
				end
			end

			if worldMap[rightMap][bottomMap] > 0 and newX > (right - clipDistance) then
				if newY > (bottom - clipDistance) then
					if oldY < (bottom - clipDistance) then
						newY = oldY
					else
						newX = oldX
					end
					wallImpact = true
				end
			end
		end
	end

	return newX, newY
end


return RaycastEngine