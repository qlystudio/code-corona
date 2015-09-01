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
            x=50,
            y=196,
            width=50,
            height=196,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0002
            x=50,
            y=0,
            width=50,
            height=196,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0003
            x=0,
            y=196,
            width=50,
            height=196,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0004
            x=0,
            y=0,
            width=50,
            height=196,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0005
            x=100,
            y=172,
            width=58,
            height=194,

            sourceX = 66,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0006
            x=158,
            y=172,
            width=92,
            height=182,

            sourceX = 52,
            sourceY = 24,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0007
            x=100,
            y=0,
            width=124,
            height=172,

            sourceX = 36,
            sourceY = 34,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0008
            x=168,
            y=354,
            width=120,
            height=158,

            sourceX = 38,
            sourceY = 52,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0009
            x=224,
            y=0,
            width=88,
            height=152,

            sourceX = 44,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0010
            x=100,
            y=366,
            width=68,
            height=142,

            sourceX = 62,
            sourceY = 78,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0011
            x=390,
            y=122,
            width=84,
            height=122,

            sourceX = 58,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0012
            x=390,
            y=0,
            width=84,
            height=122,

            sourceX = 58,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0013
            x=288,
            y=286,
            width=80,
            height=128,

            sourceX = 60,
            sourceY = 94,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0014
            x=312,
            y=0,
            width=78,
            height=130,

            sourceX = 58,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0015
            x=250,
            y=152,
            width=78,
            height=134,

            sourceX = 56,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
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
