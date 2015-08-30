-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------
-- Intitial Template borrowed from: https://developer.coronalabs.com/code/stackbuster-jawbreaker-clone
-- stackbuster.lua
-- created by Raphael Salgado as BeyondtheTech
-- version 1.0 - November 19, 2011
-- version 1.1 - March 6, 2013
--
-- Modified/Improved by Daniel Henderson
-- TCSS 498 Spring 2014 University of Washington



--***********C H A N G E S   M A D E   T O    T E M P L A T E: by Daniel Henderson********--

	--Week 1 of development
-- version 1.15  Added Background 
-- version 1.2   Added High Score
-- version 1.3   Added combo counter to show current max combo
-- version 1.4   Added Messages to congrat the user if they beat the previous high score
-- version 1.5   Added Message to display anytime a combo is done.
-- version 1.6 	 Added Restart button to restart game

	--Week 2 of development
-- version 2.1  Added Load/Save Feature to save progress, high score, etc
-- version 2.2	Added Level progression system
-- verison 2.3	Added multiple background image that change depending on level
-- version 2.4  Added Sounds




 --*************************************************************************************--
-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )
 
-- initialize variables

local grid = {}
local ball = {}
local ready = false
local selection = 1
local score = 0
local combo_count = 0;
local worth = 0
local widget = require("widget")
local loadsave = require("loadsave")
local moves = 0
local total = 0
local i, j, k, m, highlighted, compress_completed, highlight_completed, game_over
local colors = {
        { 0, 0, 0, "black", 0 }, { 255, 0, 0, "red", 1 }, { 0, 255, 0, "green", 0 },
        { 0, 0, 255, "blue", 1 }, { 255, 255, 0, "yellow", 1 } }
local grid_touch
local i2 = 0
local j2 = 0
        -- background image
local bkg1 = display.newImage( "backgroundLargePurple.jpg" )
bkg1:translate(100,240)
local bkg2 = display.newImage( "background2.jpg" )
local bkg3 = display.newImage( "background3.jpg" )
local bkg4 = display.newImage( "background4.jpg" )
local bkg5 = display.newImage( "background5.jpg" )
local bkg6 = display.newImage( "background6.jpg" )
local bkg7 = display.newImage( "background7.jpg" )
local bkg8 = display.newImage( "background8.jpg" )
local bkg9 = display.newImage( "background9.jpg" )
local bkg10 = display.newImage( "baxkground10.jpg" )

local group = display.newGroup()
group:insert(bkg1)
group:insert(bkg2)
group:insert(bkg3)
group:insert(bkg4)
group:insert(bkg5)
group:insert(bkg6)
group:insert(bkg7)
group:insert(bkg8)
group:insert(bkg9)
group:insert(bkg10)

local score_text = display.newText("", 70, 0, native.systemFont, 16)
local accum_text = display.newText("", 150, 75, native.systemFont, 16)
local level_text = display.newText("", 70, 25, native.systemFont, 16)
local score_high = display.newText("", 250, 0, native.systemFont, 16)
local combo_text = display.newText("", 250, 25, native.systemFont, 16)
local worth_text = display.newText("", 160, 400, native.systemFont, 16)
local messages_text = display.newText("", 160, 450, native.systemFont, 16)
local new_combo_text = display.newText("", 160, 425, native.systemFont, 16)
--local btnRestart = display.newImage( "buttonRestart.png" )
--btnRestart.x = 160;
--btnRestart.y = 490;
local myTable = {}
local level =1
local accum_points = 0 
local highScore = 0
local gem_sound = audio.loadSound("gem_sound.mp3")
 
--load data
local function load_data()
	myTable = loadsave.loadTable("myTable.json")
	if myTable == nil then
		myTable = {}
	end
	if myTable.accum_points ~= nil then
		accum_points = myTable.accum_points
	else 
		accum_points = 0
		myTable.accum_points = accum_points
	end
	if myTable.highscore ~= nil then
		highScore = myTable.highscore
	else
		highScore = 0
		myTable.highscore = highScore
	end
end

--save data
local function save_data()
	myTable.accum_points = accum_points
	myTable.highscore = highScore
	loadsave.saveTable(myTable, "myTable.json")
end

