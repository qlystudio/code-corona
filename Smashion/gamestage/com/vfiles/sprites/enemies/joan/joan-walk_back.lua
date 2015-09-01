--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ec04a86943e06efc05287134e6eb5727$
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
            -- joan-walk-away0001
            x=72,
            y=206,
            width=38,
            height=206,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0002
            x=34,
            y=0,
            width=46,
            height=206,

            sourceX = 14,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0003
            x=248,
            y=200,
            width=38,
            height=200,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0004
            x=224,
            y=0,
            width=38,
            height=200,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0005
            x=214,
            y=202,
            width=34,
            height=202,

            sourceX = 14,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0006
            x=182,
            y=204,
            width=32,
            height=204,

            sourceX = 14,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0007
            x=154,
            y=0,
            width=32,
            height=204,

            sourceX = 14,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0008
            x=0,
            y=214,
            width=34,
            height=212,

            sourceX = 12,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0009
            x=0,
            y=0,
            width=34,
            height=214,

            sourceX = 12,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0010
            x=110,
            y=206,
            width=36,
            height=206,

            sourceX = 10,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0011
            x=186,
            y=0,
            width=38,
            height=202,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0012
            x=116,
            y=0,
            width=38,
            height=204,

            sourceX = 10,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0013
            x=146,
            y=204,
            width=36,
            height=204,

            sourceX = 14,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0014
            x=34,
            y=206,
            width=38,
            height=206,

            sourceX = 14,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0015
            x=80,
            y=0,
            width=36,
            height=206,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["joan-walk-away0001"] = 1,
    ["joan-walk-away0002"] = 2,
    ["joan-walk-away0003"] = 3,
    ["joan-walk-away0004"] = 4,
    ["joan-walk-away0005"] = 5,
    ["joan-walk-away0006"] = 6,
    ["joan-walk-away0007"] = 7,
    ["joan-walk-away0008"] = 8,
    ["joan-walk-away0009"] = 9,
    ["joan-walk-away0010"] = 10,
    ["joan-walk-away0011"] = 11,
    ["joan-walk-away0012"] = 12,
    ["joan-walk-away0013"] = 13,
    ["joan-walk-away0014"] = 14,
    ["joan-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
