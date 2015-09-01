--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4e04e58aad893acb5957ffe4797775eb$
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
            x=42,
            y=0,
            width=40,
            height=200,

            sourceX = 78,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0002
            x=212,
            y=194,
            width=40,
            height=192,

            sourceX = 78,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0003
            x=254,
            y=190,
            width=38,
            height=188,

            sourceX = 78,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0004
            x=294,
            y=186,
            width=52,
            height=182,

            sourceX = 78,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0005
            x=256,
            y=0,
            width=42,
            height=184,

            sourceX = 78,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0006
            x=214,
            y=0,
            width=40,
            height=188,

            sourceX = 78,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0007
            x=0,
            y=202,
            width=40,
            height=200,

            sourceX = 78,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0008
            x=0,
            y=0,
            width=40,
            height=200,

            sourceX = 78,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0009
            x=172,
            y=0,
            width=40,
            height=192,

            sourceX = 78,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0010
            x=128,
            y=0,
            width=42,
            height=194,

            sourceX = 76,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0011
            x=84,
            y=198,
            width=42,
            height=194,

            sourceX = 76,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0012
            x=170,
            y=196,
            width=40,
            height=192,

            sourceX = 76,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0013
            x=128,
            y=196,
            width=40,
            height=194,

            sourceX = 78,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0014
            x=84,
            y=0,
            width=42,
            height=196,

            sourceX = 76,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0015
            x=42,
            y=202,
            width=40,
            height=198,

            sourceX = 78,
            sourceY = 16,
            sourceWidth = 195,
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
