--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c407761a2d20e416695cd83113081fd1$
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
            -- alek-fall-away0001
            x=224,
            y=332,
            width=80,
            height=396,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0002
            x=120,
            y=396,
            width=104,
            height=396,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0003
            x=120,
            y=0,
            width=104,
            height=396,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0004
            x=0,
            y=396,
            width=120,
            height=396,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0005
            x=0,
            y=0,
            width=120,
            height=396,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0006
            x=304,
            y=332,
            width=112,
            height=392,

            sourceX = 156,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0007
            x=416,
            y=332,
            width=156,
            height=364,

            sourceX = 140,
            sourceY = 44,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0008
            x=572,
            y=316,
            width=208,
            height=340,

            sourceX = 116,
            sourceY = 72,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0009
            x=444,
            y=696,
            width=224,
            height=328,

            sourceX = 120,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0010
            x=224,
            y=0,
            width=248,
            height=332,

            sourceX = 108,
            sourceY = 84,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0011
            x=472,
            y=0,
            width=236,
            height=316,

            sourceX = 108,
            sourceY = 100,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0012
            x=224,
            y=728,
            width=220,
            height=292,

            sourceX = 104,
            sourceY = 124,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0013
            x=780,
            y=0,
            width=224,
            height=288,

            sourceX = 104,
            sourceY = 128,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0014
            x=780,
            y=288,
            width=224,
            height=284,

            sourceX = 96,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0015
            x=0,
            y=792,
            width=208,
            height=232,

            sourceX = 92,
            sourceY = 188,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["alek-fall-away0001"] = 1,
    ["alek-fall-away0002"] = 2,
    ["alek-fall-away0003"] = 3,
    ["alek-fall-away0004"] = 4,
    ["alek-fall-away0005"] = 5,
    ["alek-fall-away0006"] = 6,
    ["alek-fall-away0007"] = 7,
    ["alek-fall-away0008"] = 8,
    ["alek-fall-away0009"] = 9,
    ["alek-fall-away0010"] = 10,
    ["alek-fall-away0011"] = 11,
    ["alek-fall-away0012"] = 12,
    ["alek-fall-away0013"] = 13,
    ["alek-fall-away0014"] = 14,
    ["alek-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
