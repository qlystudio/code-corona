--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c44af647b8ed165bcfafde77860b4359$
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
            -- kate-walk-forward0001
            x=352,
            y=396,
            width=92,
            height=404,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0002
            x=92,
            y=408,
            width=92,
            height=408,

            sourceX = 152,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0003
            x=0,
            y=408,
            width=92,
            height=408,

            sourceX = 152,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0004
            x=0,
            y=0,
            width=96,
            height=408,

            sourceX = 152,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0005
            x=260,
            y=404,
            width=92,
            height=404,

            sourceX = 152,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0006
            x=620,
            y=392,
            width=84,
            height=400,

            sourceX = 152,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0007
            x=184,
            y=408,
            width=76,
            height=408,

            sourceX = 156,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0008
            x=184,
            y=0,
            width=76,
            height=408,

            sourceX = 156,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0009
            x=444,
            y=396,
            width=84,
            height=404,

            sourceX = 148,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0010
            x=96,
            y=0,
            width=88,
            height=408,

            sourceX = 148,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0011
            x=260,
            y=0,
            width=92,
            height=404,

            sourceX = 148,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0012
            x=528,
            y=396,
            width=92,
            height=400,

            sourceX = 148,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0013
            x=536,
            y=0,
            width=96,
            height=392,

            sourceX = 148,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0014
            x=448,
            y=0,
            width=88,
            height=396,

            sourceX = 152,
            sourceY = 0,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0015
            x=352,
            y=0,
            width=96,
            height=396,

            sourceX = 148,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["kate-walk-forward0001"] = 1,
    ["kate-walk-forward0002"] = 2,
    ["kate-walk-forward0003"] = 3,
    ["kate-walk-forward0004"] = 4,
    ["kate-walk-forward0005"] = 5,
    ["kate-walk-forward0006"] = 6,
    ["kate-walk-forward0007"] = 7,
    ["kate-walk-forward0008"] = 8,
    ["kate-walk-forward0009"] = 9,
    ["kate-walk-forward0010"] = 10,
    ["kate-walk-forward0011"] = 11,
    ["kate-walk-forward0012"] = 12,
    ["kate-walk-forward0013"] = 13,
    ["kate-walk-forward0014"] = 14,
    ["kate-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
