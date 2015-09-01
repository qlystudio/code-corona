--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c47be59de9e644b8f006a12bba480c50$
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
            x=0,
            y=594,
            width=90,
            height=204,

            sourceX = 58,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0002
            x=316,
            y=194,
            width=94,
            height=204,

            sourceX = 56,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0003
            x=410,
            y=200,
            width=94,
            height=200,

            sourceX = 56,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0004
            x=208,
            y=202,
            width=94,
            height=198,

            sourceX = 56,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0005
            x=0,
            y=398,
            width=100,
            height=196,

            sourceX = 52,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0006
            x=0,
            y=202,
            width=100,
            height=196,

            sourceX = 52,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0007
            x=316,
            y=0,
            width=100,
            height=194,

            sourceX = 52,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0008
            x=212,
            y=0,
            width=104,
            height=202,

            sourceX = 50,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0009
            x=0,
            y=0,
            width=106,
            height=202,

            sourceX = 48,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0010
            x=106,
            y=0,
            width=106,
            height=200,

            sourceX = 48,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0011
            x=106,
            y=200,
            width=102,
            height=200,

            sourceX = 50,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0012
            x=416,
            y=0,
            width=96,
            height=200,

            sourceX = 54,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0013
            x=302,
            y=398,
            width=94,
            height=194,

            sourceX = 54,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0014
            x=100,
            y=400,
            width=92,
            height=198,

            sourceX = 56,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0015
            x=396,
            y=400,
            width=92,
            height=204,

            sourceX = 56,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
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
