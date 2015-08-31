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

local mRand = math.random
local mCeil = math.ceil
local w, h =display.contentWidth, display.contentHeight
local selectedMeme = nil

--Start the score at 0
local score = 0
local saved = 0
local var_sound=0
local var_img=0
local eventListenerCount = 0

local sand, waves1, waves2, waves3, waves4, waves5, waves6
local waves1Tween, waves2Tween, waves3Tween, waves4Tween, waves5Tween, waves6Tween
local px=100
local py=100
new = function ()


        ------------------
        -- Groups
        ------------------

        local localGroup = display.newGroup()
        local backgroundGroup = display.newGroup()

        localGroup:insert(backgroundGroup)

        ------------------
        -- Your code here
        ------------------

        local playerMemeTable = {}
        local friendlyMemeTable = {}
        local enemyMemeTable = {}

		local selectedMeme = nil
		
		local church
        local posx
        local posy
        local drawBackground = function()
                --[[
                local randBackgroundFile = "level1/space" .. tostring( mRand( 1, 2 ) ) .. ".png"
                local gameBackground = display.newImageRect( randBackgroundFile, display.contentWidth, display.contentHeight )
                gameBackground:setReferencePoint( display.TopLeftReferencePoint )
                gameBackground.x = 0; gameBackground.y = 0
                --]]

                sand = display.newImageRect( "level2/sand.png", display.contentWidth, display.contentHeight )
                sand:setReferencePoint( display.TopLeftReferencePoint )
                sand.x = 0; sand.y = 0
                sand.alpha = 1.0

                waves1 = display.newImageRect( "level2/waves1.png", display.contentWidth, display.contentHeight )
                waves1:setReferencePoint( display.TopLeftReferencePoint )
                waves1.x = 0; waves1.y = 0
                waves1.alpha = 0.1

                waves2 = display.newImageRect( "level2/waves2.png", display.contentWidth, display.contentHeight )
                waves2:setReferencePoint( display.TopLeftReferencePoint )
                waves2.x = 0; waves2.y = 0
                waves2.alpha = 0.1

                waves3 = display.newImageRect( "level2/waves3.png", display.contentWidth, display.contentHeight )
                waves3:setReferencePoint( display.TopLeftReferencePoint )
                waves3.x = 0; waves3.y = 0
                waves3.alpha = 0.1

                waves4 = display.newImageRect( "level2/waves4.png", display.contentWidth, display.contentHeight )
                waves4:setReferencePoint( display.TopLeftReferencePoint )
                waves4.x = 0; waves4.y = 0
                waves4.alpha = 0.1

                waves5 = display.newImageRect( "level2/waves5.png", display.contentWidth, display.contentHeight )
                waves5:setReferencePoint( display.TopLeftReferencePoint )
                waves5.x = 0; waves5.y = 0
                waves5.alpha = 0.1

                waves6 = display.newImageRect( "level2/waves6.png", display.contentWidth, display.contentHeight )
                waves6:setReferencePoint( display.TopLeftReferencePoint )
                waves6.x = 0; waves6.y = 0
                waves6.alpha = 1.0

                backgroundGroup:insert( sand )
                backgroundGroup:insert( waves1 )
                backgroundGroup:insert( waves2 )
                backgroundGroup:insert( waves3 )
                backgroundGroup:insert( waves4 )
                backgroundGroup:insert( waves5 )
                backgroundGroup:insert( waves6 )                

                showWaves1()

               

                local sun = display.newImageRect( "level2/sun1.png",100,100)
                sun:setReferencePoint( display.TopLeftReferencePoint )
                sun.x =5
                sun.y =5
                sun.xScale=0.8
                sun.yScale=0.7
                 
                backgroundGroup:insert( sun )  
                local w,h = display.contentWidth, display.contentWidth
                 
                
                local function sunMove()
                        sun.x =5
                        sun.y =5
                        if (var_sound==0) then
                                media.playSound( "level2/sexy.mp3" )
                                transition.to( sun, { time=30000, alpha=1, x=(w-20), y=0, onComplete=sunMove } )
                                
                        end
                        
                 end


                 imgtest = display.newImageRect( "level2/xxx.png",50,50)

                print ("largura do ecra e ")
                print (display.contentWidth)
                imgtest.x =(display.contentWidth/4)+math.random (500)
                imgtest.y =(display.contentHeight/4)+math.random (100)
                
                imgtest.xScale=1.5
                imgtest.yScale=1.5
                backgroundGroup:insert( imgtest ) 

                local remove_imgtest = function( event )
                        if ( event.phase == "began" ) then
                                print ("Removi imagem teste")
                                display.remove(imgtest )
                        end
                end

                local function movetest()
                        print("Alterar coordenadas ma imagem teste")
                        imgtest:addEventListener( "touch", remove_imgtest )
                        posy=imgtest.y
                        posx=imgtest.x
                        transition.to( imgtest, { time=3000, alpha=1, x=px,y=py, onComplete=movetest} )

                end

                -- (1) move square to bottom right corner; subtract half side-length
                --     b/c the local origin is at the square's center; fade out square
                media.playSound( "level2/sexy.mp3" )

           

                transition.to( sun, { time=30000, alpha=1, x=(w-20), y=0, onComplete=sunMove } )
                transition.to( imgtest, { time=2500, alpha=1, x=(w-400), y=200, onComplete=movetest} ) 
                
        end

        local varp=0



        ------------------
      

        ----------------------

        
        local function aparece_profs( )
                local var_prof=math.random (3)

                
                if (var_prof==1) then
                        local lic = display.newImageRect( "level2/lic/lic.png",50,50)
                        local lic1 = display.newImageRect( "level2/lic/lic1.png",50,50)
                        local lic2 = display.newImageRect( "level2/lic/lic2.png",50,50)
                        lic.x =math.random (500)
                        lic.y =math.random (500)
                        lic1.x,lic2.x =lic.x
                        lic1.y,lic2.y = lic.y
                        local function aparece_lic( iii,varw,varh)
                                if (iii==1) then
                                        transition.to( transition.dissolve( lic1,lic2,1000, 300 ), { time=1000, alpha=0.001,varw,varh, onComplete=aparece_lic(2,varw,varh)})
                                else
                                         varp=1
                                        transition.to( transition.dissolve( lic2,lic1,1000, 300 ), { time=1000, alpha=0.001,varw,varh })
                                end     
                        end

                        if (var_img==0) then
                                print ("initial")
                                local varw=lic.x
                                local varh=lic.y
                                transition.to( transition.dissolve( lic,lic1,1000, 300 ), { time=1000, alpha=0.001,varw,varh,onComplete=aparece_lic(1,varw,varh) })
                                    
                        
                        end
                elseif (var_prof==2) then

                        local rui = display.newImageRect( "level2/rui/rui.png",50,50)
                        local rui1 = display.newImageRect( "level2/rui/rui1.png",50,50)
                        local rui2 = display.newImageRect( "level2/rui/rui2.png",50,50)


                        
                        rui.x =w-math.random (500)
                        rui.y =h-math.random (500)

                        rui1.x,rui2.x =rui.x
                        rui1.y,rui2.y =rui.y

                        local function aparece_rui( ii,varw,varh)
                                if (ii==1) then
                                        transition.to( transition.dissolve( rui1,rui2,1000, 300 ), { time=1000, alpha=0.001,varw,varh, onComplete=aparece_rui(2,varw,varh)})
                                else
                                         varp=1
                                        transition.to( transition.dissolve( rui2,rui1,1000, 300 ), { time=1000, alpha=0.001,varw,varh,})
                                end     
                        end

                        if (var_img==0) then
                                print ("initial")
                                local varw=rui.x
                                local varh=rui.y
                                transition.to( transition.dissolve( rui,rui1,1000, 300 ), { time=10000, alpha=0.001,varw,varh,onComplete=aparece_rui(1,varw,varh) })
                        end         
                else
                        local lucas = display.newImageRect( "level2/lucas/lucas.png",50,50)
                        local lucas1 = display.newImageRect( "level2/lucas/lucas1.png",50,50)
                        local lucas2 = display.newImageRect( "level2/lucas/lucas2.png",50,50)


                        
                        lucas.x =w-math.random (500)
                        lucas.y =h-math.random (500)

                        lucas1.x,lucas2.x =lucas.x
                        lucas1.y,lucas2.y = lucas.y

                        local function aparece_lucas( iii,varw,varh)
                                if (iii==1) then
                                        transition.to( transition.dissolve( lucas1,lucas2,1000, 300 ), { time=1000, alpha=0.001,varw,varh, onComplete=aparece_lucas(2,varw,varh)})
                                else
                                        varp=1
                                        transition.to( transition.dissolve( lucas2,lucas1,1000, 300 ), { time=1000, alpha=0.001,varw,varh })
                                end     
                        end

                        if (var_img==0) then
                                print ("initial")
                                local varw=lucas.x
                                local varh=lucas.y
                                transition.to( transition.dissolve( lucas,lucas1,1000, 300 ), { time=1000, alpha=0.001,varw,varh,onComplete=aparece_lucas(1,varw,varh) })
                        end         

                end  
        end

        touchListener = function( event )
                local meme = event.target

                if ( event.phase == "began" ) then
                        if(meme.moving==0) then
                                
                                meme.touchPointsX = {}
                                meme.touchPointsY = {}
                                meme.lineObject = {} 
                                meme.touchIndice = 1
                                meme.nextIndice = 1
                                selectedMeme = meme
                                aparece_profs( )


                                
                        else
                              
                                aparece_profs( )
                                Runtime:removeEventListener ("enterFrame", meme )
                                eventListenerCount = eventListenerCount - 1
                                removeMemeLine(meme)
                                meme.touchPointsX = {}
                                meme.touchPointsY = {}
                                meme.lineObject = {} 
                                meme.touchIndice = 1
                                meme.nextIndice = 1
                                selectedMeme = meme
                                
                        end
                end
              
        end


        function createChurch(imageFile,x,y)
                local tmpChurch = display.newImageRect( imageFile, 60, 60 )
                tmpChurch:setReferencePoint( display.CenterReferencePoint ) 
                tmpChurch.x, tmpChurch.y = x, y
                --church.winText=display.newText("Come in my child...", display.contentWidth*0.3, display.contentHeight*0.5, native.systemFont, 42)
                --church.winText:setReferencePoint( display.CenterReferencePoint ) 
                --church.winText:setTextColor(255, 255, 255)
                --church.winText.alpha=0.0
                --textGroup:insert(church.winText);

                return tmpChurch
        end

        function createPlayerMeme(imageFile, x, y, speed)

                local playerMeme = display.newImageRect( imageFile, 60, 60 )
                playerMeme:setReferencePoint( display.CenterReferencePoint ) 
                playerMeme.x, playerMeme.y = x, y
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
                                --teorema de pitágoras para aceitar velocidades > 1.0
                                dx_plus_dy=math.sqrt(math.pow(speed,2)+math.pow(speed,2))
                                -- está perto qb para assumir que chegou ao ponto
                                -- entao x e y passam a ser o ponto
                                
       
                                py=playerMeme.y
                                px=playerMeme.x
                                
                                if(distance(posx,py,imgtest.x,imgtest.y)<= 20) then
                                        print ("SEXSEXSEXSEX")
                                end


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
                end 

                return playerMeme
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
                                        --[[
                                        local offsetX = 0
                                        local offsetY = 0
                                        local newoffsetX = 0
                                        local newoffsetY = 0
                                        dx_plus_dy=math.sqrt(math.pow(speed,2)+math.pow(speed,2))
                                        while(distance(tmp_meme.touchPointsX[k]+offsetX , tmp_meme.touchPointsX[nexti],tmp_meme.touchPointsY[k]+offsetY , tmp_meme.touchPointsY[nexti])>dx_plus_dy) do
                                        newoffsetX=offsetX
                                        newoffsetY=offsetY
                                        --  print("distance: ",distance(tmp_meme.touchPointsX[k]+offsetX , tmp_meme.touchPointsX[nexti],tmp_meme.touchPointsY[k]+offsetY , tmp_meme.touchPointsY[nexti]))
                                        -- print("offsetX: ",offsetX)
                                        -- print("offsetY: ",offsetY)
                                        if(tmp_meme.touchPointsX[k]+offsetX < tmp_meme.touchPointsX[nexti]) then
                                        --       print("here, offsetx+speed")
                                        newoffsetX = offsetX+speed;
                                        elseif(tmp_meme.touchPointsX[k]+offsetX > tmp_meme.touchPointsX[nexti]) then
                                        --      print("here, offsetx-speed")
                                        newoffsetX = offsetX-speed;
                                        end
                                        if(tmp_meme.touchPointsY[k]+offsetY < tmp_meme.touchPointsY[nexti]) then
                                        --     print("here, offsety+speed")
                                        newoffsetY = offsetY+speed;
                                        elseif(tmp_meme.touchPointsY[k]+offsetY > tmp_meme.touchPointsY[nexti]) then
                                        --     print("here, offsety-speed")
                                        newoffsetY = offsetY-speed;
                                        end

                                        --print("drawin from: ",tmp_meme.touchPointsX[k]+offsetX, tmp_meme.touchPointsY[k]+offsetY," to: ", tmp_meme.touchPointsX[k]+newoffsetX, tmp_meme.touchPointsY[k]+newoffsetY)
                                        local tmp_line=display.newLine(tmp_meme.touchPointsX[k]+offsetX, tmp_meme.touchPointsY[k]+offsetY, tmp_meme.touchPointsX[k]+newoffsetX, tmp_meme.touchPointsY[k]+newoffsetY)
                                        tmp_line:setColor( 0, r, g, b)
                                        tmp_line.width=width
                                        tmp_line.alpha=alpha
                                        backgroundGroup:insert(tmp_line)
                                        table.insert(tmp_meme.lineObject,tmp_line)
                                        offsetX=newoffsetX
                                        offsetY=newoffsetY

                                        end
                                        local tmp_line=display.newLine(tmp_meme.touchPointsX[k]+offsetX, tmp_meme.touchPointsY[k]+offsetY, tmp_meme.touchPointsX[nexti], tmp_meme.touchPointsY[nexti])
                                        tmp_line:setColor( 0, r, g, b)
                                        tmp_line.width=width
                                        tmp_line.alpha=alpha
                                        backgroundGroup:insert(tmp_line)
                                        table.insert(tmp_meme.lineObject,tmp_line)



                                        print(tmp_meme.touchPointsX[k], tmp_meme.touchPointsY[k], tmp_meme.touchPointsX[nexti], tmp_meme.touchPointsY[nexti])
                                        --]]
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
                                print("size before: ",(# selectedMeme.touchPointsX))
                                print("last point before: ", selectedMeme.touchPointsX[# selectedMeme.touchPointsX])
                                smoothStart(selectedMeme.touchPointsX,selectedMeme.touchPointsY,selectedMeme)
                                addMiddlePoints(selectedMeme.touchPointsX,selectedMeme.touchPointsY)
                                print("size_after: ",(# selectedMeme.touchPointsX))
                                print("last point after: ", selectedMeme.touchPointsX[# selectedMeme.touchPointsX])
                                selectedMeme.touchIndice=(# selectedMeme.touchPointsX)
                                initilizeLine(selectedMeme,2.75,0.45,204,0,0)

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
                                                var_sound=1
                                                var_img=1
                		director:changeScene("score_screen", "moveFromRight")
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
                                                var_sound=1
                                                var_img=1
						director:changeScene("score_screen", "moveFromRight")
						return
                		--[[
                        local winText=display.newText("YOU WIN!!!!!", display.contentWidth*0.3, display.contentHeight*0.2, native.systemFont, 42)
                        winText:setReferencePoint( display.CenterReferencePoint ) 
                        winText:setTextColor(255, 255, 255)
                        --]]
                end

                for i,playerMeme in ipairs(playerMemeTable) do
                        if(distance(playerMeme.x,church.x,playerMeme.y,church.y) < 30) then
                                --church.winText.alpha=1
                                saved = saved + 1
                                addToScore(playerMeme.life)
                                transition.to(church.winText, {alpha=0.0,time=2000})
                                transition.to(playerMeme, {alpha=0.0,time=2000})
                                Runtime:removeEventListener("enterFrame", playerMeme)
                                eventListenerCount = eventListenerCount - 1

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
                                playerMeme:removeEventListener( "touch", touchListener )    
                                eventListenerCount = eventListenerCount - 1

                        elseif (playerMeme.life <= 0) then
                                Runtime:removeEventListener("enterFrame", playerMeme)                                                    
                                eventListenerCount = eventListenerCount - 1

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

                                playerMeme:removeEventListener( "touch", touchListener )                                                        
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

        church = createChurch("level1/church.png",display.contentWidth-70, display.contentHeight*0.5)

        local playerMeme1 = createPlayerMeme("level2/derpina.png", 50, display.contentHeight*0.7, 1.0)
        playerMeme1:addEventListener( "touch", touchListener )
		eventListenerCount = eventListenerCount + 1
        table.insert(playerMemeTable, playerMeme1)
        

        local playerMeme2 = createPlayerMeme("level2/derpina.png", 50, display.contentHeight*0.3, 1.0)
        playerMeme2:addEventListener( "touch", touchListener )
		eventListenerCount = eventListenerCount + 1
        table.insert(playerMemeTable, playerMeme2)


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

function showWaves1() 
        waves6Tween = transition.to( waves6, { time=3000, alpha=0.25 })
        waves1Tween = transition.to( waves1, { time=3000, alpha=1.0, onComplete=showWaves2 })
end

function showWaves2() 
        waves1Tween = transition.to( waves1, { time=3000, alpha=0.25 })
        waves2Tween = transition.to( waves2, { time=3000, alpha=1.0, onComplete=showWaves3 })
end

function showWaves3() 
        waves2Tween = transition.to( waves2, { time=3000, alpha=0.25 })
        waves3Tween = transition.to( waves3, { time=3000, alpha=1.0, onComplete=showWaves4 })
end

function showWaves4() 
        waves3Tween = transition.to( waves3, { time=3000, alpha=0.25 })
        waves4Tween = transition.to( waves4, { time=3000, alpha=1.0, onComplete=showWaves5 })
end

function showWaves5() 
        waves4Tween = transition.to( waves4, { time=3000, alpha=0.25 })
        waves5Tween = transition.to( waves5, { time=3000, alpha=1.0, onComplete=showWaves6 })
end

function showWaves6() 
        waves5Tween = transition.to( waves5, { time=3000, alpha=0.25 })
        waves6Tween = transition.to( waves6, { time=3000, alpha=1.0, onComplete=showWaves1 })
end


-----------------------------------------------------------------------------------------
-- HELPER FUNCTIONS
-----------------------------------------------------------------------------------------
function distance( x1,x2,y1,y2 )
        local dx=x2-x1
        local dy=y2-y1
        local d=math.sqrt(math.pow(dx,2)+math.pow(dy,2))
        return d
end

function smoothStart(x_array, y_array, tmp_meme)
        x_array[1]=tmp_meme.x
        y_array[1]=tmp_meme.y
        while(distance(x_array[1],x_array[2],y_array[1],y_array[2]) < 60 or (# x_array) < 2) do
                table.remove(x_array,2)
                table.remove(y_array,2)
        end
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
