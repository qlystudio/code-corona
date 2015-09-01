--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ea0d6d8b047e91af23647b634d1d8f75$
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
            -- naomi-fall-forward0001
            x=0,
            y=0,
            width=96,
            height=408,

            sourceX = 168,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0002
            x=0,
            y=408,
            width=112,
            height=388,

            sourceX = 164,
            sourceY = 48,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0003
            x=96,
            y=0,
            width=136,
            height=352,

            sourceX = 156,
            sourceY = 72,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0004
            x=112,
            y=352,
            width=152,
            height=324,

            sourceX = 144,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0005
            x=228,
            y=676,
            width=184,
            height=296,

            sourceX = 124,
            sourceY = 104,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0006
            x=412,
            y=568,
            width=212,
            height=260,

            sourceX = 84,
            sourceY = 140,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0007
            x=748,
            y=0,
            width=228,
            height=224,

            sourceX = 60,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0008
            x=0,
            y=796,
            width=228,
            height=224,

            sourceX = 60,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0009
            x=624,
            y=468,
            width=212,
            height=244,

            sourceX = 76,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0010
            x=748,
            y=224,
            width=212,
            height=244,

            sourceX = 76,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0011
            x=556,
            y=0,
            width=192,
            height=256,

            sourceX = 96,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0012
            x=432,
            y=276,
            width=192,
            height=256,

            sourceX = 96,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0013
            x=388,
            y=0,
            width=168,
            height=276,

            sourceX = 120,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0014
            x=264,
            y=292,
            width=168,
            height=276,

            sourceX = 120,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- naomi-fall-forward0015
            x=232,
            y=0,
            width=156,
            height=292,

            sourceX = 132,
            sourceY = 184,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["naomi-fall-forward0001"] = 1,
    ["naomi-fall-forward0002"] = 2,
    ["naomi-fall-forward0003"] = 3,
    ["naomi-fall-forward0004"] = 4,
    ["naomi-fall-forward0005"] = 5,
    ["naomi-fall-forward0006"] = 6,
    ["naomi-fall-forward0007"] = 7,
    ["naomi-fall-forward0008"] = 8,
    ["naomi-fall-forward0009"] = 9,
    ["naomi-fall-forward0010"] = 10,
    ["naomi-fall-forward0011"] = 11,
    ["naomi-fall-forward0012"] = 12,
    ["naomi-fall-forward0013"] = 13,
    ["naomi-fall-forward0014"] = 14,
    ["naomi-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
