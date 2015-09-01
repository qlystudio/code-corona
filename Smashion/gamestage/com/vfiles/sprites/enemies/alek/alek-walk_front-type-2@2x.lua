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
            y=792,
            width=68,
            height=404,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0002
            x=168,
            y=376,
            width=72,
            height=404,

            sourceX = 164,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0003
            x=0,
            y=396,
            width=72,
            height=396,

            sourceX = 164,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0004
            x=88,
            y=392,
            width=72,
            height=396,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0005
            x=160,
            y=780,
            width=72,
            height=388,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0006
            x=72,
            y=788,
            width=72,
            height=380,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0007
            x=168,
            y=0,
            width=80,
            height=376,

            sourceX = 144,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0008
            x=0,
            y=0,
            width=88,
            height=396,

            sourceX = 140,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0009
            x=88,
            y=0,
            width=80,
            height=392,

            sourceX = 144,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0010
            x=68,
            y=1168,
            width=68,
            height=392,

            sourceX = 156,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0011
            x=136,
            y=1168,
            width=64,
            height=392,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0012
            x=0,
            y=1592,
            width=60,
            height=388,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0013
            x=120,
            y=1560,
            width=60,
            height=380,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0014
            x=60,
            y=1592,
            width=60,
            height=384,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0015
            x=0,
            y=1196,
            width=64,
            height=396,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
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
