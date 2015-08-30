module(..., package.seeall)

local Ship = require "com.sixftview.components.ship"
local Dpad = require "com.sixftview.components.dpad"
local RockGroup = require "com.sixftview.components.rock_group"
local Bullets = require "com.sixftview.components.bullets"
local BNFire = require "com.sixftview.components.fire_button"
local ScoreBoard = require "com.sixftview.components.score_board"
local LivesCount = require "com.sixftview.components.lives_count"
local joystickClass = require "com.vendor.joystick"
local ShieldCount = require "com.sixftview.components.shield_count"
local EnemyGroup = require "com.sixftview.components.enemy_group"
local Background = require "com.sixftview.components.background"
local Indicator = require "com.sixftview.components.indicator"
local TouchDistory = require "com.sixftview.components.touch_distroy"
local Extras = require "com.sixftview.components.extras"
local WeponsButton = require "com.sixftview.components.wepons_button"

local group
local background
local ship
local rocks_group
local bullets
local enemy_bullets
local nextLevel
local score_board
local lives
local onShield
local createPlayer
local shield_count
local bn_pause
local onPause
local isPaused = false
local enemies
local cur_level
local extras
local extras_data
local txt_level

local touch_distroy

local dpad
local bn_fire
local bn_wepons

local newShiptimer
local enemyKilledTimer

local onEnemyKilled
local onSystemEvent
local settingsClosed
local showIndicator


