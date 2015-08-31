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

local widget = require "widget"


new = function ()
	
	------------------
	-- Groups
	------------------
	require("gamestate")
	local localGroup = display.newGroup()
	local backgroundGroup = display.newGroup()
	local buttonGroup = display.newGroup()

	localGroup:insert(backgroundGroup)
	localGroup:insert(buttonGroup)
	
	------------------
	-- Your code here
	------------------
		
	director:changeFxTime ( 2000 ) 
		
	local button_width = display.contentWidth*0.209
	local button_height = display.contentHeight*0.425

	--[[
	local ambientSound = audio.loadSound("level1/main-menu.mp3")
	ambientSoundChannel = audio.play( ambientSound, { onComplete = audio.dispose} )
	audio.setVolume(0.50, {channel = ambientSoundChannel})
	--]]

	local background = display.newImageRect( "background.png", display.contentWidth, display.contentHeight )
	background:setReferencePoint( display.TopLeftReferencePoint )
	background.x, background.y = 0, 0
	backgroundGroup:insert(background)
	
	local onwtfBtnRelease = function (event)
		local btn = event.target

	    if event.phase == "release" then
			--audio.fadeOut({ time=1000 } )

    		print(btn.id)
        	if (btn.id==1) then

        		director:changeScene("level1_intro", "moveFromRight")
	        	--storyboard.gotoScene( "level1_intro", "fade", 500 )
    	    elseif (btn.id==2) then
    	    	gamestate.data.selectedLevel=2
	    	    director:changeScene("level2_intro", "moveFromRight")
        		--storyboard.gotoScene( "level2_intro", "fade", 500 )
	        elseif (btn.id==3) then
	        	gamestate.data.selectedLevel=3
		        director:changeScene("level3_intro", "moveFromRight")
        		--storyboard.gotoScene( "level3_intro", "fade", 500 )
	        elseif (btn.id==4) then
	        	gamestate.data.selectedLevel=4
		        director:changeScene("level4_intro", "moveFromRight")
        		--storyboard.gotoScene( "level4_intro", "fade", 500 )
	        elseif (btn.id==5) then
	        	gamestate.data.selectedLevel=5
		        director:changeScene("level5_intro", "moveFromRight")
        		--storyboard.gotoScene( "level5_intro", "fade", 500 )
        	elseif (btn.id==6) then
        		gamestate.data.selectedLevel=6
        		director:changeScene("old_levels/level1", "moveFromRight")
	        	--storyboard.gotoScene( "level1_intro", "fade", 500 )
    	    elseif (btn.id==7) then
    	    	gamestate.data.selectedLevel=7
	    	    director:changeScene("old_levels/level2", "moveFromRight")
        		--storyboard.gotoScene( "level2_intro", "fade", 500 )
	        elseif (btn.id==8) then
	        	gamestate.data.selectedLevel=8
		        director:changeScene("old_levels/level3", "moveFromRight")
        		--storyboard.gotoScene( "level3_intro", "fade", 500 )
	        elseif (btn.id==9) then
	        	gamestate.data.selectedLevel=9
		        director:changeScene("old_levels/level4", "moveFromRight")
        		--storyboard.gotoScene( "level4_intro", "fade", 500 )
	        elseif (btn.id==10) then
	        	gamestate.data.selectedLevel=10
		        director:changeScene("old_levels/level5", "moveFromRight")
        		--storyboard.gotoScene( "level5_intro", "fade", 500 )
	        else
    	    	print ("no pode escolher")
        	end
    	end
	end
	
	leve1_Btn = widget.newButton{
		labelColor = { default={255}, over={128} },
		default="button_level_1.png",
		over="button_level_1.png",
		id=1,
		onEvent = onwtfBtnRelease	-- event listener function
	}
	--leve1_Btn.view:setReferencePoint( display.CenterReferencePoint )
	leve1_Btn.xScale=1;
	leve1_Btn.yScale=1;
	leve1_Btn.view.x = button_width;
	leve1_Btn.view.y = button_height;

	leve2_Btn = widget.newButton{
		labelColor = { default={255}, over={128} },
		default="button_level_2.png",
		over="button_level_2.png",
		id=2,
		onEvent = onwtfBtnRelease	-- event listener function
	}
	--leve2_Btn.view:setReferencePoint( display.CenterReferencePoint )
	leve2_Btn.xScale=1;
	leve2_Btn.yScale=1;
	leve2_Btn.view.x = button_width + 68;
	leve2_Btn.view.y = button_height;

	leve3_Btn = widget.newButton{
		labelColor = { default={255}, over={128} },
		default="button_level_3.png",
		over="button_level_3.png",
		id=3,
		onEvent = onwtfBtnRelease	-- event listener function
	}
	leve3_Btn.view:setReferencePoint( display.CenterReferencePoint )
	leve3_Btn.xScale=1;
	leve3_Btn.yScale=1;
	leve3_Btn.view.x = button_width+136;
	leve3_Btn.view.y = button_height;

	leve4_Btn = widget.newButton{
		labelColor = { default={255}, over={128} },
		default="button_level_4.png",
		over="button_level_4.png",
		id=4,
		onEvent = onwtfBtnRelease
	}
	leve4_Btn.view:setReferencePoint( display.CenterReferencePoint )
	leve4_Btn.xScale=1;
	leve4_Btn.yScale=1;
	leve4_Btn.view.x = button_width+204;
	leve4_Btn.view.y = button_height;	

	leve5_Btn = widget.newButton{
		labelColor = { default={255}, over={128} },
		default="button_survival.png",
		over="button_survival.png",
		id=5,
		onEvent = onwtfBtnRelease	-- event listener function
	}
	leve5_Btn.view:setReferencePoint( display.CenterReferencePoint )
	leve5_Btn.xScale=1;
	leve5_Btn.yScale=1;
	leve5_Btn.view.x = button_width+205;
	leve5_Btn.view.y = button_height+94;

	leve6_Btn = widget.newButton{
	labelColor = { default={255}, over={128} },
	default="button_derp.png",
	over="button_derp.png",
	id=6,
	onEvent = onwtfBtnRelease	-- event listener function
	}
	--leve1_Btn.view:setReferencePoint( display.CenterReferencePoint )
	leve6_Btn.xScale=1;
	leve6_Btn.yScale=1;
	leve6_Btn.view.x = button_width-68;
	leve6_Btn.view.y = button_height+188;

	leve7_Btn = widget.newButton{
		labelColor = { default={255}, over={128} },
		default="button_derpina.png",
		over="button_derpina.png",
		id=7,
		onEvent = onwtfBtnRelease	-- event listener function
	}
	--leve2_Btn.view:setReferencePoint( display.CenterReferencePoint )
	leve7_Btn.xScale=1;
	leve7_Btn.yScale=1;
	leve7_Btn.view.x = button_width;
	leve7_Btn.view.y = button_height+188;

	leve8_Btn = widget.newButton{
		labelColor = { default={255}, over={128} },
		default="button_f_yea.png",
		over="button_f_yea.png",
		id=8,
		onEvent = onwtfBtnRelease	-- event listener function
	}
	leve8_Btn.view:setReferencePoint( display.CenterReferencePoint )
	leve8_Btn.xScale=1;
	leve8_Btn.yScale=1;
	leve8_Btn.view.x = button_width+68;
	leve8_Btn.view.y = button_height+188;

	leve9_Btn = widget.newButton{
		labelColor = { default={255}, over={128} },
		default="button_forever_alone.png",
		over="button_forever_alone.png",
		id=9,
		onEvent = onwtfBtnRelease
	}
	leve9_Btn.view:setReferencePoint( display.CenterReferencePoint )
	leve9_Btn.xScale=1;
	leve9_Btn.yScale=1;
	leve9_Btn.view.x = button_width+136;
	leve9_Btn.view.y = button_height+188;	

	leve10_Btn = widget.newButton{
		labelColor = { default={255}, over={128} },
		default="button_troll_face.png",
		over="button_troll_face.png",
		id=10,
		onEvent = onwtfBtnRelease	-- event listener function
	}
	leve10_Btn.view:setReferencePoint( display.CenterReferencePoint )
	leve10_Btn.xScale=1;
	leve10_Btn.yScale=1;
	leve10_Btn.view.x = button_width+204;
	leve10_Btn.view.y = button_height+188;

	buttonGroup:insert( leve1_Btn.view)
	buttonGroup:insert( leve2_Btn.view)
	buttonGroup:insert( leve3_Btn.view)
	buttonGroup:insert( leve4_Btn.view)
	buttonGroup:insert( leve5_Btn.view)
	buttonGroup:insert( leve6_Btn.view)
	buttonGroup:insert( leve7_Btn.view)
	buttonGroup:insert( leve8_Btn.view)
	buttonGroup:insert( leve9_Btn.view)
	buttonGroup:insert( leve10_Btn.view)

	------------------
	-- MUST return a display.newGroup()
	------------------
	
	return localGroup
	
end
