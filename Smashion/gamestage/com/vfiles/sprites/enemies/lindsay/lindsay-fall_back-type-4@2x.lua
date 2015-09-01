--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:bfbd5ce72b87587c568de5344c8213a1$
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
            x=504,
            y=676,
            width=104,
            height=404,

            sourceX = 140,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0002
            x=392,
            y=596,
            width=112,
            height=412,

            sourceX = 140,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0003
            x=692,
            y=336,
            width=128,
            height=400,

            sourceX = 132,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0004
            x=0,
            y=1300,
            width=140,
            height=396,

            sourceX = 116,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0005
            x=160,
            y=964,
            width=152,
            height=396,

            sourceX = 108,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0006
            x=0,
            y=916,
            width=160,
            height=384,

            sourceX = 100,
            sourceY = 48,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0007
            x=220,
            y=596,
            width=172,
            height=368,

            sourceX = 92,
            sourceY = 68,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0008
            x=508,
            y=312,
            width=184,
            height=364,

            sourceX = 84,
            sourceY = 84,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0009
            x=0,
            y=560,
            width=220,
            height=356,

            sourceX = 72,
            sourceY = 108,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0010
            x=784,
            y=0,
            width=240,
            height=336,

            sourceX = 52,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0011
            x=528,
            y=0,
            width=256,
            height=312,

            sourceX = 48,
            sourceY = 172,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0012
            x=260,
            y=292,
            width=248,
            height=304,

            sourceX = 68,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0013
            x=268,
            y=0,
            width=260,
            height=292,

            sourceX = 64,
            sourceY = 212,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0014
            x=0,
            y=276,
            width=260,
            height=284,

            sourceX = 64,
            sourceY = 224,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0015
            x=0,
            y=0,
            width=268,
            height=276,

            sourceX = 56,
            sourceY = 232,
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
