--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:20797ce830018d6379793b569857e28a$
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
            y=198,
            width=36,
            height=202,

            sourceX = 14,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0002
            x=82,
            y=188,
            width=38,
            height=202,

            sourceX = 16,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0003
            x=42,
            y=196,
            width=38,
            height=198,

            sourceX = 16,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0004
            x=36,
            y=394,
            width=36,
            height=198,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0005
            x=0,
            y=400,
            width=36,
            height=194,

            sourceX = 12,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0006
            x=72,
            y=588,
            width=36,
            height=190,

            sourceX = 10,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0007
            x=82,
            y=0,
            width=40,
            height=188,

            sourceX = 6,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0008
            x=0,
            y=0,
            width=42,
            height=198,

            sourceX = 4,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0009
            x=42,
            y=0,
            width=40,
            height=196,

            sourceX = 6,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0010
            x=36,
            y=592,
            width=34,
            height=194,

            sourceX = 12,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0011
            x=0,
            y=594,
            width=32,
            height=194,

            sourceX = 14,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0012
            x=0,
            y=788,
            width=30,
            height=194,

            sourceX = 16,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0013
            x=32,
            y=786,
            width=32,
            height=190,

            sourceX = 16,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0014
            x=70,
            y=778,
            width=32,
            height=192,

            sourceX = 16,
            sourceY = 6,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- alek-walk-forward0015
            x=80,
            y=390,
            width=36,
            height=198,

            sourceX = 16,
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
