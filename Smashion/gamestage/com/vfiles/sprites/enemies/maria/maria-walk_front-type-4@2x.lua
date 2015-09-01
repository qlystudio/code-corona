--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0b09fa1cc95b4dd71bd7d678289dfa30$
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
            -- maria-walk-forward0001
            x=284,
            y=0,
            width=96,
            height=392,

            sourceX = 148,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0002
            x=0,
            y=396,
            width=96,
            height=396,

            sourceX = 148,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0003
            x=0,
            y=0,
            width=96,
            height=396,

            sourceX = 148,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0004
            x=184,
            y=0,
            width=100,
            height=392,

            sourceX = 148,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0005
            x=256,
            y=392,
            width=96,
            height=392,

            sourceX = 152,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0006
            x=492,
            y=384,
            width=88,
            height=384,

            sourceX = 152,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0007
            x=176,
            y=396,
            width=80,
            height=396,

            sourceX = 152,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0008
            x=96,
            y=396,
            width=80,
            height=396,

            sourceX = 152,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0009
            x=96,
            y=0,
            width=88,
            height=396,

            sourceX = 148,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0010
            x=476,
            y=0,
            width=88,
            height=384,

            sourceX = 148,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0011
            x=352,
            y=392,
            width=140,
            height=384,

            sourceX = 148,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0012
            x=380,
            y=0,
            width=96,
            height=384,

            sourceX = 148,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0013
            x=660,
            y=0,
            width=96,
            height=376,

            sourceX = 148,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0014
            x=580,
            y=380,
            width=96,
            height=376,

            sourceX = 148,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0015
            x=564,
            y=0,
            width=96,
            height=380,

            sourceX = 148,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["maria-walk-forward0001"] = 1,
    ["maria-walk-forward0002"] = 2,
    ["maria-walk-forward0003"] = 3,
    ["maria-walk-forward0004"] = 4,
    ["maria-walk-forward0005"] = 5,
    ["maria-walk-forward0006"] = 6,
    ["maria-walk-forward0007"] = 7,
    ["maria-walk-forward0008"] = 8,
    ["maria-walk-forward0009"] = 9,
    ["maria-walk-forward0010"] = 10,
    ["maria-walk-forward0011"] = 11,
    ["maria-walk-forward0012"] = 12,
    ["maria-walk-forward0013"] = 13,
    ["maria-walk-forward0014"] = 14,
    ["maria-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
