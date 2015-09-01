--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9cee76e0a58c822c2a489c59caa83447$
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
            -- alek-fall-forward0001
            x=0,
            y=0,
            width=120,
            height=392,

            sourceX = 148,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0002
            x=108,
            y=392,
            width=108,
            height=372,

            sourceX = 160,
            sourceY = 40,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0003
            x=0,
            y=392,
            width=108,
            height=372,

            sourceX = 160,
            sourceY = 40,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0004
            x=216,
            y=348,
            width=120,
            height=348,

            sourceX = 160,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0005
            x=120,
            y=0,
            width=120,
            height=348,

            sourceX = 160,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0006
            x=240,
            y=0,
            width=148,
            height=320,

            sourceX = 148,
            sourceY = 76,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0007
            x=228,
            y=696,
            width=148,
            height=320,

            sourceX = 148,
            sourceY = 76,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0008
            x=336,
            y=320,
            width=164,
            height=288,

            sourceX = 136,
            sourceY = 96,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0009
            x=388,
            y=0,
            width=196,
            height=268,

            sourceX = 116,
            sourceY = 112,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0010
            x=0,
            y=764,
            width=228,
            height=228,

            sourceX = 76,
            sourceY = 152,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0011
            x=376,
            y=820,
            width=240,
            height=192,

            sourceX = 52,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0012
            x=584,
            y=192,
            width=240,
            height=192,

            sourceX = 52,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0013
            x=584,
            y=0,
            width=240,
            height=192,

            sourceX = 52,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0014
            x=500,
            y=384,
            width=228,
            height=212,

            sourceX = 64,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0015
            x=376,
            y=608,
            width=228,
            height=212,

            sourceX = 64,
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

    ["alek-fall-forward0001"] = 1,
    ["alek-fall-forward0002"] = 2,
    ["alek-fall-forward0003"] = 3,
    ["alek-fall-forward0004"] = 4,
    ["alek-fall-forward0005"] = 5,
    ["alek-fall-forward0006"] = 6,
    ["alek-fall-forward0007"] = 7,
    ["alek-fall-forward0008"] = 8,
    ["alek-fall-forward0009"] = 9,
    ["alek-fall-forward0010"] = 10,
    ["alek-fall-forward0011"] = 11,
    ["alek-fall-forward0012"] = 12,
    ["alek-fall-forward0013"] = 13,
    ["alek-fall-forward0014"] = 14,
    ["alek-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
