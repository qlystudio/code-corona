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
            y=396,
            width=72,
            height=404,

            sourceX = 28,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0002
            x=164,
            y=376,
            width=76,
            height=404,

            sourceX = 32,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0003
            x=84,
            y=392,
            width=76,
            height=396,

            sourceX = 32,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0004
            x=72,
            y=788,
            width=72,
            height=396,

            sourceX = 32,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0005
            x=0,
            y=800,
            width=72,
            height=388,

            sourceX = 24,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0006
            x=144,
            y=1176,
            width=72,
            height=380,

            sourceX = 20,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0007
            x=164,
            y=0,
            width=80,
            height=376,

            sourceX = 12,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0008
            x=0,
            y=0,
            width=84,
            height=396,

            sourceX = 8,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0009
            x=84,
            y=0,
            width=80,
            height=392,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0010
            x=72,
            y=1184,
            width=68,
            height=388,

            sourceX = 24,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0011
            x=0,
            y=1188,
            width=64,
            height=388,

            sourceX = 28,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0012
            x=0,
            y=1576,
            width=60,
            height=388,

            sourceX = 32,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0013
            x=64,
            y=1572,
            width=64,
            height=380,

            sourceX = 32,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0014
            x=140,
            y=1556,
            width=64,
            height=384,

            sourceX = 32,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0015
            x=160,
            y=780,
            width=72,
            height=396,

            sourceX = 32,
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
