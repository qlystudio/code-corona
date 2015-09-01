--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0de340be3e6894102159350f47d17af8$
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
            -- alek-walk-away0001
            x=46,
            y=0,
            width=40,
            height=198,

            sourceX = 82,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0002
            x=0,
            y=0,
            width=46,
            height=200,

            sourceX = 80,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0003
            x=72,
            y=592,
            width=36,
            height=192,

            sourceX = 82,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0004
            x=72,
            y=398,
            width=36,
            height=194,

            sourceX = 82,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0005
            x=98,
            y=784,
            width=30,
            height=200,

            sourceX = 82,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0006
            x=66,
            y=808,
            width=32,
            height=200,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0007
            x=34,
            y=808,
            width=32,
            height=200,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0008
            x=34,
            y=600,
            width=34,
            height=208,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0009
            x=0,
            y=784,
            width=34,
            height=208,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0010
            x=36,
            y=398,
            width=36,
            height=202,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0011
            x=86,
            y=0,
            width=40,
            height=196,

            sourceX = 72,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0012
            x=0,
            y=402,
            width=36,
            height=198,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0013
            x=46,
            y=198,
            width=38,
            height=200,

            sourceX = 78,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0014
            x=0,
            y=200,
            width=36,
            height=202,

            sourceX = 82,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- alek-walk-away0015
            x=86,
            y=196,
            width=38,
            height=202,

            sourceX = 82,
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

    ["alek-walk-away0001"] = 1,
    ["alek-walk-away0002"] = 2,
    ["alek-walk-away0003"] = 3,
    ["alek-walk-away0004"] = 4,
    ["alek-walk-away0005"] = 5,
    ["alek-walk-away0006"] = 6,
    ["alek-walk-away0007"] = 7,
    ["alek-walk-away0008"] = 8,
    ["alek-walk-away0009"] = 9,
    ["alek-walk-away0010"] = 10,
    ["alek-walk-away0011"] = 11,
    ["alek-walk-away0012"] = 12,
    ["alek-walk-away0013"] = 13,
    ["alek-walk-away0014"] = 14,
    ["alek-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
