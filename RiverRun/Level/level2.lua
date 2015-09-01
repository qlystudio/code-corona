-----------------------------------------------------------------------------------------
--
-- level2.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- hide the status bar
local widget = require "widget"
local storyboard = require( "storyboard" )
local sceneL2 = storyboard.newScene()
local backgroundMusic = audio.loadStream("Audio/Love.mp3")
local speed, player, background, land, TimerValue, startTime, myText, physics, finished, enemyBeavers, pipe
local river1, river2, rapids1, rapids2, rapids3a, rapids3b, rapids3c, rapids3d, swamp1, swamp2, info
local beave1, beave2, beave3, beave4, beave5, beave6, beaveBoatH1, beaveBoatH2, beaveBoatH3, beaveBoatH4, beaveBoatV1, beaveBoatV2, beaveBoatV3
local objectsWithLifeSpan={}
local boatBeaves={}
local group
local kioskIndex
local kioskX = {}
local kioskY = {}
local kioskTime = {}
local kioskMode = getKioskMode()
local path = system.pathForFile("multiTemp.txt", system.TemporaryDirectory)
local pathTS = system.pathForFile("lvl2bTopScores.txt", system.DocumentsDirectory)
local level, multiPlayMode, currentPlayer, mode
--------------------------------------
--CHRIS IMPLEMENTS BELOW:
--------------------------------------
physics = require("physics")
require ("Scripts.rapid")
require ("Scripts.swamp")
require ("Scripts.projectilePreCollision")
require ("Scripts.clickLogger")
require("config")
soundFX = require("Scripts.soundFX")
function hostileBeaver(self, event)
   local dx, dy = (player.x-self.x), (player.y-self.y) 
   local distToBeaver = math.sqrt(dx*dx+dy*dy)
   if not(self.lastShot) then
      self.lastShot = os.clock()
   end 
   if math.abs(distToBeaver)<200 then
      local dt = os.clock()-self.lastShot
      --print(dt)
      if dt>=2.0 then           
         self.lastShot = os.clock()
         local projectile = display.newImageRect("Images/log.png", 44, 30)         
            group:insert(projectile)
            table.insert(objectsWithLifeSpan,projectile) 
            projectile.sound = soundFX.woodHit           
            projectile.birthTime = os.clock() 
            projectile.theBeave = self
            projectile.x = self.x
            projectile.y = self.y
            projectile.density = 50
            projectile.bounce = 0
            projectile.linearDamping = .2
            projectile.angularDamping = 2
            projectile.hitBeaver=false
            projectile.isProjectile=true
            projectile.lifeSpan = 1.3
            projectile.preCollision = projectilePreCollision
            projectile:addEventListener("preCollision",projectile)             
            projectile.delayTime=200          
            physics.addBody(projectile, "dynamic")   
            local function delayedImpulse()   
               if(player.x and player.y and projectile.x and projectile.y) then                   
                  local force = .2
                  dx, dy = (player.x-projectile.x), (player.y-projectile.y) 
                  distToBeaver = math.sqrt(dx*dx+dy*dy)
                  projectile:applyLinearImpulse(dx/distToBeaver*force,dy/distToBeaver*force)
               end
            end
            timer.performWithDelay(projectile.delayTime, delayedImpulse)
            
      end
   end
end

local boost = speed
function setSpeed()
   force = 12
   halfH = display.contentHeight/2
   dx, dy = player:getLinearVelocity()
   local lastInSwamp = os.time() - player.timeLastInSwamp
   local lastInRapid = os.clock() - player.timeLastInRapid
   --print("Time last in swamp : "..lastInSwamp)
   --print("Time last in rapids: "..lastInRapid)
   
   if player.y<halfH and player.y> 2 then
      scale = 1-player.y/halfH
      if lastInSwamp < 1 and lastInRapid > 2 then
      
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
	pipe.y = pipe.y  + speed + boost
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
         if(objectsWithLifeSpan[i]) then
            local lifeSpan = os.clock()-objectsWithLifeSpan[i].birthTime
            if lifeSpan <= objectsWithLifeSpan[i].delayTime/1000 then
               objectsWithLifeSpan[i].angularVelocity = 0
               objectsWithLifeSpan[i].x = objectsWithLifeSpan[i].theBeave.x
               objectsWithLifeSpan[i].y = objectsWithLifeSpan[i].theBeave.y
            
            else
               if lifeSpan>=objectsWithLifeSpan[i].lifeSpan then
                  objectsWithLifeSpan[i]:removeSelf()
                  table.remove(objectsWithLifeSpan,i)
               end
            end
         end
      end
   end
