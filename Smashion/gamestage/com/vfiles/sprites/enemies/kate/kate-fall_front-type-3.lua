--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:32194ec95518679feac497834874c7bd$
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
            -- kate-fall-forward0001
            x=96,
            y=200,
            width=48,
            height=200,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0002
            x=56,
            y=0,
            width=48,
            height=200,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0003
            x=48,
            y=200,
            width=48,
            height=200,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0004
            x=0,
            y=200,
            width=48,
            height=200,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0005
            x=0,
            y=0,
            width=56,
            height=200,

            sourceX = 68,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0006
            x=104,
            y=0,
            width=92,
            height=188,

            sourceX = 54,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0007
            x=144,
            y=188,
            width=124,
            height=176,

            sourceX = 38,
            sourceY = 30,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0008
            x=196,
            y=0,
            width=120,
            height=162,

            sourceX = 40,
            sourceY = 48,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0009
            x=268,
            y=162,
            width=86,
            height=154,

            sourceX = 46,
            sourceY = 64,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0010
            x=144,
            y=364,
            width=70,
            height=146,

            sourceX = 62,
            sourceY = 74,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0011
            x=394,
            y=126,
            width=84,
            height=126,

            sourceX = 58,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0012
            x=394,
            y=0,
            width=84,
            height=126,

            sourceX = 58,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0013
            x=294,
            y=316,
            width=78,
            height=132,

            sourceX = 62,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0014
            x=316,
            y=0,
            width=78,
            height=132,

            sourceX = 62,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-forward0015
            x=214,
            y=364,
            width=80,
            height=136,

            sourceX = 58,
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

    ["kate-fall-forward0001"] = 1,
    ["kate-fall-forward0002"] = 2,
    ["kate-fall-forward0003"] = 3,
    ["kate-fall-forward0004"] = 4,
    ["kate-fall-forward0005"] = 5,
    ["kate-fall-forward0006"] = 6,
    ["kate-fall-forward0007"] = 7,
    ["kate-fall-forward0008"] = 8,
    ["kate-fall-forward0009"] = 9,
    ["kate-fall-forward0010"] = 10,
    ["kate-fall-forward0011"] = 11,
    ["kate-fall-forward0012"] = 12,
    ["kate-fall-forward0013"] = 13,
    ["kate-fall-forward0014"] = 14,
    ["kate-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
