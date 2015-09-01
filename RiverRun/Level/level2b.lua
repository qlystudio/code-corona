-----------------------------------------------------------------------------------------
--
-- level2b.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- hide the status bar
local widget = require "widget"
local storyboard = require( "storyboard" )
local sceneL2 = storyboard.newScene()
local backgroundMusic = audio.loadStream("Audio/DragonForce.mp3")
local speed, player, background, land, TimerValue, startTime, myText, physics, finished, eelTimer
local river1, river2, redLine
local eels = {}
local eelsE = {}
local crush1, crush2, whirl1, whirl2, whirl3, whirl4, whirl5, eel1, eel2, eel3, eel4, eel5, eel6, eel7, eel8, turbineL, turbineR
local eelE1, eelE2, eelE3, eelE4, eelE5, eelE6, eelE7, eelE8
local objectsWithLifeSpan={}
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
require ("Scripts.clickLogger")
require("config")
soundFX = require("Scripts.soundFX")

local boost = speed
function setSpeed()
   force = 12
   halfH = display.contentHeight/2
   dx, dy = player:getLinearVelocity()
   local lastInSwamp = os.time() - player.timeLastInSwamp
   local lastInRapid = os.clock() - player.timeLastInRapid
   --print("Time last in swamp : "..lastInSwamp)
   --print("Time last in rapids: "..lastInRapid)
   
   if player.y<halfH and player.y>0 then
      scale = 1-player.y/halfH
      if lastInSwamp < 1 and lastInRapid >0 then
      
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

function spinTurbine()
   turbineL.rotation = turbineL.rotation-1
   turbineR.rotation = turbineR.rotation+1
end

-- local loc = display.newText("X,Y: 0 , 0",120,90,native.systemFont,14)
-- loc:setTextColor(0,0,0)
local myText = display.newText("Time: 0",20,40,native.systemFont,36)
myText:setTextColor(0,255,0)

local startTime = getTime()
local timeSpent = startTime
eelTimer = 0

function updateTimer()
   timeSpent = os.time()-startTime
   myText.text = "Time: "..timeSpent
   if(objectsWithLifeSpan) then   
      for i=1,#objectsWithLifeSpan do
         if objectsWithLifeSpan[i] and os.time()-objectsWithLifeSpan[i].birthTime>=3 then
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
   spinTurbine()
   swapEels()
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
         if (player.y <= redLine.y) then
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
      print("Level2b")
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

function whirlPoolListener(self,event)
   if (event.other and event.contact) then
      size = self.radius*2
      event.contact.isEnabled=false
      x = event.other.x
      y = event.other.y
      dx = self.x - x
      dy = self.y - y
      mag = math.sqrt(dx*dx + dy*dy)
      dx = dx/mag
      dy = dy/mag
      force = 15
      if mag>15 then
         scale = 1-(size-mag)/size
         event.other:applyForce(dx*force*scale, dy*force*scale, x, y)
      else
         scale = .91
         ddx, ddy = event.other:getLinearVelocity()
         event.other:setLinearVelocity(ddx*scale, ddy*scale)
      end
      event.other.angularVelocity = 30
   end
end

function crushListener(self, event)
	if(self.name == "crushL") then  -- logic for Left crusher
		if self.x > self.xInitial - self.height/3 then
			self.x = self.x - 1
		else
			self.x = self.xInitial
			if(player.y > self.y-self.width/4 and player.y < self.y+self.width/4) then -- player is crushed
				timer.performWithDelay(100, crushed)
			end
		end
	else -- logic for Right crusher
		if self.x < self.xInitial + self.height/3 then
			self.x = self.x + 1
		else
			self.x = self.xInitial
		end
	end
end

function crushed()
	if(not(finished)) then
		print("Lose")
	end
	finished=true
	recordResult("Lost")
	storyboard.gotoScene( "Level.loss", "fade", 500 )
end

function eelMoveListener(self, event)
	if(self.name == "eel8" or self.name == "eel6" or self.name == "eelE8" or self.name == "eelE6") then
		if(self.x < eel7.xInitial) then
			self.x = self.x + 2
		else
			self.x = self.xInitial
		end	
	else
		if(self.x > eel6.xInitial) then
			self.x = self.x - 2
		else
			self.x = self.xInitial
		end	
	end
end


function swapEels()
	if eelTimer < 2 then
		eelTimer = eelTimer + (1.0/30.0)
	else
		eelTimer = 0
		if(eel1.isVisible) then
			for i=1, # eels do
				eels[i].isVisible = false
				eelsE[i].isVisible = true
			end
		else
			for i=1, # eels do
				eels[i].isVisible = true
				eelsE[i].isVisible = false
			end
		end
	end	
end

function stunListener(self, event)
	if event.other and event.contact then
		if (self.isVisible) then
			eelPreCollision(self, event)
		end
	end
end

