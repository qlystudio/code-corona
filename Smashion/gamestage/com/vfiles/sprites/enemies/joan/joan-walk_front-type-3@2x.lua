--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9f969ce728983cf4c49b75192ef94d91$
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
            y=1612,
            width=64,
            height=416,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0002
            x=152,
            y=0,
            width=72,
            height=412,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0003
            x=76,
            y=0,
            width=76,
            height=408,

            sourceX = 32,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0004
            x=148,
            y=412,
            width=72,
            height=404,

            sourceX = 32,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0005
            x=72,
            y=816,
            width=72,
            height=400,

            sourceX = 24,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0006
            x=0,
            y=820,
            width=72,
            height=396,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0007
            x=144,
            y=816,
            width=72,
            height=392,

            sourceX = 16,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0008
            x=0,
            y=0,
            width=76,
            height=412,

            sourceX = 12,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0009
            x=0,
            y=412,
            width=72,
            height=408,

            sourceX = 16,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0010
            x=76,
            y=408,
            width=72,
            height=408,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0011
            x=144,
            y=1208,
            width=68,
            height=404,

            sourceX = 24,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0012
            x=128,
            y=1616,
            width=60,
            height=404,

            sourceX = 32,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0013
            x=0,
            y=1216,
            width=64,
            height=392,

            sourceX = 32,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0014
            x=64,
            y=1216,
            width=68,
            height=400,

            sourceX = 32,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- joan-walk-forward0015
            x=64,
            y=1616,
            width=64,
            height=412,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 2048
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
