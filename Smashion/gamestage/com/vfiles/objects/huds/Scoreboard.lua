require "com.vfiles.core.Class"

Scoreboard = Class()

local stage, timeContainer, scoreContainer, scoreMask, powerMeterContainer, powerMeter
local stageW, stageH, stagePadding = 300, 200, 10
local scoreBlock, currScoreBlock, currScoreDiff = {}, 1, 0

local timeCountLb, scoreCountLb, scoreCountWLb, powerMeterLock

local goldGdnt, redGdnt

--------------------------------------------------
-- Listeners
--------------------------------------------------

--------------------------------------------------
-- Private workers
--------------------------------------------------

local function timeConverter(n)
  local m,s,t;

  m = math.floor(n/60)
  s = n%60
  function digit(d)
    if d < 10 then
      d = "0" .. d 
    end
    return d
  end

  return digit(m) .. ":" .. digit(s)
end

local function setPanel(parent,x,y,w,h)
  local panel = display.newRect(parent, x-stageW/2, y-stageH/2, w, h)
  panel:setFillColor(255,242,0)
  panel.anchorX = 0
  panel.anchorY = 0
  return panel
end

local function buildTimer(t)
  local timeBg, timeLb
  timeContainer = display.newContainer(stage, 75, 32 )
  timeContainer.anchorChildren, timeContainer.anchorX, timeContainer.anchorY, timeContainer.x, timeContainer.y = false, 0, 0, 0, 15
  timeBg = display.newRect(timeContainer, 0, 0, 75, 32 )
  timeBg.anchorX, timeBg.anchorY = 0, 0
  timeBg:setFillColor(goldGdnt)
  timeLb = display.newBitmapText(timeContainer, "{black}TIME",21,16,"champion-40",24)
  timeCountLb = display.newBitmapText(timeContainer, timeConverter(t),54,16,"champion-40",24)
  timeCountLb:setTintColor(0,0,0)  
end

local function buildScore()
-- Build score labels
  local scoreBg, scoreLb, scoreMeterBg, scoreMeter, line1, line2
  scoreContainer = display.newContainer(stage, 230, 32 )
  scoreContainer.anchorChildren, scoreContainer.anchorX, scoreContainer.anchorY, scoreContainer.x, scoreContainer.y = false, 0, 0, 80, 15
  scoreBg = display.newRect(scoreContainer, 0, 0, 40, 32 )
  scoreBg.anchorX, scoreBg.anchorY = 0, 0
  scoreBg:setFillColor(goldGdnt)
  scoreLb = display.newBitmapText(scoreContainer, "{black}SCORE",20,16,"champion-40",24)

  -- Fill black bar behind the score meter
  scoreMeterBg = display.newRect(scoreContainer, 40, 0, 180, 32 )
  scoreMeterBg.anchorX, scoreMeterBg.anchorY = 0, 0
  scoreMeterBg:setFillColor(.086, .086, .086)

  -- Add lines
  line1 = display.newLine( scoreContainer, 100, 0, 100, 32 )
  line1:setStrokeColor(.4,.4,.4)
  line2 = display.newLine( scoreContainer, 160, 0, 160, 32 )
  line2:setStrokeColor(.4,.4,.4)    

  -- Add and stars in stage
  function addStar(i,j)
    local offx, w = 180, 60
    local star = display.newImageRect( stage, "assets/images/ui/gameview/hud-star.png", 12, 12 )
    star.anchorX, star.anchorY = 1, 0
    star.x = offx + (i-1)*w -(j-1)*(star.width+2)
  end
  for i=1, #scoreBlock do
    for j=1, i do
      addStar(i,j)
    end
  end


  -- Score label (white)
  scoreCountWLb = display.newBitmapText(scoreContainer, "0",50,16,"champion-40",26)
  scoreCountWLb:setTintColor(.8,.8,.8)
  scoreCountWLb:moveTo(scoreCountWLb.width/2 + 45, 16)

  -- Score mask (contains score meter black socre label)
  scoreMask = display.newContainer( scoreContainer, 0, 32 )
  scoreMask.anchorChildren, scoreMask.anchorX, scoreMask.anchorY, scoreMask.x, scoreMask.y = false, 0, 0, 40, 0

  -- Score meter (Rectangle)
  scoreMeter = display.newRect(scoreMask, 0, 0, 180, 32 )
  scoreMeter.anchorX, scoreMeter.anchorY = 0, 0
  scoreMeter:setFillColor(goldGdnt)

  scoreCountLb = display.newBitmapText(scoreMask, "0",50,16,"champion-40",26)
  scoreCountLb:setTintColor(0,0,0)
  scoreCountLb:moveTo(scoreCountLb.width/2 + 5, 16)
end

