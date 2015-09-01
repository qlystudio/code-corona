--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:6084696393ac4870bec6a10f0ff040a3$
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
            -- swamp2-0
            x=335,
            y=2,
            width=109,
            height=263,

        },
        {
            -- swamp2-1
            x=224,
            y=2,
            width=109,
            height=263,

        },
        {
            -- swamp2-2
            x=113,
            y=2,
            width=109,
            height=263,

        },
        {
            -- swamp2-3
            x=2,
            y=2,
            width=109,
            height=263,

        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["swamp2-0"] = 1,
    ["swamp2-1"] = 2,
    ["swamp2-2"] = 3,
    ["swamp2-3"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
