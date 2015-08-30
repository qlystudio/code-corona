AppData = {}

function AppData:new()
	require "json"
	local app = {}
	local GameData = require("com.sixftview.model.game_data")
	local level_info
	local reset_clicked
	
	local platform = system.getInfo("platformName")
	
	local jsonFile = function( filename, base )

		-- set default base dir if none specified
		if not base then base = system.ResourceDirectory; end

		-- create a file path for corona i/o
		local path = system.pathForFile( filename, base )

		-- will hold contents of file
		local contents

		-- io.open opens a file at path. returns nil if no file found
		local file = io.open( path, "r" )
		if file then
		   -- read all contents of file into a string
		   contents = file:read( "*a" )
		   io.close( file )	-- close the file after using it
		end

		return contents
	end
	
	level_info = json.decode(jsonFile("level_data.json"))


	local count = 0

	for k,v in pairs(level_info.levels) do
		count = count + 1
	end


	app.level_total = count

	
	local game_data = GameData:new()
	--game_data:resetData(count)

	local levels = game_data:getLevels(app.level_total) 

	local reload = false

	app.font_Teknobe = "Teknobe"
	app.font_TektonPro = "Tekton Pro"
	app.font_Robofan = "Robofan"
	
	if platform == "Android" then
		app.font_Teknobe = "Teknobe"
		app.font_TektonPro = "tektonprobold"
		app.font_Robofan = "robofan"
	end
	

	--print(game_data:getLevels())
	--global settings
	centerX = display.contentWidth * 0.5
	centerY = display.contentHeight * 0.5

	totalWidth = display.contentWidth
	totalHeight = display.contentHeight

	halfWidth = display.contentWidth * 0.5
	halfHeight = display.contentHeight * 0.5

	local difficulty_easy = 1
	local difficulty_medium = 2
	local difficulty_hard = 3
	
	local shield_count = 0
	
	function app:getShieldCount()
		return shield_count
	end
	
	function app:setShieldCount(value)
		shield_count = shield_count + value
	end
	
	function app:setShieldCountByLevel(value)
		local key = tostring(value)
		shield_count = level_info["levels"][key]["shields"]
	end
	
	app.large_rock_points = 100
	app.medium_rock_points = 200
	app.small_rock_points = 300
	
	app.enemy1_points = 1000
	app.enemy2_points = 1500
	app.enemy3_points = 2000
	app.enemy4_points = 2500
	
	app.goto_menu = false

	local level = 0
	app.difficulty = difficulty_easy
	app.life_count = 3
	app.next_bonus = 5000
	score = 0
	
	app.show_settings = false
	app.show_audio = false
	
	function app:setReset(value)
		reset_clicked = value
	end
	
	function app:getResetClicked()
		return reset_clicked
	end
	
	function app:getEnemyData(value)
		local key = tostring(value)
		return level_info["levels"][key]["enemies"]
	end
	
	function app:getRockData(value)
		local key = tostring(value)
		return level_info["levels"][key]["rocks"]
	end
	

	function app:setCurrentLevel(value)
		--if value > 30 then value = 1 end
		level = value
	end

	function app:getCurrentLevel()
		return level
	end

	function app:getLevelData(num)
		return levels[num] 
	end

	function app:setLevelData(level)
		game_data:setLevel(level)
	end

	function app:saveLevelData(data)
		game_data:saveData(data)
	end

	function app:getAllLevelData()
		return levels
	end
	
	function app:getTotalScore()
		return game_data:totalScore()
	end
	
	function app:getOverallHighScore()
		return game_data:overallHighScore()
	end

	function app:setReload(value)
		reload = value
	end

	function app:getReload()
		return reload
	end
	
	function app:getTrackVol()
		return game_data:getTrackVol()
	end
	
	function app:setTrackVolume(value)
		game_data:setTrackVolume(value)
	end
	
	function app:setGameSoundVolume(value)
		game_data:setGameSoundVolume(value)
	end
	
	function app:getGameSoundVolume()
		return game_data:getGameSoundVolume()
	end
	
	function app:setControls(value)
		game_data:setControls(value)
	end
	
	function app:getSkillLevel()
		return game_data:getSkillLevel()
	end
	
	function app:setSkillLevel(value)
		game_data:setSkillLevel(value)
	end
	
	function app:getControlsSetup()
		return game_data:getControlsSetup()
	end
	
	function app:resetGameData()
		game_data:resetData(app.level_total)
	end
	
	function app:getExtras(key)
		return level_info["levels"][key]["extras"]
	end
	
	function app:randomNum(min, max)
		local num = min + (max - min) * math.random()
		local num = math.floor(num)
		return num
	end
	
		
	return app
end

return AppData