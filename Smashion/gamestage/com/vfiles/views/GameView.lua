scene = require( "composer" ).newScene()
gameOn = true

require "com.vfiles.controllers.OnTouchController"
require "com.vfiles.controllers.LevelController"
require "com.vfiles.controllers.WeaponController"
require "com.vfiles.controllers.EnemyController"
require "com.vfiles.objects.huds.Scoreboard"
require "com.vfiles.objects.huds.Launchpad"
require "com.vfiles.objects.backgrounds.GameBackground"

-- Spritesheet of gameview UI (General) 
local stageUIsheet
local stageUIsheetPath = "assets/images/ui/gameview/gameview-ui.png"
local stageUIsheetInfo = require("com.vfiles.sprites.ui.gameview-ui")

-- Load audio file from here
local audioBgm = audio.loadSound( "assets/audios/game-bgm.wav" )
local audioSwipe = audio.loadSound( "assets/audios/swipe.wav" )
local audioHit1 = audio.loadSound( "assets/audios/model-hit-1.wav" )
local audioHit2 = audio.loadSound( "assets/audios/model-hit-2.wav" )
local audioHit3 = audio.loadSound( "assets/audios/model-hit-3.wav" )
local audioHit4 = audio.loadSound( "assets/audios/model-hit-4.wav" )
local audioHit5 = audio.loadSound( "assets/audios/model-hit-5.wav" )
local audioHit6 = audio.loadSound( "assets/audios/model-hit-6.wav" )
local audioHitCombo = audio.loadSound( "assets/audios/model-hit-combo.wav" )
local randomAudioHit = {audioHit1, audioHit2, audioHit3, audioHit4, audioHit5, audioHit6}


local perspectiveStageConfig = {
	dimension = 300,
	height = 225
}

local minVelocity = 20
local maxVelocity = 35
local enemiesTable, weaponsTable = {}, {}

local frameCount = 1

local sceneGroup, assetGroup, levelController, weaponController, enemyController, onTouchController, gameTimer, scoreBoard, launchPad, gameBackground, pauseBtn
local city, gameLevel

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
	if event.type == "faceUp" or event.type == "faceDown" then return false end	
  local isPortrait = (string.find(event.type, "portrait") == 1)
	assetGroup.x = display.contentWidth/2

	if(isPortrait) then
		assetGroup.y = display.contentHeight/2 + 60
	else
		assetGroup.y = display.contentHeight/2 + 60
	end
	pauseBtn.y = display.contentHeight - 60

	-- call rotate function of other view scenes
	gameBackground:rotate(isPortrait)
	weaponController:rotate(isPortrait)
	launchPad:rotate(isPortrait)
	scoreBoard:rotate(isPortrait)
end

local function pauseButtonEvent( event )
	if gameOn == true then gamePause() else gameResume() end
	return true
end

local function scoreChangeEventListner(e)
	levelController:update(e.data)
	scoreBoard:updateScore(levelController.score, levelController.lives)
end

local function powerMeterChangeEventListner(e)
	scoreBoard:updatePowerMeter(e.data)
end

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function animate(e)	
	if gameOn ~= true then
		return false
	end

	-- Update weapons
	for i=1, #weaponsTable do
		if(weaponsTable[i] ~= nil and frameCount%2 == 0) then
			weaponsTable[i]:move()
		end
	end
	frameCount = frameCount + 1

	-- Update enemies
	for i=1, #enemiesTable do
		if(enemiesTable[i] ~= nil) then
			enemiesTable[i]:checkCollision(weaponsTable)			
		end
		if(enemiesTable[i] ~= nil) then
			enemiesTable[i]:move()
		end
	end

	-- Swap z depth index
	-- lesser # is going front
	-- max # is 225
	idx = 225
	for i=1, assetGroup.numChildren do		
		local z = assetGroup[i].z
		if z ~= nil then
			if z < idx then
				assetGroup[i]:toBack()
				idx = z
			end
		end		
	end

	enemyController:spawnEnemy()
	return true
end

--------------------------------------------------
-- Public workers
--------------------------------------------------
function bgm(isOn)
	audio.setVolume(1)
	audio.stop(1)
	if isOn then
		audio.play(audioBgm, 	{
		  channel = 1,
		  loops = -1,
		  fadein = 5000
		})
	end
end

