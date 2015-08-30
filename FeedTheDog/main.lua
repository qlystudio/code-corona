-- Cut the Rope Inspired Game
-- Developed by Carlos Yanez

-- Hide Status Bar

display.setStatusBar(display.HiddenStatusBar)

-- Physics

local physics = require('physics')
physics.start()
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

-- Instructions

local ins

-- Dog

local dog

-- Shadow Stars

local s1
local s2
local s3

-- Hang

local hang

-- Bone

local bone

-- Alert

local alertView

-- Sounds

local starSnd = audio.loadSound('star.mp3')
local bite = audio.loadSound('bite.mp3')

-- Variables

local lastY
local ropeParts = display.newGroup()
local initX
local initY
local lines = display.newGroup()
local line
local collected = 0

-- Levels

local l1 = {{0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 2, 0, 0, 0, 0, 0},}

-- Functions

local Main = {}
local startButtonListeners = {}
local showCredits = {}
local hideCredits = {}
local showGameView = {}
local loadLevel = {}
local gameListeners = {}
local drawLine = {}
local ropeCollision = {}
local starBoneCollision = {}
local alert = {}

-- Main Function

function Main()
	titleBg = display.newImage('titleBg.png', 40, 57)
	playBtn = display.newImage('playBtn.png', 125, 225)
	creditsBtn = display.newImage('creditsBtn.png', 115, 286)
	titleView = display.newGroup(titleBg, playBtn, creditsBtn)
	
	--startButtonListeners('add')
end

Main()