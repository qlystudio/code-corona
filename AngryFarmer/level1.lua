-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- include Corona's "physics" library
local physics = require "physics"
physics.start(); physics.pause()
physics.setGravity(0,0)

--physics.setDrawMode('hybrid')

-- x-pressive's excellent analog joystick lib
local StickLib = require("lib_analog_stick")

--------------------------------------------

-- forward declarations and other locals
local _W, _H, _halfW, _halfH = display.contentWidth, display.contentHeight, display.contentWidth*0.5, display.contentHeight*0.5

-- RANDOM NUM GENERATOR
local rand = math.random

-- LEVEL VARS --
local levelNo
local moleCount
local stumpCount 
local spudCount
local spudsCollected = 0

local moleSpeed = 0.5
local playerSpeed = 3


-- WIN CONDITION VARS --
local levelSuccess = false
local levelCompleted = false

-- PLAYER -- 
local truck

-- CHASER(S) --
local molesArr = {}
local spudsArr = {}

-- COLLISION FILTERS --
local truckCollisionFilter	= { categoryBits = 1, maskBits = 14 }
local moleCollisionFilter	= { categoryBits = 2, maskBits = 9 }
local stumpCollisionFilter	= { categoryBits = 4, maskBits = 13 }
local spudCollisionFilter	= { categoryBits = 8, maskBits = 15 }
--local wallCollisionFilter	= { categoryBits = 16, maskBits = 3 } -- no time to do this :(

-- SCORES DEM --
local playerScore = 0
local playerScoreDisplay
local cpuScore = 0

-- SOUNDS DEM -- 
-- no time :(

local function cleanUp( thing )
    if ( thing.myName == "spud" ) then            
        thing.isCollected = true
    end	
    thing.isVisible = false
    physics.removeBody( thing )
end

local function onCollision( self, event )
    -- truck collisions
    if ( event.phase =="began" and self.myName and self.myName == "truck" ) then
        
        -- collision with spud
        if ( event.other.myName and event.other.myName == "spud" and event.other.isCollected == false ) then
            print( "truck collision with spud" )
            playerScore = playerScore + 1
            spudsCollected = spudsCollected + 1
            playerScoreDisplay.text = playerScore .. " PLAYER -vs- CPU " .. cpuScore
            
            event.other:toFront()
            event.other:scale(1.25, 1.25)
            timer.performWithDelay( 50, function() cleanUp( event.other ); end ) 
            
        elseif ( event.other.myName and event.other.myName == "mole" ) then
            print( "truck collision with mole" )
            event.other.isAlive = false
            event.other:setFillColor( 255, 100, 50, 200 )  -- tints to red
            timer.performWithDelay( 100, function() cleanUp( event.other ); end ) 
        end
    end
    
    -- mole collisions
    if( event.phase == "began" and self.myName and self.myName == "mole" 
        and event.other.myName
        and event.other.myName == "spud" and event.other.isCollected == false ) then
        print( "mole collision with spud")
        cpuScore = cpuScore + 1
        spudsCollected = spudsCollected + 1
        playerScoreDisplay.text = playerScore .. " PLAYER -vs- CPU " .. cpuScore
        event.other:scale(1.25, 1.25)
        timer.performWithDelay( 50, function() cleanUp( event.other ); end ) 
    end
    
    
end

local function placeTings( group ) 
    
    -- don't want tings too close to other tings (this is just a guess!)
    local gutterPadding = 25
    local molePadding = 15
    local truckPadding = 15
    
    truck = display.newImageRect( "PotatoTruck-GTAL1961.png", 26, 75 ) -- scale down by 0.2
    truck.myName = "truck"
    truck:setReferencePoint( display.CenterReferencePoint )
    truck.x, truck.y = _halfW, _halfH
    physics.addBody( truck, "dynamic", {filter=truckCollisionFilter} )
    truck.collision = onCollision
    truck:addEventListener( 'collision', truck )
    group:insert( truck )
    for i=1, moleCount do
        
        local mole = display.newImageRect( "mole.png", 30, 28 )
        mole.myName = "mole"
        mole.isAlive = true -- no longer active when isAlive = false
        
        
        -- we won't want moles placed where the player will start
        repeat
            mole.x = rand( molePadding, _W - molePadding )
            print( "mole [" .. i .. "] - x = " .. tostring(mole.x) )
        until ( mole.x < ( truck.x + (truck.width*0.5) )) or ( mole.x > ( truck.y + (truck.width*0.5) ))
        
        repeat 
            mole.y = rand( molePadding, _H - molePadding )
            print( "mole [" .. i .. "] - y = " .. tostring(mole.y) )
        until (mole.y < ( truck.y + (truck.height*0.5) - truckPadding )) or ( mole.y > ( truck.y + (truck.height*0.5) + truckPadding ))
        mole:setReferencePoint( display.CenterReferencePoint )
        physics.addBody( mole, "dynamic", {filter=moleCollisionFilter} )
        mole.collision = onCollision
        mole:addEventListener( 'collision', mole )
        
        group:insert( mole ) -- other than bg we want the mole to be the next layer on top
        
        -- shove into array so that we can iterate over them in game loop
        molesArr[i] = mole
    end
    
    for i=1, stumpCount do
        local stump = display.newImageRect( "stump.png", 50, 41 )
        stump.myName = "stump"
        repeat            
            stump.x = rand( gutterPadding, _W - gutterPadding )
            print( "stump [" .. i .. "] - x = " .. tostring(stump.x) )
        until ( stump.x < ( truck.x + (truck.width*0.5) )) or ( stump.x > ( truck.x + (truck.width*0.5) ))
        repeat
            stump.y = rand( gutterPadding, _H - gutterPadding )
            print( "stump [" .. i .. "] - y = " .. tostring(stump.y) )
        until ( stump.y < ( truck.y + (truck.height*0.5) )) or ( stump.y > ( truck.y + (truck.height*0.5) ))
        physics.addBody( stump, "static", {filter=stumpCollisionFilter} )
        group:insert( stump )
        
    end
    
    for i=1, spudCount do
        
        local spud = display.newImageRect( "Potato_small.png", 20, 28 )
        spud.myName = "spud"
        spud.isCollected = false
        repeat
            spud.x = rand( gutterPadding, _W - gutterPadding )
            print( "spud [" .. i .. "] - x = " .. tostring(spud.x) )
        until ( spud.x < ( truck.x + (truck.width*0.5) )) or ( spud.x > ( truck.x + (truck.width*0.5) ))
        repeat
            spud.y = rand( gutterPadding, _H - gutterPadding )
            print( "spud [" .. i .. "] - y = " .. tostring(spud.y) )
        until ( spud.y < ( truck.y + (truck.height*0.5) )) or ( spud.y > ( truck.y + (truck.height*0.5) ))
        physics.addBody( spud, "static", {filter=spudCollisionFilter} )
        group:insert( spud )
        
        -- shove into array so that we can iterate over them in game loop
        spudsArr[i] = spud
    end
    
    
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
    
    storyboard.removeScene("reloading")
    local group = self.view
    
    levelCompleted = false
    levelSuccess = false
    levelNo = event.params.levelNo
    moleCount = event.params.moleCount
    stumpCount = event.params.stumpCount
    spudCount = event.params.spudCount
    
    -- display a background image
    local background = display.newImageRect( "bg.png", _W, _H )
    background:setReferencePoint( display.TopLeftReferencePoint )
    background.x, background.y = 0, 0
    
    -- all display objects must be inserted into group
    group:insert( background )
    
    -- randomise placement of items for level
    placeTings( group )
    
    playerScoreDisplay = display.newText( playerScore .. " PLAYER -vs- CPU " .. cpuScore, 10, 10, native.systemFontBold, 25 )
    playerScoreDisplay:setReferencePoint( display.TopCenterReferencePoint )
    playerScoreDisplay:setTextColor(255,255,255,155)
    playerScoreDisplay.x = _W*0.5
    group:insert( playerScoreDisplay )
    
    -- CREATE ANALOG STICK
    MyStick = StickLib.NewStick( 
    {
	x             = _W*.2,
	y             = _H*.85,
	thumbSize     = 16,
	borderSize    = 32, 
	snapBackSpeed = .75, 
	R             = 255,
	G             = 255,
	B             = 50
    } )
    
    group:insert( MyStick )
    
    local levelDisplay = display.newText( "Level " .. levelNo, 10, _H-25, native.systemFontBold, 25)
    group:insert( levelDisplay )
    
end

local function reloadLevel()
    if ( levelCompleted == true ) then
        -- always an odd number of spuds so there can never be a draw
        if ( playerScore > cpuScore ) then
            levelSuccess = true
            print( "level successful")
        else 
            levelSuccess = false
            print( "level unsuccessful - restarting...")
        end
        levelCompleted = false
    else
        return
    end
    
    if ( levelSuccess == true ) then
        moleCount = moleCount + 1
        stumpCount = stumpCount + 1
        spudCount = spudCount + 2
        levelNo = levelNo + 1
    end
    
    storyboard.gotoScene( "reloading", { time=750, effect="crossFade", 
        params = {
            moleCount = moleCount,
            stumpCount = stumpCount,
            spudCount = spudCount,
            levelNo = levelNo,
            levelSuccess = levelSuccess,
            playerScore = playerScore,
            cpuScore = cpuScore
        }
    })
    
end

-- GAME LOOP --

local function gameLoop(event)
    for i=1, moleCount do
        -- check which mole is closest to which spud and move it there!
        local mole = molesArr[i]
        if ( mole.isAlive == true ) then	-- if it's dead it won't move!
            local closestSpud = nil			
            
            for j=1, spudCount do
                local spud = spudsArr[j]
                -- initialisation
                if ( closestSpud == nil ) then
                    closestSpud = spud
                end
                
                if ( spud.isCollected == false ) then
                    -- work out distance to 'current' closest spud
                    local dxCurrent = closestSpud.x - mole.x 
                    local dyCurrent = closestSpud.y - mole.y					
                    local currentDistance = math.sqrt( dxCurrent*dxCurrent + dyCurrent*dyCurrent )
                    
                    local dxNew = spud.x - mole.x
                    local dyNew = spud.y - mole.y
                    local newDistance = math.sqrt( dxNew*dxNew + dyNew*dyNew )
                    
                    -- set new closest spud to be the one that the mole follows
                    if ( newDistance < currentDistance ) then
                        closestSpud = spud
                    end
                end
                -- remove closestSpud if already collected
                if ( closestSpud ~= nil and closestSpud.isCollected == true ) then
                    closestSpud = nil
                end
            end
            
            -- code to move the mole closer to the closest spud.
            if ( closestSpud ~= nil and closestSpud.isVisible == true ) then
                if ( mole ~= nil and mole.isAlive == true ) then
                    if ( ( mole.x + mole.width ) < ( closestSpud.x + closestSpud.width ) ) then
                        mole.x = mole.x + moleSpeed
                    elseif ( ( mole.x + mole.width ) > ( closestSpud.x + closestSpud.width ) ) then
                        mole.x = mole.x - moleSpeed
                    else
                        mole.x = mole.x
                    end
                    
                    
                    if ( ( mole.y + mole.height ) < ( closestSpud.y + closestSpud.height ) ) then
                        mole.y = mole.y + moleSpeed
                    elseif ( ( mole.y + mole.height ) > ( closestSpud.y + closestSpud.height ) ) then
                        mole.y = mole.y - moleSpeed
                    else
                        mole.y = mole.y
                    end
                end		
            end
        end
    end
    
    -- check game win conditions
    if ( spudsCollected >= spudCount ) then -- spudsCollected > spudCount shouldn't happen but no time to test	
        levelCompleted = true           
        print( "level completed")
        reloadLevel()
        return
    end
    -- Player controls -- 
    MyStick:move(truck, playerSpeed, true)
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view
    
    physics.start()
    
    Runtime:addEventListener("enterFrame", gameLoop)
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view
    
    physics.stop()
    
    Runtime:removeEventListener("enterFrame", gameLoop)
    
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
    
    local group = self.view
    
    package.loaded[physics] = nil
    physics = nil
    
    -- basic cleanup
    for i=group.numChildren,1,-1 do
        local child = group[i]
        child.parent:remove( child )
        child = nil
    end
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene