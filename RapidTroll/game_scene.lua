

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local flags={}
local scoreText
local score=0
local ball
local main
local gameoverText
local blocks
local moveSpeed = 2
local player
local playerSpeedX=0
local playerSpeedY=0

local numblocks=0
local movePlayer = {}
local cont=0
local cont2=0
local checkpoints=0
local contBad=0;
local physics = require ("physics")
require("ice")
local scores = ice:loadBox( "scores" )
local GGMusic = require( "GGMusic" )
local music = GGMusic:new()
local physicsData = (require "shapes").physicsData(0.8)

local toDelete
physics.start()
physics.setGravity(0, 0)


local deltaTime
local runtime = 0

local wall
local wall2
local sensor
local sensor2
local onGaming = true

local myScene

local game

local bg



local parallax = require( "parallax" )

local function getDeltaTime()
   local temp = system.getTimer()  --Get current game time in ms
   local dt = (temp-runtime) / (1000/60)  --60fps or 30fps as base
   runtime = temp  --Store game time
   return dt
end



local function update()

	if(onGaming) then


		myScene:move(0,-2);
		
		local objs = myScene:getObjects(game)
		for i = 1, objs.numChildren do
			-- Blocks Movement 
			
				if(objs[i].name =="block" or objs[i].name =="bad" or objs[i].name=="flag" or objs[i].name=="toDelete") then

					objs[i].y = objs[i].y - moveSpeed	

				end

			
			
			
			
		end
		

		player:setLinearVelocity(  playerSpeedX, playerSpeedY+50)
		--player:setLinearVelocity(  50, 0 )

		deltaTime = getDeltaTime()

		score=score+1
		scoreText.text = score

	end



end

function addInitialBlocks(n)
	--blocks = display.newGroup()
	

	for i = 1, n do 
		addBlock()

	end
	
	
end


