--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0b6e441bc89b2544be393bdd27eee348$
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
            width=52,
            height=188,

            sourceX = 80,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0002
            x=0,
            y=190,
            width=58,
            height=174,

            sourceX = 82,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0003
            x=54,
            y=0,
            width=70,
            height=160,

            sourceX = 76,
            sourceY = 38,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0004
            x=0,
            y=366,
            width=78,
            height=144,

            sourceX = 70,
            sourceY = 46,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0005
            x=60,
            y=162,
            width=94,
            height=128,

            sourceX = 60,
            sourceY = 56,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0006
            x=208,
            y=0,
            width=110,
            height=110,

            sourceX = 40,
            sourceY = 76,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0007
            x=350,
            y=194,
            width=118,
            height=90,

            sourceX = 28,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0008
            x=350,
            y=102,
            width=118,
            height=90,

            sourceX = 28,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0009
            x=320,
            y=0,
            width=110,
            height=100,

            sourceX = 36,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0010
            x=80,
            y=412,
            width=110,
            height=100,

            sourceX = 36,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0011
            x=246,
            y=112,
            width=102,
            height=108,

            sourceX = 44,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0012
            x=170,
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
            x=156,
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
            x=80,
            y=292,
            width=88,
            height=118,

            sourceX = 58,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-fall-forward0015
            x=126,
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
