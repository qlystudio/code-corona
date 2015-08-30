io.output():setvbuf('no')
--print(system.getInfo("platformName"))
display.setStatusBar(display.HiddenStatusBar)
physics = require "physics"
--physics.setDrawMode( "hybrid" )
system.activate( "multitouch" )

local AppData = require("com.sixftview.model.app_data")
local director = require("director")
local SoundTrack = require "com.sixftview.sounds.sound_track"

app_data = AppData:new()	

sound_track = SoundTrack:new(app_data:getTrackVol(), app_data:getGameSoundVolume())
sound_track:play()

local level = 0

--have to put partical candy as global so we can clean it up when we want
Particles = require("com.vendor.lib_particle_candy")

local function main()
	local mainGroup = display.newGroup()
	mainGroup:insert(director.directorView)
	director:changeScene("com.sixftview.splash.splash_view")
	
	return true
end

--[[ this is debugging stuff ]]--

--[[local monitorMem = function(event)

    collectgarbage()
    print( "MemUsage: " .. collectgarbage("count") )

    local textMem = system.getInfo( "textureMemoryUsed" ) / 1000000
    print( "TexMem:   " .. textMem )
end

timer.performWithDelay(10000, monitorMem, -1)--]]

--[[local sysFonts = native.getFontNames()
for k,v in pairs(sysFonts) do print(v) end
--]]

main()