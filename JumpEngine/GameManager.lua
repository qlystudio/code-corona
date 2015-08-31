--[[

	Created by Rosu Sergiu on 30/Jun/2011

	Jump Engine it's a game engine for createing jumping games for mobile devices.

	This is the heart of the game, all the game logic and game related variables are handled here.

	This file is part of Jump Engine.

    Jump Engine is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Jump Engine is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Jump Engine.  If not, see <http://www.gnu.org/licenses/>.

	Copyright (C) 2011  Rosu Sergiu
--]]
GameManager_ = {pause=true,distance,gameInProgress=false,mainGroup,platformsGroup,monstersGroup};

GameManager_.metatable = { __index = GameManager_ };
GameManager_.new = function(name)
	local self = {}
	setmetatable(self, GameManager_.metatable);

	self.distance = 0;
	self.mainGroup = display.newGroup();
	self.platformsGroup = display.newGroup();
	self.monstersGroup = display.newGroup();
	
	self.mainGroup:insert(self.platformsGroup);
	self.mainGroup:insert(self.monstersGroup);
	
	return self;
end

local function onAccelerate (event)
	ball.speedX = event.xGravity*1500;
end

local function testAccel () 
	event = {}
	event.xGravity = remote.xGravity;
	onAccelerate(event);
end

function GameManager_:startGame ()
	
	if self.gameInProgress == true then
		print "game already in progress";
		return false;
	end
	
	ball.x = 240;
	ball.y = 100;

	lastTime = system.getTimer();

	maxY = 0;
	
	latestYOffset = 0;
	
	GameManager:morePlatforms(__NUMBER_OF_PLATFROMS__,0);
	
	--Runtime:addEventListener ("accelerometer", onAccelerate);
	Runtime:addEventListener( "enterFrame" , testAccel);
	Runtime:addEventListener("enterFrame", gameLoop);
	Runtime:addEventListener("touch", touch);
	
	HUD:showHUD();
	self.gameInProgress = true;
end

function GameManager_:restartGame ()
	--remove all platforms, all monsters, reset timers and points
		for j=table.maxn(platforms),0,-1  do
		if platforms[j] ~= nil then
			display.remove(platforms[j].image);
			table.remove(platforms,j);
		end
	end
		
	for j=table.maxn(mobsters),0,-1  do
		if mobsters[j] ~= nil then
			display.remove(mobsters[j].image);
			table.remove(mobsters,j);
		end
	end
	
	self.gameInProgress = false;
	
	GameManager:startGame();
end

function GameManager_:gameOver ()
	
end

function GameManager_:pauseGame ()
	self.pause = true;
	Runtime:removeEventListener("enterFrame", gameLoop);
end

function GameManager_:resumeGame()
	lastTime = system.getTimer();
	Runtime:addEventListener("enterFrame", gameLoop);
	self.pause = false;
end

-- Platforms management

function GameManager_:morePlatforms(nr_platforms,offset) 
	
--[[
		
	for i=1, nr_platforms do
		local aPlatform = Platform.new();
		aPlatform:init(math.random(20,300),i*50+offset)
		table.insert(platforms,aPlatform);
		self.platformsGroup:insert(aPlatform.image);
		--create a monster ?
		if math.random(0,2)==0 then 
			GameManager_:createMonster (aPlatform.x,aPlatform.y+30);
		end
	end
	maxY = (nr_platforms+1)*50+offset;
--]]
	
	for i=1, table.maxn(platforms) do
		if platforms[i] ~= nil then	
			convertToLocalScreen(platforms[i].image,platforms[i].x,platforms[i].y);
		end
	end
end

latestYOffset = 0;
currentOffset = 0;
function GameManager_:centerMap()
	--calculate offsets
	local xOffset = 0;
	local yOffset = 0;
	if ball.y > 240 then
		yOffset = ball.y - 240;
	end
	
	if yOffset < latestYOffset then 
		yOffset = latestYOffset;
	end
	
	latestYOffset = yOffset;

	convertToLocalScreen(ball.image,ball.x+xOffset,ball.y-yOffset);

	self.platformsGroup.y = yOffset;
	self.monstersGroup.y = yOffset;
	
	currentOffset = yOffset;
end

function GameManager_:clearPlatforms () 

	for j=1, table.maxn(platforms) do
		if platforms[j] ~= nil then
			if (ball.y - platforms[j].y) > 300 then
					display.remove(platforms[j].image);
					table.remove(platforms,j);
			end
		end
	end
	for j=1, table.maxn(mobsters) do
		if mobsters[j] ~= nil then
			if (ball.y - mobsters[j].y) > 400 then
					display.remove(mobsters[j].image);
					table.remove(mobsters,j);
			end
		end
	end
 end

function GameManager_:createPlatform(x,y)
		local aPlatform = Platform.new();
		aPlatform:init(x,y);
		table.insert(platforms,aPlatform);
		GameManager.platformsGroup:insert(aPlatform.image);
end

-- Monsters Management
function GameManager_:createMonster (x,y)
		local aMonster = Monster.new(x,y);
		table.insert(mobsters,1,aMonster);
		GameManager.monstersGroup:insert(aMonster.image);
		convertToLocalScreen(aMonster.image,x,y);
end


--fire and bullets management
function GameManager_:fire(event)
	newBullet = Bullet.new(event.x,event.y);
	self.monstersGroup:insert(newBullet.image);
	convertToLocalScreen(newBullet.image,ball.x,ball.y);	
	table.insert(bullets,newBullet);
end

-- touch management
function GameManager_:touchOnScreen(event)
	if event.phase == 'ended' then
		GameManager:fire(event);
	end
end

GameManager = GameManager_.new();