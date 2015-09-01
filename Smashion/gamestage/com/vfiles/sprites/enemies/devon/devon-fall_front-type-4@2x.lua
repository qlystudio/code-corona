--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:7c3cd9c9c277048f6384769dbbf1b4f9$
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
            -- devon-fall-forward0001
            x=0,
            y=0,
            width=104,
            height=376,

            sourceX = 160,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0002
            x=0,
            y=380,
            width=116,
            height=348,

            sourceX = 164,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0003
            x=108,
            y=0,
            width=140,
            height=320,

            sourceX = 152,
            sourceY = 76,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0004
            x=0,
            y=732,
            width=156,
            height=288,

            sourceX = 140,
            sourceY = 92,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0005
            x=120,
            y=324,
            width=188,
            height=256,

            sourceX = 120,
            sourceY = 112,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0006
            x=416,
            y=0,
            width=220,
            height=220,

            sourceX = 80,
            sourceY = 152,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0007
            x=700,
            y=388,
            width=236,
            height=180,

            sourceX = 56,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0008
            x=700,
            y=204,
            width=236,
            height=180,

            sourceX = 56,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0009
            x=640,
            y=0,
            width=220,
            height=200,

            sourceX = 72,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0010
            x=160,
            y=824,
            width=220,
            height=200,

            sourceX = 72,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0011
            x=492,
            y=224,
            width=204,
            height=216,

            sourceX = 88,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0012
            x=340,
            y=500,
            width=204,
            height=216,

            sourceX = 88,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0013
            x=312,
            y=260,
            width=176,
            height=236,

            sourceX = 116,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0014
            x=160,
            y=584,
            width=176,
            height=236,

            sourceX = 116,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0015
            x=252,
            y=0,
            width=160,
            height=256,

            sourceX = 132,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["devon-fall-forward0001"] = 1,
    ["devon-fall-forward0002"] = 2,
    ["devon-fall-forward0003"] = 3,
    ["devon-fall-forward0004"] = 4,
    ["devon-fall-forward0005"] = 5,
    ["devon-fall-forward0006"] = 6,
    ["devon-fall-forward0007"] = 7,
    ["devon-fall-forward0008"] = 8,
    ["devon-fall-forward0009"] = 9,
    ["devon-fall-forward0010"] = 10,
    ["devon-fall-forward0011"] = 11,
    ["devon-fall-forward0012"] = 12,
    ["devon-fall-forward0013"] = 13,
    ["devon-fall-forward0014"] = 14,
    ["devon-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
