--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d16fd937c2a1bdd474687d9346308e6b$
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
            -- lindsay-fall-forward0001
            x=0,
            y=0,
            width=164,
            height=212,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0002
            x=164,
            y=0,
            width=160,
            height=214,

            sourceX = 20,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0003
            x=0,
            y=212,
            width=158,
            height=214,

            sourceX = 22,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0004
            x=324,
            y=190,
            width=156,
            height=214,

            sourceX = 22,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0005
            x=314,
            y=404,
            width=154,
            height=212,

            sourceX = 24,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0006
            x=158,
            y=214,
            width=156,
            height=200,

            sourceX = 20,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0007
            x=324,
            y=0,
            width=158,
            height=190,

            sourceX = 20,
            sourceY = 24,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0008
            x=158,
            y=414,
            width=144,
            height=182,

            sourceX = 26,
            sourceY = 36,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0009
            x=0,
            y=578,
            width=128,
            height=180,

            sourceX = 36,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0010
            x=0,
            y=758,
            width=122,
            height=166,

            sourceX = 36,
            sourceY = 60,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0011
            x=220,
            y=750,
            width=100,
            height=156,

            sourceX = 46,
            sourceY = 68,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0012
            x=122,
            y=758,
            width=98,
            height=158,

            sourceX = 48,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0013
            x=320,
            y=616,
            width=122,
            height=154,

            sourceX = 36,
            sourceY = 74,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0014
            x=128,
            y=596,
            width=126,
            height=154,

            sourceX = 34,
            sourceY = 74,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-forward0015
            x=0,
            y=426,
            width=144,
            height=152,

            sourceX = 24,
            sourceY = 82,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["lindsay-fall-forward0001"] = 1,
    ["lindsay-fall-forward0002"] = 2,
    ["lindsay-fall-forward0003"] = 3,
    ["lindsay-fall-forward0004"] = 4,
    ["lindsay-fall-forward0005"] = 5,
    ["lindsay-fall-forward0006"] = 6,
    ["lindsay-fall-forward0007"] = 7,
    ["lindsay-fall-forward0008"] = 8,
    ["lindsay-fall-forward0009"] = 9,
    ["lindsay-fall-forward0010"] = 10,
    ["lindsay-fall-forward0011"] = 11,
    ["lindsay-fall-forward0012"] = 12,
    ["lindsay-fall-forward0013"] = 13,
    ["lindsay-fall-forward0014"] = 14,
    ["lindsay-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
