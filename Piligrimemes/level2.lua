module(..., package.seeall )

--====================================================================--
-- SCENE: [NAME]
--====================================================================--

--[[

- Version: [1.0]
- Made by: [name]
- Website: [url]
- Mail: [mail]

******************
- INFORMATION
******************

- [Your info here]

--]]


local gameState = require( "gamestate" )
local sprite = require ( "sprite" )
local mRand = math.random
local mCeil = math.ceil

local selectedMeme = nil

--Start the score at 0
local score = 0
local saved = 0

local scene = 1
local randomEnemy = 0
local playerMemeTable = {}
local friendlyMemeTable = {}
local enemyMemeTable = {}
local eventListenerCount = 0
local touchListener

new = function ()


------------------
-- Groups
------------------

local localGroup = display.newGroup()
local backgroundGroup = display.newGroup()
local memeGroup = display.newGroup()

localGroup:insert(backgroundGroup)

------------------
-- Your code here
------------------



local selectedMeme = nil

local church

        local drawBackground = function()
                --[[
                local randBackgroundFile = "level1/space" .. tostring( mRand( 1, 2 ) ) .. ".png"
                local gameBackground = display.newImageRect( randBackgroundFile, display.contentWidth, display.contentHeight )
                gameBackground:setReferencePoint( display.TopLeftReferencePoint )
                gameBackground.x = 0; gameBackground.y = 0
                --]]

                local stars1 = display.newImageRect( "level1/stars1.png", display.contentWidth, display.contentHeight )
                stars1:setReferencePoint( display.TopLeftReferencePoint )
                stars1.x = 0; stars1.y = 0

                local stars2 = display.newImageRect( "level1/stars2.png", display.contentWidth, display.contentHeight )
                stars2:setReferencePoint( display.TopLeftReferencePoint )
                stars2.x = 0; stars2.y = 0
                stars2.alpha = 0.1

                local stars1Tween, stars2Tween

                ambientSound = audio.loadSound("level1/nyan_cat_original.mp3")
                ambientSoundChannel = audio.play( ambientSound, { onComplete = audio.dispose} )
                audio.setVolume(0.50, {channel = ambientSoundChannel})

                local function starsAnimation()
                        local reAppear = function()
                                stars1Tween = transition.to( stars1, { time=1000, alpha=0.1, onComplete=starsAnimation })
                                stars2Tween = transition.to( stars2, { time=1000, alpha=1.0 })
                        end

                        stars1Tween = transition.to( stars1, { time=1000, alpha=1.0, onComplete=reAppear })
                        stars2Tween = transition.to( stars2, { time=1000, alpha=0.1 })
                end

                stars1Tween = transition.to( stars1, { time=1000, alpha=0.1, onComplete=starsAnimation })
                stars2Tween = transition.to( stars2, { time=1000, alpha=1.0 })

                --backgroundGroup:insert( gameBackground )
                backgroundGroup:insert( stars1 )
                backgroundGroup:insert( stars2 )    
        end

        touchListener = function( event )
        local meme = event.target
        local tmp_meme = meme.callback
                

                if ( event.phase == "began" and tmp_meme ~= nil) then
                        if(tmp_meme.moving==0) then
                                tmp_meme.touchPointsX = {}
                                tmp_meme.touchPointsY = {}
                                tmp_meme.lineObject = {} 
                                tmp_meme.touchIndice = 1
                                tmp_meme.nextIndice = 1
                                selectedMeme = tmp_meme
                        else
                                Runtime:removeEventListener ("enterFrame", tmp_meme )
                                eventListenerCount = eventListenerCount - 1
                                removeMemeLine(tmp_meme)
                                tmp_meme.touchPointsX = {}
                                tmp_meme.touchPointsY = {}
                                tmp_meme.lineObject = {} 
                                tmp_meme.touchIndice = 1
                                tmp_meme.nextIndice = 1
                                selectedMeme = tmp_meme
                        end
                end
                if ( event.phase == "began" and meme.index ~= nil) then
                        if(# playerMemeTable>0) then
                        local tmp_player_meme=playerMemeTable[1]
                        narration = audio.loadSound("level1/pew"..math.random(1,5)..".ogg")
                        narrationChannel = audio.play( narration, { onComplete = audio.dispose} )
                        local ray = display.newLine( meme.x,meme.y, tmp_player_meme.x,tmp_player_meme.y )
                        transition.to(ray,{alpha=0.0,onComplete=display.remove})
                        meme.moving=0
                        --Runtime:removeEventListener("tap",enemyMeme)
                        Runtime:removeEventListener("touch",tmp_meme)
                        Runtime:removeEventListener("enterFrame",meme)
                        meme.alpha=0.0
                        createExplosion(10,meme.x,meme.y)
                        meme.x,meme.y=-100,-100
                        removeEnemyMemes()
                end
                        
                end
        end

        function createChurch(imageFile,x,y)
                local tmpChurch = display.newImageRect( imageFile, 66, 102 )
                tmpChurch:setReferencePoint( display.CenterReferencePoint ) 
                tmpChurch.x, tmpChurch.y = x, y
                --church.winText=display.newText("Come in my child...", display.contentWidth*0.3, display.contentHeight*0.5, native.systemFont, 42)
                --church.winText:setReferencePoint( display.CenterReferencePoint ) 
                --church.winText:setTextColor(255, 255, 255)
                --church.winText.alpha=0.0
                --textGroup:insert(church.winText);
                tmpChurch.speed = 6

                tmpChurch.touchPointsX = {x,-50}
                tmpChurch.touchPointsY = {y,-50}
                tmpChurch.trailcounter = 1
                tmpChurch.touchIndice=table.getn(tmpChurch.touchPointsX)
                addMiddlePoints(tmpChurch.touchPointsX,tmpChurch.touchPointsY)

                tmpChurch.color1 = {200,200,0}
                tmpChurch.color2 = {255,255,255}
                tmpChurch.color3 = {255,255,255}

                tmpChurch.angleBetween = math.ceil(math.atan2((tmpChurch.touchPointsY[(# tmpChurch.touchPointsY)] - tmpChurch.touchPointsY[1]), (tmpChurch.touchPointsX[(# tmpChurch.touchPointsX)] - tmpChurch.touchPointsX[1]) ) * 180 / math.pi) + 90
                --print(angleBetween)
                --tmpChurch.rotation=angleBetween
                tmpChurch.touchIndice=table.getn(tmpChurch.touchPointsX)
                local delta_x1,delta_x2=0,0
                local delta_y1,delta_y2=0,0
                angle_1 = (tmpChurch.angleBetween+90)*(math.pi/180)
                angle_2 = (tmpChurch.angleBetween-90)*(math.pi/180)
                print(angle_1)
                --delta_x1 = 10*math.cos(nyanCat.image.rotation+90)
                --delta_y1 = 10*math.sin(nyanCat.image.rotation+90)
                delta_x1 = 10*math.cos(angle_1)
                delta_y1 = 10*math.sin(angle_1)

                delta_x2 = 10*math.cos(angle_2)
                delta_y2 = 10*math.sin(angle_2)
                tmpChurch.moving=0


                tmpChurch.nextIndice = 1
             --   transition.to(tmpChurch, {xScale=0.5,time=5000})
             --   transition.to(tmpChurch, {yScale=0.5,time=5000})
             --   Runtime:addEventListener("enterFrame",tmpChurch)


                function tmpChurch:enterFrame ( event )
                        local speed = tmpChurch.speed
                        tmpChurch.moving=1

                       tmpChurch.rotation=tmpChurch.angleBetween
                        
                        --print ("MOVING: ",friendlyMeme.moving)
                        if ( tmpChurch.nextIndice < tmpChurch.touchIndice) then
                                 tmpChurch.angleBetween = math.ceil(math.atan2((tmpChurch.touchPointsY[(# tmpChurch.touchPointsY)] - tmpChurch.touchPointsY[1]), (tmpChurch.touchPointsX[(# tmpChurch.touchPointsX)] - tmpChurch.touchPointsX[1]) ) * 180 / math.pi) + 90
                        
                                --teorema de pitágoras para aceitar velocidades > 1.0
                                dx_plus_dy=math.sqrt(math.pow(speed,2)+math.pow(speed,2))
                                -- está perto qb para assumir que chegou ao ponto
                                -- entao x e y passam a ser o ponto
                                
                                if(distance(tmpChurch.x,tmpChurch.touchPointsX[tmpChurch.nextIndice],tmpChurch.y,tmpChurch.touchPointsY[tmpChurch.nextIndice]) <= dx_plus_dy) then
                                        --display.remove(friendlyMeme.lineObject[friendlyMeme.nextIndice])
                                       -- display.remove(friendlyMeme.lineObject[1])
                                        --table.remove(friendlyMeme.lineObject,1)
                                        --destroyFirstLine(friendlyMeme)
                                        
                                        tmpChurch.nextIndice = tmpChurch.nextIndice+1
                                        --nao está, portanto continua a tentar uma aproximação gradual com velocidade "speed"
                                        --em ambos os eixos
                                else
                                        local dx = math.sqrt(math.pow(tmpChurch.x-tmpChurch.touchPointsX[tmpChurch.nextIndice],2))
                                        --print ("dx:",dx)
                                        local dy = math.sqrt(math.pow(tmpChurch.y-tmpChurch.touchPointsY[tmpChurch.nextIndice],2))
                                        --print ("dy:",dy)
                                        if ( tmpChurch.x < tmpChurch.touchPointsX[tmpChurch.nextIndice] and dx > speed) then
                                                tmpChurch.x=tmpChurch.x+speed
                                        elseif (tmpChurch.x > tmpChurch.touchPointsX[tmpChurch.nextIndice] and dx > speed) then
                                                tmpChurch.x=tmpChurch.x-speed
                                        end
                                        if ( tmpChurch.y < tmpChurch.touchPointsY[tmpChurch.nextIndice] and dy > speed) then
                                                tmpChurch.y=tmpChurch.y+speed
                                        elseif (tmpChurch.y > tmpChurch.touchPointsY[tmpChurch.nextIndice] and dy > speed) then
                                                tmpChurch.y=tmpChurch.y-speed
                                        end
                                end
                        else
                        --chegou ao fim do caminho.
                        if(# tmpChurch.touchPointsX > 1) then
                                tmpChurch.touchPointsX = {}
                                tmpChurch.touchPointsY = {}
                                tmpChurch.touchIndice = 1
                                tmpChurch.nextIndice = 1
                                tmpChurch.moving=0
                                comeBack(tmpChurch)
                        end
                                
                                --Runtime:removeEventListener("enterFrame", tmpChurch)
                                -- display.remove(tmpChurch)
                                eventListenerCount = eventListenerCount - 1                            
                        end
                        tmpChurch.trailcounter=tmpChurch.trailcounter+1
                         if(tmpChurch.trailcounter>=8 and tmpChurch.xScale>0.07) then
                                trail2 = display.newCircle(tmpChurch.x+delta_x1,tmpChurch.y+delta_y1,5)
                                trail2.xScale=tmpChurch.xScale
                                trail2.yScale=tmpChurch.yScale
                                trail2:setFillColor(tmpChurch.color3[1],tmpChurch.color3[2],tmpChurch.color3[3])
                                trail2:setStrokeColor(tmpChurch.color3[1],tmpChurch.color3[2],tmpChurch.color3[3])
                                --trail2:setFillColor(100,100,100,0)
                                backgroundGroup:insert(trail2)
                                transition.to(trail2, {alpha=0.0,time=3000, onComplete=display.remove})

                                trail3 = display.newCircle(tmpChurch.x+delta_x2,tmpChurch.y+delta_y2,5)
                                trail3.xScale=tmpChurch.xScale
                                trail3.yScale=tmpChurch.yScale
                                trail3:setFillColor(tmpChurch.color2[1],tmpChurch.color2[2],tmpChurch.color2[3])
                                trail3:setStrokeColor(tmpChurch.color2[1],tmpChurch.color2[2],tmpChurch.color2[3])
                                backgroundGroup:insert(trail3)
                                transition.to(trail3, {alpha=0.0,time=3000, onComplete=display.remove}) 

                                trail1 = display.newCircle(tmpChurch.x,tmpChurch.y,5)
                                trail1.xScale=tmpChurch.xScale
                                trail1.yScale=tmpChurch.yScale
                                trail1:setFillColor(tmpChurch.color1[1],tmpChurch.color1[2],tmpChurch.color1[3])
                                trail1:setStrokeColor(tmpChurch.color1[1],tmpChurch.color1[2],tmpChurch.color1[3])
                                backgroundGroup:insert(trail1)
                                transition.to(trail1, {alpha=0.0,time=3000, onComplete=display.remove})
                                tmpChurch.trailcounter=0
                         end

                end


                return tmpChurch
        end

        function createPlayerMeme(imageFile, x, y, speed)

                local playerMeme = {}

                playerMeme.image=display.newImageRect( imageFile, 60, 77 )
                playerMeme.lineObject = {} 

                playerMeme.image:setReferencePoint( display.CenterReferencePoint )
                playerMeme.image:addEventListener( "touch", touchListener )
                eventListenerCount = eventListenerCount + 1
                playerMeme.image.callback = playerMeme
                playerMeme.x, playerMeme.y = x, y
                playerMeme.image.x,playerMeme.image.y=x,y

                playerMeme.speed = speed
                playerMeme.life = 250
                playerMeme.moving = 0

                --[[
                playerMeme.lifeText=display.newText(playerMeme.life, playerMeme.x,playerMeme.y, native.systemFontBold, 10)
                playerMeme.lifeText.x, playerMeme.lifeText.y = playerMeme.x+50,playerMeme.y
                playerMeme.myCircle = display.newCircle( x, y, 32 )
                playerMeme.myCircle.x, playerMeme.myCircle.y = playerMeme.x,playerMeme.y
                playerMeme.myCircle:setFillColor(0, 0, 0, 0) 
                playerMeme.myCircle.strokeWidth = 5
                playerMeme.myCircle:setStrokeColor(51, 204, 51)
                --]]

                --local baloon1 = display.newImageRect("Baloon.png",  90,50)
                --baloon1.x, baloon1.y = playerMeme.x+60,playerMeme.y-30
                --textGroup:insert(baloon1)

                --[[
                playerMeme.myTextUp=display.newText("Pick Me, Pick Me!!!", playerMeme.x,playerMeme.y-40, native.systemFontBold, 10)
                playerMeme.myTextDown=display.newText("Or, I WILL DIE!!!", playerMeme.x,playerMeme.y+40, native.systemFontBold, 10)
                playerMeme.myTextUp.x, playerMeme.myTextUp.y = playerMeme.x,playerMeme.y-40
                playerMeme.myTextDown.x, playerMeme.myTextDown.y = playerMeme.x,playerMeme.y+40
                playerMeme.myTextUp:setTextColor(255, 255, 255)
                playerMeme.myTextDown:setTextColor(255, 255, 255)
                textGroup:insert(playerMeme.myTextUp)
                textGroup:insert(playerMeme.myTextDown)
                lifeGroup:insert(playerMeme.myCircle)
                --]]

                function playerMeme:enterFrame ( event )
                        local speed = playerMeme.speed

                        if ( playerMeme.nextIndice < playerMeme.touchIndice ) then

                                if ( playerMeme.nextIndice < playerMeme.touchIndice - 1) then
                                        if (playerMeme.x < playerMeme.touchPointsX[playerMeme.nextIndice + 1]) then
                                                changePlayerImage("level1/astronaut_right.png", playerMeme)
                                                playerMeme.image:addEventListener( "touch", touchListener )
                                        else
                                                changePlayerImage("level1/astronaut_left.png", playerMeme)
                                                playerMeme.image:addEventListener( "touch", touchListener )
                                        end
                                end

                                --teorema de pitágoras para aceitar velocidades > 1.0
                                dx_plus_dy=math.sqrt(math.pow(speed,2)+math.pow(speed,2))
                                -- está perto qb para assumir que chegou ao ponto
                                -- entao x e y passam a ser o ponto
                                if(distance(playerMeme.x,playerMeme.touchPointsX[playerMeme.nextIndice],playerMeme.y,playerMeme.touchPointsY[playerMeme.nextIndice]) <= dx_plus_dy) then
                                        --display.remove(playerMeme.lineObject[1])
                                        --table.remove(playerMeme.lineObject,1)
                                        destroyFirstLine(playerMeme)
                                        playerMeme.nextIndice = playerMeme.nextIndice+1
                                        --nao está, portanto continua a tentar uma aproximação gradual com velocidade "speed"
                                        --em ambos os eixos
                                else
                                        local dx = math.sqrt(math.pow(playerMeme.x-playerMeme.touchPointsX[playerMeme.nextIndice],2))
                                        --  print ("dx:",dx)
                                        local dy = math.sqrt(math.pow(playerMeme.y-playerMeme.touchPointsY[playerMeme.nextIndice],2))
                                        --  print ("dy",dy)
                                        if ( playerMeme.x < playerMeme.touchPointsX[playerMeme.nextIndice] and dx > speed) then
                                                playerMeme.x=playerMeme.x+speed
                                        elseif (playerMeme.x > playerMeme.touchPointsX[playerMeme.nextIndice] and dx > speed) then
                                                playerMeme.x=playerMeme.x-speed
                                        end
                                        if ( playerMeme.y < playerMeme.touchPointsY[playerMeme.nextIndice] and dy > speed) then
                                                playerMeme.y=playerMeme.y+speed
                                        elseif (playerMeme.y > playerMeme.touchPointsY[playerMeme.nextIndice] and dy > speed) then
                                                playerMeme.y=playerMeme.y-speed
                                        end



                                        --transition.to(playerMeme,{time=33, x=(playerMeme.x), y=(playerMeme.y)})

                                        -- colision / distance code. CHANGE 50 to the radius*2 (can't be bothered to search for for it now)
                                        -- talvez se possa tirar isto do "canMove" que limita o uso de memes a serio para "soltar" os outros
                                        -- assim poderiamos pensar em reacções em cadeia em que memes fracos libertam bons
                                        for k,friendlyMeme in ipairs(friendlyMemeTable) do
                                                if (distance(playerMeme.x,friendlyMeme.x,playerMeme.y,friendlyMeme.y) < 50 and friendlyMeme.moving == 0) then
                                                        Runtime:addEventListener("enterFrame", friendlyMeme)
                                                        eventListenerCount = eventListenerCount + 1
                                                        friendlyMeme.moving=1
                                                        --table.remove(friendlyMemeTable,k)
                                                end
                                        end
                                end

                                --baloon1.x, baloon1.y = playerMeme.x+60,playerMeme.y-30
                                --[[
                                playerMeme.myTextUp.x, playerMeme.myTextUp.y = playerMeme.x,playerMeme.y-40
                                playerMeme.myTextDown.x, playerMeme.myTextDown.y = playerMeme.x,playerMeme.y+40
                                playerMeme.myCircle.x, playerMeme.myCircle.y = playerMeme.x,playerMeme.y
                                playerMeme.lifeText.x, playerMeme.lifeText.y = playerMeme.x+50,playerMeme.y
                                --]]
                        else
                                --chegou ao fim do caminho.
                                playerMeme.touchPointsX = {}
                                playerMeme.touchPointsY = {}
                                playerMeme.lineObject = {} 
                                playerMeme.touchIndice = 1
                                playerMeme.nextIndice = 1
                                playerMeme.moving=0


                                Runtime:removeEventListener("enterFrame", playerMeme)                            
                                eventListenerCount = eventListenerCount - 1
                        end
                        playerMeme.image.x=playerMeme.x
                        playerMeme.image.y=playerMeme.y
                end 

                return playerMeme
        end

        function createNyanCat(imageFile,speed,color1_t,color2_t,color3_t,startx,starty,endx,endy)
                local nyanCat = {}
                nyanCat.image = display.newImageRect( imageFile, 100, 60 )
                nyanCat.image:setReferencePoint( display.CenterReferencePoint )
                nyanCat.speed = speed
                nyanCat.life = 250
                nyanCat.moving = 1
                nyanCat.speed=speed
                nyanCat.trailcounter=0
                nyanCat.lineObject = {} 
               --enemyMemeTable[# enemyMemeTable + 1] = nyanCat

                -- print(color1_t)
                nyanCat.color1=color1_t
                nyanCat.color2=color2_t
                nyanCat.color3=color3_t


                nyanCat.touchPointsX = {startx,endx}
                nyanCat.touchPointsY = {starty,endy}


                nyanCat.image.x, nyanCat.image.y = nyanCat.touchPointsX[1], nyanCat.touchPointsY[1]
                addMiddlePoints(nyanCat.touchPointsX,nyanCat.touchPointsY)
                nyanCat.angleBetween = math.ceil(math.atan2((nyanCat.touchPointsY[(# nyanCat.touchPointsY)] - nyanCat.touchPointsY[1]), (nyanCat.touchPointsX[(# nyanCat.touchPointsX)] - nyanCat.touchPointsX[1]) ) * 180 / math.pi)
                --print(angleBetween)
                nyanCat.image.rotation=nyanCat.angleBetween
                
                nyanCat.touchIndice=table.getn(nyanCat.touchPointsX)
                nyanCat.delta_x1,nyanCat.delta_x2=0,0
                nyanCat.delta_y1,nyanCat.delta_y2=0,0
                nyanCat.angle_1 = (nyanCat.image.rotation+90)*(math.pi/180)
                nyanCat.angle_2 = (nyanCat.image.rotation-90)*(math.pi/180)
                print(nyanCat.angle_1)
                --delta_x1 = 10*math.cos(nyanCat.image.rotation+90)
                --delta_y1 = 10*math.sin(nyanCat.image.rotation+90)
                nyanCat.delta_x1 = 10*math.cos(nyanCat.angle_1)
                nyanCat.delta_y1 = 10*math.sin(nyanCat.angle_1)

                nyanCat.delta_x2 = 10*math.cos(nyanCat.angle_2)
                nyanCat.delta_y2 = 10*math.sin(nyanCat.angle_2)


                nyanCat.nextIndice = 1

                Runtime:addEventListener ( "enterFrame", nyanCat )
                eventListenerCount = eventListenerCount + 1


                function nyanCat:enterFrame ( event )
                        local speed = nyanCat.speed
                        nyanCat.angleBetween = math.ceil(math.atan2((nyanCat.touchPointsY[(# nyanCat.touchPointsY)] - nyanCat.touchPointsY[1]), (nyanCat.touchPointsX[(# nyanCat.touchPointsX)] - nyanCat.touchPointsX[1]) ) * 180 / math.pi)
                --print(angleBetween)
                        nyanCat.image.rotation=nyanCat.angleBetween
                        --print ("MOVING: ",friendlyMeme.moving)
                        if ( nyanCat.nextIndice < nyanCat.touchIndice) then
                                --teorema de pitágoras para aceitar velocidades > 1.0
                                dx_plus_dy=math.sqrt(math.pow(speed,2)+math.pow(speed,2))
                                -- está perto qb para assumir que chegou ao ponto
                                -- entao x e y passam a ser o ponto
                                
                                if(distance(nyanCat.image.x,nyanCat.touchPointsX[nyanCat.nextIndice],nyanCat.image.y,nyanCat.touchPointsY[nyanCat.nextIndice]) <= dx_plus_dy) then
                                        --display.remove(friendlyMeme.lineObject[friendlyMeme.nextIndice])
                                       -- display.remove(friendlyMeme.lineObject[1])
                                        --table.remove(friendlyMeme.lineObject,1)
                                        --destroyFirstLine(friendlyMeme)
                                        
                                        nyanCat.nextIndice = nyanCat.nextIndice+1
                                        --nao está, portanto continua a tentar uma aproximação gradual com velocidade "speed"
                                        --em ambos os eixos
                                else
                                        local dx = math.sqrt(math.pow(nyanCat.image.x-nyanCat.touchPointsX[nyanCat.nextIndice],2))
                                        --print ("dx:",dx)
                                        local dy = math.sqrt(math.pow(nyanCat.image.y-nyanCat.touchPointsY[nyanCat.nextIndice],2))
                                        --print ("dy:",dy)
                                        if ( nyanCat.image.x < nyanCat.touchPointsX[nyanCat.nextIndice] and dx > speed) then
                                                nyanCat.image.x=nyanCat.image.x+speed
                                        elseif (nyanCat.image.x > nyanCat.touchPointsX[nyanCat.nextIndice] and dx > speed) then
                                                nyanCat.image.x=nyanCat.image.x-speed
                                        end
                                        if ( nyanCat.image.y < nyanCat.touchPointsY[nyanCat.nextIndice] and dy > speed) then
                                                nyanCat.image.y=nyanCat.image.y+speed
                                        elseif (nyanCat.image.y > nyanCat.touchPointsY[nyanCat.nextIndice] and dy > speed) then
                                                nyanCat.image.y=nyanCat.image.y-speed
                                        end
                                end
                                nyanCat.trailcounter=nyanCat.trailcounter+1
                                if(nyanCat.trailcounter>=8) then
                                        trail2 = display.newCircle(nyanCat.image.x+nyanCat.delta_x1,nyanCat.image.y+nyanCat.delta_y1,5)
                                        trail2:setFillColor(nyanCat.color3[1],nyanCat.color3[2],nyanCat.color3[3])
                                        trail2:setStrokeColor(nyanCat.color3[1],nyanCat.color3[2],nyanCat.color3[3])
                                        --trail2:setFillColor(100,100,100,0)
                                        backgroundGroup:insert(trail2)
                                        transition.to(trail2, {alpha=0.0,time=3000, onComplete=display.remove})

                                        trail3 = display.newCircle(nyanCat.image.x+nyanCat.delta_x2,nyanCat.image.y+nyanCat.delta_y2,5)
                                        trail3:setFillColor(nyanCat.color2[1],nyanCat.color2[2],nyanCat.color2[3])
                                        trail3:setStrokeColor(nyanCat.color2[1],nyanCat.color2[2],nyanCat.color2[3])
                                        backgroundGroup:insert(trail3)
                                        transition.to(trail3, {alpha=0.0,time=3000, onComplete=display.remove}) 

                                        trail1 = display.newCircle(nyanCat.image.x,nyanCat.image.y,5)
                                        trail1:setFillColor(nyanCat.color1[1],nyanCat.color1[2],nyanCat.color1[3])
                                        trail1:setStrokeColor(nyanCat.color1[1],nyanCat.color1[2],nyanCat.color1[3])
                                        backgroundGroup:insert(trail1)
                                        transition.to(trail1, {alpha=0.0,time=3000, onComplete=display.remove})
                                        nyanCat.trailcounter=0
                                end
                        else
                        --chegou ao fim do caminho.
                        tmp_player_meme = playerMemeTable[1]

                                new_start_x = math.random(0,tmp_player_meme.x)
                                new_end_x= math.random(tmp_player_meme.x,display.contentWidth)
                                --nyanCat.touchPointsX = {nyanCat.touchPointsX[# nyanCat.touchPointsX],nyanCat.touchPointsX[1]}
                                nyanCat.touchPointsX = {new_start_x,new_end_x}
                                nyanCat.touchPointsY = {nyanCat.touchPointsY[# nyanCat.touchPointsY],nyanCat.touchPointsY[1]}
                                nyanCat.image.x, nyanCat.image.y = nyanCat.touchPointsX[1], nyanCat.touchPointsY[1]
                                addMiddlePoints(nyanCat.touchPointsX,nyanCat.touchPointsY)
                                nyanCat.touchIndice = (# nyanCat.touchPointsX)
                                nyanCat.nextIndice = 1
                                nyanCat.moving=1
                                                        nyanCat.angleBetween = math.ceil(math.atan2((nyanCat.touchPointsY[(# nyanCat.touchPointsY)] - nyanCat.touchPointsY[1]), (nyanCat.touchPointsX[(# nyanCat.touchPointsX)] - nyanCat.touchPointsX[1]) ) * 180 / math.pi)
                --print(angleBetween)
                        nyanCat.image.rotation=nyanCat.angleBetween

                                                nyanCat.delta_x1,nyanCat.delta_x2=0,0
                nyanCat.delta_y1,nyanCat.delta_y2=0,0
                nyanCat.angle_1 = (nyanCat.image.rotation+90)*(math.pi/180)
                nyanCat.angle_2 = (nyanCat.image.rotation-90)*(math.pi/180)
                print(nyanCat.angle_1)
                --delta_x1 = 10*math.cos(nyanCat.image.rotation+90)
                --delta_y1 = 10*math.sin(nyanCat.image.rotation+90)
                nyanCat.delta_x1 = 10*math.cos(nyanCat.angle_1)
                nyanCat.delta_y1 = 10*math.sin(nyanCat.angle_1)

                nyanCat.delta_x2 = 10*math.cos(nyanCat.angle_2)
                nyanCat.delta_y2 = 10*math.sin(nyanCat.angle_2)



                               -- transition.to(nyanCat.image, {alpha=0.0,time=500,onComplete=display.remove})
                             --   Runtime:removeEventListener("enterFrame", nyanCat)
                             --   eventListenerCount = eventListenerCount - 1                            
                        end

                end
                return nyanCat

        end




        function createLaserEnemyMeme(imageFile, x, y)
                local enemyMeme = display.newImageRect( imageFile, 60, 60 )
                enemyMeme:setReferencePoint( display.CenterReferencePoint )
                enemyMeme.x, enemyMeme.y = x, y
                enemyMeme.startX, enemyMeme.startY = x, y
                enemyMeme.followRadius = 900
                enemyMeme.speed=0.8
                enemyMeme.moving=1
                enemyMeme.index=0

                enemyMeme:addEventListener( "touch", touchListener)
                Runtime:addEventListener("enterFrame",enemyMeme)

                -- function enemyMeme:tap( event )
                --     if(distance(enemyMeme.x,event.x,enemyMeme.y,event.y) < 100) then
                --         local tmp_player_meme=playerMemeTable[1]
                --         local ray = display.newLine( enemyMeme.x,enemyMeme.y, tmp_player_meme.x,tmp_player_meme.y )
                --         transition.to(ray,{alpha=0.0,onComplete=display.remove})
                --         enemyMeme.moving=0
                --         --Runtime:removeEventListener("tap",enemyMeme)
                --         Runtime:removeEventListener("enterFrame",enemyMeme)
                --         enemyMeme.alpha=0.0
                --         createExplosion(10,enemyMeme.x,enemyMeme.y)
                --         enemyMeme.x,enemyMeme.y=-100,-100
                --         removeEnemyMemes()
                --     end
                -- end

                function enemyMeme:getTarget (radius) 
                        if(enemyMeme.moving == 1) then
                        -- checks if current target is still in reach
                                if (enemyMeme.target ~= nil) then
                                        if (enemyMeme.target.life <= 0) then
                                                enemyMeme.target = nil
                                        elseif (distance(enemyMeme.x, enemyMeme.target.x, enemyMeme.y, enemyMeme.target.y) < radius) then
                                                return
                                        end
                                end

                                for i,playerMeme in ipairs(playerMemeTable) do
                                        if (distance(enemyMeme.x, playerMeme.x, enemyMeme.y, playerMeme.y) < radius) then
                                                enemyMeme.target = playerMeme
                                                return 
                                        end
                                end

                                enemyMeme.target = nil
                        end
                end

                function enemyMeme:moveTo (x, y)
                        if(enemyMeme.moving == 1) then 
                               if (enemyMeme.x > x) then
                                       enemyMeme.x = enemyMeme.x - enemyMeme.speed
                               elseif (enemyMeme.x < x) then
                                       enemyMeme.x = enemyMeme.x + enemyMeme.speed
                               end

                               if (enemyMeme.y > y) then
                                       enemyMeme.y = enemyMeme.y - enemyMeme.speed
                               elseif (enemyMeme.y < y) then
                                       enemyMeme.y = enemyMeme.y + enemyMeme.speed
                               end
                        end
                end

                function enemyMeme:enterFrame ( event )
                        enemyMeme:getTarget(enemyMeme.followRadius)

                        if(enemyMeme.target ~= nil) then
                                enemyMeme:moveTo(enemyMeme.target.x, enemyMeme.target.y)
                        end
                end

                return enemyMeme
        end


        --Simple particle engine for flair
        function createExplosion(howmany,x,y)
                local particles = {}    -- particle table
                particles.howmany=howmany
                particles.frames = 0
                
                addParticles(particles.howmany,particles,x,y)
                if(# particles < particles.howmany) then
                    return
                end
                print (# particles)
                Runtime:addEventListener ( "enterFrame", particles )

                function particles:enterFrame ( event )
                        local particle

                        particles.frames = particles.frames + 1
                  
                        if(particles.frames<100) then
                                for i,v in ipairs(particles) do
                                        if (v.shape.y < display.contentHeight) then
                                                updateParticle(v)
                                        end
                                end
                        else
                                while(# particles > 0) do
                                        transition.to(particles[1].shape,{alpha=0,time=500, onComplete=display.remove})
                                        table.remove(particles,1)

                                end
                                Runtime:removeEventListener ( "enterFrame", particles )
                        end

                end


        end





        function initilizeLine(tmp_meme,width,alpha,r,g,b)
                local speed = tmp_meme.speed
                local k
                local pointCount = tmp_meme.touchIndice - 1   --> no need to draw a line when at last coordinate
                for k=1, pointCount do
                        if k < pointCount then
                                local nexti = k + 1
                                local lasti = pointCount

                                if k < lasti then
                                        tmp_meme.lineObject[k] = display.newLine( tmp_meme.touchPointsX[k], tmp_meme.touchPointsY[k], tmp_meme.touchPointsX[nexti], tmp_meme.touchPointsY[nexti] )
                                        tmp_meme.lineObject[k]:setColor( 0, r, g, b )
                                        tmp_meme.lineObject[k].width = width
                                        tmp_meme.lineObject[k].alpha = alpha
                                        backgroundGroup:insert(tmp_meme.lineObject[k])
                                end

                                k = k + 1   --> increment to the next coordinate
                        end
                end
        end

        function addParticles(count,table_p,x,y)
                local spark
                for i = 1, count do
                        spark = createParticle(x,y)
                        table.insert(table_p, spark)
                end
        end

        function createParticle(x, y)
                local particle = {}
                      if(x ~= nil and y ~= nil) then
                          particle.size = math.random(2,5)
                          particle.vy = math.random(-10,10)/10
                          particle.vx = math.random(-10,10)/10
                          particle.color=math.random(130,250)
                          particle.shape = display.newCircle(x,y,particle.size)
                          particle.shape:setFillColor(particle.color, particle.color, 0 )
               
                      -- or use image
                      --local shape = Bitmap.new(Texture.new("spark.png"))
               
                      backgroundGroup:insert(particle.shape)
                      particle.shape.x,particle.shape.y=x,y
                return particle
              end
        end
        function updateParticle(particle)
                local tmpCircle = display.newCircle(particle.shape.x,particle.shape.y,particle.size)
                tmpCircle:setFillColor(particle.color, particle.color, 0 )
                transition.to(tmpCircle,{alpha=0.0,time=500, onComplete=display.remove})
                particle.vx=particle.vx*0.98 --drag
                particle.vy=particle.vy*0.98
                particle.shape.x=particle.shape.x+particle.vx
                particle.shape.y=particle.shape.y+particle.vy
        end

        function destroyFirstLine(tmp_meme)
                display.remove(tmp_meme.lineObject[1])
                table.remove(tmp_meme.lineObject,1)
        end

        function Runtime:touch( event )
                --print( event.phase )
                if ( selectedMeme ~= nil ) then
                        if ( event.phase == "moved") then
                                --adding a midpoint to try an easy fix at the line code; 40 is a magic number, please remove once we have a radius variable
                                selectedMeme.touchPointsX[selectedMeme.touchIndice] = event.x
                                selectedMeme.touchPointsY[selectedMeme.touchIndice] = event.y
                                selectedMeme.touchIndice = selectedMeme.touchIndice + 1
                        elseif ( event.phase == "ended" ) then
                                selectedMeme.moving=1
                                --É precisa para garantir uma rota "suave" (sem coisas a desaparecer antes do tempo)
                                -- print("size before: ",(# selectedMeme.touchPointsX))
                                -- print("last point before: ", selectedMeme.touchPointsX[# selectedMeme.touchPointsX])
                                smoothStart(selectedMeme.touchPointsX,selectedMeme.touchPointsY,selectedMeme)
                                addMiddlePoints(selectedMeme.touchPointsX,selectedMeme.touchPointsY)
                                -- print("size_after: ",(# selectedMeme.touchPointsX))
                                -- print("last point after: ", selectedMeme.touchPointsX[# selectedMeme.touchPointsX])
                                selectedMeme.touchIndice=(# selectedMeme.touchPointsX)
                                initilizeLine(selectedMeme,2.75,0.45,204,250,255)

                                --[[
                                local k
                                for k=1, selectedMeme.speed do

                                Runtime:addEventListener("enterFrame", selectedMeme)
                                end
                                --]]

                                Runtime:addEventListener("enterFrame", selectedMeme)                        
                eventListenerCount = eventListenerCount + 1

                                selectedMeme = nil
                        end
                end
        end


        function playerMemeTable:enterFrame ( event )
        
                if((#friendlyMemeTable) <= 0 and saved == 0 and (#playerMemeTable) <= 0) then
            Runtime:removeEventListener( "touch", Runtime)   
            eventListenerCount = eventListenerCount - 1
            Runtime:removeEventListener("enterFrame", self)   
            eventListenerCount = eventListenerCount - 1
                                                gameState.score = 2000
                                                removeAllListeners(playerMemeTable)
                                                removeAllListeners(friendlyMemeTable)
                                                removeAllListeners(enemyMemeTable)


                                                                audio.fadeOut({ time=1000 } )


                    director:changeScene("levelselection", "moveFromRight")
                    return
                    --[[
                        local winText=display.newText("YOU LOSE!!!!!", display.contentWidth*0.3, display.contentHeight*0.2, native.systemFont, 42)
                        winText:setReferencePoint( display.CenterReferencePoint ) 
                        winText:setTextColor(255, 255, 255)
                        --]]
                elseif((#friendlyMemeTable) <= 0 and saved >= 1 and (#playerMemeTable) <= 0) then
            Runtime:removeEventListener( "touch", Runtime)   
            eventListenerCount = eventListenerCount - 1
            Runtime:removeEventListener("enterFrame", self)   
            eventListenerCount = eventListenerCount - 1
                                             --   print("MEME_PLAYER_TABLE",(# playerMemeTable))
                                                removeAllListeners(playerMemeTable)
                                                removeAllListeners(friendlyMemeTable)
                                                removeAllListeners(enemyMemeTable)
                                                audio.fadeOut({ time=1000 } )


                                             --   print (eventListenerCount)
                                             --   resetField()
                                             endBeforeTheEnd()

            --director:changeScene("score_screen", "moveFromRight")
            return
                    --[[
                        local winText=display.newText("YOU WIN!!!!!", display.contentWidth*0.3, display.contentHeight*0.2, native.systemFont, 42)
                        winText:setReferencePoint( display.CenterReferencePoint ) 
                        winText:setTextColor(255, 255, 255)
                        --]]
                end
                if(randomEnemy >= 100) then
                        generateGhost(playerMemeTable[1])
                        randomEnemy=0
                end
                randomEnemy = randomEnemy+1

                for i,playerMeme in ipairs(playerMemeTable) do
                        -- if(scene == 60) then
                        --         createFirstSceneCats()
                        -- end

                        -- if(scene == 220) then
                        --         createSecondSceneCats()
                        -- end
                        -- if(scene == 300) then
                        --         createFirstSceneCats()
                        -- end

                        -- if(scene == 380) then
                        --         createSecondSceneCats()
                        -- end
                        -- if (scene < 381) then
                        --         scene = scene + 1
                        -- end
                        playerMeme=playerMemeTable[1]
                        for i,v in ipairs(enemyMemeTable) do
                                if(v.moving == 1 and v.image ~= nil) then
                                        if(distance(v.image.x,playerMeme.x,v.image.y,playerMeme.y) < 60) then
                                                playerMeme.life=0
                                                transition.to(playerMeme.image,{alpha=0.0,time=500})

                                        end
                                elseif(v.moving == 1) then
                                        if(distance(v.x,playerMeme.x,v.y,playerMeme.y) < 60) then
                                                playerMeme.life=0
                                                transition.to(playerMeme.image,{alpha=0.0,time=500})
                                        end
                                end
                        end

                        if(distance(playerMeme.x,church.x,playerMeme.y,church.y) < 60) then
                                --church.winText.alpha=1
                                saved = saved + 1
                                addToScore(playerMeme.life)

                                --transition.to(church.winText, {alpha=0.0,time=2000})
                                --transition.to(playerMeme, {alpha=0.0,time=2000})
                                Runtime:removeEventListener("enterFrame", playerMeme)
                                eventListenerCount = eventListenerCount - 1
                                transition.to(playerMeme.image,{alpha=0.0,time=500})

                --[[
                                playerMeme.myTextUp:removeSelf()
                                playerMeme.myTextUp=nil

                                playerMeme.myTextDown:removeSelf()
                                playerMeme.myTextDown=nil

                                playerMeme.myCircle:removeSelf()
                                playerMeme.myCircle=nil

                                playerMeme.lifeText:removeSelf()
                                playerMeme.lifeText=nil
                                --]]

                                removeMemeLine(playerMeme)

                                table.remove(playerMemeTable, i)
                                --playerMeme:removeEventListener( "touch", touchListener )    
                                --eventListenerCount = eventListenerCount - 1

                        elseif (playerMeme.life <= 0) then
                               Runtime:removeEventListener("enterFrame", playerMeme)                                                    
                               --eventListenerCount = eventListenerCount - 1

                --[[
                                playerMeme.myTextUp:removeSelf()
                                playerMeme.myTextUp=nil

                                playerMeme.myTextDown:removeSelf()
                                playerMeme.myTextDown=nil

                                playerMeme.myCircle:removeSelf()
                                playerMeme.myCircle=nil

                                playerMeme.lifeText:removeSelf()
                                playerMeme.lifeText=nil
                --]]

                                removeMemeLine(playerMeme)

                                table.remove(playerMemeTable, i)

                                --playerMeme:removeEventListener( "touch", touchListener )                                                        
                                eventListenerCount = eventListenerCount - 1
                                display.remove( playerMeme )                                                        
                                playerMeme = nil
                        else
                                --playerMeme.lifeText.text = playerMeme.life                                                        
                        end

                end

                for i,friendlyMeme in ipairs(friendlyMemeTable) do
                        if(distance(friendlyMeme.x,church.x,friendlyMeme.y,church.y) < 30) then   
                                Runtime:removeEventListener("enterFrame", friendlyMeme)                      
                                eventListenerCount = eventListenerCount - 1
                                church.winText.alpha=1
                                saved = saved + 1
                                addToScore(friendlyMeme.life)
                                transition.to(church.winText, {alpha=0.0,time=2000})
                                transition.to(friendlyMeme, {alpha=0.0,time=2000})
                                friendlyMeme.moving=0


                                friendlyMeme.lifeText:removeSelf()
                                friendlyMeme.lifeText=nil


                                removeMemeLine(friendlyMeme)
                                table.remove(friendlyMemeTable,i)

                                friendlyMeme.myCircle:removeSelf()
                                friendlyMeme.myCircle=nil
                        elseif (friendlyMeme.life <= 0) then
                                Runtime:removeEventListener("enterFrame", friendlyMeme)                                                    
                                eventListenerCount = eventListenerCount - 1

                                table.remove(friendlyMemeTable, i)

                                friendlyMeme.lifeText:removeSelf()
                                friendlyMeme.lifeText=nil

                                friendlyMeme.myCircle:removeSelf()
                                friendlyMeme.myCircle=nil

                                display.remove( friendlyMeme )                                     
                                friendlyMeme = nil
                        else
                                friendlyMeme.lifeText.text = friendlyMeme.life
                        end
                end
                
        --print(eventListenerCount)
        end

        -- createExplosion()

        church = createChurch("level1/spaceship_top.png",display.contentWidth-70, display.contentHeight*0.5)

        local playerMeme1 = createPlayerMeme("level1/astronaut_right.png", 50, display.contentHeight*0.5, 1)

        table.insert(playerMemeTable, playerMeme1)


        

        --print("MEME_PLAYER_TABLE OUSTSIDE",(# playerMemeTable))
        


        --color1 -> meio
        function createFirstSceneCats()
                color1={0,255,0}
                color2={255,0,0}
                color3={0,0,255}
                startx_one=math.random(display.contentWidth/3,2*display.contentWidth/3)
                endx_one=math.random(3*display.contentWidth/4,display.contentWidth)

                startx_two=math.random(display.contentWidth/3,2*display.contentWidth/4)
                endx_two=math.random(3*display.contentWidth/4,display.contentWidth)

               -- lala = createLaserEnemyMeme("level1/rocket.png",200,200)
               -- table.insert(enemyMemeTable,lala)

                if(math.abs(startx_one-startx_two) < 50) then
                        startx_two = display.contentWidth - startx_one
                end

              --  print ("SIZE BEFORE",# enemyMemeTable)
                local nyanCat1 = createNyanCat("level1/nyan_cat_original_right.png",1,color1,color2,color3,startx_one,-100,endx_one,display.contentHeight+100)
                -- table.insert(enemyMemeTable,nyanCat1)
                -- enemyMemeTable[# enemyMemeTable +1] = nyanCat1
                insertEnemy(nyanCat1)
             --   print ("SIZE BEFORE",# enemyMemeTable)


        end

        function createSecondSceneCats()
                color1={0,255,0}
                color2={255,0,0}
                color3={0,0,255}
                startx_one=math.random(display.contentWidth/3,2*display.contentWidth/3)
                endx_one=math.random(3*display.contentWidth/4,display.contentWidth)

                startx_two=math.random(display.contentWidth/3,2*display.contentWidth/4)
                endx_two=math.random(3*display.contentWidth/4,display.contentWidth)


                if(math.abs(startx_one-startx_two) < 50) then
                        startx_two = display.contentWidth - startx_one
                end

                local nyanCat2 = createNyanCat("level1/nyan_cat_original_right.png",1,color1,color2,color3,startx_two,display.contentHeight+100,endx_two,-100)
                -- enemyMemeTable[# enemyMemeTable +1] = nyanCat2
                insertEnemy(nyanCat2)
        end

        function generateGhost(target_meme)
                angle = math.random(-180,180)*(math.pi/180)
                --print ("ANGLE",angle)
                tmp_x = target_meme.x+200*math.cos(angle)
                tmp_y = target_meme.y+200*math.sin(angle)
                local image = "level1/ghost_left.png"
                print("DISTANCE TO MEME",distance(tmp_x,target_meme.x,tmp_y,target_meme.y))
                if(tmp_x < target_meme.x) then
                    image = "level1/ghost_right.png"
                end
                lala = createLaserEnemyMeme(image,tmp_x,tmp_y)
                --lala.index=(# enemyMemeTable) +1
                table.insert(enemyMemeTable,lala)
                
        end

        function endBeforeTheEnd()
                print("BEFORE THE END")
                victorySound = audio.loadSound("level1/victory.mp3")
                victorySoundChannel = audio.play( victorySound , {duration = 20000, onComplete = audio.dispose} )
                audio.setVolume(0.50, {channel = victorySoundChannel})
                
                local sheet1 = sprite.newSpriteSheet( "level1/level_end_dialog_lucas_sprite.png", 882, 177 )

                local spriteSet1 = sprite.newSpriteSet(sheet1, 1, 2)
                sprite.add( spriteSet1, "textbox", 1, 2, 250, 0 ) -- play 8 frames every 1000 ms

                local instance1 = sprite.newSprite( spriteSet1 )
                instance1:setReferencePoint( display.CenterReferencePoint )
                instance1.x,instance1.y=display.contentWidth/2,display.contentHeight*0.8
                instance1.xScale=0.8
                instance1.yScale=0.8

                instance1:prepare("textbox")
                instance1:play()

                local myclosure = function() 
                        sheet1:dispose()
                        return resetField( help ) 
                end
                timer.performWithDelay(10000, myclosure )
                print("AFTER THE END")
        end


        function resetField()
                Runtime:removeEventListener("enterFrame",playerMemeTable)
                transition.to(church,{rotation=church.angleBetween, onComplete=moveAway})
        end

        function moveAway(c)
                transition.to(church, {xScale=0.3,time=5000})
                transition.to(church, {yScale=0.3,time=5000})
                Runtime:addEventListener("enterFrame",church)
        end

        function comeBack(c)
                c.angleBetween = math.ceil(math.atan2(display.contentHeight/2, display.contentWidth/2) * 180 / math.pi) + 90
                
                transition.to(c,{x=display.contentWidth/2,y=display.contentHeight/2,xScale=0.01,yScale=0.01,time=2000, onComplete=bigShip})
        end

        function bigShip(c)
                Runtime:removeEventListener("enterFrame",c)
                c.alpha=0.0
            --    print("HEEEERE")
                bigShipDisplay=display.newImageRect("level1/spaceship_front_lucas.png",1920,1200)
                bigShipDisplay.xScale=0.00001
                bigShipDisplay.yScale=0.00001
                bigShipDisplay.x,bigShipDisplay.y=c.x,c.y
                transition.to(bigShipDisplay,{delay=2500,xScale=1,yScale=1,time=2000,onComplete=goDown})
        end

        function goDown(bs)
                transition.to(bs,{y=display.contentHeight+500,time=4000,onComplete=changeScene})
        end

        function changeScene(bs)
            --    print("GOING OUT!")
                director:changeScene("level3_intro", "moveFromRight")
        end



        --color1={255,255,255}
        --color2={255,0,0}
        --color3={0,0,255}

        -- local nyanCat1 = createNyanCat("level1/nyan_cat_france_right.png",0.5,color1,color2,color3,0,display.contentHeight,display.contentWidth,0)
        -- table.insert(enemyMemeTable,nyanCat1)

        -- local nyanCat2 = createNyanCat("level1/nyan_cat_france_right.png",0.5,color1,color2,color3,0,0,display.contentWidth,display.contentHeight)
        -- table.insert(enemyMemeTable,nyanCat2)


        -- local nyanCat2 = createNyanCat("level1/nyan_cat_france_left.png",0.5,color1,color2,color3,display.contentWidth,0,0,display.contentHeight)
        -- table.insert(enemyMemeTable,nyanCat2)

        -- local nyanCat2 = createNyanCat("level1/nyan_cat_france_left.png",0.5,color1,color2,color3,display.contentWidth,display.contentHeight,0,0)
        -- table.insert(enemyMemeTable,nyanCat2)

        --local nyanCat1 = createNyanCat("level1/nyan_cat_france_right.png",0.5,color1,color2,color3,0,display.contentHeight,display.contentWidth,0)
        --table.insert(enemyMemeTable,nyanCat1)

        drawBackground()
        Runtime:addEventListener( "touch", Runtime)   
    eventListenerCount = eventListenerCount + 1
    Runtime:addEventListener("enterFrame", playerMemeTable)     
    eventListenerCount = eventListenerCount + 1
        ------------------
        -- MUST return a display.newGroup()
        ------------------

        return localGroup

end


-----------------------------------------------------------------------------------------
-- HELPER FUNCTIONS
-----------------------------------------------------------------------------------------

function changePlayerImage(imageFile,tmp_meme)

        local temp_width = tmp_meme.image.width
        local temp_height = tmp_meme.image.height

        display.remove(tmp_meme.image)
        tmp_meme.image=display.newImageRect( imageFile, tmp_meme.image.width, tmp_meme.image.height )
        tmp_meme.image.x,tmp_meme.image.y=tmp_meme.x,tmp_meme.y
        tmp_meme.image.callback=tmp_meme
end

function distance( x1,x2,y1,y2 )
        local dx=x2-x1
        local dy=y2-y1
        local d=math.sqrt(math.pow(dx,2)+math.pow(dy,2))
        return d
end

function smoothStart(x_array, y_array, tmp_meme)
        if ((# x_array) > 1) then
                x_array[1]=tmp_meme.x
                y_array[1]=tmp_meme.y
                while((# x_array) < 2 or distance(x_array[1],x_array[2],y_array[1],y_array[2]) < tmp_meme.image.width) do
                        table.remove(x_array,2)
                        table.remove(y_array,2)
                        if ((# x_array) > 1) then
                                return
                        end
                end
        end
end

function insertEnemy(tmp_enemy)
        enemyMemeTable[# enemyMemeTable +1] = tmp_enemy
end

function addMiddlePoints(x_array, y_array)
        --still_not_ok=0
        i = 1
        --n_elements = table.getn(x_array)
        --print (n_elements)
        while(i < table.getn(x_array)) do
                if (distance(x_array[i],x_array[i+1],y_array[i],y_array[i+1]) > 20.0) then

                        middle_x=math.floor((x_array[i]+x_array[i+1])/2)
                        table.insert(x_array,i+1,middle_x)
                        middle_y=math.floor((y_array[i]+y_array[i+1])/2)
                        table.insert(y_array,i+1,middle_y)
                        --print("adding points!",middle_x,middle_y)
                        --still_not_ok=1
                        i = i-1
                end
                i = i+1
        end
        --if(still_not_ok==1) then
        --        print "here! "
        --        addMiddlePoints(x_array,y_array)
        --end
end

function removeAllListeners(tmp_table)
        for i,obj in ipairs(tmp_table) do
                if(obj.moving==1) then
                        obj.touchPointsX = {}
                        obj.touchPointsY = {}
                        obj.lineObject = {} 
                        obj.touchIndice = 1
                        obj.nextIndice = 1
                        obj.moving=0
                        if(obj.image ~= nil) then
                                transition.to(obj.image, {alpha=0.0,time=500,onComplete=display.remove})
                                Runtime:removeEventListener("enterFrame",obj)
                        else
                                transition.to(obj, {alpha=0.0,time=500,onComplete=display.remove})
                                if(obj.index ~= nil) then
                                 --   print("REMOVING TAP")
                                    Runtime:removeEventListener("tap",obj)
                                end
                        end
                else
                    obj.touchPointsX = {}
                    obj.touchPointsY = {}
                    obj.lineObject = {} 
                    obj.touchIndice = 1
                    obj.nextIndice = 1
                    obj.moving=0
                    if(obj.image ~= nil) then
                        transition.to(obj.image, {alpha=0.0,time=500,onComplete=display.remove})
                    else
                        transition.to(obj, {alpha=0.0,time=500,onComplete=display.remove})
                        if(obj.index ~= nil) then
                         --   print("REMOVING TAP")
                            Runtime:removeEventListener("tap",obj)
                        end
                    end
                end

               
        end
        for i,obj in ipairs(tmp_table) do
               table.remove(tmp_table,i)
        end
end

function removeEnemyMemes()
    for i,v in ipairs(enemyMemeTable) do
        if(v.image == nil) then
            if(v.x==-100 and v.y==-100) then
                table.remove(enemyMemeTable,i)
            end
        end
    end
end


function removeMemeLine(tmp_meme)
        while((# tmp_meme.lineObject) > 0) do
                destroyFirstLine(tmp_meme)
        end
end

--Function to add to score and update scoreText
function addToScore(i)
        score=score+i
        gamestate.data.selectedScore=score
        --scoreText.text = "Score    "..score.." "..saved
end

function memesMoving(memeTable)
        for i,v in memeTable do
                if (v.moving == 1) then
                        return true
                end
        end
        return false
end
