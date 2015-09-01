--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:fe0b7138eb07a2f1a140166cc2b1ffd9$
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
            -- maria-walk-forward0001
            x=146,
            y=0,
            width=52,
            height=200,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0002
            x=0,
            y=0,
            width=54,
            height=204,

            sourceX = 72,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0003
            x=140,
            y=202,
            width=50,
            height=202,

            sourceX = 74,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0004
            x=88,
            y=204,
            width=52,
            height=202,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0005
            x=96,
            y=0,
            width=50,
            height=202,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0006
            x=262,
            y=198,
            width=48,
            height=198,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0007
            x=44,
            y=204,
            width=44,
            height=204,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0008
            x=54,
            y=0,
            width=42,
            height=204,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0009
            x=0,
            y=204,
            width=44,
            height=204,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0010
            x=248,
            y=0,
            width=48,
            height=198,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0011
            x=190,
            y=200,
            width=72,
            height=198,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0012
            x=198,
            y=0,
            width=50,
            height=198,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0013
            x=296,
            y=0,
            width=54,
            height=194,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0014
            x=350,
            y=0,
            width=50,
            height=192,

            sourceX = 74,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0015
            x=400,
            y=0,
            width=48,
            height=194,

            sourceX = 74,
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

    ["maria-walk-forward0001"] = 1,
    ["maria-walk-forward0002"] = 2,
    ["maria-walk-forward0003"] = 3,
    ["maria-walk-forward0004"] = 4,
    ["maria-walk-forward0005"] = 5,
    ["maria-walk-forward0006"] = 6,
    ["maria-walk-forward0007"] = 7,
    ["maria-walk-forward0008"] = 8,
    ["maria-walk-forward0009"] = 9,
    ["maria-walk-forward0010"] = 10,
    ["maria-walk-forward0011"] = 11,
    ["maria-walk-forward0012"] = 12,
    ["maria-walk-forward0013"] = 13,
    ["maria-walk-forward0014"] = 14,
    ["maria-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
