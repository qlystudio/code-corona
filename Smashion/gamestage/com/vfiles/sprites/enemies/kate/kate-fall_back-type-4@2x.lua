--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:6a325516f377f8b457c83ef17b657637$
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
            -- kate-fall-away0001
            x=932,
            y=368,
            width=92,
            height=408,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0002
            x=416,
            y=616,
            width=112,
            height=412,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0003
            x=676,
            y=740,
            width=136,
            height=404,

            sourceX = 128,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0004
            x=0,
            y=916,
            width=140,
            height=404,

            sourceX = 116,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0005
            x=528,
            y=668,
            width=148,
            height=396,

            sourceX = 108,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0006
            x=252,
            y=616,
            width=164,
            height=388,

            sourceX = 100,
            sourceY = 44,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0007
            x=752,
            y=368,
            width=180,
            height=372,

            sourceX = 88,
            sourceY = 64,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0008
            x=804,
            y=0,
            width=192,
            height=368,

            sourceX = 80,
            sourceY = 80,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0009
            x=528,
            y=316,
            width=224,
            height=352,

            sourceX = 72,
            sourceY = 108,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0010
            x=0,
            y=580,
            width=252,
            height=336,

            sourceX = 48,
            sourceY = 132,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0011
            x=540,
            y=0,
            width=264,
            height=316,

            sourceX = 44,
            sourceY = 168,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0012
            x=268,
            y=300,
            width=260,
            height=316,

            sourceX = 64,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0013
            x=272,
            y=0,
            width=268,
            height=300,

            sourceX = 60,
            sourceY = 204,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0014
            x=0,
            y=288,
            width=268,
            height=292,

            sourceX = 60,
            sourceY = 216,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-fall-away0015
            x=0,
            y=0,
            width=272,
            height=288,

            sourceX = 56,
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

    ["kate-fall-away0001"] = 1,
    ["kate-fall-away0002"] = 2,
    ["kate-fall-away0003"] = 3,
    ["kate-fall-away0004"] = 4,
    ["kate-fall-away0005"] = 5,
    ["kate-fall-away0006"] = 6,
    ["kate-fall-away0007"] = 7,
    ["kate-fall-away0008"] = 8,
    ["kate-fall-away0009"] = 9,
    ["kate-fall-away0010"] = 10,
    ["kate-fall-away0011"] = 11,
    ["kate-fall-away0012"] = 12,
    ["kate-fall-away0013"] = 13,
    ["kate-fall-away0014"] = 14,
    ["kate-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
