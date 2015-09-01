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
            y=44,
            width=24,
            height=44,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 38,
            sourceHeight = 56
        },
        {
            -- cigarettes-0001
            x=26,
            y=80,
            width=28,
            height=36,

            sourceX = 4,
            sourceY = 10,
            sourceWidth = 38,
            sourceHeight = 56
        },
        {
            -- cigarettes-0002
            x=86,
            y=0,
            width=32,
            height=14,

            sourceX = 2,
            sourceY = 22,
            sourceWidth = 38,
            sourceHeight = 56
        },
        {
            -- cigarettes-0003
            x=48,
            y=50,
            width=24,
            height=28,

            sourceX = 6,
            sourceY = 16,
            sourceWidth = 38,
            sourceHeight = 56
        },
        {
            -- cigarettes-0004
            x=24,
            y=42,
            width=24,
            height=38,

            sourceX = 6,
            sourceY = 12,
            sourceWidth = 38,
            sourceHeight = 56
        },
        {
            -- cigarettes-0005
            x=0,
            y=0,
            width=24,
            height=44,

            sourceX = 6,
            sourceY = 10,
            sourceWidth = 38,
            sourceHeight = 56
        },
        {
            -- cigarettes-0006
            x=24,
            y=0,
            width=24,
            height=42,

            sourceX = 6,
            sourceY = 12,
            sourceWidth = 38,
            sourceHeight = 56
        },
        {
            -- cigarettes-0007
            x=86,
            y=14,
            width=26,
            height=36,

            sourceX = 4,
            sourceY = 16,
            sourceWidth = 38,
            sourceHeight = 56
        },
        {
            -- cigarettes-0008
            x=54,
            y=0,
            width=32,
            height=18,

            sourceX = 2,
            sourceY = 18,
            sourceWidth = 38,
            sourceHeight = 56
        },
        {
            -- cigarettes-0009
            x=0,
            y=88,
            width=26,
            height=40,

            sourceX = 6,
            sourceY = 6,
            sourceWidth = 38,
            sourceHeight = 56
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 128
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
