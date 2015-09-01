--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:08e9297b7f343594f9901218b0525652$
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
            x=0,
            y=380,
            width=100,
            height=204,

            sourceX = 44,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0002
            x=100,
            y=282,
            width=100,
            height=204,

            sourceX = 46,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0003
            x=234,
            y=258,
            width=100,
            height=204,

            sourceX = 44,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0004
            x=0,
            y=176,
            width=100,
            height=204,

            sourceX = 46,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0005
            x=334,
            y=260,
            width=100,
            height=198,

            sourceX = 44,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0006
            x=334,
            y=458,
            width=100,
            height=186,

            sourceX = 46,
            sourceY = 24,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0007
            x=0,
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
            x=130,
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
            x=200,
            y=462,
            width=100,
            height=154,

            sourceX = 44,
            sourceY = 68,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0010
            x=100,
            y=486,
            width=100,
            height=144,

            sourceX = 46,
            sourceY = 80,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0011
            x=130,
            y=158,
            width=104,
            height=124,

            sourceX = 42,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0012
            x=254,
            y=134,
            width=104,
            height=124,

            sourceX = 42,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0013
            x=370,
            y=130,
            width=110,
            height=130,

            sourceX = 38,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0014
            x=370,
            y=0,
            width=110,
            height=130,

            sourceX = 38,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-forward0015
            x=254,
            y=0,
            width=116,
            height=134,

            sourceX = 34,
            sourceY = 96,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
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
