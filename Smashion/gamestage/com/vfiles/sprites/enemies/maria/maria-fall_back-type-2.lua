--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:1499540ab8ce3b5bce6a30171b006ba5$
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
            -- maria-fall-away0001
            x=450,
            y=174,
            width=50,
            height=202,

            sourceX = 74,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0002
            x=360,
            y=366,
            width=66,
            height=202,

            sourceX = 72,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0003
            x=426,
            y=376,
            width=64,
            height=202,

            sourceX = 68,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0004
            x=292,
            y=316,
            width=68,
            height=198,

            sourceX = 60,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0005
            x=220,
            y=316,
            width=72,
            height=198,

            sourceX = 56,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0006
            x=372,
            y=174,
            width=78,
            height=192,

            sourceX = 52,
            sourceY = 22,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0007
            x=0,
            y=300,
            width=84,
            height=182,

            sourceX = 48,
            sourceY = 34,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0008
            x=128,
            y=298,
            width=92,
            height=182,

            sourceX = 44,
            sourceY = 40,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0009
            x=396,
            y=0,
            width=110,
            height=174,

            sourceX = 38,
            sourceY = 54,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0010
            x=252,
            y=148,
            width=120,
            height=168,

            sourceX = 28,
            sourceY = 64,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0011
            x=0,
            y=144,
            width=128,
            height=156,

            sourceX = 26,
            sourceY = 84,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0012
            x=128,
            y=144,
            width=124,
            height=154,

            sourceX = 36,
            sourceY = 94,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0013
            x=266,
            y=0,
            width=130,
            height=148,

            sourceX = 34,
            sourceY = 102,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0014
            x=134,
            y=0,
            width=132,
            height=144,

            sourceX = 32,
            sourceY = 108,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0015
            x=0,
            y=0,
            width=134,
            height=144,

            sourceX = 30,
            sourceY = 110,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["maria-fall-away0001"] = 1,
    ["maria-fall-away0002"] = 2,
    ["maria-fall-away0003"] = 3,
    ["maria-fall-away0004"] = 4,
    ["maria-fall-away0005"] = 5,
    ["maria-fall-away0006"] = 6,
    ["maria-fall-away0007"] = 7,
    ["maria-fall-away0008"] = 8,
    ["maria-fall-away0009"] = 9,
    ["maria-fall-away0010"] = 10,
    ["maria-fall-away0011"] = 11,
    ["maria-fall-away0012"] = 12,
    ["maria-fall-away0013"] = 13,
    ["maria-fall-away0014"] = 14,
    ["maria-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
