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
            x=176,
            y=0,
            width=80,
            height=412,

            sourceX = 240,
            sourceY = 8,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0002
            x=0,
            y=412,
            width=84,
            height=408,

            sourceX = 240,
            sourceY = 8,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0003
            x=76,
            y=1220,
            width=76,
            height=404,

            sourceX = 240,
            sourceY = 4,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0004
            x=0,
            y=1624,
            width=76,
            height=400,

            sourceX = 236,
            sourceY = 4,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0005
            x=0,
            y=1224,
            width=76,
            height=400,

            sourceX = 232,
            sourceY = 4,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0006
            x=152,
            y=1224,
            width=76,
            height=392,

            sourceX = 228,
            sourceY = 8,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0007
            x=88,
            y=0,
            width=88,
            height=396,

            sourceX = 216,
            sourceY = 12,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0008
            x=0,
            y=0,
            width=88,
            height=412,

            sourceX = 216,
            sourceY = 12,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0009
            x=172,
            y=412,
            width=84,
            height=408,

            sourceX = 224,
            sourceY = 12,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0010
            x=160,
            y=820,
            width=76,
            height=404,

            sourceX = 236,
            sourceY = 12,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0011
            x=0,
            y=820,
            width=76,
            height=404,

            sourceX = 240,
            sourceY = 8,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0012
            x=76,
            y=1624,
            width=72,
            height=400,

            sourceX = 240,
            sourceY = 8,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0013
            x=148,
            y=1624,
            width=68,
            height=392,

            sourceX = 240,
            sourceY = 8,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0014
            x=84,
            y=812,
            width=76,
            height=408,

            sourceX = 232,
            sourceY = 4,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0015
            x=88,
            y=396,
            width=84,
            height=416,

            sourceX = 228,
            sourceY = 4,
            sourceWidth = 563,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 2048
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
