-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.

local resetGame, advanceTimer, startGameTimer
local right_shoulder;
local right_arm;
local right_arm_startPos;
local backgroundPlate;
local game_graphic;
local game_shadow;
local speed;
local time;
local constraintx1;
local constraintx2;
local gameLevel;
local game_score = 0;
local game_star;
local display_score_text = nil
local display_score_text2 = nil
local tPrevious = system.getTimer()
local cut1;
local cut2;
local cut3;
local isSliced = false;
local xpos = -100;
local kStartAngle = -130
local suspendAnimation = false;
local timerID;
local msPerFrame = 1000/30
local xspeed = 15 / msPerFrame
local startScoreImageX = 25;
local startScoreImageY = 110;
local scoreImageX = startScoreImageX;
local scoreImageY = startScoreImageY;
local scoreImageCount = 1;
local waterMelon = 1;
local shrimp = 2;
local fly = 3;

local gGraphics = { "watermelon.png", "shrimp.png", "fly.png" }
local gMelonCut = { "meln_right_half_cut.png", "melon_left_half_cut.png","melon_sliced.png" } 
local gShadows =  { "watermelon_shadow.png","shrimp_shadow.png", "fly_shadow.png"}

local gGraphicScale = { 0.45, 0.70, 1.00 } ;
local gShadowScale 	= { 0.70, 0.70, 0.30 } ;
local gScale 		= { 0.25,0.25, 1} 
local scoreScale 	= { 0.75,0.75, 1}
local scoreGraphics = {};
local gScoreGraphic =  { "score25.png", "score50.png", "score75.png" }

local gGraphicPos = 
					{ 
						{ x = -100, y = 275 },
					   	{ x = -100, y = 300 },
					   	{ x = -100, y = 340 }
					}


local gGraphicShadowPos = 
					{ 
					   	{ x = -100, y = 360 },
					   	{ x = -100, y = 360 },
					   	{ x = -100, y = 360 }
					}


local delay = system.getTimer() 


local  animateBackground = function (event)
	if ( delay + 100 < system.getTimer()) then 
		delay = system.getTimer();
		backgroundPlate:rotate(1);
	end
end


local function scoreTitleImage()

	local image;  
	local localScale;
	local widthX;
	local widhtY;

	if ( game_score == 0 ) then
		return
	end 

	if  (gameLevel == waterMelon)  then 
		image = gGraphics[waterMelon];
		localScale = 0.25;
		widthX = 35;
		widthY = 40;
	elseif ( gameLevel == shrimp ) then 
		image = gGraphics[shrimp];
	 	localScale = 0.35;
	 	widthX = 35;
	 	widthY = 35;
	elseif ( gameLevel == fly ) then
		image = gGraphics[fly];
		localScale = 0.75;
		widthX = 20;
		widthY = 25;
	end
	
	local scoreImage = display.newImage(image);
	table.insert(scoreGraphics,scoreImage);
	scoreImage.x = scoreImageX;
	scoreImage.y = scoreImageY;

	scoreImage:scale(localScale,localScale);
	scoreImageY = scoreImageY + widthY;
	scoreImageCount = scoreImageCount + 1;
	
	if ( scoreImageCount % 6 == 0  ) then
			scoreImageX = scoreImageX + widthX;
			scoreImageY  = 110
			scoreImageCount = 1;
	end
end



local function displayScore ()
	local scoreString = tostring(game_score);
	if not display_score_text then
		display_score_text2 = display.newText(scoreString,26,66,12);
			display_score_text2:setTextColor(128,128,128);
	
		display_score_text = display.newText(scoreString,25,65,12);
			display_score_text:setTextColor(255,0,0);
	end
	
	display_score_text2.text = scoreString;
	display_score_text.text = scoreString;
	
	scoreTitleImage()
end

local function addScore ()

	if ( gameLevel == waterMelon ) then
		score = 25;
	elseif (  gameLevel == shrimp ) then 
		score = 50;
	elseif ( gameLevel == fly ) then
		score = 75;
	end 
	game_score = game_score + score;
end


