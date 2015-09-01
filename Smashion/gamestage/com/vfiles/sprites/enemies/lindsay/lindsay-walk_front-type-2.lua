--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4465ad64120c3079390fa29507a18359$
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
            -- lindsay-walk-forward0001
            x=0,
            y=644,
            width=162,
            height=210,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0002
            x=0,
            y=0,
            width=160,
            height=216,

            sourceX = 20,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0003
            x=0,
            y=216,
            width=158,
            height=216,

            sourceX = 22,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0004
            x=0,
            y=432,
            width=154,
            height=212,

            sourceX = 24,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0005
            x=314,
            y=426,
            width=156,
            height=210,

            sourceX = 22,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0006
            x=318,
            y=636,
            width=158,
            height=208,

            sourceX = 22,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0007
            x=318,
            y=0,
            width=162,
            height=208,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0008
            x=154,
            y=432,
            width=160,
            height=210,

            sourceX = 20,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0009
            x=160,
            y=0,
            width=158,
            height=210,

            sourceX = 22,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0010
            x=316,
            y=210,
            width=154,
            height=210,

            sourceX = 24,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0011
            x=162,
            y=642,
            width=156,
            height=210,

            sourceX = 22,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0012
            x=158,
            y=216,
            width=158,
            height=210,

            sourceX = 22,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0013
            x=480,
            y=0,
            width=162,
            height=202,

            sourceX = 20,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0014
            x=470,
            y=414,
            width=160,
            height=200,

            sourceX = 20,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-forward0015
            x=470,
            y=208,
            width=158,
            height=206,

            sourceX = 22,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["lindsay-walk-forward0001"] = 1,
    ["lindsay-walk-forward0002"] = 2,
    ["lindsay-walk-forward0003"] = 3,
    ["lindsay-walk-forward0004"] = 4,
    ["lindsay-walk-forward0005"] = 5,
    ["lindsay-walk-forward0006"] = 6,
    ["lindsay-walk-forward0007"] = 7,
    ["lindsay-walk-forward0008"] = 8,
    ["lindsay-walk-forward0009"] = 9,
    ["lindsay-walk-forward0010"] = 10,
    ["lindsay-walk-forward0011"] = 11,
    ["lindsay-walk-forward0012"] = 12,
    ["lindsay-walk-forward0013"] = 13,
    ["lindsay-walk-forward0014"] = 14,
    ["lindsay-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
