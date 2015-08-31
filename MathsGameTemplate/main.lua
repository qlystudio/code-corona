-------------------------------------------------------------------------
--T and G Apps Ltd.
--Created by Jamie Trinder
--www.tandgapps.co.uk

--CoronaSDK version 2013.1179 was used for this template.

--You are not allowed to publish this template to the Appstore as it is. 
--You need to work on it, improve it and replace the graphics. 

--For questions and/or bugs found, please contact me using our contact
--form on http://www.tandgapps.co.uk/contact-us/
-------------------------------------------------------------------------


--Initial Settings
display.setStatusBar( display.HiddenStatusBar ) --Hide status bar from the beginning



--Import director class
local localGroup = display.newGroup()
director = require("director") --Our scene management system
localGroup:insert(director.directorView)



--Create our global maths game type variable.
--We do it here so we don't have to load/save it in various scenes.
--Generally you should avoid globals, but used properly like this its ok.
_G.mathsType = "add"


--Now make our global font variable. This saves us having to type in our custom font name everytime we use it
--You can use the below commented loop for seeing all the fonts.
-- local fonts = native.getFontNames()
-- for i=1, #fonts do print(fonts[i]) end
_G.chalkfFont = "KGTenThousandReasons"





--Our global play sound function and local sounds.
--Its placed here as we only have a few sounds and this makes it easy for any scene to play them!
local sounds = {}
sounds["select"] = audio.loadSound("sounds/Select.mp3")
sounds["right"] = audio.loadSound("sounds/right.mp3")
sounds["wrong"] = audio.loadSound("sounds/wrong.mp3")
function playSound( name ) --Just pass a name to it. e.g. "select"
	audio.play(sounds[name])
end




--Now change to the menu.
director:changeScene( "menu" )
