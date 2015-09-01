

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local parallax = require ("parallax")
local json = require("json")

local GGTwitter = require("GGTwitter")
local twitter

local startB
local creditsB
local title
local bg

local myScene

local bottom

local troll

local GGFacebook = require( "GGFacebook" )
local facebook

local appID = "407721892669696"


----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------
local function onTouch( event )

	local phase = event.phase
	
	print("hola")
	if phase == "began" then
		
		
		
	elseif phase == "moved" then
		-- move scene as the event moves
		--myScene:move( event.x - myScene.xPrev, event.y - myScene.yPrev )
		-- store location as previous
		
	
	elseif phase == "ended" or phase == "cancelled" then
		-- un-focus scene
		--display.getCurrentStage():setFocus( myScene, nil )

	end
	
	return true
	
end

function goGame()

	storyboard.gotoScene( "game_scene", "slideLeft", 800  )
end


local function listenerFb(event)

		

	if ( "session" == event.type ) then
		
		if event.phase ~= "login" then
			-- Exit if login error
			return
		end

		facebook:requestMe()

	elseif ( "request" == event.type ) then

		local response = event.response
        
		if ( not event.isError ) then
	        response = json.decode( event.response )
	        
	        statusMessage.text = response.name
				--printTable( response, "User Info", 3 )
				--print( "name", response.name )
			
				
				--printTable( event.response, "Post Failed Response", 3 )
			
		else
			statusMessage.text = "Post failed"
		end

	end


end

local listenerTw = function( event )
    --native.showAlert("EVENT","Autorize",{"OK"})
    if event.phase == "authorised" then

    	--twitter:post( "Hello, world!" )
    	--native.showAlert("LOGIN","Finish",{"OK"})
    end
end

function loginFb()
	
	facebook = GGFacebook:new( appID, listenerFb, {"publish_stream"} )

	facebook:login()

	--twitter = GGTwitter:new( "i4PdTQDJyuDkoFtBmMA", "vVzyBq1QKtPCwtMCczCwOY4zWCAsXlVh1fwluSjw", listenerTw )

	--twitter:authorise()

	--native.showAlert("LOGIN",twitter:isAuthorised(),{"OK"})

	
end
----------------------------------------------------------------------------
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

	bottons = myScene:newLayer(
	{
		image = "intro_bg.jpg",
		width = 0,               -- This is dimensions of the image
		height = 0,
		bottom = 480,              -- Sometimes it makes sense to use bottom/left
		left = 0,
	    speed = 0,
	    repeated = "vertical"    -- You can choose "horizontal" "vertical" or "both" directions to repeat
	} )




	myScene:newLayer(
	{
		image = "intro_bg.jpg",
		width = 320,               -- This is dimensions of the image
		height = 480,
		bottom = 480,              -- Sometimes it makes sense to use bottom/left
		left = 0,
	    speed = 0,
	    repeated = "vertical"    -- You can choose "horizontal" "vertical" or "both" directions to repeat
	} )

	local group = self.view
	--group:insert(myScene)



	--bg = display.newImage('bg.png')
	
	title = display.newImage('title_intro.png')
	title.y= 170
	title.x=display.contentWidth/2

	troll= display.newImage('troll_completo.png')
	troll.x=display.contentWidth/2
	troll.y=85
	troll.name="troll"
	
	startB = display.newImage('startBtn.png')
	startB.x = display.contentCenterX
	startB.y = display.contentCenterY
	startB.name = 'startB'
	
	creditsB = display.newImage('creditsBtn.png')
	creditsB.x = display.contentCenterX
	creditsB.y = display.contentCenterY + 60
	creditsB.name = 'creditsB'

	facebookB=display.newImage('facebook_login.png')
	facebookB.x=display.contentCenterX
	facebookB.y=creditsB.y+60


	statusMessage=display.newText( "", display.contentCenterX, facebookB.y+75, "bladerunner",15 )

	myScene:insertObj(troll,bottons)
	myScene:insertObj(title,bottons)
	myScene:insertObj(startB,bottons)
	myScene:insertObj(creditsB,bottons)
	myScene:insertObj(facebookB,bottons)
	myScene:insertObj(statusMessage,bottons)

	--group:insert(bg)
	
	group:insert(myScene)

	

	--local obj = 
	--image=obj
	--print(myScene:getObjects(bg).bgX[1].name)
	
	
	--myScene:getObjects(bg).bgX[1]:addEventListener( "touch", onTouch )

	
	--image = 
	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	startB:addEventListener('tap', goGame)
	facebookB:addEventListener('tap', loginFb)
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	--myScene:getObjects(bg).bgX[1]:removeEventListener( "touch", onTouch )

	startB:removeEventListener('tap', goGame)
	facebookB:removeEventListener('tap', loginFb)
	
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