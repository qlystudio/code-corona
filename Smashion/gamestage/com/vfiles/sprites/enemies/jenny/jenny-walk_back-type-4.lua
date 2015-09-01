--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:731920f1469a6a86e10c2592aae52d34$
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
            x=112,
            y=0,
            width=110,
            height=204,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0002
            x=0,
            y=0,
            width=110,
            height=208,

            sourceX = 36,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0003
            x=336,
            y=0,
            width=110,
            height=200,

            sourceX = 36,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0004
            x=224,
            y=0,
            width=110,
            height=200,

            sourceX = 36,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0005
            x=112,
            y=206,
            width=106,
            height=206,

            sourceX = 38,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0006
            x=332,
            y=408,
            width=104,
            height=206,

            sourceX = 40,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0007
            x=108,
            y=414,
            width=102,
            height=214,

            sourceX = 40,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0008
            x=220,
            y=410,
            width=102,
            height=214,

            sourceX = 40,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0009
            x=0,
            y=416,
            width=100,
            height=204,

            sourceX = 42,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0010
            x=102,
            y=820,
            width=100,
            height=202,

            sourceX = 42,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0011
            x=324,
            y=616,
            width=100,
            height=202,

            sourceX = 42,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0012
            x=0,
            y=622,
            width=100,
            height=202,

            sourceX = 42,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0013
            x=332,
            y=202,
            width=106,
            height=204,

            sourceX = 38,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0014
            x=0,
            y=210,
            width=106,
            height=204,

            sourceX = 38,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-walk-away0015
            x=224,
            y=202,
            width=106,
            height=206,

            sourceX = 38,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
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
