--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:129028a9e6aec070d317e2547dc36cc3$
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
            -- devon-walk-forward0001
            x=156,
            y=804,
            width=72,
            height=408,

            sourceX = 28,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0002
            x=164,
            y=0,
            width=80,
            height=404,

            sourceX = 28,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0003
            x=84,
            y=0,
            width=80,
            height=404,

            sourceX = 28,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0004
            x=160,
            y=404,
            width=76,
            height=400,

            sourceX = 28,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0005
            x=0,
            y=1192,
            width=72,
            height=396,

            sourceX = 24,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0006
            x=0,
            y=800,
            width=76,
            height=392,

            sourceX = 20,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0007
            x=80,
            y=404,
            width=80,
            height=388,

            sourceX = 16,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0008
            x=0,
            y=0,
            width=84,
            height=404,

            sourceX = 8,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0009
            x=0,
            y=404,
            width=80,
            height=396,

            sourceX = 12,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0010
            x=80,
            y=792,
            width=76,
            height=396,

            sourceX = 20,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0011
            x=76,
            y=1188,
            width=72,
            height=396,

            sourceX = 24,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0012
            x=0,
            y=1588,
            width=72,
            height=388,

            sourceX = 24,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0013
            x=72,
            y=1584,
            width=72,
            height=388,

            sourceX = 24,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0014
            x=148,
            y=1212,
            width=72,
            height=388,

            sourceX = 24,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0015
            x=144,
            y=1600,
            width=68,
            height=400,

            sourceX = 28,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["devon-walk-forward0001"] = 1,
    ["devon-walk-forward0002"] = 2,
    ["devon-walk-forward0003"] = 3,
    ["devon-walk-forward0004"] = 4,
    ["devon-walk-forward0005"] = 5,
    ["devon-walk-forward0006"] = 6,
    ["devon-walk-forward0007"] = 7,
    ["devon-walk-forward0008"] = 8,
    ["devon-walk-forward0009"] = 9,
    ["devon-walk-forward0010"] = 10,
    ["devon-walk-forward0011"] = 11,
    ["devon-walk-forward0012"] = 12,
    ["devon-walk-forward0013"] = 13,
    ["devon-walk-forward0014"] = 14,
    ["devon-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