function eelPreCollision(self, event)
   if (event.contact and event.other and event.other.isPlayer) then
      local dx = event.other.x-self.x
      local dy = event.other.y-self.y
      local mag = math.sqrt(dx*dx+dy*dy)
      local force = 4
      event.other:applyLinearImpulse(dx/mag*force, dy/mag*force, event.other.x,event.other.y)
      event.other.timeLastInSwamp=os.time()
   end
end

function sceneL2:createScene( event )
	storyboard.removeAll()
	group = self.view
	physics = require("physics")
	physics.setVelocityIterations(16)
	physics.setPositionIterations(16)
	print("Create level2b")
	
	local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=1000 }  )  -- play the background music on channel 1, loop infinitely, and fadein over 5 seconds 
	physics.start(true); physics.pause()

	local levelDirector =nil
	speed = 1.5
	kioskIndex = 1
	local myLevel = {}
	mode = application.TiltTapSetting.tiltTapSetting
	
	enemyBeavers = {}

	levelDirector = require ("Level.level2bBuild")
	
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

	whirl1 = myLevel.layers["fg"].objects["whirl1"]	
	whirl1.radius = 80
	whirl2 = myLevel.layers["fg"].objects["whirl2"]
	whirl2.radius = 80
	whirl3 = myLevel.layers["fg"].objects["whirl3"]	
	whirl3.radius = 80
	whirl4 = myLevel.layers["fg"].objects["whirl4"]	
	whirl4.radius = 170
	whirl5 = myLevel.layers["fg"].objects["whirl5"]
	whirl5.radius = 170
	turbineL = myLevel.layers["fg"].objects["turbineL"]
	turbineR = myLevel.layers["fg"].objects["turbineR"]
	eel1 = myLevel.layers["fg"].objects["eel1"]
	eel2 = myLevel.layers["fg"].objects["eel2"]
	eel3 = myLevel.layers["fg"].objects["eel3"]
	eel4 = myLevel.layers["fg"].objects["eel4"]
	eel5 = myLevel.layers["fg"].objects["eel5"]
	eel6 = myLevel.layers["fg"].objects["eel6"]
	eel7 = myLevel.layers["fg"].objects["eel7"]
	eel8 = myLevel.layers["fg"].objects["eel8"]
	eelE1 = myLevel.layers["fg"].objects["eelE1"]
	eelE2 = myLevel.layers["fg"].objects["eelE2"]
	eelE3 = myLevel.layers["fg"].objects["eelE3"]
	eelE4 = myLevel.layers["fg"].objects["eelE4"]
	eelE5 = myLevel.layers["fg"].objects["eelE5"]
	eelE6 = myLevel.layers["fg"].objects["eelE6"]
	eelE7 = myLevel.layers["fg"].objects["eelE7"]
	eelE8 = myLevel.layers["fg"].objects["eelE8"]
	pipe1 = myLevel.layers["fg"].objects["pipe1"]
	pipe2 = myLevel.layers["fg"].objects["pipe2"]
	pipe3 = myLevel.layers["fg"].objects["pipe3"]
	pipe4 = myLevel.layers["fg"].objects["pipe4"]
	pipe5 = myLevel.layers["fg"].objects["pipe5"]
	pipe6 = myLevel.layers["fg"].objects["pipe6"]
	crushL = myLevel.layers["fg"].objects["crushL"]
	crushR = myLevel.layers["fg"].objects["crushR"]
	pb1 = myLevel.layers["fg"].objects["pb15L"]
	pb2 = myLevel.layers["fg"].objects["pb16L"]
	pb3 = myLevel.layers["fg"].objects["pb17L"]
	pb4 = myLevel.layers["fg"].objects["pb13R"]
	pb5 = myLevel.layers["fg"].objects["pb14R"]
	pb6 = myLevel.layers["fg"].objects["pb16R"]
	redLine = myLevel.layers["fg"].objects["redLine"]
	finish = myLevel.layers["fg"].objects["finish"]
	flag1 = myLevel.layers["fg"].objects["flag1"]
	flag2 = myLevel.layers["fg"].objects["flag2"]
   

	land = {whirl1, whirl2, whirl3, whirl4, whirl5, finish, turbineL, turbineR, eel1, eel2, eel3, eel4, eel5, eel6, eel7, eel8, eelE1, eelE2, eelE3, eelE4, eelE5, eelE6, eelE7, eelE8, crushL, crushR, pb1, pb2 ,pb3, pb4, pb5, pb6, pipe1, pipe2, pipe3, pipe4, pipe5, pipe6, redLine, flag1, flag2}
	eels = {eel1, eel2, eel3, eel4, eel5, eel6, eel7, eel8}
	eelsE = {eelE1, eelE2, eelE3, eelE4, eelE5, eelE6, eelE7, eelE8}
	whirl1:play()
	whirl2:play()
	whirl3:play()
	whirl4:play()
	whirl5:play()
	eel1:play()
	eel2:play()
	eel3:play()
	eel4:play()
	eel5:play()
	eel6:play()
	eel7:play()
	eel8:play()
	eelE1:play()
	eelE2:play()
	eelE3:play()
	eelE4:play()
	eelE5:play()
	eelE6:play()
	eelE7:play()
	eelE8:play()
	player:play()
   -- End land objects
