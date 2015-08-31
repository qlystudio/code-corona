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
	
	local localGroup = display.newGroup()
	local backgroundGroup = display.newGroup()
	
	localGroup:insert(backgroundGroup)
	
	------------------
	-- Your code here
	------------------
	
	print(score)
	
	director:changeFxTime ( 1000 ) 
	
	background = display.newImageRect( "level2/intro.jpg", display.contentWidth, display.contentHeight )
	background:setReferencePoint( display.TopLeftReferencePoint )
	background.x, background.y = 0, 0
	backgroundGroup:insert(background)
	
	function background:tap( event )
		print ("estou no lvel1_intro_old")
		director:changeScene("old_levels/level2, "moveFromRight")
	end

	background:addEventListener( "tap", background )

	
	------------------
	-- MUST return a display.newGroup()
	------------------
	
	return localGroup
end

