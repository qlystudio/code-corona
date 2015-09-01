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
            x=110,
            y=0,
            width=40,
            height=204,

            sourceX = 82,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0002
            x=0,
            y=216,
            width=44,
            height=208,

            sourceX = 82,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0003
            x=270,
            y=0,
            width=36,
            height=200,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0004
            x=232,
            y=0,
            width=36,
            height=200,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0005
            x=80,
            y=208,
            width=32,
            height=206,

            sourceX = 80,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0006
            x=76,
            y=0,
            width=32,
            height=206,

            sourceX = 78,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0007
            x=46,
            y=208,
            width=32,
            height=206,

            sourceX = 78,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0008
            x=0,
            y=0,
            width=34,
            height=214,

            sourceX = 76,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0009
            x=154,
            y=206,
            width=34,
            height=204,

            sourceX = 74,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0010
            x=230,
            y=204,
            width=38,
            height=202,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0011
            x=192,
            y=0,
            width=38,
            height=202,

            sourceX = 72,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0012
            x=190,
            y=206,
            width=38,
            height=202,

            sourceX = 74,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0013
            x=152,
            y=0,
            width=38,
            height=204,

            sourceX = 80,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0014
            x=114,
            y=206,
            width=38,
            height=204,

            sourceX = 80,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0015
            x=36,
            y=0,
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
