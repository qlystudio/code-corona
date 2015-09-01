--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4ffc0485560fa7af095d0b81038791bf$
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
            x=116,
            y=400,
            width=104,
            height=400,

            sourceX = 144,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0002
            x=116,
            y=0,
            width=104,
            height=400,

            sourceX = 144,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0003
            x=0,
            y=400,
            width=116,
            height=400,

            sourceX = 136,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0004
            x=0,
            y=0,
            width=116,
            height=400,

            sourceX = 136,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0005
            x=220,
            y=344,
            width=128,
            height=388,

            sourceX = 132,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0006
            x=348,
            y=344,
            width=184,
            height=364,

            sourceX = 104,
            sourceY = 60,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0007
            x=220,
            y=0,
            width=252,
            height=344,

            sourceX = 68,
            sourceY = 84,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0008
            x=368,
            y=708,
            width=240,
            height=316,

            sourceX = 76,
            sourceY = 120,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0009
            x=472,
            y=0,
            width=180,
            height=300,

            sourceX = 88,
            sourceY = 148,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0010
            x=220,
            y=732,
            width=148,
            height=280,

            sourceX = 116,
            sourceY = 172,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0011
            x=816,
            y=244,
            width=172,
            height=244,

            sourceX = 112,
            sourceY = 204,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0012
            x=816,
            y=0,
            width=172,
            height=244,

            sourceX = 112,
            sourceY = 204,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0013
            x=692,
            y=488,
            width=164,
            height=252,

            sourceX = 116,
            sourceY = 204,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0014
            x=652,
            y=0,
            width=164,
            height=252,

            sourceX = 116,
            sourceY = 204,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-forward0015
            x=532,
            y=300,
            width=160,
            height=264,

            sourceX = 112,
            sourceY = 204,
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
