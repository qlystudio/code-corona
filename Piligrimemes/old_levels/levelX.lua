-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local director = require ("director")
local scene = storyboard.newScene()



--include Corona's "physics" library
--local physics = require "physics"
--physics.start(); physics.pause()

--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5

-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

local gameGroup = display.newGroup()
local backgroundGroup = display.newGroup()
local textGroup = display.newGroup()
local lifeGroup = display.newGroup()
local memeGroup = display.newGroup()
local touchListener
local church

local selectedMeme = nil

-- tables which will contain all the game's memes. Useful, for instance, for collision checking.
local playerMemeTable = {}
local friendlyMemeTable = {}
local enemyMemeTable = {}


--------------------------------------------

--Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--Create the background and make it blue
local bg = display.newRect( 0, 0, 0, 0 )
bg:setFillColor( 150, 180, 200 )

--Start the score at 0
local score = 0
local saved = 0

--Create score text and make it dark gray
local scoreText = display.newText(score, 700, 20, native.systemFont, 24)
scoreText:setTextColor( 200, 250, 250, 255 ) 



--------------------------------------------------------------------
--------------------------------------------------------------------



--------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )

        gameGroup:insert( backgroundGroup )
        gameGroup:insert( textGroup )
	gameGroup:insert( lifeGroup )
        gameGroup:insert( memeGroup )

        

        local background = display.newRect( 0, 0, screenW, screenH )
        background:setFillColor( 128 )
        addToScore(0)

        --This needs to be inserted before the lines due to z-order (the lines would be below the background otherwise)
        --Most recent will be on top always!
        backgroundGroup:insert( background )




        -- PLAYER MEMES INIT

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
                        else
                                Runtime:removeEventListener ( "enterFrame", meme )
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

        church = createChurch("church.png",display.contentWidth-70, display.contentHeight*0.5)

        local playerMeme1 = createPlayerMeme("smiley.png", 50, 50, 1.0)
        playerMeme1:addEventListener( "touch", touchListener )
        local playerMeme2 = createPlayerMeme("smiley_coin.png", 50, 150, 1.0)
        playerMeme2:addEventListener( "touch", touchListener )

        table.insert(playerMemeTable, playerMeme1)
        table.insert(playerMemeTable, playerMeme2)

        function playerMemeTable:enterFrame ( event )

                if((#friendlyMemeTable) <= 0 and saved == 0 and (#playerMemeTable) <= 0) then
                        local winText=display.newText("YOU LOSE!!!!!", display.contentWidth*0.3, display.contentHeight*0.5, native.systemFont, 42)
                        winText:setReferencePoint( display.CenterReferencePoint ) 
                        winText:setTextColor(255, 255, 255)
                elseif((#friendlyMemeTable) <= 0 and saved == 1 and (#playerMemeTable) <= 0) then
                        local winText=display.newText("YOU WIN!!!!!", display.contentWidth*0.3, display.contentHeight*0.5, native.systemFont, 42)
                        winText:setReferencePoint( display.CenterReferencePoint ) 
                        winText:setTextColor(255, 255, 255)
                end

                


                for i,playerMeme in ipairs(playerMemeTable) do
                        if(distance(playerMeme.x,church.x,playerMeme.y,church.y) < 30) then
                                church.winText.alpha=1
                                addToScore(playerMeme.life)
                                transition.to(church.winText, {alpha=0.0,time=2000})
                                transition.to(playerMeme, {alpha=0.0,time=2000})
                                Runtime:removeEventListener("enterFrame", playerMeme)

                                playerMeme.myTextUp:removeSelf()
                                playerMeme.myTextUp=nil

                                playerMeme.myTextDown:removeSelf()
                                playerMeme.myTextDown=nil

                                playerMeme.myCircle:removeSelf()
                                playerMeme.myCircle=nil

                                saved = 1

                                playerMeme.lifeText:removeSelf()
                                playerMeme.lifeText=nil

                                removeMemeLine(playerMeme)

                                table.remove(playerMemeTable, i)
                                playerMeme:removeEventListener( "touch", touchListener )    

                        elseif (playerMeme.life <= 0) then
                                Runtime:removeEventListener("enterFrame", playerMeme)                                                    

                                playerMeme.myTextUp:removeSelf()
                                playerMeme.myTextUp=nil

                                playerMeme.myTextDown:removeSelf()
                                playerMeme.myTextDown=nil

                                playerMeme.myCircle:removeSelf()
                                playerMeme.myCircle=nil

                                playerMeme.lifeText:removeSelf()
                                playerMeme.lifeText=nil

                                removeMemeLine(playerMeme)

                                table.remove(playerMemeTable, i)

                                playerMeme:removeEventListener( "touch", touchListener )                                                        
                                display.remove( playerMeme )                                                        
                                playerMeme = nil
                        else
                                playerMeme.lifeText.text = playerMeme.life                                                        
                        end

                end

                for i,friendlyMeme in ipairs(friendlyMemeTable) do
                        if(distance(friendlyMeme.x,church.x,friendlyMeme.y,church.y) < 30) then   
                                Runtime:removeEventListener("enterFrame", friendlyMeme)                      
                                church.winText.alpha=1
                                addToScore(friendlyMeme.life)
                                transition.to(church.winText, {alpha=0.0,time=2000})
                                transition.to(friendlyMeme, {alpha=0.0,time=2000})
                                friendlyMeme.moving=0

                                saved = 1

                                friendlyMeme.lifeText:removeSelf()
                                friendlyMeme.lifeText=nil

                                
                                removeMemeLine(friendlyMeme)
                                table.remove(friendlyMemeTable,i)

                                friendlyMeme.myCircle:removeSelf()
                                friendlyMeme.myCircle=nil
                        elseif (friendlyMeme.life <= 0) then
                                Runtime:removeEventListener("enterFrame", friendlyMeme)                                                    

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
        end
    
        Runtime:addEventListener("enterFrame", playerMemeTable)
        


        -- FRIENDLY MEMES INIT

        local friendlyMeme1 = createFriendlyMeme("trollface.png")
        
        table.insert(friendlyMemeTable, friendlyMeme1)



        -- ENEMY MEMES INIT

        -- since enemy memes are actively doing something, we'll probably have to implement
        -- an enterFrame listener that keeps running and checking if something entered its midst.
        -- That checking can be done by iterating over the playerMemeTable and friendlyMemeTable.


        --Since memes display different abilities, they should be created by distinct functions
        local enemyMeme1 = createLaserEnemyMeme("trollface.png", 200, 200)
        local enemyMeme2 = createAoeStopEnemyMeme("trollface.png",400,110)
        Runtime:addEventListener ( "enterFrame", enemyMeme1 )
        

        table.insert(enemyMemeTable, enemyMeme1)
        table.insert(enemyMemeTable, enemyMeme2)


        Runtime:addEventListener( "touch", Runtime)        
end


function createChurch(imageFile,x,y)
        local church = display.newImageRect( imageFile, 60, 60 )
        church:setReferencePoint( display.CenterReferencePoint ) 
        church.x, church.y = x, y
        church.winText=display.newText("Come in my child...", display.contentWidth*0.3, display.contentHeight*0.5, native.systemFont, 42)
        church.winText:setReferencePoint( display.CenterReferencePoint ) 
        church.winText:setTextColor(255, 255, 255)
        church.winText.alpha=0.0
        textGroup:insert(church.winText);



        return church
end

-- creates a plain ol' player meme with the given args
function createPlayerMeme(imageFile, x, y, speed)
	
        local playerMeme = display.newImageRect( imageFile, 60, 60 )
        playerMeme:setReferencePoint( display.CenterReferencePoint ) 
        playerMeme.x, playerMeme.y = x, y
        playerMeme.speed = speed
        playerMeme.life = 250
        playerMeme.moving = 0
        playerMeme.lifeText=display.newText(playerMeme.life, playerMeme.x,playerMeme.y, native.systemFontBold, 10)
        playerMeme.lifeText.x, playerMeme.lifeText.y = playerMeme.x+50,playerMeme.y

		playerMeme.myCircle = display.newCircle( x, y, 32 )
		playerMeme.myCircle.x, playerMeme.myCircle.y = playerMeme.x,playerMeme.y
		playerMeme.myCircle:setFillColor(0, 0, 0, 0) 
		playerMeme.myCircle.strokeWidth = 5
		playerMeme.myCircle:setStrokeColor(51, 204, 51)
		
		--local baloon1 = display.newImageRect("Baloon.png",  90,50)
		--baloon1.x, baloon1.y = playerMeme.x+60,playerMeme.y-30
		--textGroup:insert(baloon1)
		
		playerMeme.myTextUp=display.newText("Pick Me, Pick Me!!!", playerMeme.x,playerMeme.y-40, native.systemFontBold, 10)
		playerMeme.myTextDown=display.newText("Or, I WILL DIE!!!", playerMeme.x,playerMeme.y+40, native.systemFontBold, 10)
		playerMeme.myTextUp.x, playerMeme.myTextUp.y = playerMeme.x,playerMeme.y-40
		playerMeme.myTextDown.x, playerMeme.myTextDown.y = playerMeme.x,playerMeme.y+40
		playerMeme.myTextUp:setTextColor(255, 255, 255)
		playerMeme.myTextDown:setTextColor(255, 255, 255)
		textGroup:insert(playerMeme.myTextUp)
		textGroup:insert(playerMeme.myTextDown)
		lifeGroup:insert(playerMeme.myCircle)

        function playerMeme:enterFrame ( event )
                local speed = playerMeme.speed

                if ( playerMeme.nextIndice < playerMeme.touchIndice ) then
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
                                                friendlyMeme.moving=1
                                                --table.remove(friendlyMemeTable,k)
                                        end
                                end
                        end
						
						--baloon1.x, baloon1.y = playerMeme.x+60,playerMeme.y-30
						playerMeme.myTextUp.x, playerMeme.myTextUp.y = playerMeme.x,playerMeme.y-40
						playerMeme.myTextDown.x, playerMeme.myTextDown.y = playerMeme.x,playerMeme.y+40
						playerMeme.myCircle.x, playerMeme.myCircle.y = playerMeme.x,playerMeme.y
                                                playerMeme.lifeText.x, playerMeme.lifeText.y = playerMeme.x+50,playerMeme.y
                else
                        --chegou ao fim do caminho.
                        playerMeme.touchPointsX = {}
                        playerMeme.touchPointsY = {}
                        playerMeme.lineObject = {} 
                        playerMeme.touchIndice = 1
                        playerMeme.nextIndice = 1
                        playerMeme.moving=0
	
						
                        Runtime:removeEventListener("enterFrame", playerMeme)                            
                end
        end 

        return playerMeme
end

-- TODO: extremely hardcoded function. Perhaps we should put some args here...
function createFriendlyMeme(imageFile)
        local friendlyMeme = display.newImageRect( imageFile, 60, 60 )
        friendlyMeme:setReferencePoint( display.CenterReferencePoint ) 
        friendlyMeme.speed=1.0
        friendlyMeme.touchPointsX = {411,411,411,411,410,410,410,409,409,409,409,409,409,409,409,410,413,416,421,426,433,443,457,480,521,565,611,658,708,757,803}
        friendlyMeme.touchPointsY = {284,283,282,276,269,257,241,212,190,175,165,162,160,159,160,160,160,160,160,160,160,160,162,166,173,183,194,206,218,226,235}
        addMiddlePoints(friendlyMeme.touchPointsX,friendlyMeme.touchPointsY)
        friendlyMeme.x, friendlyMeme.y = friendlyMeme.touchPointsX[1], friendlyMeme.touchPointsY[1]
        friendlyMeme.touchIndice=table.getn(friendlyMeme.touchPointsX)
        friendlyMeme.nextIndice = 1
        friendlyMeme.moving = 0
        friendlyMeme.life=250
        friendlyMeme.lineObject={}

        friendlyMeme.lifeText=display.newText(friendlyMeme.life, friendlyMeme.x,friendlyMeme.y, native.systemFontBold, 10)
        friendlyMeme.lifeText.x, friendlyMeme.lifeText.y = friendlyMeme.x+50,friendlyMeme.y


		friendlyMeme.myCircle = display.newCircle( 0, 0, 32 )
		friendlyMeme.myCircle.x, friendlyMeme.myCircle.y = friendlyMeme.x,friendlyMeme.y
		friendlyMeme.myCircle:setFillColor(0, 0, 0, 0) 
		friendlyMeme.myCircle.strokeWidth = 5
		friendlyMeme.myCircle:setStrokeColor(50, 50, 50)

        initilizeLine(friendlyMeme,10.0,0.7,100,100,100)

        function friendlyMeme:enterFrame ( event )
                local speed = friendlyMeme.speed
                --print ("MOVING: ",friendlyMeme.moving)
                if ( friendlyMeme.nextIndice < friendlyMeme.touchIndice) then
                        --teorema de pitágoras para aceitar velocidades > 1.0
                        dx_plus_dy=math.sqrt(math.pow(speed,2)+math.pow(speed,2))
                        -- está perto qb para assumir que chegou ao ponto
                        -- entao x e y passam a ser o ponto
                        if(distance(friendlyMeme.x,friendlyMeme.touchPointsX[friendlyMeme.nextIndice],friendlyMeme.y,friendlyMeme.touchPointsY[friendlyMeme.nextIndice]) <= dx_plus_dy) then
                                --display.remove(friendlyMeme.lineObject[friendlyMeme.nextIndice])
                               -- display.remove(friendlyMeme.lineObject[1])
                                --table.remove(friendlyMeme.lineObject,1)
                                destroyFirstLine(friendlyMeme)
                                friendlyMeme.nextIndice = friendlyMeme.nextIndice+1
                                --nao está, portanto continua a tentar uma aproximação gradual com velocidade "speed"
                                --em ambos os eixos
                        else
                                local dx = math.sqrt(math.pow(friendlyMeme.x-friendlyMeme.touchPointsX[friendlyMeme.nextIndice],2))
                                --print ("dx:",dx)
                                local dy = math.sqrt(math.pow(friendlyMeme.y-friendlyMeme.touchPointsY[friendlyMeme.nextIndice],2))
                                --print ("dy:",dy)
                                if ( friendlyMeme.x < friendlyMeme.touchPointsX[friendlyMeme.nextIndice] and dx > speed) then
                                        friendlyMeme.x=friendlyMeme.x+speed
                                elseif (friendlyMeme.x > friendlyMeme.touchPointsX[friendlyMeme.nextIndice] and dx > speed) then
                                        friendlyMeme.x=friendlyMeme.x-speed
                                end
                                if ( friendlyMeme.y < friendlyMeme.touchPointsY[friendlyMeme.nextIndice] and dy > speed) then
                                        friendlyMeme.y=friendlyMeme.y+speed
                                elseif (friendlyMeme.y > friendlyMeme.touchPointsY[friendlyMeme.nextIndice] and dy > speed) then
                                        friendlyMeme.y=friendlyMeme.y-speed
                                end

				friendlyMeme.myCircle.x, friendlyMeme.myCircle.y = friendlyMeme.x,friendlyMeme.y
                                friendlyMeme.lifeText.x, friendlyMeme.lifeText.y = friendlyMeme.x+50,friendlyMeme.y

                        end
                else
                        --chegou ao fim do caminho.
                        friendlyMeme.touchPointsX = {}
                        friendlyMeme.touchPointsY = {}
                        friendlyMeme.lineObject = {} 
                        friendlyMeme.touchIndice = 1
                        friendlyMeme.nextIndice = 1
                        friendlyMeme.moving=0

                        Runtime:removeEventListener("enterFrame", friendlyMeme)                            
                end
        end

        return friendlyMeme
end

function createAoeStopEnemyMeme(imageFile,x,y)
        local AoeMeme = display.newImageRect( imageFile, 60, 60 )
        AoeMeme:setReferencePoint( display.CenterReferencePoint )
        AoeMeme.x, AoeMeme.y = x, y
        --AoeMeme.followRadius = 250
        AoeMeme.attackRadius = 150
        AoeMeme.timer=0
        AoeMeme.waiting_time=180
        AoeMeme.speed=0.0

		AoeMeme.myCircle = display.newCircle( 0, 0, 32 )
		AoeMeme.myCircle.x, AoeMeme.myCircle.y = AoeMeme.x,AoeMeme.y
		AoeMeme.myCircle:setFillColor(0, 0, 0, 0) 
		AoeMeme.myCircle.strokeWidth = 5
		AoeMeme.myCircle:setStrokeColor(204, 51, 51)

        AoeMeme.rangeCircle=display.newCircle(AoeMeme.x, AoeMeme.y,AoeMeme.attackRadius)
        AoeMeme.rangeCircle:setFillColor(255,215,34)
        AoeMeme.rangeCircle.alpha = 0.0
        AoeMeme.hitText=display.newText("Help me!\nI'm stuck!", AoeMeme.x, AoeMeme.y-40, native.systemFont, 11)
        AoeMeme.hitText:setTextColor(255, 255, 255)
        AoeMeme.hitText.alpha=0
        textGroup:insert(AoeMeme.hitText)
        backgroundGroup:insert(AoeMeme.rangeCircle)
        Runtime:addEventListener ( "enterFrame", AoeMeme )

        function AoeMeme:enterFrame ( event )
                if(AoeMeme.timer>0) then
                        AoeMeme.timer=AoeMeme.timer-1
                else
                        AoeMeme.rangeCircle.alpha = 0.1
                        transition.to(AoeMeme.rangeCircle, {alpha=0.0,time=1000})
                        AoeMeme.timer=AoeMeme.waiting_time
                        for i,playerMeme in ipairs(playerMemeTable) do
                                if (distance(AoeMeme.x, playerMeme.x, AoeMeme.y, playerMeme.y) < AoeMeme.attackRadius) then
                                        addToScore(-50)
                                        print ("estou a retirar vida")
                                        playerMeme.life = playerMeme.life-50
                                        print (playerMeme.life)
                                        removeMemeLine(playerMeme)
                                        playerMeme.touchPointsX = {}
                                        playerMeme.touchPointsY = {}
                                        playerMeme.lineObject = {} 
                                        playerMeme.touchIndice = 1
                                        playerMeme.nextIndice = 1
                                        playerMeme.moving=0
                                end
                        end
                        for i,friendlyMeme in ipairs(friendlyMemeTable) do
                                if (distance(AoeMeme.x, friendlyMeme.x, AoeMeme.y, friendlyMeme.y) < AoeMeme.attackRadius) then
                                        
                                        removeMemeLine(friendlyMeme)
                                        print( friendlyMeme._functionListeners )

                                        if ( friendlyMeme._functionListeners == nil or friendlyMeme._functionListeners.touch == nil) then
                                            friendlyMeme:addEventListener( "touch", touchListener )
                                        end

                                        friendlyMeme.life = friendlyMeme.life-50

                                        AoeMeme.hitText.x, AoeMeme.hitText.y = friendlyMeme.x,friendlyMeme.y-40
                                        AoeMeme.hitText.alpha=1
                                        transition.to(AoeMeme.hitText, {alpha=0.0,time=2000})

                                        friendlyMeme.touchPointsX = {}
                                        friendlyMeme.touchPointsY = {}
                                        friendlyMeme.lineObject = {} 
                                        friendlyMeme.touchIndice = 1
                                        friendlyMeme.nextIndice = 1
                                        friendlyMeme.moving=0        
                                end

                        end
                end

        end
end

function createLaserEnemyMeme(imageFile, x, y)
        local enemyMeme = display.newImageRect( imageFile, 60, 60 )
        enemyMeme:setReferencePoint( display.CenterReferencePoint )
        enemyMeme.x, enemyMeme.y = x, y
        enemyMeme.startX, enemyMeme.startY = x, y
        enemyMeme.followRadius = 150
        enemyMeme.attackRadius = 100
        enemyMeme.speed=0.25
		
		enemyMeme.myCircle = display.newCircle( 0, 0, 32 )
		enemyMeme.myCircle.x, enemyMeme.myCircle.y = enemyMeme.x,enemyMeme.y
		enemyMeme.myCircle:setFillColor(0, 0, 0, 0) 
		enemyMeme.myCircle.strokeWidth = 5
		enemyMeme.myCircle:setStrokeColor(204, 51, 51)

        enemyMeme.followCircle=display.newCircle(enemyMeme.x,enemyMeme.y,enemyMeme.followRadius)
        enemyMeme.followCircle:setFillColor(50,205,50)
        enemyMeme.followCircle.alpha = 0.1
        enemyMeme.attackCircle=display.newCircle(enemyMeme.x,enemyMeme.y,enemyMeme.attackRadius)
        enemyMeme.attackCircle:setFillColor(178,34,34)
        enemyMeme.attackCircle.alpha = 0.1

        backgroundGroup:insert(enemyMeme.followCircle)
        backgroundGroup:insert(enemyMeme.attackCircle)


        function enemyMeme:getTarget (radius) 
                
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

                for i,friendlyMeme in ipairs(friendlyMemeTable) do
                        if (distance(enemyMeme.x, friendlyMeme.x, enemyMeme.y, friendlyMeme.y) < radius) then
                                enemyMeme.target = friendlyMeme
                                return                        
                        end
                end

                enemyMeme.target = nil
        end

        function enemyMeme:moveTo (x, y) 
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
               enemyMeme.followCircle.x=enemyMeme.x
               enemyMeme.followCircle.y=enemyMeme.y
               enemyMeme.attackCircle.x=enemyMeme.x
               enemyMeme.attackCircle.y=enemyMeme.y
        end

        function enemyMeme:enterFrame ( event )
                enemyMeme:getTarget(enemyMeme.followRadius)

                if (enemyMeme.laser ~= nil) then
                        enemyMeme.laser:removeSelf()
                        enemyMeme.laser = nil
                end

                if (enemyMeme.target ~= nil) then

                        enemyMeme:moveTo(enemyMeme.target.x, enemyMeme.target.y)

                        if (distance(enemyMeme.x, enemyMeme.target.x, enemyMeme.y, enemyMeme.target.y) < enemyMeme.attackRadius) then
                                enemyMeme.laser = display.newLine( enemyMeme.x, enemyMeme.y, enemyMeme.target.x, enemyMeme.target.y )
                                enemyMeme.laser:setColor(128, 0, 0)
                                enemyMeme.laser.width = 5
                                enemyMeme.target.life = enemyMeme.target.life - 1
                                --LINE NEEDED FOR WHEN THE EVEN IS NOT RUNNING ON THE MEME

                        end

                else
                        enemyMeme:moveTo(enemyMeme.startX, enemyMeme.startY)
                end

				enemyMeme.myCircle.x, enemyMeme.myCircle.y = enemyMeme.x,enemyMeme.y
        end

        return enemyMeme
end



--initializes a movement line
--THIS CODE WAS HEAVILY BASED ON THE MARTIAN CONTROL ONE
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
                        addMiddlePoints(selectedMeme.touchPointsX,selectedMeme.touchPointsY)
                        print("size_after: ",(# selectedMeme.touchPointsX))
                        print("last point after: ", selectedMeme.touchPointsX[# selectedMeme.touchPointsX])
                        selectedMeme.touchIndice=(# selectedMeme.touchPointsX)
                        initilizeLine(selectedMeme,2.75,0.45,204,250,255)
                        
                        --[[
                        local k
                        for k=1, selectedMeme.speed do

                                Runtime:addEventListener("enterFrame", selectedMeme)
                        end
                        --]]

                        Runtime:addEventListener("enterFrame", selectedMeme)                        

                        selectedMeme = nil
                end
        end
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

        scoreText.text = "Score    "..score.." "..saved
end

function memesMoving(memeTable)
        for i,v in memeTable do
                if (v.moving == 1) then
                        return true
                end
        end
        return false
end




-----------------------------------------------------------------------------------------
-- SCENE EVENTS
-----------------------------------------------------------------------------------------

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
        local gameGroup = self.view

        --	physics.start()

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
        local gameGroup = self.view

        --	physics.stop()

end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
        local gameGroup = self.view

        --	package.loaded[physics] = nil
        --	physics = nil
end


-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene
