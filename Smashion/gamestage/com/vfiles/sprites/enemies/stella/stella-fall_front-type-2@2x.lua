--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:1e129f7aa0f0c18600b55ba97be0367e$
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
            -- stella-fall-forward0001
            x=96,
            y=408,
            width=92,
            height=408,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0002
            x=96,
            y=0,
            width=92,
            height=408,

            sourceX = 148,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0003
            x=0,
            y=408,
            width=96,
            height=408,

            sourceX = 144,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0004
            x=0,
            y=0,
            width=96,
            height=408,

            sourceX = 144,
            sourceY = 12,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0005
            x=188,
            y=352,
            width=116,
            height=396,

            sourceX = 132,
            sourceY = 24,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0006
            x=304,
            y=352,
            width=188,
            height=372,

            sourceX = 104,
            sourceY = 48,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0007
            x=188,
            y=0,
            width=260,
            height=352,

            sourceX = 68,
            sourceY = 68,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0008
            x=448,
            y=0,
            width=248,
            height=316,

            sourceX = 72,
            sourceY = 112,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0009
            x=492,
            y=316,
            width=176,
            height=308,

            sourceX = 88,
            sourceY = 136,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0010
            x=352,
            y=724,
            width=144,
            height=288,

            sourceX = 120,
            sourceY = 160,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0011
            x=824,
            y=248,
            width=172,
            height=248,

            sourceX = 112,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0012
            x=824,
            y=0,
            width=172,
            height=248,

            sourceX = 112,
            sourceY = 196,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0013
            x=660,
            y=624,
            width=164,
            height=260,

            sourceX = 120,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0014
            x=496,
            y=624,
            width=164,
            height=260,

            sourceX = 120,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
        {
            -- stella-fall-forward0015
            x=188,
            y=748,
            width=164,
            height=268,

            sourceX = 112,
            sourceY = 192,
            sourceWidth = 389,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["stella-fall-forward0001"] = 1,
    ["stella-fall-forward0002"] = 2,
    ["stella-fall-forward0003"] = 3,
    ["stella-fall-forward0004"] = 4,
    ["stella-fall-forward0005"] = 5,
    ["stella-fall-forward0006"] = 6,
    ["stella-fall-forward0007"] = 7,
    ["stella-fall-forward0008"] = 8,
    ["stella-fall-forward0009"] = 9,
    ["stella-fall-forward0010"] = 10,
    ["stella-fall-forward0011"] = 11,
    ["stella-fall-forward0012"] = 12,
    ["stella-fall-forward0013"] = 13,
    ["stella-fall-forward0014"] = 14,
    ["stella-fall-forward0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