function sfx(nm)
	if gameData:get("sfx") then
		if nm == "swipe" then
			audio.play(audioSwipe)
		elseif nm == "hit" then
			audio.play(randomAudioHit[math.random(1,6)])
		elseif nm == "hitCombo" then
			audio.play(audioHitCombo)
		end
	end
end

function convertToPerspectivePos(n)
	return (perspectiveStageConfig.dimension - n )/perspectiveStageConfig.height * 1.0125
end

function shuffle(t)
  local n = #t
  while n > 2 do
    local k = math.random(n)
    t[n], t[k] = t[k], t[n]
    n = n - 1
  end
  return t    
end

function gameStart()
	local timeLimit = levelController.timeLimit
	gameOn = true
	bgm(gameData:get("bgm"))

	function timeCountEvent(e)
		scoreBoard:updateTime(timeLimit - e.count)
		if e.count == timeLimit then
			gameOver(1)
		end
	end
	gameTimer = timer.performWithDelay( 1000, timeCountEvent, timeLimit)
end

function gameOver(code)
	--[[
		code: 1 - Time over
		code: 2 - Out of ammo
	]]
	if gameOn then
		gameOn = false
		bgm(gameOn)
		timer.pause(gameTimer)
		Runtime:removeEventListener( "enterFrame", animate )
		enemyController:disable()
		weaponController:disable()

		local result = levelController:getResult()

		function showResult()
			local options =
			{
		    effect = "fade",
		    time = 250,
		    isModal = true,
		    params = {
		    	code = code,
		    	city = city,
		    	gameLevel = gameLevel,
		    	result = result
				}
			}
			composer.showOverlay( "com.vfiles.views.modals." .. (result.achievement > 0 and "GameClearedModalView" or "GameFailedModalView") , options )
		end	
		transition.to( sceneGroup, { time=350, delay=0, alpha=.5, onComplete=showResult } )		
	end

end

function gamePause()
	gameOn = false
	timer.pause(gameTimer)
	enemyController:disable()
	weaponController:disable()

	local options =
	{
    effect = "fade",
    time = 250,
    isModal = true,
    params = {
    	city = city,
    	gameLevel = gameLevel,
		}
	}
	composer.showOverlay( "com.vfiles.views.modals.GamePausedModalView", options )
	audio.setVolume(.3)
end

function gameResume()
	gameOn = true
	timer.resume(gameTimer)
	enemyController:enable()
	weaponController:enable()	
	audio.setVolume(1)
end

function checkAmmoState()
	-- This function can be called from Weapon class or Enemy class
	if weaponController:getAmmoTotal() == 0 then
		gameOver(2)
	end
end

--------------------------------------------------
-- Constructor
--------------------------------------------------
local function build(self)
	sceneGroup = self.view -- mainstage
	assetGroup = display.newGroup() -- asset group is display stage for weapon and enemy objects
	assetGroup.x = display.contentWidth/2
	assetGroup.y = display.contentHeight/2 + 60

	-- Asset group background for debug (Rectangle)
	-- local temp = display.newRect( 0, 0, 320, 320 )
	-- temp:setFillColor( 0,1,1,.3 )
	-- assetGroup:insert(temp)
	

	-------------------------
	-- Init Level controller
	-------------------------
	levelController = LevelController:new()
	levelController:set(city, gameLevel)
	-- Create stageUIsheet
	stageUIsheet = graphics.newImageSheet( stageUIsheetPath, stageUIsheetInfo:getSheet())

	-- Add Background
	gameBackground = GameBackground:new({parent = sceneGroup, city = city})

	-- Add Scoreboard
	scoreBoard = Scoreboard:new({parent = sceneGroup, spriteSheet = stageUIsheet, spriteSheetInfo = stageUIsheetInfo, timeLimit = levelController.timeLimit, achievements = levelController.achievements})

	-- Add Launchpad
	launchPad = Launchpad:new({parent = sceneGroup, prop = levelController.weapons, spriteSheet = stageUIsheet, spriteSheetInfo = stageUIsheetInfo})

	-- Add assetGroup
	sceneGroup:insert(assetGroup)

	-- Enemy config
	local enemyConfig = {
		assetStage = assetGroup,
		assetTable = enemiesTable,
		prop = levelController.enemies
	}

	-- Weapon config
	local weaponConfig = {
		mainStage = sceneGroup,
		assetStage = assetGroup,
		assetTable = weaponsTable,
		prop = levelController.weapons,
		spriteSheet = stageUIsheet,
		spriteSheetInfo = stageUIsheetInfo
	}

	-- Create controllers
	enemyController = EnemyController:new(enemyConfig)
	weaponController = WeaponController:new(weaponConfig)
	onTouchController = OnTouchController:new()


	-- Create Pause button
	pauseBtn = widget.newButton
	{
	    width = 50,
	    height = 50,
	    sheet = graphics.newImageSheet( "assets/images/ui/gameview/btn-pause.png", {width=48, height=48, numFrames=2, sheetContentWidth=48, sheetContentHeight=96}),
	    defaultFrame = 1,
	    overFrame = 2,	    
	    onRelease = pauseButtonEvent
	}
	pauseBtn.anchorX, pauseBtn.anchorY, pauseBtn.x, pauseBtn.y = 0, 0, 10, display.contentHeight - 60
	sceneGroup:insert(pauseBtn)

