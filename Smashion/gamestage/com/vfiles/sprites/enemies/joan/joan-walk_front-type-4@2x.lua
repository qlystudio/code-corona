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
            width=68,
            height=416,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0002
            x=140,
            y=0,
            width=68,
            height=412,

            sourceX = 168,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0003
            x=340,
            y=0,
            width=72,
            height=408,

            sourceX = 164,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0004
            x=480,
            y=0,
            width=72,
            height=404,

            sourceX = 164,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0005
            x=680,
            y=0,
            width=68,
            height=400,

            sourceX = 156,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0006
            x=812,
            y=0,
            width=68,
            height=396,

            sourceX = 152,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0007
            x=880,
            y=0,
            width=72,
            height=392,

            sourceX = 148,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0008
            x=68,
            y=0,
            width=72,
            height=412,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0009
            x=268,
            y=0,
            width=72,
            height=408,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0010
            x=412,
            y=0,
            width=68,
            height=408,

            sourceX = 152,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0011
            x=552,
            y=0,
            width=68,
            height=404,

            sourceX = 152,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0012
            x=620,
            y=0,
            width=60,
            height=404,

            sourceX = 160,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0013
            x=952,
            y=0,
            width=64,
            height=392,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0014
            x=748,
            y=0,
            width=64,
            height=400,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0015
            x=208,
            y=0,
            width=60,
            height=412,

            sourceX = 168,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
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
