--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e4c303bdf04286bdabc86f016e8682ac$
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
            -- cara-fall-away0001
            x=0,
            y=190,
            width=42,
            height=188,

            sourceX = 76,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0002
            x=0,
            y=0,
            width=52,
            height=190,

            sourceX = 74,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0003
            x=42,
            y=190,
            width=60,
            height=186,

            sourceX = 68,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0004
            x=52,
            y=0,
            width=66,
            height=184,

            sourceX = 62,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0005
            x=102,
            y=184,
            width=74,
            height=182,

            sourceX = 58,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0006
            x=118,
            y=0,
            width=78,
            height=174,

            sourceX = 56,
            sourceY = 26,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0007
            x=176,
            y=174,
            width=84,
            height=168,

            sourceX = 50,
            sourceY = 34,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0008
            x=196,
            y=0,
            width=90,
            height=164,

            sourceX = 46,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0009
            x=260,
            y=164,
            width=100,
            height=156,

            sourceX = 42,
            sourceY = 58,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0010
            x=286,
            y=0,
            width=110,
            height=152,

            sourceX = 32,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0011
            x=164,
            y=366,
            width=120,
            height=146,

            sourceX = 30,
            sourceY = 78,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0012
            x=396,
            y=0,
            width=114,
            height=142,

            sourceX = 40,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0013
            x=360,
            y=290,
            width=118,
            height=138,

            sourceX = 38,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0014
            x=360,
            y=152,
            width=118,
            height=138,

            sourceX = 38,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0015
            x=42,
            y=376,
            width=122,
            height=136,

            sourceX = 34,
            sourceY = 100,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["cara-fall-away0001"] = 1,
    ["cara-fall-away0002"] = 2,
    ["cara-fall-away0003"] = 3,
    ["cara-fall-away0004"] = 4,
    ["cara-fall-away0005"] = 5,
    ["cara-fall-away0006"] = 6,
    ["cara-fall-away0007"] = 7,
    ["cara-fall-away0008"] = 8,
    ["cara-fall-away0009"] = 9,
    ["cara-fall-away0010"] = 10,
    ["cara-fall-away0011"] = 11,
    ["cara-fall-away0012"] = 12,
    ["cara-fall-away0013"] = 13,
    ["cara-fall-away0014"] = 14,
    ["cara-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
