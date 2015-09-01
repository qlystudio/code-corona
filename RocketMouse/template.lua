module(..., package.seeall)

---------------------------------------------------------------
-- GROUPS
---------------------------------------------------------------

local localGroup = display.newGroup()

---------------------------------------------------------------
-- DISPLAY OBJECTS
---------------------------------------------------------------

local background = display.newRect(0,0,320,480)
local title = display.newText("Template", 0, 0, native.systemFontBold, 16)

---------------------------------------------------------------
-- LISTENERS
---------------------------------------------------------------

local function touched ( event )
	if event.phase == "ended" then
		--director:changeScene("screen1","crossfade")
		print("changeScene")
	end
end

---------------------------------------------------------------
-- INIT VARS
---------------------------------------------------------------

local function initVars ()

	-----------------------------------
	-- Inserts
	-----------------------------------
	
	localGroup:insert(background)
	localGroup:insert(title)
	
	-----------------------------------
	-- Positions
	-----------------------------------
	
	title.x = 160
	title.y = 240
	
	-----------------------------------
	-- Colors
	-----------------------------------
	
	background:setFillColor(0,200,100)
	title:setTextColor( 255,255,255)
	
	-----------------------------------
	-- Listeners
	-----------------------------------
	
	background:addEventListener( "touch" , touched )
	
end

---------------------------------------------------------------
-- CLEAN
---------------------------------------------------------------

function clean ( event )
	print("cleaned")
end

---------------------------------------------------------------
-- NEW
---------------------------------------------------------------

function new()
	
	-----------------------------------
	-- Initiate variables
	-----------------------------------
	
	initVars()
	
	-----------------------------------
	-- MUST return a display.newGroup()
	-----------------------------------
	
	return localGroup
	
end
