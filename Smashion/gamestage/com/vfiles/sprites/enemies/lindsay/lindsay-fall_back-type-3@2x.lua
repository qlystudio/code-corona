--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:5b62e389f732643a89a9b31aa861cc94$
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
            x=140,
            y=1456,
            width=104,
            height=428,

            sourceX = 140,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0002
            x=392,
            y=644,
            width=112,
            height=436,

            sourceX = 140,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0003
            x=244,
            y=1456,
            width=128,
            height=424,

            sourceX = 132,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0004
            x=0,
            y=1404,
            width=140,
            height=420,

            sourceX = 116,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0005
            x=160,
            y=1036,
            width=152,
            height=420,

            sourceX = 108,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0006
            x=0,
            y=996,
            width=160,
            height=408,

            sourceX = 100,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0007
            x=220,
            y=644,
            width=172,
            height=392,

            sourceX = 92,
            sourceY = 44,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0008
            x=508,
            y=336,
            width=184,
            height=392,

            sourceX = 84,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0009
            x=0,
            y=616,
            width=220,
            height=380,

            sourceX = 72,
            sourceY = 84,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0010
            x=784,
            y=0,
            width=240,
            height=364,

            sourceX = 52,
            sourceY = 104,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0011
            x=528,
            y=0,
            width=256,
            height=336,

            sourceX = 48,
            sourceY = 148,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0012
            x=260,
            y=316,
            width=248,
            height=328,

            sourceX = 68,
            sourceY = 172,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0013
            x=268,
            y=0,
            width=260,
            height=316,

            sourceX = 64,
            sourceY = 188,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0014
            x=0,
            y=304,
            width=260,
            height=312,

            sourceX = 64,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0015
            x=0,
            y=0,
            width=268,
            height=304,

            sourceX = 56,
            sourceY = 204,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
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
