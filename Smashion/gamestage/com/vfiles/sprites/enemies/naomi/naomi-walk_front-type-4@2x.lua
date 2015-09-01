--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a36fca8d2aeab197ffafa4d9e5ffbae9$
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
            y=452,
            width=80,
            height=452,

            sourceX = 156,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0002
            x=88,
            y=0,
            width=80,
            height=448,

            sourceX = 156,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0003
            x=168,
            y=0,
            width=80,
            height=444,

            sourceX = 156,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0004
            x=248,
            y=440,
            width=80,
            height=440,

            sourceX = 156,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0005
            x=404,
            y=436,
            width=72,
            height=436,

            sourceX = 152,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0006
            x=476,
            y=436,
            width=76,
            height=432,

            sourceX = 148,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0007
            x=552,
            y=432,
            width=80,
            height=428,

            sourceX = 144,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0008
            x=0,
            y=0,
            width=88,
            height=452,

            sourceX = 136,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0009
            x=160,
            y=448,
            width=88,
            height=444,

            sourceX = 140,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0010
            x=248,
            y=0,
            width=80,
            height=440,

            sourceX = 152,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0011
            x=328,
            y=440,
            width=76,
            height=440,

            sourceX = 156,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0012
            x=328,
            y=0,
            width=76,
            height=440,

            sourceX = 156,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0013
            x=484,
            y=0,
            width=72,
            height=432,

            sourceX = 156,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0014
            x=404,
            y=0,
            width=80,
            height=436,

            sourceX = 152,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-forward0015
            x=80,
            y=452,
            width=80,
            height=448,

            sourceX = 152,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
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
