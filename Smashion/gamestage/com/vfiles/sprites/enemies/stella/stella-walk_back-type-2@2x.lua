--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4de5f6fcc63ab7cd6f0986187212a23b$
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
            x=88,
            y=0,
            width=88,
            height=416,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0002
            x=428,
            y=404,
            width=84,
            height=404,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0003
            x=432,
            y=0,
            width=84,
            height=396,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0004
            x=516,
            y=0,
            width=108,
            height=384,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0005
            x=592,
            y=384,
            width=88,
            height=384,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0006
            x=512,
            y=396,
            width=80,
            height=396,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0007
            x=0,
            y=420,
            width=88,
            height=420,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0008
            x=0,
            y=0,
            width=88,
            height=420,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0009
            x=260,
            y=0,
            width=88,
            height=404,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0010
            x=348,
            y=0,
            width=84,
            height=404,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0011
            x=344,
            y=404,
            width=84,
            height=404,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0012
            x=176,
            y=412,
            width=84,
            height=408,

            sourceX = 148,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0013
            x=260,
            y=404,
            width=84,
            height=404,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0014
            x=176,
            y=0,
            width=84,
            height=412,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-walk-away0015
            x=88,
            y=416,
            width=88,
            height=412,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
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
