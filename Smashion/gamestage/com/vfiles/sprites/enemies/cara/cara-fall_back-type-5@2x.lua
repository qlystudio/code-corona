--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e4c303bdf04286bdabc86f016e8682ac$
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
            -- cara-fall-away0001
            x=0,
            y=380,
            width=84,
            height=376,

            sourceX = 152,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0002
            x=0,
            y=0,
            width=104,
            height=380,

            sourceX = 148,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0003
            x=84,
            y=380,
            width=120,
            height=372,

            sourceX = 136,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0004
            x=104,
            y=0,
            width=132,
            height=368,

            sourceX = 124,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0005
            x=204,
            y=368,
            width=148,
            height=364,

            sourceX = 116,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0006
            x=236,
            y=0,
            width=156,
            height=348,

            sourceX = 112,
            sourceY = 52,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0007
            x=352,
            y=348,
            width=168,
            height=336,

            sourceX = 100,
            sourceY = 68,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0008
            x=392,
            y=0,
            width=180,
            height=328,

            sourceX = 92,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0009
            x=520,
            y=328,
            width=200,
            height=312,

            sourceX = 84,
            sourceY = 116,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0010
            x=572,
            y=0,
            width=220,
            height=304,

            sourceX = 64,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0011
            x=328,
            y=732,
            width=240,
            height=292,

            sourceX = 60,
            sourceY = 156,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0012
            x=792,
            y=0,
            width=228,
            height=284,

            sourceX = 80,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0013
            x=720,
            y=580,
            width=236,
            height=276,

            sourceX = 76,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0014
            x=720,
            y=304,
            width=236,
            height=276,

            sourceX = 76,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0015
            x=84,
            y=752,
            width=244,
            height=272,

            sourceX = 68,
            sourceY = 200,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["cara-fall-away0001"] = 1,
    ["cara-fall-away0002"] = 2,
    ["cara-fall-away0003"] = 3,
    ["cara-fall-away0004"] = 4,
    ["cara-fall-away0005"] = 5,
    ["cara-fall-away0006"] = 6,
    ["cara-fall-away0007"] = 7,
    ["cara-fall-away0008"] = 8,
    ["cara-fall-away0009"] = 9,
    ["cara-fall-away0010"] = 10,
    ["cara-fall-away0011"] = 11,
    ["cara-fall-away0012"] = 12,
    ["cara-fall-away0013"] = 13,
    ["cara-fall-away0014"] = 14,
    ["cara-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
