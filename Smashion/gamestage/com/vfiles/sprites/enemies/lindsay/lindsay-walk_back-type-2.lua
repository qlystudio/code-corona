--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:895e457d9a3393eeb8146d479438ed3f$
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
            -- lindsay-walk-away0001
            x=158,
            y=424,
            width=164,
            height=210,

            sourceX = 12,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0002
            x=316,
            y=0,
            width=162,
            height=206,

            sourceX = 14,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0003
            x=480,
            y=204,
            width=160,
            height=202,

            sourceX = 16,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0004
            x=324,
            y=818,
            width=156,
            height=198,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0005
            x=324,
            y=616,
            width=158,
            height=202,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0006
            x=322,
            y=412,
            width=160,
            height=204,

            sourceX = 16,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0007
            x=0,
            y=636,
            width=164,
            height=210,

            sourceX = 16,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0008
            x=0,
            y=212,
            width=160,
            height=212,

            sourceX = 18,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0009
            x=320,
            y=206,
            width=160,
            height=206,

            sourceX = 18,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0010
            x=160,
            y=0,
            width=156,
            height=210,

            sourceX = 20,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0011
            x=0,
            y=424,
            width=158,
            height=212,

            sourceX = 18,
            sourceY = 2,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0012
            x=160,
            y=210,
            width=160,
            height=208,

            sourceX = 16,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0013
            x=478,
            y=0,
            width=164,
            height=204,

            sourceX = 14,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0014
            x=164,
            y=634,
            width=160,
            height=210,

            sourceX = 14,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- lindsay-walk-away0015
            x=0,
            y=0,
            width=160,
            height=212,

            sourceX = 14,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["lindsay-walk-away0001"] = 1,
    ["lindsay-walk-away0002"] = 2,
    ["lindsay-walk-away0003"] = 3,
    ["lindsay-walk-away0004"] = 4,
    ["lindsay-walk-away0005"] = 5,
    ["lindsay-walk-away0006"] = 6,
    ["lindsay-walk-away0007"] = 7,
    ["lindsay-walk-away0008"] = 8,
    ["lindsay-walk-away0009"] = 9,
    ["lindsay-walk-away0010"] = 10,
    ["lindsay-walk-away0011"] = 11,
    ["lindsay-walk-away0012"] = 12,
    ["lindsay-walk-away0013"] = 13,
    ["lindsay-walk-away0014"] = 14,
    ["lindsay-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
