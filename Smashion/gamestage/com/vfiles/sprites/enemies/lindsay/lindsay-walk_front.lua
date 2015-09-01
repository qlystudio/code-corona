--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:24a3cda3a81ef6ba1d6e7f3077fa258d$
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
            x=54,
            y=212,
            width=52,
            height=212,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0002
            x=0,
            y=0,
            width=52,
            height=214,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0003
            x=52,
            y=0,
            width=52,
            height=212,

            sourceX = 6,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0004
            x=0,
            y=214,
            width=54,
            height=212,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0005
            x=214,
            y=204,
            width=50,
            height=210,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0006
            x=368,
            y=0,
            width=50,
            height=208,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0007
            x=160,
            y=204,
            width=54,
            height=210,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0008
            x=106,
            y=210,
            width=54,
            height=210,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0009
            x=264,
            y=204,
            width=54,
            height=208,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0010
            x=318,
            y=202,
            width=50,
            height=208,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0011
            x=418,
            y=0,
            width=48,
            height=208,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0012
            x=104,
            y=0,
            width=56,
            height=210,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0013
            x=160,
            y=0,
            width=56,
            height=204,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0014
            x=266,
            y=0,
            width=54,
            height=202,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0015
            x=216,
            y=0,
            width=50,
            height=204,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 64,
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