--   loc.text = "X,Y: "..player.x.." , "..player.y
end

function panBeavers()
   local panDistance = 200
   local panSpeed = 3
   for i=1, #boatBeaves do
      boatBeaves[i].yStart = boatBeaves[i].yStart + speed + boost
      local xPos = boatBeaves[i].x
      local yPos = boatBeaves[i].y
      --Beavers that pan Vertically
      if boatBeaves[i].vertical then
      
         if yPos < boatBeaves[i].yStart then
            boatBeaves[i].dirScalar = 1
         else
            if yPos > (boatBeaves[i].yStart + panDistance) then
               boatBeaves[i].dirScalar = -1
            end
         end
         
      -- Pan the beavers (in the y dimension) at constant speed now --
      boatBeaves[i].y = boatBeaves[i].y + panSpeed*boatBeaves[i].dirScalar
      ----------------------------------------------------------------
         
      else -- Horizontal
      --Beavers that pan Horizontally   
         if xPos < boatBeaves[i].xStart then
            boatBeaves[i].dirScalar = 1
         else
            if xPos > (boatBeaves[i].xStart + panDistance) then
               boatBeaves[i].dirScalar = -1
            end
         end
         
      -- Pan the beavers (in the x dimension) at constant speed now --
      boatBeaves[i].x = boatBeaves[i].x + panSpeed*boatBeaves[i].dirScalar
      ----------------------------------------------------------------
         
      end
   end
end

function update()
   player:applyLinearImpulse(0,0,player.x,player.y)
   updateTimer()
   setSpeed()
   scrollTerrain()
   scrollWater()
   panBeavers()
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
		local tempValue = tonumber(kioskTime[kioskIndex])
		if tempValue < timeSpent then
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
         if (player.y<= pipe.y+player.height/4) then
			   if(not(finished)) then
				   print("Win")
			   end
--			   finished=true
--			   recordResult("Won")
			   storyboard.gotoScene( "Level.level2b", "fade", 500 )
         end
		end
	end
end	
function recordResult(won_lost)
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
      print("Level2a")
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