end
-- build end



--------------------------------------------------
-- Scene listeners
--------------------------------------------------
local function onTouchEventListener(e)
	if gameOn ~= true then
		return false
	end

	--Limit the e.angle
	if e.angle < 60 then
		e.angle = 60
	elseif e.angle > 120 then
		e.angle = 120
	end

	local wh = display.contentHeight
	local topDeg = e.angle * math.pi/180
	local sideDeg = (60 + (30 * (wh - (wh + -e.distance)) /wh)) * math.pi/180  --Min deg is 60
	local velocity = minVelocity * e.speed

	if velocity < minVelocity then
		velocity = minVelocity
		elseif velocity > maxVelocity then
		velocity = maxVelocity
	end
	weaponController:fireWeapon(topDeg, sideDeg, velocity)
end


-- scene listeners
function scene:create( event )
	city = event.params.city
	gameLevel = event.params.gameLevel
	build(self)
	Runtime:addEventListener("enterFrame", animate)
	Runtime:addEventListener("orientation", onOrientationChange)
	scene:addEventListener("onTouchEvent", onTouchEventListener)
	scene:addEventListener("scoreEvent", scoreChangeEventListner)
	scene:addEventListener("powerMeterEvent", powerMeterChangeEventListner)	
	print("Create gameview - city " .. city)
	print("Create gameview - gameLevel " .. gameLevel)
end

function scene:show( event )		
		if event.phase == "did" then
			gameStart()
			local prevScene = composer.getSceneName( "previous" )
			if prevScene ~= nil then
	  		print('This is the prevScene: '); print(prevScene);
	  		composer.removeScene( prevScene )
	  	end
	end
end

function scene:hide( event )
end

function scene:destroy( event )
	print("Destroy gameview")

	-- stop bgm
	bgm(false)
	audio.setVolume(1)
	audio.dispose(audioBgm)
	audio.dispose(audioSwipe)
	audio.dispose(audioHit1)
	audio.dispose(audioHit2)
	audio.dispose(audioHit3)
	audio.dispose(audioHit4)
	audio.dispose(audioHit5)
	audio.dispose(audioHit6)
	audio.dispose(audioHitCombo)

	audioBgm = nil
	audioSwipe = nil
	audioHit1 = nil
	audioHit2 = nil
	audioHit3 = nil
	audioHit4 = nil
	audioHit5 = nil
	audioHit6 = nil
	audioHitCombo = nil

	-- Destroy all controllers
	levelController:destroy()
	weaponController:destroy()
	enemyController:destroy()
	onTouchController:destroy()
	scoreBoard:destroy()

	-- Remove all listeners
	scene:removeEventListener("create", scene)
	scene:removeEventListener("show", scene)
	scene:removeEventListener("hide", scene)
	scene:removeEventListener("destroy", scene)

	Runtime:removeEventListener( "enterFrame", animate )
	Runtime:removeEventListener("orientation", onOrientationChange)
	scene:removeEventListener("onTouchEvent", onTouchEventListener)
	scene:removeEventListener("scoreEvent", scoreChangeEventListner)
	scene:removeEventListener("powerMeterEvent", powerMeterChangeEventListner)

	-- Empty sprite from memory
	stageUIsheet = nil
	self = nil

end

-- scene events
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene