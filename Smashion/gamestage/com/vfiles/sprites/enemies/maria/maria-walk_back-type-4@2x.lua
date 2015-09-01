--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a2e2ee0f88daa9b81b7baa5711f7e1fc$
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
            -- maria-walk-away0001
            x=84,
            y=0,
            width=80,
            height=400,

            sourceX = 156,
            sourceY = 28,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0002
            x=424,
            y=388,
            width=80,
            height=384,

            sourceX = 156,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0003
            x=508,
            y=380,
            width=76,
            height=376,

            sourceX = 156,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0004
            x=588,
            y=372,
            width=104,
            height=364,

            sourceX = 156,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0005
            x=512,
            y=0,
            width=84,
            height=368,

            sourceX = 156,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0006
            x=428,
            y=0,
            width=80,
            height=376,

            sourceX = 156,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0007
            x=0,
            y=404,
            width=80,
            height=400,

            sourceX = 156,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0008
            x=0,
            y=0,
            width=80,
            height=400,

            sourceX = 156,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0009
            x=344,
            y=0,
            width=80,
            height=384,

            sourceX = 156,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0010
            x=256,
            y=0,
            width=84,
            height=388,

            sourceX = 152,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0011
            x=168,
            y=396,
            width=84,
            height=388,

            sourceX = 152,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0012
            x=340,
            y=392,
            width=80,
            height=384,

            sourceX = 152,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0013
            x=256,
            y=392,
            width=80,
            height=388,

            sourceX = 156,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0014
            x=168,
            y=0,
            width=84,
            height=392,

            sourceX = 152,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- maria-walk-away0015
            x=84,
            y=404,
            width=80,
            height=396,

            sourceX = 156,
            sourceY = 32,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["maria-walk-away0001"] = 1,
    ["maria-walk-away0002"] = 2,
    ["maria-walk-away0003"] = 3,
    ["maria-walk-away0004"] = 4,
    ["maria-walk-away0005"] = 5,
    ["maria-walk-away0006"] = 6,
    ["maria-walk-away0007"] = 7,
    ["maria-walk-away0008"] = 8,
    ["maria-walk-away0009"] = 9,
    ["maria-walk-away0010"] = 10,
    ["maria-walk-away0011"] = 11,
    ["maria-walk-away0012"] = 12,
    ["maria-walk-away0013"] = 13,
    ["maria-walk-away0014"] = 14,
    ["maria-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