function sceneL2:createScene( event )
	storyboard.removeAll()
	group = self.view
	physics = require("physics")
	print("Create level1")
	
	local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=1000 }  )  -- play the background music on channel 1, loop infinitely, and fadein over 5 seconds 
	physics.start(true); physics.pause()

	local levelDirector =nil
	speed = 1.0
	kioskIndex = 1
	local myLevel = {}
	mode = application.TiltTapSetting.tiltTapSetting
	

	levelDirector = require ("Level.level2Build")

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

	-- End character/NPC objects

	-- Begin background objects

	background = {}

	river1 = myLevel.layers["bg"].objects["river1"]
	river2 = myLevel.layers["bg"].objects["river2"]

	background = {river1, river2}
	-- End background objects

	-- Begin land objects 

	land = {}

	swamp1 = myLevel.layers["fg"].objects["swamp1"]	
	swamp2 = myLevel.layers["fg"].objects["swamp2"]
	rapids1 = myLevel.layers["fg"].objects["rapids1"]	
	rapids2 = myLevel.layers["fg"].objects["rapids2"]	
	rapids3a = myLevel.layers["fg"].objects["rapids3a"]
	rapids3b = myLevel.layers["fg"].objects["rapids3b"]	
	rapids3c = myLevel.layers["fg"].objects["rapids3c"]	
	rapids3d = myLevel.layers["fg"].objects["rapids3d"]	
	pb1 = myLevel.layers["fg"].objects["pb1"]
	pb2 = myLevel.layers["fg"].objects["pb2"]
	pb3 = myLevel.layers["fg"].objects["pb3"]
	pb4 = myLevel.layers["fg"].objects["pb4"]
	pb5 = myLevel.layers["fg"].objects["pb5"]
	pb7 = myLevel.layers["fg"].objects["pb7"]
	pb8 = myLevel.layers["fg"].objects["pb8"]
	pb9 = myLevel.layers["fg"].objects["pb9"]
	pb10 = myLevel.layers["fg"].objects["pb10"]
	pb11 = myLevel.layers["fg"].objects["pb11"]
	pb12 = myLevel.layers["fg"].objects["pb12"]
	pb13 = myLevel.layers["fg"].objects["pb13"]
	pb14 = myLevel.layers["fg"].objects["pb14"]
	pb15 = myLevel.layers["fg"].objects["pb15"]
	pb16 = myLevel.layers["fg"].objects["pb16"]
	pb17 = myLevel.layers["fg"].objects["pb17"]
	pb18 = myLevel.layers["fg"].objects["pb18"]
	pb19 = myLevel.layers["fg"].objects["pb19"]
	pb20 = myLevel.layers["fg"].objects["pb20"]
	pb21 = myLevel.layers["fg"].objects["pb21"]
	pb22 = myLevel.layers["fg"].objects["pb22"]
	pb23 = myLevel.layers["fg"].objects["pb23"]
	pb24 = myLevel.layers["fg"].objects["pb24"]
	pb25 = myLevel.layers["fg"].objects["pb25"]
	pb26 = myLevel.layers["fg"].objects["pb26"]
	pb27 = myLevel.layers["fg"].objects["pb27"]
	pb28 = myLevel.layers["fg"].objects["pb28"]
	pb29 = myLevel.layers["fg"].objects["pb29"]
	pb30 = myLevel.layers["fg"].objects["pb30"]
	pb31 = myLevel.layers["fg"].objects["pb31"]
	pb32 = myLevel.layers["fg"].objects["pb32"]
	pb33 = myLevel.layers["fg"].objects["pb33"]
	pb34 = myLevel.layers["fg"].objects["pb34"]
	pipe = myLevel.layers["fg"].objects["pb35"]
	info = myLevel.layers["fg"].objects["info"]
	beave1 = myLevel.layers["fg"].objects["beave1"]
	beave2 = myLevel.layers["fg"].objects["beave2"]
	beave3 = myLevel.layers["fg"].objects["beave3"]
	beave4 = myLevel.layers["fg"].objects["beave4"]
	beave5 = myLevel.layers["fg"].objects["beave5"]
	beave6 = myLevel.layers["fg"].objects["beave6"]
	beaveBoatH2 = myLevel.layers["fg"].objects["beaveBoatH2"]
	beaveBoatH4 = myLevel.layers["fg"].objects["beaveBoatH4"]
	beaveBoatV1 = myLevel.layers["fg"].objects["beaveBoatV1"]
	beaveBoatV2 = myLevel.layers["fg"].objects["beaveBoatV2"]
	beaveBoatV3 = myLevel.layers["fg"].objects["beaveBoatV3"]
   

	land = {swamp1, swamp2, rapids1, rapids2, rapids3a, rapids3b, rapids3c, rapids3d, pb1, pb2 ,pb3, pb4, pb5, pb7, pb8, pb9, pb10, pb11, pb12, pb13, pb14, pb15, pb16, pb17, pb18, pb19, pb20, pb21, pb22, pb23, pb24, pb25, pb26, pb27, pb28, pb29, pb30, pb31, pb32, pb33, pb34, info, beave1, beave2, beave3, beave4, beave5, beave6, beaveBoatH2, beaveBoatH4, beaveBoatV1, beaveBoatV2, beaveBoatV3}
	enemyBeavers = {beave1, beave2, beave3, beave4, beave5, beave6, beaveBoatH2, beaveBoatH4, beaveBoatV1, beaveBoatV2, beaveBoatV3}
	--enemyBeavers = {beave4, beave5, beave6, beaveBoatH2, beaveBoatH4, beaveBoatV1, beaveBoatV2, beaveBoatV3}
   beaveBoatH2.vertical = false
   beaveBoatH4.vertical = false
   beaveBoatV1.vertical = true
   beaveBoatV2.vertical = true
   beaveBoatV3.vertical = true
   boatBeaves = {beaveBoatH2, beaveBoatH4, beaveBoatV1, beaveBoatV2, beaveBoatV3}
   for i=1, #boatBeaves do
      -- dirScalar, used in panBeavers() as a toggle
      -- Used to determine forwards direction (+1) or reverse direction(-1)
      boatBeaves[i].dirScalar = 1
      boatBeaves[i].xStart = boatBeaves[i].x
      boatBeaves[i].yStart = boatBeaves[i].y
   end
   player:play()
   rapids3a:play()
   rapids3b:play()
   rapids3c:play()
   rapids3d:play()
   rapids1:play()
   rapids2:play()
   swamp1:play()
   swamp2:play()
   -- End land objects
