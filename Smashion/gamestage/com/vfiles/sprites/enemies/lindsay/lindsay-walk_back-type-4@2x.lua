--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c680fee2ef67dcdd429791ae5e7c862e$
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
            x=112,
            y=0,
            width=96,
            height=400,

            sourceX = 144,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0002
            x=492,
            y=388,
            width=96,
            height=384,

            sourceX = 144,
            sourceY = 40,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0003
            x=588,
            y=380,
            width=96,
            height=376,

            sourceX = 144,
            sourceY = 40,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0004
            x=712,
            y=0,
            width=108,
            height=364,

            sourceX = 144,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0005
            x=612,
            y=0,
            width=100,
            height=372,

            sourceX = 144,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0006
            x=508,
            y=0,
            width=104,
            height=380,

            sourceX = 144,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0007
            x=0,
            y=404,
            width=112,
            height=404,

            sourceX = 140,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0008
            x=0,
            y=0,
            width=112,
            height=404,

            sourceX = 140,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0009
            x=404,
            y=0,
            width=104,
            height=388,

            sourceX = 140,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0010
            x=400,
            y=392,
            width=92,
            height=392,

            sourceX = 144,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0011
            x=212,
            y=396,
            width=92,
            height=396,

            sourceX = 144,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0012
            x=308,
            y=0,
            width=96,
            height=392,

            sourceX = 140,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0013
            x=304,
            y=396,
            width=96,
            height=392,

            sourceX = 140,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0014
            x=208,
            y=0,
            width=100,
            height=396,

            sourceX = 140,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0015
            x=112,
            y=400,
            width=100,
            height=396,

            sourceX = 140,
            sourceY = 36,
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