---------------------------------------------------------
--Initial values needed for Chris's implementation BELOW:
---------------------------------------------------------
	physics.setVelocityIterations(16)
	physics.setPositionIterations(16)
---------------------------------------------------------
--Initial values needed for Chris's implementation ABOVE:
---------------------------------------------------------
	
	-- Kiosk info Loading 
   local fileLoc = system.pathForFile("Kiosk/level2bW.txt")
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
	
	-- Add variables to storyboard group
	
	for i=1, # background do
		group:insert(background[i])
	end
	for i=1, 6 do
		group:insert(land[i])
	end
	group:insert(player)
	for i=7, # land do
		group:insert(land[i])
	end
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
	Runtime:addEventListener("touch", logClicks2)
   
	Runtime:addEventListener("enterFrame", update)
	
	Runtime:addEventListener("enterFrame", winLossListener)
	
	crushL.enterFrame = crushListener
	Runtime:addEventListener("enterFrame", crushL)
	
	crushR.enterFrame = crushListener
	Runtime:addEventListener("enterFrame", crushR)
	
	eel6.enterFrame = eelMoveListener
	Runtime:addEventListener("enterFrame", eel6)
	
	eel7.enterFrame = eelMoveListener
	Runtime:addEventListener("enterFrame", eel7)
	
	eel8.enterFrame = eelMoveListener
	Runtime:addEventListener("enterFrame", eel8)
	
	eelE6.enterFrame = eelMoveListener
	Runtime:addEventListener("enterFrame", eelE6)
	
	eelE7.enterFrame = eelMoveListener
	Runtime:addEventListener("enterFrame", eelE7)
	
	eelE8.enterFrame = eelMoveListener
	Runtime:addEventListener("enterFrame", eelE8)
	
	whirl1.preCollision = whirlPoolListener
	whirl2.preCollision = whirlPoolListener
	whirl3.preCollision = whirlPoolListener
	whirl4.preCollision = whirlPoolListener
	whirl5.preCollision = whirlPoolListener
	whirl1:addEventListener("preCollision",whirl1)
	whirl2:addEventListener("preCollision",whirl2)
	whirl3:addEventListener("preCollision",whirl3)
	whirl4:addEventListener("preCollision",whirl4)
	whirl5:addEventListener("preCollision",whirl5)
	
	eelE1.preCollision = stunListener
	eelE2.preCollision = stunListener
	eelE3.preCollision = stunListener
	eelE4.preCollision = stunListener
	eelE5.preCollision = stunListener
	eelE6.preCollision = stunListener
	eelE7.preCollision = stunListener
	eelE8.preCollision = stunListener
	eelE1:addEventListener("preCollision",eelE1)
	eelE2:addEventListener("preCollision",eelE2)
	eelE3:addEventListener("preCollision",eelE3)
	eelE4:addEventListener("preCollision",eelE4)
	eelE5:addEventListener("preCollision",eelE5)
	eelE6:addEventListener("preCollision",eelE6)
	eelE7:addEventListener("preCollision",eelE7)
	eelE8:addEventListener("preCollision",eelE8)     

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
	Runtime:removeEventListener("enterFrame", crushL)
	Runtime:removeEventListener("enterFrame", crushR)
	Runtime:removeEventListener("enterFrame", eel6)
	Runtime:removeEventListener("enterFrame", eel7)
	Runtime:removeEventListener("enterFrame", eel8)
	Runtime:removeEventListener("enterFrame", eelE6)
	Runtime:removeEventListener("enterFrame", eelE7)
	Runtime:removeEventListener("enterFrame", eelE8)
	Runtime:removeEventListener("enterFrame", winLossListener)
	whirl1:removeEventListener("preCollision",whirl1)
	whirl2:removeEventListener("preCollision",whirl2)
	whirl3:removeEventListener("preCollision",whirl3)
	whirl4:removeEventListener("preCollision",whirl4)
	whirl5:removeEventListener("preCollision",whirl5)
	eelE1:removeEventListener("preCollision",eelE1)
	eelE2:removeEventListener("preCollision",eelE2)
	eelE3:removeEventListener("preCollision",eelE3)
	eelE4:removeEventListener("preCollision",eelE4)
	eelE5:removeEventListener("preCollision",eelE5)
	eelE6:removeEventListener("preCollision",eelE6)
	eelE7:removeEventListener("preCollision",eelE7)
	eelE8:removeEventListener("preCollision",eelE8)  
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