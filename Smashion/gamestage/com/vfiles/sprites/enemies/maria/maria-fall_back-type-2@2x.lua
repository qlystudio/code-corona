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
            x=900,
            y=348,
            width=100,
            height=404,

            sourceX = 148,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0002
            x=720,
            y=732,
            width=132,
            height=404,

            sourceX = 144,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0003
            x=852,
            y=752,
            width=128,
            height=404,

            sourceX = 136,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0004
            x=584,
            y=632,
            width=136,
            height=396,

            sourceX = 120,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0005
            x=440,
            y=632,
            width=144,
            height=396,

            sourceX = 112,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0006
            x=744,
            y=348,
            width=156,
            height=384,

            sourceX = 104,
            sourceY = 44,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0007
            x=0,
            y=600,
            width=168,
            height=364,

            sourceX = 96,
            sourceY = 68,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0008
            x=256,
            y=596,
            width=184,
            height=364,

            sourceX = 88,
            sourceY = 80,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0009
            x=792,
            y=0,
            width=220,
            height=348,

            sourceX = 76,
            sourceY = 108,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0010
            x=504,
            y=296,
            width=240,
            height=336,

            sourceX = 56,
            sourceY = 128,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0011
            x=0,
            y=288,
            width=256,
            height=312,

            sourceX = 52,
            sourceY = 168,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0012
            x=256,
            y=288,
            width=248,
            height=308,

            sourceX = 72,
            sourceY = 188,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0013
            x=532,
            y=0,
            width=260,
            height=296,

            sourceX = 68,
            sourceY = 204,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0014
            x=268,
            y=0,
            width=264,
            height=288,

            sourceX = 64,
            sourceY = 216,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-away0015
            x=0,
            y=0,
            width=268,
            height=288,

            sourceX = 60,
            sourceY = 220,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
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
