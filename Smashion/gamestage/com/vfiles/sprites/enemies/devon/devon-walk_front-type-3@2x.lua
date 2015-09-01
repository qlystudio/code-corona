--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:bc52fddb9d3b4154c1a18597b81bbe19$
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
            -- devon-walk-forward0001
            x=0,
            y=0,
            width=108,
            height=408,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0002
            x=0,
            y=1216,
            width=76,
            height=404,

            sourceX = 160,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0003
            x=0,
            y=812,
            width=80,
            height=404,

            sourceX = 156,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0004
            x=76,
            y=1216,
            width=80,
            height=400,

            sourceX = 156,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0005
            x=80,
            y=812,
            width=76,
            height=396,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0006
            x=84,
            y=408,
            width=76,
            height=392,

            sourceX = 152,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0007
            x=0,
            y=1620,
            width=84,
            height=388,

            sourceX = 144,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0008
            x=0,
            y=408,
            width=84,
            height=404,

            sourceX = 140,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0009
            x=84,
            y=1616,
            width=80,
            height=396,

            sourceX = 144,
            sourceY = 20,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0010
            x=160,
            y=396,
            width=72,
            height=396,

            sourceX = 152,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0011
            x=108,
            y=0,
            width=72,
            height=396,

            sourceX = 156,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0012
            x=164,
            y=1588,
            width=72,
            height=388,

            sourceX = 156,
            sourceY = 16,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0013
            x=156,
            y=1200,
            width=72,
            height=388,

            sourceX = 156,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0014
            x=180,
            y=0,
            width=72,
            height=388,

            sourceX = 156,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- devon-walk-forward0015
            x=156,
            y=800,
            width=68,
            height=400,

            sourceX = 160,
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

    ["devon-walk-forward0001"] = 1,
    ["devon-walk-forward0002"] = 2,
    ["devon-walk-forward0003"] = 3,
    ["devon-walk-forward0004"] = 4,
    ["devon-walk-forward0005"] = 5,
    ["devon-walk-forward0006"] = 6,
    ["devon-walk-forward0007"] = 7,
    ["devon-walk-forward0008"] = 8,
    ["devon-walk-forward0009"] = 9,
    ["devon-walk-forward0010"] = 10,
    ["devon-walk-forward0011"] = 11,
    ["devon-walk-forward0012"] = 12,
    ["devon-walk-forward0013"] = 13,
    ["devon-walk-forward0014"] = 14,
    ["devon-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
