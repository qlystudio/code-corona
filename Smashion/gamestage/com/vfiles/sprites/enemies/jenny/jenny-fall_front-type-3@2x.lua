--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:fa35ce77a5b5a71e49554644030a83a4$
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
            x=0,
            y=0,
            width=104,
            height=380,

            sourceX = 164,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0002
            x=0,
            y=384,
            width=116,
            height=352,

            sourceX = 164,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0003
            x=108,
            y=0,
            width=144,
            height=324,

            sourceX = 152,
            sourceY = 76,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0004
            x=120,
            y=328,
            width=160,
            height=292,

            sourceX = 140,
            sourceY = 92,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0005
            x=0,
            y=740,
            width=192,
            height=260,

            sourceX = 120,
            sourceY = 112,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0006
            x=420,
            y=0,
            width=228,
            height=220,

            sourceX = 76,
            sourceY = 156,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0007
            x=652,
            y=188,
            width=240,
            height=184,

            sourceX = 52,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0008
            x=652,
            y=0,
            width=240,
            height=184,

            sourceX = 52,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0009
            x=584,
            y=580,
            width=228,
            height=200,

            sourceX = 68,
            sourceY = 200,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0010
            x=584,
            y=376,
            width=228,
            height=200,

            sourceX = 68,
            sourceY = 200,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0011
            x=376,
            y=728,
            width=204,
            height=220,

            sourceX = 88,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0012
            x=376,
            y=504,
            width=204,
            height=220,

            sourceX = 88,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0013
            x=284,
            y=260,
            width=176,
            height=240,

            sourceX = 116,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0014
            x=196,
            y=624,
            width=176,
            height=240,

            sourceX = 116,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-fall-forward0015
            x=256,
            y=0,
            width=160,
            height=256,

            sourceX = 132,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
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
