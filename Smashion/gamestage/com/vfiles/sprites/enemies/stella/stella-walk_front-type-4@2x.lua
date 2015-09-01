--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9e4890119713a3b7cc29ea9fe703cf2b$
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
            -- stella-walk-forward0001
            x=820,
            y=0,
            width=200,
            height=408,

            sourceX = 88,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0002
            x=0,
            y=0,
            width=204,
            height=408,

            sourceX = 88,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0003
            x=616,
            y=0,
            width=200,
            height=408,

            sourceX = 92,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0004
            x=412,
            y=0,
            width=200,
            height=408,

            sourceX = 100,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0005
            x=408,
            y=820,
            width=200,
            height=404,

            sourceX = 100,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0006
            x=204,
            y=824,
            width=200,
            height=400,

            sourceX = 100,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0007
            x=0,
            y=412,
            width=200,
            height=412,

            sourceX = 100,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0008
            x=208,
            y=0,
            width=200,
            height=412,

            sourceX = 100,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0009
            x=820,
            y=412,
            width=200,
            height=404,

            sourceX = 96,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0010
            x=616,
            y=412,
            width=200,
            height=404,

            sourceX = 92,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0011
            x=204,
            y=416,
            width=200,
            height=404,

            sourceX = 92,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0012
            x=412,
            y=412,
            width=200,
            height=404,

            sourceX = 96,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0013
            x=612,
            y=820,
            width=200,
            height=396,

            sourceX = 96,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0014
            x=816,
            y=820,
            width=200,
            height=392,

            sourceX = 96,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-forward0015
            x=0,
            y=828,
            width=200,
            height=396,

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

    ["stella-walk-forward0001"] = 1,
    ["stella-walk-forward0002"] = 2,
    ["stella-walk-forward0003"] = 3,
    ["stella-walk-forward0004"] = 4,
    ["stella-walk-forward0005"] = 5,
    ["stella-walk-forward0006"] = 6,
    ["stella-walk-forward0007"] = 7,
    ["stella-walk-forward0008"] = 8,
    ["stella-walk-forward0009"] = 9,
    ["stella-walk-forward0010"] = 10,
    ["stella-walk-forward0011"] = 11,
    ["stella-walk-forward0012"] = 12,
    ["stella-walk-forward0013"] = 13,
    ["stella-walk-forward0014"] = 14,
    ["stella-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
