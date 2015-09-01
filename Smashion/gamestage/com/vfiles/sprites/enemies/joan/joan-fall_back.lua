--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:7b367e7091dbf74afa289b5d36ac7cff$
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
            x=250,
            y=294,
            width=42,
            height=206,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0002
            x=458,
            y=0,
            width=52,
            height=204,

            sourceX = 60,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0003
            x=292,
            y=434,
            width=60,
            height=204,

            sourceX = 52,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0004
            x=434,
            y=204,
            width=62,
            height=202,

            sourceX = 58,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0005
            x=378,
            y=406,
            width=84,
            height=192,

            sourceX = 44,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0006
            x=138,
            y=294,
            width=112,
            height=176,

            sourceX = 30,
            sourceY = 32,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0007
            x=298,
            y=158,
            width=136,
            height=170,

            sourceX = 18,
            sourceY = 40,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0008
            x=0,
            y=0,
            width=154,
            height=164,

            sourceX = 12,
            sourceY = 46,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0009
            x=308,
            y=0,
            width=150,
            height=158,

            sourceX = 18,
            sourceY = 52,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0010
            x=154,
            y=144,
            width=144,
            height=150,

            sourceX = 28,
            sourceY = 60,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0011
            x=154,
            y=0,
            width=154,
            height=144,

            sourceX = 26,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0012
            x=0,
            y=164,
            width=138,
            height=140,

            sourceX = 32,
            sourceY = 70,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0013
            x=0,
            y=304,
            width=106,
            height=120,

            sourceX = 40,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0014
            x=0,
            y=424,
            width=98,
            height=108,

            sourceX = 48,
            sourceY = 104,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0015
            x=292,
            y=328,
            width=86,
            height=106,

            sourceX = 60,
            sourceY = 114,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
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
