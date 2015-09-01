--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:67e1e839393e85cce7081c3263841184$
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
            x=288,
            y=404,
            width=96,
            height=404,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0002
            x=96,
            y=0,
            width=96,
            height=412,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0003
            x=0,
            y=412,
            width=96,
            height=412,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0004
            x=96,
            y=412,
            width=96,
            height=408,

            sourceX = 148,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0005
            x=460,
            y=0,
            width=88,
            height=404,

            sourceX = 152,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0006
            x=644,
            y=0,
            width=84,
            height=392,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0007
            x=192,
            y=0,
            width=84,
            height=408,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0008
            x=384,
            y=404,
            width=88,
            height=404,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0009
            x=372,
            y=0,
            width=88,
            height=404,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0010
            x=276,
            y=0,
            width=96,
            height=404,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0011
            x=472,
            y=404,
            width=104,
            height=400,

            sourceX = 144,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0012
            x=576,
            y=396,
            width=96,
            height=396,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0013
            x=548,
            y=0,
            width=96,
            height=396,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-forward0014
            x=192,
            y=408,
            width=96,
            height=404,

            sourceX = 148,
            sourceY = 12,
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
            sourceY = 8,
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
