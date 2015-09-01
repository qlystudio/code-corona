--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:384ace42806d84a2f7ee1a55014b1f04$
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
            -- naomi-fall-forward0001
            x=0,
            y=0,
            width=40,
            height=188,

            sourceX = 114,
            sourceY = 8,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0002
            x=0,
            y=188,
            width=64,
            height=184,

            sourceX = 108,
            sourceY = 12,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0003
            x=40,
            y=0,
            width=66,
            height=176,

            sourceX = 104,
            sourceY = 18,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0004
            x=64,
            y=176,
            width=70,
            height=164,

            sourceX = 106,
            sourceY = 26,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0005
            x=82,
            y=340,
            width=78,
            height=150,

            sourceX = 104,
            sourceY = 36,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0006
            x=0,
            y=372,
            width=82,
            height=136,

            sourceX = 102,
            sourceY = 44,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0007
            x=106,
            y=0,
            width=86,
            height=122,

            sourceX = 104,
            sourceY = 52,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0008
            x=134,
            y=236,
            width=102,
            height=102,

            sourceX = 84,
            sourceY = 72,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0009
            x=366,
            y=0,
            width=110,
            height=86,

            sourceX = 72,
            sourceY = 92,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0010
            x=366,
            y=86,
            width=100,
            height=94,

            sourceX = 82,
            sourceY = 92,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0011
            x=160,
            y=338,
            width=94,
            height=100,

            sourceX = 88,
            sourceY = 92,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0012
            x=272,
            y=0,
            width=94,
            height=100,

            sourceX = 88,
            sourceY = 92,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0013
            x=214,
            y=114,
            width=80,
            height=114,

            sourceX = 102,
            sourceY = 90,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0014
            x=192,
            y=0,
            width=80,
            height=114,

            sourceX = 102,
            sourceY = 90,
            sourceWidth = 282,
            sourceHeight = 256
        },
        {
            -- naomi-fall-forward0015
            x=134,
            y=122,
            width=80,
            height=114,

            sourceX = 102,
            sourceY = 90,
            sourceWidth = 282,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["naomi-fall-forward0001"] = 1,
    ["naomi-fall-forward0002"] = 2,
    ["naomi-fall-forward0003"] = 3,
    ["naomi-fall-forward0004"] = 4,
    ["naomi-fall-forward0005"] = 5,
    ["naomi-fall-forward0006"] = 6,
    ["naomi-fall-forward0007"] = 7,
    ["naomi-fall-forward0008"] = 8,
    ["naomi-fall-forward0009"] = 9,
    ["naomi-fall-forward0010"] = 10,
    ["naomi-fall-forward0011"] = 11,
    ["naomi-fall-forward0012"] = 12,
    ["naomi-fall-forward0013"] = 13,
    ["naomi-fall-forward0014"] = 14,
    ["naomi-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
