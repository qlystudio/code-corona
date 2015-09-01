--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:3aa13ccf46877566c67e432065d3c75b$
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
            x=144,
            y=202,
            width=48,
            height=202,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0002
            x=48,
            y=0,
            width=48,
            height=206,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0003
            x=0,
            y=206,
            width=48,
            height=206,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0004
            x=48,
            y=206,
            width=48,
            height=204,

            sourceX = 74,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0005
            x=230,
            y=0,
            width=44,
            height=202,

            sourceX = 76,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0006
            x=322,
            y=0,
            width=42,
            height=196,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0007
            x=96,
            y=0,
            width=42,
            height=204,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0008
            x=192,
            y=202,
            width=44,
            height=202,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0009
            x=186,
            y=0,
            width=44,
            height=202,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0010
            x=138,
            y=0,
            width=48,
            height=202,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0011
            x=236,
            y=202,
            width=52,
            height=200,

            sourceX = 72,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0012
            x=288,
            y=198,
            width=48,
            height=198,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0013
            x=274,
            y=0,
            width=48,
            height=198,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-forward0014
            x=96,
            y=204,
            width=48,
            height=202,

            sourceX = 74,
            sourceY = 6,
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
            sourceY = 4,
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
