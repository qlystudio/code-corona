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
            width=80,
            height=376,

            sourceX = 228,
            sourceY = 16,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0002
            x=0,
            y=376,
            width=128,
            height=368,

            sourceX = 216,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0003
            x=80,
            y=0,
            width=132,
            height=352,

            sourceX = 208,
            sourceY = 36,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0004
            x=128,
            y=352,
            width=140,
            height=328,

            sourceX = 212,
            sourceY = 52,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0005
            x=164,
            y=680,
            width=156,
            height=300,

            sourceX = 208,
            sourceY = 72,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0006
            x=0,
            y=744,
            width=164,
            height=272,

            sourceX = 204,
            sourceY = 88,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0007
            x=212,
            y=0,
            width=172,
            height=244,

            sourceX = 208,
            sourceY = 104,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0008
            x=268,
            y=472,
            width=204,
            height=204,

            sourceX = 168,
            sourceY = 144,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0009
            x=732,
            y=0,
            width=220,
            height=172,

            sourceX = 144,
            sourceY = 184,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0010
            x=732,
            y=172,
            width=200,
            height=188,

            sourceX = 164,
            sourceY = 184,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0011
            x=320,
            y=676,
            width=188,
            height=200,

            sourceX = 176,
            sourceY = 184,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0012
            x=544,
            y=0,
            width=188,
            height=200,

            sourceX = 176,
            sourceY = 184,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0013
            x=428,
            y=228,
            width=160,
            height=228,

            sourceX = 204,
            sourceY = 180,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0014
            x=384,
            y=0,
            width=160,
            height=228,

            sourceX = 204,
            sourceY = 180,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0015
            x=268,
            y=244,
            width=160,
            height=228,

            sourceX = 204,
            sourceY = 180,
            sourceWidth = 563,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
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
