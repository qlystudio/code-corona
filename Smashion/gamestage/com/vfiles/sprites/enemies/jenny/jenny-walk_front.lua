--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:489fec18810d0696c5aa5b812aa33302$
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
            -- jenny-walk-forward0001
            x=34,
            y=202,
            width=32,
            height=204,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0002
            x=0,
            y=202,
            width=34,
            height=204,

            sourceX = 20,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0003
            x=128,
            y=198,
            width=34,
            height=200,

            sourceX = 20,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0004
            x=110,
            y=0,
            width=36,
            height=198,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0005
            x=146,
            y=0,
            width=36,
            height=196,

            sourceX = 12,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0006
            x=182,
            y=0,
            width=34,
            height=196,

            sourceX = 10,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0007
            x=216,
            y=0,
            width=36,
            height=194,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0008
            x=0,
            y=0,
            width=40,
            height=202,

            sourceX = 4,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0009
            x=40,
            y=0,
            width=36,
            height=202,

            sourceX = 8,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0010
            x=96,
            y=200,
            width=32,
            height=200,

            sourceX = 12,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0011
            x=76,
            y=0,
            width=34,
            height=200,

            sourceX = 12,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0012
            x=162,
            y=196,
            width=30,
            height=200,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0013
            x=222,
            y=194,
            width=30,
            height=194,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0014
            x=192,
            y=196,
            width=30,
            height=198,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0015
            x=66,
            y=202,
            width=30,
            height=204,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["jenny-walk-forward0001"] = 1,
    ["jenny-walk-forward0002"] = 2,
    ["jenny-walk-forward0003"] = 3,
    ["jenny-walk-forward0004"] = 4,
    ["jenny-walk-forward0005"] = 5,
    ["jenny-walk-forward0006"] = 6,
    ["jenny-walk-forward0007"] = 7,
    ["jenny-walk-forward0008"] = 8,
    ["jenny-walk-forward0009"] = 9,
    ["jenny-walk-forward0010"] = 10,
    ["jenny-walk-forward0011"] = 11,
    ["jenny-walk-forward0012"] = 12,
    ["jenny-walk-forward0013"] = 13,
    ["jenny-walk-forward0014"] = 14,
    ["jenny-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
