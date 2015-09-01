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
            x=128,
            y=352,
            width=128,
            height=352,

            sourceX = 216,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0002
            x=0,
            y=352,
            width=128,
            height=352,

            sourceX = 216,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0003
            x=136,
            y=0,
            width=124,
            height=352,

            sourceX = 212,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0004
            x=0,
            y=0,
            width=136,
            height=352,

            sourceX = 196,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0005
            x=256,
            y=352,
            width=116,
            height=352,

            sourceX = 208,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0006
            x=260,
            y=0,
            width=140,
            height=328,

            sourceX = 184,
            sourceY = 48,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0007
            x=0,
            y=704,
            width=188,
            height=300,

            sourceX = 156,
            sourceY = 80,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0008
            x=372,
            y=328,
            width=200,
            height=292,

            sourceX = 140,
            sourceY = 88,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0009
            x=188,
            y=704,
            width=220,
            height=296,

            sourceX = 128,
            sourceY = 84,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0010
            x=400,
            y=0,
            width=212,
            height=288,

            sourceX = 140,
            sourceY = 96,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0011
            x=408,
            y=620,
            width=204,
            height=256,

            sourceX = 152,
            sourceY = 124,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0012
            x=572,
            y=288,
            width=200,
            height=256,

            sourceX = 160,
            sourceY = 128,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0013
            x=772,
            y=0,
            width=184,
            height=208,

            sourceX = 176,
            sourceY = 176,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0014
            x=772,
            y=208,
            width=176,
            height=188,

            sourceX = 188,
            sourceY = 196,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0015
            x=772,
            y=396,
            width=164,
            height=176,

            sourceX = 196,
            sourceY = 208,
            sourceWidth = 563,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
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