function new()
	local Explosions = require "com.sixftview.components.explosions"
	
	local function startPhysics()
		physics.start()
	end

	local function pausePhysics()
		physics.pause()
	end

	local function reload()
		if app_data:getCurrentLevel() > cur_level or 
				app_data:getReload() == true then
	
			local function onTimeWait(event)
				if isPaused == true then
					local e = {name="touch", phase="began"}
					onPause(e)
				end
				
				Explosions:CleanUp()
				
				Explosions = nil
				
				if ship.x ~= nil then
					ship:killAll()
					display.remove(ship)
					ship = nil
				end
				
				enemies:killAll()
				
				touch_distroy:pause("stop")
				extras:pause("stop")
				bn_wepons:pause("stop")

				physics.stop()
				Particles.CleanUp()
				
				if rocks_group ~= nil then
					rocks_group:stopLocationCheck()
				end
				
				if app_data.goto_menu == false then
					app_data:setReload(false)
					director:changeScene("com.sixftview.game.game_load", "fade")
				else
					app_data:setReload(false)
					app_data.goto_menu = false
					director:changeScene("com.sixftview.levelmenu.level_menu", "fade")
				end
				
				display.remove(group)

				Runtime:removeEventListener( "system", onSystemEvent )
			end

			timer.performWithDelay(250, onTimeWait, 1)

		else
			if app_data.show_settings == true then
				local function onsettings_show(event)
					director:openPopUp("com.sixftview.settings.game_settings",
					 settingsClosed)
				end
				
				timer.performWithDelay(500, onsettings_show, 1)
			elseif app_data.show_audio == true then
				local function onauido_show(event)
					director:openPopUp("com.sixftview.settings.music_info",
					 settingsClosed)
				end
				
				timer.performWithDelay(500, onauido_show, 1)
			else
				local e = {name="touch", phase="began"}
				onPause(e)
			end
		end
	end
	
	

	local function onDied(self, event)
		
		Explosions:enemyShipExplostion("EnemyEmitter", ship.x, ship.y)
		
		if rocks_group ~= nil then
			lives:removeLife()
			if(lives:getCount() > -1)  then
				local function newShip(event)
					createPlayer()
					newShiptimer = nil
				end
				newShiptimer = timer.performWithDelay(2000, newShip, 1)
			else
				director:openPopUp("com.sixftview.components.nextlevel_menu", reload)
			end
		end
	end


	createPlayer = function()
		ship = Ship:new()
		ship.died = onDied
		ship:addEventListener("died", ship)
		ship:addEventListener("onShield", onShield)
		group:insert(ship)
	end

	local function addPoints(event)
		
		if event.x ~= nil then
			Explosions:rockExplosion("RockEmitter", 
									event.x, event.y)
			score_board:setScore(event.value)

			local xpos = app_data:randomNum(event.x - 50, event.x + 50)
			local ypos = app_data:randomNum(event.y - 100, event.y + 50)

			showIndicator(xpos, ypos, event.value)
		else
			local xpos
			local ypos

			if ship.x == nil then
				xpos = centerX
				ypos = centerY
			else
				xpos = ship.x
				ypos = ship.y
			end
			
			if event.shields ~= nil then 
				local shields = "shields: " .. event.shields .. "pts"


			 	xpos = xpos + 50
				ypos = ypos - 100 
		
				showIndicator(xpos, ypos, shields, nil, 3000)
			end
			
			if event.lives ~= nil then
				local lives = "lives: " .. event.lives .. "pts"
				xpos = xpos - 100
			 	ypos = ypos - 100

				showIndicator(xpos, ypos, lives, 500, 3000)
			end
			
			local function onPointsComplete(event)
				if app_data:getCurrentLevel() >= app_data.level_total then
					director:changeScene("com.sixftview.components.gameend_view", "fade")
				else
					director:openPopUp("com.sixftview.components.nextlevel_menu", reload)
				end
				
			end

			score_board:setScore(event.value)
			timer.performWithDelay(4000, onPointsComplete, 1)
		end
	end
	
	local function onRockExplosion(event)
		Explosions:rockExplosion("RockEmitter", 
								event.x, event.y)
		print("rock explosion")
	end
	
	local function createRocks()
		rocks_group = RockGroup:new()
		rocks_group.nextLevel = nextLevel
		rocks_group:addEventListener("nextLevel", rocks_group)
		rocks_group:addEventListener("addPoints", addPoints)
		
		rocks_group:addEventListener("rockExplosion", onRockExplosion)
		group:insert(rocks_group)
	end

	local function nextLevelFunction(event)
		rocks_group:stopLocationCheck()
		rocks_group:removeSelf()
		rocks_group = nil

		local lives_num = lives:getCount()
		local shield_num = shield_count:getCount()
		
		if lives_num > 0 then
			local some_points = (400 * lives_num) + (500 * shield_num)
			local e = {name="addPoints", value=some_points, lives=400 * lives_num, shields=500 * shield_num}
			addPoints(e)
		end
	end
	--create bullets
	local function createBullets()
		bullets = Bullets:new()
	end
	--fire bullet
	local function onFire(event)
		if ship.x ~= nil and isPaused == false then
			bullets:shootMissle(ship)
		end
	end

	local function onDPad(dpad, event)
		if ship.x ~= nil and isPaused == false then
			ship:thrustAndRotate(event.joyTable)
		end
	end
	
	local function positionControls()
		local controls_setup = app_data:getControlsSetup()
		local dpadX = 10
		local dpadY = totalHeight - (dpad.height + 10)
		
		local fireX = totalWidth - (bn_fire.width + 10)
		local fireY = totalHeight - (bn_fire.height + 10 )
		local fireRotation = 0
		
		local weponsX = fireX + (bn_wepons.width * 0.65)
		local weponsY = fireY - bn_wepons.height
		
		
		if controls_setup ~= "right handed" then
			dpadX = totalWidth - (dpad.width + 10)	
			fireX = bn_fire.width - (bn_fire.width * 0.1)
			fireY = totalHeight - (bn_fire.height * 0.25)
			fireRotation = 200
			
			weponsX = fireX - (bn_wepons.width * 0.35)
			weponsY = fireY - (bn_wepons.height * 2)
		end
		
		
		transition.to(dpad, {time=500, x=dpadX,y=dpadY, transition=easing.outExpo})
		transition.to(bn_fire, {time=500, x=fireX, y=fireY,
			rotation=fireRotation, transition=easing.outExpo})
		transition.to(bn_wepons, {time=500, x=weponsX, y=weponsY, transition=easing.outExpo})
			
	end
	
	local function onNuke(event)
		local xy = {X=ship.x, Y=ship.y}
		
		if ship == nil or ship.x == nil then
			xy = {X=halfWidth, Y=halfHeight}
		end

		Explosions:nukeExplosion("NukeEmitter", xy.X, xy.Y)

		timer.performWithDelay(500, function() 	
				rocks_group:radiusDestory(xy, (halfWidth * 0.75)) 
			end, 1)

		showIndicator(xy.X, xy.Y - 100, "POWER BLAST!")
	
	end

	local function createControls()
		
		dpad = Dpad:new()
		dpad.onDPad = onDPad
		dpad:addEventListener("onDPad", dpad)

		bn_fire = BNFire:new()
		bn_fire:addEventListener("fireBullet", onFire)
		bn_fire:addEventListener("shieldsUp", onShield)
		
		bn_wepons = WeponsButton:new()
		bn_wepons:addEventListener("nuke", onNuke)
		
		positionControls()
		
		group:insert(dpad)
		group:insert(bn_fire)
		group:insert(bn_wepons)
	end
	
	settingsClosed = function()
		app_data.show_settings = false
		app_data.show_audio = false
		if app_data:getResetClicked() == true then
			app_data:setReload(true)
			app_data.goto_menu = true
			app_data:setReset(false)
			reload()
		else
			local e = {name="touch", phase="began"}
			onPause(e)
			positionControls()
		end
	end
	
	local function onPlayerUP(self, event)
		lives:playerUp(event.value)
		
		showIndicator(ship.x, ship.y - 50, "1UP")
	end
	
	local function saveLevelScore(event)
		app_data:setLevelData(event.value)
		
		if score_board ~= nil then
			score_board:setTotalScore(tostring(app_data:getTotalScore()))
		end
	end
	
	local function createScoreBoard()
		score_board = ScoreBoard:new()
		score_board.playerUp = onPlayerUP
		score_board:addEventListener("playerUp", score_board)
		score_board:addEventListener("saveLevelScore", saveLevelScore)
		
		group:insert(score_board)
		score_board.y = 5
	end

	local function createLivesDisplay()
		lives = LivesCount:new()
		lives.x = totalWidth - 110
		lives.y = 25
		group:insert(lives)
		
		txt_level = display.newText("Level: " .. cur_level, 
									0, 0, app_data.font_Robofan, 40)
		txt_level:setTextColor(121, 5, 130)
		txt_level.x = halfWidth
		txt_level.y = 50
		group:insert(txt_level)
		
	end
	
	showIndicator = function(xpos, ypos, value, show_delay, delay)		
		local indicator = Indicator.new(value)
		group:insert(indicator)
		indicator.x, indicator.y = xpos, ypos
		indicator:show(indicator.x, indicator.y, show_delay, delay)
	end
	
	onEnemyKilled = function(event)
		print("ENEMY KILLED")
		Explosions:enemyShipExplostion("EnemyEmitter", event.x, event.y)
		score_board:setScore( event.value )
		showIndicator(event.x, event.y, tostring(event.value))
	end
	
	local function createShieldCount()
		shield_count = ShieldCount:new()
		shield_count.x = totalWidth - 170
		shield_count.y = 20
		group:insert(shield_count)
	end
	
	local function createPause()
		bn_pause = display.newImage("images/bn_pause.png")
		bn_pause.x = totalWidth - 38
		bn_pause.y = 45
		bn_pause.alpha = 0.5
		group:insert(bn_pause)
		
		bn_pause:addEventListener("touch", onPause)
	end
	
	local function onContinue()
		if isPaused == true then
			local e = {name="touch", phase="began"}
			onPause(e)
		end
	end

	onPause = function(event)
		if event.phase == "began" then
			if isPaused == false then
				isPaused = true
				pausePhysics()
				
				if newShiptimer ~= nil then
					timer.pause(newShiptimer)
				end
				director:openPopUp("com.sixftview.components.paused_menu", reload)
			else
				isPaused = false
				startPhysics()
				
				if newShiptimer ~= nil then
					timer.resume(newShiptimer)
				end
			end
			
			if ship.x ~= nil then
				ship:pause(isPaused)
			end
			
			rocks_group:pause(isPaused)
			enemies:pause(isPaused)
			touch_distroy:pause(isPaused)
			extras:pause(isPaused)
			bn_wepons:pause(isPaused)
		end
	end

	
	local function createEnemyGroup()
		local enemy_data = app_data:getEnemyData(app_data:getCurrentLevel())
		enemies = EnemyGroup:new(enemy_data)
		enemies:addEventListener("enemyKilled", onEnemyKilled)
		group:insert(enemies)
	end
	
	onSystemEvent = function(event)
		if( event.type == "applicationExit" ) then  
			
		end
	end
	
	local function touchDistroyEvent(event)
		if event.phase == "began" or event.phase == "move" then
			if rocks_group ~= nil then
				rocks_group:radiusDestory({X=event.x, Y=event.y}, 100)
			end
		end
	end
	
	local function onTouchDestory(event)		
		if event.value == true then
			group:addEventListener("touch", touchDistroyEvent)
		elseif event.value == false then
			group:removeEventListener("touch", touchDistroyEvent)
		end
	end
	
	local function createDistory()
		touch_distroy = TouchDistory:new(extras_data.touch_destroy)
		touch_distroy.x = bn_pause.x - 30
		touch_distroy.y = bn_pause.y + 60
		
		touch_distroy:addEventListener("touchDestroy", onTouchDestory)
	end
	
	local function onExtras(event)
		local position = {x=event.x, y=event.y, value="Player 1Up"}
		
		if event.value == "shield" then
			shield_count:addCount(1)	
			position.value = "1Up Shield"
		elseif event.value == "man" then
			lives:playerUp(1)
		end
		
		showIndicator(position.x, position.y, position.value)
	end
	
	local function createExtras()
		extras = Extras:new(extras_data.shields, extras_data.players)
		extras:addEventListener("extraCollected", onExtras)
	end
	
	
	local function init()
		cur_level = app_data:getCurrentLevel()
		nextLevel = nextLevelFunction
		
		local level = {level=cur_level, score=0}
		local e = {name="saveLevelScore", value=level}
		
		app_data:setShieldCountByLevel(cur_level)
		
		extras_data = app_data:getExtras(tostring(cur_level))
		
		physics.start()
		physics.setGravity(0,0)

		background = Background:new()
		background.x = centerX
		background.y = centerY

		group:insert(background)

		createPlayer()
		createRocks()
		createControls()
		createBullets()
		createScoreBoard()
		createLivesDisplay()
		createEnemyGroup()
		createShieldCount()
		createPause()
		createDistory()
		createExtras()
		
		Explosions:explosionsInit()
		
		Particles.StartAutoUpdate()
		
		group:insert(Explosions:getRockEmitter())
		group:insert(Explosions:getEnemyEmitter())
		group:insert(Explosions:getNukeEmitter())
		
		Runtime:addEventListener( "system", onSystemEvent ) 
		
		sound_track:play(app_data:randomNum(1, sound_track:track_count()))
		
		app_data:setLevelData(e.value)
	end
	
	onShield = function(event)
		if event.name == "shieldsUp" and ship.x ~= nil then
			ship:shieldsUp()
		else
			app_data:setShieldCount(-1)
			shield_count:removeFromCount()
		end
	end
	
	group = display.newGroup()
	init()

	return group
end
