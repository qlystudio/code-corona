local VolumeControls = {}

function VolumeControls:new(track_vol, sounds_vol)
	local group = display.newGroup()
	local widget = require "widget"
	widget.setTheme( "theme_ios" )
	
	local slider_tracks
	local slider_sounds
	
	local function sliderListener(event)
		local new_value = event.target.value / 100
		local id = event.target.id
		if id == "game_sounds" then
			
		elseif id == "track_sounds" then
			app_data:setTrackVolume(new_value)
			sound_track:setVolume(new_value)
		end
	end
	
	local txt_gamesounds = display.newText("Game Sounds :",  20, 
										13, "Tekton Pro", 15)
	group:insert(txt_gamesounds)
	
	local txt_tracks = display.newText("Music Volume :", 20, 
										 43, "Tekton Pro", 15)
	group:insert(txt_tracks)
	
	
	
	function group:createSliders()
		
		slider_sounds = widget.newSlider{
		        width=150,
		        callback=sliderListener,
				id="game_sounds",
				x=220,
				y=20
		    }

		group:insert(slider_sounds.view)
		
		slider_tracks = widget.newSlider{
		        width=150,
		        callback=sliderListener,
				id="track_sounds",
				value=app_data:getTrackVol() * 100,
				x=220,
				y=50
		    }
		
		group:insert(slider_tracks.view)
	end
	
	return group
	
end

return VolumeControls