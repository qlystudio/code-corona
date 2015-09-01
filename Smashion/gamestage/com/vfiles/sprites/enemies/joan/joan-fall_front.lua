--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4afdaf7a7fc7088793a2c130b3058a94$
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
            width=50,
            height=182,

            sourceX = 80,
            sourceY = 20,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0002
            x=0,
            y=182,
            width=58,
            height=172,

            sourceX = 80,
            sourceY = 26,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0003
            x=0,
            y=354,
            width=68,
            height=158,

            sourceX = 76,
            sourceY = 36,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0004
            x=50,
            y=0,
            width=74,
            height=142,

            sourceX = 72,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0005
            x=58,
            y=142,
            width=90,
            height=128,

            sourceX = 62,
            sourceY = 52,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0006
            x=148,
            y=128,
            width=106,
            height=112,

            sourceX = 42,
            sourceY = 70,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0007
            x=304,
            y=92,
            width=110,
            height=92,

            sourceX = 32,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0008
            x=304,
            y=0,
            width=110,
            height=92,

            sourceX = 32,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0009
            x=358,
            y=184,
            width=104,
            height=102,

            sourceX = 40,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0010
            x=254,
            y=184,
            width=104,
            height=102,

            sourceX = 40,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0011
            x=414,
            y=0,
            width=94,
            height=110,

            sourceX = 48,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0012
            x=210,
            y=0,
            width=94,
            height=110,

            sourceX = 48,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0013
            x=68,
            y=388,
            width=84,
            height=118,

            sourceX = 58,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0014
            x=68,
            y=270,
            width=84,
            height=118,

            sourceX = 58,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-forward0015
            x=124,
            y=0,
            width=86,
            height=128,

            sourceX = 56,
            sourceY = 90,
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
