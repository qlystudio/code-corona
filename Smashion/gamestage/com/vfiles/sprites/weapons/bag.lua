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
            y=98,
            width=44,
            height=54,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 59
        },
        {
            -- bag-0001
            x=44,
            y=120,
            width=44,
            height=32,

            sourceX = 6,
            sourceY = 16,
            sourceWidth = 50,
            sourceHeight = 59
        },
        {
            -- bag-0002
            x=0,
            y=40,
            width=48,
            height=22,

            sourceX = 2,
            sourceY = 18,
            sourceWidth = 50,
            sourceHeight = 59
        },
        {
            -- bag-0003
            x=46,
            y=92,
            width=46,
            height=28,

            sourceX = 2,
            sourceY = 16,
            sourceWidth = 50,
            sourceHeight = 59
        },
        {
            -- bag-0004
            x=0,
            y=0,
            width=48,
            height=40,

            sourceX = 2,
            sourceY = 14,
            sourceWidth = 50,
            sourceHeight = 59
        },
        {
            -- bag-0005
            x=0,
            y=152,
            width=42,
            height=44,

            sourceX = 6,
            sourceY = 16,
            sourceWidth = 50,
            sourceHeight = 59
        },
        {
            -- bag-0006
            x=0,
            y=62,
            width=46,
            height=36,

            sourceX = 0,
            sourceY = 16,
            sourceWidth = 50,
            sourceHeight = 59
        },
        {
            -- bag-0007
            x=48,
            y=0,
            width=48,
            height=26,

            sourceX = 0,
            sourceY = 18,
            sourceWidth = 50,
            sourceHeight = 59
        },
        {
            -- bag-0008
            x=0,
            y=196,
            width=44,
            height=22,

            sourceX = 2,
            sourceY = 22,
            sourceWidth = 50,
            sourceHeight = 59
        },
        {
            -- bag-0009
            x=48,
            y=26,
            width=48,
            height=24,

            sourceX = 0,
            sourceY = 22,
            sourceWidth = 50,
            sourceHeight = 59
        },
        {
            -- bag-0010
            x=48,
            y=50,
            width=46,
            height=42,

            sourceX = 0,
            sourceY = 8,
            sourceWidth = 50,
            sourceHeight = 59
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 256
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
