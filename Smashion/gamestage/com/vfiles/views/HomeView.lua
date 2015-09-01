local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"
local sceneGroup, stage, bg, frame, logo, models
local startBtn, fbBtn
local _W, _H, dimension, frameStrokeWidth = display.contentWidth, display.contentHeight, 568, 8


-------------------------------- START FB CODE -------------------------------------------
-- Comment out the next line when through debugging your app.
io.output():setvbuf('no') 		-- **debug: disable output buffering for Xcode Console **tjn

-- local widget = require("widget")
local facebook = require("facebook")
local json = require("json")

	
-- Facebook Commands
local statusMessage
local fbCommand			-- forward reference
local LOGOUT = 1
local SHOW_DIALOG = 2
local POST_MSG = 3
local POST_PHOTO = 4
local SHOW_HI_SCORE = 5
local GET_PLATFORM_INFO = 6

local fbButton, fbButton2, fbButton3, fbButton4, fbButton5

-- Layout Locations
local ButtonOrigY = 15
local ButtonYOffset = 45
local StatusMessageY = 420		-- position of status message


-- ------------------------------------ START FACEBOOK CODE --------------------------------------------- --
local appId  = '1458620504414013'	-- Add  your App ID here (also go into build.settings and replace XXXXXXXXX with your appId under CFBundleURLSchemes)
local apiKey = nil	-- Not needed at this time
-- NOTE: You must provide a valid application id provided from Facebook


-------------------------------- end FB CODE -------------------------------------------


--------------------------------------------------
-- Private workers
--------------------------------------------------
local function rotateScreen(isPortrait)
	_W, _H = display.contentWidth, display.contentHeight
	stage.x, stage.y = _W/2, _H/2
	frame.width, frame.height = _W-frameStrokeWidth, _H-frameStrokeWidth

	startBtn:moveTo(-startBtn.width/2, _H/2 - 110)

	if isPortrait then
		logo[1]:moveTo(0,-10)
		logo[2]:moveTo(0, 60)	
		logo.y = - _H/2 + logo.height/2 - 10
		models[1].x = 80
		models[2].x = -80
		models[3].x = 130
		models[4].x = -130	
		models.y = 170 - (_H-480)/2
	else
		logo[1]:moveTo(-92,-24)
		logo[2]:moveTo(62,-24)
		logo.y = - _H/2 + logo.height
		models[1].x = 120
		models[2].x = -120
		models[3].x = 200
		models[4].x = -200
		models.y = 170
	end

end

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
	if event.type == "faceUp" or event.type == "faceDown" then return false end	
  rotateScreen(string.find(event.type, "portrait") == 1)
end

local function startBtnTapEvent(e)
	composer.gotoScene( "com.vfiles.views.WorldMapView", "fade", 500 )
end

--------------------------------------------------
-- FACEBOOK Listeners
--------------------------------------------------
-- This function is useful for debugging problems with using FB Connect's web api,
-- e.g. you passed bad parameters to the web api and get a response table back
local function printTable( t, label, level )
	if label then print( label ) end
	level = level or 1

	if t then
		for k,v in pairs( t ) do
			local prefix = ""
			for i=1,level do
				prefix = prefix .. "\t"
			end

			print( prefix .. "[" .. tostring(k) .. "] = " .. tostring(v) )
			if type( v ) == "table" then
				print( prefix .. "{" )
				printTable( v, nil, level + 1 )
				print( prefix .. "}" )
			end
		end
	end
end

local function createStatusMessage( message, x, y )
	-- Show text, using default bold font of device (Helvetica on iPhone)
	local textObject = display.newText( message, 0, 0, native.systemFontBold, 24 )
	textObject:setFillColor( 1,1,1 )

	-- A trick to get text to be centered
	local group = display.newGroup()
	group.x = x
	group.y = y
	group:insert( textObject, true )

	-- Insert rounded rect behind textObject
	local r = 10
	local roundedRect = display.newRoundedRect( 0, 0, textObject.contentWidth + 2*r, textObject.contentHeight + 2*r, r )
	roundedRect:setFillColor( 55/255, 55/255, 55/255, 190/255 )
	group:insert( 1, roundedRect, true )

	group.textObject = textObject
	return group
end



-- New Facebook Connection listener
--
local function listener( event )

