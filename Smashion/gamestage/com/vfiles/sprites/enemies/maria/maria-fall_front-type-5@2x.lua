--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:8378da132dabdfbba3b16384ea490638$
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
            -- maria-fall-forward0001
            x=92,
            y=384,
            width=92,
            height=384,

            sourceX = 148,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0002
            x=92,
            y=0,
            width=92,
            height=384,

            sourceX = 148,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0003
            x=0,
            y=384,
            width=92,
            height=384,

            sourceX = 148,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0004
            x=0,
            y=0,
            width=92,
            height=384,

            sourceX = 148,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0005
            x=184,
            y=0,
            width=116,
            height=376,

            sourceX = 132,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0006
            x=184,
            y=376,
            width=184,
            height=356,

            sourceX = 104,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0007
            x=300,
            y=0,
            width=248,
            height=332,

            sourceX = 72,
            sourceY = 80,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0008
            x=368,
            y=332,
            width=240,
            height=304,

            sourceX = 76,
            sourceY = 116,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0009
            x=316,
            y=732,
            width=176,
            height=292,

            sourceX = 88,
            sourceY = 144,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0010
            x=548,
            y=0,
            width=136,
            height=272,

            sourceX = 124,
            sourceY = 168,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0011
            x=684,
            y=0,
            width=168,
            height=232,

            sourceX = 116,
            sourceY = 204,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0012
            x=608,
            y=272,
            width=168,
            height=232,

            sourceX = 116,
            sourceY = 204,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0013
            x=156,
            y=768,
            width=160,
            height=244,

            sourceX = 120,
            sourceY = 200,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0014
            x=0,
            y=768,
            width=156,
            height=252,

            sourceX = 116,
            sourceY = 200,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0015
            x=492,
            y=636,
            width=156,
            height=260,

            sourceX = 112,
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

    ["maria-fall-forward0001"] = 1,
    ["maria-fall-forward0002"] = 2,
    ["maria-fall-forward0003"] = 3,
    ["maria-fall-forward0004"] = 4,
    ["maria-fall-forward0005"] = 5,
    ["maria-fall-forward0006"] = 6,
    ["maria-fall-forward0007"] = 7,
    ["maria-fall-forward0008"] = 8,
    ["maria-fall-forward0009"] = 9,
    ["maria-fall-forward0010"] = 10,
    ["maria-fall-forward0011"] = 11,
    ["maria-fall-forward0012"] = 12,
    ["maria-fall-forward0013"] = 13,
    ["maria-fall-forward0014"] = 14,
    ["maria-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
