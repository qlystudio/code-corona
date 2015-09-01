--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d46ab13040a38a78f7d7606414f19562$
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
            x=170,
            y=692,
            width=40,
            height=208,

            sourceX = 80,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0002
            x=0,
            y=746,
            width=52,
            height=206,

            sourceX = 80,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0003
            x=196,
            y=486,
            width=60,
            height=204,

            sourceX = 80,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0004
            x=0,
            y=540,
            width=54,
            height=204,

            sourceX = 80,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0005
            x=0,
            y=350,
            width=80,
            height=188,

            sourceX = 68,
            sourceY = 20,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0006
            x=0,
            y=172,
            width=106,
            height=176,

            sourceX = 56,
            sourceY = 34,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0007
            x=128,
            y=164,
            width=114,
            height=170,

            sourceX = 60,
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
            x=82,
            y=486,
            width=112,
            height=150,

            sourceX = 52,
            sourceY = 62,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0011
            x=108,
            y=336,
            width=116,
            height=148,

            sourceX = 50,
            sourceY = 64,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0012
            x=56,
            y=638,
            width=112,
            height=144,

            sourceX = 48,
            sourceY = 68,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0013
            x=54,
            y=902,
            width=106,
            height=118,

            sourceX = 46,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0014
            x=54,
            y=784,
            width=98,
            height=108,

            sourceX = 46,
            sourceY = 106,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-away0015
            x=162,
            y=902,
            width=86,
            height=96,

            sourceX = 48,
            sourceY = 118,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 256,
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
