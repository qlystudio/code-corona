--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:699294ba5b1d515a9320d8c0986afd4f$
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
            -- stella-fall-forward0001
            x=48,
            y=204,
            width=46,
            height=204,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0002
            x=48,
            y=0,
            width=46,
            height=204,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0003
            x=0,
            y=204,
            width=48,
            height=204,

            sourceX = 72,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0004
            x=0,
            y=0,
            width=48,
            height=204,

            sourceX = 72,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0005
            x=94,
            y=176,
            width=58,
            height=198,

            sourceX = 66,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0006
            x=152,
            y=176,
            width=94,
            height=186,

            sourceX = 52,
            sourceY = 24,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0007
            x=94,
            y=0,
            width=130,
            height=176,

            sourceX = 34,
            sourceY = 34,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0008
            x=224,
            y=0,
            width=124,
            height=158,

            sourceX = 36,
            sourceY = 56,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0009
            x=246,
            y=158,
            width=88,
            height=154,

            sourceX = 44,
            sourceY = 68,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0010
            x=176,
            y=362,
            width=72,
            height=144,

            sourceX = 60,
            sourceY = 80,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0011
            x=412,
            y=124,
            width=86,
            height=124,

            sourceX = 56,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0012
            x=412,
            y=0,
            width=86,
            height=124,

            sourceX = 56,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0013
            x=330,
            y=312,
            width=82,
            height=130,

            sourceX = 60,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0014
            x=248,
            y=312,
            width=82,
            height=130,

            sourceX = 60,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0015
            x=94,
            y=374,
            width=82,
            height=134,

            sourceX = 56,
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

    ["stella-fall-forward0001"] = 1,
    ["stella-fall-forward0002"] = 2,
    ["stella-fall-forward0003"] = 3,
    ["stella-fall-forward0004"] = 4,
    ["stella-fall-forward0005"] = 5,
    ["stella-fall-forward0006"] = 6,
    ["stella-fall-forward0007"] = 7,
    ["stella-fall-forward0008"] = 8,
    ["stella-fall-forward0009"] = 9,
    ["stella-fall-forward0010"] = 10,
    ["stella-fall-forward0011"] = 11,
    ["stella-fall-forward0012"] = 12,
    ["stella-fall-forward0013"] = 13,
    ["stella-fall-forward0014"] = 14,
    ["stella-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
