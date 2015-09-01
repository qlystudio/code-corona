-- INICIA LIB DE STORYBOARD
local storyboard = require("storyboard")
local scene = storyboard.newScene()

-- INICIA LIB DE FISICA
local physics = require("physics")
physics.start()
physics.setGravity(0, 0.98)

-- VARIAVEIS DA CENA
local background
local background2
local ship
local pause

local bullet
local bulletTrans

local enemyTrans
local enemy

local scorePoints
local scoreLifes
local totalPoints
local totalLifes

local explosionAnimation
local shotSound
local explosionSound

local lifeAnimation
local pointAnimation
local buffAnimation
local buffTrans
local buffSound
local buffPointsCount
local buffCollectSound

local function onCompleteBuff(event)

	if(buffTrans) then buffTrans.isActive = false end

	if(lifeAnimation == nil) then return false end

	lifeAnimation.x = 0
	pointAnimation.x = 0
	
	lifeAnimation.y = -display.contentHeight
	pointAnimation.y = -display.contentHeight

end

local function updatePoints(p, fromBuff)

	-- AUMENTA/DIMINUI NUMERO DE PONTOS
	totalPoints = totalPoints + p
	
	-- AUMENTA/DINIMUI CONTADOR PARA BUFF
	if not (fromBuff) then buffPointsCount = buffPointsCount + p end

	-- VARIAVEL DE PONTOS DEVE SER NO MINIMO 0 (zero)
	if(totalPoints < 0) then totalPoints = 0 end
	
	-- REMOVE TEXO DE PONTOS DA MEMORIA
	if(scorePoints ~= nil) then scorePoints:removeSelf() end
	
	-- RECRIA TEXTO DE PONTOS, COM NOVO VALOR
	scorePoints = display.newText("Pontos: "..totalPoints, 0, 0, native.systemFontBold, 30)
	scorePoints:setReferencePoint(display.TopLeftReferencePoint)
	scorePoints.x = 25; scorePoints.y = 20

	-- VERIFICA CONTADOR PARA BUFF
	if (buffPointsCount >= 50) then
		
		-- REINICIA CONTADOR PARA PROXIMO BUFF
		buffPointsCount = 0
		
		-- DEFINE QUAL BUFF SERA CONCEDIDO (VIDA OU PONTOS)
		-- BUFF PADRAO E PONTOS, POIS O MAX DE VIDA E 3
		local buffDefinition = 2
		
		-- SE O NUMERO DE VIDAS AINDA NAO ATINGIU O MAX, ENTAO PODE RECEBER BUFF
		if(totalLifes < 3) then buffDefinition = math.random(1, 2) end
		
		if(buffDefinition == 1) then
			-- BUFF DE VIDA
			buffAnimation = lifeAnimation
		else
			-- BUFF DE PONTOS
			buffAnimation = pointAnimation
		end

		-- MONTA TRANSICAO DO BUFF NA TELA
		buffAnimation:setReferencePoint(display.TopLeftReferencePoint)
		
		-- MONTA TRANSICAO DO BUFF DENTRO DE UM TIMER, POIS
		-- PODE ESTA FUNCTION PODE TER SIDO EXECUTADA DE UM HANDLER DE COLISAO
		-- QUE ALTERA POSICAO DE OBJETOS DURANTE O PROCESSO DE COLISAO, O QUE NAO E 
		-- PERMITIDO NO CORONA
		timer.performWithDelay(1, function() 
			buffAnimation.x = math.random(0, display.contentWidth - buffAnimation.contentWidth);
			buffAnimation.y = -display.contentHeight;
		 
			buffTrans = transition.to(
							buffAnimation, {time=3000, 
							x=buffAnimation.x, 
							y=display.contentHeight, 
							onComplete=onCompleteBuff})

			buffTrans.time = 3000
			buffTrans.x = buffAnimation.x
			buffTrans.y = display.contentHeight
			buffTrans.isActive = true
			media.playEventSound(buffSound)
		end)
		
	end

end

local function updateLifes(l)

	-- VERIFICA SE PARAMETRO DE INCREMENTO E NULO
	-- E SE JOGADOR JA TEM O MAX DE VIDAS PERMITIDO (3)
	if(l ~= nil and totalLifes < 3) then
		
		-- ADICIONA/SUBTRAI NUMERO DE VIDAS, DE ACORDO COM PARAM (BUFF)
		totalLifes = totalLifes + l

	else
		
		-- CAMINHO NORMAL, DIMINUI NUMERO DE VIDAS
		totalLifes = totalLifes - 1

	end

	-- REMOVE TEXTO DE VIDAS DA MEMORIA
	if(scoreLifes) then scoreLifes:removeSelf() end
	
	-- RECRIA TEXTO DE VIDAS, COM NOVO VALOR
	scoreLifes = display.newText("Vidas: "..totalLifes, 0, 0, native.systemFontBold, 30)
	scoreLifes:setReferencePoint(display.TopRightReferencePoint)
	scoreLifes.x = display.contentWidth - 25; scoreLifes.y = 20

end

local function initialize()
	
	-- INICIALIZA QUADRO DE PONTOS E VIDAS
	totalPoints, totalLifes, buffPointsCount = 0, 4, 0
	updatePoints(0)
	updateLifes()

	-- INSTANCIA VARIAVEIS COM SFX
	shotSound = media.newEventSound( "sfx/shot.wav" )
	explosionSound = media.newEventSound( "sfx/explosion.wav" )
	buffSound = media.newEventSound("sfx/buff.wav")
	buffCollectSound = media.newEventSound("sfx/buffCollect.wav")

end

local function onUpdate(event)

	-- MUDA PONTO DE REFERENCIA DA NAVE
	ship:setReferencePoint(display.BottomLeftReferencePoint)
	
	-- SE NAVE ESTA SE MOVENDO, CONTINUA SE MOVENDO ATE PARAR TOUCH
	if (ship.isMoving and ship.isMoving == true) then

		-- MOVE NA DIRECAO DEFINIDA PELO PONTO DO TOUCH
		ship.x = ship.x + (10 * ship.direction)
		
		-- NAO DEIXA ULTRAPASSAR LIMITE ESQUERDO DA TELA
		if(ship.x < 0) then 
			ship.x = 0
		-- NAO DEIXA ULTRAPASSAR LIMITE DIREITO DA TELA
		elseif (ship.x + ship.contentWidth > display.contentWidth) then 
			ship.x = display.contentWidth - ship.contentWidth
		end

	end

	-- RETORNA O PONTO DE REFERENCIA ORIGINAL DA NAVE
	ship:setReferencePoint(display.BottomCenterReferencePoint)

	-- FAZ PARALLAX DO BACKGROUND
	background.x = -(ship.x/3)
	background2.x = background.x
	
	background.y = background.y + 10
	background2.y = background2.y + 10

	if(background.y >= display.contentHeight) then
		background.y = -background.contentHeight
	end

	if(background2.y >= display.contentHeight) then
		background2.y = -background2.contentHeight
	end
	
end

local function onTouch(event)
	if (event.phase == "began") then

		-- SE TOUCH A DIREITA DA NAVE, MOVE PARA DIREITA
		if(event.x > ship.x + ship.contentWidth/2) then
			ship.direction = 1
			ship:setSequence("right")
			
			-- DIZ QUE NAVE ESTA SE MOVENDO
			ship.isMoving = true
		
		-- SE TOUCH A ESQUEDA DA NAVE, MOVE PARA ESQUEDA
		elseif (event.x < ship.x - ship.contentWidth/2) then
			ship.direction = -1
			ship:setSequence("left")

			-- DIZ QUE NAVE ESTA SE MOVENDO
			ship.isMoving = true

		end

		ship:play()

	elseif (event.phase == "ended") then
		-- DIZ PARA PARAR MOVIMENTACAO, POIS TOUCH TERMINOU
		ship.isMoving = false
		ship:setSequence("stop")
		ship:play()

	end
end

local function onTouchShip(event)

	if(event.phase == "began") then

		ship.isTouched = true

	elseif(event.phase == "moved") then

		if(ship.isTouched == true) then
			ship.x = event.x
		end

	elseif(event.phase == "ended") then

		ship.isTouched = false

	end

end

local function onCompleteBoom(obj)
	
	if not explosionAnimation then
		return false
	end

	-- REPOSICIONA ANIMACAO DE EXPLOSAO PARA FOR DA TELA
	explosionAnimation.x = 0; explosionAnimation.y = -150

