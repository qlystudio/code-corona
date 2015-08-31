module(..., package.seeall)

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

new = function ()
	
	------------------
	-- Groups
	------------------

	
	require("gamestate")
	local localGroup = display.newGroup()
	local backgroundGroup = display.newGroup()
	
	localGroup:insert(backgroundGroup)

	
	------------------
	-- Your code here
	------------------
	
	ambientSound = audio.loadSound("level1/score-theme.mp3")
	ambientSoundChannel = audio.play( ambientSound , { onComplete = audio.dispose} )
	audio.setVolume(0.50, {channel = ambientSoundChannel})

	director:changeFxTime ( 2000 ) 
	print ("vou criar o path")
	local path = system.pathForFile("hscore.txt",system.ResourceDirectory)
	local fh = io.open( path,"r")
 	local vart=0
 	local hs,ll
 	local hscore
 	print ("entrar no ficheiro")
	for line in fh:lines() do
    	print( line )  -- display the line in the terminal

    	print (gamestate.data.selectedScore)
    	print (tonumber(line))
    	hscore=tonumber(line)
  		if (gamestate.data.selectedScore > tonumber(line) ) then
  			print ("new higshcore")
  			io.close(fh) 
  			print ("11111")
  			fh = nil
  			print ("2222")
  			local fw = io.open( path,"w")
  			print ("3333")

    		fw:write(gamestate.data.selectedScore)
  			print ("4444")

			io.close(fw)
  			print ("55555")

    		fw=nil
  			print ("66666")

	    	local img_HScore = display.newImageRect( "hs_notbad.jpg", 300, 300)
			img_HScore:setReferencePoint( display.TopLeftReferencePoint )
			img_HScore.x, img_HScore.y = 400, 100
			break
		else

	    	local img_Score = display.newImageRect( "serious.jpg", 300, 300)
					img_Score:setReferencePoint( display.TopLeftReferencePoint )
					img_Score.x, img_Score.y = 400, 100

		end
	end
    





	local levelText = display.newText("Highscore:", 50, 50, "Impact", 44)
	levelText:setTextColor( 0, 0, 0, 255 ) 
	local levelppText = display.newText(hscore, 150, 100, "Impact", 64)
	levelppText:setTextColor( 0, 0, 0, 255 ) 
	
	local scoreText = display.newText("Your Score :", 50, 220, "Impact", 44)
	scoreText:setTextColor( 0, 0, 0, 255 ) 
	local scoreppText = display.newText(gamestate.data.selectedScore, 150, 270, "Impact", 64)
	scoreppText:setTextColor( 0, 0, 0, 255 ) 


	local img_Score = display.newImageRect( "serious.jpg", 300, 300)
	img_Score:setReferencePoint( display.TopLeftReferencePoint )
	img_Score.x, img_Score.y = 400, 100



	background = display.newImageRect( "level2/white.png", display.contentWidth, display.contentHeight )
	background:setReferencePoint( display.TopLeftReferencePoint )
	background.x, background.y = 0, 0

	


	function background:tap( event )
		director:changeScene("levelselection", "moveFromLeft")
	end

	background:addEventListener( "tap", background )

	
	------------------
	-- MUST return a display.newGroup()
	------------------
	
	return localGroup
	
end