---------------------------------------------------------
--Initial values needed for Chris's implementation BELOW:
---------------------------------------------------------
	physics.addBody( swamp1, "static")
	physics.addBody( swamp2, "static")
	physics.addBody( rapids1,"static")
	physics.addBody( rapids2,"static")
	
	-- Kiosk info Loading 
   local fileLoc = system.pathForFile("Kiosk/level2W.txt")
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
--Initial values needed for Chris's implementation ABOVE:
---------------------------------------------------------
	
	-- Add variables to storyboard group
	
	for i=1, # background do
		group:insert(background[i])
	end
	for i=1, 8 do
		group:insert(land[i])
	end
	group:insert(player)
	for i=9, # land do
		group:insert(land[i])
	end
	group:insert(pipe)
	group:insert(myText)
--	group:insert(loc)
	group:insert(myLevel)
	
	-- End adding variables

end

-- Called immediately after scene has moved onscreen:
function sceneL2:enterScene( event )
	local group = self.view
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

	rapids1.preCollision = rapidsListener
	rapids1:addEventListener("preCollision", rapids1 )
	
	rapids2.preCollision = rapidsListener
	rapids2:addEventListener("preCollision", rapids2 )
	
	rapids3a.preCollision = rapidsListener
	rapids3a:addEventListener("preCollision", rapids3a )
	
	rapids3b.preCollision = rapidsListener
	rapids3b:addEventListener("preCollision", rapids3b )
	
	rapids3c.preCollision = rapidsListener
	rapids3c:addEventListener("preCollision", rapids3c )
	
	rapids3d.preCollision = rapidsListener
	rapids3d:addEventListener("preCollision", rapids3d )

	swamp1.preCollision = swampListener
	swamp1:addEventListener("preCollision", swamp1)
	
	swamp2.preCollision = swampListener
	swamp2:addEventListener("preCollision", swamp2)
	
   
	for i=1, # enemyBeavers do
      enemyBeavers.index = i
		enemyBeavers[i].enterFrame = hostileBeaver
		Runtime:addEventListener("enterFrame", enemyBeavers[i])
	end
	
   local file = io.open(path,"r")
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
   io.close(file)
	
	setTime()
end

-- Called when scene is about to move offscreen:
function sceneL2:exitScene( event )
	local group = self.view
	print("exiting the scene level2")
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
	rapids1:removeEventListener("preCollision", rapids1 )
	rapids2:removeEventListener("preCollision", rapids2 )
	rapids3a:removeEventListener("preCollision", rapids3a )
	rapids3b:removeEventListener("preCollision", rapids3b )
	rapids3c:removeEventListener("preCollision", rapids3c )
	rapids3d:removeEventListener("preCollision", rapids3d )
	swamp1:removeEventListener("preCollision", swamp1 )
	swamp2:removeEventListener("preCollision", swamp2 )  
	for i=1, # enemyBeavers do
		Runtime:removeEventListener("enterFrame", enemyBeavers[i])
	end
	audio.stop(1)
	physics.pause()
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function sceneL2:destroyScene( event )
	local group = self.view
	physics.stop()
	package.loaded[physics] = nil
	physics = nil
	
end


-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
sceneL2:addEventListener( "createScene", sceneL2 )

-- "enterScene" event is dispatched whenever scene transition has finished
sceneL2:addEventListener( "enterScene", sceneL2 )

-- "exitScene" event is dispatched whenever before next scene's transition begins
sceneL2:addEventListener( "exitScene", sceneL2 )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
sceneL2:addEventListener( "destroyScene", sceneL2 )

-----------------------------------------------------------------------------------------

return sceneL2