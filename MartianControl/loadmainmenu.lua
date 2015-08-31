module(..., package.seeall)

-- Main function - MUST return a display.newGroup()
function new()
	local localGroup = display.newGroup()
	
	local theTimer
	local loadingImage
	
	local showLoadingScreen = function()
		loadingImage = display.newImageRect( "loading.png", 480, 320 )
		loadingImage.x = 240; loadingImage.y = 160
		
		localGroup:insert( loadingImage )
		
		local goToLevel = function()
			director:changeScene( "mainmenu" )
		end
		
		theTimer = timer.performWithDelay( 1000, goToLevel, 1 )
	end
	
	showLoadingScreen()
	
	unloadMe = function()
		if theTimer then timer.cancel( theTimer ); end
	end
	
	-- MUST return a display.newGroup()
	return localGroup
end
