-- RETINA IMAGES HAVE BEEN CONFIGED IN CONFIG.LUA

-- TERMINAL PRINT TESTS
print("Billy says Hey!");
local first_name = "Billy"
local last_name = "Hayes"
print(first_name..' '..last_name)

-- GET CONTENT HEIGHT AND WIDTH OF SCREEN
_H = display.contentHeight
_W = display.contentWidth
local mRand = math.random



-- REQUIRE WEAPON.LUA FILE WITH CONSTRUCTOR
local weapon = require("weapon");

-- BUILD ITEMS
local itemCell = weapon.new({type="cell"});
local itemCigs = weapon.new({type="cigs"});
local itemBag = weapon.new({type="bag"});
local itemShoe = weapon.new({type="shoe"});
local itemBottleWater = weapon.new({type="bottle-water"});
local itemUmbrella = weapon.new({type="umbrella"});

