--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9a2170997ee4bb316be12cc761456159$
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
            -- camera-0001
            x=0,
            y=76,
            width=34,
            height=32,

            sourceX = 6,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 40
        },
        {
            -- camera-0002
            x=0,
            y=32,
            width=36,
            height=28,

            sourceX = 4,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 40
        },
        {
            -- camera-0003
            x=80,
            y=0,
            width=38,
            height=28,

            sourceX = 2,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 40
        },
        {
            -- camera-0004
            x=40,
            y=0,
            width=40,
            height=30,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 40,
            sourceHeight = 40
        },
        {
            -- camera-0005
            x=0,
            y=0,
            width=40,
            height=32,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 40,
            sourceHeight = 40
        },
        {
            -- camera-0006
            x=80,
            y=28,
            width=38,
            height=24,

            sourceX = 2,
            sourceY = 8,
            sourceWidth = 40,
            sourceHeight = 40
        },
        {
            -- camera-0007
            x=34,
            y=88,
            width=34,
            height=28,

            sourceX = 6,
            sourceY = 6,
            sourceWidth = 40,
            sourceHeight = 40
        },
        {
            -- camera-0008
            x=76,
            y=52,
            width=36,
            height=24,

            sourceX = 4,
            sourceY = 14,
            sourceWidth = 40,
            sourceHeight = 40
        },
        {
            -- camera-0009
            x=40,
            y=30,
            width=36,
            height=30,

            sourceX = 4,
            sourceY = 10,
            sourceWidth = 40,
            sourceHeight = 40
        },
        {
            -- camera-0010
            x=34,
            y=60,
            width=34,
            height=28,

            sourceX = 6,
            sourceY = 8,
            sourceWidth = 40,
            sourceHeight = 40
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 128
}

SheetInfo.frameIndex =
{

    ["camera-0001"] = 1,
    ["camera-0002"] = 2,
    ["camera-0003"] = 3,
    ["camera-0004"] = 4,
    ["camera-0005"] = 5,
    ["camera-0006"] = 6,
    ["camera-0007"] = 7,
    ["camera-0008"] = 8,
    ["camera-0009"] = 9,
    ["camera-0010"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