end

local function onCompleteEnemy(obj)
	
	-- RETIRA PONTOS, POIS INIMIGO PASSOU A TELA INTEIRA
	if(enemy ~= nil) then 
		updatePoints(- (5 * enemy.curSequence))
	else
		return false
	end
	
	-- DEFINE QUAL SERA PROXIMO INIMIGO
	-- CASO O JOGADOR TENHA ACUMULADO 200 OU MAIS PONTOS, ADICIONA INIMIGO No3
	local sequence
	if (totalPoints >= 200) then
		sequence = math.random(1, 3)
	else
		sequence = math.random(1, 2)
	end

	enemy.curSequence = sequence
	enemy:setSequence("alien"..sequence)
	
	-- DEFINE POSICAO DO PROXIMO INIMIGO
	enemy.x = math.random(enemy.contentWidth/2 + 10, display.contentWidth-enemy.contentWidth); 
	enemy.y = -enemy.contentHeight

	-- INICIA TRANSICAO DO PROXIMO INIMIGO
	-- INIMIGO 1 = FACIL, LINHA RETA, LENTO
	if(sequence == 1) then
		enemyTrans = transition.to(enemy, {time=3000, x=enemy.x, y=display.contentHeight, onComplete=onCompleteEnemy})
		enemy.time = 3000
		enemy.finX = enemy.x
	-- INIMIGO 2 = MEDIO, LINHA RETA, RAPIDO
	elseif (sequence == 2) then
		enemyTrans = transition.to(enemy, {time=1500, x=enemy.x, y=display.contentHeight, onComplete=onCompleteEnemy})
		enemy.time = 1500
		enemy.finX = enemy.x
	-- INIMIGO 3 = DIFICIL, DIAGONAIS, RAPIDO
	elseif (sequence == 3) then
		
		-- VARIAVEIS DE CONTROLE
		local enemyW = enemy.contentWidth/2
		local enemyH = enemy.contentHeight/2
		
		-- INICIA VARIAVEIS DE POSICAO INICIAL E FINAL DO INIMIGO 3
		local iniX, finX = -enemyW, display.contentWidth + enemyW
		enemy.direction = 1

		-- OBTEM NUMERO RANDOMICO, SE FOR 0, MUDA PONTO INICIAL E FINAL DA TRAJETORIA DIAGONAL
		if( math.random(0, 1) == 0 ) then
			iniX, finX = display.contentWidth + enemyW, -enemyW
			enemy.direction = -1
		end

		-- SETA VALORES INICIAIS
		enemy.x = iniX
		enemy.y = -enemyH
		enemy.finX = finX

		-- INICIA TRANSICAO, PASSANDO VALORES FINAIS
		enemyTrans = transition.to(enemy, {
			time=1800, 
			x=finX, 
			y=display.contentHeight + enemyH, 
			onComplete=onCompleteEnemy})
		enemy.time = 1800
	end
end

local function startEnemyTransition()

	-- DEFINE QUAL SERA PROXIMO INIMIGO
	-- CASO O JOGADOR TENHA ACUMULADO 200 OU MAIS PONTOS, ADICIONA INIMIGO No3
	local sequence
	if (totalPoints >= 200) then
		sequence = math.random(1, 3)
	else
		sequence = math.random(1, 2)
	end

	enemy.curSequence = sequence
	enemy:setSequence("alien"..sequence)

	-- DEFINE POSICAO DO PROXIMO INIMIGO
	enemy.x = math.random(enemy.contentWidth/2 + 10, display.contentWidth-enemy.contentWidth); 
	enemy.y = -enemy.contentHeight

	-- INICIA TRANSICAO DO PROXIMO INIMIGO
	-- INIMIGO 1 = FACIL, LINHA RETA, LENTO
	if(sequence == 1) then
		enemyTrans = transition.to(enemy, {time=3000, x=enemy.x, y=display.contentHeight, onComplete=onCompleteEnemy})
		enemy.time = 3000
		enemy.finX = enemy.x
	-- INIMIGO 2 = MEDIO, LINHA RETA, RAPIDO
	elseif (sequence == 2) then
		enemyTrans = transition.to(enemy, {time=1500, x=enemy.x, y=display.contentHeight, onComplete=onCompleteEnemy})
		enemy.time = 1500
		enemy.finX = enemy.x
	-- INIMIGO 3 = DIFICIL, DIAGONAIS, RAPIDO
	elseif (sequence == 3) then
		
		-- VARIAVEIS DE CONTROLE
		local enemyW = enemy.contentWidth/2
		local enemyH = enemy.contentHeight/2
		
		-- INICIA VARIAVEIS DE POSICAO INICIAL E FINAL DO INIMIGO 3
		local iniX, finX = -enemyW, display.contentWidth + enemyW

		-- OBTEM NUMERO RANDOMICO, SE FOR 0, MUDA PONTO INICIAL E FINAL DA TRAJETORIA DIAGONAL
		if( math.random(0, 1) == 0 ) then
			iniX, finX = display.contentWidth + enemyW, -enemyW
		end

		-- SETA VALORES INICIAIS
		enemy.x = iniX
		enemy.y = -enemyH
		enemy.finX = finX

		-- INICIA TRANSICAO, PASSANDO VALORES FINAIS
		enemyTrans = transition.to(enemy, {
			time=1800, 
			x=finX, 
			y=display.contentHeight + enemyH, 
			onComplete=onCompleteEnemy})
		enemy.time = 1800
	end
