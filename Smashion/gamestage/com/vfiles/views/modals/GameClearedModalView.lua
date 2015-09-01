require "com.vfiles.controllers.LevelController"
local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"

local sceneGroup, stage, bg, header, body, footer
local starSheet
local replayBtn, continueBtn, shareBtn
local _W, _H, bgPadding, localData = display.contentWidth, display.contentHeight, 0, {}
local newLevelUnlocked, newCityUnlocked, newCity = false, false, nil
local audioGameWon = audio.loadSound( "assets/audios/game-won.wav" )
local levelController

--------------------------------------------------
-- FACEBOOK VARS
--------------------------------------------------
local facebook = require("facebook")
local json = require("json")
-- Facebook Commands
local statusMessage
local fbCommand     -- forward reference
-- local LOGOUT = 1
-- local SHOW_DIALOG = 2
local POST_MSG = 3
-- local POST_PHOTO = 4
-- local GET_USER_INFO = 5
-- local GET_PLATFORM_INFO = 6

local appId  = '1458620504414013' -- Add  your App ID here (also go into build.settings and replace XXXXXXXXX with your appId under CFBundleURLSchemes)
local apiKey = nil  -- Not needed at this time



-- Layout Locations
local ButtonOrigY = 15
local ButtonYOffset = 45
local StatusMessageY = 420

-- SET UP FBUSER OBJECT TO STORE FB-USER VALUES IN
-- local fbUser = {}
-- local fbApp = {}
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
  
  local maxStr = 20   -- set maximum string length
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
    statusMessage.textObject.text = event.phase   -- tjn Added
    
    print( "Session Status: " .. event.phase )

    -- ACCESS TOKEN NEEDED FOR FB SCORE API
    local my_access_token = event.token
    -- print('This is access_token: ')
    -- print(access_token)


    
    if event.phase ~= "login" then
      -- Exit if login error
      return
    end
    
    -- -- The following displays a Facebook dialog box for posting to your Facebook Wall
    -- if fbCommand == SHOW_DIALOG then

    --   -- "feed" is the standard "post status message" dialog
    --   facebook.showDialog( "feed", {
    --     name = "Smashion!",
    --     description = "A Vfiles Rampage!.",
    --     link = "http://www.vfiles.com/"
    --   })

    --   -- for "apprequests", message is required; other options are supported
    --   --[[
    --   facebook.showDialog( "apprequests", {
    --     message = "Example message."
    --   })
    --   --]]
    -- end
  
--     -- Request the Platform information (FB information)
--     if fbCommand == GET_PLATFORM_INFO then
--       facebook.request( "platform" )    -- **tjn Displays info about Facebook platform
--     end

--     -- Request the current logged in user's info
--     if fbCommand == GET_USER_INFO then
--       facebook.request( "me" )
-- --      facebook.request( "me/friends" )    -- Alternate request
--     end

    -- This code posts a photo image to your Facebook Wall
    --
    -- if fbCommand == POST_PHOTO then
    --   local attachment = {
    --     name = "Playing Smashion!",
    --     link = "http://www.vfiles",
    --     caption = "Link caption",
    --     description = "Playing Smashion!.",
    --     picture = "Icon.png",
    --     actions = json.encode( { { name = "Learn More", link = "http://vfiles.com" } } )
    --   }
    
    --   facebook.request( "me/feed", "POST", attachment )   -- posting the photo
    -- end
    
    -- This code posts a message to your Facebook Wall
    if fbCommand == POST_MSG then

      local myData = gameData:get(localData.city)
      local gameScore = myData.levelData[localData.gameLevel].score
      print('This is gameScore: '..gameScore)

      -- facebook.request("me/scores", "POST", {score=gameScore})
      local attachment = {
        score = tostring(gameScore), -- a simple fake score for testing
        access_token = my_access_token -- grabbed from the login process
      }
      facebook.request("me/scores" , "POST", attachment)


      
      -- print('Here are your scores: ')
      -- print(scores.score)



      -- facebook.request("me/scores","POST", {score=gameScore})

      -- fbUser =facebook.request( "me" )
      -- print('This is fbUser: '..fbUser)
      -- print('Thius is uesr 1: '..fbUser[0])


      -- -- MAKE A POST REQUEST TO THE FACEBOOK HI SCORE API
      -- -- SET UP VARIABLES
      -- local path = "/USER_ID/scores"
      -- local httpMethod = "POST"
      -- local params = {
      --   access_token = access_token,
      --   score = gameScore
      -- }
      -- -- MAKE REQUEST
      -- facebook.request( path [, httpMethod, params ] )
      

      local time = os.date("*t")
      local postMsg = {
        message = "Posting from Smashion! High Score is: " .. gameScore .."."..
          os.date("%A, %B %e")  .. ", " .. time.hour .. ":"
          .. time.min .. "." .. time.sec
      }
      print('This is postMsg: '..postMsg.message)
      facebook.request( "me/feed", "POST", postMsg )    -- posting the message

    end
-----------------------------------------------------------------------------------------

    elseif ( "request" == event.type ) then
        -- event.response is a JSON object from the FB server
        local response = event.response
        
    if ( not event.isError ) then
          response = json.decode( event.response )
          
        --   if fbCommand == GET_USER_INFO then
        statusMessage.textObject.text = response.name
        printTable( response, "User Info", 3 )
        -- print( "name", response.name )
        
      -- elseif fbCommand == POST_PHOTO then
      --   printTable( response, "photo", 3 )
      --   statusMessage.textObject.text = "Photo Posted"
              
      -- elseif fbCommand == POST_MSG then
      if fbCommand == POST_MSG then
        printTable( response, "message", 3 )
        statusMessage.textObject.text = "Message Posted"

        -- MAKE A POST REQUEST TO THE FACEBOOK HI SCORE API
      -- SET UP VARIABLES
      -- local userId = tostring(response.id)
      -- local path = "/"..userId.."/scores"
      -- local httpMethod = "POST"
      -- local params = {
      --   access_token = access_token,
      --   score = gameScore
      -- }

      -- print('path '..path)
      -- print('params - access_token')
      -- print(params.access_token)
      -- print('score')
      -- print(params.score)
      -- MAKE REQUEST
      -- facebook.request( path , httpMethod, params  )

        -- fbUser.name = response.name
        -- fbUser.id = response.id

        -- print("FbUser.name: ", fbUser.name)
        -- print("FbUser.id: ", fbUser.id)

        -- POSSIBLY SUBMIT HIGH SCORES here
        
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
-- Private workers
--------------------------------------------------

local function rotateScreenTo(isPortrait)
  _W, _H = display.contentWidth, display.contentHeight
  stage.width, stage.height = _W, _H
  bg.width, bg.height = _W - bgPadding, _H - bgPadding

  if isPortrait then
    header.x, header.y = _W/2, (_H - 320)/4
    body.x, body.y = _W/2, _H/2

    continueBtn:moveTo(-140,0)
    replayBtn:moveTo(10,0)
    shareBtn:moveTo(-65,60)

  else
    header.x, header.y = _W/2 - header.width/2 - 20, 30
    body.x, body.y = _W/2 + body.width/2 + 20, body.height/2 + 20

    continueBtn:moveTo(-210,0)
    replayBtn:moveTo(-65,0)
    shareBtn:moveTo(80,0)

  end
  footer.x, footer.y = _W/2, _H - (_H - 320)/4 - footer.height - 20
  
end

local function replayBtnTapEvent(e)
  composer.gotoScene( "com.vfiles.views.LoadingGameView", {
    params = {
      sceneName = "com.vfiles.views.GameView",
      param = {
        city = localData.city,
        gameLevel = localData.gameLevel
      }
    } 
  })
end

local function continueBtnTapEvent(e)
    composer.gotoScene( "com.vfiles.views.LoadingGameView", {
    params = { 
      sceneName = "com.vfiles.views.CityMapView",
      param = {
        city = localData.city,
        newLevelUnlocked = newLevelUnlocked,
        newCityUnlocked = newCityUnlocked,
        newCity = newCity,
      }
    } 
  })
