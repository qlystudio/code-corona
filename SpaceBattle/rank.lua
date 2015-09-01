local json = require("json")
--local io = require("io")
local storyboard = require "storyboard"
local scene = storyboard.newScene()

local text
local score
local startButton
local menuButton
local background
local rank = {}

-- CARREGA TABELA DO ARQUIVO LOCAL DE RANKING
function loadTable(filename)
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local contents = ""
    local myTable = {}
    local file = io.open( path, "r" )
    if file then
         -- read all contents of file into a string
         local contents = file:read( "*a" )
         myTable = json.decode(contents);
         io.close( file )
         return myTable 
    end
    return nil
end

local function buildRanking()

	-- CARREGA TABELA DE RANKING (LOCAL)
	ranks = loadTable("sb_ranking.json")

	-- CRIA TEXTO PADRAO DE SCORE(COM TEXTO CASO NAO TENHA DADOS)
	if(ranks == nil or #ranks <= 0) then
		
		score = display.newText("No ranking at the moment", 0, 0, native.systemFontBold, 45)
		score:setReferencePoint(display.CenterReferencePoint)
		score.x = display.contentWidth/2
		score.y = text.y + text.contentHeight/2 + 50
		return false

	end

	-- PERCORRE TABELA DE RANKING, CRIANDO LABELS COM NOME E SCORE
	local scr = {}
	for i=1, #ranks do

		-- SE TEM DADOS, MOSTRA NA TELA
		if(ranks[i]) then
			scr[i] = display.newText(i..". "..ranks[i].playerName.." : "..ranks[i].score, 0, 0, native.systemFontBold, 45)
			scr[i]:setReferencePoint(display.CenterReferencePoint)
			scr[i].x = display.contentWidth/2
			scr[i].y = text.y + (text.contentHeight/2 + 50) * i
			scene.view:insert(scr[i])
		end

	end

	-- GUARDA O ULTIMO SCORE
	score = scr[#scr]

end

local function onUpdate( event )

end

local function onButtonTouch(event)

	-- AO CLICAR EM START, VAI PARA A TELA DO JOGO
	if (event.phase == "began") then

		if(event.target.typeName == "start") then
			storyboard.gotoScene("game")
		elseif (event.target.typeName == "menu") then
			storyboard.gotoScene("menu")
		end
		
	end

end

function scene:createScene( event )

	local view = self.view

	background = display.newImage("img/bg_menu.png")
	background:setReferencePoint(display.CenterReferencePoint)
	background.x = display.contentWidth/2; background.y = display.contentHeight/2
	background:scale(2.2,2.2)

	text = display.newText("Ranking: ", 0, 0, native.systemFontBold, 45)
	text:setReferencePoint(display.CenterReferencePoint)
	text.x = display.contentWidth/2
	text.y = 100

	-- CRIA QUADRO DE RANKING
	buildRanking()

	startButton = display.newImage("img/btn_start.png")
	startButton.typeName = "start"
	startButton:setReferencePoint(display.CenterReferencePoint)
	startButton.x = score.x
	startButton.y = score.y + score.contentHeight/2 + 200
	startButton:scale(1.5, 1.5)

	menuButton = display.newImage("img/btn_menu.png")
	menuButton.typeName = "menu"
	menuButton:setReferencePoint(display.CenterReferencePoint)
	menuButton.x = score.x
	menuButton.y = startButton.y + startButton.contentHeight/2 + 80

	view:insert(background)
	view:insert(text)
	view:insert(score)
	view:insert(startButton)
	view:insert(menuButton)

end

function scene:willEnterScene( event )
   
end

function scene:enterScene( event )
   	
   	-- ADICIONA LISTENER DE TOUCH DO BOTAO START E MENU
	startButton:addEventListener("touch", onButtonTouch)
	menuButton:addEventListener("touch", onButtonTouch)
	
	-- ADICIONA LISTENER DE UPDATE FRAME
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

	score:removeSelf()
	score = nil

	startButton:removeSelf()
	startButton = nil

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