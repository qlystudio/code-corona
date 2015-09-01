--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:74a769f08267e4e4285e98088a57a41f$
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
            x=446,
            y=338,
            width=58,
            height=222,

            sourceX = 50,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0002
            x=90,
            y=446,
            width=84,
            height=202,

            sourceX = 38,
            sourceY = 26,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0003
            x=378,
            y=152,
            width=112,
            height=186,

            sourceX = 22,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0004
            x=258,
            y=0,
            width=120,
            height=186,

            sourceX = 10,
            sourceY = 46,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0005
            x=0,
            y=0,
            width=132,
            height=180,

            sourceX = 4,
            sourceY = 52,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0006
            x=132,
            y=0,
            width=126,
            height=172,

            sourceX = 10,
            sourceY = 60,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0007
            x=0,
            y=180,
            width=118,
            height=158,

            sourceX = 20,
            sourceY = 74,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0008
            x=132,
            y=172,
            width=120,
            height=154,

            sourceX = 18,
            sourceY = 78,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0009
            x=378,
            y=0,
            width=118,
            height=152,

            sourceX = 24,
            sourceY = 80,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0010
            x=252,
            y=186,
            width=110,
            height=136,

            sourceX = 32,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0011
            x=252,
            y=322,
            width=104,
            height=122,

            sourceX = 40,
            sourceY = 112,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0012
            x=356,
            y=338,
            width=90,
            height=116,

            sourceX = 52,
            sourceY = 118,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0013
            x=208,
            y=444,
            width=88,
            height=120,

            sourceX = 52,
            sourceY = 118,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0014
            x=0,
            y=338,
            width=90,
            height=120,

            sourceX = 52,
            sourceY = 118,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- naomi-fall-away0015
            x=118,
            y=326,
            width=90,
            height=120,

            sourceX = 52,
            sourceY = 118,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
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
