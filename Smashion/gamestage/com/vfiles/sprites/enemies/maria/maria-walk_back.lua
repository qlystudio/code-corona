--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:353d8faaf9ed0433dc40b7b9d1e0d81d$
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
            -- maria-walk-away0001
            x=44,
            y=0,
            width=42,
            height=200,

            sourceX = 12,
            sourceY = 14,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0002
            x=212,
            y=194,
            width=40,
            height=192,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0003
            x=254,
            y=190,
            width=40,
            height=188,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0004
            x=296,
            y=186,
            width=52,
            height=182,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0005
            x=256,
            y=0,
            width=44,
            height=184,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0006
            x=214,
            y=0,
            width=40,
            height=188,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0007
            x=0,
            y=202,
            width=42,
            height=200,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0008
            x=0,
            y=0,
            width=42,
            height=200,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0009
            x=172,
            y=0,
            width=40,
            height=192,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0010
            x=130,
            y=0,
            width=40,
            height=194,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0011
            x=128,
            y=196,
            width=40,
            height=194,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0012
            x=170,
            y=196,
            width=40,
            height=192,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0013
            x=88,
            y=0,
            width=40,
            height=194,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0014
            x=86,
            y=202,
            width=40,
            height=196,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0015
            x=44,
            y=202,
            width=40,
            height=198,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 64,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["maria-walk-away0001"] = 1,
    ["maria-walk-away0002"] = 2,
    ["maria-walk-away0003"] = 3,
    ["maria-walk-away0004"] = 4,
    ["maria-walk-away0005"] = 5,
    ["maria-walk-away0006"] = 6,
    ["maria-walk-away0007"] = 7,
    ["maria-walk-away0008"] = 8,
    ["maria-walk-away0009"] = 9,
    ["maria-walk-away0010"] = 10,
    ["maria-walk-away0011"] = 11,
    ["maria-walk-away0012"] = 12,
    ["maria-walk-away0013"] = 13,
    ["maria-walk-away0014"] = 14,
    ["maria-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
