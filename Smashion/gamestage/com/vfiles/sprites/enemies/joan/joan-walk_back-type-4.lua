--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:7b830627cf472608b07b4a27703b9c51$
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
            x=34,
            y=206,
            width=40,
            height=206,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0002
            x=34,
            y=0,
            width=46,
            height=206,

            sourceX = 78,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0003
            x=252,
            y=200,
            width=36,
            height=200,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0004
            x=224,
            y=0,
            width=36,
            height=200,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0005
            x=216,
            y=202,
            width=36,
            height=202,

            sourceX = 78,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0006
            x=182,
            y=204,
            width=34,
            height=204,

            sourceX = 78,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0007
            x=154,
            y=0,
            width=34,
            height=204,

            sourceX = 78,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0008
            x=0,
            y=214,
            width=34,
            height=212,

            sourceX = 78,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0009
            x=0,
            y=0,
            width=34,
            height=214,

            sourceX = 78,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0010
            x=112,
            y=206,
            width=34,
            height=206,

            sourceX = 76,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0011
            x=188,
            y=0,
            width=36,
            height=202,

            sourceX = 74,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0012
            x=146,
            y=204,
            width=36,
            height=204,

            sourceX = 76,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0013
            x=118,
            y=0,
            width=36,
            height=204,

            sourceX = 80,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0014
            x=80,
            y=0,
            width=38,
            height=206,

            sourceX = 80,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0015
            x=74,
            y=206,
            width=38,
            height=206,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
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
