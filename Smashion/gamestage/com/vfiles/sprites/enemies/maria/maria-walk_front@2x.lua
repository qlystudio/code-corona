--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e3d7a2cfcd8be1fbfe204228c567864c$
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

            sourceX = 16,
            sourceY = 28,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0002
            x=0,
            y=396,
            width=96,
            height=396,

            sourceX = 20,
            sourceY = 28,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0003
            x=0,
            y=0,
            width=96,
            height=396,

            sourceX = 20,
            sourceY = 28,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0004
            x=184,
            y=0,
            width=100,
            height=392,

            sourceX = 20,
            sourceY = 24,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0005
            x=248,
            y=392,
            width=96,
            height=392,

            sourceX = 20,
            sourceY = 24,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0006
            x=472,
            y=0,
            width=88,
            height=384,

            sourceX = 20,
            sourceY = 24,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0007
            x=172,
            y=396,
            width=76,
            height=396,

            sourceX = 24,
            sourceY = 24,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0008
            x=96,
            y=396,
            width=76,
            height=396,

            sourceX = 24,
            sourceY = 24,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0009
            x=96,
            y=0,
            width=88,
            height=396,

            sourceX = 16,
            sourceY = 24,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0010
            x=440,
            y=384,
            width=92,
            height=384,

            sourceX = 16,
            sourceY = 32,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0011
            x=380,
            y=0,
            width=92,
            height=384,

            sourceX = 16,
            sourceY = 32,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0012
            x=344,
            y=392,
            width=96,
            height=384,

            sourceX = 16,
            sourceY = 32,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0013
            x=560,
            y=0,
            width=100,
            height=376,

            sourceX = 16,
            sourceY = 32,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0014
            x=660,
            y=0,
            width=96,
            height=376,

            sourceX = 16,
            sourceY = 28,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0015
            x=532,
            y=384,
            width=92,
            height=380,

            sourceX = 20,
            sourceY = 28,
            sourceWidth = 128,
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
