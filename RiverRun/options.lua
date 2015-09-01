-----------------------------------------------------------------------------------------
--
-- options.lua
--
-----------------------------------------------------------------------------------------
local storyboard = require( "storyboard" )
local sceneOpt = storyboard.newScene()
require ("config")


-- include Corona's "widget" library
local widget = require "widget"

print("options")
--------------------------------------------

-- forward declarations and other locals
local background
local background2
local soundBtn
local soundTxt
local tiltTabBtn
local tiltTabTxt
local left0Btn
local right0Btn
local left1Btn
local right1Btn
local returnBtn, topImage

local function menuBtnRelease()

	print("Leaving Options")
	storyboard.gotoScene( "menu", "fade", 500 )

	return true	-- indicates successful touch
end

local function left0BtnRelease()

	if audio.getVolume() > .1 then
		audio.setVolume(audio.getVolume() - .1);
	else
		audio.setVolume(0);
	end
	soundTxt.text = math.round(audio.getVolume()*100)
	return true	-- indicates successful touch
end

local function right0BtnRelease()

	if audio.getVolume() < .9 then
		audio.setVolume(audio.getVolume() + .1);
	else
		audio.setVolume(1);
	end
	soundTxt.text = math.round(audio.getVolume()*100)
	return true	-- indicates successful touch
end

local function soundBtnRelease()

	if application.TiltTapSetting.tiltTapSetting == "Tap" then
		application.TiltTapSetting.tiltTapSetting = "Tilt"
	else
		application.TiltTapSetting.tiltTapSetting = "Tap"
	end
	tiltTabTxt.text = application.TiltTapSetting.tiltTapSetting
	return true	-- indicates successful touch
end

-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function sceneOpt:createScene( event )
	storyboard.removeAll()
	local group = self.view
	background = display.newImageRect( "Images/water.png", display.contentWidth, display.contentHeight )
	background2 = display.newImageRect( "Images/water2.png", display.contentWidth, display.contentHeight )
	
	soundTxt = display.newText("",20,40,native.systemFont,36)
	soundTxt.x = display.contentWidth*0.5
	soundTxt.y = display.contentHeight - 300
	soundTxt.text = math.round(audio.getVolume()*100)
	
	tiltTabTxt = display.newText("",20,40,native.systemFont,36)
	tiltTabTxt.x = display.contentWidth*0.5
	tiltTabTxt.y = display.contentHeight - 150
	tiltTabTxt.text = application.TiltTapSetting.tiltTapSetting
	
	-- display a background image
	background2.x = 160
	background2.y = -240
	background:setReferencePoint( display.TopLeftReferencePoint )
	background2:setReferencePoint( display.TopLeftReferencePoint )
	background.x, background.y = 0, 0

	-- create a widget button (which will loads level1.lua on release)
	soundBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/Options/sound.gif",
		width=150, height=50
	}
	soundBtn:setReferencePoint( display.CenterReferencePoint )
	soundBtn.x = display.contentWidth*0.5
	soundBtn.y = display.contentHeight - 350

	-- create a widget button (which will loads level1.lua on release)
	left0Btn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/Options/left.gif",
		width=75, height=50,
		onRelease = left0BtnRelease	-- event listener function
	}
	left0Btn:setReferencePoint( display.CenterReferencePoint )
	left0Btn.x = display.contentWidth*0.20
	left0Btn.y = display.contentHeight - 300

	-- create a widget button (which will loads level1.lua on release)
	right0Btn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/Options/right.gif",
		width=75, height=50,
		onRelease = right0BtnRelease	-- event listener function
	}
	right0Btn:setReferencePoint( display.CenterReferencePoint )
	right0Btn.x = display.contentWidth*0.80
	right0Btn.y = display.contentHeight - 300

	-- create a widget button (which will loads level1.lua on release)
	tiltTabBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/Options/tiltTab.gif",
		width=150, height=50
	}
	tiltTabBtn:setReferencePoint( display.CenterReferencePoint )
	tiltTabBtn.x = display.contentWidth*0.5
	tiltTabBtn.y = display.contentHeight - 200

	-- create a widget button (which will loads level1.lua on release)
	left1Btn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/Options/left.gif",
		width=75, height=50,
		onRelease = soundBtnRelease	-- event listener function
	}
	left1Btn:setReferencePoint( display.CenterReferencePoint )
	left1Btn.x = display.contentWidth*0.20
	left1Btn.y = display.contentHeight - 150

	-- create a widget button (which will loads level1.lua on release)
	right1Btn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/Options/right.gif",
		width=75, height=50,
		onRelease = soundBtnRelease	-- event listener function
	}
	right1Btn:setReferencePoint( display.CenterReferencePoint )
	right1Btn.x = display.contentWidth*0.80
	right1Btn.y = display.contentHeight - 150
	
	topImage = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/options.gif",
		width=display.contentWidth*1, height=75,
	}
	topImage:setReferencePoint( display.CenterReferencePoint )
	topImage.x = display.contentWidth*0.5
	topImage.y = display.contentHeight*0.085

	returnBtn = widget.newButton{
		label="          ",
		labelColor = { default={255}, over={128} },
		defaultFile="Images/return.gif",
		--overFile="Images/button-over.gif",
		width=display.contentWidth*1, height=75,
		onRelease = menuBtnRelease	-- event listener function
	}
	returnBtn:setReferencePoint( display.CenterReferencePoint )
	returnBtn.x = display.contentWidth*0.5
	returnBtn.y = display.contentHeight - 40

	-- all display objects must be inserted into group
	group:insert( background )
	group:insert( background2 ) 
	group:insert( soundBtn )
	group:insert( soundTxt )
	group:insert( tiltTabBtn )
	group:insert( tiltTabTxt )
	group:insert( left0Btn )
	group:insert( right0Btn )
	group:insert( left1Btn )
	group:insert( right1Btn )
	group:insert( topImage )
	group:insert( returnBtn ) 
	
