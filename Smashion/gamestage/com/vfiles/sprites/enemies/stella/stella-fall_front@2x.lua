--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a3ec642e917d0ce017f061196a88b66e$
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
            -- stella-fall-forward0001
            x=0,
            y=760,
            width=200,
            height=408,

            sourceX = 88,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0002
            x=200,
            y=564,
            width=200,
            height=408,

            sourceX = 92,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0003
            x=468,
            y=516,
            width=200,
            height=408,

            sourceX = 88,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0004
            x=0,
            y=352,
            width=200,
            height=408,

            sourceX = 92,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0005
            x=668,
            y=520,
            width=200,
            height=396,

            sourceX = 88,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0006
            x=668,
            y=916,
            width=200,
            height=372,

            sourceX = 92,
            sourceY = 48,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0007
            x=0,
            y=0,
            width=260,
            height=352,

            sourceX = 68,
            sourceY = 68,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0008
            x=260,
            y=0,
            width=248,
            height=316,

            sourceX = 72,
            sourceY = 112,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0009
            x=400,
            y=924,
            width=200,
            height=308,

            sourceX = 88,
            sourceY = 136,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0010
            x=200,
            y=972,
            width=200,
            height=288,

            sourceX = 92,
            sourceY = 160,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0011
            x=260,
            y=316,
            width=208,
            height=248,

            sourceX = 84,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0012
            x=508,
            y=268,
            width=208,
            height=248,

            sourceX = 84,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0013
            x=740,
            y=260,
            width=220,
            height=260,

            sourceX = 76,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0014
            x=740,
            y=0,
            width=220,
            height=260,

            sourceX = 76,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0015
            x=508,
            y=0,
            width=232,
            height=268,

            sourceX = 68,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["stella-fall-forward0001"] = 1,
    ["stella-fall-forward0002"] = 2,
    ["stella-fall-forward0003"] = 3,
    ["stella-fall-forward0004"] = 4,
    ["stella-fall-forward0005"] = 5,
    ["stella-fall-forward0006"] = 6,
    ["stella-fall-forward0007"] = 7,
    ["stella-fall-forward0008"] = 8,
    ["stella-fall-forward0009"] = 9,
    ["stella-fall-forward0010"] = 10,
    ["stella-fall-forward0011"] = 11,
    ["stella-fall-forward0012"] = 12,
    ["stella-fall-forward0013"] = 13,
    ["stella-fall-forward0014"] = 14,
    ["stella-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
