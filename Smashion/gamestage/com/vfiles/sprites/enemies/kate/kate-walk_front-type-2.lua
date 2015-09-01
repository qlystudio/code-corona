--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4e976b55908565f746a976e59ab93699$
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
            x=176,
            y=198,
            width=46,
            height=202,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0002
            x=46,
            y=204,
            width=46,
            height=204,

            sourceX = 76,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0003
            x=0,
            y=204,
            width=46,
            height=204,

            sourceX = 76,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0004
            x=0,
            y=0,
            width=48,
            height=204,

            sourceX = 76,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0005
            x=130,
            y=202,
            width=46,
            height=202,

            sourceX = 76,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0006
            x=310,
            y=196,
            width=42,
            height=200,

            sourceX = 76,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0007
            x=92,
            y=204,
            width=38,
            height=204,

            sourceX = 78,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0008
            x=92,
            y=0,
            width=38,
            height=204,

            sourceX = 78,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0009
            x=222,
            y=198,
            width=42,
            height=202,

            sourceX = 74,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0010
            x=48,
            y=0,
            width=44,
            height=204,

            sourceX = 74,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0011
            x=130,
            y=0,
            width=46,
            height=202,

            sourceX = 74,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0012
            x=264,
            y=198,
            width=46,
            height=200,

            sourceX = 74,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0013
            x=268,
            y=0,
            width=48,
            height=196,

            sourceX = 74,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0014
            x=224,
            y=0,
            width=44,
            height=198,

            sourceX = 76,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- kate-walk-forward0015
            x=176,
            y=0,
            width=48,
            height=198,

            sourceX = 74,
            sourceY = 2,
            sourceWidth = 195,
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
