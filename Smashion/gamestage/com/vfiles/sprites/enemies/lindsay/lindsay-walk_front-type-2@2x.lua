--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4465ad64120c3079390fa29507a18359$
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
            -- lindsay-walk-forward0001
            x=0,
            y=1288,
            width=324,
            height=420,

            sourceX = 40,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0002
            x=0,
            y=0,
            width=320,
            height=432,

            sourceX = 40,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0003
            x=0,
            y=432,
            width=316,
            height=432,

            sourceX = 44,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0004
            x=0,
            y=864,
            width=308,
            height=424,

            sourceX = 48,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0005
            x=628,
            y=852,
            width=312,
            height=420,

            sourceX = 44,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0006
            x=636,
            y=1272,
            width=316,
            height=416,

            sourceX = 44,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0007
            x=636,
            y=0,
            width=324,
            height=416,

            sourceX = 40,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0008
            x=308,
            y=864,
            width=320,
            height=420,

            sourceX = 40,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0009
            x=320,
            y=0,
            width=316,
            height=420,

            sourceX = 44,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0010
            x=632,
            y=420,
            width=308,
            height=420,

            sourceX = 48,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0011
            x=324,
            y=1284,
            width=312,
            height=420,

            sourceX = 44,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0012
            x=316,
            y=432,
            width=316,
            height=420,

            sourceX = 44,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0013
            x=960,
            y=0,
            width=324,
            height=404,

            sourceX = 40,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0014
            x=940,
            y=828,
            width=320,
            height=400,

            sourceX = 40,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- lindsay-walk-forward0015
            x=940,
            y=416,
            width=316,
            height=412,

            sourceX = 44,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 2048,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["lindsay-walk-forward0001"] = 1,
    ["lindsay-walk-forward0002"] = 2,
    ["lindsay-walk-forward0003"] = 3,
    ["lindsay-walk-forward0004"] = 4,
    ["lindsay-walk-forward0005"] = 5,
    ["lindsay-walk-forward0006"] = 6,
    ["lindsay-walk-forward0007"] = 7,
    ["lindsay-walk-forward0008"] = 8,
    ["lindsay-walk-forward0009"] = 9,
    ["lindsay-walk-forward0010"] = 10,
    ["lindsay-walk-forward0011"] = 11,
    ["lindsay-walk-forward0012"] = 12,
    ["lindsay-walk-forward0013"] = 13,
    ["lindsay-walk-forward0014"] = 14,
    ["lindsay-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