function addBlock()
	local r = math.floor(math.random() * 4)
	
	--if(numblocks%20==0) then
		
	--end
	
	if(r ~= 0 and  r ~= 3) then
		local flag=false;
		local block = display.newImage('block.png')
		math.randomseed( os.time() );
		math.random(); math.random(); math.random();		
		--block.x = math.random() * (display.contentWidth - (block.width * 0.5))
		--v=((math.random(100) ) * math.random() * deltaTime) % 13
		math.randomseed( os.time() );
		local temp=(math.random()*getDeltaTime()*50)%2 
		--print(math.floor(temp))
		if(math.floor(temp)==0) then
			math.randomseed( os.time());
			math.random(); math.random(); math.random();

			if(cont>=2) then
				math.randomseed( os.time());
				block.x= display.contentWidth - block.width/2 - limitNumber(block.width*math.random(),0,block.width)
				cont=0
				flag=false
			else
				math.randomseed( os.time());
				block.x= block.width/2 + limitNumber(block.width*math.random(),0,block.width);			
				flag=true
				cont=cont+1
			end

		else
			math.randomseed( os.time() );
			math.random(); math.random(); math.random();

			if(cont2>=2) then
				math.randomseed( os.time());
				block.x= block.width/2 + limitNumber(block.width*math.random(),0,block.width)	
				cont2=0
				flag=true
			else
				math.randomseed( os.time());
				block.x= display.contentWidth - block.width/2 - limitNumber(block.width*math.random(),0,block.width)
				cont2=cont2+1
				flag=false

			end
		end

		
		--print(block.x);

		block.y = (display.contentHeight + block.height) + (block.height*math.random())
		
		physics.addBody(block, {density = 1, bounce = 0})
		block.bodyType = 'static'
		block.name='block'
		--blocks:insert(block)
		numblocks=numblocks+1
		
		createFlag(block)

		
		myScene:insertObj(block,game)

		math.randomseed( os.time() );
		math.random(); math.random(); math.random();

		if (math.floor((math.random()*100))%2==1) then

			local block2 = display.newImage('block.png')
			--math.randomseed( math.floor(os.time() *deltaTime * math.random()))
			--block.x = math.random() * (display.contentWidth - (block.width * 0.5))
			--v=((math.random(100) ) * math.random() * deltaTime) % 13
			math.randomseed( os.time() );
			math.random(); math.random(); math.random();


			if(flag) then
				math.randomseed( os.time() );
				block2.x= display.contentWidth - block2.width/2  - limitNumber(block2.width*math.random(),0,block2.width);
				cont2=cont2+1;

			else
				math.randomseed( os.time() );
				block2.x= block2.width/2 + limitNumber(block2.width*math.random(),0,block2.width);
				cont=cont+1;

			end
			math.randomseed( os.time() );
			block2.y = (display.contentHeight + block2.height) - (block.height*math.random())
			
			physics.addBody(block2, {density = 1, bounce = 0})
			block2.bodyType = 'static'
			block2.name='block'
			--blocks:insert(block2)
			numblocks=numblocks+1
			createFlag(block2)

			myScene:insertObj(block2,game)
		end
	else
		
		if(contBad<1) then
			local badBlock = display.newImage('badBlock.png')
			badBlock.name = 'bad'
			physics.addBody(badBlock, {density = 1, bounce = 0})
			badBlock.bodyType = 'static'
			--math.randomseed( os.time() *deltaTime * math.random())
			--badBlock.x = math.random() * (display.contentWidth - (badBlock.width * 0.5))
			--v=((math.random(100) ) * math.random() * deltaTime) % 13
			math.randomseed( os.time() );
			math.random(); math.random(); math.random();
			math.randomseed( os.time() );
			badBlock.x= display.contentWidth/2 + limitNumber(badBlock.width*math.random()*getUnit(),-1*badBlock.width,badBlock.width);
			badBlock.y = display.contentHeight + badBlock.height - (badBlock.height*math.random())
			
			--blocks:insert(badBlock)
			
			myScene:insertObj(badBlock,game)
			contBad=contBad+1;
		else
			contBad=0;

			local block3 = display.newImage('block.png')
			--math.randomseed( math.floor(os.time() *deltaTime * math.random()))
			--block.x = math.random() * (display.contentWidth - (block.width * 0.5))
			--v=((math.random(100) ) * math.random() * deltaTime) % 13
			math.randomseed( os.time() * math.random());
			math.random(); math.random(); math.random();
			math.randomseed( os.time() );
			block3.x= limitNumber(display.contentWidth*math.random(), block3.width/2,display.contentWidth - block3.width/2) 
			
			block3.y = (display.contentHeight + block3.height) - (block3.height*math.random())
			
			physics.addBody(block3, {density = 1, bounce = 0})
			block3.bodyType = 'static'
			block3.name='block'
			--blocks:insert(block3)
			numblocks=numblocks+1
			createFlag(block3)	

			
			myScene:insertObj(block3,game)

		end
	end
	
end

function onFlagCollision( self, event )
	if ( event.phase == "began" ) then
 		
        --print( self.name .. ": collision began with " .. event.other.name )
 		if(event.other.name=="ball") then
 			--print("exito")
 		end
    end

end

function createFlag(block)
	if(numblocks%3==0) then
		local fg = display.newImage("flag.png")
		fg.x=block.x
		fg.y=block.y-28
		
		fg.name="flag"
		--local rectangular = { 0,-37, 37,-10, 23,34, -23,34, -37,-10 }
		local s = {   -280, -5  ,  -278, -7  ,  278, -7  ,  280, 5  ,  278, 7  ,  -288, 7  ,  -280, 5  }
                    
		physics.addBody( fg, { isSensor = true ,shape=s } )
		

		table.insert(flags,fg)
		
		myScene:insertObj(fg,game)	
	end

end







function limitNumber(number,bottonLimit,topLimit)

	if(number< bottonLimit ) then
		
		return bottonLimit
	elseif(number> topLimit ) then
		return topLimit
	else
		return number
	end

end

function getUnit()
	math.randomseed( os.time() );

	if((math.random()*100)%2 == 0) then
		return 1;
	else
		return -1;
	end
end

function movePlayer:accelerometer(e)
	-- Accelerometer Movement
	
    player.rotation = player.rotation + e.xInstant*10
	--player:applyLinearImpulse( e.xGravity*10, 0, player.x, player.y )	
	

	if(e.xInstant>0.060) then
		playerSpeedX=limitNumber(e.xInstant*20,50,100)
	
	elseif(e.xInstant<-0.060) then		

		playerSpeedX=limitNumber(e.xInstant*20,-100,-50)
	
	else
		playerSpeedX=0
	end


	--playerSpeedY=limitNumber(e.yGravity*100,-100,100)

