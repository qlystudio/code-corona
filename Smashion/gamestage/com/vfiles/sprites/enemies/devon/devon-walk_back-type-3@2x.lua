--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:8a5807c2efe95ccfea3685762363ffe4$
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
            x=348,
            y=0,
            width=72,
            height=360,

            sourceX = 164,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0002
            x=124,
            y=0,
            width=80,
            height=364,

            sourceX = 164,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0003
            x=876,
            y=0,
            width=72,
            height=348,

            sourceX = 160,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0004
            x=804,
            y=0,
            width=72,
            height=348,

            sourceX = 160,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0005
            x=420,
            y=0,
            width=64,
            height=360,

            sourceX = 156,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0006
            x=544,
            y=0,
            width=60,
            height=360,

            sourceX = 160,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0007
            x=484,
            y=0,
            width=60,
            height=360,

            sourceX = 160,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0008
            x=0,
            y=0,
            width=64,
            height=376,

            sourceX = 156,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0009
            x=64,
            y=0,
            width=60,
            height=376,

            sourceX = 156,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0010
            x=740,
            y=0,
            width=64,
            height=356,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0011
            x=672,
            y=0,
            width=68,
            height=356,

            sourceX = 148,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0012
            x=948,
            y=0,
            width=68,
            height=352,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0013
            x=276,
            y=0,
            width=72,
            height=360,

            sourceX = 156,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0014
            x=604,
            y=0,
            width=68,
            height=356,

            sourceX = 160,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-away0015
            x=204,
            y=0,
            width=72,
            height=360,

            sourceX = 160,
            sourceY = 20,
            sourceWidth = 389,
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
