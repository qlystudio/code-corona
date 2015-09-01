--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:67df9b57c16e238246676c0f57a36d86$
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
            -- naomi-walk-away0001
            x=44,
            y=0,
            width=40,
            height=222,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0002
            x=40,
            y=230,
            width=44,
            height=226,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0003
            x=274,
            y=216,
            width=40,
            height=216,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0004
            x=236,
            y=0,
            width=40,
            height=216,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0005
            x=160,
            y=220,
            width=34,
            height=220,

            sourceX = 78,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0006
            x=160,
            y=0,
            width=36,
            height=220,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0007
            x=124,
            y=0,
            width=36,
            height=220,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0008
            x=0,
            y=0,
            width=44,
            height=230,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0009
            x=0,
            y=230,
            width=40,
            height=230,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0010
            x=84,
            y=0,
            width=40,
            height=220,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0011
            x=122,
            y=220,
            width=38,
            height=220,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0012
            x=234,
            y=218,
            width=40,
            height=216,

            sourceX = 70,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0013
            x=196,
            y=0,
            width=40,
            height=218,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0014
            x=194,
            y=220,
            width=40,
            height=218,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0015
            x=84,
            y=220,
            width=38,
            height=220,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["naomi-walk-away0001"] = 1,
    ["naomi-walk-away0002"] = 2,
    ["naomi-walk-away0003"] = 3,
    ["naomi-walk-away0004"] = 4,
    ["naomi-walk-away0005"] = 5,
    ["naomi-walk-away0006"] = 6,
    ["naomi-walk-away0007"] = 7,
    ["naomi-walk-away0008"] = 8,
    ["naomi-walk-away0009"] = 9,
    ["naomi-walk-away0010"] = 10,
    ["naomi-walk-away0011"] = 11,
    ["naomi-walk-away0012"] = 12,
    ["naomi-walk-away0013"] = 13,
    ["naomi-walk-away0014"] = 14,
    ["naomi-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
