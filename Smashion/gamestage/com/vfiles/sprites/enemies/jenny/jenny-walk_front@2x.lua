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
            x=68,
            y=404,
            width=64,
            height=408,

            sourceX = 40,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0002
            x=0,
            y=404,
            width=68,
            height=408,

            sourceX = 40,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0003
            x=256,
            y=396,
            width=68,
            height=400,

            sourceX = 40,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0004
            x=220,
            y=0,
            width=72,
            height=396,

            sourceX = 32,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0005
            x=292,
            y=0,
            width=72,
            height=392,

            sourceX = 24,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0006
            x=364,
            y=0,
            width=68,
            height=392,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0007
            x=432,
            y=0,
            width=72,
            height=388,

            sourceX = 16,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0008
            x=0,
            y=0,
            width=80,
            height=404,

            sourceX = 8,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0009
            x=80,
            y=0,
            width=72,
            height=404,

            sourceX = 16,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0010
            x=192,
            y=400,
            width=64,
            height=400,

            sourceX = 24,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0011
            x=152,
            y=0,
            width=68,
            height=400,

            sourceX = 24,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0012
            x=324,
            y=392,
            width=60,
            height=400,

            sourceX = 32,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0013
            x=444,
            y=388,
            width=60,
            height=388,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0014
            x=384,
            y=392,
            width=60,
            height=396,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0015
            x=132,
            y=404,
            width=60,
            height=408,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
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
