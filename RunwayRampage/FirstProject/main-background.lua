-- TERMINAL PRINT TESTS
print("Billy says Hey!");

local first_name = "Billy"
local last_name = "Hayes"

print(first_name..' '..last_name)


--CREATE IMAGES AND ASSIGN TO VARIABELS
local cell = display.newImage("images/items/cell.png")
local circle02 = display.newImage("images/items/cigs.png")

-- BACKGROUND FOR GROUPS
local group01BG = display.newImage( "images/background/background-charles.png" )
local group02BG = display.newImage("images/background/start.png" )


-- CREATE AND DISPLAY GROUPS ( think of them like divs )
local group01 = display.newGroup();
local group02 = display.newGroup();

local itemHolder01 = display.newGroup();

-- MAKE ITEM BOXES
local itemBox01 = display.newRect( (display.actualContentWidth/2), (display.actualContentHeight/2), 127, 127 )

itemBox01:setFillColor( 255, 255, 255, 0)
itemBox01.strokeWidth = 3; itemBox01:setStrokeColor( 255, 242, 0 );
-- print(cell)


-- INSERT IMAGES IN GROUP
group01:insert(group01BG);
group01:insert(itemBox01);
group01:insert(cell);

itemHolder01:insert(itemBox01);

cell.x = ((display.actualContentWidth/12) * 6); cell.y = ((display.actualContentHeight/10) * 17);
cell.xScale = .25; cell.yScale = .25;


group01.x = display.contentCenterX; group01.y = display.contentCenterY;
