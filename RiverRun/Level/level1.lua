-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- hide the status bar
local widget = require "widget"
local storyboard = require( "storyboard" )
local sceneL1 = storyboard.newScene()
local backgroundMusic = audio.loadStream("Audio/Styx.mp3")
local speed, player, background, land, TimerValue, startTime, myText, physics, finished
local river1, river2, finishBG1, finishBG2
local p1L, p1Ra, p1Rb, p2L, p2R, deadEnd, p3Ra, p3Rb, p3L, p4R, p5L, p5R, p6L, p7L, p7R, rock1, rock2, rock3, rock4, rock5, finish, finishWall, lBound, rBound, dam1, dam2, dam3, dam4, swamps, rapids, theBeave
local group, info 
local kioskIndex
local kioskX = {}
local kioskY = {}
local kioskTime = {}
local kioskMode = getKioskMode()
local objectsWithLifeSpan={}
local path = system.pathForFile("multiTemp.txt", system.TemporaryDirectory)
local pathTS = system.pathForFile("lvl1TopScores.txt", system.DocumentsDirectory)
local level, multiPlayMode, currentPlayer, mode
--------------------------------------
--CHRIS IMPLEMENTS BELOW:
--------------------------------------
require ("Scripts.rapid")
require ("Scripts.swamp")
require ("Scripts.projectilePreCollision")
require ("Scripts.clickLogger")
require("config")
soundFX = require("Scripts.soundFX")

function hostileBeaver(self, event)
   local dx, dy = (player.x-self.x), (player.y-self.y) 
   local distToPlayer = math.sqrt(dx*dx+dy*dy)
   local force = .2
   if math.abs(distToPlayer)<300 then   
      if not(self.lastShot) then
         self.lastShot = os.clock()
      end
      local dt = os.clock()-self.lastShot
      --print(dt)
      if dt>=.5 then           
         self.lastShot = os.clock()
         dx, dy = (player.x-self.x), (player.y-self.y) 
         distToPlayer = math.sqrt(dx*dx+dy*dy)   
         local projectile = display.newImageRect("Images/log.png", 44, 30)
         physics.addBody(projectile, "dynamic")  
         group:insert(projectile)
         table.insert(objectsWithLifeSpan,projectile)
         projectile.sound = soundFX.woodHit          
         projectile.x = self.x
         projectile.y = self.y
         projectile.density = 10
         projectile.bounce = 0
         projectile.isProjectile=true
         projectile.birthTime = os.time()
         projectile.preCollision = projectilePreCollision
         projectile:addEventListener("preCollision",projectile)   
         dx, dy = (player.x-projectile.x), (player.y-projectile.y) 
         distToPlayer = math.sqrt(dx*dx+dy*dy)   
         projectile:applyLinearImpulse(dx/distToPlayer*force,dy/distToPlayer*force)
      end
   end
end

local boost = speed
function setSpeed()
   force = 12
   halfH = display.contentHeight/2
   dx, dy = player:getLinearVelocity()
   lastInSwamp = os.time() - player.timeLastInSwamp
   lastInRapid = os.clock() - player.timeLastInRapid
   
   if player.y<halfH and player.y>0 then
      scale = 1-player.y/halfH
      if lastInSwamp < 1 then
      
         if boost > 0 then
            boost = boost - 0.3
         end
         
      else
      
         if lastInRapid < 1 then
            boost = speed*4*scale+speed*2
         else
         
            if boost < speed*4*scale then
               boost = boost + 0.1
            end
            
         end
      end
      
      if dy<0 then
         player:applyForce(0,scale*force, player.x, player.y)
      end
      
   else
   
      if player.y>0 then
         boost = 0
      else
         
         if boost < speed*6 then
            boost = boost+.3
         end
         
      end
      
      
      
      
   end
end

function scrollTerrain()
   for i = 1, #land do
		land[i].y = land[i].y + speed + boost
	end
   for i = 3, 4 do
      background[i].y = background[i].y + speed + boost;
   end
end

function scrollWater()
   H = display.contentHeight
   o = 2
   for i = 1, 2 do
      y = background[i].y
      background[i].y = y + ((speed - 2) - boost/3);
      if y> H*1.5 then
         background[i].y = background[o].y-H + 5
         else if y< -1*H/2 then
            background[i].y = background[o].y + H - 3 
         end
      end
      o = o - 1
   end
end