--- Debug Event parameters printout --------------------------------------------------
--- Prints Events received up to 20 characters. Prints "..." and total count if longer
---
	print( "Facebook Listener events:" )
	
	local maxStr = 20		-- set maximum string length
	local endStr
	
	for k,v in pairs( event ) do
		local valueString = tostring(v)
		if string.len(valueString) > maxStr then
			endStr = " ... #" .. tostring(string.len(valueString)) .. ")"
		else
			endStr = ")"
		end
		print( "   " .. tostring( k ) .. "(" .. tostring( string.sub(valueString, 1, maxStr ) ) .. endStr )
	end
--- End of debug Event routine -------------------------------------------------------

    print( "event.name", event.name ) -- "fbconnect"
    print( "event.type:", event.type ) -- type is either "session" or "request" or "dialog"
	print( "isError: " .. tostring( event.isError ) )
	print( "didComplete: " .. tostring( event.didComplete) )
-----------------------------------------------------------------------------------------
	-- After a successful login event, send the FB command
	-- Note: If the app is already logged in, we will still get a "login" phase
	--
    if ( "session" == event.type ) then
        -- event.phase is one of: "login", "loginFailed", "loginCancelled", "logout"
		statusMessage.textObject.text = event.phase		-- tjn Added
		
		print( "Session Status: " .. event.phase )
		
		if event.phase ~= "login" then
			-- Exit if login error
			return
		end
		
		-- The following displays a Facebook dialog box for posting to your Facebook Wall
		if fbCommand == SHOW_DIALOG then

			-- "feed" is the standard "post status message" dialog
			facebook.showDialog( "feed", {
				name = "Test name",
				description = "Example description.",
				link = "http://www.coronasdk.com/"
			})

			-- for "apprequests", message is required; other options are supported
			--[[
			facebook.showDialog( "apprequests", {
				message = "Example message."
			})
			--]]
		end
	
		-- Request the Platform information (FB information)
		if fbCommand == GET_PLATFORM_INFO then
			facebook.request( "platform" )		-- **tjn Displays info about Facebook platform
		end

		-- Request the current logged in user's info
		if fbCommand == SHOW_HI_SCORE then
			-- facebook.request( "me" )
			local access_token = event.access_token
			facebook.request( appId.."/scores", "GET", access_token )
--			facebook.request( "me/friends" )		-- Alternate request
		end

		-- This code posts a photo image to your Facebook Wall
		--
		if fbCommand == POST_PHOTO then
			local attachment = {
				name = "Developing a Facebook Connect app using the Corona SDK!",
				link = "http://www.coronalabs.com/links/forum",
				caption = "Link caption",
				description = "Corona SDK for developing iOS and Android apps with the same code base.",
				picture = "http://www.coronalabs.com/links/demo/Corona90x90.png",
				actions = json.encode( { { name = "Learn More", link = "http://coronalabs.com" } } )
			}
		
			facebook.request( "me/feed", "POST", attachment )		-- posting the photo
		end
		
		-- This code posts a message to your Facebook Wall
		if fbCommand == POST_MSG then
			local time = os.date("*t")
			local postMsg = {
				message = "Posting from Corona SDK! " ..
					os.date("%A, %B %e")  .. ", " .. time.hour .. ":"
					.. time.min .. "." .. time.sec
			}
		
			facebook.request( "me/feed", "POST", postMsg )		-- posting the message
		end
-----------------------------------------------------------------------------------------

    elseif ( "request" == event.type ) then
        -- event.response is a JSON object from the FB server
        local response = event.response
        
		if ( not event.isError ) then
	        response = json.decode( event.response )
	        
	        if fbCommand == SHOW_HI_SCORE then
				statusMessage.textObject.text = response.name
				printTable( response, "HI SCORES", 3 )
				print("THIS IS RESONSE NAME")
				print( "name", response.name )
				
			elseif fbCommand == POST_PHOTO then
				printTable( response, "photo", 3 )
				statusMessage.textObject.text = "Photo Posted"
							
			elseif fbCommand == POST_MSG then
				printTable( response, "message", 3 )
				statusMessage.textObject.text = "Message Posted"
				
			else
				-- Unknown command response
				print( "Unknown command response" )
				statusMessage.textObject.text = "Unknown ?"
			end

        else
        	-- Post Failed
			statusMessage.textObject.text = "Post failed"
			printTable( event.response, "Post Failed Response", 3 )
		end
		
	elseif ( "dialog" == event.type ) then
		-- showDialog response
		--
		print( "dialog response:", event.response )
		statusMessage.textObject.text = event.response
    end
