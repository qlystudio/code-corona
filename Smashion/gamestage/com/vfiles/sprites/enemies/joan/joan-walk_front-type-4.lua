--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:589b71d272f97cbe2c05dcb27990e5d6$
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
            width=34,
            height=208,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0002
            x=70,
            y=0,
            width=34,
            height=206,

            sourceX = 84,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0003
            x=170,
            y=0,
            width=36,
            height=204,

            sourceX = 82,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0004
            x=240,
            y=0,
            width=36,
            height=202,

            sourceX = 82,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0005
            x=340,
            y=0,
            width=34,
            height=200,

            sourceX = 78,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0006
            x=406,
            y=0,
            width=34,
            height=198,

            sourceX = 76,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0007
            x=440,
            y=0,
            width=36,
            height=196,

            sourceX = 74,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0008
            x=34,
            y=0,
            width=36,
            height=206,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0009
            x=134,
            y=0,
            width=36,
            height=204,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0010
            x=206,
            y=0,
            width=34,
            height=204,

            sourceX = 76,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0011
            x=276,
            y=0,
            width=34,
            height=202,

            sourceX = 76,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0012
            x=310,
            y=0,
            width=30,
            height=202,

            sourceX = 80,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0013
            x=476,
            y=0,
            width=32,
            height=196,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0014
            x=374,
            y=0,
            width=32,
            height=200,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0015
            x=104,
            y=0,
            width=30,
            height=206,

            sourceX = 84,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 256
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
