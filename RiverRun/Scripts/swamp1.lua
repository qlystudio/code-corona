--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:be99c416ff968eb47674d0190889a974$
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
            -- swamp1-0
            x=422,
            y=938,
            width=418,
            height=934,

        },
        {
            -- swamp1-1
            x=422,
            y=2,
            width=418,
            height=934,

        },
        {
            -- swamp1-2
            x=2,
            y=938,
            width=418,
            height=934,

        },
        {
            -- swamp1-3
            x=2,
            y=2,
            width=418,
            height=934,

        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["swamp1-0"] = 1,
    ["swamp1-1"] = 2,
    ["swamp1-2"] = 3,
    ["swamp1-3"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
