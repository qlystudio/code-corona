--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:95613bb3cfba6c9164384aced8f2c3a6$
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
            -- cellphone-0001
            x=0,
            y=128,
            width=32,
            height=76,

            sourceX = 24,
            sourceY = 8,
            sourceWidth = 77,
            sourceHeight = 88
        },
        {
            -- cellphone-0002
            x=48,
            y=0,
            width=44,
            height=64,

            sourceX = 12,
            sourceY = 12,
            sourceWidth = 77,
            sourceHeight = 88
        },
        {
            -- cellphone-0003
            x=40,
            y=88,
            width=40,
            height=48,

            sourceX = 12,
            sourceY = 12,
            sourceWidth = 77,
            sourceHeight = 88
        },
        {
            -- cellphone-0004
            x=44,
            y=64,
            width=44,
            height=24,

            sourceX = 12,
            sourceY = 20,
            sourceWidth = 77,
            sourceHeight = 88
        },
        {
            -- cellphone-0005
            x=0,
            y=28,
            width=44,
            height=52,

            sourceX = 16,
            sourceY = 8,
            sourceWidth = 77,
            sourceHeight = 88
        },
        {
            -- cellphone-0006
            x=92,
            y=0,
            width=36,
            height=64,

            sourceX = 20,
            sourceY = 8,
            sourceWidth = 77,
            sourceHeight = 88
        },
        {
            -- cellphone-0007
            x=80,
            y=120,
            width=32,
            height=72,

            sourceX = 24,
            sourceY = 12,
            sourceWidth = 77,
            sourceHeight = 88
        },
        {
            -- cellphone-0008
            x=0,
            y=80,
            width=40,
            height=48,

            sourceX = 16,
            sourceY = 24,
            sourceWidth = 77,
            sourceHeight = 88
        },
        {
            -- cellphone-0009
            x=0,
            y=0,
            width=48,
            height=28,

            sourceX = 12,
            sourceY = 36,
            sourceWidth = 77,
            sourceHeight = 88
        },
        {
            -- cellphone-0010
            x=88,
            y=64,
            width=40,
            height=56,

            sourceX = 16,
            sourceY = 20,
            sourceWidth = 77,
            sourceHeight = 88
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 256
}

SheetInfo.frameIndex =
{

    ["cellphone-0001"] = 1,
    ["cellphone-0002"] = 2,
    ["cellphone-0003"] = 3,
    ["cellphone-0004"] = 4,
    ["cellphone-0005"] = 5,
    ["cellphone-0006"] = 6,
    ["cellphone-0007"] = 7,
    ["cellphone-0008"] = 8,
    ["cellphone-0009"] = 9,
    ["cellphone-0010"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