local function check_level()
	if accum_points <= 500 then
		level = 1
	elseif accum_points <1000 and accum_points >500 then
		level = 2
	elseif accum_points <2000 and accum_points >1000 then
		level = 3
	elseif accum_points <4000 and accum_points >2000 then
		level = 4
	elseif accum_points <8000 and accum_points >4000 then
		level = 5
	elseif accum_points <16000 and accum_points >8000 then
		level = 6
	elseif accum_points <32000 and accum_points >16000 then
		level = 7
	elseif accum_points <64000 and accum_points >32000 then
		level = 8
	elseif accum_points <128000 and accum_points >64000 then
		level = 9
	elseif accum_points <256000 and accum_points >128000 then
		level = 10
	end

end

local function check_background()
	if level == 1 then
		bkg1:toFront()
	elseif level ==2 then
				bkg2:toFront()
	elseif level ==3 then
				bkg3:toFront()
	elseif level ==4 then
				bkg4:toFront()
	elseif level ==5 then
				bkg5:toFront()
	elseif level ==6 then
				bkg6:toFront()
	elseif level ==7 then
				bkg7:toFront()
	elseif level ==8 then
				bkg8:toFront()
	elseif level ==9 then
				bkg9:toFront()
	elseif level ==10 then
				bkg10:toFront()
	end
	level_text.text = "Level: " .. level


end
 -- update score
local function show_message(message)
    if message == ""  then
        messages_text.text = ""
    else
        messages_text.text = message
    end
end
 
-- update score
local function update_score()
        score_text.text = "Score: " .. score
        accum_text.text = "Cumulative Score: " .. accum_points
        check_background()
        check_level()       
        save_data()
end

--reset data
local function reset_data()
	accum_points = 0
	highScore = 0
	save_data()
end

-- update high score
local function update_high_score()
        if score > highScore then
            show_message("New High Score. Great Job!")
            highScore = score
        else 
            show_message("")
        end
        score_high.text = "High Score: " .. highScore

end

-- update comboCount
local function update_combo_count(input)
        if input > combo_count then

            combo_count = input
        end
        if input == 0 then
            
        else
            new_combo_text.text = ""..input .. " Gem Combo!"
        end

        combo_text.text = "Max Combo: " .. combo_count
end
 
 
-- return shade value
local function shade( r, g, b )
        local g = graphics.newGradient(
                { r, g, b },
                { r * 0.25, g * 0.25, b * 0.25 },
                "down" )
        return g
end
 
-- create the grid and ball arrays
local function create_grid()
        for i = 0, 11 do
                grid[ i ] = {}
                ball[ i ] = {}
                for j = 0, 11 do
                        if i == 0 or i == 11 or j == 0 or j == 11 then
                                m = 0
                        else
                                m = 1
                        end
                        grid[ i ][ j ] = display.newRoundedRect( 0, 0, 29, 29, 3 )
                        grid[ i ][ j ].x = j * 30 - 5
                        grid[ i ][ j ].y = i * 30 + 70
                        grid[ i ][ j ].alpha = m * 0.15
                        grid[ i ][ j ].gridX = j
                        grid[ i ][ j ].gridY = i                        
                        grid[ i ][ j ]:addEventListener( "touch", grid_touch )
                        ball[ i ][ j ] = display.newRoundedRect( 0, 0, 19, 19, 3 )                        
                        ball[ i ][ j ].x = j * 30 - 5
                        ball[ i ][ j ].y = i * 30 + 70
                        ball[ i ][ j ].alpha = m
                end
        end
end
 
 
-- fill grid
local function fill_grid()
        for i = 1, 10 do
                for j = 1, 10 do
                        grid[ i ][ j ].alpha = 0.15
                        if math.random( 100 ) > 75 then
                                k = 0
                        else
                                k = math.random( 1, 4 )
                        end
                        local rgb = colors[ k  + 1 ]
                        ball[ i ][ j ]:setFillColor( shade( rgb[ 1 ], rgb[ 2 ], rgb[ 3 ], rgb[ 5 ] ) )
                        ball[ i ][ j ].value = k
                end
        end
