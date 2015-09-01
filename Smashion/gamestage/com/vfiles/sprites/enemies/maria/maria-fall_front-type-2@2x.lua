--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:624ed83b4f537de3c4ab2d7287451bae$
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
            x=100,
            y=392,
            width=100,
            height=392,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0002
            x=100,
            y=0,
            width=100,
            height=392,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0003
            x=0,
            y=392,
            width=100,
            height=392,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0004
            x=0,
            y=0,
            width=100,
            height=392,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0005
            x=200,
            y=344,
            width=116,
            height=388,

            sourceX = 132,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0006
            x=316,
            y=344,
            width=184,
            height=364,

            sourceX = 104,
            sourceY = 48,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0007
            x=200,
            y=0,
            width=248,
            height=344,

            sourceX = 72,
            sourceY = 68,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0008
            x=336,
            y=708,
            width=240,
            height=316,

            sourceX = 76,
            sourceY = 104,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0009
            x=448,
            y=0,
            width=176,
            height=304,

            sourceX = 88,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0010
            x=200,
            y=732,
            width=136,
            height=284,

            sourceX = 124,
            sourceY = 156,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0011
            x=780,
            y=244,
            width=168,
            height=244,

            sourceX = 116,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0012
            x=780,
            y=0,
            width=168,
            height=244,

            sourceX = 116,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0013
            x=576,
            y=572,
            width=160,
            height=256,

            sourceX = 120,
            sourceY = 188,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0014
            x=624,
            y=0,
            width=156,
            height=260,

            sourceX = 116,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-fall-forward0015
            x=500,
            y=304,
            width=156,
            height=268,

            sourceX = 112,
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
