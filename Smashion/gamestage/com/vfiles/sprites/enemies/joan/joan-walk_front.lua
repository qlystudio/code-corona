--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d55e24a51a1f9fbeb782297fa28b8855$
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
            -- joan-walk-forward0001
            x=0,
            y=806,
            width=32,
            height=208,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0002
            x=76,
            y=0,
            width=36,
            height=206,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0003
            x=38,
            y=0,
            width=38,
            height=204,

            sourceX = 16,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0004
            x=74,
            y=206,
            width=36,
            height=202,

            sourceX = 16,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0005
            x=36,
            y=408,
            width=36,
            height=200,

            sourceX = 12,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0006
            x=0,
            y=410,
            width=36,
            height=198,

            sourceX = 10,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0007
            x=72,
            y=408,
            width=36,
            height=196,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0008
            x=0,
            y=0,
            width=38,
            height=206,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0009
            x=0,
            y=206,
            width=36,
            height=204,

            sourceX = 8,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0010
            x=38,
            y=204,
            width=36,
            height=204,

            sourceX = 10,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0011
            x=72,
            y=604,
            width=34,
            height=202,

            sourceX = 12,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0012
            x=64,
            y=808,
            width=30,
            height=202,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0013
            x=0,
            y=608,
            width=32,
            height=196,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0014
            x=32,
            y=608,
            width=34,
            height=200,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-forward0015
            x=32,
            y=808,
            width=32,
            height=206,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["joan-walk-forward0001"] = 1,
    ["joan-walk-forward0002"] = 2,
    ["joan-walk-forward0003"] = 3,
    ["joan-walk-forward0004"] = 4,
    ["joan-walk-forward0005"] = 5,
    ["joan-walk-forward0006"] = 6,
    ["joan-walk-forward0007"] = 7,
    ["joan-walk-forward0008"] = 8,
    ["joan-walk-forward0009"] = 9,
    ["joan-walk-forward0010"] = 10,
    ["joan-walk-forward0011"] = 11,
    ["joan-walk-forward0012"] = 12,
    ["joan-walk-forward0013"] = 13,
    ["joan-walk-forward0014"] = 14,
    ["joan-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
