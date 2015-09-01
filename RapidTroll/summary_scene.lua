local storyboard = require( "storyboard" )

local scene = storyboard.newScene()

local checkText

require("ice")
local scores = ice:loadBox( "scores" )

local home

local refresh

local parallax = require( "parallax" )

local GGFacebook = require( "GGFacebook" )

local appID = "407721892669696"

local facebook

local myScene

local game

local bg

local bestText
local bestText2
local bestText3
local cText
local star

local facebookB

local fbString=""



----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	
	myScene = parallax.newScene(
	{
		width = 320,
		height = 480,
		bottom = 480,            -- So the bottom lines up with the bottom of the screen
		left = 0,
	    repeated = "false"         -- Optional, repeated defaults to false
	} )

	game =myScene:newLayer(
	{
		image = "wood.jpg",
		width = 0,               -- This is dimensions of the image
		height = 0,
		bottom = 480,              -- Sometimes it makes sense to use bottom/left
		left = 0,
	    speed = 0,
	    repeated = "vertical"    -- You can choose "horizontal" "vertical" or "both" directions to repeat
	} )


	bg =myScene:newLayer(
	{
		image = "wood.jpg",
		width = 320,               -- This is dimensions of the image
		height = 480,
		bottom = 480,              -- Sometimes it makes sense to use bottom/left
		left = 0,
	    speed = 2,
	    repeated = "vertical"   -- You can choose "horizontal" "vertical" or "both" directions to repeat
	} )

	local group = self.view
	
	local ach = display.newImage("achievement.png")
	ach.xScale=0.4
	ach.yScale=0.4
	ach.x=60
	ach.y=60

	myScene:insertObj(ach,bg)

	local scoreText = display.newText( "SUMMARY", ach.x+70, ach.y-20, "bladerunner", 28 )
	
	scoreText:setTextColor(255, 255, 255)

	myScene:insertObj(scoreText,bg)

	local flag = display.newImage("flag.png")
	
	flag.x=ach.x
	flag.y=ach.y +120

	myScene:insertObj(flag,bg)


	star = display.newImage("star.png")
	star.xScale=0.4
	star.yScale=0.4
	star.x=ach.x - 5
	star.y=ach.y +200

	myScene:insertObj(star,bg)

	bestText = display.newText( "BEST SCORE", ach.x+40, star.y-15, "bladerunner", 26 )
	
	bestText:setTextColor(255, 255, 255)

	myScene:insertObj(bestText,bg)

	cText = display.newText( "CHECKPOINT", ach.x+40, star.y-100, "bladerunner", 26 )
	
	cText:setTextColor(255, 255, 255)

	myScene:insertObj(cText,bg)


	bestText2 = display.newText( "BEST SCORE:", ach.x+18, star.y+40, "bladerunner", 26 )
	
	bestText2:setTextColor(255, 255, 255)

	myScene:insertObj(bestText2,bg)

	bestText3 = display.newText( "10000", ach.x+65, star.y+65, "bladerunner", 26 )
	
	bestText3:setTextColor(255, 255, 255)

	myScene:insertObj(bestText3,bg)


	group:insert(myScene)

	checkText = display.newText( "a-d", cText.x/2+55, star.y-80, "bladerunner", 26 )
	
	checkText:setTextColor(255, 255, 255)

	group:insert(checkText)


	refresh = display.newImage("reload.png")
	refresh.xScale=0.4
	refresh.yScale=0.4
	refresh.x=display.contentWidth/2 - 70
	refresh.y=display.contentHeight -50



	myScene:insertObj(refresh,bg)


	home = display.newImage("home.png")
	home.xScale=0.4
	home.yScale=0.4
	home.x=display.contentWidth/2 + 70
	home.y=display.contentHeight -50



	myScene:insertObj(home,bg)


	facebookB=display.newImage('btn_share.jpg')
	facebookB.x=display.contentCenterX
	facebookB.y=125
	facebookB.xScale=0.4
	facebookB.yScale=0.4

	myScene:insertObj(facebookB,bg)

	

	
	

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	
end

function goGame()

	storyboard.gotoScene( "game_scene", "slideLeft", 800  )
end

function goHome()

	storyboard.gotoScene( "intro_scene", "slideLeft", 800  )
end

local function listenerFb(event)

		

	if ( "session" == event.type ) then
		
		if event.phase ~= "login" then
			-- Exit if login error
			return
		end
		--facebook:uploadImage( "Look out, Rapid Troll!", "icono_game.jpg", system.DocumentsDirectory )
		--facebook:requestMe()

	elseif ( "request" == event.type ) then

		local response = event.response
        
		if ( not event.isError ) then
	        --response = json.decode( event.response )
	        native.showAlert("Facebook","Picture posted!",{ "OK"})
	        --statusMessage.text = response.name
				--printTable( response, "User Info", 3 )
				--print( "name", response.name )
			
				
				--printTable( event.response, "Post Failed Response", 3 )
			
		else
			--statusMessage.text = "Post failed"
		end

	end


end

function postFb()
	facebook = GGFacebook:new( appID, listenerFb, {"publish_stream"} )

	facebook:login()

	facebook:simplePost( fbString, "http://s11.postimg.org/belx3dhdb/icono_game.jpg" )
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	storyboard.purgeScene( "game_scene" )
	
	
	scores = ice:loadBox( "scores" )

	bestText3.text = scores:retrieve("best")
	if(not scores:retrieve( "last")) then
		star.alpha=0
		bestText.alpha=0
	else
		star.alpha=1
		bestText.alpha=1
	end

	

	if(scores:retrieve("checkpoints")==0) then

		checkText.text="NONE"

	elseif(scores:retrieve("checkpoints")==1) then
		checkText.text="a"
	else
		checkText.text="a-"..string.char(97+scores:retrieve("checkpoints")-1)
	end


	local group = self.view

	refresh:addEventListener('tap', goGame)
	home:addEventListener('tap', goHome)

	

	if(scores:retrieve( "last")) then
		fbString = fbString.."I got Highest Score on Rapid Troll! "
	else
		fbString = fbString.."New Rapid Troll game is awesome! "
	end

	fbString = fbString.."I scored "..bestText3.text.." !!! "

	if(checkText.text=="NONE") then
		fbString=fbString.."With NO CHECKPOINTS =( ! Buy I had a lot of fun! Play it!"
	else
		fbString=fbString.."CHECKPOINTS "..checkText.text..". I'm a PRO player!!!"
	end


	facebookB:addEventListener('tap', postFb)

	

	--facebook:uploadImage( "Look out, Rapid Troll!", "icono_game.jpg", system.DocumentsDirectory )

	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	fbString=""
	refresh:removeEventListener('tap', goGame)
	home:removeEventListener('tap', goHome)
	facebookB:removeEventListener('tap', postFb)
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene