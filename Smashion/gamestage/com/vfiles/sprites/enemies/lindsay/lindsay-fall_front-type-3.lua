--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:6913e0db2cc1a4829af86b3d79bde016$
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
            -- lindsay-fall-forward0001
            x=52,
            y=188,
            width=52,
            height=212,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0002
            x=0,
            y=188,
            width=52,
            height=212,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0003
            x=426,
            y=0,
            width=58,
            height=210,

            sourceX = 68,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0004
            x=368,
            y=134,
            width=58,
            height=210,

            sourceX = 68,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0005
            x=304,
            y=164,
            width=64,
            height=208,

            sourceX = 66,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0006
            x=126,
            y=0,
            width=92,
            height=196,

            sourceX = 52,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0007
            x=0,
            y=0,
            width=126,
            height=188,

            sourceX = 34,
            sourceY = 26,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0008
            x=104,
            y=196,
            width=120,
            height=174,

            sourceX = 38,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0009
            x=218,
            y=0,
            width=90,
            height=164,

            sourceX = 44,
            sourceY = 60,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0010
            x=224,
            y=308,
            width=74,
            height=152,

            sourceX = 58,
            sourceY = 74,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0011
            x=308,
            y=0,
            width=86,
            height=134,

            sourceX = 56,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0012
            x=104,
            y=370,
            width=86,
            height=134,

            sourceX = 56,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0013
            x=380,
            y=344,
            width=82,
            height=138,

            sourceX = 58,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0014
            x=298,
            y=372,
            width=82,
            height=138,

            sourceX = 58,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0015
            x=224,
            y=164,
            width=80,
            height=144,

            sourceX = 56,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["lindsay-fall-forward0001"] = 1,
    ["lindsay-fall-forward0002"] = 2,
    ["lindsay-fall-forward0003"] = 3,
    ["lindsay-fall-forward0004"] = 4,
    ["lindsay-fall-forward0005"] = 5,
    ["lindsay-fall-forward0006"] = 6,
    ["lindsay-fall-forward0007"] = 7,
    ["lindsay-fall-forward0008"] = 8,
    ["lindsay-fall-forward0009"] = 9,
    ["lindsay-fall-forward0010"] = 10,
    ["lindsay-fall-forward0011"] = 11,
    ["lindsay-fall-forward0012"] = 12,
    ["lindsay-fall-forward0013"] = 13,
    ["lindsay-fall-forward0014"] = 14,
    ["lindsay-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
