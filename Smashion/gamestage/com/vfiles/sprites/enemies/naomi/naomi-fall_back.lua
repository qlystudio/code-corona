--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:89b9514a1010251481d17b4bce65606e$
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
            -- naomi-fall-away0001
            x=64,
            y=176,
            width=64,
            height=176,

            sourceX = 108,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0002
            x=0,
            y=176,
            width=64,
            height=176,

            sourceX = 108,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0003
            x=68,
            y=0,
            width=62,
            height=176,

            sourceX = 106,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0004
            x=0,
            y=0,
            width=68,
            height=176,

            sourceX = 98,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0005
            x=128,
            y=176,
            width=58,
            height=176,

            sourceX = 104,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0006
            x=130,
            y=0,
            width=70,
            height=164,

            sourceX = 92,
            sourceY = 24,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0007
            x=0,
            y=352,
            width=94,
            height=150,

            sourceX = 78,
            sourceY = 40,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0008
            x=186,
            y=164,
            width=100,
            height=146,

            sourceX = 70,
            sourceY = 44,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0009
            x=94,
            y=352,
            width=110,
            height=148,

            sourceX = 64,
            sourceY = 42,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0010
            x=200,
            y=0,
            width=106,
            height=144,

            sourceX = 70,
            sourceY = 48,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0011
            x=204,
            y=310,
            width=102,
            height=128,

            sourceX = 76,
            sourceY = 62,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0012
            x=286,
            y=144,
            width=100,
            height=128,

            sourceX = 80,
            sourceY = 64,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0013
            x=386,
            y=0,
            width=92,
            height=104,

            sourceX = 88,
            sourceY = 88,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0014
            x=386,
            y=104,
            width=88,
            height=94,

            sourceX = 94,
            sourceY = 98,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0015
            x=386,
            y=198,
            width=82,
            height=88,

            sourceX = 98,
            sourceY = 104,
            sourceWidth = 282,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["naomi-fall-away0001"] = 1,
    ["naomi-fall-away0002"] = 2,
    ["naomi-fall-away0003"] = 3,
    ["naomi-fall-away0004"] = 4,
    ["naomi-fall-away0005"] = 5,
    ["naomi-fall-away0006"] = 6,
    ["naomi-fall-away0007"] = 7,
    ["naomi-fall-away0008"] = 8,
    ["naomi-fall-away0009"] = 9,
    ["naomi-fall-away0010"] = 10,
    ["naomi-fall-away0011"] = 11,
    ["naomi-fall-away0012"] = 12,
    ["naomi-fall-away0013"] = 13,
    ["naomi-fall-away0014"] = 14,
    ["naomi-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
