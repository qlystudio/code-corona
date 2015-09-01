--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4019aebec473780aa5b4cd59b72185b9$
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
            -- bottle-0000
            x=0,
            y=52,
            width=18,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 52
        },
        {
            -- bottle-0001
            x=36,
            y=0,
            width=18,
            height=44,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 18,
            sourceHeight = 52
        },
        {
            -- bottle-0002
            x=0,
            y=104,
            width=18,
            height=20,

            sourceX = 0,
            sourceY = 20,
            sourceWidth = 18,
            sourceHeight = 52
        },
        {
            -- bottle-0003
            x=36,
            y=44,
            width=18,
            height=30,

            sourceX = 0,
            sourceY = 8,
            sourceWidth = 18,
            sourceHeight = 52
        },
        {
            -- bottle-0004
            x=18,
            y=86,
            width=18,
            height=40,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 18,
            sourceHeight = 52
        },
        {
            -- bottle-0005
            x=0,
            y=0,
            width=18,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 52
        },
        {
            -- bottle-0006
            x=18,
            y=44,
            width=18,
            height=42,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 18,
            sourceHeight = 52
        },
        {
            -- bottle-0007
            x=36,
            y=74,
            width=18,
            height=28,

            sourceX = 0,
            sourceY = 10,
            sourceWidth = 18,
            sourceHeight = 52
        },
        {
            -- bottle-0008
            x=36,
            y=102,
            width=18,
            height=26,

            sourceX = 0,
            sourceY = 16,
            sourceWidth = 18,
            sourceHeight = 52
        },
        {
            -- bottle-0009
            x=18,
            y=0,
            width=18,
            height=44,

            sourceX = 0,
            sourceY = 6,
            sourceWidth = 18,
            sourceHeight = 52
        },
    },
    
    sheetContentWidth = 64,
    sheetContentHeight = 128
}

SheetInfo.frameIndex =
{

    ["bottle-0000"] = 1,
    ["bottle-0001"] = 2,
    ["bottle-0002"] = 3,
    ["bottle-0003"] = 4,
    ["bottle-0004"] = 5,
    ["bottle-0005"] = 6,
    ["bottle-0006"] = 7,
    ["bottle-0007"] = 8,
    ["bottle-0008"] = 9,
    ["bottle-0009"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
