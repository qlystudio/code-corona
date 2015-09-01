--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:5c3c5dd18aac24b29af36eedf51c1881$
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
            x=140,
            y=0,
            width=36,
            height=180,

            sourceX = 18,
            sourceY = 10,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0002
            x=64,
            y=0,
            width=40,
            height=182,

            sourceX = 16,
            sourceY = 10,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0003
            x=474,
            y=0,
            width=34,
            height=174,

            sourceX = 16,
            sourceY = 10,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0004
            x=440,
            y=0,
            width=34,
            height=174,

            sourceX = 16,
            sourceY = 10,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0005
            x=210,
            y=0,
            width=32,
            height=180,

            sourceX = 12,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0006
            x=272,
            y=0,
            width=30,
            height=180,

            sourceX = 14,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0007
            x=242,
            y=0,
            width=30,
            height=180,

            sourceX = 14,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0008
            x=32,
            y=0,
            width=32,
            height=188,

            sourceX = 12,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0009
            x=0,
            y=0,
            width=32,
            height=188,

            sourceX = 12,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0010
            x=374,
            y=0,
            width=32,
            height=178,

            sourceX = 12,
            sourceY = 10,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0011
            x=338,
            y=0,
            width=36,
            height=178,

            sourceX = 8,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0012
            x=406,
            y=0,
            width=34,
            height=176,

            sourceX = 10,
            sourceY = 10,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0013
            x=176,
            y=0,
            width=34,
            height=180,

            sourceX = 14,
            sourceY = 8,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0014
            x=302,
            y=0,
            width=36,
            height=178,

            sourceX = 14,
            sourceY = 10,
            sourceWidth = 64,
            sourceHeight = 256
        },
        {
            -- devon-walk-away0015
            x=104,
            y=0,
            width=36,
            height=180,

            sourceX = 16,
            sourceY = 10,
            sourceWidth = 64,
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
