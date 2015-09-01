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
				name = "Smashion Facebook Test",
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
		if fbCommand == GET_USER_INFO then
			facebook.request( "me" )
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
				-- picture = "http://www.coronalabs.com/links/demo/Corona90x90.png",
				picture = "Icon.png",
				actions = json.encode( { { name = "Learn More", link = "http://coronalabs.com" } } )
			}
		
			facebook.request( "me/feed", "POST", attachment )		-- posting the photo
		end
		
		-- This code posts a message to your Facebook Wall
		if fbCommand == POST_MSG then
			local time = os.date("*t")
			local postMsg = {
				message = "Posting from Smashion Facebook App " ..
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
	        
	        if fbCommand == GET_USER_INFO then
				statusMessage.textObject.text = response.name
				printTable( response, "User Info", 3 )
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