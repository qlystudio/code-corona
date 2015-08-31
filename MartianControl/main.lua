--***********************************************************************************************--
--***********************************************************************************************--

-- 
-- Abstract: Martian Control sample project 
-- Designed and created by Jonathan and Biffy Beebe of Beebe Games exclusively for Ansca, Inc.
-- http://beebegamesonline.appspot.com/

-- (should work on all iOS and Android devices, optimized for retina display)
-- 
-- Version: 1.0
-- 
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.

--***********************************************************************************************--
--***********************************************************************************************--


-- SOME INITIAL SETTINGS
display.setStatusBar( display.HiddenStatusBar ) --Hide status bar from the beginning

-- Import director class
local director = require("director")

-- Create a main group
local mainGroup = display.newGroup()

-- Main function
local function main()
	
	-- Add the group from director class
	mainGroup:insert(director.directorView)
	
	-- Some global game variables to pass to other modules
	numPlanets = 1				--> value 1 - 5
	levelQuota = 5				--> how many planets need to be invaded to complete the level
	flyingObjectSpawnRate = 3	--> how many seconds between each flying object spawn
	levelNumber = 1
	startScore = 0
	
	director:changeScene( "loadmainmenu" )
	
	return true
end

-- Begin
main()