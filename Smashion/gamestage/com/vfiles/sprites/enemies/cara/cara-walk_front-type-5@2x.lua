--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f3cd90b7300f15062090aad92b764182$
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
            -- cara-walk-forward0001
            x=196,
            y=0,
            width=100,
            height=408,

            sourceX = 144,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0002
            x=0,
            y=412,
            width=96,
            height=412,

            sourceX = 148,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0003
            x=96,
            y=408,
            width=100,
            height=408,

            sourceX = 148,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0004
            x=384,
            y=396,
            width=96,
            height=396,

            sourceX = 148,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0005
            x=484,
            y=0,
            width=88,
            height=396,

            sourceX = 152,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0006
            x=572,
            y=392,
            width=84,
            height=392,

            sourceX = 148,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0007
            x=296,
            y=0,
            width=88,
            height=400,

            sourceX = 148,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0008
            x=292,
            y=408,
            width=92,
            height=400,

            sourceX = 144,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0009
            x=480,
            y=396,
            width=92,
            height=396,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0010
            x=196,
            y=408,
            width=96,
            height=400,

            sourceX = 144,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0011
            x=384,
            y=0,
            width=100,
            height=396,

            sourceX = 148,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0012
            x=656,
            y=392,
            width=96,
            height=384,

            sourceX = 148,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0013
            x=572,
            y=0,
            width=96,
            height=392,

            sourceX = 148,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0014
            x=96,
            y=0,
            width=100,
            height=408,

            sourceX = 144,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0015
            x=0,
            y=0,
            width=96,
            height=412,

            sourceX = 148,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["cara-walk-forward0001"] = 1,
    ["cara-walk-forward0002"] = 2,
    ["cara-walk-forward0003"] = 3,
    ["cara-walk-forward0004"] = 4,
    ["cara-walk-forward0005"] = 5,
    ["cara-walk-forward0006"] = 6,
    ["cara-walk-forward0007"] = 7,
    ["cara-walk-forward0008"] = 8,
    ["cara-walk-forward0009"] = 9,
    ["cara-walk-forward0010"] = 10,
    ["cara-walk-forward0011"] = 11,
    ["cara-walk-forward0012"] = 12,
    ["cara-walk-forward0013"] = 13,
    ["cara-walk-forward0014"] = 14,
    ["cara-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
