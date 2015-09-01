--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:8b2f31695c59c34d38fecfd5fa101f7b$
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
            width=44,
            height=204,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0002
            x=176,
            y=202,
            width=44,
            height=198,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0003
            x=266,
            y=190,
            width=40,
            height=194,

            sourceX = 78,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0004
            x=266,
            y=0,
            width=54,
            height=188,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0005
            x=308,
            y=190,
            width=44,
            height=190,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0006
            x=224,
            y=0,
            width=40,
            height=194,

            sourceX = 78,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0007
            x=0,
            y=208,
            width=42,
            height=206,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0008
            x=0,
            y=0,
            width=42,
            height=206,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0009
            x=222,
            y=200,
            width=42,
            height=198,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0010
            x=136,
            y=0,
            width=42,
            height=200,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0011
            x=132,
            y=202,
            width=42,
            height=200,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0012
            x=180,
            y=0,
            width=42,
            height=198,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0013
            x=90,
            y=0,
            width=44,
            height=200,

            sourceX = 74,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0014
            x=88,
            y=206,
            width=42,
            height=202,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-away0015
            x=44,
            y=206,
            width=42,
            height=204,

            sourceX = 76,
            sourceY = 10,
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