end

local function onCompleteShoot(obj)

	if(bullet == nil) then return false end

	-- REPOSICIONA TIRO, PROXIMO A NAVE (inicio do tiro)
	bullet.x = ship.x
	bullet.y = ship.y - ship.contentHeight

	-- CANCELA TRANSICAO ATUAL DO TIRO
	transition.cancel(bulletTrans)

	-- REINICIA TRANSICAO DO TIRO
	bulletTrans = transition.to( bullet, { time=400, x = ship.x, y = 0, onComplete = onCompleteShoot } )
	
	-- POG POR CAUSA DE ERRO DO EMULADOR NO WINDOWS
	if (system.getInfo("environment") == "simulator") then
		shotSound = media.newEventSound( "sfx/shot.wav" )
	end

	-- TOCA SOM DE TIRO
	media.playEventSound(shotSound)

end

local function onCollisionBulletDelay(self, event)

	-- SO EXECUTA ACOES SE FOR COLISAO COM INIMIGO
	if (event.other.typeName == "enemy") then

		-- POSICIONA ANIMACAO DE EXPLOSAO, ONDE ACONTECEU A COLISAO
		explosionAnimation.x = enemy.x 
		explosionAnimation.y = enemy.y
		
		-- POG POR CAUSA DE ERRO DO EMULADOR NO WINDOWS
		if (system.getInfo("environment") == "simulator") then
			explosionSound = media.newEventSound( "sfx/explosion.wav" )
		end

		-- TOCA SOM DE EXPLOSAO
		media.playEventSound(explosionSound)
		
		-- TOCA ANIMACAO DE EXPLOSAO
		explosionAnimation:setSequence("explosion")
		explosionAnimation:play()

		-- SETA DURACAO DA ANIMACAO DE EXPLOSAO
		transition.to(explosionAnimation, {time = 800, x=explosionAnimation.x, y=explosionAnimation.y, onComplete=onCompleteBoom})
		
		-- CANCELA TRANSICAO DO INIMIGO
		transition.cancel(enemyTrans)

		-- ATUALIZA PONTOS, POIS ACERTOU INIMIGO
		updatePoints(enemy.curSequence * 5)

		-- INICIA TRANSICAO DE NOVO INIMIGO
		timer.performWithDelay(10, startEnemyTransition)

	end


end

local function onCollisionBullet(self, event)

	if (event.phase == "began") then
		timer.performWithDelay(10, onCollisionBulletDelay(self, event))
	end

end

