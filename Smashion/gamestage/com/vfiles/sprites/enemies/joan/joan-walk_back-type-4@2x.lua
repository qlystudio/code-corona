--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:7b830627cf472608b07b4a27703b9c51$
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
            -- joan-walk-away0001
            x=68,
            y=412,
            width=80,
            height=412,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0002
            x=68,
            y=0,
            width=92,
            height=412,

            sourceX = 156,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0003
            x=504,
            y=400,
            width=72,
            height=400,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0004
            x=448,
            y=0,
            width=72,
            height=400,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0005
            x=432,
            y=404,
            width=72,
            height=404,

            sourceX = 156,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0006
            x=364,
            y=408,
            width=68,
            height=408,

            sourceX = 156,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0007
            x=308,
            y=0,
            width=68,
            height=408,

            sourceX = 156,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0008
            x=0,
            y=428,
            width=68,
            height=424,

            sourceX = 156,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0009
            x=0,
            y=0,
            width=68,
            height=428,

            sourceX = 156,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0010
            x=224,
            y=412,
            width=68,
            height=412,

            sourceX = 152,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0011
            x=376,
            y=0,
            width=72,
            height=404,

            sourceX = 148,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0012
            x=292,
            y=408,
            width=72,
            height=408,

            sourceX = 152,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0013
            x=236,
            y=0,
            width=72,
            height=408,

            sourceX = 160,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0014
            x=160,
            y=0,
            width=76,
            height=412,

            sourceX = 160,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0015
            x=148,
            y=412,
            width=76,
            height=412,

            sourceX = 164,
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

    ["joan-walk-away0001"] = 1,
    ["joan-walk-away0002"] = 2,
    ["joan-walk-away0003"] = 3,
    ["joan-walk-away0004"] = 4,
    ["joan-walk-away0005"] = 5,
    ["joan-walk-away0006"] = 6,
    ["joan-walk-away0007"] = 7,
    ["joan-walk-away0008"] = 8,
    ["joan-walk-away0009"] = 9,
    ["joan-walk-away0010"] = 10,
    ["joan-walk-away0011"] = 11,
    ["joan-walk-away0012"] = 12,
    ["joan-walk-away0013"] = 13,
    ["joan-walk-away0014"] = 14,
    ["joan-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
