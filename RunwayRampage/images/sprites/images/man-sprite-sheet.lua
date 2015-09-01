--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a08ca08c1c7c42ea29bd4b4e19002b7c:d581abe231212f2aff4ffd29ac096c0f:f3849efeeb5f8b4075e92df8911744cb$
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
            -- man
            x=2,
            y=2,
            width=416,
            height=292,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 411,
            sourceHeight = 290
        },
    },
    
    sheetContentWidth = 420,
    sheetContentHeight = 296
}

SheetInfo.frameIndex =
{

    ["man"] = 1,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
