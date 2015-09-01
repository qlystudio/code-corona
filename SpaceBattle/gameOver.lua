local json = require("json")
local storyboard = require "storyboard"
local scene = storyboard.newScene()

local text
local score
local scoreValue
local rankName
local startButton
local menuButton
local background
local enterSound
local txtNameToRank

-- SALVA TABELA JSON EM ARQUIVO (CODIGO EXTERNO)
function saveTable(t, filename)
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local file = io.open(path, "w")
    if file then
        local contents = json.encode(t)
        file:write( contents )
        io.close( file )
        return true
    else
        return false
    end
end


local function onUpdate( event )

end

local function saveScoreInRank()

	-- CRIA TABELA
	local rank = {}
	local ranks = {}

	-- GUARDA VALORES NA TABELA
	rank.playerName = txtNameToRank.text
	rank.score = scoreValue
	
	ranks[1] = rank
	
	-- CHAMA FUNCTION QUE GRAVA ARQUIVO DE RANKING
	saveTable(ranks, "sb_ranking.json")

end

local function onButtonTouch(event)

	if (event.phase == "began") then
		
		-- SALVA ARQUIVO DE RANKING
		if(txtNameToRank.text ~= "") then
			saveScoreInRank()
		end

		-- BOTAO START
		if(event.target.typeName == "start") then

			-- VAI PARA A TELA DO JOGO
			storyboard.gotoScene("game")

		-- BOTAO MENU
		elseif(event.target.typeName == "menu") then

			-- VAI PARA A TELA DE MENU
			storyboard.gotoScene("menu")

		end

	end

end

local function onTextFocus(event)

	if event.phase == "began" then

        -- user begins editing textField
        --native.setKeyboardFocus( txtNameToRank )

    elseif event.phase == "ended" then

        -- textField/Box loses focus

    elseif event.phase == "ended" or event.phase == "submitted" then

        -- do something with defaulField's text
        --native.setKeyboardFocus( nil )

    elseif event.phase == "editing" then

    end

end

function scene:createScene( event )

	local view = self.view

	enterSound = media.newEventSound("sfx/gameOver.wav")

	background = display.newImage("img/bg_menu.png")
	background:setReferencePoint(display.CenterReferencePoint)
	background.x = display.contentWidth/2; background.y = display.contentHeight/2
	background:scale(2.2,2.2)

	text = display.newImage("img/logo_gameover.png")
	text:setReferencePoint(display.CenterReferencePoint)
	text.x = display.contentWidth/2
	text.y = display.contentHeight/2 - 200
	
	score = display.newText("Points: ", 0, 0, native.systemFontBold, 45)
	score.x = text.x
	score.y = text.y + text.contentHeight/2 + 50

	rankName = display.newText("Rank Name: ", 0, 0, native.systemFontBold, 35)
	rankName.x = text.x
	rankName.y = score.y + score.contentHeight/2 + 50

	txtNameToRank = native.newTextField( 10, 10, 10, 10, onTextFocus )
	txtNameToRank.x = rankName.x
	txtNameToRank.y = rankName.y + rankName.contentHeight + 10
	txtNameToRank.width = 350
	txtNameToRank.height = 60
	txtNameToRank.font = native.newFont( native.systemFontBold, 24 )
	txtNameToRank.align = "center"
	txtNameToRank:setReferencePoint(display.CenterReferencePoint)
	
	startButton = display.newImage("img/btn_start.png")
	startButton.typeName = "start"
	startButton:setReferencePoint(display.CenterReferencePoint)
	startButton.x = score.x
	startButton.y = txtNameToRank.y + txtNameToRank.contentHeight/2 + 100
	startButton:scale(1.5, 1.5)

	menuButton = display.newImage("img/btn_menu.png")
	menuButton.typeName = "menu"
	menuButton:setReferencePoint(display.CenterReferencePoint)
	menuButton.x = score.x
	menuButton.y = startButton.y + startButton.contentHeight/2 + 50

	view:insert(background)
	view:insert(text)
	view:insert(score)
	view:insert(startButton)
	view:insert(txtNameToRank)
	view:insert(rankName)
	view:insert(menuButton)

end

function scene:willEnterScene( event )
   
end

function scene:enterScene( event )
   	
   	-- VERIFICA SE FORAM ENVIADOS PARAMETROS DA TELA ANTERIOR
   	if(event.params) then
   		
   		-- GUARDA SCORE PARA GRAVACAO DE ARQUIVO
   		scoreValue = event.params.score

   		-- CRIA TEXTO DE SCORE COM OS PONTOS ENVIADOS DA TELA ANTERIOR
		score.text = "Points: "..event.params.score
	end

	-- TOCA SOM DE GAME OVER
   	media.playEventSound(enterSound)
   	
   	-- DESTROI TELA DO JOGO (LIBERA RECURSOS)
   	storyboard.purgeScene("game")
	
   	-- VINCULA LISTENER DE TOUCH NO BOTAO START E MENU
	startButton:addEventListener("touch", onButtonTouch)
	menuButton:addEventListener("touch", onButtonTouch)
	
	-- VINCULA LISTENER DE UPDATE FRAME
	Runtime:addEventListener( "enterFrame", onUpdate )

end

function scene:exitScene( event )
   Runtime:removeEventListener( "enterFrame", onUpdate )
end

function scene:didExitScene( event )

end

function scene:destroyScene(event)
	
	background:removeSelf()
	background = nil

	text:removeSelf()
	text = nil

	startButton:removeSelf()
	startButton = nil

	txtNameToRank:removeSelf()
	txtNameToRank = nil

	rankName:removeSelf()
	rankName = nil

	menuButton:removeSelf()
	menuButton = nil

end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "didExitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene