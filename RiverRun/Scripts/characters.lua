

module(..., package.seeall)
local imgSubFolder = ""
require ("sprite")

if (application.LevelDirectorSettings.imagesSubfolder ~= nil) then
    imgSubFolder = application.LevelDirectorSettings.imagesSubfolder
    imgSubFolder = imgSubFolder .. "/"
end
-- Not sure of the necessity of the above code but I used it to be safe
require("Scripts.maths")
---------------------------------------------------------
--RUNTIME functions for controlling the character BELOW:
---------------------------------------------------------
--[[ Attaches the features of the player character
     that do not change from character to character ]]
function attachStandardFeatures(player) 
   player.currentFrame = 1
   player.x = 161
   player.y = 426
   player.isPlayer = true
   player.isBullit = true
   player.isSleepingAllowed = false  
   player.angularDamping = 5
   player.timeLastInSwamp = 0
   player.timeLastInRapid = 0  
   --attaches the touch event listener for movement
   function player:touch(self,event)
      moveT(self,event,player)
   end
   --attaches the accelerometer event listener for movement
   function player:accelerometer(event)
      moveA(event,player)
   end
end
-- Special accelerometer event listener helper function for movement
function moveA(event,player)  
   if (event) then
     local force = 1.7*7
     local xHat, yHat = directional(event.xGravity, event.yGravity)
	  local mag = magnitude(xHat, yHat)
	  print(mag)
	  if(mag >=1) then
        player:applyForce(force*xHat,force*yHat*.7, player.x, player.y)
	  end
   end
end
-- Special touch event listener helper function for movement
function moveT(self,event,player)
   if (self) then
      local force = 1.7
      local xHat, yHat = directional((self.x - player.x),(self.y - player.y))
      player:applyForce(force*xHat,force*yHat*.7, player.x, player.y)
   end
end
---------------------------------------------------------
--RUNTIME functions for controlling the character ABOVE:
---------------------------------------------------------
-- This function defines the standard beaver character
function _G.beaverChar()   
   local beaverGIF_png = sprite.newSpriteSheet( imgSubFolder .. "beaverGIF.png", 100,98)
   local beaverGIF_png_Set = sprite.newSpriteSet(beaverGIF_png, 1,5)
   local beaver_shape = {-16,-9.5,-13,-16.5,14,-16.5,16,-9.5,16,6.5,3,17.5,-2,17.5,-16,7.5}
   for i=1, #beaver_shape do
      beaver_shape[i]=beaver_shape[i]*.8
   end
   local beaver = sprite.newSprite(beaverGIF_png_Set)
      beaver.xScale = .25
      beaver.yScale = .25
      beaver.physicsProperties = {density = 1, friction = 0
      , bounce = 0.00000000000001, shape = beaver_shape}
      beaver.name = "beaver"
      attachStandardFeatures(beaver)  
      return beaver
end