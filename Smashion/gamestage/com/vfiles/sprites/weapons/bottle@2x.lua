--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4019aebec473780aa5b4cd59b72185b9$
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
            -- bottle-0000
            x=0,
            y=104,
            width=36,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 35,
            sourceHeight = 103
        },
        {
            -- bottle-0001
            x=72,
            y=0,
            width=36,
            height=88,

            sourceX = 0,
            sourceY = 8,
            sourceWidth = 35,
            sourceHeight = 103
        },
        {
            -- bottle-0002
            x=0,
            y=208,
            width=36,
            height=40,

            sourceX = 0,
            sourceY = 40,
            sourceWidth = 35,
            sourceHeight = 103
        },
        {
            -- bottle-0003
            x=72,
            y=88,
            width=36,
            height=60,

            sourceX = 0,
            sourceY = 16,
            sourceWidth = 35,
            sourceHeight = 103
        },
        {
            -- bottle-0004
            x=36,
            y=172,
            width=36,
            height=80,

            sourceX = 0,
            sourceY = 8,
            sourceWidth = 35,
            sourceHeight = 103
        },
        {
            -- bottle-0005
            x=0,
            y=0,
            width=36,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 35,
            sourceHeight = 103
        },
        {
            -- bottle-0006
            x=36,
            y=88,
            width=36,
            height=84,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 35,
            sourceHeight = 103
        },
        {
            -- bottle-0007
            x=72,
            y=148,
            width=36,
            height=56,

            sourceX = 0,
            sourceY = 20,
            sourceWidth = 35,
            sourceHeight = 103
        },
        {
            -- bottle-0008
            x=72,
            y=204,
            width=36,
            height=52,

            sourceX = 0,
            sourceY = 32,
            sourceWidth = 35,
            sourceHeight = 103
        },
        {
            -- bottle-0009
            x=36,
            y=0,
            width=36,
            height=88,

            sourceX = 0,
            sourceY = 12,
            sourceWidth = 35,
            sourceHeight = 103
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 256
}

SheetInfo.frameIndex =
{

    ["bottle-0000"] = 1,
    ["bottle-0001"] = 2,
    ["bottle-0002"] = 3,
    ["bottle-0003"] = 4,
    ["bottle-0004"] = 5,
    ["bottle-0005"] = 6,
    ["bottle-0006"] = 7,
    ["bottle-0007"] = 8,
    ["bottle-0008"] = 9,
    ["bottle-0009"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
