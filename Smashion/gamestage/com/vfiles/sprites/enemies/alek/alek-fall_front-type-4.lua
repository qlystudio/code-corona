--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:b490278ae3e3ef4420352a3b035c770a$
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
            -- alek-fall-forward0001
            x=0,
            y=0,
            width=60,
            height=196,

            sourceX = 74,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0002
            x=52,
            y=196,
            width=52,
            height=186,

            sourceX = 82,
            sourceY = 20,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0003
            x=0,
            y=196,
            width=52,
            height=186,

            sourceX = 82,
            sourceY = 20,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0004
            x=104,
            y=174,
            width=58,
            height=174,

            sourceX = 82,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0005
            x=60,
            y=0,
            width=58,
            height=174,

            sourceX = 82,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0006
            x=162,
            y=160,
            width=72,
            height=160,

            sourceX = 76,
            sourceY = 38,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0007
            x=118,
            y=0,
            width=72,
            height=160,

            sourceX = 76,
            sourceY = 38,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0008
            x=190,
            y=0,
            width=80,
            height=142,

            sourceX = 70,
            sourceY = 48,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0009
            x=0,
            y=382,
            width=98,
            height=128,

            sourceX = 58,
            sourceY = 56,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0010
            x=98,
            y=382,
            width=114,
            height=108,

            sourceX = 38,
            sourceY = 76,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0011
            x=332,
            y=90,
            width=120,
            height=90,

            sourceX = 26,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0012
            x=332,
            y=0,
            width=120,
            height=90,

            sourceX = 26,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0013
            x=212,
            y=420,
            width=120,
            height=90,

            sourceX = 26,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0014
            x=234,
            y=180,
            width=112,
            height=100,

            sourceX = 34,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0015
            x=212,
            y=320,
            width=112,
            height=100,

            sourceX = 34,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["alek-fall-forward0001"] = 1,
    ["alek-fall-forward0002"] = 2,
    ["alek-fall-forward0003"] = 3,
    ["alek-fall-forward0004"] = 4,
    ["alek-fall-forward0005"] = 5,
    ["alek-fall-forward0006"] = 6,
    ["alek-fall-forward0007"] = 7,
    ["alek-fall-forward0008"] = 8,
    ["alek-fall-forward0009"] = 9,
    ["alek-fall-forward0010"] = 10,
    ["alek-fall-forward0011"] = 11,
    ["alek-fall-forward0012"] = 12,
    ["alek-fall-forward0013"] = 13,
    ["alek-fall-forward0014"] = 14,
    ["alek-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
