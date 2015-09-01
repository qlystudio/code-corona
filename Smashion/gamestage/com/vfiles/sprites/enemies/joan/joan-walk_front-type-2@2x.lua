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
            width=128,
            height=416,

            sourceX = 132,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0002
            x=128,
            y=0,
            width=128,
            height=412,

            sourceX = 132,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0003
            x=256,
            y=0,
            width=128,
            height=408,

            sourceX = 132,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0004
            x=500,
            y=408,
            width=136,
            height=404,

            sourceX = 128,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0005
            x=752,
            y=0,
            width=136,
            height=400,

            sourceX = 128,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0006
            x=888,
            y=0,
            width=132,
            height=400,

            sourceX = 132,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0007
            x=752,
            y=400,
            width=128,
            height=392,

            sourceX = 132,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0008
            x=0,
            y=416,
            width=128,
            height=412,

            sourceX = 132,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0009
            x=252,
            y=412,
            width=124,
            height=412,

            sourceX = 132,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0010
            x=384,
            y=0,
            width=124,
            height=408,

            sourceX = 132,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0011
            x=508,
            y=0,
            width=124,
            height=404,

            sourceX = 132,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0012
            x=376,
            y=408,
            width=124,
            height=408,

            sourceX = 132,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0013
            x=880,
            y=400,
            width=124,
            height=396,

            sourceX = 132,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0014
            x=632,
            y=0,
            width=120,
            height=404,

            sourceX = 136,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0015
            x=128,
            y=412,
            width=124,
            height=412,

            sourceX = 132,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
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