-- local loc = display.newText("X,Y: 0 , 0",120,90,native.systemFont,14)
-- loc:setTextColor(0,0,0)
local myText = display.newText("Time: 0",20,40,native.systemFont,36)
myText:setTextColor(0,255,0)

local startTime = os.time()
local timeSpent = 0

function updateTimer()
   timeSpent = os.time()-startTime
   myText.text = "Time: "..timeSpent
   if(objectsWithLifeSpan) then   
      for i=1,#objectsWithLifeSpan do 
         if objectsWithLifeSpan[i] and os.time()-objectsWithLifeSpan[i].birthTime>= 10 then
            objectsWithLifeSpan[i]:removeSelf()            
            table.remove(objectsWithLifeSpan,i)
            --print(objectsWithLifeSpan[i])
         end
      end
   end
--   loc.text = "X,Y: "..player.x.." , "..player.y
end


function update()
   player:applyLinearImpulse(0,0,player.x,player.y)
   setSpeed()
   scrollTerrain()
   scrollWater()
   updateTimer()
end

function moveKiosk(self,event)
   while(kioskTime[kioskIndex] == timeSpent.."") do
      local force = 1.7
      local dx = kioskX[kioskIndex] - player.x
      local dy = kioskY[kioskIndex] - player.y
      local mag = math.sqrt(dx*dx+dy*dy)
      local xHat, yHat = dx/mag, dy/mag
      player:applyForce(force*xHat,force*yHat*.7, player.x, player.y)
	  kioskIndex= kioskIndex+1;
	end
	if (kioskTime[kioskIndex]) then
		if kioskTime[kioskIndex] < timeSpent.."" then
			kioskIndex = kioskIndex+1
		end
	end
end

--------------------------------------
--CHRIS IMPLEMENTS ABOVE:
--------------------------------------
--           Future loss handeling function
function winLossListener()
	if player then
      -- player went below the bottom (LOSE)
		if (player.y > display.contentHeight+player.height) then
			if(not(finished)) then
				print("Lose")
			end
			finished=true
         recordResult("Lost")
			storyboard.gotoScene( "Level.loss", "fade", 500 )
		else
      -- player touched the finish line (WIN)
         if (player.y<= redLine.y+player.height/4) then
			   if(not(finished)) then
				   print("Win")
			   end
			   finished=true
            recordResult("Won")
			   storyboard.gotoScene( "Level.win", "fade", 500 )
         end
		end
	end
end	
function recordResult(won_lost)
   -- Record scores for current game
   local file
   if currentPlayer == "Player2" then
      file = io.open(path,"a")
      file:write(currentPlayer..": "..won_lost.." in "..timeSpent.." seconds\n")
      io.close(file)
   else
      file = io.open(path,"w")
      file:write(level.."\n"
               ..multiPlayMode.."\n"
               ..currentPlayer..": "..won_lost.." in "..timeSpent.." seconds\n")
      io.close(file)
   end
   -- Update top Scores
   if won_lost == "Won" then
      print("=====\/ Writing top scores\/ =====")
      print("Level1")
      -- Temp variable since timeSpent can still be overwritten
      local TEtimeSpent=timeSpent
   print("timeSpent: "..TEtimeSpent)
      file = io.open(pathTS,"r")
      if not file then
      -- file doesn't exist at pathTS
         -- Make it
         file = io.open(pathTS,"w")
         file:write(TEtimeSpent)
      else
      -- file exists at pathTS
         local lines = {}
         local i=1 
         local line = file:read()
         -- copy file:lines() to lines until
         -- TEtimeSpent is written to lines
         while line and i<=5 do
            if TEtimeSpent and (TEtimeSpent < tonumber(line)) then
               lines[i] = TEtimeSpent
               i=i+1
               TEtimeSpent = nil
            end
            lines[i]=tonumber(line)
            line = file:read()
            i=i+1
         end
         if i<=5 and TEtimeSpent then
            lines[i]=TEtimeSpent
         end
         
         io.close(file)
         -- lines{} now contains the lines in lvl1TopScores.txt
         -- Should be sorted already
         file = io.open(pathTS,"w")
         
         for i=1, 10 do
            if lines[i] then
               file:write(lines[i].."\n") 
            end
         end
         
      end
      io.close(file)
      file = io.open(pathTS,"r")
      print(file:read("*a"))
      io.close(file)
   print("=====/\ Writing top scores/\ =====") 
   else
	  file = io.open(pathTS,"r")
      if not file then
      -- file doesn't exist at pathTS
         -- Make it
         file = io.open(pathTS,"w")
         io.close()
	  end   
   end
   
   
