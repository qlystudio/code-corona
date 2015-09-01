--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:67754083ba83d39b0973c8a114162b38$
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
            y=0,
            width=64,
            height=408,

            sourceX = 168,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0002
            x=0,
            y=0,
            width=68,
            height=408,

            sourceX = 168,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0003
            x=344,
            y=0,
            width=72,
            height=400,

            sourceX = 168,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0004
            x=608,
            y=0,
            width=72,
            height=396,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0005
            x=740,
            y=0,
            width=72,
            height=392,

            sourceX = 152,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0006
            x=812,
            y=0,
            width=68,
            height=392,

            sourceX = 152,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0007
            x=880,
            y=0,
            width=76,
            height=388,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0008
            x=268,
            y=0,
            width=76,
            height=404,

            sourceX = 140,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0009
            x=192,
            y=0,
            width=76,
            height=404,

            sourceX = 144,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0010
            x=416,
            y=0,
            width=68,
            height=400,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0011
            x=484,
            y=0,
            width=64,
            height=400,

            sourceX = 156,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0012
            x=548,
            y=0,
            width=60,
            height=400,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0013
            x=956,
            y=0,
            width=56,
            height=388,

            sourceX = 168,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0014
            x=680,
            y=0,
            width=60,
            height=396,

            sourceX = 168,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0015
            x=132,
            y=0,
            width=60,
            height=408,

            sourceX = 168,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
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