end

local function shareBtnTapEvent(e)
  -- GET GAME SCORE
  -- local myData = gameData:get(localData.city)
  -- local gameScore = myData.levelData[localData.gameLevel].score
  -- print('This is gameScore: '..gameScore)
end

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
  if event.type == "faceUp" or event.type == "faceDown" then return false end  
  -- local isPortrait = (string.find(event.type, "portrait") == 1)
  rotateScreenTo(string.find(event.type, "portrait") == 1)
end

--------------------------------------------------
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
local function build(self)
  local myData = gameData:get(localData.city)
  local levelTotal = myData.levelTotal -- Total level of current city

  local lastScore = myData.levelData[localData.gameLevel].score
  local lastAchievement = myData.levelData[localData.gameLevel].achievement

  -- Set the new value with old data
  local newScore = lastScore
  local newAchievement = lastAchievement
  local newLevel = localData.gameLevel

  -- ==================================================
  -- Update gameData values
  -- ==================================================

  -- Set new level value (can not greater than levelTotal)
  if levelTotal > newLevel  then
    -- Increase level
    newLevel = newLevel + 1 

    -- Also create the new empty table for next level if not avaiable
    if myData.levelData[newLevel] == nil then
      newLevelUnlocked = true
      myData.currentLevel = newLevel
      myData.levelData[newLevel] = {
        score = 0,
        achievement = 0
      }
    end

  else    
    -- Unlock the new City if lastAchievement was 0 (which means never cleared this level before)
    print("lastAchievement", lastAchievement)
    if lastAchievement == 0 then
      levelController = LevelController:new()
      newCity = levelController:unlockNextCity(localData.city)
      newCityUnlocked = true
    end
  end

  -- Update new Score
  if lastScore < localData.result.score then
    -- if newScore is greater than last, update the score as new, and add up the difference to total score
    newScore = localData.result.score

    local currentTotalScore = gameData:get("TotalScore")
    local newTotalScore = currentTotalScore + (newScore-lastScore)
    gameData:set("TotalScore", newTotalScore)
    print("NEW TOTAL IS: ", newTotalScore)
  end
  
  -- update current game data
  myData.levelData[localData.gameLevel] = {
    score = newScore,
    achievement = localData.result.achievement
  }



  -- Write data
  gameData:set(localData.city, myData)

  print("========================================")
  print("Code: ", localData.code)
  print("City: ", localData.city)
  print("This Level: ", localData.gameLevel)
  print("Next Level: ", newLevel)
  print("Last Score: ", localData.result.score)
  print("New(Best) Score: ", newScore)
  print("Last Achievement: ", localData.result.achievement)
  print("New Achievement: ", localData.result.achievement)
  print("========================================")


  sceneGroup = self.view

  -- Build graphic container named stage. This is a parent of all asset on screen.
  stage = display.newContainer(sceneGroup, _W, _H)
  stage.anchorChildren, stage.anchorX, stage.anchorY = false, 0, 0

  bg = display.newRect(stage, 0, 0, _W - bgPadding, _H - bgPadding )
  bg:setFillColor(.09, .09, .09, .9)
  bg.anchorX, bg.anchorY, bg.x, bg.y = 0, 0, bgPadding/2, bgPadding/2


  -- Build header (group)
  header = display.newGroup()
  stage:insert(header)
  header.x, header.y = _W/2, (_H - 320)/4

  local headerLb1 = display.newBitmapText(header, "LEVEL", 0, 20, "champion-40", 36)
  local headerLb2 = display.newBitmapText(header, tostring(localData.gameLevel), 0, 20, "champion-40-num-hollow-ol", 28)
  local headerLb3 = display.newBitmapText(header, "COMPLETED!", 0, 70, "champion-80", 80)
  headerLb1:moveTo(-(headerLb2.width + 5)/2, 20)
  headerLb2:moveTo(headerLb1.x + headerLb1.width/2 + headerLb2.width/2 + 5, 20)

  -- Build body (group)
  body = display.newGroup()
  stage:insert(body)
  body.x, body.y = _W/2, _H/2
  local bodyFrame = display.newRect(body, 0, 0, 150, 160 )
  bodyFrame.strokeWidth = 2
  bodyFrame:setFillColor( 0,0,0,0 )
  local bodyDivider = display.newLine( body, -75, 40, 75, 40 )
  bodyDivider.strokeWidth = 2

  local bodyLb1 = display.newBitmapText(body, "SCORE:", 0, -62, "champion-40", 26)
  local bodyLb2 = display.newBitmapText(body, comma_value(localData.result.score), 0, -18, "champion-80", 70)
  local bodyLb3 = display.newBitmapText(body, "{yellow}MY BEST: " .. comma_value(newScore), 0, 60, "champion-40", 28)

  starSheet = graphics.newImageSheet( "assets/images/ui/global/ico-bigStarSheet.png", {width = 92, height = 20, numFrames = 4, sheetContentWidth = 92, sheetContentHeight = 80})
  local stars = display.newSprite( body, starSheet, {start=1, count=4})
  stars.y = 23
  stars:setFrame(localData.result.achievement+1)


  -- Build Footer (group)
  footer = display.newGroup()
  stage:insert(footer)
    
  replayBtn = SimpleButton:new({
    parent = footer,
    label = "REPLAY",
    left = 0,
    top = 0,
    width = 130,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,1}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = replayBtnTapEvent
  })

  continueBtn = SimpleButton:new({
    parent = footer,
    label = "CONTINUE",
    left = 0,
    top = 0,
    width = 130,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = continueBtnTapEvent
  })

  shareBtn = SimpleButton:new({
    parent = footer,
    label = "          SHARE",
    icon = {path = "assets/images/ui/global/ico-fb-btn.png", width = 130, height = 29},
    left = 0,
    top = 0,
    width = 130,
    height = 37,
    fontSize = 32,
    color = {default= {.329, .482, .741}, over = {.173, .369, .694}},
    fontColor = {default= {1,1,1}, over = {1,1,1}},
    onEvent = shareBtnTapEvent
  })

   
  audio.play(audioGameWon)

  -- ------------------------------------ START FACEBOOK CODE --------------------------------------------- --
