--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:307e072550751f3c411c2cd376e657cd$
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
            -- kate-walk-away0001
            x=88,
            y=404,
            width=88,
            height=400,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0002
            x=444,
            y=392,
            width=84,
            height=388,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0003
            x=532,
            y=384,
            width=80,
            height=380,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0004
            x=616,
            y=376,
            width=108,
            height=364,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0005
            x=536,
            y=0,
            width=92,
            height=372,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0006
            x=448,
            y=0,
            width=84,
            height=380,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0007
            x=0,
            y=408,
            width=84,
            height=404,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0008
            x=0,
            y=0,
            width=84,
            height=404,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0009
            x=360,
            y=0,
            width=84,
            height=388,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0010
            x=272,
            y=0,
            width=84,
            height=392,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0011
            x=268,
            y=400,
            width=84,
            height=392,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0012
            x=356,
            y=396,
            width=84,
            height=388,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0013
            x=180,
            y=400,
            width=84,
            height=392,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0014
            x=180,
            y=0,
            width=88,
            height=396,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-away0015
            x=88,
            y=0,
            width=88,
            height=400,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["kate-walk-away0001"] = 1,
    ["kate-walk-away0002"] = 2,
    ["kate-walk-away0003"] = 3,
    ["kate-walk-away0004"] = 4,
    ["kate-walk-away0005"] = 5,
    ["kate-walk-away0006"] = 6,
    ["kate-walk-away0007"] = 7,
    ["kate-walk-away0008"] = 8,
    ["kate-walk-away0009"] = 9,
    ["kate-walk-away0010"] = 10,
    ["kate-walk-away0011"] = 11,
    ["kate-walk-away0012"] = 12,
    ["kate-walk-away0013"] = 13,
    ["kate-walk-away0014"] = 14,
    ["kate-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
