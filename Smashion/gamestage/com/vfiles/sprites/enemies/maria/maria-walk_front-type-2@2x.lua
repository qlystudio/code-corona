--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:fe0b7138eb07a2f1a140166cc2b1ffd9$
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
            x=292,
            y=0,
            width=104,
            height=400,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0002
            x=0,
            y=0,
            width=108,
            height=408,

            sourceX = 144,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0003
            x=280,
            y=404,
            width=100,
            height=404,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0004
            x=176,
            y=408,
            width=104,
            height=404,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0005
            x=192,
            y=0,
            width=100,
            height=404,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0006
            x=524,
            y=396,
            width=96,
            height=396,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0007
            x=88,
            y=408,
            width=88,
            height=408,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0008
            x=108,
            y=0,
            width=84,
            height=408,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0009
            x=0,
            y=408,
            width=88,
            height=408,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0010
            x=496,
            y=0,
            width=96,
            height=396,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0011
            x=380,
            y=400,
            width=144,
            height=396,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0012
            x=396,
            y=0,
            width=100,
            height=396,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0013
            x=592,
            y=0,
            width=108,
            height=388,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0014
            x=700,
            y=0,
            width=100,
            height=384,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-forward0015
            x=800,
            y=0,
            width=96,
            height=388,

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
