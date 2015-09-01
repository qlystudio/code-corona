--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:85f8a5791a37bb0076068d8d6e338b73$
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
            sourceY = 8,
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
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0003
            x=52,
            y=192,
            width=54,
            height=188,

            sourceX = 70,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0004
            x=52,
            y=2,
            width=54,
            height=188,

            sourceX = 70,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0005
            x=108,
            y=2,
            width=58,
            height=186,

            sourceX = 66,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0006
            x=108,
            y=190,
            width=86,
            height=180,

            sourceX = 54,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0007
            x=168,
            y=2,
            width=118,
            height=174,

            sourceX = 38,
            sourceY = 24,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0008
            x=196,
            y=178,
            width=112,
            height=162,

            sourceX = 42,
            sourceY = 40,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0009
            x=210,
            y=342,
            width=88,
            height=156,

            sourceX = 42,
            sourceY = 52,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0010
            x=300,
            y=342,
            width=74,
            height=146,

            sourceX = 54,
            sourceY = 64,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0011
            x=376,
            y=128,
            width=78,
            height=128,

            sourceX = 60,
            sourceY = 80,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0012
            x=288,
            y=2,
            width=78,
            height=128,

            sourceX = 60,
            sourceY = 80,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0013
            x=376,
            y=2,
            width=82,
            height=124,

            sourceX = 56,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0014
            x=52,
            y=382,
            width=78,
            height=128,

            sourceX = 56,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-forward0015
            x=132,
            y=372,
            width=76,
            height=132,

            sourceX = 58,
            sourceY = 88,
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
