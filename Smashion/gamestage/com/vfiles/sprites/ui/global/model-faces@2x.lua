--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:fc707ffb0f4067e4c2af88e18bd70dab$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- alek
            x=240,
            y=308,
            width=116,
            height=150,

        },
        {
            -- bag
            x=428,
            y=444,
            width=64,
            height=64,

        },
        {
            -- basepoint
            x=360,
            y=154,
            width=116,
            height=150,

        },
        {
            -- bottle
            x=428,
            y=376,
            width=64,
            height=64,

        },
        {
            -- camera
            x=360,
            y=444,
            width=64,
            height=64,

        },
        {
            -- cara
            x=240,
            y=154,
            width=116,
            height=150,

        },
        {
            -- cellphone
            x=360,
            y=376,
            width=64,
            height=64,

        },
        {
            -- cigarettes
            x=428,
            y=308,
            width=64,
            height=64,

        },
        {
            -- devon
            x=120,
            y=308,
            width=116,
            height=150,

        },
        {
            -- ico-equal
            x=0,
            y=462,
            width=30,
            height=20,

        },
        {
            -- jenny
            x=120,
            y=154,
            width=116,
            height=150,

        },
        {
            -- joan
            x=360,
            y=0,
            width=116,
            height=150,

        },
        {
            -- kate
            x=240,
            y=0,
            width=116,
            height=150,

        },
        {
            -- lindsay
            x=120,
            y=0,
            width=116,
            height=150,

        },
        {
            -- maria
            x=0,
            y=308,
            width=116,
            height=150,

        },
        {
            -- naomi
            x=0,
            y=154,
            width=116,
            height=150,

        },
        {
            -- stella
            x=0,
            y=0,
            width=116,
            height=150,

        },
        {
            -- stiletto
            x=360,
            y=308,
            width=64,
            height=64,

        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["alek"] = 1,
    ["bag"] = 2,
    ["basepoint"] = 3,
    ["bottle"] = 4,
    ["camera"] = 5,
    ["cara"] = 6,
    ["cellphone"] = 7,
    ["cigarettes"] = 8,
    ["devon"] = 9,
    ["ico-equal"] = 10,
    ["jenny"] = 11,
    ["joan"] = 12,
    ["kate"] = 13,
    ["lindsay"] = 14,
    ["maria"] = 15,
    ["naomi"] = 16,
    ["stella"] = 17,
    ["stiletto"] = 18,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
