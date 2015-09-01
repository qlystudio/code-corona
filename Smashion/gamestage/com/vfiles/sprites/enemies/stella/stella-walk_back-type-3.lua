--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:82694069d71aab135d5035896fade3de$
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
            -- stella-walk-away0001
            x=44,
            y=0,
            width=44,
            height=208,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0002
            x=214,
            y=202,
            width=42,
            height=202,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0003
            x=216,
            y=0,
            width=42,
            height=198,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0004
            x=258,
            y=0,
            width=54,
            height=192,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0005
            x=296,
            y=192,
            width=44,
            height=192,

            sourceX = 76,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0006
            x=256,
            y=198,
            width=40,
            height=198,

            sourceX = 76,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0007
            x=0,
            y=210,
            width=44,
            height=210,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0008
            x=0,
            y=0,
            width=44,
            height=210,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0009
            x=130,
            y=0,
            width=44,
            height=202,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0010
            x=174,
            y=0,
            width=42,
            height=202,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0011
            x=172,
            y=202,
            width=42,
            height=202,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0012
            x=88,
            y=206,
            width=42,
            height=204,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0013
            x=130,
            y=202,
            width=42,
            height=202,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0014
            x=88,
            y=0,
            width=42,
            height=206,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-walk-away0015
            x=44,
            y=208,
            width=44,
            height=206,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["stella-walk-away0001"] = 1,
    ["stella-walk-away0002"] = 2,
    ["stella-walk-away0003"] = 3,
    ["stella-walk-away0004"] = 4,
    ["stella-walk-away0005"] = 5,
    ["stella-walk-away0006"] = 6,
    ["stella-walk-away0007"] = 7,
    ["stella-walk-away0008"] = 8,
    ["stella-walk-away0009"] = 9,
    ["stella-walk-away0010"] = 10,
    ["stella-walk-away0011"] = 11,
    ["stella-walk-away0012"] = 12,
    ["stella-walk-away0013"] = 13,
    ["stella-walk-away0014"] = 14,
    ["stella-walk-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
