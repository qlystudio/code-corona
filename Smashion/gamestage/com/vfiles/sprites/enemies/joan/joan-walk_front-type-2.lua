--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:59faf072c6edd687215ae8b7a7f8f16d$
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
            -- joan-walk-forward0001
            x=0,
            y=0,
            width=64,
            height=208,

            sourceX = 66,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0002
            x=64,
            y=0,
            width=64,
            height=206,

            sourceX = 66,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0003
            x=128,
            y=0,
            width=64,
            height=204,

            sourceX = 66,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0004
            x=250,
            y=204,
            width=68,
            height=202,

            sourceX = 64,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0005
            x=376,
            y=0,
            width=68,
            height=200,

            sourceX = 64,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0006
            x=444,
            y=0,
            width=66,
            height=200,

            sourceX = 66,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0007
            x=376,
            y=200,
            width=64,
            height=196,

            sourceX = 66,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0008
            x=0,
            y=208,
            width=64,
            height=206,

            sourceX = 66,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0009
            x=126,
            y=206,
            width=62,
            height=206,

            sourceX = 66,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0010
            x=192,
            y=0,
            width=62,
            height=204,

            sourceX = 66,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0011
            x=254,
            y=0,
            width=62,
            height=202,

            sourceX = 66,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0012
            x=188,
            y=204,
            width=62,
            height=204,

            sourceX = 66,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0013
            x=440,
            y=200,
            width=62,
            height=198,

            sourceX = 66,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0014
            x=316,
            y=0,
            width=60,
            height=202,

            sourceX = 68,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0015
            x=64,
            y=206,
            width=62,
            height=206,

            sourceX = 66,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["joan-walk-forward0001"] = 1,
    ["joan-walk-forward0002"] = 2,
    ["joan-walk-forward0003"] = 3,
    ["joan-walk-forward0004"] = 4,
    ["joan-walk-forward0005"] = 5,
    ["joan-walk-forward0006"] = 6,
    ["joan-walk-forward0007"] = 7,
    ["joan-walk-forward0008"] = 8,
    ["joan-walk-forward0009"] = 9,
    ["joan-walk-forward0010"] = 10,
    ["joan-walk-forward0011"] = 11,
    ["joan-walk-forward0012"] = 12,
    ["joan-walk-forward0013"] = 13,
    ["joan-walk-forward0014"] = 14,
    ["joan-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