end                     
                        
 
-- compressing action
local function compressing_action()
        compress_completed = true
        for i = 9, 1, -1 do
                for j = 1, 10 do
                        if ball[ i ][ j ].value > 0 and ball[ i + 1 ][ j ].value == 0 then
                                compress_completed = false
                                k = ball[ i ][ j ].value
                                ball[ i ][ j ].value = 0
                                ball[ i + 1 ][ j ].value = k
                                local rgb = colors[ k + 1 ]
                                local tempball = display.newRoundedRect( 0, 0, 19, 19, 3 )
                                tempball:setFillColor( shade( rgb[ 1 ], rgb[ 2 ], rgb[ 3 ] ) )
                                tempball.x = j * 30 - 5
                                tempball.y = i * 30 + 70
                                local function remove_tempball()
                                        tempball:removeSelf()
                                        tempball = nil
                                end
                                transition.to( tempball, {
                                        time = 100,
                                        x = ball[ i + 1 ][ j ].x,
                                        y = ball[ i + 1 ][ j ].y,
                                        alpha = 0, onComplete = remove_tempball } )
                                ball[ i ][ j ]:setFillColor( 0, 0, 0 )
                                ball[ i + 1 ][ j ]:setFillColor( shade( rgb[ 1 ], rgb[ 2 ], rgb[ 3 ] ) )
                                transition.to( ball[ i + 1 ][ j ], { time = 100, alpha = 1 } )                                  
                        end     
                end
        end
 
end
 
 
-- compress grid
local function compress_grid()
        compress_completed = false
        while compress_completed == false do
                compressing_action()
        end
        
        -- compress columns
        for m = 1, 10 do
                for j = 1, 9 do
                        local sum = 0
                        for i = 1, 10 do
                                if ball[ i ][ j ].value > 0 then sum = sum + 1 end
                        end
                        if sum == 0 then
                                for i = 1, 10 do
                                        k = ball[ i ][ j + 1 ].value
                                        local rgb = colors[ k + 1 ]
                                        ball[ i ][ j ].value = k
                                        ball[ i ][ j ]:setFillColor( shade( rgb[ 1 ], rgb[ 2 ], rgb[ 3 ] ) )
                                        ball[ i ][ j + 1 ].value = 0
                                        ball[ i ][ j + 1 ]:setFillColor( 0, 0, 0, 0 )
                                end
                        end
                end
        end
end
 
 
-- check if there are no more moves
local function check_game_over()
        game_over = true
        for i = 1, 10 do
                for j = 1, 10 do
                        k = ball[ i ][ j ].value
                        if k > 0 and ( k == ball[ i + 1 ][ j ].value or k == ball[ i ][ j + 1 ].value ) then
                                game_over = false
                        end
                end
        end
end
 
 
-- clear highlights
local function clear_highlight()
        local i0, j0
        for i0 = 1, 10 do
                for j0 = 1, 10 do                       
                        grid[ i0 ][ j0 ].alpha = 0.15
                end
        end
end
 
 
-- highlight loop
local function highlight_loop( k )
        highlight_completed = true
        local i0, j0
        local function increase_worth()
                highlighted = highlighted + 1
                worth = worth + ( highlighted * 15 )
                highlight_completed = false
        end
        for i0 = 1, 10 do
                for j0 = 1, 10 do                       
                        if grid[ i0 ][ j0 ].alpha == 1 then
                                if grid[ i0 - 1 ][ j0 ].alpha ~= 1 and ball[ i0 - 1 ][ j0 ].value == k then
                                        grid[ i0 - 1 ][ j0 ].alpha = 1
                                        increase_worth()
                                end
                                if grid[ i0 ][ j0 - 1 ].alpha ~= 1 and ball[ i0 ][ j0 - 1 ].value == k then
                                        grid[ i0 ][ j0 - 1 ].alpha = 1
                                        increase_worth()
                                end
                                if grid[ i0 + 1 ][ j0 ].alpha ~= 1 and ball[ i0 + 1 ][ j0 ].value == k then 
                                        grid[ i0 + 1 ][ j0 ].alpha = 1
                                        increase_worth()
                                end
                                if grid[ i0 ][ j0 + 1 ].alpha ~= 1 and ball[ i0 ][ j0 + 1 ].value == k then
                                        grid[ i0 ][ j0 + 1 ].alpha = 1
                                        increase_worth()
                                end
                        end
                end
        end     
end
 
 
-- highlight grid
local function highlight_grid( i, j, k )
        highlight_completed = false     
        highlighted = 1                                 
        grid[ i ][ j ].alpha = 1
        worth = 15
        while highlight_completed == false do
                highlight_loop( k )
        end
        worth_text.text = "Value: " .. worth
