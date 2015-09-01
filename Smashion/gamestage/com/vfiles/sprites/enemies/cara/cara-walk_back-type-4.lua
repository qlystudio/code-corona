--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c93276f0fdb7c4554bf06b61a7cf1243$
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
            x=0,
            y=396,
            width=40,
            height=196,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0002
            x=80,
            y=0,
            width=40,
            height=190,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0003
            x=82,
            y=578,
            width=40,
            height=186,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0004
            x=0,
            y=786,
            width=50,
            height=180,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0005
            x=40,
            y=580,
            width=42,
            height=184,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0006
            x=80,
            y=190,
            width=38,
            height=186,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0007
            x=0,
            y=198,
            width=40,
            height=198,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0008
            x=0,
            y=0,
            width=40,
            height=198,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0009
            x=50,
            y=764,
            width=40,
            height=190,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0010
            x=40,
            y=194,
            width=40,
            height=194,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0011
            x=40,
            y=388,
            width=38,
            height=192,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0012
            x=90,
            y=764,
            width=38,
            height=190,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0013
            x=78,
            y=388,
            width=40,
            height=190,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0014
            x=40,
            y=0,
            width=40,
            height=194,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0015
            x=0,
            y=592,
            width=40,
            height=194,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 128,
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
