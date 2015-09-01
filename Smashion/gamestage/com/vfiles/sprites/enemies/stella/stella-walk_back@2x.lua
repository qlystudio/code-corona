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
            x=416,
            y=0,
            width=208,
            height=416,

            sourceX = 88,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0002
            x=0,
            y=1632,
            width=208,
            height=404,

            sourceX = 88,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0003
            x=416,
            y=824,
            width=208,
            height=396,

            sourceX = 88,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0004
            x=624,
            y=1208,
            width=208,
            height=384,

            sourceX = 92,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0005
            x=624,
            y=824,
            width=208,
            height=384,

            sourceX = 96,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0006
            x=208,
            y=824,
            width=208,
            height=396,

            sourceX = 96,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0007
            x=208,
            y=0,
            width=208,
            height=420,

            sourceX = 96,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0008
            x=0,
            y=0,
            width=208,
            height=420,

            sourceX = 96,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0009
            x=0,
            y=1228,
            width=208,
            height=404,

            sourceX = 96,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0010
            x=0,
            y=824,
            width=208,
            height=404,

            sourceX = 96,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0011
            x=208,
            y=420,
            width=208,
            height=404,

            sourceX = 96,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0012
            x=416,
            y=416,
            width=208,
            height=408,

            sourceX = 92,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0013
            x=0,
            y=420,
            width=208,
            height=404,

            sourceX = 92,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0014
            x=624,
            y=412,
            width=208,
            height=412,

            sourceX = 88,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0015
            x=624,
            y=0,
            width=208,
            height=412,

            sourceX = 88,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
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
