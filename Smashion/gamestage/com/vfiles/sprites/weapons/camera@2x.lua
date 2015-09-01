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
            y=152,
            width=68,
            height=64,

            sourceX = 12,
            sourceY = 8,
            sourceWidth = 80,
            sourceHeight = 79
        },
        {
            -- camera-0002
            x=0,
            y=64,
            width=72,
            height=56,

            sourceX = 8,
            sourceY = 8,
            sourceWidth = 80,
            sourceHeight = 79
        },
        {
            -- camera-0003
            x=160,
            y=0,
            width=76,
            height=56,

            sourceX = 4,
            sourceY = 8,
            sourceWidth = 80,
            sourceHeight = 79
        },
        {
            -- camera-0004
            x=80,
            y=0,
            width=80,
            height=60,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 80,
            sourceHeight = 79
        },
        {
            -- camera-0005
            x=0,
            y=0,
            width=80,
            height=64,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 80,
            sourceHeight = 79
        },
        {
            -- camera-0006
            x=160,
            y=56,
            width=76,
            height=48,

            sourceX = 4,
            sourceY = 16,
            sourceWidth = 80,
            sourceHeight = 79
        },
        {
            -- camera-0007
            x=68,
            y=176,
            width=68,
            height=56,

            sourceX = 12,
            sourceY = 12,
            sourceWidth = 80,
            sourceHeight = 79
        },
        {
            -- camera-0008
            x=152,
            y=104,
            width=72,
            height=48,

            sourceX = 8,
            sourceY = 28,
            sourceWidth = 80,
            sourceHeight = 79
        },
        {
            -- camera-0009
            x=80,
            y=60,
            width=72,
            height=60,

            sourceX = 8,
            sourceY = 20,
            sourceWidth = 80,
            sourceHeight = 79
        },
        {
            -- camera-0010
            x=68,
            y=120,
            width=68,
            height=56,

            sourceX = 12,
            sourceY = 16,
            sourceWidth = 80,
            sourceHeight = 79
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 256
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
