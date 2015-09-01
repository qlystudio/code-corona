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
            y=816,
            width=184,
            height=416,

            sourceX = 104,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0002
            x=192,
            y=0,
            width=188,
            height=416,

            sourceX = 104,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0003
            x=568,
            y=0,
            width=188,
            height=404,

            sourceX = 104,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0004
            x=380,
            y=0,
            width=188,
            height=404,

            sourceX = 104,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0005
            x=564,
            y=812,
            width=176,
            height=408,

            sourceX = 108,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0006
            x=744,
            y=428,
            width=176,
            height=412,

            sourceX = 108,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0007
            x=188,
            y=416,
            width=184,
            height=428,

            sourceX = 100,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0008
            x=380,
            y=404,
            width=184,
            height=428,

            sourceX = 100,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0009
            x=756,
            y=0,
            width=184,
            height=428,

            sourceX = 100,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0010
            x=0,
            y=404,
            width=188,
            height=412,

            sourceX = 96,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0011
            x=0,
            y=0,
            width=192,
            height=404,

            sourceX = 96,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0012
            x=564,
            y=404,
            width=180,
            height=408,

            sourceX = 104,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0013
            x=184,
            y=844,
            width=164,
            height=408,

            sourceX = 112,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0014
            x=0,
            y=1232,
            width=156,
            height=412,

            sourceX = 116,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- joan-walk-away0015
            x=372,
            y=832,
            width=164,
            height=416,

            sourceX = 112,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
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
