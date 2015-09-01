--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:3c9ea5ac3922495f93839b7128b0b8d0$
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
            -- lvl1_rapids10
            x=1450,
            y=2,
            width=360,
            height=232,

            sourceX = 0,
            sourceY = 6,
            sourceWidth = 360,
            sourceHeight = 256
        },
        {
            -- lvl1_rapids14
            x=1088,
            y=2,
            width=360,
            height=232,

            sourceX = 0,
            sourceY = 6,
            sourceWidth = 360,
            sourceHeight = 256
        },
        {
            -- lvl1_rapids2
            x=726,
            y=2,
            width=360,
            height=232,

            sourceX = 0,
            sourceY = 5,
            sourceWidth = 360,
            sourceHeight = 256
        },
        {
            -- lvl1_rapids4
            x=364,
            y=2,
            width=360,
            height=232,

            sourceX = 0,
            sourceY = 5,
            sourceWidth = 360,
            sourceHeight = 256
        },
        {
            -- lvl1_rapids7
            x=2,
            y=2,
            width=360,
            height=232,

            sourceX = 0,
            sourceY = 6,
            sourceWidth = 360,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 2048,
    sheetContentHeight = 256
}

SheetInfo.frameIndex =
{

    ["lvl1_rapids10"] = 1,
    ["lvl1_rapids14"] = 2,
    ["lvl1_rapids2"] = 3,
    ["lvl1_rapids4"] = 4,
    ["lvl1_rapids7"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
