--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9727270b36aed9f090364199e962d958$
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
            -- rapidsPath2-00
            x=288,
            y=436,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-01
            x=288,
            y=219,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-02
            x=860,
            y=2,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-03
            x=717,
            y=2,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-04
            x=574,
            y=2,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-05
            x=431,
            y=2,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-06
            x=288,
            y=2,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-07
            x=145,
            y=653,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-08
            x=145,
            y=436,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-09
            x=145,
            y=219,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-10
            x=145,
            y=2,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-11
            x=2,
            y=653,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-12
            x=2,
            y=436,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-13
            x=2,
            y=219,
            width=141,
            height=215,

        },
        {
            -- rapidsPath2-14
            x=2,
            y=2,
            width=141,
            height=215,

        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["rapidsPath2-00"] = 1,
    ["rapidsPath2-01"] = 2,
    ["rapidsPath2-02"] = 3,
    ["rapidsPath2-03"] = 4,
    ["rapidsPath2-04"] = 5,
    ["rapidsPath2-05"] = 6,
    ["rapidsPath2-06"] = 7,
    ["rapidsPath2-07"] = 8,
    ["rapidsPath2-08"] = 9,
    ["rapidsPath2-09"] = 10,
    ["rapidsPath2-10"] = 11,
    ["rapidsPath2-11"] = 12,
    ["rapidsPath2-12"] = 13,
    ["rapidsPath2-13"] = 14,
    ["rapidsPath2-14"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
