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
            x=34,
            y=0,
            width=32,
            height=204,

            sourceX = 84,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0002
            x=0,
            y=0,
            width=34,
            height=204,

            sourceX = 84,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0003
            x=172,
            y=0,
            width=36,
            height=200,

            sourceX = 84,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0004
            x=304,
            y=0,
            width=36,
            height=198,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0005
            x=370,
            y=0,
            width=36,
            height=196,

            sourceX = 76,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0006
            x=406,
            y=0,
            width=34,
            height=196,

            sourceX = 76,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0007
            x=440,
            y=0,
            width=38,
            height=194,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0008
            x=134,
            y=0,
            width=38,
            height=202,

            sourceX = 70,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0009
            x=96,
            y=0,
            width=38,
            height=202,

            sourceX = 72,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0010
            x=208,
            y=0,
            width=34,
            height=200,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0011
            x=242,
            y=0,
            width=32,
            height=200,

            sourceX = 78,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0012
            x=274,
            y=0,
            width=30,
            height=200,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0013
            x=478,
            y=0,
            width=28,
            height=194,

            sourceX = 84,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0014
            x=340,
            y=0,
            width=30,
            height=198,

            sourceX = 84,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-forward0015
            x=66,
            y=0,
            width=30,
            height=204,

            sourceX = 84,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 256
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