end


--------------------------------------------------
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
local function build(self)
	-- HomeView doesn't have controller. Everything will be built in here
	sceneGroup = self.view
	
	-- Create stage
	stage = display.newGroup()
	sceneGroup:insert(stage)
  
	-- Create frame
	frame = display.newRect(sceneGroup, frameStrokeWidth/2, frameStrokeWidth/2, _W-frameStrokeWidth, _H-frameStrokeWidth )
	frame.anchorX, frame.anchorY = 0, 0
	frame.strokeWidth = frameStrokeWidth
	frame:setFillColor( 0,0,0,0 )
	frame:setStrokeColor( 1,1,0 )

	-- Add bg 
	bg = display.newImageRect(stage, "assets/images/backgrounds/home.jpg", dimension, dimension)

	-- Add logo (group)
	logo = display.newGroup()
	stage:insert(logo)
	display.newBitmapText(logo, "VFILES", 0, 0, "champion-80-logo", 70)
	display.newBitmapText(logo, "{yellow}SMASHION!", 0, 0, "champion-80-logo", 70)

	-- Add models (group)
	models = display.newGroup()
	stage:insert(models)
	display.newImageRect(models, "assets/images/ui/homeview/model-01.png", 78, 458 )
	display.newImageRect(models, "assets/images/ui/homeview/model-02.png", 77, 438 )
	display.newImageRect(models, "assets/images/ui/homeview/model-03.png", 138, 483 )
	display.newImageRect(models, "assets/images/ui/homeview/model-04.png", 153, 524 )
	display.newImageRect(models, "assets/images/ui/homeview/model-05.png", 302, 478 )
	models[2].y = -10
	models[3].y = -20
	models[4].y = 20
	models[5].x, models[5].y = 70, 5

	-- Add start button
	startBtn = SimpleButton:new({
	parent = stage,
	label = "START THE SHOW",
	left = 0,
	top = 0,
	width = 170,
	height = 48,
	fontSize = 40,
	color = {default= {1,1,0}, over = {.925, 0, .549}},
	fontColor = {default= {0,0,0}, over = {1,1,1}},
	onEvent = startBtnTapEvent
	})



	if ( appId ) then
		facebook.login( appId, listener )
		-- ***
		-- ************************ Buttons Functions ********************************
		-- ***
		local function postPhoto_onRelease( event )
			-- call the login method of the FB session object, passing in a handler
			-- to be called upon successful login.
			fbCommand = POST_PHOTO
			-- facebook.login( appId, listener,  {"publish_actions"}  )
			facebook.login( appId, listener,  {"publish_actions"}  )
		end
		
		local function getInfo_onRelease( event )
			-- call the login method of the FB session object, passing in a handler
			-- to be called upon successful login.
			fbCommand = SHOW_HI_SCORE
			-- facebook.login( appId, listener, {"publish_actions"}  )
			facebook.login( appId, listener, {"publish_actions", "user_friends"}  )
		end
		
		local function postMsg_onRelease( event )
			-- call the login method of the FB session object, passing in a handler
			-- to be called upon successful login.
			fbCommand = POST_MSG
			-- facebook.login( appId, listener, {"publish_actions"} )
			facebook.login( appId, listener, {"publish_actions"} )
		end
		
		local function showDialog_onRelease( event )
			-- call the login method of the FB session object, passing in a handler
			-- to be called upon successful login.
			fbCommand = SHOW_DIALOG
			-- facebook.login( appId, listener, {"publish_actions"}  )
			facebook.login( appId, listener, {"publish_actions"}  )
		end
		
		local function logOut_onRelease( event )
			-- call the login method of the FB session object, passing in a handler
			-- to be called upon successful login.
			fbCommand = LOGOUT
			facebook.logout()
		end


		-- status message
		statusMessage = createStatusMessage( "   Not connected  ", _W/2, 100 )
		sceneGroup:insert(statusMessage)


		-- ***
		-- ************************ Create Buttons ********************************
		-- ***


		fbButton = SimpleButton:new({
			parent = sceneGroup,
			label = "      POST PHOTO",
			icon = {path = "assets/images/ui/global/ico-fb-btn.png", width = 130, height = 29},
			width = 130,
			height = 37,
			left =15,
			top = ButtonOrigY,
			fontSize = 32,
			color = {default= {.329, .482, .741}, over = {.173, .369, .694}},
			fontColor = {default= {1,1,1}, over = {1,1,1}},
			onEvent = postPhoto_onRelease
		})
		

		fbButton2 = SimpleButton:new({
			parent = sceneGroup,
			label = "      POST MSG",
			icon = {path = "assets/images/ui/global/ico-fb-btn.png", width = 130, height = 29},
			width = 130,
			height = 37,
			left =15,
			top = ButtonOrigY + ButtonYOffset * 1,
			fontSize = 32,
			color = {default= {.329, .482, .741}, over = {.173, .369, .694}},
			fontColor = {default= {1,1,1}, over = {1,1,1}},
			onEvent = postMsg_onRelease
		})


		fbButton3 = SimpleButton:new({
			parent = sceneGroup,
			label = "     SHOW DIALOG",
			icon = {path = "assets/images/ui/global/ico-fb-btn.png", width = 130, height = 29},
			width = 130,
			height = 37,
			left =15,
			top = ButtonOrigY + ButtonYOffset * 2,
			fontSize = 32,
			color = {default= {.329, .482, .741}, over = {.173, .369, .694}},
			fontColor = {default= {1,1,1}, over = {1,1,1}},
			onEvent = showDialog_onRelease
		})

		
		-- "Get User Info with Facebook" button
		fbButton4 = SimpleButton:new({
			parent = sceneGroup,
			label = "    HIGH SCORES",
			icon = {path = "assets/images/ui/global/ico-fb-btn.png", width = 130, height = 29},
			width = 130,
			height = 37,
			left =15,
			top = ButtonOrigY + ButtonYOffset * 3,
			fontSize = 32,
			color = {default= {.329, .482, .741}, over = {.173, .369, .694}},
			fontColor = {default= {1,1,1}, over = {1,1,1}},
			onEvent = getInfo_onRelease
		})
		
		-- "Logout with Facebook" button
		fbButton5 = SimpleButton:new({
			parent = sceneGroup,
			label = "    LOG OUT",
			icon = {path = "assets/images/ui/global/ico-fb-btn.png", width = 130, height = 29},
			width = 130,
			height = 37,
			left =15,
			top = ButtonOrigY + ButtonYOffset * 4,
			fontSize = 32,
			color = {default= {.329, .482, .741}, over = {.173, .369, .694}},
			fontColor = {default= {1,1,1}, over = {1,1,1}},
			onEvent = logOut_onRelease
		})
	else
		-- Handle the response from showAlert dialog boxbox
		--
		local function onComplete( event )
			if event.index == 1 then
				system.openURL( "http://developers.facebook.com/docs/guides/canvas/" )
			end
		end

		native.showAlert( "Error", "To develop for Facebook Connect, you need to get an API key and application secret. This is available from Facebook's website.",
			{ "Learn More", "Cancel" }, onComplete )
	end

	-- ------------------------------------ END FACEBOOK CODE --------------------------------------------- --


	rotateScreen(_W < _H)
