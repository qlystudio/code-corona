
GameData = {}

require "com.vendor.ice"

function GameData:new()
	
	local game_data = {}
	local game_settings
	
	function game_data:resetData( level_count )
		local levels = {}
		for i=1, level_count do
			local level = {level=i, score=0, locked=false, heigh_score=0}				
			if level.level > 1 then
				level.locked = true
			end
			levels[i] = level
		end
		
		game_settings = ice:newBox("settings")
		game_settings:store("levels", levels)
		game_settings:store("high_score", {overall_highscore=0})
		game_settings:store("audio_settings", {track_vol=0.2, game_vol=0.5})
		game_settings:store("controls_setup", {setup="right handed"})
		game_settings:store("skill_level", {value=1})
		game_settings:save()
	end
	
	function game_data:getLevels( level_count )
		game_settings = ice:loadBox("settings")
		
		if game_settings:retrieve("levels") == nil then
			game_data:resetData(level_count)
		end
		return game_settings:retrieve("levels")
	end
	
	function game_data:setLevel(level)
		local levs = game_settings:retrieve("levels")
		local selected_level = levs[level.level]

		if selected_level == nil then
			selected_level = {}
		end

		selected_level.score = level.score
		
		if level.locked ~= nil then
			selected_level.locked = level.locked
		end
		
		if selected_level.heigh_score == nil or 
				selected_level.score > selected_level.heigh_score then
			selected_level.heigh_score = level.score
		end
		 
		
--		levs[level.level] = selected_level
		
		game_settings:store("levels", levs)
		game_settings:save()
	end
	
	function game_data:saveData(data)
		game_settings:store("levels", levels)
		game_settings:save()
	end
	
	
	
	function game_data:totalScore()
		local total_score = 0
		
		if overall == nil then
			overall = 0
		end
		
		local levs = game_settings:retrieve("levels")
		
		if levs ~= nil then
			for i=1, table.getn(levs) do
				total_score = total_score + levs[i].score
			end
		end
		
		return total_score
	end
	
	function game_data:overallHighScore()
		local levs = game_settings:retrieve("levels")
		local score = 0
		
		for i=1, table.getn(levs) do
			score = score + levs[i].heigh_score
		end
		
		return score		
	end	
	
	function game_data:getTrackVol()
		local audio_settings = game_settings:retrieve("audio_settings")
		
		if audio_settings == nil then
			game_settings:store("audio_settings", {track_vol=0.2, game_vol=0.5})
			game_settings:save()
			audio_settings = game_settings:retrieve("audio_settings")
		end
		
		return audio_settings.track_vol
	end
	
	function game_data:setTrackVolume(value)
		local audio_settings = game_settings:retrieve("audio_settings")
		audio_settings.track_vol = value
		game_settings:save()
	end
	
	function game_data:setGameSoundVolume(value)
		local audio_settings = game_settings:retrieve("audio_settings")
		audio_settings.game_vol = value
		game_settings:save()
	end
	
	function game_data:getGameSoundVolume(value)
		
		local audio_settings = game_settings:retrieve("audio_settings")
		
		if audio_settings == nil then
			game_settings:store("audio_settings", {track_vol=0.2, game_vol=0.5})
			game_settings:save()
			audio_settings = game_settings:retrieve("audio_settings")
		end
		
		return audio_settings.game_vol
	end
	
	function game_data:setControls(value)
		local controls_setup = game_settings:retrieve("controls_setup")
		controls_setup.setup = value
		game_settings:save()
	end
	
	function game_data:getControlsSetup()
		local controls_setup = game_settings:retrieve("controls_setup")
		
		if controls_setup == nil then
			game_settings:store("controls_setup", {setup="right handed"})
			game_settings:save()
			controls_setup = game_settings:retrieve("controls_setup")
		end
		
		return controls_setup.setup
	end
	
	function game_data:getSkillLevel()
		local skill_level = game_settings:retrieve("skill_level")
		
		if skill_level == nil then
			game_settings:store("skill_level", {value=1})
			game_settings:save()
			skill_level = game_settings:retrieve("skill_level")
		end
		if skill_level.value == nil then 
			skill_level.value = 1
			game_settings:save()
		end
		return skill_level.value
	end
	
	function game_data:setSkillLevel(value)
		local skill_level = game_settings:retrieve("skill_level")
		skill_level.value = value
		game_settings:save()
	end

	
	
	return game_data
end

return GameData