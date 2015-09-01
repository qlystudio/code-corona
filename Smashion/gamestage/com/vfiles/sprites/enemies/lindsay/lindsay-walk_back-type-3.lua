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
            x=106,
            y=0,
            width=48,
            height=214,

            sourceX = 72,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0002
            x=300,
            y=206,
            width=48,
            height=208,

            sourceX = 72,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0003
            x=348,
            y=206,
            width=48,
            height=204,

            sourceX = 72,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0004
            x=200,
            y=0,
            width=54,
            height=198,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0005
            x=352,
            y=0,
            width=50,
            height=202,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0006
            x=300,
            y=0,
            width=52,
            height=206,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0007
            x=0,
            y=218,
            width=56,
            height=218,

            sourceX = 70,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0008
            x=0,
            y=0,
            width=56,
            height=218,

            sourceX = 70,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0009
            x=200,
            y=198,
            width=52,
            height=210,

            sourceX = 70,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0010
            x=154,
            y=0,
            width=46,
            height=212,

            sourceX = 72,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0011
            x=106,
            y=214,
            width=46,
            height=214,

            sourceX = 72,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0012
            x=152,
            y=214,
            width=48,
            height=212,

            sourceX = 70,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0013
            x=252,
            y=198,
            width=48,
            height=210,

            sourceX = 70,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0014
            x=56,
            y=214,
            width=50,
            height=214,

            sourceX = 70,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0015
            x=56,
            y=0,
            width=50,
            height=214,

            sourceX = 70,
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
