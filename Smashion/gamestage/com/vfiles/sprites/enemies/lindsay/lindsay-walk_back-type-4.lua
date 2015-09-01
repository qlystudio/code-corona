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
            x=56,
            y=0,
            width=48,
            height=200,

            sourceX = 72,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0002
            x=246,
            y=194,
            width=48,
            height=192,

            sourceX = 72,
            sourceY = 20,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0003
            x=294,
            y=190,
            width=48,
            height=188,

            sourceX = 72,
            sourceY = 20,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0004
            x=356,
            y=0,
            width=54,
            height=182,

            sourceX = 72,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0005
            x=306,
            y=0,
            width=50,
            height=186,

            sourceX = 72,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0006
            x=254,
            y=0,
            width=52,
            height=190,

            sourceX = 72,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0007
            x=0,
            y=202,
            width=56,
            height=202,

            sourceX = 70,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0008
            x=0,
            y=0,
            width=56,
            height=202,

            sourceX = 70,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0009
            x=202,
            y=0,
            width=52,
            height=194,

            sourceX = 70,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0010
            x=200,
            y=196,
            width=46,
            height=196,

            sourceX = 72,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0011
            x=106,
            y=198,
            width=46,
            height=198,

            sourceX = 72,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0012
            x=154,
            y=0,
            width=48,
            height=196,

            sourceX = 70,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0013
            x=152,
            y=198,
            width=48,
            height=196,

            sourceX = 70,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0014
            x=104,
            y=0,
            width=50,
            height=198,

            sourceX = 70,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0015
            x=56,
            y=200,
            width=50,
            height=198,

            sourceX = 70,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
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
