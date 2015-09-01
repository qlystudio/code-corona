--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:3c0b1dfbbdf1831bc31cee803d8cf7e0$
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
            -- stella-walk-forward0001
            x=92,
            y=0,
            width=48,
            height=204,

            sourceX = 72,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0002
            x=90,
            y=206,
            width=48,
            height=204,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0003
            x=40,
            y=206,
            width=48,
            height=204,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0004
            x=40,
            y=0,
            width=50,
            height=204,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0005
            x=142,
            y=0,
            width=48,
            height=202,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0006
            x=256,
            y=202,
            width=44,
            height=200,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0007
            x=0,
            y=208,
            width=38,
            height=206,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0008
            x=0,
            y=0,
            width=38,
            height=206,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0009
            x=212,
            y=204,
            width=42,
            height=202,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0010
            x=192,
            y=0,
            width=46,
            height=202,

            sourceX = 72,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0011
            x=140,
            y=206,
            width=70,
            height=202,

            sourceX = 72,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0012
            x=240,
            y=0,
            width=48,
            height=200,

            sourceX = 72,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0013
            x=302,
            y=200,
            width=48,
            height=196,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0014
            x=338,
            y=0,
            width=46,
            height=196,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0015
            x=290,
            y=0,
            width=46,
            height=198,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["stella-walk-forward0001"] = 1,
    ["stella-walk-forward0002"] = 2,
    ["stella-walk-forward0003"] = 3,
    ["stella-walk-forward0004"] = 4,
    ["stella-walk-forward0005"] = 5,
    ["stella-walk-forward0006"] = 6,
    ["stella-walk-forward0007"] = 7,
    ["stella-walk-forward0008"] = 8,
    ["stella-walk-forward0009"] = 9,
    ["stella-walk-forward0010"] = 10,
    ["stella-walk-forward0011"] = 11,
    ["stella-walk-forward0012"] = 12,
    ["stella-walk-forward0013"] = 13,
    ["stella-walk-forward0014"] = 14,
    ["stella-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
