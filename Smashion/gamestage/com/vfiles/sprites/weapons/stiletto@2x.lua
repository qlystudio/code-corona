--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:76bd410fce0d5545adbde2a8dea3a829$
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
            -- stiletto0000
            x=0,
            y=92,
            width=76,
            height=92,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 85,
            sourceHeight = 94
        },
        {
            -- stiletto0001
            x=152,
            y=172,
            width=72,
            height=60,

            sourceX = 4,
            sourceY = 20,
            sourceWidth = 85,
            sourceHeight = 94
        },
        {
            -- stiletto0002
            x=76,
            y=136,
            width=72,
            height=36,

            sourceX = 4,
            sourceY = 40,
            sourceWidth = 85,
            sourceHeight = 94
        },
        {
            -- stiletto0003
            x=156,
            y=112,
            width=72,
            height=60,

            sourceX = 4,
            sourceY = 28,
            sourceWidth = 85,
            sourceHeight = 94
        },
        {
            -- stiletto0004
            x=80,
            y=172,
            width=72,
            height=76,

            sourceX = 4,
            sourceY = 12,
            sourceWidth = 85,
            sourceHeight = 94
        },
        {
            -- stiletto0005
            x=0,
            y=0,
            width=76,
            height=92,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 85,
            sourceHeight = 94
        },
        {
            -- stiletto0006
            x=80,
            y=60,
            width=76,
            height=76,

            sourceX = 4,
            sourceY = 8,
            sourceWidth = 85,
            sourceHeight = 94
        },
        {
            -- stiletto0007
            x=80,
            y=0,
            width=80,
            height=60,

            sourceX = 4,
            sourceY = 24,
            sourceWidth = 85,
            sourceHeight = 94
        },
        {
            -- stiletto0008
            x=160,
            y=0,
            width=80,
            height=32,

            sourceX = 0,
            sourceY = 36,
            sourceWidth = 85,
            sourceHeight = 94
        },
        {
            -- stiletto0009
            x=0,
            y=184,
            width=80,
            height=60,

            sourceX = 4,
            sourceY = 24,
            sourceWidth = 85,
            sourceHeight = 94
        },
        {
            -- stiletto0010
            x=160,
            y=32,
            width=76,
            height=80,

            sourceX = 4,
            sourceY = 8,
            sourceWidth = 85,
            sourceHeight = 94
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 256
}

SheetInfo.frameIndex =
{

    ["stiletto0000"] = 1,
    ["stiletto0001"] = 2,
    ["stiletto0002"] = 3,
    ["stiletto0003"] = 4,
    ["stiletto0004"] = 5,
    ["stiletto0005"] = 6,
    ["stiletto0006"] = 7,
    ["stiletto0007"] = 8,
    ["stiletto0008"] = 9,
    ["stiletto0009"] = 10,
    ["stiletto0010"] = 11,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
