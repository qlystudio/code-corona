--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:fd93a4c0d811d42d1e8297e62a3359a4$
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
            y=196,
            width=50,
            height=196,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0002
            x=0,
            y=0,
            width=50,
            height=196,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0003
            x=50,
            y=188,
            width=60,
            height=188,

            sourceX = 68,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0004
            x=50,
            y=0,
            width=62,
            height=188,

            sourceX = 62,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0005
            x=110,
            y=188,
            width=66,
            height=184,

            sourceX = 58,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0006
            x=112,
            y=0,
            width=72,
            height=178,

            sourceX = 54,
            sourceY = 22,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0007
            x=176,
            y=178,
            width=78,
            height=170,

            sourceX = 50,
            sourceY = 32,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0008
            x=184,
            y=0,
            width=84,
            height=166,

            sourceX = 46,
            sourceY = 42,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0009
            x=232,
            y=348,
            width=100,
            height=158,

            sourceX = 42,
            sourceY = 56,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0010
            x=254,
            y=166,
            width=110,
            height=152,

            sourceX = 32,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0011
            x=268,
            y=0,
            width=118,
            height=146,

            sourceX = 30,
            sourceY = 78,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0012
            x=364,
            y=284,
            width=114,
            height=144,

            sourceX = 40,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0013
            x=386,
            y=142,
            width=118,
            height=142,

            sourceX = 38,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0014
            x=386,
            y=0,
            width=120,
            height=142,

            sourceX = 36,
            sourceY = 94,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-fall-away0015
            x=110,
            y=372,
            width=122,
            height=140,

            sourceX = 34,
            sourceY = 96,
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
