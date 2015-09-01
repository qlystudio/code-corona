--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4f79e1fd5b86e9a64c323dcb4a7a7067$
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
            -- cara-fall-forward0001
            x=4,
            y=392,
            width=96,
            height=384,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0002
            x=4,
            y=4,
            width=96,
            height=384,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0003
            x=104,
            y=388,
            width=100,
            height=380,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0004
            x=104,
            y=4,
            width=100,
            height=380,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0005
            x=208,
            y=4,
            width=112,
            height=376,

            sourceX = 136,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0006
            x=208,
            y=384,
            width=168,
            height=356,

            sourceX = 112,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0007
            x=324,
            y=4,
            width=232,
            height=340,

            sourceX = 80,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0008
            x=380,
            y=348,
            width=224,
            height=316,

            sourceX = 84,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0009
            x=560,
            y=4,
            width=160,
            height=300,

            sourceX = 96,
            sourceY = 116,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0010
            x=416,
            y=668,
            width=128,
            height=280,

            sourceX = 128,
            sourceY = 140,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0011
            x=724,
            y=4,
            width=156,
            height=244,

            sourceX = 120,
            sourceY = 172,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0012
            x=104,
            y=772,
            width=156,
            height=244,

            sourceX = 120,
            sourceY = 172,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0013
            x=608,
            y=308,
            width=144,
            height=256,

            sourceX = 128,
            sourceY = 168,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0014
            x=548,
            y=668,
            width=148,
            height=260,

            sourceX = 120,
            sourceY = 168,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0015
            x=264,
            y=744,
            width=148,
            height=272,

            sourceX = 116,
            sourceY = 168,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["cara-fall-forward0001"] = 1,
    ["cara-fall-forward0002"] = 2,
    ["cara-fall-forward0003"] = 3,
    ["cara-fall-forward0004"] = 4,
    ["cara-fall-forward0005"] = 5,
    ["cara-fall-forward0006"] = 6,
    ["cara-fall-forward0007"] = 7,
    ["cara-fall-forward0008"] = 8,
    ["cara-fall-forward0009"] = 9,
    ["cara-fall-forward0010"] = 10,
    ["cara-fall-forward0011"] = 11,
    ["cara-fall-forward0012"] = 12,
    ["cara-fall-forward0013"] = 13,
    ["cara-fall-forward0014"] = 14,
    ["cara-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
