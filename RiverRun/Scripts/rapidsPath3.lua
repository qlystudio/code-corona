--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:51a32cae1f6f72ab507aa0416c788fd8$
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
            -- rapids3-00
            x=626,
            y=509,
            width=154,
            height=505,

        },
        {
            -- rapids3-01
            x=470,
            y=509,
            width=154,
            height=505,

        },
        {
            -- rapids3-02
            x=314,
            y=509,
            width=154,
            height=505,

        },
        {
            -- rapids3-03
            x=158,
            y=1523,
            width=154,
            height=505,

        },
        {
            -- rapids3-04
            x=158,
            y=1016,
            width=154,
            height=505,

        },
        {
            -- rapids3-05
            x=158,
            y=509,
            width=154,
            height=505,

        },
        {
            -- rapids3-06
            x=2,
            y=1523,
            width=154,
            height=505,

        },
        {
            -- rapids3-07
            x=2,
            y=1016,
            width=154,
            height=505,

        },
        {
            -- rapids3-08
            x=2,
            y=509,
            width=154,
            height=505,

        },
        {
            -- rapids3-09
            x=782,
            y=2,
            width=154,
            height=505,

        },
        {
            -- rapids3-10
            x=626,
            y=2,
            width=154,
            height=505,

        },
        {
            -- rapids3-11
            x=470,
            y=2,
            width=154,
            height=505,

        },
        {
            -- rapids3-12
            x=314,
            y=2,
            width=154,
            height=505,

        },
        {
            -- rapids3-13
            x=158,
            y=2,
            width=154,
            height=505,

        },
        {
            -- rapids3-14
            x=2,
            y=2,
            width=154,
            height=505,

        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["rapids3-00"] = 1,
    ["rapids3-01"] = 2,
    ["rapids3-02"] = 3,
    ["rapids3-03"] = 4,
    ["rapids3-04"] = 5,
    ["rapids3-05"] = 6,
    ["rapids3-06"] = 7,
    ["rapids3-07"] = 8,
    ["rapids3-08"] = 9,
    ["rapids3-09"] = 10,
    ["rapids3-10"] = 11,
    ["rapids3-11"] = 12,
    ["rapids3-12"] = 13,
    ["rapids3-13"] = 14,
    ["rapids3-14"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
