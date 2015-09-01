--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:519617a90966690769258fe64daa1023$
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
            -- stella-walk-forward0001
            x=410,
            y=0,
            width=100,
            height=204,

            sourceX = 44,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0002
            x=0,
            y=0,
            width=102,
            height=204,

            sourceX = 44,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0003
            x=308,
            y=0,
            width=100,
            height=204,

            sourceX = 46,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0004
            x=206,
            y=0,
            width=100,
            height=204,

            sourceX = 50,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0005
            x=204,
            y=410,
            width=100,
            height=202,

            sourceX = 50,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0006
            x=102,
            y=412,
            width=100,
            height=200,

            sourceX = 50,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0007
            x=0,
            y=206,
            width=100,
            height=206,

            sourceX = 50,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0008
            x=104,
            y=0,
            width=100,
            height=206,

            sourceX = 50,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0009
            x=410,
            y=206,
            width=100,
            height=202,

            sourceX = 48,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0010
            x=308,
            y=206,
            width=100,
            height=202,

            sourceX = 46,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0011
            x=102,
            y=208,
            width=100,
            height=202,

            sourceX = 46,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0012
            x=206,
            y=206,
            width=100,
            height=202,

            sourceX = 48,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0013
            x=306,
            y=410,
            width=100,
            height=198,

            sourceX = 48,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0014
            x=408,
            y=410,
            width=100,
            height=196,

            sourceX = 48,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-forward0015
            x=0,
            y=414,
            width=100,
            height=198,

            sourceX = 44,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["stella-walk-forward0001"] = 1,
    ["stella-walk-forward0002"] = 2,
    ["stella-walk-forward0003"] = 3,
    ["stella-walk-forward0004"] = 4,
    ["stella-walk-forward0005"] = 5,
    ["stella-walk-forward0006"] = 6,
    ["stella-walk-forward0007"] = 7,
    ["stella-walk-forward0008"] = 8,
    ["stella-walk-forward0009"] = 9,
    ["stella-walk-forward0010"] = 10,
    ["stella-walk-forward0011"] = 11,
    ["stella-walk-forward0012"] = 12,
    ["stella-walk-forward0013"] = 13,
    ["stella-walk-forward0014"] = 14,
    ["stella-walk-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