local function onTimerTicks(event)
	
	-- CANCELA TIMER
	timer.cancel(event.source)
	
	if (ship == nil) then return false end

	-- EXIBE ELEMENTOS ENVOLVIDOS NA COLISAO DA NAVE
	ship.isVisible = true
	bullet.isVisible = true
	enemy.isVisible = true
	
	-- DEFINE POSICIONAMENTO INICIAL DA NAVE
	ship:setReferencePoint(display.BottomCenterReferencePoint)
	ship.x = display.contentWidth/2
	ship.y = display.contentHeight - 50

	-- DEFINE POSICIONAMENTO INICIAL DO BACKGROUND
	background:setReferencePoint(display.TopLeftReferencePoint)
	background.x = -150
	background.y = 0
	
	background2.x = -150
	background2.y = -background2.contentHeight

	-- DEFINE POSICIONAMENTO INICIAL DO TIRO
	bullet.x = ship.x
	bullet.y = ship.y - ship.contentHeight

	-- INICIA TRANSICAO DO TIRO
	bulletTrans = transition.to( bullet, { time=400, x = ship.x, y = 0, onComplete = onCompleteShoot } )

	-- INICIA TRANSICAO DE NOVO INIMIGO
	startEnemyTransition()

	-- RECRIA LISTENERS DE COLISAO DA NAVE E TOUCH DE TELA E BOTAO PAUSE
	Runtime:addEventListener( "touch", onTouch )
	ship:addEventListener("collision", ship)
	pause.isEnabled = true

end

local function onCollisionShipDelay(self, event)

	-- TRATA COLISAO COM INIMIGO
	if(event.other.typeName == "enemy") then
		
		-- DESABILITA O BOTAO DE PAUSE
		pause.isEnabled = false

		-- ATUALIZA NUMERO DE VIDAS (-1)
		updateLifes()

		-- SE NAO TEM MAIS VIDAS, GAME OVER
		if (totalLifes == 0) then

			-- POG POR CAUSA DE ERRO DO SIMULADOR NO WINDOWS
			if (system.getInfo("environment") == "simulator") then
				explosionSound = media.newEventSound( "sfx/explosion.wav" )
			end

			-- TOCA SOM DE EXPLOSAO
			media.playEventSound(explosionSound)
			
			-- VAI PARA A TELA DE GAME OVER
			storyboard.gotoScene("gameOver", {params = {score=totalPoints}})
			return false
		end

		-- ESCONDE OBJETOS ENVOLVIDOS, POR CAUSA DO RESPAWN DA NAVE
		ship.isVisible = false
		bullet.isVisible = false
		enemy.isVisible = false

		-- POG POR CAUSA DE ERRO DO SIMULADOR NO WINDOWS
		if (system.getInfo("environment") == "simulator") then
			explosionSound = media.newEventSound( "sfx/explosion.wav" )
		end

		-- TOCA SOM DE EXPLOSAO
		media.playEventSound(explosionSound)
		
		-- EXECUTA ANIMACAO DE EXPLOSAO
		explosionAnimation.x = ship.x
		explosionAnimation.y = ship.y - ship.contentHeight
		explosionAnimation:setSequence("explosion")
		explosionAnimation:play();
		transition.to(explosionAnimation, {time = 800, x=explosionAnimation.x, y=explosionAnimation.y, onComplete=onCompleteBoom})

		-- CANCELA TRANSICOES DE TIRO E INIMIGO
		transition.cancel(bulletTrans)
		transition.cancel(enemyTrans)

		-- REMOVE TOUCH, POR CAUSA DO RESPAWN DA NAVE
		Runtime:removeEventListener( "touch", onTouch )
		
		-- PARA NAVE E REMOVE COLLISION, POR CAUSA DO RESPAWN DA NAVE
		ship.isMoving = false
		ship:removeEventListener("collision", ship)
		
		-- ATIVA TIMER DO RESPAWN DA NAVE
		timer.performWithDelay(1000, onTimerTicks)


	-- TRATA COLISAO COM BUFF DE VIDA
	elseif(event.other.typeName == "buffLife") then

		-- ATUALIZA VIDAS
		updateLifes(1)

		-- CANCELA TRANSICAO
		if (buffTrans ~= nil) then transition.cancel(buffTrans) end

		-- CRIA TRANSICAO DO BUFF, DO LOCAL ONDE OCORREU A COLISAO
		-- PARA O MARCADOR DE VIDA
		buffTrans = transition.to(
					buffAnimation, {time=500, 
					x=scoreLifes.x, 
					y=scoreLifes.y, 
					onComplete=onCompleteBuff})
		buffTrans.time = 500
		buffTrans.x = scoreLifes.x
		buffTrans.y = scoreLifes.y
		buffTrans.isActive = true
		media.playEventSound(buffCollectSound)

	-- TRATA COLISAO COM BUFF DE PONTOS
	elseif(event.other.typeName == "buffPoint") then

		-- ATUALIZA PONTOS
		updatePoints(50, true)

		-- CANCELA TRANSICAO
		if (buffTrans ~= nil) then transition.cancel(buffTrans) end
		
		-- CRIA TRANSICAO DO BUFF, DO LOCAL ONDE OCORREU A COLISAO
		-- PARA O MARCADOR DE PONTOS
		buffTrans = transition.to(
					buffAnimation, {time=500, 
					x=scorePoints.x, 
					y=scorePoints.y, 
					onComplete=onCompleteBuff})
		buffTrans.time = 500
		buffTrans.x = scorePoints.x
		buffTrans.y = scorePoints.y
		buffTrans.isActive = true
		media.playEventSound(buffCollectSound)

	end

