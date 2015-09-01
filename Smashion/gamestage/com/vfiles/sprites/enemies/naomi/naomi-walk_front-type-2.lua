--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:1ec9fecc1575b2a2db4d7afc3d9ba1d8$
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
            x=0,
            y=226,
            width=40,
            height=226,

            sourceX = 78,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0002
            x=44,
            y=0,
            width=40,
            height=224,

            sourceX = 78,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0003
            x=84,
            y=0,
            width=40,
            height=222,

            sourceX = 78,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0004
            x=124,
            y=220,
            width=40,
            height=220,

            sourceX = 78,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0005
            x=202,
            y=218,
            width=36,
            height=218,

            sourceX = 76,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0006
            x=238,
            y=218,
            width=38,
            height=216,

            sourceX = 74,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0007
            x=276,
            y=216,
            width=40,
            height=214,

            sourceX = 72,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0008
            x=0,
            y=0,
            width=44,
            height=226,

            sourceX = 68,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0009
            x=80,
            y=224,
            width=44,
            height=222,

            sourceX = 70,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0010
            x=124,
            y=0,
            width=40,
            height=220,

            sourceX = 76,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0011
            x=164,
            y=220,
            width=38,
            height=220,

            sourceX = 78,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0012
            x=164,
            y=0,
            width=38,
            height=220,

            sourceX = 78,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0013
            x=242,
            y=0,
            width=36,
            height=216,

            sourceX = 78,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0014
            x=202,
            y=0,
            width=40,
            height=218,

            sourceX = 76,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-forward0015
            x=40,
            y=226,
            width=40,
            height=224,

            sourceX = 76,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
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
