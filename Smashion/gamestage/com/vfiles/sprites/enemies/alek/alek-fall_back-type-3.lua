--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9b470bda1d99d21b0eb0e796215b82d6$
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
            x=108,
            y=164,
            width=42,
            height=198,

            sourceX = 78,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0002
            x=58,
            y=198,
            width=50,
            height=198,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0003
            x=58,
            y=0,
            width=50,
            height=198,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0004
            x=0,
            y=198,
            width=58,
            height=198,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0005
            x=0,
            y=0,
            width=58,
            height=198,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0006
            x=150,
            y=164,
            width=54,
            height=196,

            sourceX = 80,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0007
            x=204,
            y=164,
            width=78,
            height=182,

            sourceX = 70,
            sourceY = 22,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0008
            x=282,
            y=162,
            width=104,
            height=172,

            sourceX = 58,
            sourceY = 34,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0009
            x=230,
            y=0,
            width=112,
            height=162,

            sourceX = 60,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0010
            x=108,
            y=0,
            width=122,
            height=164,

            sourceX = 56,
            sourceY = 42,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0011
            x=216,
            y=346,
            width=116,
            height=158,

            sourceX = 56,
            sourceY = 50,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0012
            x=108,
            y=362,
            width=108,
            height=146,

            sourceX = 54,
            sourceY = 62,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0013
            x=386,
            y=142,
            width=110,
            height=142,

            sourceX = 54,
            sourceY = 64,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0014
            x=386,
            y=0,
            width=110,
            height=142,

            sourceX = 50,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-fall-away0015
            x=0,
            y=396,
            width=102,
            height=116,

            sourceX = 48,
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
