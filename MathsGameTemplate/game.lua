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


    --Create the groups we want to use for it and insert them into the localGroup
    local localGroup = display.newGroup()
    local firstGroup = display.newGroup() --Holds the background
    local questionGroup = display.newGroup() --Holds the UI
    localGroup:insert(firstGroup)
    localGroup:insert(questionGroup)

    --prep random function
    local rand = math.random

    --Load the right game type from our mathQuestions file.
    local questions = require("mathQuestions")[mathsType]
   
    --Other vars.
    local answerNames = {"a)", "b)", "c)", "d)", "e)"}
    local dragSpots = { {80,360}, {160,360}, {240,360}, {110,435}, {210,435} }
    local questionTimer --Timer for moving the question on.
    local currentQuestion = 1  --This goes up each time you get a question right.



    --------------------------------------------------------------
    --*** UI SETUP - This creates the various images needed ***
    --------------------------------------------------------------
    local background = display.newImageRect(firstGroup,"images/background.jpg",xWidth,yHeight)
    background.anchorX = 0.5
    background.anchorY = 0.5
    background.x = _W*0.5; background.y = _H*0.5

    local function exitBtnPressed(event)
        playSound("select")
        director:changeScene("menu", "fade")
        return true
    end
    local exitBtn = display.newText(firstGroup,"X", 0,0, chalkfFont, 22)
    exitBtn.x = xMin+20; exitBtn.y = yMin+20
    exitBtn:addEventListener("tap", exitBtnPressed)



    --------------------------------------------------------------
    --*** GAMEPLAY - Create the questions and answers ***
    --------------------------------------------------------------
    --Shuffle the question array so that the questions are in a different order each time.
    local function shuffle(t)
        local rand = math.random 
        assert(t, "table.shuffle() expected a table, got nil")
        local iterations = #t
        for i = iterations, 2, -1 do
            j = rand(i)
            t[i], t[j] = t[j], t[i]
        end
    end 
    shuffle( questions )



    --Create a question.. We do this until we run out of questions!
    local function createQuestion()
        --If we have run out of questions go back to menu.
        if currentQuestion > #questions then 
            local alert = native.showAlert("Well Done!","You completed this sections questions! Why not try another?", {"OK"})
            director:changeScene("menu", "fade")

        else
            --Remove any old questions..
            for i=questionGroup.numChildren, 1, -1 do 
                if questionGroup[i] then display.remove(questionGroup[i]); questionGroup[i]=nil; end
            end

            --Now display our new question
            local questionText = display.newText(questionGroup, questions[currentQuestion].question, 0,0, chalkfFont, 34 )
            --questionText:setReferencePoint(display.CenterRightReferencePoint)
            questionText.anchorX = 1
            questionText.anchorY = 0.5
            questionText.x = xMax-20; questionText.y = _H*0.2 

            local eqauls = display.newText(questionGroup, "=", 0,0, chalkfFont, 34 )
            --eqauls:setReferencePoint(display.CenterRightReferencePoint)
            eqauls.anchorX = 1
            eqauls.anchorY = 0.5
            eqauls.x = questionText.x; eqauls.y = questionText.y+46



            --Now we create different gameplay depending on if it was the drag game or a normal game
            --The drag game creates draggable answers whereas the normal game they are clickable.
            if mathsType == "drag" then 
                --Create the awnser box where we drag the answers to!
                local box = display.newRect(questionGroup, 0,0, 92, 48)
                box.x = eqauls.x-46; box.y = eqauls.y+52; box.alpha = 0.3


                --Drag function and checks
                local touchAllowed = true
                local storedX, storedY = 0, 0
                local function answerDragged(event)
                    local t = event.target 
                    local right = t.right

                    if event.phase == "began" and touchAllowed == true then
                        display.getCurrentStage():setFocus( t )
                        t.isFocus = true
                        storedX = t.x
                        storedY = t.y

                    elseif t.isFocus and touchAllowed == true then
                        if event.phase == "moved" then
                            t.x = event.x - event.xStart + storedX
                            t.y = event.y - event.yStart + storedY 

                        elseif event.phase == "ended" or event.phase == "cancelled" then
                            display.getCurrentStage():setFocus( nil )
                            t.isFocus = false

                            --Check the placement here and if it was right or not!
                            if t.x <= box.x+40 and t.x >= box.x-40 and t.y <= box.y+40 and t.y >= box.y-40 then 
                                if right == true then 
                                    t.x = box.x; t.y = box.y
                                    playSound("right")
                                    event.target:setFillColor(0,200/255,0)
                                    touchAllowed = false
                                    currentQuestion = currentQuestion + 1
                                    questionTimer = timer.performWithDelay( 1200, createQuestion, 1)
                                else
                                    playSound("wrong")
                                    event.target:setFillColor(200/255,0,0)
                                    t.x = storedX; t.y = storedY
                                end
                            else
                                t.x = storedX; t.y = storedY
                            end 
                        end
                    end
                    return true
                end

                --Loop through the answers giving them each a touch so you can get them right or wrong..
                for i=1, #questions[currentQuestion].answers do
                    local answer =  display.newText(questionGroup, questions[currentQuestion].answers[i], 0,0, chalkfFont, 32 )
                    answer.x = dragSpots[i][1]; answer.y = dragSpots[i][2]
                    answer:addEventListener("touch", answerDragged)

                    --Change the "right" state of it to true if its the correct answer.
                    if i == questions[currentQuestion].answer then answer.right = true
                    else answer.right = false end
                end

            --Now the other games that aren't drag!!
            else
                --Answer touched function. Checks to see if you got the answer right or wrong!
                local touchAllowed = true
                local function answerTouched(event)
                    --We stop touches being allowed once you get it correct!
                    if touchAllowed == true then 
                        local right = event.target.right
                        if right == true then 
                            playSound("right")
                            event.target:setFillColor(0,200/255,0)
                            touchAllowed = false
                            currentQuestion = currentQuestion + 1
                            questionTimer = timer.performWithDelay( 1200, createQuestion, 1)
                        else
                            playSound("wrong")
                            event.target:setFillColor(200/255,0,0)
                        end
                    end
                    return true
                end


                --Loop through the answers giving them each a touch so you can get them right or wrong..
                for i=1, #questions[currentQuestion].answers do
                    local answerLetter = display.newText(questionGroup, answerNames[i], 0,0, chalkfFont, 26 )
                    --answerLetter:setReferencePoint(display.CenterLeftReferencePoint)
                    answerLetter.anchorX = 0
                    answerLetter.anchorY = 0.5
                    answerLetter:setFillColor(190/255)
                    answerLetter.x = xMin+20; answerLetter.y = _H*0.44+((i-1)*52)

                    local line = display.newLine(questionGroup, xMin+20, answerLetter.y+24, xMax-20, answerLetter.y+24)
                    line:setStrokeColor(190/255,190/255,190/255,80)

                    local answer =  display.newText(questionGroup, questions[currentQuestion].answers[i], 0,0, chalkfFont, 32 )
                    --answer:setReferencePoint(display.CenterRightReferencePoint)
                    answer.anchorX = 1
                    answer.anchorY = 0.5
                    answer.x = xMax-20; answer.y = answerLetter.y
                    answer:addEventListener("tap", answerTouched)

                    --Change the "right" state of it to true if its the correct answer.
                    if i == questions[currentQuestion].answer then answer.right = true
                    else answer.right = false end
                end
            end
        end
    end
    createQuestion()




    ----------------------------------------------------------
    --*** Our clean function, called when you change scene ***
    ---------------------------------------------------------- 
    function clean()
        --Stop any timers or runtime listners here.
        if questionTimer then timer.cancel(questionTimer); questionTimer=nil; end
    end
    M.clean = clean


    return localGroup
end
M.new = new

return M

