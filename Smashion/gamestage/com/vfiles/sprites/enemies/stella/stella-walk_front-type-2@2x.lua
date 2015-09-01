--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d4a79480255ff62870802dc1e87a0907$
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
            -- stella-walk-forward0001
            x=184,
            y=0,
            width=96,
            height=408,

            sourceX = 144,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0002
            x=180,
            y=412,
            width=96,
            height=408,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0003
            x=80,
            y=412,
            width=96,
            height=408,

            sourceX = 148,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0004
            x=80,
            y=0,
            width=100,
            height=408,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0005
            x=284,
            y=0,
            width=96,
            height=404,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0006
            x=512,
            y=404,
            width=88,
            height=400,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0007
            x=0,
            y=416,
            width=76,
            height=412,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0008
            x=0,
            y=0,
            width=76,
            height=412,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0009
            x=424,
            y=408,
            width=84,
            height=404,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0010
            x=384,
            y=0,
            width=92,
            height=404,

            sourceX = 144,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0011
            x=280,
            y=412,
            width=140,
            height=404,

            sourceX = 144,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0012
            x=480,
            y=0,
            width=96,
            height=400,

            sourceX = 144,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0013
            x=604,
            y=400,
            width=96,
            height=392,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0014
            x=676,
            y=0,
            width=92,
            height=392,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0015
            x=580,
            y=0,
            width=92,
            height=396,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["stella-walk-forward0001"] = 1,
    ["stella-walk-forward0002"] = 2,
    ["stella-walk-forward0003"] = 3,
    ["stella-walk-forward0004"] = 4,
    ["stella-walk-forward0005"] = 5,
    ["stella-walk-forward0006"] = 6,
    ["stella-walk-forward0007"] = 7,
    ["stella-walk-forward0008"] = 8,
    ["stella-walk-forward0009"] = 9,
    ["stella-walk-forward0010"] = 10,
    ["stella-walk-forward0011"] = 11,
    ["stella-walk-forward0012"] = 12,
    ["stella-walk-forward0013"] = 13,
    ["stella-walk-forward0014"] = 14,
    ["stella-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
