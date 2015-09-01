--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:8d20152d714fdf40f67ed445c331ae78$
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
            -- cigarettes-0000
            x=0,
            y=88,
            width=48,
            height=88,

            sourceX = 12,
            sourceY = 4,
            sourceWidth = 75,
            sourceHeight = 112
        },
        {
            -- cigarettes-0001
            x=52,
            y=160,
            width=56,
            height=72,

            sourceX = 8,
            sourceY = 20,
            sourceWidth = 75,
            sourceHeight = 112
        },
        {
            -- cigarettes-0002
            x=172,
            y=0,
            width=64,
            height=28,

            sourceX = 4,
            sourceY = 44,
            sourceWidth = 75,
            sourceHeight = 112
        },
        {
            -- cigarettes-0003
            x=96,
            y=100,
            width=48,
            height=56,

            sourceX = 12,
            sourceY = 32,
            sourceWidth = 75,
            sourceHeight = 112
        },
        {
            -- cigarettes-0004
            x=48,
            y=84,
            width=48,
            height=76,

            sourceX = 12,
            sourceY = 24,
            sourceWidth = 75,
            sourceHeight = 112
        },
        {
            -- cigarettes-0005
            x=0,
            y=0,
            width=48,
            height=88,

            sourceX = 12,
            sourceY = 20,
            sourceWidth = 75,
            sourceHeight = 112
        },
        {
            -- cigarettes-0006
            x=48,
            y=0,
            width=48,
            height=84,

            sourceX = 12,
            sourceY = 24,
            sourceWidth = 75,
            sourceHeight = 112
        },
        {
            -- cigarettes-0007
            x=172,
            y=28,
            width=52,
            height=72,

            sourceX = 8,
            sourceY = 32,
            sourceWidth = 75,
            sourceHeight = 112
        },
        {
            -- cigarettes-0008
            x=108,
            y=0,
            width=64,
            height=36,

            sourceX = 4,
            sourceY = 36,
            sourceWidth = 75,
            sourceHeight = 112
        },
        {
            -- cigarettes-0009
            x=0,
            y=176,
            width=52,
            height=80,

            sourceX = 12,
            sourceY = 12,
            sourceWidth = 75,
            sourceHeight = 112
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 256
}

SheetInfo.frameIndex =
{

    ["cigarettes-0000"] = 1,
    ["cigarettes-0001"] = 2,
    ["cigarettes-0002"] = 3,
    ["cigarettes-0003"] = 4,
    ["cigarettes-0004"] = 5,
    ["cigarettes-0005"] = 6,
    ["cigarettes-0006"] = 7,
    ["cigarettes-0007"] = 8,
    ["cigarettes-0008"] = 9,
    ["cigarettes-0009"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
