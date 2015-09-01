--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c1dbcc85a512fb7886da7f5f4c0802e5$
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
            -- lindsay-walk-forward0001
            x=104,
            y=0,
            width=104,
            height=424,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0002
            x=0,
            y=0,
            width=104,
            height=428,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0003
            x=104,
            y=424,
            width=100,
            height=424,

            sourceX = 144,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0004
            x=0,
            y=428,
            width=104,
            height=424,

            sourceX = 144,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0005
            x=316,
            y=0,
            width=100,
            height=420,

            sourceX = 148,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0006
            x=528,
            y=0,
            width=96,
            height=416,

            sourceX = 148,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0007
            x=312,
            y=420,
            width=108,
            height=420,

            sourceX = 148,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0008
            x=208,
            y=0,
            width=108,
            height=420,

            sourceX = 148,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0009
            x=416,
            y=0,
            width=112,
            height=416,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0010
            x=420,
            y=416,
            width=100,
            height=416,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0011
            x=520,
            y=416,
            width=96,
            height=416,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0012
            x=204,
            y=424,
            width=108,
            height=420,

            sourceX = 136,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0013
            x=616,
            y=416,
            width=112,
            height=408,

            sourceX = 132,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0014
            x=728,
            y=0,
            width=104,
            height=404,

            sourceX = 140,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0015
            x=624,
            y=0,
            width=104,
            height=408,

            sourceX = 144,
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

    ["lindsay-walk-forward0001"] = 1,
    ["lindsay-walk-forward0002"] = 2,
    ["lindsay-walk-forward0003"] = 3,
    ["lindsay-walk-forward0004"] = 4,
    ["lindsay-walk-forward0005"] = 5,
    ["lindsay-walk-forward0006"] = 6,
    ["lindsay-walk-forward0007"] = 7,
    ["lindsay-walk-forward0008"] = 8,
    ["lindsay-walk-forward0009"] = 9,
    ["lindsay-walk-forward0010"] = 10,
    ["lindsay-walk-forward0011"] = 11,
    ["lindsay-walk-forward0012"] = 12,
    ["lindsay-walk-forward0013"] = 13,
    ["lindsay-walk-forward0014"] = 14,
    ["lindsay-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
