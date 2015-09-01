--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:23c521cf50095af6c5ab507552b601df$
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
            -- jenny-fall-away0001
            x=0,
            y=318,
            width=100,
            height=208,

            sourceX = 52,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0002
            x=228,
            y=448,
            width=96,
            height=204,

            sourceX = 54,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0003
            x=102,
            y=508,
            width=94,
            height=204,

            sourceX = 58,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0004
            x=358,
            y=382,
            width=100,
            height=204,

            sourceX = 56,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0005
            x=120,
            y=314,
            width=106,
            height=192,

            sourceX = 60,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0006
            x=248,
            y=270,
            width=108,
            height=176,

            sourceX = 56,
            sourceY = 34,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0007
            x=250,
            y=0,
            width=118,
            height=170,

            sourceX = 56,
            sourceY = 42,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0008
            x=0,
            y=0,
            width=126,
            height=170,

            sourceX = 54,
            sourceY = 42,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0009
            x=128,
            y=0,
            width=120,
            height=162,

            sourceX = 54,
            sourceY = 50,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0010
            x=364,
            y=230,
            width=112,
            height=150,

            sourceX = 52,
            sourceY = 62,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0011
            x=128,
            y=164,
            width=118,
            height=148,

            sourceX = 50,
            sourceY = 64,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0012
            x=0,
            y=172,
            width=118,
            height=144,

            sourceX = 48,
            sourceY = 68,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0013
            x=370,
            y=0,
            width=118,
            height=118,

            sourceX = 48,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0014
            x=370,
            y=120,
            width=114,
            height=108,

            sourceX = 46,
            sourceY = 106,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0015
            x=248,
            y=172,
            width=114,
            height=96,

            sourceX = 46,
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

    ["jenny-fall-away0001"] = 1,
    ["jenny-fall-away0002"] = 2,
    ["jenny-fall-away0003"] = 3,
    ["jenny-fall-away0004"] = 4,
    ["jenny-fall-away0005"] = 5,
    ["jenny-fall-away0006"] = 6,
    ["jenny-fall-away0007"] = 7,
    ["jenny-fall-away0008"] = 8,
    ["jenny-fall-away0009"] = 9,
    ["jenny-fall-away0010"] = 10,
    ["jenny-fall-away0011"] = 11,
    ["jenny-fall-away0012"] = 12,
    ["jenny-fall-away0013"] = 13,
    ["jenny-fall-away0014"] = 14,
    ["jenny-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
