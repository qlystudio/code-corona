--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9ca05aa69ba65d410735da33f65f103f$
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
            x=164,
            y=376,
            width=76,
            height=404,

            sourceX = 156,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0002
            x=0,
            y=396,
            width=72,
            height=404,

            sourceX = 164,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0003
            x=144,
            y=780,
            width=72,
            height=396,

            sourceX = 164,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0004
            x=0,
            y=800,
            width=72,
            height=396,

            sourceX = 164,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0005
            x=0,
            y=1196,
            width=72,
            height=388,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0006
            x=84,
            y=392,
            width=76,
            height=380,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0007
            x=164,
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
            width=84,
            height=396,

            sourceX = 140,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0009
            x=84,
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
            x=72,
            y=1168,
            width=72,
            height=388,

            sourceX = 152,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0011
            x=144,
            y=1176,
            width=68,
            height=388,

            sourceX = 156,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0012
            x=72,
            y=1556,
            width=64,
            height=388,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0013
            x=136,
            y=1564,
            width=60,
            height=380,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0014
            x=0,
            y=1584,
            width=64,
            height=384,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-forward0015
            x=72,
            y=772,
            width=72,
            height=396,

            sourceX = 160,
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
