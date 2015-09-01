--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:00cfe75283903490ee59636cbea3f4be$
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
            x=0,
            y=212,
            width=50,
            height=212,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0002
            x=0,
            y=0,
            width=50,
            height=212,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0003
            x=50,
            y=210,
            width=56,
            height=210,

            sourceX = 68,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0004
            x=50,
            y=0,
            width=56,
            height=210,

            sourceX = 68,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0005
            x=106,
            y=188,
            width=60,
            height=208,

            sourceX = 66,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0006
            x=166,
            y=188,
            width=92,
            height=196,

            sourceX = 52,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0007
            x=106,
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
            x=232,
            y=0,
            width=120,
            height=174,

            sourceX = 38,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0009
            x=352,
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
            x=442,
            y=0,
            width=70,
            height=152,

            sourceX = 60,
            sourceY = 74,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0011
            x=258,
            y=174,
            width=86,
            height=134,

            sourceX = 56,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0012
            x=352,
            y=164,
            width=86,
            height=134,

            sourceX = 56,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0013
            x=418,
            y=298,
            width=80,
            height=138,

            sourceX = 60,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0014
            x=338,
            y=308,
            width=80,
            height=138,

            sourceX = 60,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0015
            x=258,
            y=308,
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
