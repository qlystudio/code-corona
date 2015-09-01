-- Snake Game
-- Developed by Carlos Yanez

-- Hide Status Bar

display.setStatusBar(display.HiddenStatusBar)

-- Graphics

-- [Background]

local bg = display.newImage('bg.png')

-- [Title View]

local titleBg
local playBtn
local creditsBtn
local titleView

-- [Credits]

local creditsView

-- [Game Background]

local gameBg

-- [Pad]

local up
local left
local down
local right

-- Head (player)

local headGFX
local headHitArea
local head

--  Score

local score

-- Sounds

local appleGrab = audio.loadSound('apple.mp3')
local gameOver = audio.loadSound('gameover.mp3')

-- Variables

local dir
local started
local timerSrc
local speed = 500
local mConst = 17
local apples
local lastPart
local firstPart
local parts
local current = 0

-- Functions

local Main = {}
local startButtonListeners = {}
local showCredits = {}
local hideCredits = {}
local showGameView = {}
local gameListeners = {}
local movePlayer = {}
local hitTestObjects = {}
local update = {}

-- Main Function

function Main()
	titleBg = display.newImage('titleBg.png', display.contentCenterX - 100.5, 40.5)
	playBtn = display.newImage('playBtn.png', display.contentCenterX - 27, display.contentCenterY + 10)
	creditsBtn = display.newImage('creditsBtn.png', display.contentCenterX - 48, display.contentCenterY + 65)
	titleView = display.newGroup(titleBg, playBtn, creditsBtn)
	
	startButtonListeners('add')
end

function startButtonListeners(action)
	if(action == 'add') then
		playBtn:addEventListener('tap', showGameView)
		creditsBtn:addEventListener('tap', showCredits)
	else
		playBtn:removeEventListener('tap', showGameView)
		creditsBtn:removeEventListener('tap', showCredits)
	end
end

function showCredits:tap(e)
	playBtn.isVisible = false
	creditsBtn.isVisible = false
	creditsView = display.newImage('credits.png', display.contentCenterX - 110, display.contentHeight+40)
	transition.to(creditsView, {time = 300, y = display.contentHeight-20, onComplete = function() creditsView:addEventListener('tap', hideCredits) end})
end

function hideCredits:tap(e)
	playBtn.isVisible = true
	creditsBtn.isVisible = true
	transition.to(creditsView, {time = 300, y = display.contentHeight+creditsView.height, onComplete = function() creditsView:removeEventListener('tap', hideCredits) display.remove(creditsView) creditsView = nil end})
end

function showGameView:tap(e)
	transition.to(titleView, {time = 300, x = -titleView.height, onComplete = function() startButtonListeners('rmv') display.remove(titleView) titleView = nil end})
	
	-- [Add GFX]
	
	-- Game Bg
	
	gameBg = display.newImage('gameBg.png')
	
	-- Pad
	
	up = display.newImage('up.png', 33.5, 219.5)
	left = display.newImage('left.png', 0, 252.5)
	down = display.newImage('down.png', 33.5, 286.5)
	right = display.newImage('right.png', 66.5, 252.5)
	
	up.name = 'up'
	down.name = 'down'
	left.name = 'left'
	right.name = 'right'
	
	-- Score Text
	
	score = display.newText('0', 74, 3, native.systemFontBold, 15)
	score:setTextColor(252, 202, 1)
	
	-- Head
	
	headGFX = display.newImage('head.png', display.contentCenterX-0.3, display.contentCenterY-0.2)
	headHitArea = display.newLine(display.contentCenterX+6, display.contentCenterY-0.2, display.contentCenterX + 8, display.contentCenterY-0.2)
	headHitArea:setColor(0, 0, 0)
	headHitArea.width = 2
	head = display.newGroup(headGFX, headHitArea)
	lastPart = head
	parts = display.newGroup()
	
	-- Add first apple
	
	local randomX = 25 + math.floor(math.random() * 402)
	local randomY = 25 + math.floor(math.random() * 258)
		
	local apple = display.newImage('apple.png', randomX, randomY)
	apples = display.newGroup(apple)
	
	gameListeners()