end
-- build end

--------------------------------------------------
-- Scene listeners
--------------------------------------------------


-- scene listeners
function scene:create( event )	
	build(self)
end

function scene:show( event )		
		if event.phase == "did" then			
			local prevScene = composer.getSceneName( "previous" )
			if prevScene ~= nil then composer.removeScene(prevScene) end
	end
end

function scene:hide( event )
end

function scene:destroy( event )
	print("Destroy homeview")

	for i=1, #logo do
		logo[1]:removeSelf()
		logo[1] = nil		
	end

	for i=1, #models do
		models[1]:removeSelf()
		models[1] = nil		
	end

	-- DESTROY FB BUTTONS IF APP ID EXISITS
	-- If appId does not exist, then the buttons won't be created in the first place
	if ( appId ) then
		fbButton:destroy()
		fbButton2:destroy()
		fbButton3:destroy()
		fbButton4:destroy()
		fbButton5:destroy()
	end
	-- end bg destroy

	startBtn:destroy()
	frame:removeSelf()
	stage:removeSelf()
	frame = nil
	stage = nil

	scene:removeEventListener("create", scene)
	scene:removeEventListener("show", scene)
	scene:removeEventListener("hide", scene)
	scene:removeEventListener("destroy", scene)
	Runtime:removeEventListener("orientation", onOrientationChange)
	self = nil
end

-- scene events
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
Runtime:addEventListener("orientation", onOrientationChange)

return scene