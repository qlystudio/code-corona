local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"

local sceneGroup, stage, bg, header, body, footer
local bgmOnBtn, bgmOffBtn, sfxOnBtn, sfxOffBtn, infoBtn, resetBtn, backBtn, restartBtn, quitBtn, lbg
local _W, _H, localData = display.contentWidth, display.contentHeight, {}

local hiScore1, hiScore2, hiScore3
local hiScoreInc = 40
-- local HiScores = {}
--------------------------------------------------
-- FACEBOOK CODE
--------------------------------------------------

-- Comment out the next line when through debugging your app.
io.output():setvbuf('no')     -- **debug: disable output buffering for Xcode Console **tjn

-- local widget = require("widget")
local facebook = require("facebook")
local json = require("json")
-- Facebook Commands
local fbCommand     -- forward reference
local SHOW_HI_SCORE = 5
local GET_USER_PIC = 6

-- ------------------------------------ START FACEBOOK CODE --------------------------------------------- --
local appId  = '1458620504414013' -- Add  your App ID here (also go into build.settings and replace XXXXXXXXX with your appId under CFBundleURLSchemes)
local apiKey = nil  -- Not needed at this time
-- NOTE: You must provide a valid application id provided from Facebook

--------------------------------------------------
-- Private workers
--------------------------------------------------

local function rotateScreenTo(isPortrait)
  _W, _H = display.contentWidth, display.contentHeight
  stage.width, stage.height = _W, _H
  bg.width, bg.height = _W, _H

  -- Layer does not get effect on ratio but need repostion by type
  if localData.type == 1 then
    header[1].x = _W/2
  elseif localData.type == 2 then
    header[1].width = _W/2
    header[2].x = _W/4*3 - 30
    header[3].x = _W/4
    header[4].x = _W/4*3
  end

  -- Layer changes by ratio
  if isPortrait then
    backBtn:moveTo(-15, 8)    
  end

  -- Layer does not get effect from any value
  body[2].y = body[1].height + 25
  body.x = _W/2 - body.width/2 + 15
  body.y = _H/2 - body.height/2 - 15
  footer.x = _W/2 - footer.width/2 + 15
  footer.y = _H - footer.height - 20
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

-- New Facebook Connection listener
local function listener( event )

--- Debug Event parameters printout --------------------------------------------------
--- Prints Events received up to 20 characters. Prints "..." and total count if longer
---
  print( "Facebook Listener events:" )
  
  local maxStr = 20000   -- set maximum string length
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
  if ( "session" == event.type ) then
    print( "Session Status: " .. event.phase )
  
  if event.phase ~= "login" then
    -- Exit if login error
    return
  end

  -- Request Hi Scores from the User and their Friends
  if fbCommand == SHOW_HI_SCORE then
    local access_token = event.access_token
    facebook.request( appId.."/scores", "GET", access_token )
  end

  -- GET USER PIC
  if fbCommand == GET_USER_PIC then
    facebook.request( id.."/picture", "GET" )
  end
-----------------------------------------------------------------------------------------

  elseif ( "request" == event.type ) then
    -- event.response is a JSON object from the FB server
    local response = event.response
      
    if ( not event.isError ) then
      response = json.decode( event.response )
      -- PUT PLAYERS IN OWN VAR
      local Players = response['data']
          
      if fbCommand == SHOW_HI_SCORE then
          
        -- printTable( response, "HI SCORES", 3 )
        -- local Players = response['data']

        for k,v in pairs( Players ) do
          -- print(tostring(Players[k]['user']['name']))
          -- print(tostring(Players[k]['user']['id']))
          -- print(tostring(Players[k]['score']))

          local name = tostring(Players[k]['user']['name'])
          local id = tostring(Players[k]['user']['id'])
          local score = tostring(Players[k]['score'])

          if k ==1  then 
            hiScore1 = display.newBitmapText(body, "1:"..name..", Score: "..score, 0, 0, "champion-40", 26)
            -- facebook.request( id.."/picture", "GET" )
            facebook.request("me", "GET", { fields="id,name,picture" })
            elseif k ==2 then
            hiScore2 = display.newBitmapText(body, "2:"..name..", Score: "..score, 0, hiScoreInc, "champion-40", 26)  
            -- facebook.request( id.."/picture", "GET" )
            elseif k ==3 then
            hiScore3 = display.newBitmapText(body, "3:"..name..", Score: "..score, 0, hiScoreInc*2, "champion-40", 26)  
            -- facebook.request( id.."/picture", "GET" )
          end
        end



        if fbCommand == GET_USER_PIC then
            -- facebook.request( id.."/picture", "GET" )
            -- printTable( response, "HI SCORES", 3 )
          local Pic = response['data']
          print('This is Pic here:')
          printTable( Pic, "Pic")
        end
      
    else
      -- Unknown command response
      print( "Unknown command response" )
    end

    else
      -- Post Failed
      printTable( event.response, "Post Failed Response", 3 )
  end
  
  elseif ( "dialog" == event.type ) then
    -- showDialog response
    print( "dialog response:", event.response )
  end
