--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:787304299e23e0d65ee6224caf6cd9bc$
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
            x=120,
            y=0,
            width=150,
            height=216,

            sourceX = 14,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0002
            x=0,
            y=220,
            width=146,
            height=218,

            sourceX = 16,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0003
            x=422,
            y=216,
            width=146,
            height=214,

            sourceX = 16,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0004
            x=534,
            y=0,
            width=144,
            height=214,

            sourceX = 16,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0005
            x=270,
            y=0,
            width=142,
            height=216,

            sourceX = 16,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0006
            x=146,
            y=216,
            width=142,
            height=216,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0007
            x=288,
            y=216,
            width=134,
            height=216,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0008
            x=412,
            y=0,
            width=122,
            height=216,

            sourceX = 12,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0009
            x=0,
            y=0,
            width=120,
            height=220,

            sourceX = 26,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0010
            x=568,
            y=214,
            width=120,
            height=212,

            sourceX = 26,
            sourceY = 22,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0011
            x=678,
            y=0,
            width=138,
            height=194,

            sourceX = 14,
            sourceY = 48,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0012
            x=688,
            y=316,
            width=148,
            height=192,

            sourceX = 10,
            sourceY = 58,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0013
            x=836,
            y=316,
            width=160,
            height=178,

            sourceX = 2,
            sourceY = 74,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0014
            x=816,
            y=154,
            width=164,
            height=162,

            sourceX = 2,
            sourceY = 92,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-fall-away0015
            x=816,
            y=0,
            width=166,
            height=154,

            sourceX = 4,
            sourceY = 100,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 512
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