end

local function onCollisionShip(self, event)

	if (event.phase == "began") then
		timer.performWithDelay(10, onCollisionShipDelay(self, event))
	end

end

function scene:createScene( event )

	local view = self.view

	-- INICIALIZA OBJETOS
	initialize()

	-- CRIA E POSICIONA BACKGROUND
	background = display.newImage("img/bg_game.png")
	background:setReferencePoint(display.TopLeftReferencePoint)
	background:scale(3,3)
	background.x = 0
	background.y = 0

	background2 = display.newImage("img/bg_game.png")
	background2:setReferencePoint(display.TopLeftReferencePoint)
	background2:scale(3,3)
	background2.x = 0
	background2.y = -background2.contentHeight
	
	-- CRIA SPRITE SHEET DA NAVE
	local shipSheetOpt = { width=108.4, height=131, numFrames=5, sheetContentWidth=542, sheetContentHeight=131 }
	local shipSheet = graphics.newImageSheet("img/ship_v2.png", shipSheetOpt)
	local shipSpriteData = 
	{
		{name="left", frames={3, 2, 1}, time=200, loopCount=1},
		{name="stop", start=3, count=1, time=0},
		{name="right", frames={3, 4, 5}, time=200, loopCount=1}
	}
	ship = display.newSprite(shipSheet, shipSpriteData)
	ship:setSequence("stop")
	ship:play()
	ship.typeName = "ship"
	ship.curSequence = 1
	ship:setReferencePoint(display.BottomCenterReferencePoint)
	ship.x = display.contentWidth/2
	ship.y = display.contentHeight - 50
	physics.addBody( ship, "dynamic", { isSensor=true, density=3.0, friction=0.5, bounce=0.3 } )
	ship.gravityScale = 0

	-- CRIA SPRITE SHEET DE TIRO
	local sheetData = { width=16, height=19, numFrames=3, sheetContentWidth=48, sheetContentHeight=19 }
	local mySheet = graphics.newImageSheet( "img/ss_bullet.png", sheetData )
	local sequenceData = { name = "shoot", start=1, count=3, time=300 }

	-- CRIA E INICIA ANIMACAO DO TIRO
	bullet = display.newSprite( mySheet, sequenceData )
	bullet.typeName = "bullet"
	bullet.x = ship.x
	bullet.y = ship.y - ship.contentHeight
	bullet:play()
	bullet:scale(2.5, 2.5)
	physics.addBody( bullet, "dynamic", { isSensor=true, density=3.0, friction=0.5, bounce=0.3 } )
	bullet.gravityScale = 0

	-- CRIA SPRITE SHEET DE INIMIGOS (TODOS OS INIMIGOS NA MESMA SPRITE)
	local enemySheetOpt = { width=114, height=200, numFrames=3, sheetContentWidth=342, sheetContentHeight=200 }
	local enemySheet = graphics.newImageSheet("img/ss_aliens.png", enemySheetOpt)
	local enemySpriteData = 
	{
		{name="alien1", start=1, count=1, time=0},
		{name="alien2", start=2, count=1, time=0},
		{name="alien3", start=3, count=1, time=0}
	}
	enemy = display.newSprite(enemySheet, enemySpriteData)
	enemy:setSequence("alien1")
	enemy.typeName = "enemy"
	enemy.curSequence = 1
	enemy.time = 3000
	enemy:setReferencePoint(display.CenterReferencePoint)
	enemy.x = math.random(enemy.contentWidth/2 + 10, display.contentWidth-enemy.contentWidth); 
	enemy.y = -enemy.contentHeight
	physics.addBody( enemy, "dynamic", { isSensor=true, density=3.0, friction=0.5, bounce=0.3 } )
	enemy.gravityScale = 0
	enemy.isFixedRotation=true

	-- CRIA SPRITE SHEET DE EXPLOSAO
	local expOpt = { width=64, height=64, numFrames=10, sheetContentWidth=320, sheetContentHeight=320 }
	local expSheet = graphics.newImageSheet( "img/ss_explosion.png", expOpt )
	local expSequence = { name = "explosion", start=1, count=10, time=1000 }

	-- CRIA ANIMACAO DE EXPLOSAO
	explosionAnimation = display.newSprite( expSheet, expSequence )
	explosionAnimation:setReferencePoint(display.CenterReferencePoint)
	explosionAnimation.x = 0
	explosionAnimation.y = -150
	explosionAnimation:scale(2.5,2.5)
	
	-- CRIA BUFF DE VIDA
	local lifeOpt = { width=32, height=32, numFrames=8, sheetContentWidth=256, sheetContentHeight=32 }
	local lifeSheet = graphics.newImageSheet( "img/ss_buff_life.png", lifeOpt )
	local lifeSequence = { name = "lifeBuff", start=1, count=8, time=1000 }

	-- CRIA ANIMACAO DE BUFF DE VIDA
	lifeAnimation = display.newSprite( lifeSheet, lifeSequence )
	lifeAnimation.typeName = "buffLife"
	lifeAnimation:setReferencePoint(display.CenterReferencePoint)
	lifeAnimation.x = 0
	lifeAnimation.y = -display.contentHeight
	lifeAnimation:scale(2.2, 2.2)
	lifeAnimation:play()
	physics.addBody( lifeAnimation, { isSensor = true } )
	lifeAnimation.gravityScale = 0
	lifeAnimation.isFixedRotation=true

	-- CRIA BUFF DE PONTOS
	local pointOpt = { width=32, height=32, numFrames=8, sheetContentWidth=256, sheetContentHeight=32 }
	local pointSheet = graphics.newImageSheet( "img/ss_buff_points.png", pointOpt )
	local pointSequence = { name = "pointBuff", start=1, count=8, time=1000 }

	-- CRIA ANIMACAO DE BUFF DE PONTOS
	pointAnimation = display.newSprite( pointSheet, pointSequence )
	pointAnimation.typeName = "buffPoint"
	pointAnimation:setReferencePoint(display.CenterReferencePoint)
	pointAnimation.x = 0
	pointAnimation.y = -display.contentHeight
	pointAnimation:scale(2.2, 2.2)
	pointAnimation:play()
	physics.addBody( pointAnimation, { isSensor = true } )
	pointAnimation.gravityScale = 0
	pointAnimation.isFixedRotation=true

	-- CRIA BOTAO DE PAUSE
	pause = display.newImage("img/btn_pause.png")
	pause:setReferencePoint(display.CenterReferencePoint)
	pause.y = pause.contentHeight/2
	pause.x = display.contentWidth/2
	pause.state = "running"
	pause:scale(0.6, 0.6)

	-- INSERE OBJETOS NA VIEW DA CENA
	view:insert(background)
	view:insert(background2)
	view:insert(ship)
	view:insert(bullet)
	view:insert(enemy)
	view:insert(explosionAnimation)
	view:insert(lifeAnimation)
	view:insert(pointAnimation)
	view:insert(pause)
	
