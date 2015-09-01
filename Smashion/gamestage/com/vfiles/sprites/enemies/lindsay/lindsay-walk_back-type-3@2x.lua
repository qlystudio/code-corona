--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:93ba802840a0367f8f3e4beabd429fad$
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
            -- lindsay-walk-away0001
            x=212,
            y=0,
            width=96,
            height=428,

            sourceX = 144,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0002
            x=600,
            y=412,
            width=96,
            height=416,

            sourceX = 144,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0003
            x=696,
            y=412,
            width=96,
            height=408,

            sourceX = 144,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0004
            x=400,
            y=0,
            width=108,
            height=396,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0005
            x=704,
            y=0,
            width=100,
            height=404,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0006
            x=600,
            y=0,
            width=104,
            height=412,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0007
            x=0,
            y=436,
            width=112,
            height=436,

            sourceX = 140,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0008
            x=0,
            y=0,
            width=112,
            height=436,

            sourceX = 140,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0009
            x=400,
            y=396,
            width=104,
            height=420,

            sourceX = 140,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0010
            x=308,
            y=0,
            width=92,
            height=424,

            sourceX = 144,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0011
            x=212,
            y=428,
            width=92,
            height=428,

            sourceX = 144,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0012
            x=304,
            y=428,
            width=96,
            height=424,

            sourceX = 140,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0013
            x=504,
            y=396,
            width=96,
            height=420,

            sourceX = 140,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0014
            x=112,
            y=428,
            width=100,
            height=428,

            sourceX = 140,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0015
            x=112,
            y=0,
            width=100,
            height=428,

            sourceX = 140,
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

    ["lindsay-walk-away0001"] = 1,
    ["lindsay-walk-away0002"] = 2,
    ["lindsay-walk-away0003"] = 3,
    ["lindsay-walk-away0004"] = 4,
    ["lindsay-walk-away0005"] = 5,
    ["lindsay-walk-away0006"] = 6,
    ["lindsay-walk-away0007"] = 7,
    ["lindsay-walk-away0008"] = 8,
    ["lindsay-walk-away0009"] = 9,
    ["lindsay-walk-away0010"] = 10,
    ["lindsay-walk-away0011"] = 11,
    ["lindsay-walk-away0012"] = 12,
    ["lindsay-walk-away0013"] = 13,
    ["lindsay-walk-away0014"] = 14,
    ["lindsay-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
