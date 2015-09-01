--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:7811253bdd6aecc16346278c52e103b9$
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
            -- jenny-walk-forward0001
            x=0,
            y=1188,
            width=180,
            height=408,

            sourceX = 116,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0002
            x=632,
            y=388,
            width=188,
            height=408,

            sourceX = 112,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0003
            x=820,
            y=400,
            width=188,
            height=400,

            sourceX = 112,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0004
            x=416,
            y=404,
            width=188,
            height=396,

            sourceX = 112,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0005
            x=0,
            y=796,
            width=200,
            height=392,

            sourceX = 104,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0006
            x=0,
            y=404,
            width=200,
            height=392,

            sourceX = 104,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0007
            x=632,
            y=0,
            width=200,
            height=388,

            sourceX = 104,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0008
            x=424,
            y=0,
            width=208,
            height=404,

            sourceX = 100,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0009
            x=0,
            y=0,
            width=212,
            height=404,

            sourceX = 96,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0010
            x=212,
            y=0,
            width=212,
            height=400,

            sourceX = 96,
            sourceY = 8,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0011
            x=212,
            y=400,
            width=204,
            height=400,

            sourceX = 100,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0012
            x=832,
            y=0,
            width=192,
            height=400,

            sourceX = 108,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0013
            x=604,
            y=796,
            width=188,
            height=388,

            sourceX = 108,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0014
            x=200,
            y=800,
            width=184,
            height=396,

            sourceX = 112,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- jenny-walk-forward0015
            x=792,
            y=800,
            width=184,
            height=408,

            sourceX = 112,
            sourceY = 4,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["jenny-walk-forward0001"] = 1,
    ["jenny-walk-forward0002"] = 2,
    ["jenny-walk-forward0003"] = 3,
    ["jenny-walk-forward0004"] = 4,
    ["jenny-walk-forward0005"] = 5,
    ["jenny-walk-forward0006"] = 6,
    ["jenny-walk-forward0007"] = 7,
    ["jenny-walk-forward0008"] = 8,
    ["jenny-walk-forward0009"] = 9,
    ["jenny-walk-forward0010"] = 10,
    ["jenny-walk-forward0011"] = 11,
    ["jenny-walk-forward0012"] = 12,
    ["jenny-walk-forward0013"] = 13,
    ["jenny-walk-forward0014"] = 14,
    ["jenny-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
