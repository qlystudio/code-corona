--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:82a4dd8625b11db539aabc38cd11bcdb$
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
            x=32,
            y=0,
            width=38,
            height=182,

            sourceX = 82,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0002
            x=0,
            y=188,
            width=40,
            height=184,

            sourceX = 82,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0003
            x=176,
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
            x=140,
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
            x=106,
            y=180,
            width=30,
            height=180,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0006
            x=164,
            y=174,
            width=28,
            height=180,

            sourceX = 80,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0007
            x=136,
            y=180,
            width=28,
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
            x=76,
            y=178,
            width=30,
            height=188,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0010
            x=224,
            y=0,
            width=30,
            height=178,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0011
            x=192,
            y=174,
            width=32,
            height=178,

            sourceX = 74,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0012
            x=224,
            y=178,
            width=32,
            height=176,

            sourceX = 76,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0013
            x=70,
            y=0,
            width=36,
            height=178,

            sourceX = 78,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0014
            x=106,
            y=0,
            width=34,
            height=180,

            sourceX = 80,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0015
            x=40,
            y=182,
            width=36,
            height=180,

            sourceX = 80,
            sourceY = 10,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 512
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
