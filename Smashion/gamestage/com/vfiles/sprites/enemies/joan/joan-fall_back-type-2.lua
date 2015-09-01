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
            x=230,
            y=480,
            width=78,
            height=208,

            sourceX = 60,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0002
            x=0,
            y=628,
            width=92,
            height=206,

            sourceX = 60,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0003
            x=122,
            y=448,
            width=108,
            height=206,

            sourceX = 52,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0004
            x=400,
            y=466,
            width=110,
            height=206,

            sourceX = 58,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0005
            x=0,
            y=322,
            width=122,
            height=196,

            sourceX = 44,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0006
            x=304,
            y=174,
            width=142,
            height=180,

            sourceX = 30,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0007
            x=308,
            y=0,
            width=150,
            height=174,

            sourceX = 18,
            sourceY = 36,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0008
            x=0,
            y=0,
            width=154,
            height=166,

            sourceX = 12,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0009
            x=154,
            y=144,
            width=150,
            height=162,

            sourceX = 18,
            sourceY = 48,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0010
            x=0,
            y=166,
            width=144,
            height=156,

            sourceX = 28,
            sourceY = 54,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0011
            x=154,
            y=0,
            width=154,
            height=144,

            sourceX = 26,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0012
            x=144,
            y=306,
            width=138,
            height=142,

            sourceX = 32,
            sourceY = 68,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0013
            x=282,
            y=354,
            width=118,
            height=126,

            sourceX = 40,
            sourceY = 86,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0014
            x=400,
            y=354,
            width=112,
            height=112,

            sourceX = 48,
            sourceY = 100,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-fall-away0015
            x=0,
            y=518,
            width=104,
            height=110,

            sourceX = 58,
            sourceY = 110,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
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