local function animateGameGraphic(event)

	if ( suspendAnimation ) then
		return
	end

	
	if ( isSliced ) then 
	
		cut1.x = xpos - 15;
		cut2.x = xpos + 50;
		cut3.x = xpos + 12;
		
		game_star.x = xpos + 10;
		cut1.isVisible = true;
		cut2.isVisible = true;
		cut3.isVisible = true;
		
		game_star.isVisible = true;
		game_graphic.isVisible = false;
		game_shadow.isVisible = false;
		addScore ();
		displayScore();
		suspendAnimation = true;
		return
	end
	
	if ( game_graphic.isVisible == false ) then
		cut1.isVisible = false;
		cut2.isVisible = false;
		cut3.isVisible = false;
		
		game_star.isVisible = false;
		game_graphic.isVisible = true;
		game_shadow.isVisible = true;
	end

	local tDelta = event.time - tPrevious
	tPrevious = event.time
	xpos = xpos + ( xspeed*tDelta );
	
	if (xpos> display.contentWidth+150 ) then
		xpos = -100;
	end

	game_graphic:translate( xpos - game_graphic.x,0)
	game_shadow:translate(xpos-game_shadow.x,0);
	
end



local endAnimateBackground = function()
	Runtime:removeEventListener("enterFrame",animateBackground);
end


local  startAnimateBackground  = function ()
	Runtime:addEventListener("enterFrame",animateBackground);
end


local startGraphicAnimate = function()
	Runtime:addEventListener("enterFrame",animateGameGraphic);
end

local endGraphicAnimate = function()
	Runtime:removeEventListener("enterFrame",animateGameGraphic);
end


local resetGame = function ()
	scoreImageX = startScoreImageX;
	scoreImageY = startScoreImageY;
	scoreImageCount = 1;
	game_over.isVisible = false;
	xpos = -100;
	game_score = 0;
	displayScore();
	timer_pointer.rotation = 180
	gameTimeRemaining = gameTimeLimit;
	tPrevious = system.getTimer()
	suspendAnimation = false;				
	isSliced = false;
	startGraphicAnimate();
	
end

