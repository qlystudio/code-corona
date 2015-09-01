--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:fa35ce77a5b5a71e49554644030a83a4$
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
            -- jenny-fall-forward0001
            x=0,
            y=0,
            width=52,
            height=190,

            sourceX = 82,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0002
            x=0,
            y=192,
            width=58,
            height=176,

            sourceX = 82,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0003
            x=54,
            y=0,
            width=72,
            height=162,

            sourceX = 76,
            sourceY = 38,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0004
            x=60,
            y=164,
            width=80,
            height=146,

            sourceX = 70,
            sourceY = 46,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0005
            x=0,
            y=370,
            width=96,
            height=130,

            sourceX = 60,
            sourceY = 56,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0006
            x=210,
            y=0,
            width=114,
            height=110,

            sourceX = 38,
            sourceY = 78,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0007
            x=326,
            y=94,
            width=120,
            height=92,

            sourceX = 26,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0008
            x=326,
            y=0,
            width=120,
            height=92,

            sourceX = 26,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0009
            x=292,
            y=290,
            width=114,
            height=100,

            sourceX = 34,
            sourceY = 100,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0010
            x=292,
            y=188,
            width=114,
            height=100,

            sourceX = 34,
            sourceY = 100,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0011
            x=188,
            y=364,
            width=102,
            height=110,

            sourceX = 44,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0012
            x=188,
            y=252,
            width=102,
            height=110,

            sourceX = 44,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0013
            x=142,
            y=130,
            width=88,
            height=120,

            sourceX = 58,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0014
            x=98,
            y=312,
            width=88,
            height=120,

            sourceX = 58,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0015
            x=128,
            y=0,
            width=80,
            height=128,

            sourceX = 66,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["jenny-fall-forward0001"] = 1,
    ["jenny-fall-forward0002"] = 2,
    ["jenny-fall-forward0003"] = 3,
    ["jenny-fall-forward0004"] = 4,
    ["jenny-fall-forward0005"] = 5,
    ["jenny-fall-forward0006"] = 6,
    ["jenny-fall-forward0007"] = 7,
    ["jenny-fall-forward0008"] = 8,
    ["jenny-fall-forward0009"] = 9,
    ["jenny-fall-forward0010"] = 10,
    ["jenny-fall-forward0011"] = 11,
    ["jenny-fall-forward0012"] = 12,
    ["jenny-fall-forward0013"] = 13,
    ["jenny-fall-forward0014"] = 14,
    ["jenny-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
