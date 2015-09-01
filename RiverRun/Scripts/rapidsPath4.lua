--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:23b1b1ba1ab570c2576c6236117c2b0f$
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
            -- rapids4-00
            x=162,
            y=916,
            width=158,
            height=455,

        },
        {
            -- rapids4-01
            x=802,
            y=459,
            width=158,
            height=455,

        },
        {
            -- rapids4-02
            x=642,
            y=459,
            width=158,
            height=455,

        },
        {
            -- rapids4-03
            x=482,
            y=459,
            width=158,
            height=455,

        },
        {
            -- rapids4-04
            x=322,
            y=459,
            width=158,
            height=455,

        },
        {
            -- rapids4-05
            x=162,
            y=459,
            width=158,
            height=455,

        },
        {
            -- rapids4-06
            x=2,
            y=1373,
            width=158,
            height=455,

        },
        {
            -- rapids4-07
            x=2,
            y=916,
            width=158,
            height=455,

        },
        {
            -- rapids4-08
            x=2,
            y=459,
            width=158,
            height=455,

        },
        {
            -- rapids4-09
            x=802,
            y=2,
            width=158,
            height=455,

        },
        {
            -- rapids4-10
            x=642,
            y=2,
            width=158,
            height=455,

        },
        {
            -- rapids4-11
            x=482,
            y=2,
            width=158,
            height=455,

        },
        {
            -- rapids4-12
            x=322,
            y=2,
            width=158,
            height=455,

        },
        {
            -- rapids4-13
            x=162,
            y=2,
            width=158,
            height=455,

        },
        {
            -- rapids4-14
            x=2,
            y=2,
            width=158,
            height=455,

        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["rapids4-00"] = 1,
    ["rapids4-01"] = 2,
    ["rapids4-02"] = 3,
    ["rapids4-03"] = 4,
    ["rapids4-04"] = 5,
    ["rapids4-05"] = 6,
    ["rapids4-06"] = 7,
    ["rapids4-07"] = 8,
    ["rapids4-08"] = 9,
    ["rapids4-09"] = 10,
    ["rapids4-10"] = 11,
    ["rapids4-11"] = 12,
    ["rapids4-12"] = 13,
    ["rapids4-13"] = 14,
    ["rapids4-14"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
