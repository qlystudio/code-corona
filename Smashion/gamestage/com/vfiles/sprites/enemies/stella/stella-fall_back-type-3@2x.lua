--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f10425bd8f4771f98658b0e75f9523ec$
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
            x=428,
            y=600,
            width=92,
            height=412,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0002
            x=312,
            y=972,
            width=112,
            height=412,

            sourceX = 144,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0003
            x=140,
            y=1372,
            width=136,
            height=412,

            sourceX = 132,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0004
            x=0,
            y=1272,
            width=140,
            height=404,

            sourceX = 116,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0005
            x=160,
            y=972,
            width=152,
            height=400,

            sourceX = 108,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0006
            x=0,
            y=884,
            width=160,
            height=388,

            sourceX = 104,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0007
            x=252,
            y=600,
            width=176,
            height=372,

            sourceX = 92,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0008
            x=808,
            y=0,
            width=188,
            height=368,

            sourceX = 84,
            sourceY = 72,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0009
            x=524,
            y=320,
            width=224,
            height=360,

            sourceX = 72,
            sourceY = 96,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0010
            x=0,
            y=544,
            width=252,
            height=340,

            sourceX = 48,
            sourceY = 120,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0011
            x=544,
            y=0,
            width=264,
            height=320,

            sourceX = 48,
            sourceY = 156,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0012
            x=268,
            y=288,
            width=256,
            height=312,

            sourceX = 68,
            sourceY = 180,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0013
            x=276,
            y=0,
            width=268,
            height=288,

            sourceX = 64,
            sourceY = 208,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0014
            x=0,
            y=268,
            width=268,
            height=276,

            sourceX = 64,
            sourceY = 224,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-away0015
            x=0,
            y=0,
            width=276,
            height=268,

            sourceX = 56,
            sourceY = 236,
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
