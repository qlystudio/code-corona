--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9a8e05ef4e467125a8bcee3a459e5cd6$
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
            -- alek-walk-forward0001
            x=0,
            y=396,
            width=34,
            height=202,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0002
            x=84,
            y=188,
            width=36,
            height=202,

            sourceX = 82,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0003
            x=0,
            y=198,
            width=36,
            height=198,

            sourceX = 82,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0004
            x=44,
            y=196,
            width=36,
            height=198,

            sourceX = 82,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0005
            x=80,
            y=390,
            width=36,
            height=194,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0006
            x=36,
            y=394,
            width=36,
            height=190,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0007
            x=84,
            y=0,
            width=40,
            height=188,

            sourceX = 72,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0008
            x=0,
            y=0,
            width=44,
            height=198,

            sourceX = 70,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0009
            x=44,
            y=0,
            width=40,
            height=196,

            sourceX = 72,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0010
            x=34,
            y=584,
            width=34,
            height=196,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0011
            x=68,
            y=584,
            width=32,
            height=196,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0012
            x=0,
            y=796,
            width=30,
            height=194,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0013
            x=60,
            y=780,
            width=30,
            height=190,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0014
            x=30,
            y=796,
            width=30,
            height=192,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0015
            x=0,
            y=598,
            width=32,
            height=198,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["alek-walk-forward0001"] = 1,
    ["alek-walk-forward0002"] = 2,
    ["alek-walk-forward0003"] = 3,
    ["alek-walk-forward0004"] = 4,
    ["alek-walk-forward0005"] = 5,
    ["alek-walk-forward0006"] = 6,
    ["alek-walk-forward0007"] = 7,
    ["alek-walk-forward0008"] = 8,
    ["alek-walk-forward0009"] = 9,
    ["alek-walk-forward0010"] = 10,
    ["alek-walk-forward0011"] = 11,
    ["alek-walk-forward0012"] = 12,
    ["alek-walk-forward0013"] = 13,
    ["alek-walk-forward0014"] = 14,
    ["alek-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
