--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4f4209e0d01681e92037758ee65d00af$
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
            -- joan-fall-forward0001
            x=0,
            y=0,
            width=144,
            height=368,

            sourceX = 128,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0002
            x=0,
            y=368,
            width=184,
            height=348,

            sourceX = 104,
            sourceY = 48,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0003
            x=144,
            y=0,
            width=204,
            height=320,

            sourceX = 96,
            sourceY = 68,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0004
            x=0,
            y=716,
            width=188,
            height=284,

            sourceX = 104,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0005
            x=348,
            y=0,
            width=208,
            height=256,

            sourceX = 96,
            sourceY = 104,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0006
            x=432,
            y=724,
            width=216,
            height=224,

            sourceX = 84,
            sourceY = 140,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0007
            x=776,
            y=0,
            width=244,
            height=192,

            sourceX = 64,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0008
            x=188,
            y=828,
            width=244,
            height=192,

            sourceX = 64,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0009
            x=628,
            y=404,
            width=228,
            height=212,

            sourceX = 80,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0010
            x=776,
            y=192,
            width=228,
            height=212,

            sourceX = 80,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0011
            x=408,
            y=500,
            width=220,
            height=224,

            sourceX = 92,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0012
            x=556,
            y=0,
            width=220,
            height=224,

            sourceX = 92,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0013
            x=404,
            y=256,
            width=220,
            height=244,

            sourceX = 96,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0014
            x=188,
            y=584,
            width=220,
            height=244,

            sourceX = 96,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-forward0015
            x=184,
            y=320,
            width=220,
            height=264,

            sourceX = 96,
            sourceY = 172,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["joan-fall-forward0001"] = 1,
    ["joan-fall-forward0002"] = 2,
    ["joan-fall-forward0003"] = 3,
    ["joan-fall-forward0004"] = 4,
    ["joan-fall-forward0005"] = 5,
    ["joan-fall-forward0006"] = 6,
    ["joan-fall-forward0007"] = 7,
    ["joan-fall-forward0008"] = 8,
    ["joan-fall-forward0009"] = 9,
    ["joan-fall-forward0010"] = 10,
    ["joan-fall-forward0011"] = 11,
    ["joan-fall-forward0012"] = 12,
    ["joan-fall-forward0013"] = 13,
    ["joan-fall-forward0014"] = 14,
    ["joan-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