end
 
 
-- bust highlighted
local function bust_highlighted()
        local i0, j0
        local comboCounter = 0
        for i0 = 1, 10 do
                for j0 = 1, 10 do                       
                        if grid[ i0 ][ j0 ].alpha == 1 then
                                grid[ i0 ][ j0 ].alpha = 0.15
                                k = ball[ i0 ][ j0 ].value
                                ball[ i0 ][ j0 ].value = 0
                                ball[ i0 ][ j0 ]:setFillColor( 0, 0, 0 )
                                local rgb = colors[ k + 1 ]
                                local tempball = display.newRoundedRect( 0, 0, 19, 19, 3 )
                                tempball:setFillColor( shade( rgb[ 1 ], rgb[ 2 ], rgb[ 3 ] ) )
                                tempball.x = j0 * 30 - 5
                                tempball.y = i0 * 30 + 70
                                local function remove_tempball()
                                        tempball:removeSelf()
                                        tempball = nil
                                end
                                transition.to( tempball, {
                                        time = 1000,
                                        rotation = math.random(360),
                                        x = math.random(320),
                                        y = math.random(480),
                                        alpha = 0, onComplete = remove_tempball } )  
                                comboCounter = comboCounter + 1                           
                        end
                end
        end
        update_combo_count(comboCounter)
        comboCounter = 0
        local gem_sound_channel = audio.play(gem_sound)
        score = score + worth
        accum_points = accum_points + worth
        update_score()
        update_high_score()
end
 
        
-- touch event handler
function grid_touch( event )
        if not ready then
                print( "not ready to accept touch event" )
                return
        else
                if event.phase == "ended" then
                        worth_text.text = ""
                        ready = false
                        i = event.target.gridY
                        j = event.target.gridX
                        k = ball[ i ][ j ].value
                        if k > 0 then
                                -- determine if first or second touch
                                if selection == 2 then
                                        if i == i2 and j == j2 then
                                                print( j .. ", " .. i .. " confirmed!" )
                                                bust_highlighted()
                                                compress_grid()
                                                check_game_over()
                                                if game_over then
                                                        worth_text.text = "Game over! Shake device to try again."
                                                else
                                                        ready = 1
                                                end
                                                selection = 3
                                        else
                                                i2 = 0
                                                j2 = 0
                                                selection = 1
                                        end
                                end
                                if selection == 1 then
                                        clear_highlight()
                                        if k == ball[ i - 1 ][ j ].value or k == ball[ i + 1 ][ j ].value or
                                           k == ball[ i ][ j - 1 ].value or k == ball[ i ][ j + 1 ].value then
                                                print( j .. ", " .. i .. " selected, color: " .. colors[ k + 1 ][ 4 ] )
                                                i2 = i
                                                j2 = j
                                                selection = 2
                                                highlight_grid( i, j, k )
                                        else
                                                print( j .. ", " .. i .. " has no nearby match" )
                                        end
                                        ready = true
                                end
                                if selection == 3 then selection = 1 end
                        else
                                print( j .. ", " .. i .. " is empty" )
                                clear_highlight()
                                ready = true
                        end
                end
        end
end
 
 
-- start the game
local function start_game()
        score = 0
        combo_count = 0
        new_combo_text.text = ""
        worth_text.text = ""
        update_score()
        update_high_score()
        update_combo_count(0)

        compress_grid()
        check_game_over()
        ready = true

end

local function buttonclicked(event)
	    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
                fill_grid()
                start_game()
    end

end

local function buttonclicked2(event)
	    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
                reset_data()
                 check_level()
				check_background()
                fill_grid()
                start_game()
    end

end

local restartbtn = widget.newButton {
width = 100,
height = 30,
defaultFile = "buttonRestart.png", 
overFile = "buttonRestart.png",
onEvent = buttonclicked,
label = "",
id = "restartbtn"


}

local resetbtn = widget.newButton {
width = 100,
height = 30,
defaultFile = "buttonReset.png", 
overFile = "buttonReset.png",
onEvent = buttonclicked2,
label = "",
id = "resetbtn"


}

restartbtn.x = 100
restartbtn.y = 490

resetbtn.x = 225
resetbtn.y = 490
 
 
-- detect shake
local function accelerometer_detection ( event )
        if event.isShake and game_over then
        		check_level()
				check_background()
                fill_grid()
                start_game()
        end
end

load_data()
check_level()
check_background()
create_grid()
fill_grid()
start_game()
worth_text.text = "Welcome to Gem Breaker!"
 
Runtime:addEventListener( "accelerometer", accelerometer_detection )