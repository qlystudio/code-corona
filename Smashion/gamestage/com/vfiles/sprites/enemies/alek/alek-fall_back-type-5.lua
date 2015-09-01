--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:856534014bf967368e5758959b08f290$
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
            -- alek-fall-away0001
            x=112,
            y=166,
            width=40,
            height=198,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0002
            x=60,
            y=198,
            width=52,
            height=198,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0003
            x=60,
            y=0,
            width=52,
            height=198,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0004
            x=0,
            y=198,
            width=60,
            height=198,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0005
            x=0,
            y=0,
            width=60,
            height=198,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0006
            x=152,
            y=166,
            width=56,
            height=196,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0007
            x=208,
            y=166,
            width=78,
            height=182,

            sourceX = 70,
            sourceY = 22,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0008
            x=286,
            y=158,
            width=104,
            height=170,

            sourceX = 58,
            sourceY = 36,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0009
            x=222,
            y=348,
            width=112,
            height=164,

            sourceX = 60,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0010
            x=112,
            y=0,
            width=124,
            height=166,

            sourceX = 54,
            sourceY = 42,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0011
            x=236,
            y=0,
            width=118,
            height=158,

            sourceX = 54,
            sourceY = 50,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0012
            x=112,
            y=364,
            width=110,
            height=146,

            sourceX = 52,
            sourceY = 62,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0013
            x=390,
            y=0,
            width=112,
            height=144,

            sourceX = 52,
            sourceY = 64,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0014
            x=390,
            y=144,
            width=112,
            height=142,

            sourceX = 48,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0015
            x=0,
            y=396,
            width=104,
            height=116,

            sourceX = 46,
            sourceY = 94,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["alek-fall-away0001"] = 1,
    ["alek-fall-away0002"] = 2,
    ["alek-fall-away0003"] = 3,
    ["alek-fall-away0004"] = 4,
    ["alek-fall-away0005"] = 5,
    ["alek-fall-away0006"] = 6,
    ["alek-fall-away0007"] = 7,
    ["alek-fall-away0008"] = 8,
    ["alek-fall-away0009"] = 9,
    ["alek-fall-away0010"] = 10,
    ["alek-fall-away0011"] = 11,
    ["alek-fall-away0012"] = 12,
    ["alek-fall-away0013"] = 13,
    ["alek-fall-away0014"] = 14,
    ["alek-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
