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
            x=304,
            y=304,
            width=96,
            height=96,

        },
        {
            -- armory-bag-selected
            x=404,
            y=204,
            width=96,
            height=96,

        },
        {
            -- armory-bag
            x=304,
            y=204,
            width=96,
            height=96,

        },
        {
            -- armory-bottle-on
            x=204,
            y=404,
            width=96,
            height=96,

        },
        {
            -- armory-bottle-selected
            x=204,
            y=304,
            width=96,
            height=96,

        },
        {
            -- armory-bottle
            x=204,
            y=204,
            width=96,
            height=96,

        },
        {
            -- armory-camera-on
            x=404,
            y=104,
            width=96,
            height=96,

        },
        {
            -- armory-camera-selected
            x=304,
            y=104,
            width=96,
            height=96,

        },
        {
            -- armory-camera
            x=204,
            y=104,
            width=96,
            height=96,

        },
        {
            -- armory-cellphone-on
            x=348,
            y=4,
            width=96,
            height=96,

        },
        {
            -- armory-cellphone-selected
            x=248,
            y=4,
            width=96,
            height=96,

        },
        {
            -- armory-cellphone
            x=104,
            y=348,
            width=96,
            height=96,

        },
        {
            -- armory-cigarettes-on
            x=104,
            y=248,
            width=96,
            height=96,

        },
        {
            -- armory-cigarettes-selected
            x=148,
            y=4,
            width=96,
            height=96,

        },
        {
            -- armory-cigarettes
            x=104,
            y=148,
            width=96,
            height=96,

        },
        {
            -- armory-stiletto-on
            x=4,
            y=348,
            width=96,
            height=96,

        },
        {
            -- armory-stiletto-selected
            x=4,
            y=248,
            width=96,
            height=96,

        },
        {
            -- armory-stiletto
            x=4,
            y=148,
            width=96,
            height=96,

        },
        {
            -- arrow
            x=4,
            y=448,
            width=30,
            height=16,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 30,
            sourceHeight = 15
        },
        {
            -- launchpad
            x=4,
            y=4,
            width=140,
            height=140,

        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
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
