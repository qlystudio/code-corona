--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:da35a3f630eefaaa1c787e8f7945b549$
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
            x=84,
            y=0,
            width=80,
            height=396,

            sourceX = 36,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0002
            x=0,
            y=0,
            width=84,
            height=400,

            sourceX = 36,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0003
            x=144,
            y=1608,
            width=68,
            height=384,

            sourceX = 36,
            sourceY = 20,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0004
            x=144,
            y=1220,
            width=68,
            height=388,

            sourceX = 36,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0005
            x=0,
            y=400,
            width=76,
            height=400,

            sourceX = 24,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0006
            x=0,
            y=1592,
            width=72,
            height=400,

            sourceX = 24,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0007
            x=72,
            y=1216,
            width=72,
            height=400,

            sourceX = 24,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0008
            x=84,
            y=396,
            width=76,
            height=416,

            sourceX = 20,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0009
            x=164,
            y=0,
            width=76,
            height=416,

            sourceX = 20,
            sourceY = 16,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0010
            x=148,
            y=820,
            width=72,
            height=400,

            sourceX = 20,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0011
            x=0,
            y=800,
            width=76,
            height=392,

            sourceX = 16,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0012
            x=72,
            y=1616,
            width=72,
            height=396,

            sourceX = 20,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0013
            x=0,
            y=1192,
            width=72,
            height=400,

            sourceX = 28,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0014
            x=76,
            y=812,
            width=72,
            height=404,

            sourceX = 32,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0015
            x=160,
            y=416,
            width=72,
            height=404,

            sourceX = 36,
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
