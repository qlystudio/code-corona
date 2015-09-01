--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:823d010ceaceda35e67bf40fb34f797a$
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
            x=224,
            y=0,
            width=220,
            height=408,

            sourceX = 72,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0002
            x=0,
            y=0,
            width=220,
            height=416,

            sourceX = 72,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0003
            x=672,
            y=0,
            width=220,
            height=400,

            sourceX = 72,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0004
            x=448,
            y=0,
            width=220,
            height=400,

            sourceX = 72,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0005
            x=224,
            y=412,
            width=212,
            height=412,

            sourceX = 76,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0006
            x=664,
            y=816,
            width=208,
            height=412,

            sourceX = 80,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0007
            x=216,
            y=828,
            width=204,
            height=428,

            sourceX = 80,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0008
            x=440,
            y=820,
            width=204,
            height=428,

            sourceX = 80,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0009
            x=0,
            y=832,
            width=200,
            height=408,

            sourceX = 84,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0010
            x=204,
            y=1640,
            width=200,
            height=404,

            sourceX = 84,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0011
            x=648,
            y=1232,
            width=200,
            height=404,

            sourceX = 84,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0012
            x=0,
            y=1244,
            width=200,
            height=404,

            sourceX = 84,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0013
            x=664,
            y=404,
            width=212,
            height=408,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0014
            x=0,
            y=420,
            width=212,
            height=408,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-away0015
            x=448,
            y=404,
            width=212,
            height=412,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
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
