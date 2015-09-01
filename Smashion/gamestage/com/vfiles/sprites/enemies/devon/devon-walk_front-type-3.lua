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
            width=54,
            height=204,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0002
            x=0,
            y=608,
            width=38,
            height=202,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0003
            x=0,
            y=406,
            width=40,
            height=202,

            sourceX = 78,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0004
            x=38,
            y=608,
            width=40,
            height=200,

            sourceX = 78,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0005
            x=40,
            y=406,
            width=38,
            height=198,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0006
            x=42,
            y=204,
            width=38,
            height=196,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0007
            x=0,
            y=810,
            width=42,
            height=194,

            sourceX = 72,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0008
            x=0,
            y=204,
            width=42,
            height=202,

            sourceX = 70,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0009
            x=42,
            y=808,
            width=40,
            height=198,

            sourceX = 72,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0010
            x=80,
            y=198,
            width=36,
            height=198,

            sourceX = 76,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0011
            x=54,
            y=0,
            width=36,
            height=198,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0012
            x=82,
            y=794,
            width=36,
            height=194,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0013
            x=78,
            y=600,
            width=36,
            height=194,

            sourceX = 78,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0014
            x=90,
            y=0,
            width=36,
            height=194,

            sourceX = 78,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-forward0015
            x=78,
            y=400,
            width=34,
            height=200,

            sourceX = 80,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 1024
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
