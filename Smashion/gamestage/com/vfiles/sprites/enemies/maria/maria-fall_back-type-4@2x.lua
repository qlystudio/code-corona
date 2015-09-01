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
            x=252,
            y=1608,
            width=88,
            height=396,

            sourceX = 152,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0002
            x=144,
            y=1608,
            width=108,
            height=392,

            sourceX = 148,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0003
            x=340,
            y=1636,
            width=128,
            height=396,

            sourceX = 136,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0004
            x=340,
            y=1252,
            width=132,
            height=384,

            sourceX = 120,
            sourceY = 40,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0005
            x=0,
            y=1604,
            width=144,
            height=384,

            sourceX = 112,
            sourceY = 44,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0006
            x=0,
            y=1228,
            width=156,
            height=376,

            sourceX = 104,
            sourceY = 52,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0007
            x=0,
            y=872,
            width=168,
            height=356,

            sourceX = 96,
            sourceY = 76,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0008
            x=156,
            y=1252,
            width=184,
            height=356,

            sourceX = 88,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0009
            x=256,
            y=632,
            width=220,
            height=340,

            sourceX = 76,
            sourceY = 116,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0010
            x=260,
            y=300,
            width=240,
            height=332,

            sourceX = 56,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0011
            x=0,
            y=568,
            width=256,
            height=304,

            sourceX = 52,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0012
            x=264,
            y=0,
            width=248,
            height=300,

            sourceX = 72,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0013
            x=0,
            y=280,
            width=260,
            height=288,

            sourceX = 68,
            sourceY = 212,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0014
            x=0,
            y=0,
            width=264,
            height=280,

            sourceX = 64,
            sourceY = 224,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0015
            x=168,
            y=972,
            width=268,
            height=280,

            sourceX = 60,
            sourceY = 228,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 2048
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
