--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:2c3176a872ecd2a0ee7c1e332b2f94db$
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
            -- joan-fall-forward0001
            x=0,
            y=0,
            width=100,
            height=364,

            sourceX = 160,
            sourceY = 40,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0002
            x=0,
            y=364,
            width=116,
            height=344,

            sourceX = 160,
            sourceY = 52,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0003
            x=0,
            y=708,
            width=136,
            height=316,

            sourceX = 152,
            sourceY = 72,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0004
            x=100,
            y=0,
            width=148,
            height=284,

            sourceX = 144,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0005
            x=116,
            y=284,
            width=180,
            height=256,

            sourceX = 124,
            sourceY = 104,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0006
            x=296,
            y=256,
            width=212,
            height=224,

            sourceX = 84,
            sourceY = 140,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0007
            x=608,
            y=184,
            width=220,
            height=184,

            sourceX = 64,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0008
            x=608,
            y=0,
            width=220,
            height=184,

            sourceX = 64,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0009
            x=716,
            y=368,
            width=208,
            height=204,

            sourceX = 80,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0010
            x=508,
            y=368,
            width=208,
            height=204,

            sourceX = 80,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0011
            x=828,
            y=0,
            width=188,
            height=220,

            sourceX = 96,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0012
            x=420,
            y=0,
            width=188,
            height=220,

            sourceX = 96,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0013
            x=136,
            y=776,
            width=168,
            height=236,

            sourceX = 116,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0014
            x=136,
            y=540,
            width=168,
            height=236,

            sourceX = 116,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0015
            x=248,
            y=0,
            width=172,
            height=256,

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

    ["joan-fall-forward0001"] = 1,
    ["joan-fall-forward0002"] = 2,
    ["joan-fall-forward0003"] = 3,
    ["joan-fall-forward0004"] = 4,
    ["joan-fall-forward0005"] = 5,
    ["joan-fall-forward0006"] = 6,
    ["joan-fall-forward0007"] = 7,
    ["joan-fall-forward0008"] = 8,
    ["joan-fall-forward0009"] = 9,
    ["joan-fall-forward0010"] = 10,
    ["joan-fall-forward0011"] = 11,
    ["joan-fall-forward0012"] = 12,
    ["joan-fall-forward0013"] = 13,
    ["joan-fall-forward0014"] = 14,
    ["joan-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
