--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:34177507544185e5730d537776147c51$
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
            y=392,
            width=100,
            height=392,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0002
            x=0,
            y=0,
            width=100,
            height=392,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0003
            x=100,
            y=376,
            width=120,
            height=376,

            sourceX = 136,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0004
            x=100,
            y=0,
            width=124,
            height=376,

            sourceX = 124,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0005
            x=220,
            y=376,
            width=132,
            height=368,

            sourceX = 116,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0006
            x=224,
            y=0,
            width=144,
            height=356,

            sourceX = 108,
            sourceY = 44,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0007
            x=352,
            y=356,
            width=156,
            height=340,

            sourceX = 100,
            sourceY = 64,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0008
            x=368,
            y=0,
            width=168,
            height=332,

            sourceX = 92,
            sourceY = 84,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0009
            x=464,
            y=696,
            width=200,
            height=316,

            sourceX = 84,
            sourceY = 112,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0010
            x=508,
            y=332,
            width=220,
            height=304,

            sourceX = 64,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0011
            x=536,
            y=0,
            width=236,
            height=292,

            sourceX = 60,
            sourceY = 156,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0012
            x=728,
            y=568,
            width=228,
            height=288,

            sourceX = 80,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0013
            x=772,
            y=284,
            width=236,
            height=284,

            sourceX = 76,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0014
            x=772,
            y=0,
            width=240,
            height=284,

            sourceX = 72,
            sourceY = 188,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-away0015
            x=220,
            y=744,
            width=244,
            height=280,

            sourceX = 68,
            sourceY = 192,
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
