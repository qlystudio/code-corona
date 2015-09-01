--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c3a187b703eba13b3f513fd2a2529603$
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
            -- cara-walk-away0001
            x=42,
            y=0,
            width=40,
            height=192,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0002
            x=202,
            y=172,
            width=40,
            height=184,

            sourceX = 76,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0003
            x=282,
            y=182,
            width=40,
            height=180,

            sourceX = 76,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0004
            x=162,
            y=0,
            width=50,
            height=172,

            sourceX = 76,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0005
            x=284,
            y=0,
            width=42,
            height=178,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0006
            x=242,
            y=0,
            width=42,
            height=182,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0007
            x=0,
            y=192,
            width=42,
            height=192,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0008
            x=0,
            y=0,
            width=42,
            height=192,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0009
            x=242,
            y=182,
            width=40,
            height=182,

            sourceX = 76,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0010
            x=162,
            y=172,
            width=40,
            height=184,

            sourceX = 76,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0011
            x=82,
            y=188,
            width=40,
            height=188,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0012
            x=122,
            y=186,
            width=40,
            height=186,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0013
            x=122,
            y=0,
            width=40,
            height=186,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0014
            x=42,
            y=192,
            width=40,
            height=190,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- cara-walk-away0015
            x=82,
            y=0,
            width=40,
            height=188,

            sourceX = 76,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["cara-walk-away0001"] = 1,
    ["cara-walk-away0002"] = 2,
    ["cara-walk-away0003"] = 3,
    ["cara-walk-away0004"] = 4,
    ["cara-walk-away0005"] = 5,
    ["cara-walk-away0006"] = 6,
    ["cara-walk-away0007"] = 7,
    ["cara-walk-away0008"] = 8,
    ["cara-walk-away0009"] = 9,
    ["cara-walk-away0010"] = 10,
    ["cara-walk-away0011"] = 11,
    ["cara-walk-away0012"] = 12,
    ["cara-walk-away0013"] = 13,
    ["cara-walk-away0014"] = 14,
    ["cara-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
