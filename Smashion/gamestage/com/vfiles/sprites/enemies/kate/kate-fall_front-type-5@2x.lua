--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c82fb82ad4464a239b0af184a601e50a$
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
            -- kate-fall-forward0001
            x=192,
            y=400,
            width=92,
            height=400,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0002
            x=116,
            y=0,
            width=92,
            height=400,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0003
            x=96,
            y=400,
            width=96,
            height=400,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0004
            x=0,
            y=400,
            width=96,
            height=400,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0005
            x=0,
            y=0,
            width=116,
            height=400,

            sourceX = 136,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0006
            x=208,
            y=0,
            width=184,
            height=376,

            sourceX = 108,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0007
            x=284,
            y=376,
            width=252,
            height=352,

            sourceX = 72,
            sourceY = 60,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0008
            x=392,
            y=0,
            width=244,
            height=324,

            sourceX = 76,
            sourceY = 96,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0009
            x=536,
            y=324,
            width=176,
            height=308,

            sourceX = 92,
            sourceY = 128,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0010
            x=284,
            y=728,
            width=140,
            height=292,

            sourceX = 124,
            sourceY = 148,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0011
            x=792,
            y=252,
            width=168,
            height=252,

            sourceX = 116,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0012
            x=792,
            y=0,
            width=168,
            height=252,

            sourceX = 116,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0013
            x=584,
            y=632,
            width=156,
            height=264,

            sourceX = 124,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0014
            x=636,
            y=0,
            width=156,
            height=264,

            sourceX = 124,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-forward0015
            x=424,
            y=728,
            width=160,
            height=272,

            sourceX = 116,
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

    ["kate-fall-forward0001"] = 1,
    ["kate-fall-forward0002"] = 2,
    ["kate-fall-forward0003"] = 3,
    ["kate-fall-forward0004"] = 4,
    ["kate-fall-forward0005"] = 5,
    ["kate-fall-forward0006"] = 6,
    ["kate-fall-forward0007"] = 7,
    ["kate-fall-forward0008"] = 8,
    ["kate-fall-forward0009"] = 9,
    ["kate-fall-forward0010"] = 10,
    ["kate-fall-forward0011"] = 11,
    ["kate-fall-forward0012"] = 12,
    ["kate-fall-forward0013"] = 13,
    ["kate-fall-forward0014"] = 14,
    ["kate-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
