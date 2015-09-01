--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:6a3f55cf83a96662e717229d2e0bfe7e$
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
            -- alek-fall-away0001
            x=216,
            y=328,
            width=84,
            height=396,

            sourceX = 156,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0002
            x=116,
            y=396,
            width=100,
            height=396,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0003
            x=116,
            y=0,
            width=100,
            height=396,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0004
            x=0,
            y=396,
            width=116,
            height=396,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0005
            x=0,
            y=0,
            width=116,
            height=396,

            sourceX = 164,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0006
            x=300,
            y=328,
            width=108,
            height=392,

            sourceX = 160,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0007
            x=408,
            y=328,
            width=156,
            height=364,

            sourceX = 140,
            sourceY = 44,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0008
            x=564,
            y=324,
            width=208,
            height=344,

            sourceX = 116,
            sourceY = 68,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0009
            x=460,
            y=0,
            width=224,
            height=324,

            sourceX = 120,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0010
            x=216,
            y=0,
            width=244,
            height=328,

            sourceX = 112,
            sourceY = 84,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0011
            x=432,
            y=692,
            width=232,
            height=316,

            sourceX = 112,
            sourceY = 100,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0012
            x=216,
            y=724,
            width=216,
            height=292,

            sourceX = 108,
            sourceY = 124,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0013
            x=772,
            y=284,
            width=220,
            height=284,

            sourceX = 108,
            sourceY = 128,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0014
            x=772,
            y=0,
            width=220,
            height=284,

            sourceX = 100,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-away0015
            x=0,
            y=792,
            width=204,
            height=232,

            sourceX = 96,
            sourceY = 188,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["alek-fall-away0001"] = 1,
    ["alek-fall-away0002"] = 2,
    ["alek-fall-away0003"] = 3,
    ["alek-fall-away0004"] = 4,
    ["alek-fall-away0005"] = 5,
    ["alek-fall-away0006"] = 6,
    ["alek-fall-away0007"] = 7,
    ["alek-fall-away0008"] = 8,
    ["alek-fall-away0009"] = 9,
    ["alek-fall-away0010"] = 10,
    ["alek-fall-away0011"] = 11,
    ["alek-fall-away0012"] = 12,
    ["alek-fall-away0013"] = 13,
    ["alek-fall-away0014"] = 14,
    ["alek-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
