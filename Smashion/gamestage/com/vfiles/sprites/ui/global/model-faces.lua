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
            x=120,
            y=154,
            width=58,
            height=75,

        },
        {
            -- bag
            x=214,
            y=222,
            width=32,
            height=32,

        },
        {
            -- basepoint
            x=180,
            y=77,
            width=58,
            height=75,

        },
        {
            -- bottle
            x=214,
            y=188,
            width=32,
            height=32,

        },
        {
            -- camera
            x=180,
            y=222,
            width=32,
            height=32,

        },
        {
            -- cara
            x=120,
            y=77,
            width=58,
            height=75,

        },
        {
            -- cellphone
            x=180,
            y=188,
            width=32,
            height=32,

        },
        {
            -- cigarettes
            x=214,
            y=154,
            width=32,
            height=32,

        },
        {
            -- devon
            x=60,
            y=154,
            width=58,
            height=75,

        },
        {
            -- ico-equal
            x=0,
            y=231,
            width=15,
            height=10,

        },
        {
            -- jenny
            x=60,
            y=77,
            width=58,
            height=75,

        },
        {
            -- joan
            x=180,
            y=0,
            width=58,
            height=75,

        },
        {
            -- kate
            x=120,
            y=0,
            width=58,
            height=75,

        },
        {
            -- lindsay
            x=60,
            y=0,
            width=58,
            height=75,

        },
        {
            -- maria
            x=0,
            y=154,
            width=58,
            height=75,

        },
        {
            -- naomi
            x=0,
            y=77,
            width=58,
            height=75,

        },
        {
            -- stella
            x=0,
            y=0,
            width=58,
            height=75,

        },
        {
            -- stiletto
            x=180,
            y=154,
            width=32,
            height=32,

        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 256
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
