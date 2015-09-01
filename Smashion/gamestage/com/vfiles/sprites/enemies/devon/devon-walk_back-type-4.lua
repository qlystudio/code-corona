--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e047f74b06c39b9e9c40809dd56d7c6e$
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
            -- devon-walk-away0001
            x=174,
            y=0,
            width=36,
            height=180,

            sourceX = 82,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0002
            x=62,
            y=0,
            width=40,
            height=182,

            sourceX = 82,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0003
            x=438,
            y=0,
            width=36,
            height=174,

            sourceX = 80,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0004
            x=402,
            y=0,
            width=36,
            height=174,

            sourceX = 80,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0005
            x=210,
            y=0,
            width=32,
            height=180,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0006
            x=272,
            y=0,
            width=30,
            height=180,

            sourceX = 80,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0007
            x=242,
            y=0,
            width=30,
            height=180,

            sourceX = 80,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0008
            x=0,
            y=0,
            width=32,
            height=188,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0009
            x=32,
            y=0,
            width=30,
            height=188,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0010
            x=370,
            y=0,
            width=32,
            height=178,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0011
            x=336,
            y=0,
            width=34,
            height=178,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0012
            x=474,
            y=0,
            width=34,
            height=176,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0013
            x=138,
            y=0,
            width=36,
            height=180,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0014
            x=302,
            y=0,
            width=34,
            height=178,

            sourceX = 80,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0015
            x=102,
            y=0,
            width=36,
            height=180,

            sourceX = 80,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 256
}

SheetInfo.frameIndex =
{

    ["devon-walk-away0001"] = 1,
    ["devon-walk-away0002"] = 2,
    ["devon-walk-away0003"] = 3,
    ["devon-walk-away0004"] = 4,
    ["devon-walk-away0005"] = 5,
    ["devon-walk-away0006"] = 6,
    ["devon-walk-away0007"] = 7,
    ["devon-walk-away0008"] = 8,
    ["devon-walk-away0009"] = 9,
    ["devon-walk-away0010"] = 10,
    ["devon-walk-away0011"] = 11,
    ["devon-walk-away0012"] = 12,
    ["devon-walk-away0013"] = 13,
    ["devon-walk-away0014"] = 14,
    ["devon-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
