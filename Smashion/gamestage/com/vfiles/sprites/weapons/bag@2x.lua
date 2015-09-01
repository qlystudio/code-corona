--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:2716e6b3147d1e83f52a9afded9eb288$
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
            -- bag-0000
            x=0,
            y=196,
            width=88,
            height=108,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 117
        },
        {
            -- bag-0001
            x=88,
            y=240,
            width=88,
            height=64,

            sourceX = 12,
            sourceY = 32,
            sourceWidth = 100,
            sourceHeight = 117
        },
        {
            -- bag-0002
            x=0,
            y=80,
            width=96,
            height=44,

            sourceX = 4,
            sourceY = 36,
            sourceWidth = 100,
            sourceHeight = 117
        },
        {
            -- bag-0003
            x=92,
            y=184,
            width=92,
            height=56,

            sourceX = 4,
            sourceY = 32,
            sourceWidth = 100,
            sourceHeight = 117
        },
        {
            -- bag-0004
            x=0,
            y=0,
            width=96,
            height=80,

            sourceX = 4,
            sourceY = 28,
            sourceWidth = 100,
            sourceHeight = 117
        },
        {
            -- bag-0005
            x=0,
            y=304,
            width=84,
            height=88,

            sourceX = 12,
            sourceY = 32,
            sourceWidth = 100,
            sourceHeight = 117
        },
        {
            -- bag-0006
            x=0,
            y=124,
            width=92,
            height=72,

            sourceX = 0,
            sourceY = 32,
            sourceWidth = 100,
            sourceHeight = 117
        },
        {
            -- bag-0007
            x=96,
            y=0,
            width=96,
            height=52,

            sourceX = 0,
            sourceY = 36,
            sourceWidth = 100,
            sourceHeight = 117
        },
        {
            -- bag-0008
            x=0,
            y=392,
            width=88,
            height=44,

            sourceX = 4,
            sourceY = 44,
            sourceWidth = 100,
            sourceHeight = 117
        },
        {
            -- bag-0009
            x=96,
            y=52,
            width=96,
            height=48,

            sourceX = 0,
            sourceY = 44,
            sourceWidth = 100,
            sourceHeight = 117
        },
        {
            -- bag-0010
            x=96,
            y=100,
            width=92,
            height=84,

            sourceX = 0,
            sourceY = 16,
            sourceWidth = 100,
            sourceHeight = 117
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["bag-0000"] = 1,
    ["bag-0001"] = 2,
    ["bag-0002"] = 3,
    ["bag-0003"] = 4,
    ["bag-0004"] = 5,
    ["bag-0005"] = 6,
    ["bag-0006"] = 7,
    ["bag-0007"] = 8,
    ["bag-0008"] = 9,
    ["bag-0009"] = 10,
    ["bag-0010"] = 11,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
