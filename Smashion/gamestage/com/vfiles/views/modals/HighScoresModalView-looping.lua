local scene = require("composer").newScene()
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"

local sceneGroup, stage, bg, header, body, footer
local backBtn, fbConnectBtn
local _W, _H, localData = display.contentWidth, display.contentHeight, {}

--------------------------------------------------
-- FACEBOOK CODE
--------------------------------------------------

-- 
local Players
local userDetails
local hiScore1, hiScore2, hiScore3
local hiScoreInc = 40

-- Comment out the next line when through debugging your app.
io.output():setvbuf('no')     -- **debug: disable output buffering for Xcode Console **tjn

local facebook = require("facebook")
local json = require("json")

-- ------------------------------------ START FACEBOOK CODE --------------------------------------------- --
local appId  = '1458620504414013' -- Add  your App ID here (also go into build.settings and replace XXXXXXXXX with your appId under CFBundleURLSchemes)
local apiKey = nil  -- Not needed at this time

--FACEBOOK COMMANDS
local fbCommand
local SHOW_HI_SCORE
local GET_PLAYER_PIC

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


-- FACEBOOK CODE EVENT DISPATCHER
local leaderBoard =  display.newGroup( )


-- FACEBOOK LISTENER CODE
local function listener( event )
  print( "event.name", event.name )  --"fbconnect"
  print( "event.type:", event.type ) --type is either "session", "request", or "dialog"
  print( "isError: " .. tostring( event.isError ) )
  print( "didComplete: " .. tostring( event.didComplete ) )

  --"session" events cover various login/logout events
  --"request" events handle calls to various Graph API calls
  --"dialog" events are standard popup boxes that can be displayed

  -- SESSION
  if ( "session" == event.type ) then
    --options are: "login", "loginFailed", "loginCancelled", or "logout"
    if ( "login" == event.phase ) then
        local access_token = event.token
        --code for tasks following a successful login

        -- GET HI-SCORES
        if fbCommand == SHOW_HI_SCORE then
          -- GET SCORES FROM APP
          facebook.request( appId.."/scores", "GET", access_token )
        end


        -- GET PLAYER PIC
        if fbCommand == GET_PLAYER_PIC then

          -- print('These are the User Details')
          -- printTable(userDetails)
          
        end

    end


  -- REQUEST
  elseif ( "request" == event.type ) then
      
    print("facebook request")
    if ( not event.isError ) then
      local response = json.decode( event.response )
      --process response data here
      -- PLAYER DATA
      Players = response['data']

      
      -- GET HI-SCORES
      if fbCommand == SHOW_HI_SCORE then
        -- PRINTING OUT LIST OF PLAYERS
        for k,v in pairs( Players ) do
          local name = tostring(Players[k]['user']['name'])
          local id = tostring(Players[k]['user']['id'])
          local score = tostring(Players[k]['score'])

          print("name", name)
          print("id", id)
          print("score", score)


          if k ==1  then 
            hiScore1 = display.newBitmapText(body, "1:"..name..", Score: "..score, 0, 50, "champion-40", 26)
            

            elseif k ==2 then
            hiScore2 = display.newBitmapText(body, "2:"..name..", Score: "..score, 0, 50 + hiScoreInc, "champion-40", 26)
            -- SETUP LOCAL EVENT TO DISPATCH USER DATA - WHICH WE WILL USE TO GET THE PIC
            -- local event = { 
            --   name="fbIdEvent",
            --   target=leaderBoard,
            --   playerName = name,
            --   playerId = id,
            --   playerScore = score 
            -- }

            -- leaderBoard:dispatchEvent( event )

            elseif k ==3 then
            hiScore3 = display.newBitmapText(body, "3:"..name..", Score: "..score, 0, 50 + hiScoreInc*2, "champion-40", 26)  
            -- SETUP LOCAL EVENT TO DISPATCH USER DATA - WHICH WE WILL USE TO GET THE PIC
            -- local event = { 
            --   name="fbIdEvent",
            --   target=leaderBoard,
            --   playerName = name,
            --   playerId = id,
            --   playerScore = score 
            -- }

            -- leaderBoard:dispatchEvent( event )
          end
        end

      end

      -- TRY TO GET INFO THIS WAY WITHOUT ETERNAL LOOOP
      for k,v in pairs( Players ) do
          local name = tostring(Players[k]['user']['name'])
          local id = tostring(Players[k]['user']['id'])
          local score = tostring(Players[k]['score'])
          local event = { 
            name="fbIdEvent",
            target=leaderBoard,
            playerName = name,
            playerId = id,
            playerScore = score 
          }
          leaderBoard:dispatchEvent( event )
      end

      -- GET PLAYER PIC
      if fbCommand == GET_PLAYER_PIC then
        -- local pic = response['data']
        -- print('this is pic')
        -- printTable(pic)
        -- facebook.request( id.."/picture", "GET" )
      end


    end

  -- DIALOG
  elseif ( "dialog" == event.type ) then
      print( "dialog", event.response )
      --handle dialog results here
  end

end


-- Setup listener
local fbIdListener = function( event )
  print( "Event " .. event.name )
  print( "Name " .. event.playerName )
  print( "Id " .. event.playerId )
  print( "Score " .. event.playerScore )
  -- print( "Target has width: " .. event.target.contentWidth )

  fbCommand = GET_PLAYER_PIC
  userDetails = {
    name = event.name,
    id = event.playerId,
    score = event.playerScore,
  }
  -- LOGIN TO FACEBOOK, 'listener' function will deal with action  -- {"publish_actions", "user_friends"} are permissions to post scores, and retrieve friends playing game
  facebook.login( appId, listener, {"publish_actions", "user_friends"}  )
  
  print('These are the Players!  from fbIdLister!')
  printTable(Players)
end



-- FB CONNECT BUTTON TAPPED : INITIALIZE FACEBOOK CONNECTION
local function fbConnectBtnTapEvent(event)
  print('Facebook button tapped!')
  -- ISSUE COMMAND TO BE SENT TO LISTENER
  fbCommand = SHOW_HI_SCORE
  -- LOGIN TO FACEBOOK, 'listener' function will deal with action  -- {"publish_actions", "user_friends"} are permissions to post scores, and retrieve friends playing game
  facebook.login( appId, listener, {"publish_actions", "user_friends"}  )
end

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

  fbConnectBtn = SimpleButton:new({
    parent = body,
    icon = {path = "assets/images/ui/global/fb-connect.png", width = 176, height = 50},
    left = -15,
    top = 180,
    width = 176,
    height = 50,    
    color = {default= {0,0,0,0}, over = {0,0,0,0}},
    onEvent = fbConnectBtnTapEvent
  })

  rotateScreenTo(_W < _H)


  -- FB EVENT LISTENERS
  leaderBoard:addEventListener( "fbIdEvent", fbIdListener )
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
  fbConnectBtn:destroy()

  header = nil
  body = nil
  footer = nil

  -- REMOVE FB LEADERBOARD EVENT LISTENER
  leaderBoard:removeEventListener( "fbIdEvent", fbIdListener )
  leaderBoard:removeSelf()

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