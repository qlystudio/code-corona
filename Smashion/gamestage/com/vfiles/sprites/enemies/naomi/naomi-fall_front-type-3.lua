--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ea0d6d8b047e91af23647b634d1d8f75$
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
            -- naomi-fall-forward0001
            x=0,
            y=0,
            width=48,
            height=204,

            sourceX = 84,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0002
            x=0,
            y=204,
            width=56,
            height=194,

            sourceX = 82,
            sourceY = 24,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0003
            x=48,
            y=0,
            width=68,
            height=176,

            sourceX = 78,
            sourceY = 36,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0004
            x=56,
            y=176,
            width=76,
            height=162,

            sourceX = 72,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0005
            x=114,
            y=338,
            width=92,
            height=148,

            sourceX = 62,
            sourceY = 52,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0006
            x=206,
            y=284,
            width=106,
            height=130,

            sourceX = 42,
            sourceY = 70,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0007
            x=374,
            y=0,
            width=114,
            height=112,

            sourceX = 30,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0008
            x=0,
            y=398,
            width=114,
            height=112,

            sourceX = 30,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0009
            x=312,
            y=234,
            width=106,
            height=122,

            sourceX = 38,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0010
            x=374,
            y=112,
            width=106,
            height=122,

            sourceX = 38,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0011
            x=278,
            y=0,
            width=96,
            height=128,

            sourceX = 48,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0012
            x=216,
            y=138,
            width=96,
            height=128,

            sourceX = 48,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0013
            x=194,
            y=0,
            width=84,
            height=138,

            sourceX = 60,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0014
            x=132,
            y=146,
            width=84,
            height=138,

            sourceX = 60,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0015
            x=116,
            y=0,
            width=78,
            height=146,

            sourceX = 66,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["naomi-fall-forward0001"] = 1,
    ["naomi-fall-forward0002"] = 2,
    ["naomi-fall-forward0003"] = 3,
    ["naomi-fall-forward0004"] = 4,
    ["naomi-fall-forward0005"] = 5,
    ["naomi-fall-forward0006"] = 6,
    ["naomi-fall-forward0007"] = 7,
    ["naomi-fall-forward0008"] = 8,
    ["naomi-fall-forward0009"] = 9,
    ["naomi-fall-forward0010"] = 10,
    ["naomi-fall-forward0011"] = 11,
    ["naomi-fall-forward0012"] = 12,
    ["naomi-fall-forward0013"] = 13,
    ["naomi-fall-forward0014"] = 14,
    ["naomi-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
