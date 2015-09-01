--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:43173515e6eac76a0c796b178b725dd1$
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
            -- rapidsPath1-00
            x=518,
            y=778,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-01
            x=518,
            y=584,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-02
            x=518,
            y=390,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-03
            x=260,
            y=778,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-04
            x=260,
            y=584,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-05
            x=260,
            y=390,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-06
            x=518,
            y=196,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-07
            x=260,
            y=196,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-08
            x=2,
            y=778,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-09
            x=2,
            y=584,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-10
            x=2,
            y=390,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-11
            x=2,
            y=196,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-12
            x=518,
            y=2,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-13
            x=260,
            y=2,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
        {
            -- rapidsPath1-14
            x=2,
            y=2,
            width=256,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 262,
            sourceHeight = 192
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["rapidsPath1-00"] = 1,
    ["rapidsPath1-01"] = 2,
    ["rapidsPath1-02"] = 3,
    ["rapidsPath1-03"] = 4,
    ["rapidsPath1-04"] = 5,
    ["rapidsPath1-05"] = 6,
    ["rapidsPath1-06"] = 7,
    ["rapidsPath1-07"] = 8,
    ["rapidsPath1-08"] = 9,
    ["rapidsPath1-09"] = 10,
    ["rapidsPath1-10"] = 11,
    ["rapidsPath1-11"] = 12,
    ["rapidsPath1-12"] = 13,
    ["rapidsPath1-13"] = 14,
    ["rapidsPath1-14"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
