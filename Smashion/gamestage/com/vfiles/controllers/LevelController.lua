require "com.vfiles.core.Class"

LevelController = Class()
local level
local weaponNameIdx = {"bag","stiletto","bottle","cigarettes","cellphone", "camera"}
local cities = {"NewYork", "London", "Milan", "Paris"}

local enemyNameIdx = {
  "alek","cara","devon","jenny","joan","kate","lindsay","maria","naomi","stella"
}

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function getLevel(city, n)
  local levelAll, root = {}, "com.vfiles.data.gamelevels"
    
  if city == "NewYork" then
    levelAll[1] = require (root..".New_York_Level1")
    levelAll[2] = require (root..".New_York_Level2")
    levelAll[3] = require (root..".New_York_Level3")
    levelAll[4] = require (root..".New_York_Level4")
    levelAll[5] = require (root..".New_York_Level5")
    levelAll[6] = require (root..".New_York_Level6")
    levelAll[7] = require (root..".New_York_Level7")
    levelAll[8] = require (root..".New_York_Level8")
    levelAll[9] = require (root..".New_York_Level9")
    levelAll[10] = require (root..".New_York_Level10")
    levelAll[11] = require (root..".New_York_Level11")
    levelAll[12] = require (root..".New_York_Level12")
    levelAll[13] = require (root..".New_York_Level13")
    levelAll[14] = require (root..".New_York_Level14")
    levelAll[15] = require (root..".New_York_Level15")
  elseif city == "London" then
    levelAll[1] = require (root..".London_Level1")
    levelAll[2] = require (root..".London_Level2")
    levelAll[3] = require (root..".London_Level3")
    levelAll[4] = require (root..".London_Level4")
    levelAll[5] = require (root..".London_Level5")
    levelAll[6] = require (root..".London_Level6")
    levelAll[7] = require (root..".London_Level7")
    levelAll[8] = require (root..".London_Level8")
    levelAll[9] = require (root..".London_Level9")
    levelAll[10] = require (root..".London_Level10")
    levelAll[11] = require (root..".London_Level11")
    levelAll[12] = require (root..".London_Level12")
    levelAll[13] = require (root..".London_Level13")
  elseif city == "Milan" then
    levelAll[1] = require (root..".Milan_Level1")
    levelAll[2] = require (root..".Milan_Level2")
    levelAll[3] = require (root..".Milan_Level3")
    levelAll[4] = require (root..".Milan_Level4")
    levelAll[5] = require (root..".Milan_Level5")
    levelAll[6] = require (root..".Milan_Level6")    
    levelAll[7] = require (root..".Milan_Level7")    
    levelAll[8] = require (root..".Milan_Level8")    
    levelAll[9] = require (root..".Milan_Level9")    
    levelAll[10] = require (root..".Milan_Level10")    
  elseif city == "Paris" then
    levelAll[1] = require (root..".Paris_Level1")
    levelAll[2] = require (root..".Paris_Level2")
    levelAll[3] = require (root..".Paris_Level3")
    levelAll[4] = require (root..".Paris_Level4")
    levelAll[5] = require (root..".Paris_Level5")
    levelAll[6] = require (root..".Paris_Level6")
    levelAll[7] = require (root..".Paris_Level7")
    levelAll[8] = require (root..".Paris_Level8")
  end


  return levelAll[n]
end

local function swapWeaponIdxToName(src)
  local data = deepcopy(src)
  for i=1, #data do
    data[i].name = weaponNameIdx[data[i].name]
  end
  return data
end

local function swapEnemyIdxToName(src)
  local data = deepcopy(src)
  for i=1, #data.chars do
    data.chars[i].name = enemyNameIdx[data.chars[i].name]
    if data.chars[i].pointException ~= nil then
      data.chars[i].pointException.weapon = weaponNameIdx[data.chars[i].pointException.weapon]      
    end
  end
  return data
end

--------------------------------------------------
-- Private constructor
--------------------------------------------------
function LevelController:initialize() 
end

function LevelController:set(city, lv)
  level = getLevel(city, lv) -- city name from selected map
  self.score = 0
  self.lives = level.liveTotal
  self.timeLimit = level.timeLimit
  self.weapons = swapWeaponIdxToName(level.weapons)
  self.enemies = swapEnemyIdxToName(level.enemies)
  self.achievements = level.achievements
end
--------------------------------------------------
-- Public workers
--------------------------------------------------
function LevelController:getStageInfo(city, lv)
  local data = {}
  level = getLevel(city, lv)
  data.level = lv
  data.targetScore = level.achievements[1]
  data.enemies = swapEnemyIdxToName(level.enemies)
  return data
end

function LevelController:update(data)
  self.score = self.score + data.point
  if self.score < 0 then self.score = 0 end
end

function LevelController:getResult()
  -- Match achievement score set and define win or lose by # of stars (0 == lose)
  local stars = 0

  for i=1, #self.achievements do
    if self.achievements[i] <= self.score then
      stars = i
    end
  end

  return {
    score = self.score,
    achievement = stars
  }
end

function LevelController:unlockNextCity(nm)
  local idx = 1
  for i=1, #cities do
    if cities[i] == nm then
      idx = idx + i
    break end 
  end
  if #cities < idx then
    return "AllClear"
  else
    -- Unlock data
    local data = gameData:get(cities[idx])
    data.locked = false
    data.currentLevel = 1
    gameData:set(cities[idx], data)
    return cities[idx]
  end

end

function LevelController:destroy()
  print("--X-- LevelController")
  self = nil
end