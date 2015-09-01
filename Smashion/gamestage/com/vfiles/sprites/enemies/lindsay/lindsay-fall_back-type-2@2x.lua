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
            x=240,
            y=0,
            width=300,
            height=432,

            sourceX = 28,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0002
            x=0,
            y=440,
            width=292,
            height=436,

            sourceX = 32,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0003
            x=844,
            y=432,
            width=292,
            height=428,

            sourceX = 32,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0004
            x=1068,
            y=0,
            width=288,
            height=428,

            sourceX = 32,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0005
            x=540,
            y=0,
            width=284,
            height=432,

            sourceX = 32,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0006
            x=292,
            y=432,
            width=284,
            height=432,

            sourceX = 16,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0007
            x=576,
            y=432,
            width=268,
            height=432,

            sourceX = 12,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0008
            x=824,
            y=0,
            width=244,
            height=432,

            sourceX = 24,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0009
            x=0,
            y=0,
            width=240,
            height=440,

            sourceX = 52,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0010
            x=1136,
            y=428,
            width=240,
            height=424,

            sourceX = 52,
            sourceY = 44,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0011
            x=1356,
            y=0,
            width=276,
            height=388,

            sourceX = 28,
            sourceY = 96,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0012
            x=1376,
            y=632,
            width=296,
            height=384,

            sourceX = 20,
            sourceY = 116,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0013
            x=1672,
            y=632,
            width=320,
            height=356,

            sourceX = 4,
            sourceY = 148,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0014
            x=1632,
            y=308,
            width=328,
            height=324,

            sourceX = 4,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-fall-away0015
            x=1632,
            y=0,
            width=332,
            height=308,

            sourceX = 8,
            sourceY = 200,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 2048,
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
