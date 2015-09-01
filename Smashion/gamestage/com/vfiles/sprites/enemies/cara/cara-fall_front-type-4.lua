--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:8967f4c110eca0cdf04acba62476e941$
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
            -- cara-fall-forward0001
            x=2,
            y=196,
            width=48,
            height=192,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0002
            x=2,
            y=2,
            width=48,
            height=192,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0003
            x=52,
            y=194,
            width=50,
            height=190,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0004
            x=52,
            y=2,
            width=50,
            height=190,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0005
            x=104,
            y=2,
            width=56,
            height=188,

            sourceX = 68,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0006
            x=104,
            y=192,
            width=84,
            height=178,

            sourceX = 56,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0007
            x=162,
            y=2,
            width=116,
            height=170,

            sourceX = 40,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0008
            x=190,
            y=174,
            width=112,
            height=158,

            sourceX = 42,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0009
            x=280,
            y=2,
            width=80,
            height=150,

            sourceX = 48,
            sourceY = 58,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0010
            x=208,
            y=334,
            width=64,
            height=140,

            sourceX = 64,
            sourceY = 70,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0011
            x=362,
            y=2,
            width=78,
            height=122,

            sourceX = 60,
            sourceY = 86,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0012
            x=52,
            y=386,
            width=78,
            height=122,

            sourceX = 60,
            sourceY = 86,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0013
            x=304,
            y=154,
            width=72,
            height=128,

            sourceX = 64,
            sourceY = 84,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0014
            x=274,
            y=334,
            width=74,
            height=130,

            sourceX = 60,
            sourceY = 84,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0015
            x=132,
            y=372,
            width=74,
            height=136,

            sourceX = 58,
            sourceY = 84,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["cara-fall-forward0001"] = 1,
    ["cara-fall-forward0002"] = 2,
    ["cara-fall-forward0003"] = 3,
    ["cara-fall-forward0004"] = 4,
    ["cara-fall-forward0005"] = 5,
    ["cara-fall-forward0006"] = 6,
    ["cara-fall-forward0007"] = 7,
    ["cara-fall-forward0008"] = 8,
    ["cara-fall-forward0009"] = 9,
    ["cara-fall-forward0010"] = 10,
    ["cara-fall-forward0011"] = 11,
    ["cara-fall-forward0012"] = 12,
    ["cara-fall-forward0013"] = 13,
    ["cara-fall-forward0014"] = 14,
    ["cara-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
