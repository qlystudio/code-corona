--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:da797b337af7f9e15b6431363e899a87$
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
            -- rapids1-00
            x=638,
            y=786,
            width=316,
            height=194,

        },
        {
            -- rapids1-01
            x=638,
            y=590,
            width=316,
            height=194,

        },
        {
            -- rapids1-02
            x=320,
            y=786,
            width=316,
            height=194,

        },
        {
            -- rapids1-03
            x=320,
            y=590,
            width=316,
            height=194,

        },
        {
            -- rapids1-04
            x=638,
            y=394,
            width=316,
            height=194,

        },
        {
            -- rapids1-05
            x=320,
            y=394,
            width=316,
            height=194,

        },
        {
            -- rapids1-06
            x=2,
            y=786,
            width=316,
            height=194,

        },
        {
            -- rapids1-07
            x=2,
            y=590,
            width=316,
            height=194,

        },
        {
            -- rapids1-08
            x=2,
            y=394,
            width=316,
            height=194,

        },
        {
            -- rapids1-09
            x=638,
            y=198,
            width=316,
            height=194,

        },
        {
            -- rapids1-10
            x=320,
            y=198,
            width=316,
            height=194,

        },
        {
            -- rapids1-11
            x=2,
            y=198,
            width=316,
            height=194,

        },
        {
            -- rapids1-12
            x=638,
            y=2,
            width=316,
            height=194,

        },
        {
            -- rapids1-13
            x=320,
            y=2,
            width=316,
            height=194,

        },
        {
            -- rapids1-14
            x=2,
            y=2,
            width=316,
            height=194,

        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["rapids1-00"] = 1,
    ["rapids1-01"] = 2,
    ["rapids1-02"] = 3,
    ["rapids1-03"] = 4,
    ["rapids1-04"] = 5,
    ["rapids1-05"] = 6,
    ["rapids1-06"] = 7,
    ["rapids1-07"] = 8,
    ["rapids1-08"] = 9,
    ["rapids1-09"] = 10,
    ["rapids1-10"] = 11,
    ["rapids1-11"] = 12,
    ["rapids1-12"] = 13,
    ["rapids1-13"] = 14,
    ["rapids1-14"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