end

local function calculateRemainingTransitionTime(totalTime, totalDistance, currentPos)

	local time = (totalTime * (totalDistance - currentPos)) / totalDistance
	if(time < 0) then time = time * -1 end

	return time

end

local function onPause(event)

	if (event.phase == "began" and pause.isEnabled == true) then

		if(pause.state == "running") then

			pause.state = "paused"

			Runtime:removeEventListener( "touch", onTouch )
			Runtime:removeEventListener( "enterFrame", onUpdate )

			if(bulletTrans) then transition.cancel(bulletTrans) end
			if(enemyTrans) then transition.cancel(enemyTrans) end
			if(buffTrans) then transition.cancel(buffTrans) end

			if(buffAnimation) then buffAnimation:pause() end
			if(ship) then ship:pause() end
			if(explosionAnimation) then explosionAnimation:pause() end
			if(bullet) then bullet:pause() end

		elseif(pause.state == "paused") then

			pause.state = "running"

			Runtime:addEventListener("touch", onTouch)
			Runtime:addEventListener("enterFrame", onUpdate)

			if(bulletTrans) then
				local bulletTime = calculateRemainingTransitionTime(400, display.contentHeight, bullet.y)
				bulletTrans = transition.to( 
						bullet, { time=bulletTime, 
						x = bullet.x, 
						y = 0, 
						onComplete = onCompleteShoot } )
			end

			if(enemyTrans) then
				local enemyTime = calculateRemainingTransitionTime(enemy.time, display.contentHeight, enemy.y)
				enemyTrans = transition.to(
						enemy, {time=enemyTime, 
						x=enemy.finX, 
						y=display.contentHeight, 
						onComplete=onCompleteEnemy})
			end

			if(buffTrans and buffTrans.isActive == true) then

				local buffTime = calculateRemainingTransitionTime(buffTrans.time, buffTrans.y, buffAnimation.y)
				local bY = buffTrans.y
				local bX = buffTrans.x
				buffTrans = transition.to(
						buffAnimation, {time=buffTime, 
						x=bX, 
						y=bY, 
						onComplete=onCompleteBuff})
				buffTrans.isActive = true

			end

			if(buffAnimation) then buffAnimation:play() end
			if(ship) then ship:play() end
			if(explosionAnimation) then explosionAnimation:play() end
			if(bullet) then bullet:play() end

		end

	end

