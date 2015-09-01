--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:73d55bf2f13664231cb127b2e8f372d7$
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
            x=54,
            y=196,
            width=54,
            height=186,

            sourceX = 80,
            sourceY = 20,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0003
            x=0,
            y=196,
            width=54,
            height=186,

            sourceX = 80,
            sourceY = 20,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0004
            x=108,
            y=174,
            width=60,
            height=174,

            sourceX = 80,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0005
            x=60,
            y=0,
            width=60,
            height=174,

            sourceX = 80,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0006
            x=120,
            y=0,
            width=74,
            height=160,

            sourceX = 74,
            sourceY = 38,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0007
            x=114,
            y=348,
            width=74,
            height=160,

            sourceX = 74,
            sourceY = 38,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0008
            x=168,
            y=160,
            width=82,
            height=144,

            sourceX = 68,
            sourceY = 48,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0009
            x=194,
            y=0,
            width=98,
            height=134,

            sourceX = 58,
            sourceY = 56,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0010
            x=0,
            y=382,
            width=114,
            height=114,

            sourceX = 38,
            sourceY = 76,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0011
            x=188,
            y=410,
            width=120,
            height=96,

            sourceX = 26,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0012
            x=292,
            y=96,
            width=120,
            height=96,

            sourceX = 26,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0013
            x=292,
            y=0,
            width=120,
            height=96,

            sourceX = 26,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0014
            x=250,
            y=192,
            width=114,
            height=106,

            sourceX = 32,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-forward0015
            x=188,
            y=304,
            width=114,
            height=106,

            sourceX = 32,
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
