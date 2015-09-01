--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0d472708d4df3260882435115943790a$
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
            width=80,
            height=408,

            sourceX = 164,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0002
            x=0,
            y=432,
            width=88,
            height=416,

            sourceX = 164,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0003
            x=540,
            y=0,
            width=72,
            height=400,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0004
            x=464,
            y=0,
            width=72,
            height=400,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0005
            x=160,
            y=416,
            width=64,
            height=412,

            sourceX = 160,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0006
            x=152,
            y=0,
            width=64,
            height=412,

            sourceX = 156,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0007
            x=92,
            y=416,
            width=64,
            height=412,

            sourceX = 156,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0008
            x=0,
            y=0,
            width=68,
            height=428,

            sourceX = 152,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0009
            x=308,
            y=412,
            width=68,
            height=408,

            sourceX = 148,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0010
            x=460,
            y=408,
            width=76,
            height=404,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0011
            x=384,
            y=0,
            width=76,
            height=404,

            sourceX = 144,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0012
            x=380,
            y=412,
            width=76,
            height=404,

            sourceX = 148,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0013
            x=304,
            y=0,
            width=76,
            height=408,

            sourceX = 160,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0014
            x=228,
            y=412,
            width=76,
            height=408,

            sourceX = 160,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0015
            x=72,
            y=0,
            width=76,
            height=412,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
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
