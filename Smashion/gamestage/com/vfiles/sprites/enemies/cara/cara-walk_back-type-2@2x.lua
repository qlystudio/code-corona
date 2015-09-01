--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f5307638c2fde79b0147cb91138516a4$
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
            -- cara-walk-away0001
            x=84,
            y=0,
            width=80,
            height=384,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0002
            x=404,
            y=344,
            width=80,
            height=368,

            sourceX = 152,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0003
            x=564,
            y=364,
            width=80,
            height=360,

            sourceX = 152,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0004
            x=324,
            y=0,
            width=100,
            height=344,

            sourceX = 152,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0005
            x=568,
            y=0,
            width=84,
            height=356,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0006
            x=484,
            y=0,
            width=84,
            height=364,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0007
            x=0,
            y=384,
            width=84,
            height=384,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0008
            x=0,
            y=0,
            width=84,
            height=384,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0009
            x=484,
            y=364,
            width=80,
            height=364,

            sourceX = 152,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0010
            x=324,
            y=344,
            width=80,
            height=368,

            sourceX = 152,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0011
            x=164,
            y=376,
            width=80,
            height=376,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0012
            x=244,
            y=372,
            width=80,
            height=372,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0013
            x=244,
            y=0,
            width=80,
            height=372,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0014
            x=84,
            y=384,
            width=80,
            height=380,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0015
            x=164,
            y=0,
            width=80,
            height=376,

            sourceX = 152,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["cara-walk-away0001"] = 1,
    ["cara-walk-away0002"] = 2,
    ["cara-walk-away0003"] = 3,
    ["cara-walk-away0004"] = 4,
    ["cara-walk-away0005"] = 5,
    ["cara-walk-away0006"] = 6,
    ["cara-walk-away0007"] = 7,
    ["cara-walk-away0008"] = 8,
    ["cara-walk-away0009"] = 9,
    ["cara-walk-away0010"] = 10,
    ["cara-walk-away0011"] = 11,
    ["cara-walk-away0012"] = 12,
    ["cara-walk-away0013"] = 13,
    ["cara-walk-away0014"] = 14,
    ["cara-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
