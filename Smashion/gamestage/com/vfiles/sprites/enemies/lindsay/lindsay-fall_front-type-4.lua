--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4ffc0485560fa7af095d0b81038791bf$
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
            x=58,
            y=200,
            width=52,
            height=200,

            sourceX = 72,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0002
            x=58,
            y=0,
            width=52,
            height=200,

            sourceX = 72,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0003
            x=0,
            y=200,
            width=58,
            height=200,

            sourceX = 68,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0004
            x=0,
            y=0,
            width=58,
            height=200,

            sourceX = 68,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0005
            x=110,
            y=172,
            width=64,
            height=194,

            sourceX = 66,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0006
            x=174,
            y=172,
            width=92,
            height=182,

            sourceX = 52,
            sourceY = 30,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0007
            x=110,
            y=0,
            width=126,
            height=172,

            sourceX = 34,
            sourceY = 42,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0008
            x=184,
            y=354,
            width=120,
            height=158,

            sourceX = 38,
            sourceY = 60,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0009
            x=236,
            y=0,
            width=90,
            height=150,

            sourceX = 44,
            sourceY = 74,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0010
            x=110,
            y=366,
            width=74,
            height=140,

            sourceX = 58,
            sourceY = 86,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0011
            x=408,
            y=122,
            width=86,
            height=122,

            sourceX = 56,
            sourceY = 102,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0012
            x=408,
            y=0,
            width=86,
            height=122,

            sourceX = 56,
            sourceY = 102,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0013
            x=346,
            y=244,
            width=82,
            height=126,

            sourceX = 58,
            sourceY = 102,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0014
            x=326,
            y=0,
            width=82,
            height=126,

            sourceX = 58,
            sourceY = 102,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0015
            x=266,
            y=150,
            width=80,
            height=132,

            sourceX = 56,
            sourceY = 102,
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
