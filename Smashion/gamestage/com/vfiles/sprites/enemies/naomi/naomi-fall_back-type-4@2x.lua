--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:74a769f08267e4e4285e98088a57a41f$
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
            -- naomi-fall-away0001
            x=892,
            y=676,
            width=116,
            height=444,

            sourceX = 100,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0002
            x=180,
            y=892,
            width=168,
            height=404,

            sourceX = 76,
            sourceY = 52,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0003
            x=756,
            y=304,
            width=224,
            height=372,

            sourceX = 44,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0004
            x=516,
            y=0,
            width=240,
            height=372,

            sourceX = 20,
            sourceY = 92,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0005
            x=0,
            y=0,
            width=264,
            height=360,

            sourceX = 8,
            sourceY = 104,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0006
            x=264,
            y=0,
            width=252,
            height=344,

            sourceX = 20,
            sourceY = 120,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0007
            x=0,
            y=360,
            width=236,
            height=316,

            sourceX = 40,
            sourceY = 148,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0008
            x=264,
            y=344,
            width=240,
            height=308,

            sourceX = 36,
            sourceY = 156,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0009
            x=756,
            y=0,
            width=236,
            height=304,

            sourceX = 48,
            sourceY = 160,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0010
            x=504,
            y=372,
            width=220,
            height=272,

            sourceX = 64,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0011
            x=504,
            y=644,
            width=208,
            height=244,

            sourceX = 80,
            sourceY = 224,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0012
            x=712,
            y=676,
            width=180,
            height=232,

            sourceX = 104,
            sourceY = 236,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0013
            x=416,
            y=888,
            width=176,
            height=240,

            sourceX = 104,
            sourceY = 236,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0014
            x=0,
            y=676,
            width=180,
            height=240,

            sourceX = 104,
            sourceY = 236,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-away0015
            x=236,
            y=652,
            width=180,
            height=240,

            sourceX = 104,
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

    ["naomi-fall-away0001"] = 1,
    ["naomi-fall-away0002"] = 2,
    ["naomi-fall-away0003"] = 3,
    ["naomi-fall-away0004"] = 4,
    ["naomi-fall-away0005"] = 5,
    ["naomi-fall-away0006"] = 6,
    ["naomi-fall-away0007"] = 7,
    ["naomi-fall-away0008"] = 8,
    ["naomi-fall-away0009"] = 9,
    ["naomi-fall-away0010"] = 10,
    ["naomi-fall-away0011"] = 11,
    ["naomi-fall-away0012"] = 12,
    ["naomi-fall-away0013"] = 13,
    ["naomi-fall-away0014"] = 14,
    ["naomi-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
