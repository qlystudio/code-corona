--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:1f02e8d660d33754d7a53c39b53dbd49$
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
            -- lindsay-fall-away0001
            x=70,
            y=728,
            width=52,
            height=214,

            sourceX = 70,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0002
            x=196,
            y=322,
            width=56,
            height=218,

            sourceX = 70,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0003
            x=122,
            y=728,
            width=64,
            height=212,

            sourceX = 66,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0004
            x=0,
            y=702,
            width=70,
            height=210,

            sourceX = 58,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0005
            x=80,
            y=518,
            width=76,
            height=210,

            sourceX = 54,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0006
            x=0,
            y=498,
            width=80,
            height=204,

            sourceX = 50,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0007
            x=110,
            y=322,
            width=86,
            height=196,

            sourceX = 46,
            sourceY = 22,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0008
            x=254,
            y=168,
            width=92,
            height=196,

            sourceX = 42,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0009
            x=0,
            y=308,
            width=110,
            height=190,

            sourceX = 36,
            sourceY = 42,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0010
            x=392,
            y=0,
            width=120,
            height=182,

            sourceX = 26,
            sourceY = 52,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0011
            x=264,
            y=0,
            width=128,
            height=168,

            sourceX = 24,
            sourceY = 74,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0012
            x=130,
            y=158,
            width=124,
            height=164,

            sourceX = 34,
            sourceY = 86,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0013
            x=134,
            y=0,
            width=130,
            height=158,

            sourceX = 32,
            sourceY = 94,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0014
            x=0,
            y=152,
            width=130,
            height=156,

            sourceX = 32,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0015
            x=0,
            y=0,
            width=134,
            height=152,

            sourceX = 28,
            sourceY = 102,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["lindsay-fall-away0001"] = 1,
    ["lindsay-fall-away0002"] = 2,
    ["lindsay-fall-away0003"] = 3,
    ["lindsay-fall-away0004"] = 4,
    ["lindsay-fall-away0005"] = 5,
    ["lindsay-fall-away0006"] = 6,
    ["lindsay-fall-away0007"] = 7,
    ["lindsay-fall-away0008"] = 8,
    ["lindsay-fall-away0009"] = 9,
    ["lindsay-fall-away0010"] = 10,
    ["lindsay-fall-away0011"] = 11,
    ["lindsay-fall-away0012"] = 12,
    ["lindsay-fall-away0013"] = 13,
    ["lindsay-fall-away0014"] = 14,
    ["lindsay-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
