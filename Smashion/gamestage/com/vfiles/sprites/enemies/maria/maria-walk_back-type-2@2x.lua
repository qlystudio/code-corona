--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:8b2f31695c59c34d38fecfd5fa101f7b$
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
            -- maria-walk-away0001
            x=88,
            y=0,
            width=88,
            height=408,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0002
            x=352,
            y=404,
            width=88,
            height=396,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0003
            x=532,
            y=380,
            width=80,
            height=388,

            sourceX = 156,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0004
            x=532,
            y=0,
            width=108,
            height=376,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0005
            x=616,
            y=380,
            width=88,
            height=380,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0006
            x=448,
            y=0,
            width=80,
            height=388,

            sourceX = 156,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0007
            x=0,
            y=416,
            width=84,
            height=412,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0008
            x=0,
            y=0,
            width=84,
            height=412,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0009
            x=444,
            y=400,
            width=84,
            height=396,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0010
            x=272,
            y=0,
            width=84,
            height=400,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0011
            x=264,
            y=404,
            width=84,
            height=400,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0012
            x=360,
            y=0,
            width=84,
            height=396,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0013
            x=180,
            y=0,
            width=88,
            height=400,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0014
            x=176,
            y=412,
            width=84,
            height=404,

            sourceX = 152,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0015
            x=88,
            y=412,
            width=84,
            height=408,

            sourceX = 152,
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

    ["maria-walk-away0001"] = 1,
    ["maria-walk-away0002"] = 2,
    ["maria-walk-away0003"] = 3,
    ["maria-walk-away0004"] = 4,
    ["maria-walk-away0005"] = 5,
    ["maria-walk-away0006"] = 6,
    ["maria-walk-away0007"] = 7,
    ["maria-walk-away0008"] = 8,
    ["maria-walk-away0009"] = 9,
    ["maria-walk-away0010"] = 10,
    ["maria-walk-away0011"] = 11,
    ["maria-walk-away0012"] = 12,
    ["maria-walk-away0013"] = 13,
    ["maria-walk-away0014"] = 14,
    ["maria-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
