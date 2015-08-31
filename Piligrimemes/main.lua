-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local director = require("director")
local group = display.newGroup()

local function main()
	group:insert(director.directorView)
	director:changeScene("levelselection", "fade", 500)
	return true
end

main()

