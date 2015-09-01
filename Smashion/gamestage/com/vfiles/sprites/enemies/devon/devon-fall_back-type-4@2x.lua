--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:bf82e67613d242f824869856cd67bb28$
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
            -- devon-fall-away0001
            x=0,
            y=0,
            width=80,
            height=396,

            sourceX = 144,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0002
            x=0,
            y=396,
            width=100,
            height=392,

            sourceX = 120,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0003
            x=80,
            y=0,
            width=116,
            height=388,

            sourceX = 104,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0004
            x=100,
            y=388,
            width=108,
            height=384,

            sourceX = 116,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0005
            x=196,
            y=0,
            width=160,
            height=364,

            sourceX = 88,
            sourceY = 48,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0006
            x=356,
            y=0,
            width=212,
            height=332,

            sourceX = 60,
            sourceY = 80,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0007
            x=460,
            y=332,
            width=228,
            height=328,

            sourceX = 36,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0008
            x=208,
            y=364,
            width=252,
            height=336,

            sourceX = 24,
            sourceY = 80,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0009
            x=208,
            y=700,
            width=240,
            height=324,

            sourceX = 36,
            sourceY = 96,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0010
            x=448,
            y=700,
            width=224,
            height=296,

            sourceX = 56,
            sourceY = 120,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0011
            x=568,
            y=0,
            width=228,
            height=288,

            sourceX = 52,
            sourceY = 128,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0012
            x=796,
            y=0,
            width=220,
            height=284,

            sourceX = 64,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0013
            x=0,
            y=788,
            width=208,
            height=232,

            sourceX = 80,
            sourceY = 188,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0014
            x=796,
            y=284,
            width=192,
            height=212,

            sourceX = 96,
            sourceY = 208,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-away0015
            x=688,
            y=496,
            width=172,
            height=184,

            sourceX = 116,
            sourceY = 236,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["devon-fall-away0001"] = 1,
    ["devon-fall-away0002"] = 2,
    ["devon-fall-away0003"] = 3,
    ["devon-fall-away0004"] = 4,
    ["devon-fall-away0005"] = 5,
    ["devon-fall-away0006"] = 6,
    ["devon-fall-away0007"] = 7,
    ["devon-fall-away0008"] = 8,
    ["devon-fall-away0009"] = 9,
    ["devon-fall-away0010"] = 10,
    ["devon-fall-away0011"] = 11,
    ["devon-fall-away0012"] = 12,
    ["devon-fall-away0013"] = 13,
    ["devon-fall-away0014"] = 14,
    ["devon-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
