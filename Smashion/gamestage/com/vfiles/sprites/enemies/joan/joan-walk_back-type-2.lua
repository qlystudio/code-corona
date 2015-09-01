--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a80093f61c1eee42a49ef4e4b12f5e2a$
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
            x=0,
            y=408,
            width=92,
            height=208,

            sourceX = 52,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0002
            x=96,
            y=0,
            width=94,
            height=208,

            sourceX = 52,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0003
            x=284,
            y=0,
            width=94,
            height=202,

            sourceX = 52,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0004
            x=190,
            y=0,
            width=94,
            height=202,

            sourceX = 52,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0005
            x=282,
            y=406,
            width=88,
            height=204,

            sourceX = 54,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0006
            x=372,
            y=214,
            width=88,
            height=206,

            sourceX = 54,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0007
            x=94,
            y=208,
            width=92,
            height=214,

            sourceX = 50,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0008
            x=190,
            y=202,
            width=92,
            height=214,

            sourceX = 50,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0009
            x=378,
            y=0,
            width=92,
            height=214,

            sourceX = 50,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0010
            x=0,
            y=202,
            width=94,
            height=206,

            sourceX = 48,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0011
            x=0,
            y=0,
            width=96,
            height=202,

            sourceX = 48,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0012
            x=282,
            y=202,
            width=90,
            height=204,

            sourceX = 52,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0013
            x=92,
            y=422,
            width=82,
            height=204,

            sourceX = 56,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0014
            x=0,
            y=616,
            width=78,
            height=206,

            sourceX = 58,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- joan-walk-away0015
            x=186,
            y=416,
            width=82,
            height=208,

            sourceX = 56,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
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
