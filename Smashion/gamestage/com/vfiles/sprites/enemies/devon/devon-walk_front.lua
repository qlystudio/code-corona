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
            x=78,
            y=402,
            width=36,
            height=204,

            sourceX = 14,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0002
            x=82,
            y=0,
            width=40,
            height=202,

            sourceX = 14,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0003
            x=42,
            y=0,
            width=40,
            height=202,

            sourceX = 14,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0004
            x=80,
            y=202,
            width=38,
            height=200,

            sourceX = 14,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0005
            x=0,
            y=596,
            width=36,
            height=198,

            sourceX = 12,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0006
            x=0,
            y=400,
            width=38,
            height=196,

            sourceX = 10,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0007
            x=40,
            y=202,
            width=40,
            height=194,

            sourceX = 8,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0008
            x=0,
            y=0,
            width=42,
            height=202,

            sourceX = 4,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0009
            x=0,
            y=202,
            width=40,
            height=198,

            sourceX = 6,
            sourceY = 10,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0010
            x=40,
            y=396,
            width=38,
            height=198,

            sourceX = 10,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0011
            x=38,
            y=594,
            width=36,
            height=198,

            sourceX = 12,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0012
            x=0,
            y=794,
            width=36,
            height=194,

            sourceX = 12,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0013
            x=36,
            y=792,
            width=36,
            height=194,

            sourceX = 12,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0014
            x=74,
            y=606,
            width=36,
            height=194,

            sourceX = 12,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0015
            x=72,
            y=800,
            width=34,
            height=200,

            sourceX = 14,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 1024
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
