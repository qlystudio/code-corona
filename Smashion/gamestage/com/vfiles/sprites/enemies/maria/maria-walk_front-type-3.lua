--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:aeb5b30c254d870d4ea843cfe2ed4c2c$
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
            x=142,
            y=0,
            width=48,
            height=196,

            sourceX = 74,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0002
            x=0,
            y=198,
            width=48,
            height=198,

            sourceX = 74,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0003
            x=0,
            y=0,
            width=48,
            height=198,

            sourceX = 74,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0004
            x=92,
            y=0,
            width=50,
            height=196,

            sourceX = 74,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0005
            x=128,
            y=196,
            width=48,
            height=196,

            sourceX = 76,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0006
            x=246,
            y=192,
            width=44,
            height=192,

            sourceX = 76,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0007
            x=88,
            y=198,
            width=40,
            height=198,

            sourceX = 76,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0008
            x=48,
            y=198,
            width=40,
            height=198,

            sourceX = 76,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0009
            x=48,
            y=0,
            width=44,
            height=198,

            sourceX = 74,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0010
            x=238,
            y=0,
            width=44,
            height=192,

            sourceX = 74,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0011
            x=176,
            y=196,
            width=70,
            height=192,

            sourceX = 74,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0012
            x=190,
            y=0,
            width=48,
            height=192,

            sourceX = 74,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0013
            x=330,
            y=0,
            width=48,
            height=188,

            sourceX = 74,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0014
            x=290,
            y=190,
            width=48,
            height=188,

            sourceX = 74,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- maria-walk-forward0015
            x=282,
            y=0,
            width=48,
            height=190,

            sourceX = 74,
            sourceY = 14,
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
