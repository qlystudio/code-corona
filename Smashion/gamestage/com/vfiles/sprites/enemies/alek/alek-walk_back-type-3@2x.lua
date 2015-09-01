--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:63a4064dd705e8f360b0ab30ff20e893$
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
            x=76,
            y=416,
            width=76,
            height=396,

            sourceX = 168,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0002
            x=0,
            y=0,
            width=84,
            height=400,

            sourceX = 168,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0003
            x=68,
            y=1612,
            width=68,
            height=384,

            sourceX = 168,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0004
            x=144,
            y=1592,
            width=68,
            height=388,

            sourceX = 168,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0005
            x=148,
            y=1192,
            width=72,
            height=400,

            sourceX = 156,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0006
            x=0,
            y=1620,
            width=68,
            height=400,

            sourceX = 156,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0007
            x=0,
            y=1220,
            width=68,
            height=400,

            sourceX = 156,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0008
            x=0,
            y=400,
            width=76,
            height=416,

            sourceX = 152,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0009
            x=84,
            y=0,
            width=76,
            height=416,

            sourceX = 152,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0010
            x=160,
            y=400,
            width=76,
            height=400,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0011
            x=152,
            y=800,
            width=76,
            height=392,

            sourceX = 144,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0012
            x=72,
            y=1216,
            width=72,
            height=396,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0013
            x=160,
            y=0,
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
            y=816,
            width=72,
            height=404,

            sourceX = 164,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-walk-away0015
            x=76,
            y=812,
            width=72,
            height=404,

            sourceX = 168,
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
