--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d9c42a43e654668dc0b53d279acb85dc$
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
            -- devon-fall-forward0001
            x=0,
            y=0,
            width=50,
            height=188,

            sourceX = 82,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0002
            x=0,
            y=190,
            width=58,
            height=178,

            sourceX = 82,
            sourceY = 24,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0003
            x=52,
            y=0,
            width=70,
            height=164,

            sourceX = 76,
            sourceY = 34,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0004
            x=60,
            y=166,
            width=78,
            height=146,

            sourceX = 70,
            sourceY = 44,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0005
            x=0,
            y=370,
            width=94,
            height=132,

            sourceX = 60,
            sourceY = 52,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0006
            x=206,
            y=0,
            width=110,
            height=114,

            sourceX = 40,
            sourceY = 72,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0007
            x=318,
            y=96,
            width=118,
            height=94,

            sourceX = 28,
            sourceY = 94,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0008
            x=318,
            y=0,
            width=118,
            height=94,

            sourceX = 28,
            sourceY = 94,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0009
            x=402,
            y=192,
            width=110,
            height=102,

            sourceX = 36,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0010
            x=290,
            y=192,
            width=110,
            height=102,

            sourceX = 36,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0011
            x=186,
            y=360,
            width=102,
            height=108,

            sourceX = 44,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0012
            x=186,
            y=250,
            width=102,
            height=108,

            sourceX = 44,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0013
            x=140,
            y=130,
            width=88,
            height=118,

            sourceX = 58,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0014
            x=96,
            y=314,
            width=88,
            height=118,

            sourceX = 58,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0015
            x=124,
            y=0,
            width=80,
            height=128,

            sourceX = 66,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["devon-fall-forward0001"] = 1,
    ["devon-fall-forward0002"] = 2,
    ["devon-fall-forward0003"] = 3,
    ["devon-fall-forward0004"] = 4,
    ["devon-fall-forward0005"] = 5,
    ["devon-fall-forward0006"] = 6,
    ["devon-fall-forward0007"] = 7,
    ["devon-fall-forward0008"] = 8,
    ["devon-fall-forward0009"] = 9,
    ["devon-fall-forward0010"] = 10,
    ["devon-fall-forward0011"] = 11,
    ["devon-fall-forward0012"] = 12,
    ["devon-fall-forward0013"] = 13,
    ["devon-fall-forward0014"] = 14,
    ["devon-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
