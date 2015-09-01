--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f98310d9be8dcdc5c5652dc37b0e9c94$
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
            -- naomi-walk-forward0001
            x=88,
            y=0,
            width=40,
            height=206,

            sourceX = 120,
            sourceY = 4,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0002
            x=0,
            y=206,
            width=42,
            height=204,

            sourceX = 120,
            sourceY = 4,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0003
            x=38,
            y=610,
            width=38,
            height=202,

            sourceX = 120,
            sourceY = 2,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0004
            x=0,
            y=812,
            width=38,
            height=200,

            sourceX = 118,
            sourceY = 2,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0005
            x=0,
            y=612,
            width=38,
            height=200,

            sourceX = 116,
            sourceY = 2,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0006
            x=76,
            y=612,
            width=38,
            height=196,

            sourceX = 114,
            sourceY = 4,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0007
            x=44,
            y=0,
            width=44,
            height=198,

            sourceX = 108,
            sourceY = 6,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0008
            x=0,
            y=0,
            width=44,
            height=206,

            sourceX = 108,
            sourceY = 6,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0009
            x=86,
            y=206,
            width=42,
            height=204,

            sourceX = 112,
            sourceY = 6,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0010
            x=80,
            y=410,
            width=38,
            height=202,

            sourceX = 118,
            sourceY = 6,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0011
            x=0,
            y=410,
            width=38,
            height=202,

            sourceX = 120,
            sourceY = 4,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0012
            x=38,
            y=812,
            width=36,
            height=200,

            sourceX = 120,
            sourceY = 4,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0013
            x=74,
            y=812,
            width=34,
            height=196,

            sourceX = 120,
            sourceY = 4,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0014
            x=42,
            y=406,
            width=38,
            height=204,

            sourceX = 116,
            sourceY = 2,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0015
            x=44,
            y=198,
            width=42,
            height=208,

            sourceX = 114,
            sourceY = 2,
            sourceWidth = 282,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["naomi-walk-forward0001"] = 1,
    ["naomi-walk-forward0002"] = 2,
    ["naomi-walk-forward0003"] = 3,
    ["naomi-walk-forward0004"] = 4,
    ["naomi-walk-forward0005"] = 5,
    ["naomi-walk-forward0006"] = 6,
    ["naomi-walk-forward0007"] = 7,
    ["naomi-walk-forward0008"] = 8,
    ["naomi-walk-forward0009"] = 9,
    ["naomi-walk-forward0010"] = 10,
    ["naomi-walk-forward0011"] = 11,
    ["naomi-walk-forward0012"] = 12,
    ["naomi-walk-forward0013"] = 13,
    ["naomi-walk-forward0014"] = 14,
    ["naomi-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