end

-- Called immediately after scene has moved onscreen:
function sceneOpt:enterScene( event )
	local group = self.view
	
	background.enterFrame = scroll
	Runtime:addEventListener("enterFrame", background)

	background2.enterFrame = scroll
	Runtime:addEventListener("enterFrame", background2)
	
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
end

-- Called when scene is about to move offscreen:
function sceneOpt:exitScene( event )
	local group = self.view
	
	Runtime:removeEventListener("enterFrame", background)
	
	Runtime:removeEventListener("enterFrame", background2)
	
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function sceneOpt:destroyScene( event )
	local group = self.view

        if menuBtn then
		menuBtn:removeSelf()	-- widgets must be manually removed
		menuBtn = nil
	end
	
	if soundBtn then
		soundBtn:removeSelf()	-- widgets must be manually removed
		soundBtn = nil
	end
	
	if tiltTabBtn then
		tiltTabBtn:removeSelf()	-- widgets must be manually removed
		tiltTabBtn = nil
	end

	if left0Btn then
		left0Btn:removeSelf()	-- widgets must be manually removed
		left0Btn = nil
	end

	if right0Btn then
		right0Btn:removeSelf()	-- widgets must be manually removed
		right0Btn = nil
	end

	if left1Btn then
		left1Btn:removeSelf()	-- widgets must be manually removed
		left1Btn = nil
	end

	if right1Btn then
		right1Btn:removeSelf()	-- widgets must be manually removed
		right1Btn = nil
	end

end

function scroll(self, event)
		speed = 1.5
		if self.y >= 475 then
			self.y = -480
		else
			self.y = self.y + (speed+1)
		end
	end
-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
sceneOpt:addEventListener( "createScene", sceneOpt )

-- "enterScene" event is dispatched whenever scene transition has finished
sceneOpt:addEventListener( "enterScene", sceneOpt )

-- "exitScene" event is dispatched whenever before next scene's transition begins
sceneOpt:addEventListener( "exitScene", sceneOpt )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
sceneOpt:addEventListener( "destroyScene", sceneOpt )

-----------------------------------------------------------------------------------------

return sceneOpt