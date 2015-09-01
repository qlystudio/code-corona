--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:5c3c5dd18aac24b29af36eedf51c1881$
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
            -- devon-walk-away0001
            x=280,
            y=0,
            width=72,
            height=360,

            sourceX = 36,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0002
            x=128,
            y=0,
            width=80,
            height=364,

            sourceX = 32,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0003
            x=948,
            y=0,
            width=68,
            height=348,

            sourceX = 32,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0004
            x=880,
            y=0,
            width=68,
            height=348,

            sourceX = 32,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0005
            x=420,
            y=0,
            width=64,
            height=360,

            sourceX = 24,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0006
            x=544,
            y=0,
            width=60,
            height=360,

            sourceX = 28,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0007
            x=484,
            y=0,
            width=60,
            height=360,

            sourceX = 28,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0008
            x=64,
            y=0,
            width=64,
            height=376,

            sourceX = 24,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0009
            x=0,
            y=0,
            width=64,
            height=376,

            sourceX = 24,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0010
            x=748,
            y=0,
            width=64,
            height=356,

            sourceX = 24,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0011
            x=676,
            y=0,
            width=72,
            height=356,

            sourceX = 16,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0012
            x=812,
            y=0,
            width=68,
            height=352,

            sourceX = 20,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0013
            x=352,
            y=0,
            width=68,
            height=360,

            sourceX = 28,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0014
            x=604,
            y=0,
            width=72,
            height=356,

            sourceX = 28,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0015
            x=208,
            y=0,
            width=72,
            height=360,

            sourceX = 32,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["devon-walk-away0001"] = 1,
    ["devon-walk-away0002"] = 2,
    ["devon-walk-away0003"] = 3,
    ["devon-walk-away0004"] = 4,
    ["devon-walk-away0005"] = 5,
    ["devon-walk-away0006"] = 6,
    ["devon-walk-away0007"] = 7,
    ["devon-walk-away0008"] = 8,
    ["devon-walk-away0009"] = 9,
    ["devon-walk-away0010"] = 10,
    ["devon-walk-away0011"] = 11,
    ["devon-walk-away0012"] = 12,
    ["devon-walk-away0013"] = 13,
    ["devon-walk-away0014"] = 14,
    ["devon-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
