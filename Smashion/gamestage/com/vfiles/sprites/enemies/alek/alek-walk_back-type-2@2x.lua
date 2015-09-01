--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c28d1b283c9236cb8c4dae1c53cff163$
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
            -- alek-walk-away0001
            x=92,
            y=0,
            width=80,
            height=396,

            sourceX = 164,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0002
            x=0,
            y=0,
            width=92,
            height=400,

            sourceX = 160,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0003
            x=144,
            y=1184,
            width=72,
            height=384,

            sourceX = 164,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0004
            x=144,
            y=796,
            width=72,
            height=388,

            sourceX = 164,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0005
            x=196,
            y=1568,
            width=60,
            height=400,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0006
            x=132,
            y=1616,
            width=64,
            height=400,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0007
            x=68,
            y=1616,
            width=64,
            height=400,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0008
            x=68,
            y=1200,
            width=68,
            height=416,

            sourceX = 156,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0009
            x=0,
            y=1568,
            width=68,
            height=416,

            sourceX = 156,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0010
            x=72,
            y=796,
            width=72,
            height=404,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0011
            x=172,
            y=0,
            width=80,
            height=392,

            sourceX = 144,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0012
            x=0,
            y=804,
            width=72,
            height=396,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0013
            x=92,
            y=396,
            width=76,
            height=400,

            sourceX = 156,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0014
            x=0,
            y=400,
            width=72,
            height=404,

            sourceX = 164,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0015
            x=172,
            y=392,
            width=76,
            height=404,

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

    ["alek-walk-away0001"] = 1,
    ["alek-walk-away0002"] = 2,
    ["alek-walk-away0003"] = 3,
    ["alek-walk-away0004"] = 4,
    ["alek-walk-away0005"] = 5,
    ["alek-walk-away0006"] = 6,
    ["alek-walk-away0007"] = 7,
    ["alek-walk-away0008"] = 8,
    ["alek-walk-away0009"] = 9,
    ["alek-walk-away0010"] = 10,
    ["alek-walk-away0011"] = 11,
    ["alek-walk-away0012"] = 12,
    ["alek-walk-away0013"] = 13,
    ["alek-walk-away0014"] = 14,
    ["alek-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
