--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:6714574a6f3d467d9d595617126a72bf$
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
            x=104,
            y=392,
            width=104,
            height=372,

            sourceX = 164,
            sourceY = 40,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0003
            x=0,
            y=392,
            width=104,
            height=372,

            sourceX = 164,
            sourceY = 40,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0004
            x=208,
            y=348,
            width=116,
            height=348,

            sourceX = 164,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0005
            x=120,
            y=0,
            width=116,
            height=348,

            sourceX = 164,
            sourceY = 56,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0006
            x=324,
            y=320,
            width=144,
            height=320,

            sourceX = 152,
            sourceY = 76,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0007
            x=236,
            y=0,
            width=144,
            height=320,

            sourceX = 152,
            sourceY = 76,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0008
            x=380,
            y=0,
            width=160,
            height=284,

            sourceX = 140,
            sourceY = 96,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0009
            x=0,
            y=764,
            width=196,
            height=256,

            sourceX = 116,
            sourceY = 112,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0010
            x=196,
            y=764,
            width=228,
            height=216,

            sourceX = 76,
            sourceY = 152,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0011
            x=664,
            y=180,
            width=240,
            height=180,

            sourceX = 52,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0012
            x=664,
            y=0,
            width=240,
            height=180,

            sourceX = 52,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0013
            x=424,
            y=840,
            width=240,
            height=180,

            sourceX = 52,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0014
            x=468,
            y=360,
            width=224,
            height=200,

            sourceX = 68,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- alek-fall-forward0015
            x=424,
            y=640,
            width=224,
            height=200,

            sourceX = 68,
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
