--
-- Project: Jarokn Dice Cricket
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2013 . All Rights Reserved.
-- 


display.setStatusBar(display.HiddenStatusBar)

local centerX = display.contentCenterX
local centerY = display.contentCenterY

require ("GameAnalytics")
gameNetwork = require ( "gameNetwork" )

GameAnalytics.submitWhileRoaming = true 

GameAnalytics.isDebug = true

GameAnalytics.archiveEvents = true
GameAnalytics.runInSimulator = false

GameAnalytics.init ( {
game_key = "4b5c6bebeb72e1eacdfb9bd42fba45d9",
secret_key = "a9c5df5e7f36405dc806169f20386b814de655c1",
build_name = "1.0.1",
} )

gameNetwork.init("google")

local function showLeaderboardListener()
gameNetwork.show("leaderboards") -- Shows all the leaderboards.
end

local function showAchievementsListener()
gameNetwork.show("achievements") -- Shows the locked and unlocked achievements.
end

function loginLogoutListener(event)


	if gameNetwork.request("isConnected") then
		gameNetwork.request("logout")

	else
		-- Tries to login the user, if there is a problem then it will try to resolve it. eg. Show the log in screen.
		gameNetwork.request("login",
			{
				listener = loginListener,
				userInitiated = true
			})

	end
end

local achievementDebutant = "CgkIyuuHnL8fEAIQAw"
local achievementUpandcomer = "CgkIyuuHnL8fEAIQBA"
local achievementRisingStock = "CgkIyuuHnL8fEAIQBQ"
local achievementDefiniteStarter = "CgkIyuuHnL8fEAIQBg"
local achievementClubCaptain = "CgkIyuuHnL8fEAIQBw"
local achievementStateDebutant = "CgkIyuuHnL8fEAIQCA"
local achievementStateStarter = "CgkIyuuHnL8fEAIQCQ"
local achievementStateCaptain = "CgkIyuuHnL8fEAIQCg"
local achievementNationalDebutan = "CgkIyuuHnL8fEAIQCw"
local achievementNationalStarter = "CgkIyuuHnL8fEAIQDA"
local achievementNationalCaptain = "CgkIyuuHnL8fEAIQDQ"
local achievementNationalStar = "CgkIyuuHnL8fEAIQDg"
local achievementInternationalSuperstar = "CgkIyuuHnL8fEAIQDw"
local achievementCricketHalloffamer = "CgkIyuuHnL8fEAIQEA"
local leaderboardHighestScore = "CgkIyuuHnL8fEAIQEQ"
local score = 0
local wickets = 0
local dice = 0
local dicemin = 1
local dicemax = 100
local rollDice
local scoretxt
local battxt
local dicetxt

local function giveRank()
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   		     identifier = achievementDebutant,
   		 },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   		     identifier = achievementUpandcomer,
   		 },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   		     identifier = achievementRisingStock,
   		 },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   		     identifier = achievementDefiniteStarter,
   		 },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   		     identifier = achievementClubCaptain,
   		 },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   		     identifier = achievementStateDebutant,
   		 },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   		     identifier = achievementStateStarter,
   		 },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   	  	   identifier = achievementStateCaptain,
   		 },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   	    	 identifier = achievementNationalDebutant,
   		 },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   	 	{
   	 	    identifier = achievementNationalStarter,
   	 	},
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   		     identifier = achievementNationalCaptain,
   		 },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   		     identifier = achievementNationalStar,
   		 },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
	{
    	achievement =
  	  {
    	    identifier = achievementInternationalSuperstar,
  	  },
  	  listener=requestCallback
	})
	gameNetwork.request( "unlockAchievement",
		{
   		 achievement =
   		 {
   		     identifier = achievementCricketHalloffamer,
   		 },
  	  listener=requestCallback
	})
end

