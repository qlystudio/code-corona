-- RETINA IMAGES HAVE BEEN CONFIGED IN CONFIG.LUA

-- TERMINAL PRINT TESTS
print("Billy says Hey!");
local first_name = "Billy"
local last_name = "Hayes"
print(first_name..' '..last_name)

-- GET CONTENT HEIGHT AND WIDTH OF SCREEN
local _H = display.contentHeight
local _W = display.contentWidth
local mRand = math.random

-- CELL BUTTON DISPLAY RECT AND IMAGE SETUP
local cellBtnRect = display.newGroup();
cellBtnRect.contentWidth = 144;
cellBtnRect.contentHeight = 144;

local rect = display.newRect(0,0,144, 144);
rect:setFillColor( 255, 255, 255, 0)
rect.strokeWidth = 3; rect:setStrokeColor( 255, 242, 0 );
rect.x = _W/2;
rect.y = _H - 144;

local cellBtn = display.newImageRect("images/items/cell.png", 53, 122)
cellBtn.x = _W/2;
cellBtn.y = _H - 144;
cellBtn.rotation = 45
cellBtn.item = "Cell Phone";

-- ADD RECT AND IMAGE CELL BUTTON TO PARENT DISPLAY GROUP
cellBtnRect:insert( rect )
cellBtnRect:insert( cellBtn )


-- TEXT
local txt = display.newText("Click State", 0, 0, native.systemFont, 16*2);
txt.xScale = 0.5; txt.yScale = 0.5;
txt.x = _W/10; txt.y = _H/10;


-- ATTACH EVENT HANDLER FUNCTION TO CELL BUTTON OBJECT ITSELF.
-- TOUCH EVENT LISTERNER FUNCTION
function cellBtn:touch(e)
	if(e.phase == "began") then
		--DO SOMETHING DURING BEGAN PHASE
		txt.text = "Began Phase";
		display.getCurrentStage():setFocus(e.target, e.id);
	elseif(e.phase == "moved") then
		--DO SOMETHING DURING MOVED PHASE
		txt.text = "Moved Phase";
		-- txt.text = cellBtn.item; 
	elseif(e.phase == "ended") then
		--DO SOMETHING DURING ENDED PHASE
		txt.text = "Ended Phase";

		transition.to(self, {x=e.x, y=e.y, time = 1500});
		transition.to(rect, {x=e.x, y=e.y, time = 1500});

		txt.text = 'x: ' .. e.x .. ' & y: ' .. e.y;

		display.getCurrentStage():setFocus(e.target, nil);
	end
end

-- ADD TOUCH EVENT LISTENERS
cellBtn:addEventListener( "touch", cellBtn )


-- S O U N D S --
-- ADD EVENT LISTENER T0 ITEM TO INIT SOUND EFFECT
-- LOAD AUDIO
local c = 0;
local audioKick = audio.loadSound( "audio/drums/kick.aif")
local audioRolandC = audio.loadSound( "audio/synth/roland-c.aif")
local closetDrumSnare = audio.loadStream( "audio/loops/closet-drum-snare.aif")
local zelda = audio.loadStream( "audio/loops/zelda-70.aif")

local item = display.newImageRect("images/items/bag.png", 127, 127)
item.x = _W/4; item.y = _H/8;


local soundBtn = display.newRect(0, 0, 72, 72)
soundBtn:setFillColor(255, 0, 0, 0.5)
soundBtn.x = 0; soundBtn.y = _H - 100;



function item:touch(e)
	if(e.phase == "ended") then
		-- audio.play(audioKick)
		audio.play(audioRolandC)
	end
	print("Item is touched")
end


function soundBtn:touch(e)
	if(e.phase == "ended") then
		local c = c+1;
		print('This is it')
		audio.play(closetDrumSnare, {loops=2})
		audio.play(zelda, {loops=5})
	end
end

item:addEventListener( "touch", item )
soundBtn:addEventListener( "touch", soundBtn )




-- TIMER EVENTS AND FUNCTIONS 
-- 	EVERY SECOND printIt() Runs
-- local function printIt()
-- 	print("! - from Billy")
-- end

-- local function spawnItem()
-- 	local item = display.newImageRect("images/items/shoe.png", 127, 127)
-- 	item.x = mRand(50, _W-50)
-- 	item.y = mRand(50, _H-50)
-- end

-- tmr = timer.performWithDelay( 1000, spawnItem, 5 )

-- local function killIt(e)
-- 	if(e.phase == "ended") then
-- 		timer.cancel( tmr )
-- 	end
-- end

-- Runtime:addEventListener( "touch", killIt )
