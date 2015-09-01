--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0c7be486f798f27b2639ab599f330bcc$
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
            -- Derpy Beave3
            x=2,
            y=2,
            width=91,
            height=93,

        },
        {
            -- Derpy Beaver1
            x=2,
            y=374,
            width=91,
            height=89,

        },
        {
            -- Derpy Beaver2
            x=2,
            y=282,
            width=91,
            height=90,

        },
        {
            -- Derpy Beaver4
            x=2,
            y=97,
            width=91,
            height=91,

        },
        {
            -- Derpy Beaver5
            x=2,
            y=190,
            width=91,
            height=90,

        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["Derpy Beave3"] = 1,
    ["Derpy Beaver1"] = 2,
    ["Derpy Beaver2"] = 3,
    ["Derpy Beaver4"] = 4,
    ["Derpy Beaver5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