end

function hideFlagText()
	flagText.alpha=0
end

function deleteBadBlock()
	
	if(toDelete.name=="toDelete") then
		toDelete:removeSelf()
	end
	
	
end

function ballCollision( self, event )
	if ( event.phase == "began" ) then
 		
        if(event.other.name=='flag') then
        	event.other:removeSelf()
        	flagText.text="CHECKPOINT "..string.char(97+checkpoints)
        	flagText.x=display.contentWidth/2
        	flagText.y=event.other.y
        	flagText.alpha=1
			timer.performWithDelay(1000, hideFlagText, 1)
			checkpoints=checkpoints+1


        end

        

        if(event.other.name=='bad') then
        	
        	toDelete =event.other
        	toDelete.name="toDelete"
        	--toDelete:removeSelf()
        	timer.performWithDelay(500, deleteBadBlock, 1)
        end




       
 
    elseif ( event.phase == "ended" ) then
 		
 
    end

end

function sensorCollision( self, event )
		if ( event.phase == "began") then
	 
	      --  print( self.name .. ": collision began with " .. event.other.name )
	 		if(event.other.name=="ball") then
		 		
		 		onGaming = false
		 		timer.cancel(blockTimer)
		 		blockTimer=nil
		 		flags=nil

				Runtime:removeEventListener("enterFrame",update)
				Runtime:removeEventListener("accelerometer", movePlayer)


				ball:removeEventListener("collision",ball)	

				
				sensor:removeEventListener("collision",sensor)	

				
				sensor2:removeEventListener("collision",sensor2)

				
				wall:removeEventListener("collision",wall)	

				
				wall2:removeEventListener("collision",wall2)
		 		
		 		gameoverText = display.newImage("game_over.png")
		 		gameoverText.x=display.contentWidth/2
		 		gameoverText.y=display.contentHeight/2
		 		gameoverText.xScale=0.5
		 		gameoverText.yScale=0.5
		 		main:insert(gameoverText)
		 		myScene.alpha=0.3
		 		scoreText.alpha=0
		 		scoreText=nil
		 		scoreText = display.newText( score, display.contentWidth/2, display.contentHeight/2+50, "Helvetica", 30 )
				scoreText.x=display.contentWidth/2
				scoreText:setTextColor(255, 255, 255)
				main:insert(scoreText)

				if(scores:storeIfHigher( "best", score )) then
					scores:store( "last", true)
				else
					scores:store( "last", false)
				end
				scores:store( "checkpoints", checkpoints)
				scores:save()

				checkpoints=0

				timer.performWithDelay(3000, nextScene, 1)
			elseif(event.other.name=="block" or event.other.name=="badBlock" or event.other.name=="flag") then
				if(not event.other==nil) then
					event.other:removeSelf()
				end
			end
	 		
	 		

	 	end
	    --elseif ( event.phase == "ended" ) then
	 
	      --  print( self.name .. ": collision ended with " .. event.other.name )
	 
	    --end

	end

	function wallCollision( self, event )
		if ( event.phase == "began" ) then
	 		
	        print( self.name .. ": collision began with " .. event.other.name )
	 
	    elseif ( event.phase == "ended" ) then
	 
	        print( self.name .. ": collision ended with " .. event.other.name )
	 
	    end

	end



