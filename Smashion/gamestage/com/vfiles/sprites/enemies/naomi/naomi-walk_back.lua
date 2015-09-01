--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:33133b06830f3db7712f1ddda325c219$
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
            x=234,
            y=0,
            width=78,
            height=210,

            sourceX = 92,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0002
            x=78,
            y=212,
            width=76,
            height=208,

            sourceX = 94,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0003
            x=156,
            y=210,
            width=76,
            height=208,

            sourceX = 94,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0004
            x=232,
            y=416,
            width=74,
            height=208,

            sourceX = 94,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0005
            x=0,
            y=420,
            width=74,
            height=206,

            sourceX = 94,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0006
            x=154,
            y=418,
            width=74,
            height=206,

            sourceX = 94,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0007
            x=388,
            y=208,
            width=76,
            height=208,

            sourceX = 94,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0008
            x=78,
            y=0,
            width=78,
            height=212,

            sourceX = 92,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0009
            x=0,
            y=0,
            width=78,
            height=214,

            sourceX = 92,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0010
            x=156,
            y=0,
            width=78,
            height=210,

            sourceX = 92,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0011
            x=312,
            y=208,
            width=76,
            height=208,

            sourceX = 94,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0012
            x=232,
            y=210,
            width=76,
            height=206,

            sourceX = 94,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0013
            x=0,
            y=214,
            width=76,
            height=206,

            sourceX = 94,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0014
            x=388,
            y=0,
            width=76,
            height=208,

            sourceX = 94,
            sourceY = 10,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-walk-away0015
            x=312,
            y=0,
            width=76,
            height=208,

            sourceX = 94,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
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
