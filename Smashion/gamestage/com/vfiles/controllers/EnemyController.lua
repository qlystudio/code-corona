require "com.vfiles.core.Class"
require "com.vfiles.objects.enemies.Alek"
require "com.vfiles.objects.enemies.Kate"
require "com.vfiles.objects.enemies.Devon"
require "com.vfiles.objects.enemies.Jenny"
require "com.vfiles.objects.enemies.Stella"
require "com.vfiles.objects.enemies.Maria"
require "com.vfiles.objects.enemies.Joan"
require "com.vfiles.objects.enemies.Lindsay"
require "com.vfiles.objects.enemies.Cara"
require "com.vfiles.objects.enemies.Naomi"

EnemyController = Class()

-- variables
-- enemy          {table} -- Contain initialized enemy object (reusable)
-- enemyClass     {table} -- Contain preloaded enemy class pointer
-- enemySlot      {table} -- Contain enemy object name live on stage
-- positionSlot   {table} -- pre-defined offsetX of position by maxOnStage
-- assetTable     {table} -- grouptable of enemy class
-- maxOnStage     {float} -- Max number of enemy can appear on stage

local enemy, enemyClass, enemySlot, spawnPattern, spawnIdx, positionSlot, assetTable, maxOnStage

--------------------------------------------------
-- Private workers
--------------------------------------------------
local function populateEnemyData(data, parent)
  -- Preload the ememy class will be used in this stage in enemy table
  local config
  enemy = {}
  enemySlot = {}
  spawnPattern = {}
  
  -- let's loop
  for i=1, #data do
    config = {
      parent = parent, 
      groupTable = assetTable,
      levelData = data[i],
      type = data[i].type
    }
    -- insert enemy object
    enemy[i] = enemyClass[data[i].name]:new(config)
    spawnPattern[i] = i
  end -- for end

  -- Build random spawnPattern
  spawnPattern = shuffle(spawnPattern)
  spawnIdx = 1
end

local function getAvailableSlot()
  local idx = 0
  for i=1, #positionSlot do
    if positionSlot[i].fill == false then
      idx = i
      break end
  end --for end
  return idx
end

