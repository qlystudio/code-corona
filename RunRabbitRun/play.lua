module(..., package.seeall)




local globalGroup
local localGroup

local state
local player
local grounds
local blocks
local bonuses

local sky_bg
local pause_btn
local main_loop, event_touch

local lifes_lbl, carrots_lbl, distance_lbl


clean_up = function()
	grounds = {}
	blocks = {}
	bonuses = {}
	Runtime:removeEventListener("enterFrame", main_loop)
	Runtime:removeEventListener("touch", event_touch)
	audio.stop(run_channel)
end

local prev_state
pause_game = function()
	prev_state = state
	state = "pause"
	audio.stop(run_channel)
	player[player.state]:pause()
end

resume_game = function()
	state = prev_state
	if player.state=="run" then
		run_channel = audio.play(run_sound, {loops=-1})
	end
	player[player.state]:play()
end

restart_game = function()
	state = "restart"
end

to_main_menu = function()
	state = "to_main_menu"
end

local function end_game()
	clean_up()
	director:changeScene( {carrots=player.carrots, distance=math.floor(player.x/10)}, "popup_end" )
	play_sound(rip_sound)
end

local function bt_pause(event)
	if event.phase == "ended" then
		pause_game()
		director:openPopUp( "popup_menu", popClosed )
	end
end


