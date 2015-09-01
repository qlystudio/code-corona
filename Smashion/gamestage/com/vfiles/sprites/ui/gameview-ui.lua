--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:64a5987fe8307baa1d95baf14fd63a4e$
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
            -- armory-bag-on
            x=152,
            y=152,
            width=48,
            height=48,

        },
        {
            -- armory-bag-selected
            x=202,
            y=102,
            width=48,
            height=48,

        },
        {
            -- armory-bag
            x=152,
            y=102,
            width=48,
            height=48,

        },
        {
            -- armory-bottle-on
            x=102,
            y=202,
            width=48,
            height=48,

        },
        {
            -- armory-bottle-selected
            x=102,
            y=152,
            width=48,
            height=48,

        },
        {
            -- armory-bottle
            x=102,
            y=102,
            width=48,
            height=48,

        },
        {
            -- armory-camera-on
            x=202,
            y=52,
            width=48,
            height=48,

        },
        {
            -- armory-camera-selected
            x=152,
            y=52,
            width=48,
            height=48,

        },
        {
            -- armory-camera
            x=102,
            y=52,
            width=48,
            height=48,

        },
        {
            -- armory-cellphone-on
            x=174,
            y=2,
            width=48,
            height=48,

        },
        {
            -- armory-cellphone-selected
            x=124,
            y=2,
            width=48,
            height=48,

        },
        {
            -- armory-cellphone
            x=52,
            y=174,
            width=48,
            height=48,

        },
        {
            -- armory-cigarettes-on
            x=52,
            y=124,
            width=48,
            height=48,

        },
        {
            -- armory-cigarettes-selected
            x=74,
            y=2,
            width=48,
            height=48,

        },
        {
            -- armory-cigarettes
            x=52,
            y=74,
            width=48,
            height=48,

        },
        {
            -- armory-stiletto-on
            x=2,
            y=174,
            width=48,
            height=48,

        },
        {
            -- armory-stiletto-selected
            x=2,
            y=124,
            width=48,
            height=48,

        },
        {
            -- armory-stiletto
            x=2,
            y=74,
            width=48,
            height=48,

        },
        {
            -- arrow
            x=2,
            y=224,
            width=15,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 8
        },
        {
            -- launchpad
            x=2,
            y=2,
            width=70,
            height=70,

        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 256
}

SheetInfo.frameIndex =
{

    ["armory-bag-on"] = 1,
    ["armory-bag-selected"] = 2,
    ["armory-bag"] = 3,
    ["armory-bottle-on"] = 4,
    ["armory-bottle-selected"] = 5,
    ["armory-bottle"] = 6,
    ["armory-camera-on"] = 7,
    ["armory-camera-selected"] = 8,
    ["armory-camera"] = 9,
    ["armory-cellphone-on"] = 10,
    ["armory-cellphone-selected"] = 11,
    ["armory-cellphone"] = 12,
    ["armory-cigarettes-on"] = 13,
    ["armory-cigarettes-selected"] = 14,
    ["armory-cigarettes"] = 15,
    ["armory-stiletto-on"] = 16,
    ["armory-stiletto-selected"] = 17,
    ["armory-stiletto"] = 18,
    ["arrow"] = 19,
    ["launchpad"] = 20,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