end

function sceneL1:createScene( event )
	storyboard.removeAll()
	group = self.view
	print("Create level1")
	local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=1000 }  )  -- play the background music on channel 1, loop infinitely, and fadein over 5 seconds 
   physics = require("physics")
   physics.start(true); physics.pause()

	local levelDirector =nil
	speed = 1.5
	kioskIndex = 1
	local myLevel = {}
	mode = application.TiltTapSetting.tiltTapSetting

	levelDirector = require ("Level.level1Build")

	myLevel = levelDirector.CreateLevel(physics)
	
	-- Begin character/NPC objects

	require("Scripts.characters")
   player = beaverChar()
   print("////////////////////////////////////////////////////////////////////")
   print("For some reason even though this clearly proves the angularDamping has been applied the physics engine is not taking into account the players angular damping!!!???")
   print("player.angularDamping: "..tostring(player.angularDamping))
   print("player.isBullit: "..tostring(player.isBullit))
   print("////////////////////////////////////////////////////////////////////")
   physics.addBody(player, "dynamic", player.physicsProperties)
	
	theBeave = myLevel.layers['fg'].objects['theBeave'] 

	-- End character/NPC objects

	-- Begin background objects

	background = {}

	river1 = myLevel.layers['bg'].objects['river1']
	river2 = myLevel.layers['bg'].objects['river2']
	finishBG1 = myLevel.layers['bg'].objects['finish bg1']
	finishBG2 = myLevel.layers['bg'].objects['finish bg2']

	background = {river1, river2, finishBG1, finishBG2}
	-- End background objects

	-- Begin land objects 

	land = {}

	p1L = myLevel.layers['fg'].objects['p1L']
	p1Ra = myLevel.layers['fg'].objects['p1Ra']
	p1Rb = myLevel.layers['fg'].objects['p1Rb']
	p2L = myLevel.layers['fg'].objects['p2L']
	p2R = myLevel.layers['fg'].objects['p2R']
	deadEnd = myLevel.layers['fg'].objects['dead end']
	p3Ra = myLevel.layers['fg'].objects['p3Ra']
	p3Rb = myLevel.layers['fg'].objects['p3Rb']
	p3L = myLevel.layers['fg'].objects['p3L']
	p4R = myLevel.layers['fg'].objects['p4R']
	p5L = myLevel.layers['fg'].objects['p5L']
	p5R = myLevel.layers['fg'].objects['p5R']
	p6L = myLevel.layers['fg'].objects['p6L']
	p7L = myLevel.layers['fg'].objects['p7L']
	p7R = myLevel.layers['fg'].objects['p7R']
	rock1 = myLevel.layers['fg'].objects['rock1']
	rock2 = myLevel.layers['fg'].objects['rock2']
	rock3 = myLevel.layers['fg'].objects['rock3']
	rock4 = myLevel.layers['fg'].objects['rock4']
	rock5 = myLevel.layers['fg'].objects['rock5']
	finish = myLevel.layers['fg'].objects['finish']
	finishWall = myLevel.layers['fg'].objects['finish wall']
	lBound = myLevel.layers['fg'].objects['left bound']
	rBound = myLevel.layers['fg'].objects['right bound'] 
	dam1 = myLevel.layers['fg'].objects['dam1'] 
	dam2 = myLevel.layers['fg'].objects['dam2'] 
	dam3 = myLevel.layers['fg'].objects['dam3'] 
	dam4 = myLevel.layers['fg'].objects['dam4'] 
	swamps = myLevel.layers['fg'].objects['swamp'] 
	rapids = myLevel.layers['fg'].objects['rapids']
	redLine = myLevel.layers['fg'].objects['redLine']
	info = myLevel.layers['fg'].objects['info']
	flag1 = myLevel.layers['fg'].objects['flag1']
	flag2 = myLevel.layers['fg'].objects['flag2'] 
   

	land = {swamps, rapids, p1L, p1Ra, p1Rb, p2L, p2R, deadEnd, p3Ra, p3Rb, p3L, p4R, p5L, p5R, p6L, p7L, p7R, rock1, rock2, rock3, rock4, rock5, finish, finishWall, lBound, rBound, dam1, dam2, dam3, dam4, theBeave, redLine, info, flag1, flag2}
	swamps:play()
   swamps.alpha = .99
   rapids:play()
   rapids.alpha = .99
   player:play()
   -- End land objects
 
