--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d2c98d33dab927d48bac45bf30ec5852$
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
            -- jenny-fall-forward0001
            x=216,
            y=1140,
            width=204,
            height=380,

            sourceX = 120,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0002
            x=0,
            y=1328,
            width=196,
            height=360,

            sourceX = 120,
            sourceY = 52,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0003
            x=0,
            y=1692,
            width=196,
            height=328,

            sourceX = 116,
            sourceY = 72,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0004
            x=200,
            y=1524,
            width=196,
            height=292,

            sourceX = 112,
            sourceY = 92,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0005
            x=224,
            y=632,
            width=216,
            height=260,

            sourceX = 100,
            sourceY = 112,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0006
            x=0,
            y=376,
            width=232,
            height=220,

            sourceX = 76,
            sourceY = 156,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0007
            x=0,
            y=188,
            width=256,
            height=184,

            sourceX = 52,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0008
            x=0,
            y=0,
            width=256,
            height=184,

            sourceX = 52,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0009
            x=260,
            y=204,
            width=240,
            height=200,

            sourceX = 68,
            sourceY = 200,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0010
            x=260,
            y=0,
            width=240,
            height=200,

            sourceX = 68,
            sourceY = 200,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0011
            x=0,
            y=600,
            width=220,
            height=220,

            sourceX = 88,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0012
            x=236,
            y=408,
            width=220,
            height=220,

            sourceX = 88,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0013
            x=0,
            y=1084,
            width=212,
            height=240,

            sourceX = 96,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0014
            x=220,
            y=896,
            width=212,
            height=240,

            sourceX = 96,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0015
            x=0,
            y=824,
            width=216,
            height=256,

            sourceX = 92,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["jenny-fall-forward0001"] = 1,
    ["jenny-fall-forward0002"] = 2,
    ["jenny-fall-forward0003"] = 3,
    ["jenny-fall-forward0004"] = 4,
    ["jenny-fall-forward0005"] = 5,
    ["jenny-fall-forward0006"] = 6,
    ["jenny-fall-forward0007"] = 7,
    ["jenny-fall-forward0008"] = 8,
    ["jenny-fall-forward0009"] = 9,
    ["jenny-fall-forward0010"] = 10,
    ["jenny-fall-forward0011"] = 11,
    ["jenny-fall-forward0012"] = 12,
    ["jenny-fall-forward0013"] = 13,
    ["jenny-fall-forward0014"] = 14,
    ["jenny-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
