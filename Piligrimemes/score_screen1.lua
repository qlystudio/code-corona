



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
	
	director:changeFxTime ( 2000 ) 


	function explode(div,str)
		  if (div=='') then return false end
		  local pos,arr = 0,{}
		  -- for each divider found
		  for st,sp in function() return string.find(str,div,pos,true) end do
		    -- Attach chars left of current divider
		    table.insert(arr,string.sub(str,pos,st-1)) 
		    pos = sp + 1 -- Jump past current divider
		  end
		  -- Attach chars right of last divider
		  table.insert(arr,string.sub(str,pos)) 
		  return arr
	end

	function substituilinha(level,maxscore)
		local path1 = system.pathForFile("hscore.txt",system.ResourceDirectory)
		local fh1 = io.open( path1,"r")
		local total="1"
		print ("vou entrar no for com level=",level," e maxscore=",maxscore)


		for line in fh1:lines() do
			print ("enbtrei no for, vou fazer o parts",line)
			local parts = explode(" ", line)
			print ("tonumber(parts[1]",tonumber(parts[1]))
			print ("level",level)
			if(tonumber(parts[1]==level)) then
				print ("total qd line=",line,"e igual=",total)
				total=total.."\n"..parts[1].." "..maxscore
			else
				total=total .."\n"..line
			end
		end

		print ("totaltotalw=",total)

		return total

	end


	print ("vou criar o path")
	local path = system.pathForFile("hscore.txt",system.ResourceDirectory)
	local fh = io.open( path,"r")
 	local vart=0
 	local hs,ll, hscore=0
	for line in fh:lines() do
    	print( "'",line )  -- display the line in the terminal

  		local var=line

    
    	local parts = explode(" ", var)

    	if(string.find(gamestate.data.selectedLevel,parts[1]) ~= nil) then
    		--entra aqui encointrou a linha

    		hscore=tonumber(parts[2])
    		if (gamestate.data.selectedScore > tonumber(parts[2])) then
    			print ("new higshcore")
    			hscore=gamestate.data.selectedScore
    			io.close(fh)
    			local fw = io.open( path,"w")

    			local var= substituilinha(tonumber(gamestate.data.selectedLevel),tonumber(gamestate.data.selectedScore))
    			--fw:write( tonumber(gamestate.data.selectedLevel)," ",gamestate.data.selectedScore)

    			


    			local img_HScore = display.newImageRect( "hs_notbad.jpg", 300, 300)
				img_HScore:setReferencePoint( display.TopLeftReferencePoint )
				img_HScore.x, img_HScore.y = 400, 100
				
				vart=1

    		else
    			if(vart==0) then
	    			local img_Score = display.newImageRect( "serious.jpg", 300, 300)
					img_Score:setReferencePoint( display.TopLeftReferencePoint )
					img_Score.x, img_Score.y = 400, 100
				end

    		end

    	end
 		
    	

	end
 
	fh:close()




	local levelText = display.newText("Highscore:", 50, 50, "Impact", 44)
	levelText:setTextColor( 0, 0, 0, 255 ) 
	print ("hscoreeeee",hscore)
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