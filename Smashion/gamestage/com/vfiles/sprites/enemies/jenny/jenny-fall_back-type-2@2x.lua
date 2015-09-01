--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:23c521cf50095af6c5ab507552b601df$
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
            -- jenny-fall-away0001
            x=0,
            y=636,
            width=200,
            height=416,

            sourceX = 104,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0002
            x=456,
            y=896,
            width=192,
            height=408,

            sourceX = 108,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0003
            x=204,
            y=1016,
            width=188,
            height=408,

            sourceX = 116,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0004
            x=716,
            y=764,
            width=200,
            height=408,

            sourceX = 112,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0005
            x=240,
            y=628,
            width=212,
            height=384,

            sourceX = 120,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0006
            x=496,
            y=540,
            width=216,
            height=352,

            sourceX = 112,
            sourceY = 68,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0007
            x=500,
            y=0,
            width=236,
            height=340,

            sourceX = 112,
            sourceY = 84,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0008
            x=0,
            y=0,
            width=252,
            height=340,

            sourceX = 108,
            sourceY = 84,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0009
            x=256,
            y=0,
            width=240,
            height=324,

            sourceX = 108,
            sourceY = 100,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0010
            x=728,
            y=460,
            width=224,
            height=300,

            sourceX = 104,
            sourceY = 124,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0011
            x=256,
            y=328,
            width=236,
            height=296,

            sourceX = 100,
            sourceY = 128,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0012
            x=0,
            y=344,
            width=236,
            height=288,

            sourceX = 96,
            sourceY = 136,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0013
            x=740,
            y=0,
            width=236,
            height=236,

            sourceX = 96,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0014
            x=740,
            y=240,
            width=228,
            height=216,

            sourceX = 92,
            sourceY = 212,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-away0015
            x=496,
            y=344,
            width=228,
            height=192,

            sourceX = 92,
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

    ["jenny-fall-away0001"] = 1,
    ["jenny-fall-away0002"] = 2,
    ["jenny-fall-away0003"] = 3,
    ["jenny-fall-away0004"] = 4,
    ["jenny-fall-away0005"] = 5,
    ["jenny-fall-away0006"] = 6,
    ["jenny-fall-away0007"] = 7,
    ["jenny-fall-away0008"] = 8,
    ["jenny-fall-away0009"] = 9,
    ["jenny-fall-away0010"] = 10,
    ["jenny-fall-away0011"] = 11,
    ["jenny-fall-away0012"] = 12,
    ["jenny-fall-away0013"] = 13,
    ["jenny-fall-away0014"] = 14,
    ["jenny-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