local function getAvailableEnemy() 
  --[[
    Jul 23, 2014
    isScorable is depreciated. This function will return random index of enemy data
  ]]

  -- Get candiate
  -- local candidate = enemy[math.random(1, #enemy)]
  local candidate = enemy[spawnPattern[spawnIdx]]
  -- Match the enemy name in field to prevent duplicate 
  for i=1, #enemySlot do
    -- if it's already on stage, return nil
    if enemySlot[i].name == candidate.name then
      candidate = nil
    break end
  end

  spawnIdx = spawnIdx + 1
  if spawnIdx > #spawnPattern then
    spawnIdx = 1
  end

  return candidate

  -- local n = math.random(1, #enemy)
  -- table.insert(enemySlot, {name = enemy[n].name, scorable = enemy[n].scorable}) 
  -- return enemy[n]

  -- [Depreciated code START]

  -- Create index and shuffle
  -- local idx = {}
  -- for i=1, #enemy do
  --   idx[i] = i    
  -- end
  -- idx = shuffle(idx)

  -- -- enemyOnStage checker
  -- function enemyOnStage(obj)
  --   local scorableOnStage = false
  --   local goodCandidate = true
  --   local nm = obj.name
  --   local scorable = obj.scorable

  --   --Check if there's scorable enemy on stage
  --   for i=1, #enemySlot do
  --     if enemySlot[i].scorable == true then        
  --       scorableOnStage = true
  --     break end
  --   end

  --   for i=1, #enemySlot do
  --     -- return false if name already exist in enemySlot
  --     if string.find(nm, enemySlot[i].name) ~= nil then
  --       goodCandidate = false
  --     break end
  --     -- return false if candidate is not scorable and stage doesn't have any scorable enemy
  --     if scorable == false and scorableOnStage == false then
  --       goodCandidate = false
  --     break end
  --   end
  --   return goodCandidate
  -- end 
  -- -- enemyOnStage end

  -- for i=1, #enemy do
  --   if enemyOnStage(enemy[idx[i]]) == true then
  --     table.insert(enemySlot, {name = enemy[idx[i]].name, scorable = enemy[idx[i]].scorable})      
  --     return enemy[idx[i]]
  --   else
  --     print("--- SEARCHING OTHER CANDIDATE ---")
  --   end
  -- end -- for end

  -- [Depreciated code END]

end

--------------------------------------------------
-- Listeners
--------------------------------------------------
local function removeEnemyEventListener(e)
  obj = e.target

  -- Cancel blink trasition if any
  -- if(obj.blink ~= nil) then
  --   transition.cancel(obj.blink)
  -- end

  if(obj.body ~= nil) then
    obj.body.isVisible = false;
    obj.body.z = nil
  end

  -- Remove enemy object from groupTable
  for i=1, #assetTable do
      if assetTable[i] == obj then
      table.remove(assetTable,i)
      -- print("EnemyController: Removing from grouptable", obj.name)
      break end
  end
  -- Remove enemy object from enemySlot
  for i=1, #enemySlot do
    if enemySlot[i].name == obj.name then
      table.remove(enemySlot,i)
      -- print("EnemyController: Removing from enemy slot", obj.name)
    break end
  end
  -- Remove enemy object from positionSlot
  positionSlot[obj.slot].fill = false
  print("EnemyController: Removing from positionSlot", obj.name, '#', obj.slot)
end

--------------------------------------------------
-- Constructor
--------------------------------------------------
function EnemyController:initialize(config)

  assetTable = config.assetTable
  maxOnStage = config.prop.maxOnStage

  -- Build enemy class
  enemyClass = {
    alek    = Alek,
    cara    = Cara,
    devon   = Devon,
    jenny   = Jenny,
    joan    = Joan,
    kate    = Kate,
    lindsay = Lindsay,
    maria   = Maria,
    naomi   = Naomi,
    stella  = Stella
  }
  -- Populate enemy data available in this stage
  populateEnemyData(config.prop.chars, config.assetStage)


  -- Build pre-configured enemy enemy position slot
  positionSlot = {}
  
  if maxOnStage == 1 then
    positionSlot[1] = {fill = false, x = 0}
  elseif maxOnStage == 2 then
    positionSlot[1] = {fill = false, x = -55}
    positionSlot[2] = {fill = false, x = 55}
  elseif maxOnStage == 3 then
    positionSlot[1] = {fill = false, x = -120}
    positionSlot[2] = {fill = false, x = 0}
    positionSlot[3] = {fill = false, x = 120}
  end

  -- Add listener
  scene:addEventListener("removeEnemyEvent", removeEnemyEventListener)
end

--------------------------------------------------
-- Public workers
--------------------------------------------------

function EnemyController:spawnEnemy()

  -- Find an available slot position first
  local openSlot = getAvailableSlot()
  
  -- Spawn the enemy if there's a slot available
  if openSlot > 0 then

    print("spawnEnemy")
    
    local enemy = getAvailableEnemy()

    if enemy ~= nil then
      table.insert(enemySlot, {name = enemy.name})
      positionSlot[openSlot].fill = true
      enemy:set(4, positionSlot[openSlot].x, openSlot)
      enemy:play()
    end

  end
end

function EnemyController:disable()
  for i = 1, #enemy do
    enemy[i].sprite:pause()
  end
end

function EnemyController:enable()
  for i = 1, #enemy do
    enemy[i].sprite:play()
  end
end

function EnemyController:destroy()
  print("--X-- EnemyController")
  scene:removeEventListener("removeEnemyEvent", removeEnemyEventListener)
  
  -- Destroy all asset in enemy table
  for i = 1, #enemy do
    enemy[i]:destroy()
  end

end