end

function gameListeners()
	up:addEventListener('tap', movePlayer)
	left:addEventListener('tap', movePlayer)
	down:addEventListener('tap', movePlayer)
	right:addEventListener('tap', movePlayer)
end

function movePlayer(e)
	dir = e.target.name
	
	if(started == nil) then
		timerSrc = timer.performWithDelay(speed, update, 0)
		started = true
	end
end

function hitTestObjects(obj1, obj2)
        local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
        local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
        local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
        local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
        return (left or right) and (up or down)
end

function update()
	
	-- Capture head last position, this moves the first added piece
	
	local lastX = head.x
	local lastY = head.y
	
	local xPos = {}
	local yPos = {}
	
	for i = 1, parts.numChildren do
		-- Capture parts position to move them
		
		xPos[i] = parts[i].x
		yPos[i] = parts[i].y
		
		-- Move Parts
		
		if(parts[i-1] == nil) then
			parts[i].x = lastX
			parts[i].y = lastY
		else
			parts[i].x = xPos[i-1]
			parts[i].y = yPos[i-1]
		end
		
		-- Game over if head touches other part of snake
		
		if(hitTestObjects(headHitArea, parts[i])) then
			print(parts[i].name)
			if(parts[i].name == '1') then
				print('one')
			else
				timer.cancel(timerSrc)
				timerSrc = nil
				audio.play(gameOver)
			end
		end
	end
	
	-- Move Head & Hit Area
	
	if(dir == 'up') then
		head.y = head.y - mConst
		
		headHitArea.x = headGFX.x
		headHitArea.y = headGFX.y - 7
	elseif(dir == 'left') then
		head.x = head.x - mConst
		
		headHitArea.x = headGFX.x - 8
		headHitArea.y = headGFX.y
	elseif(dir == 'down') then
		head.y = head.y + mConst
		
		headHitArea.x = headGFX.x
		headHitArea.y = headGFX.y + 8
	elseif(dir == 'right') then
		head.x = head.x + mConst
		
		headHitArea.x = headGFX.x + 7
		headHitArea.y = headGFX.y
	end
	
	-- Detect apple-player collision
	
	for i = 1, apples.numChildren do
		if(hitTestObjects(head, apples[i])) then
			-- Remove Apple
			
			display.remove(apples[i])
			
			-- Add Score
			
			score.text = score.text + tostring(10)
			score:setReferencePoint(display.TopLeftReferencePoint)
			score.x = 74
			audio.play(appleGrab)
			
			-- Add snake body
			
			local part = display.newImage('bodyPart.png')
			
			if(dir == 'up') then
				part.x = lastPart.x
				part.y = lastPart.y + mConst
			elseif(dir == 'left') then
				part.x = lastPart.x + mConst
				part.y = lastPart.y
			elseif(dir == 'down') then
				part.x = lastPart.x
				part.y = lastPart.y - mConst
			elseif(dir == 'right') then
				part.x = lastPart.x - mConst
				part.y = lastPart.y
			end
			
			current = current + 1
			part.name = tostring(current)
			lastPart = part
			parts:insert(part)
			
			-- Add new apple
			
			local randomX = 25 + math.floor(math.random() * 402)
			local randomY = 25 + math.floor(math.random() * 258)
		
			local apple = display.newImage('apple.png', randomX, randomY)
			apples = display.newGroup(apple)
		end
	end
	
	-- Screen Limits
	
	if(head.x < 0) then
		head.x = display.contentWidth - mConst
	elseif(head.x > display.contentWidth) then
		head.x = 0
	end
	
	-- Vertical
	
	if(head.y < 0) then
		head.y = display.contentHeight - mConst
	elseif(head.y > display.contentHeight) then
		head.y = 0
	end
end

Main()