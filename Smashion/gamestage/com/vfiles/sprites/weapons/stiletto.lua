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
            y=46,
            width=38,
            height=46,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 43,
            sourceHeight = 47
        },
        {
            -- stiletto0001
            x=76,
            y=86,
            width=36,
            height=30,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 43,
            sourceHeight = 47
        },
        {
            -- stiletto0002
            x=38,
            y=68,
            width=36,
            height=18,

            sourceX = 2,
            sourceY = 20,
            sourceWidth = 43,
            sourceHeight = 47
        },
        {
            -- stiletto0003
            x=78,
            y=56,
            width=36,
            height=30,

            sourceX = 2,
            sourceY = 14,
            sourceWidth = 43,
            sourceHeight = 47
        },
        {
            -- stiletto0004
            x=40,
            y=86,
            width=36,
            height=38,

            sourceX = 2,
            sourceY = 6,
            sourceWidth = 43,
            sourceHeight = 47
        },
        {
            -- stiletto0005
            x=0,
            y=0,
            width=38,
            height=46,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 43,
            sourceHeight = 47
        },
        {
            -- stiletto0006
            x=40,
            y=30,
            width=38,
            height=38,

            sourceX = 2,
            sourceY = 4,
            sourceWidth = 43,
            sourceHeight = 47
        },
        {
            -- stiletto0007
            x=40,
            y=0,
            width=40,
            height=30,

            sourceX = 2,
            sourceY = 12,
            sourceWidth = 43,
            sourceHeight = 47
        },
        {
            -- stiletto0008
            x=80,
            y=0,
            width=40,
            height=16,

            sourceX = 0,
            sourceY = 18,
            sourceWidth = 43,
            sourceHeight = 47
        },
        {
            -- stiletto0009
            x=0,
            y=92,
            width=40,
            height=30,

            sourceX = 2,
            sourceY = 12,
            sourceWidth = 43,
            sourceHeight = 47
        },
        {
            -- stiletto0010
            x=80,
            y=16,
            width=38,
            height=40,

            sourceX = 2,
            sourceY = 4,
            sourceWidth = 43,
            sourceHeight = 47
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 128
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
