--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d9c42a43e654668dc0b53d279acb85dc$
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
            -- devon-fall-forward0001
            x=0,
            y=0,
            width=100,
            height=376,

            sourceX = 164,
            sourceY = 36,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0002
            x=0,
            y=380,
            width=116,
            height=356,

            sourceX = 164,
            sourceY = 48,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0003
            x=104,
            y=0,
            width=140,
            height=328,

            sourceX = 152,
            sourceY = 68,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0004
            x=120,
            y=332,
            width=156,
            height=292,

            sourceX = 140,
            sourceY = 88,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0005
            x=0,
            y=740,
            width=188,
            height=264,

            sourceX = 120,
            sourceY = 104,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0006
            x=412,
            y=0,
            width=220,
            height=228,

            sourceX = 80,
            sourceY = 144,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0007
            x=636,
            y=192,
            width=236,
            height=188,

            sourceX = 56,
            sourceY = 188,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0008
            x=636,
            y=0,
            width=236,
            height=188,

            sourceX = 56,
            sourceY = 188,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0009
            x=804,
            y=384,
            width=220,
            height=204,

            sourceX = 72,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0010
            x=580,
            y=384,
            width=220,
            height=204,

            sourceX = 72,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0011
            x=372,
            y=720,
            width=204,
            height=216,

            sourceX = 88,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0012
            x=372,
            y=500,
            width=204,
            height=216,

            sourceX = 88,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0013
            x=280,
            y=260,
            width=176,
            height=236,

            sourceX = 116,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0014
            x=192,
            y=628,
            width=176,
            height=236,

            sourceX = 116,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-fall-forward0015
            x=248,
            y=0,
            width=160,
            height=256,

            sourceX = 132,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["devon-fall-forward0001"] = 1,
    ["devon-fall-forward0002"] = 2,
    ["devon-fall-forward0003"] = 3,
    ["devon-fall-forward0004"] = 4,
    ["devon-fall-forward0005"] = 5,
    ["devon-fall-forward0006"] = 6,
    ["devon-fall-forward0007"] = 7,
    ["devon-fall-forward0008"] = 8,
    ["devon-fall-forward0009"] = 9,
    ["devon-fall-forward0010"] = 10,
    ["devon-fall-forward0011"] = 11,
    ["devon-fall-forward0012"] = 12,
    ["devon-fall-forward0013"] = 13,
    ["devon-fall-forward0014"] = 14,
    ["devon-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
