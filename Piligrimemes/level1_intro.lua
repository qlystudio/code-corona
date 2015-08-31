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

local localGroup, backgroundGroup

new = function ()
	
	------------------
	-- Groups
	------------------
	
	localGroup = display.newGroup()
	backgroundGroup = display.newGroup()
	
	localGroup:insert(backgroundGroup)
	
	------------------
	-- Your code here
	------------------
		
	director:changeFxTime ( 1000 ) 

	local tween
	local background
	local narration
	
	function scene0()
		narration = audio.loadSound("level1/intro0.ogg")
		narrationChannel = audio.play( narration )
		background = display.newImageRect( "level1/intro0.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		backgroundGroup:insert(background)
		tween = transition.to( background, { delay=4000,time=1000, alpha=0.0, onComplete=scene1_fadein })
	end

	function scene1_fadein()
		narration = audio.loadSound("level1/courage.ogg")
		narrationChannel = audio.play( narration , {fadein=10000})
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro1.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene1_fadeout })
	end

	function scene1_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene1_1 })
	end

	function scene1_1()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro1.1.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=3600, alpha=0.0, onComplete=scene1_2 })
	end

	function scene1_2()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro1.2.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=3600, alpha=0.0, onComplete=scene1_3 })
	end

	function scene1_3()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro1.3.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=3600, alpha=0.0, onComplete=scene1_4 })
	end

	function scene1_4()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro1.4.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=3600, alpha=0.0, onComplete=scene2_fadein })
	end

	--[[
	function scene1_5()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro1.5.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=3600, alpha=0.0, onComplete=scene2_fadein })
	end
	--]]

	function scene2_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro2.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene2_fadeout })
	end

	function scene2_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene2_1_fadein })
	end

	function scene2_1_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro2.1.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene2_1_fadeout })
	end

	function scene2_1_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene3_fadein })
	end

	function scene3_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro3.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene3_fadeout })
	end

	function scene3_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene3_1_fadein })
	end

	function scene3_1_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro3.1.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene3_1_fadeout })
	end

	function scene3_1_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene3_2_fadein })
	end

	function scene3_2_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro3.2.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene3_2_fadeout })
	end

	function scene3_2_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene3_3_fadein })
	end

	function scene3_3_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro3.3.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene3_3_fadeout })
	end

	function scene3_3_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene4_fadein })
	end

	function scene4_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro4.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene4_fadeout })
	end

	function scene4_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene5_1_fadein })
	end

	function scene5_1_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro5.1.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=1000, alpha=1.0, onComplete=scene5_2 })
	end

	function scene5_2() 
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro5.2.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=1000, alpha=1.0, onComplete=scene5_3 })
	end

	function scene5_3() 
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro5.3.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=1000, alpha=1.0, onComplete=scene5_4 })
	end

	function scene5_4() 
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro5.4.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=1000, alpha=1.0, onComplete=scene5_5 })
	end

	function scene5_5() 
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro5.5.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=1000, alpha=1.0, onComplete=scene5_5_fadeout })
	end

	function scene5_5_fadeout()
		tween = transition.to( background, { time=3000, alpha=0.0, onComplete=terminate })
	end

	--[[
	function scene5_1_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene5_2_fadein })
	end

	function scene5_2_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro5.2.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene5_2_fadeout })
	end

	function scene5_2_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene5_3_fadein })
	end

	function scene5_3_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro5.3.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene5_3_fadeout })
	end

	function scene5_3_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene5_4_fadein })
	end

	function scene5_4_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro5.4.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene5_4_fadeout })
	end

	function scene5_4_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=scene5_5_fadein })
	end

	function scene5_5_fadein()
		backgroundGroup:remove(background)
		background = display.newImageRect( "level1/intro5.5.jpg", display.contentWidth, display.contentHeight )
		background:setReferencePoint( display.TopLeftReferencePoint )
		background.x, background.y = 0, 0
		background.alpha = 0.0
		backgroundGroup:insert(background)
		tween = transition.to( background, { time=5000, alpha=1.0, onComplete=scene5_5_fadeout })
	end

	function scene5_5_fadeout()
		tween = transition.to( background, { time=5500, alpha=0.0, onComplete=terminate })
	end
	--]]

	function terminate()
		audio.fadeOut({ time=3000 } )
		backgroundGroup:remove(background)
		transition.cancel(tween)
		Runtime:removeEventListener("tap", Runtime)
		director:changeScene("level1", "fade")
	end

	function Runtime:tap(event) 
		print ("tap")
		terminate()
	end

	timer.performWithDelay( 1000, scene0 )
	Runtime:addEventListener("tap", Runtime)
	
	return localGroup
end

