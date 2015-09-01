module(..., package.seeall)
new = function ( params )
	local localGroup = display.newGroup()

	local music_track = 1
	local music_sound = nil
	local music_channel = nil
	local btn_sound = nil

	local bt_start_game = function(event)
		if event.phase == "ended" then
			play_sound(btn_sound)
			--if settings.game.options.music then audio.fadeOut({ channel=music_channel, time=1000 } ) end
			director:changeScene("play")
		end
	end


	local initVars = function ()
		local bg = display.newImage("media/menu/bg.png", 0,0, true)
		localGroup:insert(bg)

		local button_start_game = ui.newButton{
			default = "media/menu/start.png",
			over = "media/menu/start.png",
			onRelease = bt_start_game,
			text = "",
			emboss = true
		}

		button_start_game.x = display.contentWidth-50
		button_start_game.y = display.contentHeight-90
		localGroup:insert(button_start_game)

---------------------------- O P T I O N S ----------------------------

		local sound = {
			on = display.newImage("media/menu/sound_on.png"),
			off = display.newImage("media/menu/sound_off.png"),
		}
		sound.on.x, sound.on.y = 50, 30
		sound.off.x, sound.off.y = 50, 30

		local music = {
			on = display.newImage("media/menu/music_on.png"),
			off = display.newImage("media/menu/music_off.png"),
		}
		music.on.x, music.on.y = 100, 30
		music.off.x, music.off.y = 100, 30
		
--		sound.on.xScale, sound.on.yScale = 0.5, 0.5
--		music.on.xScale, music.on.yScale = 0.5, 0.5
		
		localGroup:insert(sound.on)
		localGroup:insert(sound.off)
		localGroup:insert(music.on)
		localGroup:insert(music.off)

		
		local function set_btn_states()
			if settings.game.options.sound then
				sound.on.isVisible = true sound.off.isVisible = false
			else
				sound.on.isVisible = false sound.off.isVisible = true
			end
			if settings.game.options.music then
				music.on.isVisible = true music.off.isVisible = false
			else
				music.on.isVisible = false music.off.isVisible = true
			end
		end
		set_btn_states()



		local change_music
		change_music = function(event)
			if not event or event.completed then
				music_track = math.random(1,1)
				music_sound = audio.loadSound("media/music/track"..music_track..".mp3")
				music_channel = audio.play(music_sound, {loops=-1, onComplete=change_music})
			end
			return true
		end
		change_music(nil) -- starts music

		if not settings.game.options.music then
			audio.pause(music_channel)
		end

		local function switch_state(event)
			if event.phase == "ended" then
				if event.target==sound.on or event.target==sound.off then
					settings.game.options.sound= not settings.game.options.sound
				else
					settings.game.options.music = not settings.game.options.music
					if not settings.game.options.music then 
						audio.pause(music_channel)
					else
						audio.resume(music_channel)
					end
				end
				set_btn_states()
				settings:save()
				play_sound(btn_sound)
			end
		end
		sound.on:addEventListener("touch", switch_state)
		sound.off:addEventListener("touch", switch_state)
		music.on:addEventListener("touch", switch_state)
		music.off:addEventListener("touch", switch_state)

		local credits = display.newImage("media/menu/credits.png")
		localGroup:insert(credits)
		credits.x, credits.y = -(credits.width/2-30), display.contentHeight/2

		local rect_width, rect_height = 30, 80
		local credits_rect = display.newRect(0, display.contentHeight/2-rect_height/2, rect_width, rect_height)
		localGroup:insert(credits_rect)
		credits_rect.alpha = 0.01
		
		credits_rect:addEventListener("touch", function(event)
			if event.phase=="ended" and not credits.tm then
				if credits.x~=display.contentWidth/2 then
					play_sound(btn_sound)
					credits.tm = tm:add(credits, {time=1000, x=display.contentWidth/2, onComplete=function() credits.tm = nil end})
					display.getCurrentStage():setFocus(credits)
				end
			end
		end)

		credits:addEventListener("touch", function(event)
			if event.phase=="ended" and not credits.tm then
				if credits.x==display.contentWidth/2 then
					play_sound(btn_sound)
					credits.tm = tm:add(credits, {time=1000, x=-(credits.width/2-30), onComplete=function() credits.tm = nil display.getCurrentStage():setFocus(nil) end})
				end
			end
		end)

		btn_sound = audio.loadSound("media/sounds/button.wav")
		
	end
	
	
	
	initVars()
	return localGroup
end