local function add_block(pos)
	local block = display.newImage("media/play/block.png")
	block.x, block.y = pos.x, pos.y
	localGroup:insert(block)
	block.type = "block"
	blocks[#blocks+1] = block
	return block
end

local function add_bonus(pos)
	local type = "carrot"
	if math.random(1,100)<=10 then type="life" end
	local bonus = display.newImage("media/play/"..type..".png", pos.x, pos.y-50)
	localGroup:insert(bonus)
	bonus.type = type
	bonuses[#bonuses+1] = bonus
	return bonus
end


local function add_ground(pos, level)
	local gr = display.newGroup()
	gr.x,gr.y = pos.x,pos.y
	gr.type = "ground"
	gr.level = level
	grounds[#grounds+1] = gr
	localGroup:insert(gr)
	--left
	local p = display.newImage("media/play/platform_left.png")
	local left_width = p.width
	p:setReferencePoint(display.TopLeftReferencePoint)
	gr:insert(p)
	--center
	local num = 5
	if math.random(1,100)<30 then
		num = math.random(5,15)
	else
		num = math.random(3,7)
	end
	local center_width = 0
	for n=1,num do
		p = display.newImage("media/play/platform.png")
		p:setReferencePoint(display.TopLeftReferencePoint)
		p.x = p.width*(n-1)+left_width
		gr:insert(p)
		center_width = center_width + p.width
	end
	--right
	p = display.newImage("media/play/platform_right.png")
	p:setReferencePoint(display.TopLeftReferencePoint)
	p.x = center_width+left_width
	gr:insert(p)
	
	if math.random(1,100)<20 then
		local cnt = math.random(0,2)
		for i=1,cnt do
			local b = add_block({x=math.random(gr.x+50, gr.x+gr.width-50), y=gr.y-8})
		end
	end

	if math.random(1,100)<30 then
		local cnt = math.random(0,2)
		for i=1,cnt do
			local b = add_bonus({x=math.random(gr.x+50, gr.x+gr.width-50), y=gr.y-8})
		end
	end
	
	return gr
end


local touched = false
local jump_start_time = 0

local function set_player_state(state)
	if player.state==state then return end

	local function e(o)
		o:pause() o.currentFrame=1 o.isVisible = false
	end

	e(player.run)
	e(player.jump)
	e(player.double_jump)
	e(player.fall)

	player.state = state
	player[player.state].isVisible = true
	player[player.state]:prepare(player.state)
	player[player.state]:play()
end

local function fall_down()
	set_player_state("fall")
	audio.stop(run_channel)
end

local function del_grounds()
	for _,g in pairs(grounds) do
		if g.x+g.width<-localGroup.x then
			while g.numChildren>0 do g[1]:removeSelf() end
			g:removeSelf()
			grounds[_] = nil
		end
	end
end

local function farest_ground(level)
	local fg, fd = nil, 0
	for _,g in pairs(grounds) do
		if g.level==level and fd<g.x then
			fd, fg = g.x, g
		end
	end
	return fg
end

local function gen_ground()
	for level=1,10 do
		local fg = farest_ground(level)
		if not fg or fg.x+fg.width <= -localGroup.x+display.contentWidth+100 then
			if not fg then prev_x = 0 else prev_x = fg.x+fg.width end
			local x = math.random(prev_x+100, prev_x+320*player.vx/const.start_speed)
			local y = display.contentHeight/4*(level+2)-16
			local gr = add_ground({x=x,y=y}, level)
		end
	end
end


local function dispatch_grounds()
	local vx, vy = player.vx, player.vy
	for _,g in pairs(grounds) do
		if	player.x<=g.x+g.width+20 and player.x>=g.x-20 then
			if  player.y<=g.y and player.y+vy/30>=g.y then
				if player.state=="fall" then
					set_player_state("run")
					player.double_jump_used = false
					run_channel = audio.play(run_sound, {loops=-1})
				end
				player.y = g.y
				player.vy = 0
			end
		end
	end
end


local function del_blocks()
	for _,b in pairs(blocks) do
		if b.x+b.width/2<-localGroup.x then
			b:removeSelf()
			blocks[_] = nil
		end
	end
end

local function remove_block(block)
	for _,b in pairs(blocks) do
		if b==block then
			b:removeSelf()
			blocks[_] = nil
		end
	end
end

local function nearest_block(p)
	local nb, nbd = nil, 1000000
	for _,b in pairs(blocks) do
		if math.abs(b.x-p.x)<nbd then
			nbd = math.abs(b.x-p.x)
			nb = b
		end
	end
	return nb
end


local function dispatch_blocks()
	local vx, vy = player.vx, player.vy
	for _,b in pairs(blocks) do
		if not b.used and distance(player, b)<b.height then
			vx = vx*2/3
			if vx<const.minimum_speed then vx=const.minimum_speed end
			player.vx = vx
			local block = b
			local time = 500
			transition.to(b, {y=player.y-display.contentHeight, rotation=480, time=time, onComplete=function() remove_block(block) end})
			b.used = true
			player.lives = player.lives - 1
			if player.lives<0 then 
				timer.performWithDelay(1000, end_game)
				player.state = "dead"
				player.moving = player.moving+1
				tm:add(player, {alpha=0, timer=1000})
			else
				player.moving = player.moving+1
			end
			play_sound(punch_sound)
		end
	end
end

local function del_bonuses()
	for _,b in pairs(bonuses) do
		if b.x+b.width/2<-localGroup.x then
			b:removeSelf()
			bonuses[_] = nil
		end
	end
end

local function remove_bonus(bonus)
	for _,b in pairs(bonuses) do
		if b==bonus then
			b:removeSelf()
			bonuses[_] = nil
		end
	end
end

local function nearest_bonus(p)
	local nb, nbd = nil, 1000000
	for _,b in pairs(bonuses) do
		if math.abs(b.x-p.x)<nbd then
			nbd = math.abs(b.x-p.x)
			nb = b
		end
	end
	return nb
end

local function dispatch_bonuses()
	for _,b in pairs(bonuses) do
		if not b.used and distance({x=player.x, y=player.y-player.height/2}, b)<35 then
			if b.type=="life" then
				player.moving = player.moving-1
				player.lives = player.lives+1
				play_sound(life_sound)
			elseif b.type=="carrot" then
				player.carrots = player.carrots+1
				play_sound(carrot_sound)
			end
			local bonus = b
			local time = 500
			transition.to(b, {alpha=0.3, rotation=480, time=time, onComplete=function() remove_bonus(bonus) end})
			b.used  = true
		end
	end
end



main_loop = function(event)
	if state=="to_main_menu" then clean_up() director:changeScene( "main_menu" ) end
	if state=="restart" then clean_up() director:changeScene( "play" ) end

	if state=="wait" or state=="pause" then return end
--	sky_bg.x = -localGroup.x
	local prev_vy = player.vy
	player.x, player.y = player.x+player.vx/30, player.y+player.vy/30
	if player.state=="jump" or player.state=="double_jump" then player.x = player.x+player.vx/30*(const.jump_speed_up-1) end -- speed up on jump
	player.vx, player.vy = player.vx+player.gx+player.ax, player.vy+player.gy+player.ay
	local fall_gravity_k_dynamic = player.vx/const.start_speed
	if player.vy>0 then player.vy = player.vy+(player.gy+player.ay)*(const.fall_gravity_k-1)*fall_gravity_k_dynamic end
	
	if player.y>3*display.contentHeight+100 then end_game() end

	-- set up viewport
	local off = player.lives+player.moving
	if off>5 then off=5 end
	localGroup.x = - player.x + const.offset+(off)*const.lives_offset
	if player.moving>0 then
		player.moving = player.moving-1/30
		if player.moving<=0 then player.moving=0 end
	elseif player.moving<0 then
		player.moving = player.moving+1/30
		if player.moving>=0 then player.moving=0 end
	end

	if player.y<-localGroup.y+1/3*display.contentHeight then localGroup.y=1/3*display.contentHeight-player.y end
	if player.y>-localGroup.y+5/6*display.contentHeight then localGroup.y=5/6*display.contentHeight-player.y end
	-- limit viewport Y motion
	if localGroup.y<-2*display.contentHeight then localGroup.y = -2*display.contentHeight end
	if localGroup.y>0 then localGroup.y = 0 end
	--
	
	if player.vx>=const.maximum_speed then
		player.vx = const.maximum_speed
		player.ax = 0
	else
		player.ax = 0.2
	end

	if player.state~="dead" then
		player[player.state].timeScale = player.vx/const.start_speed
	end

	del_grounds()
	gen_ground()
	dispatch_grounds()

	del_blocks()
	dispatch_blocks()

	del_bonuses()
	dispatch_bonuses()


	if touched and system.getTimer()-jump_start_time<const.max_jump_time and player.state=="jump" then
		player.vy = -const.jump_speed
	end
	
	if prev_vy<=0 and player.vy>0 then fall_down() end
	player:toFront()
	carrots_lbl.text = player.carrots
	lifes_lbl.text = player.lives+1
	distance_lbl.text = math.floor(player.x/10)
end

local function jump(state)
	jump_start_time = system.getTimer()
	player.vy = -const.jump_speed
	set_player_state(state)
	touched = true
	audio.stop(run_channel)
	play_sound(jump_sound)
end



event_touch = function(event)
	if state=="wait" or state=="pause" then return end
	if is_in_rect(event, {pause_btn.x-pause_btn.width/2, pause_btn.y-pause_btn.height/2, pause_btn.x+pause_btn.width/2, pause_btn.y+pause_btn.height/2}) then return end
	if event.phase=="began" then
		if player.state=="run" then
			jump("jump")
		elseif player.state=="jump" or player.state=="fall" and not player.double_jump_used then
			jump("double_jump")
			player.double_jump_used = true
		end
	elseif event.phase=="ended" then
		touched = false
	end
end


new = function ( params )

	local initVars = function ()

		globalGroup = display.newGroup()
		localGroup = display.newGroup()
		globalGroup:insert(localGroup)

		grounds = {}
		blocks = {}
		bonuses = {}

		change_music = function(event)
			if not event or event.completed then
				music_track = math.random(1,1)
				music_sound = audio.loadSound("media/music/track"..music_track..".mp3")
				music_channel = audio.play(music_sound, {loops=-1, onComplete=change_music})
			end
			return true
		end
		local volume = audio.getVolume()
		state = "play"
--		timer.performWithDelay(900, function () audio.setVolume(volume) change_music(nil) end, 1)
		if not settings.game.options.music then
			audio.pause(music_channel)
		end

		local function n(img, name, x,y, num, time, loop)
			local loop = loop or 0
			local sheet = sprite.newSpriteSheet( img, x, y )
			local spriteSet = sprite.newSpriteSet(sheet, 1, num)
			sprite.add( spriteSet, name, 1, num, time, loop )
			local n = sprite.newSprite( spriteSet )
			n:prepare(name)
			n:play()
			return n
		end

		sky_bg = display.newImage( "media/play/sky.jpg", true )
		globalGroup:insert(sky_bg)
		sky_bg:toBack()
		sky_bg:setReferencePoint(display.TopLeftReferencePoint)

		player = display.newGroup()
		player.run = n("media/play/man_run.png", "run", 420/6, 80, 6, 400)
		player.jump = n("media/play/man_jump.png", "jump", 280/4, 80, 4, 50,1)
		player.double_jump = n("media/play/man_double_jump.png", "double_jump", 280/4, 80, 4, 50,1)
		player.fall = n("media/play/man_fall.png", "fall", 70/1, 80, 1, 400)

		player:insert(player.run)
		player:insert(player.jump)
		player:insert(player.double_jump)
		player:insert(player.fall)

		player.lives = const.start_lives
		player.carrots = 0
		player.x, player.y = const.offset+player.lives*const.lives_offset, 500
		localGroup:insert(player)
		player.vx, player.vy = const.start_speed, 0
		player.ax, player.ay, player.gx, player.gy = 0,0, 0,15
		player.moving = 0
		player:setReferencePoint(display.BottomCenterReferencePoint)
		fall_down()

		life_sound = audio.loadSound("media/sounds/life.wav")
		jump_sound = audio.loadSound("media/sounds/jump.wav")
		carrot_sound = audio.loadSound("media/sounds/carrot.wav")
		punch_sound = audio.loadSound("media/sounds/punch.wav")
		run_sound = audio.loadSound("media/sounds/run.wav")
		run_channel = audio.play(run_sound, {loops=-1})
		rip_sound = audio.loadSound("media/sounds/rip.wav")
		
		local lifes = display.newImage("media/play/life.png", 2, 10) lifes.xScale, lifes.yScale = 0.5, 0.5
		lifes_lbl = display.newText("", 38, 22, native.systemFont, 16)
		lifes_lbl:setTextColor(0, 200, 0)
		globalGroup:insert(lifes)
		globalGroup:insert(lifes_lbl)
		local carrots = display.newImage("media/play/carrot.png", 52, 0) carrots.xScale, carrots.yScale = 0.5, 0.5
		carrots_lbl = display.newText("", 75, 22, native.systemFontBold, 16)
		carrots_lbl:setTextColor(0, 200, 0)
		globalGroup:insert(carrots)
		globalGroup:insert(carrots_lbl)
		local run_icon = display.newImage("media/play/run_icon.png", 90, 10)
		distance_lbl = display.newText("", 130, 22, native.systemFontBold, 16)
		distance_lbl:setTextColor(0, 200, 0)
		distance_lbl:setReferencePoint(display.TopLeftReferencePoint)
		globalGroup:insert(distance_lbl)
		globalGroup:insert(run_icon)

		pause_btn = display.newImage("media/menu/pause.png", display.contentWidth-30, 10)
		pause_btn:addEventListener("touch", bt_pause)
		globalGroup:insert(pause_btn)
		
		Runtime:addEventListener("enterFrame", main_loop)
		Runtime:addEventListener("touch", event_touch)
	end
	
	
	
	initVars()
	return globalGroup
end
