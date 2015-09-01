--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d16fd937c2a1bdd474687d9346308e6b$
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
            y=0,
            width=328,
            height=424,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0002
            x=328,
            y=0,
            width=320,
            height=428,

            sourceX = 40,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0003
            x=0,
            y=424,
            width=316,
            height=428,

            sourceX = 44,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0004
            x=648,
            y=380,
            width=312,
            height=428,

            sourceX = 44,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0005
            x=628,
            y=808,
            width=308,
            height=424,

            sourceX = 48,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0006
            x=316,
            y=428,
            width=312,
            height=400,

            sourceX = 40,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0007
            x=648,
            y=0,
            width=316,
            height=380,

            sourceX = 40,
            sourceY = 48,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0008
            x=316,
            y=828,
            width=288,
            height=364,

            sourceX = 52,
            sourceY = 72,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0009
            x=0,
            y=1156,
            width=256,
            height=360,

            sourceX = 72,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0010
            x=0,
            y=1516,
            width=244,
            height=332,

            sourceX = 72,
            sourceY = 120,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0011
            x=440,
            y=1500,
            width=200,
            height=312,

            sourceX = 92,
            sourceY = 136,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0012
            x=244,
            y=1516,
            width=196,
            height=316,

            sourceX = 96,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0013
            x=640,
            y=1232,
            width=244,
            height=308,

            sourceX = 72,
            sourceY = 148,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0014
            x=256,
            y=1192,
            width=252,
            height=308,

            sourceX = 68,
            sourceY = 148,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0015
            x=0,
            y=852,
            width=288,
            height=304,

            sourceX = 48,
            sourceY = 164,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
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
