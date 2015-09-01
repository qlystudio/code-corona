--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:00cfe75283903490ee59636cbea3f4be$
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
            -- lindsay-fall-forward0001
            x=0,
            y=424,
            width=100,
            height=424,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0002
            x=0,
            y=0,
            width=100,
            height=424,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0003
            x=100,
            y=420,
            width=112,
            height=420,

            sourceX = 136,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0004
            x=100,
            y=0,
            width=112,
            height=420,

            sourceX = 136,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0005
            x=212,
            y=376,
            width=120,
            height=416,

            sourceX = 132,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0006
            x=332,
            y=376,
            width=184,
            height=392,

            sourceX = 104,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0007
            x=212,
            y=0,
            width=252,
            height=376,

            sourceX = 68,
            sourceY = 52,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0008
            x=464,
            y=0,
            width=240,
            height=348,

            sourceX = 76,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0009
            x=704,
            y=0,
            width=180,
            height=328,

            sourceX = 88,
            sourceY = 120,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0010
            x=884,
            y=0,
            width=140,
            height=304,

            sourceX = 120,
            sourceY = 148,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0011
            x=516,
            y=348,
            width=172,
            height=268,

            sourceX = 112,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0012
            x=704,
            y=328,
            width=172,
            height=268,

            sourceX = 112,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0013
            x=836,
            y=596,
            width=160,
            height=276,

            sourceX = 120,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0014
            x=676,
            y=616,
            width=160,
            height=276,

            sourceX = 120,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0015
            x=516,
            y=616,
            width=160,
            height=288,

            sourceX = 112,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["lindsay-fall-forward0001"] = 1,
    ["lindsay-fall-forward0002"] = 2,
    ["lindsay-fall-forward0003"] = 3,
    ["lindsay-fall-forward0004"] = 4,
    ["lindsay-fall-forward0005"] = 5,
    ["lindsay-fall-forward0006"] = 6,
    ["lindsay-fall-forward0007"] = 7,
    ["lindsay-fall-forward0008"] = 8,
    ["lindsay-fall-forward0009"] = 9,
    ["lindsay-fall-forward0010"] = 10,
    ["lindsay-fall-forward0011"] = 11,
    ["lindsay-fall-forward0012"] = 12,
    ["lindsay-fall-forward0013"] = 13,
    ["lindsay-fall-forward0014"] = 14,
    ["lindsay-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
