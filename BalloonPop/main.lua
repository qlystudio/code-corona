-- Hide status bar
display.setStatusBar(display.HiddenStatusBar);

-- Display a background image
--[[ Here we are inserting
a background image of clouds --]]
local background = display.newImage("images/clouds.png");

-- Generate Physics Engine
local physics = require("physics");

-- 1. Enable drawing mode for testing, you can use "normal", "debug" or "hybrid"
physics.setDrawMode("normal")

-- 2. Enable multitouch so more than 1 balloon can be touched at a time
system.activate("multitouch");

-- 3. Find device display height and width
_H = display.contentHeight;
_W = display.contentWidth;

-- 4. Number of balloons variable
balloons = 0;

-- 5. How many balloons do we start with?
numBalloons = 100;

-- 6. Game time in seconds that we'll count down
startTime = 20;

-- 7. Total amount of time
totalTime = 20;

-- 8. Is there any time left?
timeLeft = true;

-- 9. Ready to play?
playerReady = false;

-- 10. Generate math equation for randomization
Random = math.random;

-- 11. Load background music
local music = audio.loadStream("sounds/music.mp3");

-- 12. Load balloon pop sound effect
local balloonPop = audio.loadSound("sounds/balloonPop.mp3");

-- Create a new text field using native device font
local screenText = display.newText("...Loading Balloons...", 0, 0, native.systemFont, 16*2);
screenText.xScale = 0.5
screenText.yScale = 0.5;
-- Change the center point to bottom left
screenText:setReferencePoint(display.BottomLeftReferencePoint);
-- Place the text on screen
screenText.x = _W / 2 - 210;
screenText.y = _H - 20;

-- Create a new text field to display the timer
local timeText = display.newText("Time: "..startTime, 0, 0, native.systemFont, 16*2);
timeText.xScale = 0.5
timeText.yScale = 0.5;
timeText:setReferencePoint(display.BottomLeftReferencePoint);
timeText.x = _W / 2;
timeText.y = _H - 20;

local gameTimer;

-- Did the player win or lose the game?
local function gameOver(condition)
	-- If the player pops all of the balloons they win
	if (condition == "winner") then
		screenText.text = "Amazing!";
	-- If the player pops 70 or more balloons they did okay
	elseif (condition == "notbad") then
		screenText.text = "Not too shabby."
	-- If the player pops less than 70 balloons they didn't do so well
	elseif (condition == "loser") then
		screenText.text = "You can do better.";
	end
end 

-- Remove balloons when touched and free up the memory they once used
local function removeBalloons(obj)
	obj:removeSelf();
	-- Subtract a balloon for each pop
	balloons = balloons - 1;
	
	-- If time isn't up then play the game
	if (timeLeft ~= false) then
		-- If all balloons were popped
		if (balloons == 0) then
			timer.cancel(gameTimer);
			gameOver("winner")
		elseif (balloons <= 30) then
			gameOver("notbad");
		elseif (balloons >=31) then
			gameOver("loser");
		end
	end
end

local function countDown(e)
	-- When the game loads, the player is ready to play
	if (startTime == totalTime) then
		-- Loop background music
		audio.play(music, {loops =- 1});
		playerReady = true;
		screenText.text = "Hurry!"
	end
	-- Subtract a second from start time
	startTime = startTime - 1;
	timeText.text = "Time: "..startTime;
	
	-- If remaining time is 0, then timeLeft is false 
	if (startTime == 0) then
		timeLeft = false;
	end
end

-- 1. Start the physics engine
physics.start()
-- 2. Set gravity to be inverted
physics.setGravity(0, -0.4)	

--[[ Create "walls" on the left, right and ceiling to keep balloon on screen
	display.newRect(x coordinate, y coordinate, x thickness, y thickness)
	So the walls will be 1 pixel thick and as tall as the stage
	The ceiling will be 1 pixel thick and as wide as the stage 
--]]
local leftWall = display.newRect (0, 0, 1, display.contentHeight);
local rightWall = display.newRect (display.contentWidth, 0, 1, display.contentHeight);
local ceiling = display.newRect (0, 0, display.contentWidth, 1);

-- Add physics to the walls. They will not move so they will be "static"
physics.addBody (leftWall, "static",  { bounce = 0.1 } );
physics.addBody (rightWall, "static", { bounce = 0.1 } );
physics.addBody (ceiling, "static",   { bounce = 0.1 } );

local function startGame()
	-- 3. Create a balloon, 25 pixels by 25 pixels
	local myBalloon = display.newImageRect("images/balloon.png", 25, 25);
	
	-- 4. Set the reference point to the center of the image
	myBalloon:setReferencePoint(display.CenterReferencePoint);
	
	-- 5. Generate balloons randomly on the X-coordinate
	myBalloon.x = Random(50, _W-50);
	
	-- 6. Generate balloons 10 pixels off screen on the Y-Coordinate
	myBalloon.y = (_H+10);
	
	-- 7. Apply physics engine to the balloons, set density, friction, bounce and radius
	physics.addBody(myBalloon, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});

    -- Allow the user to touch the balloons
	function myBalloon:touch(e)
		-- If time isn't up then play the game
		if (timeLeft ~= false) then
			-- If the player is ready to play, then allow the balloons to be popped
			if (playerReady == true) then
				if (e.phase == "ended") then
					-- Play pop sound
					audio.play(balloonPop);
					-- Remove the balloons from screen and memory
					removeBalloons(self);
				end
			end
		end
	end
	-- Increment the balloons variable by 1 for each balloon created
	balloons = balloons + 1;
	
	-- Add event listener to balloon
	myBalloon:addEventListener("touch", myBalloon);
    
        -- If all balloons are present, start timer for totalTime (10 sec)
	if (balloons == numBalloons) then
		gameTimer = timer.performWithDelay(1000, countDown, totalTime);
	else
		-- Make sure timer won't start until all balloons are loaded
		playerReady = false;
	end
end

-- 8. Create a timer for the game at 20 milliseconds, spawn balloons up to the number we set numBalloons
gameTimer = timer.performWithDelay(20, startGame, numBalloons);