-- local appId  = '1458620504414013' -- Add  your App ID here (also go into build.settings and replace XXXXXXXXX with your appId under CFBundleURLSchemes)
-- local apiKey = nil  -- Not needed at this time
  -- NOTE: You must provide a valid application id provided from Facebook
  if ( appId ) then
    facebook.login( appId, listener )
    -- ***
    -- ************************ Buttons Functions ********************************
    -- ***
    -- local function postPhoto_onRelease( event )
    --   -- call the login method of the FB session object, passing in a handler
    --   -- to be called upon successful login.
    --   fbCommand = POST_PHOTO
    --   facebook.login( appId, listener,  {"publish_actions", "user_friends"}  )
    -- end
    
    -- local function getInfo_onRelease( event )
    --   -- call the login method of the FB session object, passing in a handler
    --   -- to be called upon successful login.
    --   fbCommand = GET_USER_INFO
    --   facebook.login( appId, listener, {"publish_actions", "user_friends"}  )
    -- end
    
    local function postMsg_onRelease( event )
      -- call the login method of the FB session object, passing in a handler
      -- to be called upon successful login.
      fbCommand = POST_MSG
      -- facebook.login( appId, listener, {"publish_actions", "user_friends"} )
      facebook.login( appId, listener, {} )
      facebook.request( "me/scores", "GET" )
    end


    
    -- local function showDialog_onRelease( event )
    --   -- call the login method of the FB session object, passing in a handler
    --   -- to be called upon successful login.
    --   fbCommand = SHOW_DIALOG
    --   facebook.login( appId, listener, {"publish_actions", "user_friends"}  )
    -- end
    
    -- local function logOut_onRelease( event )
    --   -- call the login method of the FB session object, passing in a handler
    --   -- to be called upon successful login.
    --   fbCommand = LOGOUT
    --   facebook.logout()
    -- end


    -- status message
    statusMessage = createStatusMessage( "   Not connected  ", _W/2, StatusMessageY )
    sceneGroup:insert(statusMessage)


    -- ***
    -- ************************ Create Buttons ********************************
    -- ***


    -- local fbButton = SimpleButton:new({
    --   parent = sceneGroup,
    --   label = "      POST PHOTO",
    --   icon = {path = "assets/images/ui/global/ico-fb-btn.png", width = 130, height = 29},
    --   width = 130,
    --   height = 37,
    --   left =15,
    --   top = ButtonOrigY,
    --   fontSize = 32,
    --   color = {default= {.329, .482, .741}, over = {.173, .369, .694}},
    --   fontColor = {default= {1,1,1}, over = {1,1,1}},
    --   onEvent = postPhoto_onRelease
    -- })
    

    local fbButton2 = SimpleButton:new({
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


    -- local fbButton3 = SimpleButton:new({
    --   parent = sceneGroup,
    --   label = "     SHOW DIALOG",
    --   icon = {path = "assets/images/ui/global/ico-fb-btn.png", width = 130, height = 29},
    --   width = 130,
    --   height = 37,
    --   left =15,
    --   top = ButtonOrigY + ButtonYOffset * 2,
    --   fontSize = 32,
    --   color = {default= {.329, .482, .741}, over = {.173, .369, .694}},
    --   fontColor = {default= {1,1,1}, over = {1,1,1}},
    --   onEvent = showDialog_onRelease
    -- })

    
    -- -- "Get User Info with Facebook" button
    -- local fbButton4 = SimpleButton:new({
    --   parent = sceneGroup,
    --   label = "    GET USER",
    --   icon = {path = "assets/images/ui/global/ico-fb-btn.png", width = 130, height = 29},
    --   width = 130,
    --   height = 37,
    --   left =15,
    --   top = ButtonOrigY + ButtonYOffset * 3,
    --   fontSize = 32,
    --   color = {default= {.329, .482, .741}, over = {.173, .369, .694}},
    --   fontColor = {default= {1,1,1}, over = {1,1,1}},
    --   onEvent = getInfo_onRelease
    -- })
    
    -- "Logout with Facebook" button
    -- local fbButton5 = SimpleButton:new({
    --   parent = sceneGroup,
    --   label = "    LOG OUT",
    --   icon = {path = "assets/images/ui/global/ico-fb-btn.png", width = 130, height = 29},
    --   width = 130,
    --   height = 37,
    --   left =15,
    --   top = ButtonOrigY + ButtonYOffset * 4,
    --   fontSize = 32,
    --   color = {default= {.329, .482, .741}, over = {.173, .369, .694}},
    --   fontColor = {default= {1,1,1}, over = {1,1,1}},
    --   onEvent = logOut_onRelease
    -- })
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


  rotateScreenTo(_W < _H)
end

--------------------------------------------------
-- Scene listeners
--------------------------------------------------
function scene:create( event )
  localData = event.params
  build(self)
end

function scene:show( event )
end

function scene:hide( event )
end

function scene:destroy( event )
  print("Destroy GameFailed Modal view")

  audio.dispose( audioGameWon )
  audioGameWon = nil

  for i=1, header.numChildren do
    header[1]:removeSelf()
    header[1] = nil
  end
  header = nil
  body = nil

  replayBtn:destroy()
  continueBtn:destroy()
  shareBtn:destroy()
  footer = nil

  -- DESTROY FB BUTTONS IF APP ID EXISITS
  -- If appId does not exist, then the buttons won't be created in the first place
  if ( appId ) then
    -- fbButton:destroy()
    fbButton2:destroy()
    -- fbButton3:destroy()
    -- fbButton4:destroy()
    -- fbButton5:destroy()
  end

  if levelController then levelController:destroy() end

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