--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e5602c9937220f5a713ffa1268d4a13c$
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
            -- kate-walk-forward0001
            x=130,
            y=204,
            width=46,
            height=202,

            sourceX = 10,
            sourceY = 4,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0002
            x=48,
            y=0,
            width=46,
            height=204,

            sourceX = 10,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0003
            x=46,
            y=204,
            width=46,
            height=204,

            sourceX = 10,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0004
            x=0,
            y=0,
            width=48,
            height=204,

            sourceX = 10,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0005
            x=176,
            y=200,
            width=44,
            height=202,

            sourceX = 12,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0006
            x=224,
            y=0,
            width=44,
            height=200,

            sourceX = 10,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0007
            x=94,
            y=0,
            width=38,
            height=204,

            sourceX = 12,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0008
            x=92,
            y=204,
            width=38,
            height=204,

            sourceX = 12,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0009
            x=220,
            y=200,
            width=42,
            height=202,

            sourceX = 10,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0010
            x=0,
            y=204,
            width=46,
            height=204,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0011
            x=132,
            y=0,
            width=44,
            height=202,

            sourceX = 10,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0012
            x=176,
            y=0,
            width=48,
            height=200,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0013
            x=308,
            y=198,
            width=46,
            height=196,

            sourceX = 10,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0014
            x=268,
            y=0,
            width=46,
            height=198,

            sourceX = 10,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0015
            x=262,
            y=200,
            width=46,
            height=198,

            sourceX = 10,
            sourceY = 2,
            sourceWidth = 64,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["kate-walk-forward0001"] = 1,
    ["kate-walk-forward0002"] = 2,
    ["kate-walk-forward0003"] = 3,
    ["kate-walk-forward0004"] = 4,
    ["kate-walk-forward0005"] = 5,
    ["kate-walk-forward0006"] = 6,
    ["kate-walk-forward0007"] = 7,
    ["kate-walk-forward0008"] = 8,
    ["kate-walk-forward0009"] = 9,
    ["kate-walk-forward0010"] = 10,
    ["kate-walk-forward0011"] = 11,
    ["kate-walk-forward0012"] = 12,
    ["kate-walk-forward0013"] = 13,
    ["kate-walk-forward0014"] = 14,
    ["kate-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
