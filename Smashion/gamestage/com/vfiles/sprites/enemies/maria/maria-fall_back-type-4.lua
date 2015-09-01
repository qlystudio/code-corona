--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:df4b714ba4a5442e46b40f9dfa4cacf4$
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
            x=126,
            y=804,
            width=44,
            height=198,

            sourceX = 76,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0002
            x=72,
            y=804,
            width=54,
            height=196,

            sourceX = 74,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0003
            x=170,
            y=818,
            width=64,
            height=198,

            sourceX = 68,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0004
            x=170,
            y=626,
            width=66,
            height=192,

            sourceX = 60,
            sourceY = 20,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0005
            x=0,
            y=802,
            width=72,
            height=192,

            sourceX = 56,
            sourceY = 22,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0006
            x=0,
            y=614,
            width=78,
            height=188,

            sourceX = 52,
            sourceY = 26,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0007
            x=0,
            y=436,
            width=84,
            height=178,

            sourceX = 48,
            sourceY = 38,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0008
            x=78,
            y=626,
            width=92,
            height=178,

            sourceX = 44,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0009
            x=128,
            y=316,
            width=110,
            height=170,

            sourceX = 38,
            sourceY = 58,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0010
            x=130,
            y=150,
            width=120,
            height=166,

            sourceX = 28,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0011
            x=0,
            y=284,
            width=128,
            height=152,

            sourceX = 26,
            sourceY = 88,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0012
            x=132,
            y=0,
            width=124,
            height=150,

            sourceX = 36,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0013
            x=0,
            y=140,
            width=130,
            height=144,

            sourceX = 34,
            sourceY = 106,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0014
            x=0,
            y=0,
            width=132,
            height=140,

            sourceX = 32,
            sourceY = 112,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-away0015
            x=84,
            y=486,
            width=134,
            height=140,

            sourceX = 30,
            sourceY = 114,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 256,
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