function rollDice()
	dice = 0
	dice = math.random(1, 100)
	display.remove(dicetxt)
	dicetxt = nil

	if dice < 30 then
		GameAnalytics.newEvent ( "design", { event_id = "Ball:Dot" } )
		score = score
		dicetxt = display.newText("Dot.", 0, 0, "Helvetica", 24)
		dicetxt.x = centerX
		dicetxt.y = centerY
		dicetxt:setTextColor(255, 0, 0)		scoretxt.text = "Score: " .. score .. "/" .. wickets
	elseif dice > 31 and dice < 55 then
		GameAnalytics.newEvent ( "design", { event_id = "Ball:Single"} )
		score = score + 1
		dicetxt = display.newText("Single.", 0, 0, "Helvetica", 24)
		dicetxt.x = centerX
		dicetxt.y = centerY
		dicetxt:setTextColor(255, 0, 0)		scoretxt.text = "Score: " .. score .. "/" .. wickets
	elseif dice > 56 and dice < 70 then
		GameAnalytics.newEvent ( "design", { event_id = "Ball:Double"} )
		score = score + 2
		dicetxt = display.newText("Double.", 0, 0, "Helvetica", 24)
		dicetxt.x = centerX
		dicetxt.y = centerY
		dicetxt:setTextColor(255, 0, 0)		scoretxt.text = "Score: " .. score .. "/" .. wickets
	elseif dice > 71 and dice < 75 then
		GameAnalytics.newEvent ( "design", { event_id = "Ball:Treble"} )
		score = score + 3
		dicetxt = display.newText("Treble.", 0, 0, "Helvetica", 24)
		dicetxt.x = centerX
		dicetxt.y = centerY
		dicetxt:setTextColor(255, 0, 0)		scoretxt.text = "Score: " .. score .. "/" .. wickets
	elseif dice > 76 and dice < 80 then
		GameAnalytics.newEvent ( "design", { event_id = "Ball:Four"} )
		score = score + 4
		dicetxt = display.newText("Four.", 0, 0, "Helvetica", 24)
		dicetxt.x = centerX
		dicetxt.y = centerY
		dicetxt:setTextColor(255, 0, 0)		scoretxt.text = "Score: " .. score .. "/" .. wickets
	else if dice > 91 and dice < 95 then
		GameAnalytics.newEvent ( "design", { event_id = "Ball:Six"} )
		score = score + 6
		dicetxt = display.newText("Six.", 0, 0, "Helvetica", 24)
		dicetxt.x = centerX
		dicetxt.y = centerY		dicetxt:setTextColor(255, 0, 0)
		scoretxt.text = "Score: " .. score .. "/" .. wickets
	else if dice > 96 and dice < 100 then
		GameAnalytics.newEvent ( "design", { event_id = "Ball:Wicket"} )
		wickets = wickets + 1
		dicetxt = display.newText("Out.", 0, 0, "Helvetica", 24)
		dicetxt.x = centerX
		dicetxt.y = centerY		dicetxt:setTextColor(255, 0, 0)
		scoretxt.text = "Score: " .. score .. "/" .. wickets	else		GameAnalytics.newEvent ( "design", { event_id = "Ball:Dot" } )
		score = score
		dicetxt = display.newText("Dot.", 0, 0, "Helvetica", 24)
		dicetxt.x = centerX
		dicetxt.y = centerY
		dicetxt:setTextColor(255, 0, 0)		scoretxt.text = "Score: " .. score .. "/" .. wickets
	endend
	if wickets == 10 then
		native.showAlert( "Game Over", "You scored " .. score .. ".", { "OK" } )
		display.remove(battxt)
		display.remove(scoretxt)
		battxt = nil
		scoretxt = nil
		GameAnalytics.newEvent ( "design", { event_id = "Game:AllOut"} )
		GameAnalytics.newEvent ( "design", { event_id = "Game:Score", value = score} )
		gameNetwork.request( "setHighScore",
			{
			    localPlayerScore = { category=leaderboardHighestScore, value=score },
  			  listener = requestCallback
			})
		giveRank()

		startGame()
	end
end
end

function playGame()
	score = 0
	wickets = 0
	scoretxt = display.newText( "Score: 0/0", 0, 0, "Helvetica", 24 )
	scoretxt.x = centerX
	scoretxt.y = 50
	scoretxt:setTextColor(255, 0, 0)
	battxt = display.newText( "BAT!", 0, 0, "Helvetica", 24)
	battxt.x = centerX
	battxt.y = display.contentHeight - 30
	battxt:setTextColor(255, 0, 0)
	battxt:addEventListener ( "tap", rollDice )
end


function startGame()
	local background = display.newImage("mcg.jpg")
    background.y = centerY
    background.x = centerX
	background.alpha = 1
    local title = display.newText( "Jarokn Cricket", 0, 0, "Helvetica", 24 )
    title.x= centerX
    title.y = 50
    title:setTextColor(255, 0, 0)
	local txt = display.newText( "Tap here to start.", 0, 0, "Helvetica", 24 )
	txt.x = centerX
	txt:setTextColor(255, 0, 0)
	txt.y = display.contentHeight - 30
	local highscore = display.newText( "Highscores", 0, 0, "Helvetica", 24 )
	highscore.x = centerX / 2
	highscore.y = centerY - 50
	highscore:setTextColor(255, 0, 0)
	local achievements = display.newText( "Achievements", 0, 0, "Helvetica", 24 )
	loginLogout = display.newText("Login/out", 0, 0, "Helvetica", 24 )
	achievements.x = centerX / 2
	achievements.y = centerY
	achievements:setTextColor(255, 0, 0)
	loginLogout.x = centerX / 2
	loginLogout.y = centerY + 50
	loginLogout:setTextColor(255, 0, 0)

	local function goAway(event)
		display.remove(event.target)
		display.remove(highscore)
		display.remove(achievements)
		display.remove(loginLogout)
		display.remove(title)
		txt = nil
		highscore = nil
		achievements = nil
		loginLogout = nil
		title = nil
		score = 0
		wickets = 0
		playGame()
	end
	txt:addEventListener ( "tap", goAway )

	achievements:addEventListener ( "tap", showAchievementsListener )
	highscore:addEventListener ( "tap", showLeaderboardListener )
	loginLogout:addEventListener ("tap",  loginLogoutListener )
end

startGame()