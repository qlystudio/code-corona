--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e5602c9937220f5a713ffa1268d4a13c$
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
            x=260,
            y=408,
            width=92,
            height=404,

            sourceX = 20,
            sourceY = 8,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0002
            x=96,
            y=0,
            width=92,
            height=408,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0003
            x=92,
            y=408,
            width=92,
            height=408,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0004
            x=0,
            y=0,
            width=96,
            height=408,

            sourceX = 20,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0005
            x=352,
            y=400,
            width=88,
            height=404,

            sourceX = 24,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0006
            x=448,
            y=0,
            width=88,
            height=400,

            sourceX = 20,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0007
            x=188,
            y=0,
            width=76,
            height=408,

            sourceX = 24,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0008
            x=184,
            y=408,
            width=76,
            height=408,

            sourceX = 24,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0009
            x=440,
            y=400,
            width=84,
            height=404,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0010
            x=0,
            y=408,
            width=92,
            height=408,

            sourceX = 16,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0011
            x=264,
            y=0,
            width=88,
            height=404,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0012
            x=352,
            y=0,
            width=96,
            height=400,

            sourceX = 16,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0013
            x=616,
            y=396,
            width=92,
            height=392,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0014
            x=536,
            y=0,
            width=92,
            height=396,

            sourceX = 20,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 512
        },
        {
            -- kate-walk-forward0015
            x=524,
            y=400,
            width=92,
            height=396,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 128,
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
