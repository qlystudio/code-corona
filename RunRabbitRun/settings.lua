module(..., package.seeall)

local db = {}
game = {}

function settings:init()

	local path = system.pathForFile( "rrr_settings.sqlite", system.DocumentsDirectory )
	file = io.open( path, "r" )
	if( file == nil )then
		pathSource     = system.pathForFile( "db/rrr_settings.sqlite", system.ResourceDirectory )
		fileSource     = io.open( pathSource, "r" )
		contentsSource = fileSource:read( "*a" )
		pathDest = system.pathForFile( "rrr_settings.sqlite", system.DocumentsDirectory )
		fileDest = io.open( pathDest, "w" )
		fileDest:write( contentsSource )
		io.close( fileSource )
		io.close( fileDest )
	else
		io.close( file )
	end

	path = system.pathForFile( "rrr_settings.sqlite", system.DocumentsDirectory )
    db = sqlite3.open(path)
--db:exec('DROP TABLE settings')
	local sql = 'CREATE TABLE IF NOT EXISTS settings (id INTEGER PRIMARY KEY, var UNIQUE, val);'
	db:exec(sql)
	game = get()
	if not game or table.count(game)==0 then
		g = require("default_values")
		game=copy(g.game)
	end
	if not game.player_name then
		local offset = nil
		local name = system.getInfo( "name" )
		if not offset then offset = string.find(name, "’s i") end
--		if not offset then offset = string.find(name, "’s iPhone") end
--		if not offset then offset = string.find(name, "’s iPad") end
--		if not offset then offset = string.find(name, "’s iPod") end
		if not offset then offset = string.find(name, "’s Mac") end
		if offset then
			name = string.sub(name, 1, offset-1)
		end
		game.player_name = name
	end
	if not game.player_id then
		game.player_id = crypto.digest( crypto.md4, system.getInfo("deviceID"))
	end
	save()
end

function settings:reset_game()
	g=require("default_values")
	game = copy(g.game)
	save()
end

function settings:close()
       db:close()
end

function settings:get()
	local val = nil
	for result in db:nrows('SELECT val FROM settings WHERE var="game"') do
		val =  Json.Decode(result.val)
		val = val[1]
	end
	return val
end

function settings:save()
	local sql = 'INSERT OR REPLACE INTO settings(var, val) VALUES ("game", \''..Json.Encode({game})..'\')'
	db:exec(sql)
end
