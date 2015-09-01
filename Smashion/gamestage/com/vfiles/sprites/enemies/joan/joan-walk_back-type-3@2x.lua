--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c49877688faedb2ae530fa07982969ac$
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
            x=144,
            y=412,
            width=76,
            height=412,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0002
            x=68,
            y=0,
            width=92,
            height=412,

            sourceX = 28,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0003
            x=496,
            y=400,
            width=76,
            height=400,

            sourceX = 32,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0004
            x=448,
            y=0,
            width=76,
            height=400,

            sourceX = 32,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0005
            x=428,
            y=404,
            width=68,
            height=404,

            sourceX = 28,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0006
            x=364,
            y=408,
            width=64,
            height=408,

            sourceX = 28,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0007
            x=308,
            y=0,
            width=64,
            height=408,

            sourceX = 28,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0008
            x=0,
            y=428,
            width=68,
            height=424,

            sourceX = 24,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0009
            x=0,
            y=0,
            width=68,
            height=428,

            sourceX = 24,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0010
            x=220,
            y=412,
            width=72,
            height=412,

            sourceX = 20,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0011
            x=372,
            y=0,
            width=76,
            height=404,

            sourceX = 16,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0012
            x=232,
            y=0,
            width=76,
            height=408,

            sourceX = 20,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0013
            x=292,
            y=408,
            width=72,
            height=408,

            sourceX = 28,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0014
            x=68,
            y=412,
            width=76,
            height=412,

            sourceX = 28,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0015
            x=160,
            y=0,
            width=72,
            height=412,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 128,
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
