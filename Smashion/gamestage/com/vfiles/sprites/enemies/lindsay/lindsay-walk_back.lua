--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:42d79dc70c6dc06465b1dd21060eb91e$
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
            x=54,
            y=0,
            width=50,
            height=214,

            sourceX = 6,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0002
            x=300,
            y=206,
            width=48,
            height=208,

            sourceX = 6,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0003
            x=348,
            y=206,
            width=48,
            height=204,

            sourceX = 6,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0004
            x=196,
            y=0,
            width=56,
            height=198,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0005
            x=352,
            y=0,
            width=50,
            height=202,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0006
            x=300,
            y=0,
            width=52,
            height=206,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0007
            x=0,
            y=218,
            width=54,
            height=218,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0008
            x=0,
            y=0,
            width=54,
            height=218,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0009
            x=196,
            y=198,
            width=54,
            height=210,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0010
            x=150,
            y=212,
            width=46,
            height=212,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0011
            x=104,
            y=0,
            width=46,
            height=214,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0012
            x=150,
            y=0,
            width=46,
            height=212,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0013
            x=250,
            y=198,
            width=50,
            height=210,

            sourceX = 4,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0014
            x=102,
            y=214,
            width=48,
            height=214,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0015
            x=54,
            y=214,
            width=48,
            height=214,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
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
