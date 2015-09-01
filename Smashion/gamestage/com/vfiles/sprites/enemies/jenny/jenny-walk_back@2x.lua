--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:20c568c783900e9a9cc77d13d842ac19$
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
            -- jenny-walk-away0001
            x=220,
            y=0,
            width=84,
            height=408,

            sourceX = 32,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0002
            x=0,
            y=432,
            width=84,
            height=416,

            sourceX = 36,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0003
            x=536,
            y=0,
            width=68,
            height=400,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0004
            x=464,
            y=0,
            width=68,
            height=400,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0005
            x=156,
            y=416,
            width=60,
            height=412,

            sourceX = 32,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0006
            x=152,
            y=0,
            width=64,
            height=412,

            sourceX = 28,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0007
            x=88,
            y=416,
            width=64,
            height=412,

            sourceX = 28,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0008
            x=0,
            y=0,
            width=68,
            height=428,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0009
            x=308,
            y=0,
            width=68,
            height=408,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0010
            x=380,
            y=0,
            width=80,
            height=404,

            sourceX = 12,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0011
            x=372,
            y=412,
            width=80,
            height=404,

            sourceX = 12,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0012
            x=456,
            y=408,
            width=76,
            height=404,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0013
            x=296,
            y=412,
            width=72,
            height=408,

            sourceX = 32,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0014
            x=220,
            y=412,
            width=72,
            height=408,

            sourceX = 32,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0015
            x=72,
            y=0,
            width=76,
            height=412,

            sourceX = 32,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["jenny-walk-away0001"] = 1,
    ["jenny-walk-away0002"] = 2,
    ["jenny-walk-away0003"] = 3,
    ["jenny-walk-away0004"] = 4,
    ["jenny-walk-away0005"] = 5,
    ["jenny-walk-away0006"] = 6,
    ["jenny-walk-away0007"] = 7,
    ["jenny-walk-away0008"] = 8,
    ["jenny-walk-away0009"] = 9,
    ["jenny-walk-away0010"] = 10,
    ["jenny-walk-away0011"] = 11,
    ["jenny-walk-away0012"] = 12,
    ["jenny-walk-away0013"] = 13,
    ["jenny-walk-away0014"] = 14,
    ["jenny-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
