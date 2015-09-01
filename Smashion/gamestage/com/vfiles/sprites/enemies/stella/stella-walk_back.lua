--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:462275a0945b9449fff7f707e5ec3f5b$
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
            -- stella-walk-away0001
            x=208,
            y=0,
            width=104,
            height=208,

            sourceX = 44,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0002
            x=0,
            y=816,
            width=104,
            height=202,

            sourceX = 44,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0003
            x=208,
            y=412,
            width=104,
            height=198,

            sourceX = 44,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0004
            x=312,
            y=604,
            width=104,
            height=192,

            sourceX = 46,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0005
            x=312,
            y=412,
            width=104,
            height=192,

            sourceX = 48,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0006
            x=104,
            y=412,
            width=104,
            height=198,

            sourceX = 48,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0007
            x=104,
            y=0,
            width=104,
            height=210,

            sourceX = 48,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0008
            x=0,
            y=0,
            width=104,
            height=210,

            sourceX = 48,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0009
            x=0,
            y=614,
            width=104,
            height=202,

            sourceX = 48,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0010
            x=0,
            y=412,
            width=104,
            height=202,

            sourceX = 48,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0011
            x=104,
            y=210,
            width=104,
            height=202,

            sourceX = 48,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0012
            x=208,
            y=208,
            width=104,
            height=204,

            sourceX = 46,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0013
            x=0,
            y=210,
            width=104,
            height=202,

            sourceX = 46,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0014
            x=312,
            y=206,
            width=104,
            height=206,

            sourceX = 44,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0015
            x=312,
            y=0,
            width=104,
            height=206,

            sourceX = 44,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["stella-walk-away0001"] = 1,
    ["stella-walk-away0002"] = 2,
    ["stella-walk-away0003"] = 3,
    ["stella-walk-away0004"] = 4,
    ["stella-walk-away0005"] = 5,
    ["stella-walk-away0006"] = 6,
    ["stella-walk-away0007"] = 7,
    ["stella-walk-away0008"] = 8,
    ["stella-walk-away0009"] = 9,
    ["stella-walk-away0010"] = 10,
    ["stella-walk-away0011"] = 11,
    ["stella-walk-away0012"] = 12,
    ["stella-walk-away0013"] = 13,
    ["stella-walk-away0014"] = 14,
    ["stella-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
