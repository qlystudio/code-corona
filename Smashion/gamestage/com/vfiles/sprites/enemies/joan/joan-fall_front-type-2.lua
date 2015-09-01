--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4f4209e0d01681e92037758ee65d00af$
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
            -- joan-fall-forward0001
            x=0,
            y=0,
            width=72,
            height=184,

            sourceX = 64,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0002
            x=0,
            y=184,
            width=92,
            height=174,

            sourceX = 52,
            sourceY = 24,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0003
            x=72,
            y=0,
            width=102,
            height=160,

            sourceX = 48,
            sourceY = 34,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0004
            x=0,
            y=358,
            width=94,
            height=142,

            sourceX = 52,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0005
            x=174,
            y=0,
            width=104,
            height=128,

            sourceX = 48,
            sourceY = 52,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0006
            x=216,
            y=362,
            width=108,
            height=112,

            sourceX = 42,
            sourceY = 70,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0007
            x=388,
            y=0,
            width=122,
            height=96,

            sourceX = 32,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0008
            x=94,
            y=414,
            width=122,
            height=96,

            sourceX = 32,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0009
            x=314,
            y=202,
            width=114,
            height=106,

            sourceX = 40,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0010
            x=388,
            y=96,
            width=114,
            height=106,

            sourceX = 40,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0011
            x=204,
            y=250,
            width=110,
            height=112,

            sourceX = 46,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0012
            x=278,
            y=0,
            width=110,
            height=112,

            sourceX = 46,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0013
            x=202,
            y=128,
            width=110,
            height=122,

            sourceX = 48,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0014
            x=94,
            y=292,
            width=110,
            height=122,

            sourceX = 48,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0015
            x=92,
            y=160,
            width=110,
            height=132,

            sourceX = 48,
            sourceY = 86,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["joan-fall-forward0001"] = 1,
    ["joan-fall-forward0002"] = 2,
    ["joan-fall-forward0003"] = 3,
    ["joan-fall-forward0004"] = 4,
    ["joan-fall-forward0005"] = 5,
    ["joan-fall-forward0006"] = 6,
    ["joan-fall-forward0007"] = 7,
    ["joan-fall-forward0008"] = 8,
    ["joan-fall-forward0009"] = 9,
    ["joan-fall-forward0010"] = 10,
    ["joan-fall-forward0011"] = 11,
    ["joan-fall-forward0012"] = 12,
    ["joan-fall-forward0013"] = 13,
    ["joan-fall-forward0014"] = 14,
    ["joan-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
