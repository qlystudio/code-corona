-------------------------------------------------------------------------
--T and G Apps Ltd.
--Created by Jamie Trinder
--www.tandgapps.co.uk

--CoronaSDK version 2013.1179 was used for this template.

--You are not allowed to publish this template to the Appstore as it is. 
--You need to work on it, improve it and replace the graphics. 

--For questions and/or bugs found, please contact me using our contact
--form on http://www.tandgapps.co.uk/contact-us/
-------------------------------------------------------------------------


--This is return to director
local M = {}


--Directors needed new function
local function new()

    --variables for screen width and height
    local _W = display.contentWidth
    local _H = display.contentHeight
    local xMin = display.screenOriginX   --These extra ones are used to make the app multi-platform easily!
    local yMin = display.screenOriginY
    local xMax = display.contentWidth - display.screenOriginX
    local yMax = display.contentHeight - display.screenOriginY
    local xWidth = xMax-xMin --The total width
    local yHeight = yMax-yMin --The total height


    --Create our localGroup that we will return to director at the end
    local localGroup = display.newGroup()



    --------------------------------------------------------------
    --*** UI SETUP - This creates the various images needed ***
    --------------------------------------------------------------
    local background = display.newImageRect(localGroup,"images/background.jpg",xWidth,yHeight)
    background.x = _W*0.5; background.y = _H*0.5

    --Title!
    local gameText = display.newImageRect(localGroup, "images/title.png", 200,100)
    gameText.x = _W*0.5; gameText.y = _H*0.24

    --signs
    local signs = display.newImageRect(localGroup, "images/signs.png", 128,128)
    signs.x = _W*0.5; signs.y = _H*0.8



    --Maths buttons. e.g. -, +, x, /
    --Button function
    local function gotoGame(event)
        --Play a select sound.
        playSound("select")

        --Set our maths type.
        mathsType = event.target.id

        --Then change to the game
        director:changeScene("game", "fade")


        return true
    end
    local drag = display.newText("drag",0,0,chalkfFont,32)
    drag.x = (_W*0.5); drag.y = _H*0.6; drag.id = "drag"
    drag:addEventListener("tap", gotoGame)


    local minus = display.newRect(localGroup,0,0,50,50)
    minus.x = (_W*0.5)-30; minus.y = _H*0.73; minus.id = "minus"; minus.alpha = 0.01
    minus:addEventListener("tap", gotoGame)

    local add = display.newRect(localGroup,0,0,50,50)
    add.x = (_W*0.5)+30; add.y = minus.y; add.id = "add"; add.alpha = 0.01
    add:addEventListener("tap", gotoGame)

    local times = display.newRect(localGroup,0,0,50,50)
    times.x = (_W*0.5)-30; times.y = _H*0.85; times.id = "times"; times.alpha = 0.01
    times:addEventListener("tap", gotoGame)

    local divide = display.newRect(localGroup,0,0,50,50)
    divide.x = (_W*0.5)+30; divide.y = times.y; divide.id = "divide"; divide.alpha = 0.01
    divide:addEventListener("tap", gotoGame)





    ----------------------------------------------------------
    --*** Our clean function, called when you change scene ***
    ----------------------------------------------------------
    local function clean()
    end
    M.clean = clean


    return localGroup
end
M.new = new

return M

