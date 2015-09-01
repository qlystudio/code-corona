--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:6a97fa8003a7a14dd4c2fed57a7fb6fc$
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
            -- kate-walk-away0001
            x=44,
            y=0,
            width=42,
            height=200,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0002
            x=262,
            y=188,
            width=40,
            height=194,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0003
            x=346,
            y=0,
            width=40,
            height=190,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0004
            x=174,
            y=0,
            width=52,
            height=182,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0005
            x=262,
            y=0,
            width=44,
            height=186,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0006
            x=304,
            y=188,
            width=40,
            height=190,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0007
            x=0,
            y=204,
            width=42,
            height=202,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0008
            x=0,
            y=0,
            width=42,
            height=202,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0009
            x=218,
            y=184,
            width=42,
            height=194,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0010
            x=130,
            y=198,
            width=42,
            height=196,

            sourceX = 74,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0011
            x=88,
            y=0,
            width=42,
            height=196,

            sourceX = 74,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0012
            x=174,
            y=184,
            width=42,
            height=194,

            sourceX = 74,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0013
            x=132,
            y=0,
            width=40,
            height=196,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0014
            x=86,
            y=202,
            width=42,
            height=198,

            sourceX = 74,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-away0015
            x=44,
            y=202,
            width=40,
            height=200,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["kate-walk-away0001"] = 1,
    ["kate-walk-away0002"] = 2,
    ["kate-walk-away0003"] = 3,
    ["kate-walk-away0004"] = 4,
    ["kate-walk-away0005"] = 5,
    ["kate-walk-away0006"] = 6,
    ["kate-walk-away0007"] = 7,
    ["kate-walk-away0008"] = 8,
    ["kate-walk-away0009"] = 9,
    ["kate-walk-away0010"] = 10,
    ["kate-walk-away0011"] = 11,
    ["kate-walk-away0012"] = 12,
    ["kate-walk-away0013"] = 13,
    ["kate-walk-away0014"] = 14,
    ["kate-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
