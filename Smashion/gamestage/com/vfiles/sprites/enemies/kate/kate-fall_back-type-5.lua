--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9e380d055df014f6e885df68cc010cba$
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
            -- kate-fall-away0001
            x=466,
            y=184,
            width=46,
            height=204,

            sourceX = 74,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0002
            x=208,
            y=308,
            width=56,
            height=206,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0003
            x=338,
            y=370,
            width=68,
            height=202,

            sourceX = 64,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0004
            x=0,
            y=458,
            width=70,
            height=202,

            sourceX = 58,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0005
            x=264,
            y=334,
            width=74,
            height=198,

            sourceX = 54,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0006
            x=126,
            y=308,
            width=82,
            height=194,

            sourceX = 50,
            sourceY = 22,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0007
            x=376,
            y=184,
            width=90,
            height=186,

            sourceX = 44,
            sourceY = 32,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0008
            x=402,
            y=0,
            width=96,
            height=184,

            sourceX = 40,
            sourceY = 40,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0009
            x=264,
            y=158,
            width=112,
            height=176,

            sourceX = 36,
            sourceY = 54,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0010
            x=0,
            y=290,
            width=126,
            height=168,

            sourceX = 24,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0011
            x=270,
            y=0,
            width=132,
            height=158,

            sourceX = 22,
            sourceY = 84,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0012
            x=134,
            y=150,
            width=130,
            height=158,

            sourceX = 32,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0013
            x=136,
            y=0,
            width=134,
            height=150,

            sourceX = 30,
            sourceY = 102,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0014
            x=0,
            y=144,
            width=134,
            height=146,

            sourceX = 30,
            sourceY = 108,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-fall-away0015
            x=0,
            y=0,
            width=136,
            height=144,

            sourceX = 28,
            sourceY = 112,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["kate-fall-away0001"] = 1,
    ["kate-fall-away0002"] = 2,
    ["kate-fall-away0003"] = 3,
    ["kate-fall-away0004"] = 4,
    ["kate-fall-away0005"] = 5,
    ["kate-fall-away0006"] = 6,
    ["kate-fall-away0007"] = 7,
    ["kate-fall-away0008"] = 8,
    ["kate-fall-away0009"] = 9,
    ["kate-fall-away0010"] = 10,
    ["kate-fall-away0011"] = 11,
    ["kate-fall-away0012"] = 12,
    ["kate-fall-away0013"] = 13,
    ["kate-fall-away0014"] = 14,
    ["kate-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
