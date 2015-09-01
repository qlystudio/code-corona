--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:895e457d9a3393eeb8146d479438ed3f$
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
            -- lindsay-walk-away0001
            x=316,
            y=848,
            width=328,
            height=420,

            sourceX = 24,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0002
            x=632,
            y=0,
            width=324,
            height=412,

            sourceX = 28,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0003
            x=960,
            y=408,
            width=320,
            height=404,

            sourceX = 32,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0004
            x=648,
            y=1636,
            width=312,
            height=396,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0005
            x=648,
            y=1232,
            width=316,
            height=404,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0006
            x=644,
            y=824,
            width=320,
            height=408,

            sourceX = 32,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0007
            x=0,
            y=1272,
            width=328,
            height=420,

            sourceX = 32,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0008
            x=0,
            y=424,
            width=320,
            height=424,

            sourceX = 36,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0009
            x=640,
            y=412,
            width=320,
            height=412,

            sourceX = 36,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0010
            x=320,
            y=0,
            width=312,
            height=420,

            sourceX = 40,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0011
            x=0,
            y=848,
            width=316,
            height=424,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0012
            x=320,
            y=420,
            width=320,
            height=416,

            sourceX = 32,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0013
            x=956,
            y=0,
            width=328,
            height=408,

            sourceX = 28,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0014
            x=328,
            y=1268,
            width=320,
            height=420,

            sourceX = 28,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-away0015
            x=0,
            y=0,
            width=320,
            height=424,

            sourceX = 28,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 2048,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["lindsay-walk-away0001"] = 1,
    ["lindsay-walk-away0002"] = 2,
    ["lindsay-walk-away0003"] = 3,
    ["lindsay-walk-away0004"] = 4,
    ["lindsay-walk-away0005"] = 5,
    ["lindsay-walk-away0006"] = 6,
    ["lindsay-walk-away0007"] = 7,
    ["lindsay-walk-away0008"] = 8,
    ["lindsay-walk-away0009"] = 9,
    ["lindsay-walk-away0010"] = 10,
    ["lindsay-walk-away0011"] = 11,
    ["lindsay-walk-away0012"] = 12,
    ["lindsay-walk-away0013"] = 13,
    ["lindsay-walk-away0014"] = 14,
    ["lindsay-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