----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	
	music:add( "music.mp3", "music" )
	myScene = parallax.newScene(
	{
		width = 320,
		height = 480,
		bottom = 480,            -- So the bottom lines up with the bottom of the screen
		left = 0,
	    repeated = "false"         -- Optional, repeated defaults to false
	} )

	game =myScene:newLayer(
	{
		image = "Cartoon-Clouds.jpg",
		width = 0,               -- This is dimensions of the image
		height = 0,
		bottom = 480,              -- Sometimes it makes sense to use bottom/left
		left = 0,
	    speed = 0,
	    repeated = false    -- You can choose "horizontal" "vertical" or "both" directions to repeat
	} )


	bg =myScene:newLayer(
	{
		image = "Cartoon-Clouds.jpg",
		width = 320,               -- This is dimensions of the image
		height = 480,
		bottom = 480,              -- Sometimes it makes sense to use bottom/left
		left = 0,
	    speed = 1,
	    repeated = "vertical"    -- You can choose "horizontal" "vertical" or "both" directions to repeat
	} )

	

	local group = self.view
	main=group
	flagText = display.newText( "CHECKPOINT", 0, 0, "bladerunner", 16 )
	flagText:setTextColor(235, 120, 38)
	flagText.name="flagtext"
	flagText.alpha=0
	ball = display.newImage('troll_cabeza.png')
	deltaTime = getDeltaTime()
	ball.xScale=0.8
	ball.yScale=0.8
	ball.x=display.contentWidth/2
	ball.y=display.contentHeight/2
	ball.name='ball'


	
	physics.addBody( ball, "dynamic", physicsData:get("troll_cabeza") )
	myScene:insertObj(ball,game)


	wall = display.newImage('block.png')
	wall.x=-5
	wall.y=display.contentHeight/2
	wall.width=10
	wall.height=display.contentHeight + wall.height*7
	wall.name='wall'
	physics.addBody( wall, "static" )
	wall.gravityScale = 0
	myScene:insertObj(wall,game)

	wall2 = display.newImage('block.png')
	wall2.x=display.contentWidth + 5
	wall2.y=display.contentHeight/2
	wall2.width=10
	wall2.height=display.contentHeight + wall2.height*7
	wall2.name='wall2'
	physics.addBody( wall2, "static" )
	wall2.gravityScale = 0
	myScene:insertObj(wall2,game)

	sensor = display.newImage('block.png')
	sensor.width=display.contentWidth
	sensor.height=10
	sensor.name='sensor'
	sensor.x=display.contentWidth/2
	sensor.y=display.contentHeight + 60
	
	
	physics.addBody( sensor, { isSensor = true } )
	sensor.gravityScale = 0
	myScene:insertObj(sensor,game)

	sensor2 = display.newImage('block.png')
	sensor2.width=display.contentWidth
	sensor2.height=10
	sensor2.name='sensor'
	sensor2.x=display.contentWidth/2
	sensor2.y=-60

	physics.addBody( sensor2, { isSensor = true } )
	sensor2.gravityScale = 0
	myScene:insertObj(sensor2,game)

	
	player=ball
	

	group:insert(myScene)

	scoreText = display.newText( "0", 3*display.contentWidth/4+30, 0, "bladerunner", 18 )
	scoreText:setTextColor(255, 99, 20)

	group:insert(scoreText)
 
	--Change the value of myText
	


	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	
end

function nextScene()
	storyboard.gotoScene( "summary_scene", "slideLeft", 800  )

end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	
	--storyboard.purgeScene( "intro_scene" )
	--scores:store( "best", 0 )
	--scores:save()
	
	music:play()
	scores = ice:loadBox( "scores" )
	flags={}
	runtime=0
	numblocks=0
	playerSpeedX=0
	playerSpeedY=0
	score=0
	onGaming=true
	ball.x=display.contentWidth/2
	ball.y=display.contentHeight/2
	cont=0
	cont2=0
	contBad=0
	checkpoints=0
	moveSpeed = 2
	if(scores:retrieve( "best")==nil) then
		scores:store( "best", 0 )
	end
	

	local group = self.view


	
	ball.collision = ballCollision
	ball:addEventListener("collision",ball)	

	sensor.collision=sensorCollision
	sensor:addEventListener("collision",sensor)	

	sensor2.collision=sensorCollision
	sensor2:addEventListener("collision",sensor2)

	wall.collision=wallCollision
	wall:addEventListener("collision",wall)	

	wall2.collision=wallCollision
	wall2:addEventListener("collision",wall2)


	Runtime:addEventListener("enterFrame",update)
	Runtime:addEventListener("accelerometer", movePlayer)

--Runtime:addEventListener("enterFrame",addBlock);
	addInitialBlocks(1);
	blockTimer = timer.performWithDelay(700, addBlock, 0)
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	music:stop()

	--scores:store( "best", score )
	
	
	
	


	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene