--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:15960c346d4b5d7fb0d0e1c92b6d0c8d$
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
            -- stella-fall-away0001
            x=94,
            y=502,
            width=94,
            height=206,

            sourceX = 54,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0002
            x=212,
            y=346,
            width=94,
            height=206,

            sourceX = 54,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0003
            x=364,
            y=184,
            width=94,
            height=206,

            sourceX = 54,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0004
            x=0,
            y=480,
            width=94,
            height=206,

            sourceX = 54,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0005
            x=0,
            y=686,
            width=94,
            height=202,

            sourceX = 54,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0006
            x=306,
            y=390,
            width=94,
            height=200,

            sourceX = 52,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0007
            x=114,
            y=308,
            width=98,
            height=194,

            sourceX = 48,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0008
            x=262,
            y=160,
            width=102,
            height=186,

            sourceX = 46,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0009
            x=400,
            y=0,
            width=112,
            height=184,

            sourceX = 42,
            sourceY = 36,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0010
            x=0,
            y=300,
            width=114,
            height=180,

            sourceX = 36,
            sourceY = 48,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0011
            x=134,
            y=138,
            width=128,
            height=170,

            sourceX = 24,
            sourceY = 60,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0012
            x=268,
            y=0,
            width=132,
            height=160,

            sourceX = 24,
            sourceY = 78,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0013
            x=0,
            y=144,
            width=128,
            height=156,

            sourceX = 34,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0014
            x=0,
            y=0,
            width=134,
            height=144,

            sourceX = 32,
            sourceY = 104,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0015
            x=134,
            y=0,
            width=134,
            height=138,

            sourceX = 32,
            sourceY = 112,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["stella-fall-away0001"] = 1,
    ["stella-fall-away0002"] = 2,
    ["stella-fall-away0003"] = 3,
    ["stella-fall-away0004"] = 4,
    ["stella-fall-away0005"] = 5,
    ["stella-fall-away0006"] = 6,
    ["stella-fall-away0007"] = 7,
    ["stella-fall-away0008"] = 8,
    ["stella-fall-away0009"] = 9,
    ["stella-fall-away0010"] = 10,
    ["stella-fall-away0011"] = 11,
    ["stella-fall-away0012"] = 12,
    ["stella-fall-away0013"] = 13,
    ["stella-fall-away0014"] = 14,
    ["stella-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
