--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c27ac3460e1ea5a5d775505b7d8a8b78$
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
            x=46,
            y=192,
            width=46,
            height=192,

            sourceX = 74,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0002
            x=46,
            y=0,
            width=46,
            height=192,

            sourceX = 74,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0003
            x=0,
            y=192,
            width=46,
            height=192,

            sourceX = 74,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0004
            x=0,
            y=0,
            width=46,
            height=192,

            sourceX = 74,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0005
            x=92,
            y=0,
            width=58,
            height=188,

            sourceX = 66,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0006
            x=92,
            y=188,
            width=92,
            height=178,

            sourceX = 52,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0007
            x=150,
            y=0,
            width=124,
            height=166,

            sourceX = 36,
            sourceY = 40,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0008
            x=184,
            y=166,
            width=120,
            height=152,

            sourceX = 38,
            sourceY = 58,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0009
            x=158,
            y=366,
            width=88,
            height=146,

            sourceX = 44,
            sourceY = 72,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0010
            x=274,
            y=0,
            width=68,
            height=136,

            sourceX = 62,
            sourceY = 84,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0011
            x=342,
            y=0,
            width=84,
            height=116,

            sourceX = 58,
            sourceY = 102,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0012
            x=304,
            y=136,
            width=84,
            height=116,

            sourceX = 58,
            sourceY = 102,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0013
            x=78,
            y=384,
            width=80,
            height=122,

            sourceX = 60,
            sourceY = 100,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0014
            x=0,
            y=384,
            width=78,
            height=126,

            sourceX = 58,
            sourceY = 100,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-fall-forward0015
            x=246,
            y=318,
            width=78,
            height=130,

            sourceX = 56,
            sourceY = 100,
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
