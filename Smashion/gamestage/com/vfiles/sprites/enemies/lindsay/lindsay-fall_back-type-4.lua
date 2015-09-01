--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:bfbd5ce72b87587c568de5344c8213a1$
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
            -- lindsay-fall-away0001
            x=252,
            y=338,
            width=52,
            height=202,

            sourceX = 70,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0002
            x=196,
            y=298,
            width=56,
            height=206,

            sourceX = 70,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0003
            x=346,
            y=168,
            width=64,
            height=200,

            sourceX = 66,
            sourceY = 14,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0004
            x=0,
            y=650,
            width=70,
            height=198,

            sourceX = 58,
            sourceY = 16,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0005
            x=80,
            y=482,
            width=76,
            height=198,

            sourceX = 54,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0006
            x=0,
            y=458,
            width=80,
            height=192,

            sourceX = 50,
            sourceY = 24,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0007
            x=110,
            y=298,
            width=86,
            height=184,

            sourceX = 46,
            sourceY = 34,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0008
            x=254,
            y=156,
            width=92,
            height=182,

            sourceX = 42,
            sourceY = 42,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0009
            x=0,
            y=280,
            width=110,
            height=178,

            sourceX = 36,
            sourceY = 54,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0010
            x=392,
            y=0,
            width=120,
            height=168,

            sourceX = 26,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0011
            x=264,
            y=0,
            width=128,
            height=156,

            sourceX = 24,
            sourceY = 86,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0012
            x=130,
            y=146,
            width=124,
            height=152,

            sourceX = 34,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0013
            x=134,
            y=0,
            width=130,
            height=146,

            sourceX = 32,
            sourceY = 106,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0014
            x=0,
            y=138,
            width=130,
            height=142,

            sourceX = 32,
            sourceY = 112,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0015
            x=0,
            y=0,
            width=134,
            height=138,

            sourceX = 28,
            sourceY = 116,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["lindsay-fall-away0001"] = 1,
    ["lindsay-fall-away0002"] = 2,
    ["lindsay-fall-away0003"] = 3,
    ["lindsay-fall-away0004"] = 4,
    ["lindsay-fall-away0005"] = 5,
    ["lindsay-fall-away0006"] = 6,
    ["lindsay-fall-away0007"] = 7,
    ["lindsay-fall-away0008"] = 8,
    ["lindsay-fall-away0009"] = 9,
    ["lindsay-fall-away0010"] = 10,
    ["lindsay-fall-away0011"] = 11,
    ["lindsay-fall-away0012"] = 12,
    ["lindsay-fall-away0013"] = 13,
    ["lindsay-fall-away0014"] = 14,
    ["lindsay-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