local function buildPowerMeter()
  --Build power meter (Arm strength)
  local powerMeterBg, powerMeterLb
    -- Fill black bar behind the score meter
  powerMeterContainer = display.newContainer(stage, 300, 32 )
  powerMeterContainer.anchorChildren, powerMeterContainer.anchorX, powerMeterContainer.anchorY, powerMeterContainer.x, powerMeterContainer.y = false, 0, 0, 0, 52

  powerMeterBg = display.newRect(powerMeterContainer, 0, 0, 300, 12 )
  powerMeterBg.anchorX, powerMeterBg.anchorY = 0, 0
  powerMeterBg:setFillColor(.086, .086, .086)

  powerMeterLb = display.newBitmapText(powerMeterContainer, "POWER",20,6,"champion-20", 13)

  powerMeter = display.newRect(powerMeterContainer, 80, 0, 220, 12 )
  powerMeter.anchorX, powerMeter.anchorY = 0, 0
  powerMeter:setFillColor( redGdnt )

end

--------------------------------------------------
-- Constructor
--------------------------------------------------
function Scoreboard:initialize(config)
  
  stage = display.newContainer(config.parent, stageW, stageH)
  stage.anchorChildren, stage.anchorX, stage.anchorY, stage.x, stage.y = false, 0, 0, stagePadding, stagePadding

  goldGdnt = {
    type = "gradient",
    color1 = { .973, .937, .114 },
    color2 = { .886, .78, .055 },
    direction = "down"
  }

  redGdnt = {
    type = "gradient",
    color1 = { .749,.071, .306 },
    color2 = { .325, 0, .235 },
    direction = "down"
  }
  
  currScoreBlock = 1
  currScoreDiff = 0
  scoreBlock = config.achievements
  buildTimer(config.timeLimit)
  buildScore()
  buildPowerMeter()
end

--------------------------------------------------
-- Public workers
--------------------------------------------------
function Scoreboard:updateScore(score, lives)
  --update score
  --[[
    Score meter is consisit of three blocks and widths are evenly distributed.
    Which means each block should be filled by it's own 100% value to refer to scoreBlock (three achievements points from target stage).    
  ]]


  local fullWidth, filledWidth, perc, lbOffy = 60, 0, 0, 10
  local maxBarWidth = fullWidth * #scoreBlock

  function updateCurrentBlockNum(n)
    -- Recursive
    print("---------------------------------------------")
    print("Show block:  " .. scoreBlock[currScoreBlock])
    if n > scoreBlock[currScoreBlock] and currScoreBlock < #scoreBlock then
      print("-----loop-----")
      currScoreDiff =  scoreBlock[currScoreBlock]
      currScoreBlock = currScoreBlock + 1
      updateCurrentBlockNum(n)
    end
  end
  -- Update current block number first
  updateCurrentBlockNum(score)

  print("Score: " .. score)
  print("currScoreDiff: " .. currScoreDiff)

  -- Get block width based on perc
  filledWidth = (score+currScoreDiff)/(scoreBlock[currScoreBlock]+currScoreDiff) * fullWidth + (currScoreBlock-1) * fullWidth
  if filledWidth > maxBarWidth then filledWidth = maxBarWidth end
  -- Update memter width and labels
  scoreMask.width = filledWidth


  -- print("currScoreBlock: " .. currScoreBlock)
  -- print("filledWidth: " .. filledWidth)


  scoreCountLb:setText(comma_value(score))
  scoreCountWLb:setText(comma_value(score))
  if scoreCountLb.width + lbOffy < filledWidth then
    scoreCountLb:moveTo(filledWidth - scoreCountLb.width/2 - lbOffy, scoreCountLb.y)
    scoreCountWLb.alpha = 0
  else
    scoreCountLb:moveTo(scoreCountLb.width/2 + 5, 16)
    scoreCountWLb:moveTo(scoreCountWLb.width/2 + 45, 16)
  end  
end

function Scoreboard:updateTime(count)
  timeCountLb:setText(timeConverter(count)) 
end

function Scoreboard:updatePowerMeter(data)
  local perc = data.value * .01
  
  powerMeter.width = 220 * perc
  -- powerMeter.width = data.value
  -- transition.to( powerMeter, {time=100, width=data.value} )

  if data.shootable == false and powerMeterLock ~=true then
    powerMeterLock = true
    local blk = transition.blink( powerMeter, {time=500} )

    function unlock()
      transition.cancel(blk)
      powerMeter.alpha = 1
      powerMeterLock = false
    end

    timer.performWithDelay( 1000, unlock )
  end

  -- print("Power", data.value, "Shootable", data.shootable)
end

function Scoreboard:rotate(isPortrait)
end

function Scoreboard:destroy()
  print("Destroy ScoreBoard")
  for i=1, timeContainer.numChildren do
    timeContainer[1]:removeSelf()
    timeContainer[1] = nil
  end

  for i=1, scoreContainer.numChildren do
    scoreContainer[1]:removeSelf()
    scoreContainer[1] = nil
  end

  for i=1, stage.numChildren do
    stage[1]:removeSelf()
    stage[1] = nil
  end
  stage:removeSelf()
  stage = nil
  self = nil
end
