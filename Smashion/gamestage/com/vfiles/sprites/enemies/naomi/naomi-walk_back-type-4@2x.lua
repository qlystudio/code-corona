--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4f95ea80768350b34758989f0834d0ed$
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
            x=88,
            y=0,
            width=80,
            height=444,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0002
            x=80,
            y=460,
            width=88,
            height=452,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0003
            x=548,
            y=432,
            width=80,
            height=432,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0004
            x=472,
            y=0,
            width=80,
            height=432,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0005
            x=320,
            y=440,
            width=68,
            height=440,

            sourceX = 156,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0006
            x=320,
            y=0,
            width=72,
            height=440,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0007
            x=248,
            y=0,
            width=72,
            height=440,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0008
            x=0,
            y=0,
            width=88,
            height=460,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0009
            x=0,
            y=460,
            width=80,
            height=460,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0010
            x=168,
            y=0,
            width=80,
            height=440,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0011
            x=244,
            y=440,
            width=76,
            height=440,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0012
            x=468,
            y=436,
            width=80,
            height=432,

            sourceX = 140,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0013
            x=392,
            y=0,
            width=80,
            height=436,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0014
            x=388,
            y=440,
            width=80,
            height=436,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0015
            x=168,
            y=440,
            width=76,
            height=440,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
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
