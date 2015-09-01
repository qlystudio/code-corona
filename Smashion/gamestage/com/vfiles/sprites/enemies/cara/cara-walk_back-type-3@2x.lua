--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9a8101eb0d387898037eec71066951a4$
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
            -- cara-walk-away0001
            x=0,
            y=792,
            width=80,
            height=392,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0002
            x=160,
            y=0,
            width=80,
            height=380,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0003
            x=164,
            y=1156,
            width=80,
            height=372,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0004
            x=0,
            y=1572,
            width=100,
            height=360,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0005
            x=80,
            y=1160,
            width=84,
            height=368,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0006
            x=160,
            y=380,
            width=76,
            height=372,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0007
            x=0,
            y=396,
            width=80,
            height=396,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0008
            x=0,
            y=0,
            width=80,
            height=396,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0009
            x=100,
            y=1528,
            width=80,
            height=380,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0010
            x=80,
            y=388,
            width=80,
            height=388,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0011
            x=80,
            y=776,
            width=76,
            height=384,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0012
            x=180,
            y=1528,
            width=76,
            height=380,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0013
            x=156,
            y=776,
            width=80,
            height=380,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0014
            x=80,
            y=0,
            width=80,
            height=388,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- cara-walk-away0015
            x=0,
            y=1184,
            width=80,
            height=388,

            sourceX = 152,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["cara-walk-away0001"] = 1,
    ["cara-walk-away0002"] = 2,
    ["cara-walk-away0003"] = 3,
    ["cara-walk-away0004"] = 4,
    ["cara-walk-away0005"] = 5,
    ["cara-walk-away0006"] = 6,
    ["cara-walk-away0007"] = 7,
    ["cara-walk-away0008"] = 8,
    ["cara-walk-away0009"] = 9,
    ["cara-walk-away0010"] = 10,
    ["cara-walk-away0011"] = 11,
    ["cara-walk-away0012"] = 12,
    ["cara-walk-away0013"] = 13,
    ["cara-walk-away0014"] = 14,
    ["cara-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
