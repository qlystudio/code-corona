--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:bf82e67613d242f824869856cd67bb28$
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
            -- devon-fall-away0001
            x=0,
            y=0,
            width=40,
            height=198,

            sourceX = 72,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0002
            x=0,
            y=198,
            width=50,
            height=196,

            sourceX = 60,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0003
            x=40,
            y=0,
            width=58,
            height=194,

            sourceX = 52,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0004
            x=50,
            y=194,
            width=54,
            height=192,

            sourceX = 58,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0005
            x=98,
            y=0,
            width=80,
            height=182,

            sourceX = 44,
            sourceY = 24,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0006
            x=178,
            y=0,
            width=106,
            height=166,

            sourceX = 30,
            sourceY = 40,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0007
            x=230,
            y=166,
            width=114,
            height=164,

            sourceX = 18,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0008
            x=104,
            y=182,
            width=126,
            height=168,

            sourceX = 12,
            sourceY = 40,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0009
            x=104,
            y=350,
            width=120,
            height=162,

            sourceX = 18,
            sourceY = 48,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0010
            x=224,
            y=350,
            width=112,
            height=148,

            sourceX = 28,
            sourceY = 60,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0011
            x=284,
            y=0,
            width=114,
            height=144,

            sourceX = 26,
            sourceY = 64,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0012
            x=398,
            y=0,
            width=110,
            height=142,

            sourceX = 32,
            sourceY = 66,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0013
            x=0,
            y=394,
            width=104,
            height=116,

            sourceX = 40,
            sourceY = 94,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0014
            x=398,
            y=142,
            width=96,
            height=106,

            sourceX = 48,
            sourceY = 104,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-away0015
            x=344,
            y=248,
            width=86,
            height=92,

            sourceX = 58,
            sourceY = 118,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["devon-fall-away0001"] = 1,
    ["devon-fall-away0002"] = 2,
    ["devon-fall-away0003"] = 3,
    ["devon-fall-away0004"] = 4,
    ["devon-fall-away0005"] = 5,
    ["devon-fall-away0006"] = 6,
    ["devon-fall-away0007"] = 7,
    ["devon-fall-away0008"] = 8,
    ["devon-fall-away0009"] = 9,
    ["devon-fall-away0010"] = 10,
    ["devon-fall-away0011"] = 11,
    ["devon-fall-away0012"] = 12,
    ["devon-fall-away0013"] = 13,
    ["devon-fall-away0014"] = 14,
    ["devon-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
