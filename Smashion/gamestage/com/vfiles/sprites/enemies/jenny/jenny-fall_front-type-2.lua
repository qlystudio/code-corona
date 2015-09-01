--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ede27630f20e0d0ea0fdab03ebb80d63$
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
            -- jenny-fall-forward0001
            x=108,
            y=570,
            width=102,
            height=190,

            sourceX = 60,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0002
            x=0,
            y=664,
            width=98,
            height=180,

            sourceX = 60,
            sourceY = 26,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0003
            x=0,
            y=846,
            width=98,
            height=164,

            sourceX = 58,
            sourceY = 36,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0004
            x=100,
            y=762,
            width=98,
            height=146,

            sourceX = 56,
            sourceY = 46,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0005
            x=112,
            y=316,
            width=108,
            height=130,

            sourceX = 50,
            sourceY = 56,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0006
            x=0,
            y=188,
            width=116,
            height=110,

            sourceX = 38,
            sourceY = 78,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0007
            x=0,
            y=94,
            width=128,
            height=92,

            sourceX = 26,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0008
            x=0,
            y=0,
            width=128,
            height=92,

            sourceX = 26,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0009
            x=130,
            y=102,
            width=120,
            height=100,

            sourceX = 34,
            sourceY = 100,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0010
            x=130,
            y=0,
            width=120,
            height=100,

            sourceX = 34,
            sourceY = 100,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0011
            x=0,
            y=300,
            width=110,
            height=110,

            sourceX = 44,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0012
            x=118,
            y=204,
            width=110,
            height=110,

            sourceX = 44,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0013
            x=0,
            y=542,
            width=106,
            height=120,

            sourceX = 48,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0014
            x=110,
            y=448,
            width=106,
            height=120,

            sourceX = 48,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- jenny-fall-forward0015
            x=0,
            y=412,
            width=108,
            height=128,

            sourceX = 46,
            sourceY = 98,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["jenny-fall-forward0001"] = 1,
    ["jenny-fall-forward0002"] = 2,
    ["jenny-fall-forward0003"] = 3,
    ["jenny-fall-forward0004"] = 4,
    ["jenny-fall-forward0005"] = 5,
    ["jenny-fall-forward0006"] = 6,
    ["jenny-fall-forward0007"] = 7,
    ["jenny-fall-forward0008"] = 8,
    ["jenny-fall-forward0009"] = 9,
    ["jenny-fall-forward0010"] = 10,
    ["jenny-fall-forward0011"] = 11,
    ["jenny-fall-forward0012"] = 12,
    ["jenny-fall-forward0013"] = 13,
    ["jenny-fall-forward0014"] = 14,
    ["jenny-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
