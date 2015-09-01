--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:33133b06830f3db7712f1ddda325c219$
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
            -- naomi-walk-away0001
            x=468,
            y=0,
            width=156,
            height=420,

            sourceX = 184,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0002
            x=156,
            y=424,
            width=152,
            height=416,

            sourceX = 188,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0003
            x=312,
            y=420,
            width=152,
            height=416,

            sourceX = 188,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0004
            x=464,
            y=832,
            width=148,
            height=416,

            sourceX = 188,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0005
            x=0,
            y=840,
            width=148,
            height=412,

            sourceX = 188,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0006
            x=308,
            y=836,
            width=148,
            height=412,

            sourceX = 188,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0007
            x=776,
            y=416,
            width=152,
            height=416,

            sourceX = 188,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0008
            x=156,
            y=0,
            width=156,
            height=424,

            sourceX = 184,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0009
            x=0,
            y=0,
            width=156,
            height=428,

            sourceX = 184,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0010
            x=312,
            y=0,
            width=156,
            height=420,

            sourceX = 184,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0011
            x=624,
            y=416,
            width=152,
            height=416,

            sourceX = 188,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0012
            x=464,
            y=420,
            width=152,
            height=412,

            sourceX = 188,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0013
            x=0,
            y=428,
            width=152,
            height=412,

            sourceX = 188,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0014
            x=776,
            y=0,
            width=152,
            height=416,

            sourceX = 188,
            sourceY = 20,
            sourceWidth = 563,
            sourceHeight = 512
        },
        {
            -- naomi-walk-away0015
            x=624,
            y=0,
            width=152,
            height=416,

            sourceX = 188,
            sourceY = 24,
            sourceWidth = 563,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["naomi-walk-away0001"] = 1,
    ["naomi-walk-away0002"] = 2,
    ["naomi-walk-away0003"] = 3,
    ["naomi-walk-away0004"] = 4,
    ["naomi-walk-away0005"] = 5,
    ["naomi-walk-away0006"] = 6,
    ["naomi-walk-away0007"] = 7,
    ["naomi-walk-away0008"] = 8,
    ["naomi-walk-away0009"] = 9,
    ["naomi-walk-away0010"] = 10,
    ["naomi-walk-away0011"] = 11,
    ["naomi-walk-away0012"] = 12,
    ["naomi-walk-away0013"] = 13,
    ["naomi-walk-away0014"] = 14,
    ["naomi-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