end

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function onOrientationChange( event )
  if event.type == "faceUp" or event.type == "faceDown" then return false end  
  rotateScreenTo(string.find(event.type, "portrait") == 1)
end


local function backBtnTapEvent(e)
  composer.hideOverlay("fade", 250)
  composer.gotoScene( "com.vfiles.views.WorldMapView", "fade", 500 )
  return true
end


----------------------------------------

--------------------------------------------------
-- Public workers
--------------------------------------------------

--------------------------------------------------
-- Constructor
--------------------------------------------------
local function build(self)
  --[[ 
  Note: 
    Setting modal has type type of layout (localData.type {int})
    1: Sole window (in world/city map)
    2: Tab page (in puased screen)
  ]]

  sceneGroup = self.view

  -- Build graphic container named stage. This is a parent of all asset on screen.
  stage = display.newContainer(sceneGroup, _W, _H)
  stage.anchorChildren, stage.anchorX, stage.anchorY = false, 0, 0

  bg = display.newRect(stage, 0, 0, _W, _H )
  bg:setFillColor(.09, .09, .09, .95)
  bg.anchorX, bg.anchorY, bg.x, bg.y = 0, 0, 0, 0

  -- Build header, body, footer (group)
  header = display.newGroup()
  body = display.newGroup()
  footer = display.newGroup()
  stage:insert(header)
  stage:insert(body)
  stage:insert(footer)

  -- Header
  display.newBitmapText(header, "HIGH SCORES", _W/2, 36, "champion-80", 52)

  -- Body (contain two groups)
  local bgmGrp = display.newGroup()
  local sfxGrp = display.newGroup()
  body:insert(bgmGrp)
  body:insert(sfxGrp)


  backBtn = SimpleButton:new({
    parent = footer,
    label = localData.type == 1 and "BACK" or "BACK TO GAME",
    left = -15,
    top = 8,
    width = 120,
    height = 37,
    fontSize = 32,
    color = {default= {1,1,0}, over = {.925, 0, .549}},
    fontColor = {default= {0,0,0}, over = {1,1,1}},
    onEvent = backBtnTapEvent
  })  

  ---- START FB CODE
  -- Check for AppId -- THIS SHOULD REALLY BE CHANGED TO CONNECTION
  if ( appId ) then

    -- Log into facebook
    facebook.login( appId, listener )
    local function getInfo_onRelease( event )
      -- call the login method of the FB session object, passing in a handler
      -- to be called upon successful login.
      fbCommand = SHOW_HI_SCORE
      facebook.login( appId, listener, {"publish_actions", "user_friends"}  )
    end


    -- local function getUserPic( event )
    --   -- call the login method of the FB session object, passing in a handler
    --   -- to be called upon successful login.
    --   fbCommand = GET_USER_PIC
    --   facebook.login( appId, listener, {"publish_actions", "user_friends"}  )
    -- end

    getInfo_onRelease()





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
  if event.phase == "did" then
  end
end

function scene:hide( event )
end

function scene:destroy( event )
  print("Destroy GameSetting Modal view")

  for i=1, header.numChildren do
    header[1]:removeSelf()
    header[1] = nil
  end

  backBtn:destroy()

  if localData.type == 2 then
    restartBtn:destroy()
    quitBtn:destroy()
    lbg:removeEventListener( "tap", tabTapEvent )
  end

  header = nil
  body = nil
  footer = nil
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