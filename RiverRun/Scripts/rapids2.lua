--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:23ba2e253d7134d20b10936de92c287e$
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
            -- rapids2-01
            x=658,
            y=2172,
            width=326,
            height=1083,

        },
        {
            -- rapids2-02
            x=1642,
            y=1087,
            width=326,
            height=1083,

        },
        {
            -- rapids2-03
            x=1314,
            y=1087,
            width=326,
            height=1083,

        },
        {
            -- rapids2-04
            x=986,
            y=1087,
            width=326,
            height=1083,

        },
        {
            -- rapids2-05
            x=658,
            y=1087,
            width=326,
            height=1083,

        },
        {
            -- rapids2-06
            x=330,
            y=2172,
            width=326,
            height=1083,

        },
        {
            -- rapids2-07
            x=330,
            y=1087,
            width=326,
            height=1083,

        },
        {
            -- rapids2-08
            x=2,
            y=2172,
            width=326,
            height=1083,

        },
        {
            -- rapids2-09
            x=2,
            y=1087,
            width=326,
            height=1083,

        },
        {
            -- rapids2-10
            x=1642,
            y=2,
            width=326,
            height=1083,

        },
        {
            -- rapids2-11
            x=1314,
            y=2,
            width=326,
            height=1083,

        },
        {
            -- rapids2-12
            x=986,
            y=2,
            width=326,
            height=1083,

        },
        {
            -- rapids2-13
            x=658,
            y=2,
            width=326,
            height=1083,

        },
        {
            -- rapids2-14
            x=330,
            y=2,
            width=326,
            height=1083,

        },
        {
            -- rapids2-15
            x=2,
            y=2,
            width=326,
            height=1083,

        },
    },
    
    sheetContentWidth = 2048,
    sheetContentHeight = 4096
}

SheetInfo.frameIndex =
{

    ["rapids2-01"] = 1,
    ["rapids2-02"] = 2,
    ["rapids2-03"] = 3,
    ["rapids2-04"] = 4,
    ["rapids2-05"] = 5,
    ["rapids2-06"] = 6,
    ["rapids2-07"] = 7,
    ["rapids2-08"] = 8,
    ["rapids2-09"] = 9,
    ["rapids2-10"] = 10,
    ["rapids2-11"] = 11,
    ["rapids2-12"] = 12,
    ["rapids2-13"] = 13,
    ["rapids2-14"] = 14,
    ["rapids2-15"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
