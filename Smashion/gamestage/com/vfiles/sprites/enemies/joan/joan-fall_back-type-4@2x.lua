--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:06d70c8c58f9d81dd9e7ca2700281244$
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
            -- joan-fall-away0001
            x=500,
            y=588,
            width=84,
            height=412,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0002
            x=916,
            y=0,
            width=104,
            height=408,

            sourceX = 120,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0003
            x=584,
            y=868,
            width=120,
            height=408,

            sourceX = 104,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0004
            x=868,
            y=408,
            width=124,
            height=404,

            sourceX = 116,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0005
            x=756,
            y=812,
            width=168,
            height=384,

            sourceX = 88,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0006
            x=276,
            y=588,
            width=224,
            height=352,

            sourceX = 60,
            sourceY = 64,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0007
            x=596,
            y=316,
            width=272,
            height=340,

            sourceX = 36,
            sourceY = 80,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0008
            x=0,
            y=0,
            width=308,
            height=328,

            sourceX = 24,
            sourceY = 92,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0009
            x=616,
            y=0,
            width=300,
            height=316,

            sourceX = 36,
            sourceY = 104,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0010
            x=308,
            y=288,
            width=288,
            height=300,

            sourceX = 56,
            sourceY = 120,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0011
            x=308,
            y=0,
            width=308,
            height=288,

            sourceX = 52,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0012
            x=0,
            y=328,
            width=276,
            height=280,

            sourceX = 64,
            sourceY = 140,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0013
            x=0,
            y=608,
            width=212,
            height=240,

            sourceX = 80,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0014
            x=0,
            y=848,
            width=196,
            height=216,

            sourceX = 96,
            sourceY = 208,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0015
            x=584,
            y=656,
            width=172,
            height=212,

            sourceX = 120,
            sourceY = 228,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["joan-fall-away0001"] = 1,
    ["joan-fall-away0002"] = 2,
    ["joan-fall-away0003"] = 3,
    ["joan-fall-away0004"] = 4,
    ["joan-fall-away0005"] = 5,
    ["joan-fall-away0006"] = 6,
    ["joan-fall-away0007"] = 7,
    ["joan-fall-away0008"] = 8,
    ["joan-fall-away0009"] = 9,
    ["joan-fall-away0010"] = 10,
    ["joan-fall-away0011"] = 11,
    ["joan-fall-away0012"] = 12,
    ["joan-fall-away0013"] = 13,
    ["joan-fall-away0014"] = 14,
    ["joan-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