local advanceTimer = function(event)

	if (gameTimeRemaining > 0) then
		gameTimeRemaining = gameTimeRemaining - 1;
		timer_pointer.rotation = gameTimeRemaining * 6;
	else
		endAnimateBackground()
		suspendAnimation = true;
		if ( #scoreGraphics ) then 
		local i = 1;
		
		while scoreGraphics[i] do 
		 	scoreGraphics[i].isVisible = false;
		 	i = i+ 1;
		end 
		end 

		
		game_over.isVisible = true
		
		function game_over:tap (event)
			resetGame();
			startGameTimer();
			game_over:removeEventListener("tap",game_over);
			return true;
		end 
		game_over:addEventListener( "tap", game_over )
		return true;
	end
end


local startGameTimer = function()
	gameTimeLimit = 30;
	gameTimeRemaining = gameTimeLimit
	timerID = timer.performWithDelay( 1000, advanceTimer, 0);
end

local suspendGame = function()
	endAnimateBackground();
end

local resumeGame = function()
	startAnimateBackground();
	isSliced = false;
end

local resetPos = function()
	xpos = -100;
	tPrevious = system.getTimer()
	suspendAnimation = false;				
	resumeGame();
end

local cutWaterMelon = function ()
	game_graphic.isVisible = false;
	local cut = display.newImage(melon_sliced.png,xPos,gGraphicPos[gameLevel].y);
	timer.performWithDelay( 2400, resetPos,1);

end

-- the slice event 
local function onTouch( event )
	local t = event.target

	local phase = event.phase

	local x,y = t:localToContent( t.x - t.xOrigin, t.y - t.yOrigin )
	local dx = event.x - x
	local dy = event.y - y
	local angle = math.atan2( dy, dx )

	if "began" == phase then
		display.getCurrentStage():setFocus( t )
		t.isFocus = true
		t.xStart = t.x
		t.yStart = t.y
		t.angleStart = angle
		t.rotationStart = t.rotation
	elseif t.isFocus then
		if "moved" == phase then
			local pi = math.pi
			local delta = (angle - t.angleStart)
			delta = delta*180/pi
			t.rotation = t.rotationStart + delta
		 	if ((xpos > 140) and (xpos < 180)) then
		 		if ((t.rotation < -40) and (t.rotation > -60)) then
		 			suspendGame();
		 			isSliced = true;
		 			timer.performWithDelay( 1500, resetPos,1);
		 		end
		 	end

		elseif "ended" == phase or "cancelled" == phase then
			display.getCurrentStage():setFocus( nil )
			t.isFocus = false
		 	t.rotation = kStartAngle
			local coord = t.x .. "," .. t.y
		end
	end
	return true
end


local function saticScoreText ()

	local sText = display.newText("SCORE",12,51,12);
	sText:setTextColor(128,128,128);
	sText = display.newText("SCORE",10,49,12);
	sText:setTextColor(255,0,0);
	sText = display.newText("SCORE",11,50,12);
	sText:setTextColor(255,0,0);
	
end


local function setGameLevel( level )
	gameLevel = level;
end

local function getGameLevel()
	return gameLevel;
end

local function loadSamuraiHead()
	local head = display.newImage("samurai_head.png",116,69);
end

local function loadSamuraiBody()
	local body = display.newImage("samurai_body.png",34,157);
end

local function loadLeftShoulder()
	local leftShoulder = display.newImage("left_shoulder.png",165,170);
end

local function loadLeftArm()
	local leftArm = display.newImage("left_arm.png",233,221);
	
end

local function loadRightShoulder()
	right_shoulder = display.newImage("right_shoulder.png",65,165);
end

local function loadRightArm()
	right_arm =  display.newImage("right_arm.png",35,210);
	right_arm:addEventListener( "touch", onTouch )
	right_arm:setReferencePoint( display.TopCenterReferencePoint )
	right_arm.xReference = right_arm.xReference + 10
	right_arm.yReference = right_arm.yReference + 10
	right_arm.rotation = kStartAngle
end

local function loadTimer()
	timer_bkg = display.newImage("timer-bkg.png",105,378)
	timer_pointer = display.newImage("timer-pointer.png",152,394)
	timer_pointer.rotation = 180
end

local function loadTable()

	local cuttingBoard = display.newImage("cutting_board.png",0,330);
end

local function loadBackground()
	backgroundPlate = display.newImage("background_plate.png",-76,-76);

end

local function loadGameOver()
	game_over = display.newImage("game_over.png", 0, 0)
	game_over.isVisible = false
end

local function loadGameImage()

local image; 
local imageShadow;

if  (gameLevel == waterMelon)  then 
	print ("watermelon")
	image = gGraphics[waterMelon];
	imageShadow = gShadows[waterMelon];
elseif ( gameLevel == shrimp ) then 
	print("shrimp");
	 image = gGraphics[shrimp];
	imageShadow = gShadows[shrimp];
	
elseif ( gameLevel == fly ) then
	print("fly");
	image = gGraphics[fly];
	imageShadow = gShadows[fly];
end

	game_graphic = display.newImage(image,gGraphicPos[gameLevel].x,gGraphicPos[gameLevel].y);
	game_shadow = display.newImage(imageShadow,gGraphicShadowPos[gameLevel].x , gGraphicShadowPos[gameLevel].y);	
	game_graphic:scale(gGraphicScale [ gameLevel ], gGraphicScale[gameLevel]);
	game_shadow:scale(gShadowScale [ gameLevel ], gShadowScale[gameLevel]);

	cut1 = display.newImage("melon_right_half_cut.png",-100,gGraphicPos[gameLevel].y + 30);
	cut1:scale(0.75,0.75);
	cut1.rotation = -30;
	cut1.isVisible = false;		
	cut2 = display.newImage("melon_left_half_cut.png",-100,gGraphicPos[gameLevel].y + 30);
	cut2:scale(0.75,0.75);
	cut2.rotation = 30;
	cut2.isVisible = false;
	cut3 = display.newImage("cut_shadow.png",-100,gGraphicShadowPos[gameLevel].y);
	cut3.isVisible = false;
	game_star = display.newImage("score25.png",-100,gGraphicPos[gameLevel].y+27);
	game_star.isVisible = false;
end

local loadSamuraiImages = function ()
	loadBackground()
	saticScoreText ()
	loadSamuraiBody();
	loadTable()
	loadLeftShoulder();
	loadLeftArm()	
	loadRightShoulder();
	loadSamuraiHead();
	setGameLevel(waterMelon);
	loadGameImage();
	loadRightArm();
	startAnimateBackground();
	displayScore();
	loadTimer();
	loadGameOver();
	startGameTimer();
	startGraphicAnimate();
	
end
	
splash = function()
	local splashScreen = display.newImage("samurai_splash_screen.png",0,0);
	timer.performWithDelay( 2400, loadSamuraiImages,1);
end


main = function ()	
	display.setStatusBar(display.HiddenStatusBar);
	splash();
end


main()