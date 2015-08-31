-- Mini Golf Game
-- Developed by Carlos Yanez

-- Hide Status Bar

display.setStatusBar(display.HiddenStatusBar)

-- Physics

local physics = require('physics')
physics.start()
physics.setGravity(0, 0)
--physics.setDrawMode('hybrid')

-- Graphics

-- [Background]

local bg = display.newImage('bg.png')

-- [Title View]

local titleBg
local playBtn
local creditsBtn
local titleView

-- [Credits]

local creditsView

-- Game Background

local gameBg

-- TextFields

local parTF
local shotsTF

-- Instructions

local ins

-- Ball

local ball

-- Hole

local hole

-- Alert

local alertView

-- Sounds

local ballHit = audio.loadSound('ball_hit.mp3')
local ballHole = audio.loadSound('ball_hole.mp3')

-- Variables

local w1
local w2
local w3
local w4
local w5
local w6
local guide
local scoring

-- Functions

local Main = {}
local startButtonListeners = {}
local showCredits = {}
local hideCredits = {}
local showGameView = {}
local gameListeners = {}
local shoot = {}
local onCollision = {}
local alert = {}

-- Main Function

function Main()
	titleBg = display.newImage('titleBg.png', 114, 50)
	playBtn = display.newImage('playBtn.png', 218, 177)
	creditsBtn = display.newImage('creditsBtn.png', 203, 232)
	titleView = display.newGroup(titleBg, playBtn, creditsBtn)
	
	--startButtonListeners('add')
end

Main()