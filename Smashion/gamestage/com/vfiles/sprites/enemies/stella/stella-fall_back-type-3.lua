--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f10425bd8f4771f98658b0e75f9523ec$
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
            -- stella-fall-away0001
            x=214,
            y=300,
            width=46,
            height=206,

            sourceX = 74,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0002
            x=156,
            y=486,
            width=56,
            height=206,

            sourceX = 72,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0003
            x=70,
            y=686,
            width=68,
            height=206,

            sourceX = 66,
            sourceY = 6,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0004
            x=0,
            y=636,
            width=70,
            height=202,

            sourceX = 58,
            sourceY = 8,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0005
            x=80,
            y=486,
            width=76,
            height=200,

            sourceX = 54,
            sourceY = 12,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0006
            x=0,
            y=442,
            width=80,
            height=194,

            sourceX = 52,
            sourceY = 18,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0007
            x=126,
            y=300,
            width=88,
            height=186,

            sourceX = 46,
            sourceY = 28,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0008
            x=404,
            y=0,
            width=94,
            height=184,

            sourceX = 42,
            sourceY = 36,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0009
            x=262,
            y=160,
            width=112,
            height=180,

            sourceX = 36,
            sourceY = 48,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0010
            x=0,
            y=272,
            width=126,
            height=170,

            sourceX = 24,
            sourceY = 60,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0011
            x=272,
            y=0,
            width=132,
            height=160,

            sourceX = 24,
            sourceY = 78,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0012
            x=134,
            y=144,
            width=128,
            height=156,

            sourceX = 34,
            sourceY = 90,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0013
            x=138,
            y=0,
            width=134,
            height=144,

            sourceX = 32,
            sourceY = 104,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0014
            x=0,
            y=134,
            width=134,
            height=138,

            sourceX = 32,
            sourceY = 112,
            sourceWidth = 195,
            sourceHeight = 256
        },
        {
            -- stella-fall-away0015
            x=0,
            y=0,
            width=138,
            height=134,

            sourceX = 28,
            sourceY = 118,
            sourceWidth = 195,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["stella-fall-away0001"] = 1,
    ["stella-fall-away0002"] = 2,
    ["stella-fall-away0003"] = 3,
    ["stella-fall-away0004"] = 4,
    ["stella-fall-away0005"] = 5,
    ["stella-fall-away0006"] = 6,
    ["stella-fall-away0007"] = 7,
    ["stella-fall-away0008"] = 8,
    ["stella-fall-away0009"] = 9,
    ["stella-fall-away0010"] = 10,
    ["stella-fall-away0011"] = 11,
    ["stella-fall-away0012"] = 12,
    ["stella-fall-away0013"] = 13,
    ["stella-fall-away0014"] = 14,
    ["stella-fall-away0015"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
