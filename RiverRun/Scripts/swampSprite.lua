--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:20fde3fd367b19433076d882ad4cc427$
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
            -- lvl1_swamp1
            x=646,
            y=2,
            width=320,
            height=244,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 250
        },
        {
            -- lvl1_swamp2
            x=324,
            y=248,
            width=320,
            height=244,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 250
        },
        {
            -- lvl1_swamp3
            x=324,
            y=2,
            width=320,
            height=244,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 250
        },
        {
            -- lvl1_swamp4
            x=2,
            y=248,
            width=320,
            height=244,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 250
        },
        {
            -- lvl1_swamp5
            x=2,
            y=2,
            width=320,
            height=244,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 250
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["lvl1_swamp1"] = 1,
    ["lvl1_swamp2"] = 2,
    ["lvl1_swamp3"] = 3,
    ["lvl1_swamp4"] = 4,
    ["lvl1_swamp5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
