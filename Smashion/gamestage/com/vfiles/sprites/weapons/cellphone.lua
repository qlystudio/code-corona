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
            y=64,
            width=16,
            height=38,

            sourceX = 12,
            sourceY = 4,
            sourceWidth = 39,
            sourceHeight = 44
        },
        {
            -- cellphone-0002
            x=24,
            y=0,
            width=22,
            height=32,

            sourceX = 6,
            sourceY = 6,
            sourceWidth = 39,
            sourceHeight = 44
        },
        {
            -- cellphone-0003
            x=20,
            y=44,
            width=20,
            height=24,

            sourceX = 6,
            sourceY = 6,
            sourceWidth = 39,
            sourceHeight = 44
        },
        {
            -- cellphone-0004
            x=22,
            y=32,
            width=22,
            height=12,

            sourceX = 6,
            sourceY = 10,
            sourceWidth = 39,
            sourceHeight = 44
        },
        {
            -- cellphone-0005
            x=0,
            y=14,
            width=22,
            height=26,

            sourceX = 8,
            sourceY = 4,
            sourceWidth = 39,
            sourceHeight = 44
        },
        {
            -- cellphone-0006
            x=46,
            y=0,
            width=18,
            height=32,

            sourceX = 10,
            sourceY = 4,
            sourceWidth = 39,
            sourceHeight = 44
        },
        {
            -- cellphone-0007
            x=40,
            y=60,
            width=16,
            height=36,

            sourceX = 12,
            sourceY = 6,
            sourceWidth = 39,
            sourceHeight = 44
        },
        {
            -- cellphone-0008
            x=0,
            y=40,
            width=20,
            height=24,

            sourceX = 8,
            sourceY = 12,
            sourceWidth = 39,
            sourceHeight = 44
        },
        {
            -- cellphone-0009
            x=0,
            y=0,
            width=24,
            height=14,

            sourceX = 6,
            sourceY = 18,
            sourceWidth = 39,
            sourceHeight = 44
        },
        {
            -- cellphone-0010
            x=44,
            y=32,
            width=20,
            height=28,

            sourceX = 8,
            sourceY = 10,
            sourceWidth = 39,
            sourceHeight = 44
        },
    },
    
    sheetContentWidth = 64,
    sheetContentHeight = 128
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
