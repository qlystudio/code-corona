--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f3cd90b7300f15062090aad92b764182$
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
            -- cara-walk-forward0001
            x=98,
            y=0,
            width=50,
            height=204,

            sourceX = 72,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0002
            x=0,
            y=206,
            width=48,
            height=206,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0003
            x=48,
            y=204,
            width=50,
            height=204,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0004
            x=192,
            y=198,
            width=48,
            height=198,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0005
            x=242,
            y=0,
            width=44,
            height=198,

            sourceX = 76,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0006
            x=286,
            y=196,
            width=42,
            height=196,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0007
            x=148,
            y=0,
            width=44,
            height=200,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0008
            x=146,
            y=204,
            width=46,
            height=200,

            sourceX = 72,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0009
            x=240,
            y=198,
            width=46,
            height=198,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0010
            x=98,
            y=204,
            width=48,
            height=200,

            sourceX = 72,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0011
            x=192,
            y=0,
            width=50,
            height=198,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0012
            x=328,
            y=196,
            width=48,
            height=192,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0013
            x=286,
            y=0,
            width=48,
            height=196,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0014
            x=48,
            y=0,
            width=50,
            height=204,

            sourceX = 72,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0015
            x=0,
            y=0,
            width=48,
            height=206,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["cara-walk-forward0001"] = 1,
    ["cara-walk-forward0002"] = 2,
    ["cara-walk-forward0003"] = 3,
    ["cara-walk-forward0004"] = 4,
    ["cara-walk-forward0005"] = 5,
    ["cara-walk-forward0006"] = 6,
    ["cara-walk-forward0007"] = 7,
    ["cara-walk-forward0008"] = 8,
    ["cara-walk-forward0009"] = 9,
    ["cara-walk-forward0010"] = 10,
    ["cara-walk-forward0011"] = 11,
    ["cara-walk-forward0012"] = 12,
    ["cara-walk-forward0013"] = 13,
    ["cara-walk-forward0014"] = 14,
    ["cara-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
