--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a43e19c71a154b65978b4a3607d9a7b8$
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
            -- joan-fall-away0001
            x=460,
            y=960,
            width=156,
            height=416,

            sourceX = 120,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0002
            x=0,
            y=1256,
            width=184,
            height=412,

            sourceX = 120,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0003
            x=244,
            y=896,
            width=216,
            height=412,

            sourceX = 104,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0004
            x=800,
            y=932,
            width=220,
            height=412,

            sourceX = 116,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0005
            x=0,
            y=644,
            width=244,
            height=392,

            sourceX = 88,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0006
            x=608,
            y=348,
            width=284,
            height=360,

            sourceX = 60,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0007
            x=616,
            y=0,
            width=300,
            height=348,

            sourceX = 36,
            sourceY = 72,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0008
            x=0,
            y=0,
            width=308,
            height=332,

            sourceX = 24,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0009
            x=308,
            y=288,
            width=300,
            height=324,

            sourceX = 36,
            sourceY = 96,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0010
            x=0,
            y=332,
            width=288,
            height=312,

            sourceX = 56,
            sourceY = 108,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0011
            x=308,
            y=0,
            width=308,
            height=288,

            sourceX = 52,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0012
            x=288,
            y=612,
            width=276,
            height=284,

            sourceX = 64,
            sourceY = 136,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0013
            x=564,
            y=708,
            width=236,
            height=252,

            sourceX = 80,
            sourceY = 172,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0014
            x=800,
            y=708,
            width=224,
            height=224,

            sourceX = 96,
            sourceY = 200,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-fall-away0015
            x=0,
            y=1036,
            width=208,
            height=220,

            sourceX = 116,
            sourceY = 220,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["joan-fall-away0001"] = 1,
    ["joan-fall-away0002"] = 2,
    ["joan-fall-away0003"] = 3,
    ["joan-fall-away0004"] = 4,
    ["joan-fall-away0005"] = 5,
    ["joan-fall-away0006"] = 6,
    ["joan-fall-away0007"] = 7,
    ["joan-fall-away0008"] = 8,
    ["joan-fall-away0009"] = 9,
    ["joan-fall-away0010"] = 10,
    ["joan-fall-away0011"] = 11,
    ["joan-fall-away0012"] = 12,
    ["joan-fall-away0013"] = 13,
    ["joan-fall-away0014"] = 14,
    ["joan-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