end

function scene:enterScene( event )
	
	-- ADICIONA LISTENER GLOBAIS DE TOUCH E UPDATE DE FRAME
	Runtime:addEventListener("touch", onTouch)
	Runtime:addEventListener("enterFrame", onUpdate)
	
	-- ADICIONA LISTENER DE TOUCH DO BOTAO PAUSE
	--pause.touch = onPause
	pause:addEventListener("touch", onPause)
	pause.isEnabled = true

	-- ADICIONA LISTENER DE COLISAO DA NAVE
	ship.collision = onCollisionShip
	ship:addEventListener("collision", ship)

	-- ADICIONA LISTENER DE TOUCH NA NAVE
	--ship.touch = onTouchShip
	ship:addEventListener("touch", onTouchShip)

	-- ADICIONA LISTENER DE COLISAO DO TIRO
	bullet.collision = onCollisionBullet
	bullet:addEventListener("collision", bullet)

	-- INICIA TRANSICOES DE INIMIGO E TIRO
	enemyTrans = transition.to(enemy, {time=3000, x=enemy.x, y=display.contentHeight, onComplete=onCompleteEnemy})
	bulletTrans = transition.to( bullet, { time=400, x = ship.x, y = 0, onComplete = onCompleteShoot } )
	
	-- TOCA PRIMEIRO SOM DE TIRO
	media.playEventSound(shotSound)
	
end

function scene:exitScene( event )

	-- REMOVE LISTENERS DE TOUCH E UPDATE DE FRAME
	Runtime:removeEventListener( "enterFrame", onUpdate )
	Runtime:removeEventListener( "touch", onTouch )

end

function scene:destroyScene(event)

	transition.cancel(bulletTrans)
	transition.cancel(enemyTrans)
	--transition.cancel(buffTrans)

	bulletTrans = nil
	enemyTrans = nil
	buffTrans = nil

	background:removeSelf()
	background = nil

	background2:removeSelf()
	background2 = nil

	ship:removeSelf()
	ship = nil

	bullet:removeSelf()
	bullet = nil

	enemy:removeSelf()
	enemy = nil

	scorePoints:removeSelf()
	scorePoints = nil

	scoreLifes:removeSelf()
	scoreLifes = nil

	totalPoints = nil
	totalLifes = nil

	shotSound = nil
	explosionSound = nil

	lifeAnimation:removeSelf()
	lifeAnimation = nil
	
	pointAnimation:removeSelf()
	pointAnimation = nil
	buffSound = nil

	pause:removeSelf()
	pause = nil

end

-- ADICIONA LISTENERS DA CENA
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene