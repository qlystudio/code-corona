--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:84e660092cc92e2db35eaa174938637c$
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
            sourceY = 16,
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
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0003
            x=104,
            y=384,
            width=108,
            height=376,

            sourceX = 140,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0004
            x=104,
            y=4,
            width=108,
            height=376,

            sourceX = 140,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0005
            x=216,
            y=4,
            width=116,
            height=372,

            sourceX = 132,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0006
            x=216,
            y=380,
            width=172,
            height=360,

            sourceX = 108,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0007
            x=336,
            y=4,
            width=236,
            height=348,

            sourceX = 76,
            sourceY = 48,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0008
            x=392,
            y=356,
            width=224,
            height=324,

            sourceX = 84,
            sourceY = 80,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0009
            x=420,
            y=684,
            width=176,
            height=312,

            sourceX = 84,
            sourceY = 104,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0010
            x=600,
            y=684,
            width=148,
            height=292,

            sourceX = 108,
            sourceY = 128,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0011
            x=752,
            y=256,
            width=156,
            height=256,

            sourceX = 120,
            sourceY = 160,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0012
            x=576,
            y=4,
            width=156,
            height=256,

            sourceX = 120,
            sourceY = 160,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0013
            x=752,
            y=4,
            width=164,
            height=248,

            sourceX = 112,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0014
            x=104,
            y=764,
            width=156,
            height=256,

            sourceX = 112,
            sourceY = 176,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-fall-forward0015
            x=264,
            y=744,
            width=152,
            height=264,

            sourceX = 116,
            sourceY = 176,
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
