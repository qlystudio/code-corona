local SoundTrack ={}

function SoundTrack:new(vol, game_vol)
	soundtrack = {}
	
	local tracks = { "robots1.mp3", "robots2.mp3", "robots3.mp3", "robots4.mp3" }
	local track
	local track_num
	local volume = vol
	
	if volume == nil then volume = 0.2 end
	
	function soundtrack:track_count()
		return table.getn(tracks)
	end
	
	function soundtrack:play(num)
		if num ~= nil then
			if num == track_num then 
				track_num = num + 1
			else
				track_num = num
			end

			if track_num > table.getn(tracks) then track_num = 1 end
			print("track num : " .. track_num)
		end
		
		if track ~= nil then
			audio.fadeOut({channel=2, time=500})
		end
		
		local function onAudioDelay(event)
			if num == nil then
				track =
				 audio.loadStream("sounds/tracks/make-it-break-it-take-it-back.mp3")
			else
				local path = "sounds/tracks/" .. tracks[track_num]
				track = audio.loadStream(path)
			end
			audio.stop()
			audio.setVolume( volume, { channel=2 } )
			audio.play(track, { channel=2, loops=-1, fadein=1000 })
		end

		timer.performWithDelay(1000, onAudioDelay, 1)
	end
	
	
	
	function soundtrack:setVolume(value)
		volume = value
		audio.setVolume(volume, {channel=2})
	end
	
	local game_channels = {3,4,5,6,7,8,9,10,11}
	
	function soundtrack:setGameSoundVolume(value)
		for i=1, table.getn(game_channels) do
			audio.setVolume(value, {channel=game_channels[i]})
		end
	end
	
	soundtrack:setGameSoundVolume(game_vol)
	
	return soundtrack
end

return SoundTrack