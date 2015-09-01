--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:1e1bf3f507de7164b13537eca80354b8$
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
            x=52,
            y=0,
            width=52,
            height=200,

            sourceX = 72,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0002
            x=0,
            y=0,
            width=52,
            height=202,

            sourceX = 72,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0003
            x=52,
            y=200,
            width=50,
            height=200,

            sourceX = 72,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0004
            x=0,
            y=202,
            width=52,
            height=200,

            sourceX = 72,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0005
            x=158,
            y=0,
            width=50,
            height=198,

            sourceX = 74,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0006
            x=264,
            y=0,
            width=48,
            height=196,

            sourceX = 74,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0007
            x=156,
            y=198,
            width=54,
            height=198,

            sourceX = 74,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0008
            x=104,
            y=0,
            width=54,
            height=198,

            sourceX = 74,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0009
            x=208,
            y=0,
            width=56,
            height=196,

            sourceX = 72,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0010
            x=210,
            y=196,
            width=50,
            height=196,

            sourceX = 72,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0011
            x=260,
            y=196,
            width=48,
            height=196,

            sourceX = 72,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0012
            x=102,
            y=200,
            width=54,
            height=198,

            sourceX = 68,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0013
            x=308,
            y=196,
            width=56,
            height=194,

            sourceX = 66,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0014
            x=364,
            y=0,
            width=52,
            height=190,

            sourceX = 70,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0015
            x=312,
            y=0,
            width=52,
            height=194,

            sourceX = 72,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
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