-- Kiosk info Loading 
   local fileLoc = system.pathForFile("Kiosk/level1W.txt")
   local thisFile = io.open(fileLoc,"r")
   if thisFile then
      local i = 1
      for line in thisFile:lines() do
         for temp in string.gmatch(line, "%S+") do
            if i%3 == 1 then
               kioskX[kioskIndex] = temp
            elseif i%3 == 2 then
               kioskY[kioskIndex] = temp
            else
               kioskTime[kioskIndex] = temp
               kioskIndex = kioskIndex + 1
            end
            i = i+1
         end
      end
      kioskIndex = 1
      io.close(thisFile)
   else
      print("======\/Error\/=======")
      print(fileLoc..": could not be read")
      print("======/\Error/\=======")
   end
-- End Kiosk info Loading
	
---------------------------------------------------------
--Initial values needed for Chris's implementation BELOW:
---------------------------------------------------------
	physics.addBody( swamps, "static")
	physics.addBody( rapids,"static")
---------------------------------------------------------
--Initial values needed for Chris's implementation ABOVE:
---------------------------------------------------------
	
	-- Add variables to storyboard group
	
	for i=1, # background do
		group:insert(background[i])
	end
	for i=1, # land do
		group:insert(land[i])
	end
	group:insert(player)
	group:insert(myText)
--	group:insert(loc)
	group:insert(myLevel)
	
	-- End adding variables

end

-- Called immediately after scene has moved onscreen:
function sceneL1:enterScene( event )
	group = self.view
	finished = false
	physics.start(true)
	if(kioskMode) then
		Runtime:addEventListener("enterFrame", moveKiosk)
	else
		if mode == "Tap"  then
			Runtime:addEventListener("touch", player)
		else
			Runtime:addEventListener("accelerometer", player) 
		end
	end
	Runtime:addEventListener("touch", logClicks)
   
   Runtime:addEventListener("enterFrame", update)
	
	Runtime:addEventListener("enterFrame", winLossListener)
	
	rapids.preCollision = rapidsListener
	rapids:addEventListener("preCollision", rapids )

	swamps.preCollision = swampListener
	swamps:addEventListener("preCollision", swamps)
   
   theBeave.enterFrame = hostileBeaver
   Runtime:addEventListener("enterFrame", theBeave)
   
	
   local file = io.open(path,"r")
   if file then
      level = file:read()
      multiPlayMode = file:read()
      if multiPlayMode == "Singleplayer" then
         currentPlayer = "Player"
      else
         if file:read() == "Player1" then
            currentPlayer = "Player1"
         else
            currentPlayer = "Player2"
         end
      end
   else
      print("======\/Error\/=======")
      print(path..": could not be read")
      print("======/\Error/\=======")
   end
end

-- Called when scene is about to move offscreen:
function sceneL1:exitScene( event )
	local group = self.view
	if(kioskMode) then
		Runtime:removeEventListener("enterFrame", moveKiosk)
	else
		if mode == "Tap"  then
			Runtime:removeEventListener("touch", player)
		else
			Runtime:removeEventListener("accelerometer", player) 
		end
	end
	Runtime:removeEventListener("touch", logClicks)
	Runtime:removeEventListener("enterFrame", update)
	Runtime:removeEventListener("enterFrame", winLossListener)
	rapids:removeEventListener("preCollision", rapids )
	swamps:removeEventListener("preCollision", swamps )
	Runtime:removeEventListener("enterFrame", theBeave)   
	audio.stop(1)
	physics.pause()
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function sceneL1:destroyScene( event )
	group = self.view
	physics.stop()
	package.loaded[physics] = nil
	physics = nil
	
end


-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
sceneL1:addEventListener( "createScene", sceneL1 )

-- "enterScene" event is dispatched whenever scene transition has finished
sceneL1:addEventListener( "enterScene", sceneL1 )

-- "exitScene" event is dispatched whenever before next scene's transition begins
sceneL1:addEventListener( "exitScene", sceneL1 )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
sceneL1:addEventListener( "destroyScene", sceneL1 )

-----------------------------------------------------------------------------------------

return sceneL1