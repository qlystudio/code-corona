--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:00b5217841c778a08e70f4216d48fd89$
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
            -- stella-fall-away0001
            x=188,
            y=1004,
            width=188,
            height=412,

            sourceX = 108,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0002
            x=424,
            y=692,
            width=188,
            height=412,

            sourceX = 108,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0003
            x=728,
            y=368,
            width=188,
            height=412,

            sourceX = 108,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0004
            x=0,
            y=960,
            width=188,
            height=412,

            sourceX = 108,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0005
            x=0,
            y=1372,
            width=188,
            height=404,

            sourceX = 108,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0006
            x=612,
            y=780,
            width=188,
            height=400,

            sourceX = 104,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0007
            x=228,
            y=616,
            width=196,
            height=388,

            sourceX = 96,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0008
            x=524,
            y=320,
            width=204,
            height=372,

            sourceX = 92,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0009
            x=800,
            y=0,
            width=224,
            height=368,

            sourceX = 84,
            sourceY = 72,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0010
            x=0,
            y=600,
            width=228,
            height=360,

            sourceX = 72,
            sourceY = 96,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0011
            x=268,
            y=276,
            width=256,
            height=340,

            sourceX = 48,
            sourceY = 120,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0012
            x=536,
            y=0,
            width=264,
            height=320,

            sourceX = 48,
            sourceY = 156,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0013
            x=0,
            y=288,
            width=256,
            height=312,

            sourceX = 68,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0014
            x=0,
            y=0,
            width=268,
            height=288,

            sourceX = 64,
            sourceY = 208,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0015
            x=268,
            y=0,
            width=268,
            height=276,

            sourceX = 64,
            sourceY = 224,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["stella-fall-away0001"] = 1,
    ["stella-fall-away0002"] = 2,
    ["stella-fall-away0003"] = 3,
    ["stella-fall-away0004"] = 4,
    ["stella-fall-away0005"] = 5,
    ["stella-fall-away0006"] = 6,
    ["stella-fall-away0007"] = 7,
    ["stella-fall-away0008"] = 8,
    ["stella-fall-away0009"] = 9,
    ["stella-fall-away0010"] = 10,
    ["stella-fall-away0011"] = 11,
    ["stella-fall-away0012"] = 12,
    ["stella-fall-away0013"] = 13,
    ["stella-fall-away0014"] = 14,
    ["stella-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
