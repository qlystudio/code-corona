local this, storage = {}, require "com.vfiles.storage.loadsave"
local fileName = "gamedata-v.json"

function this:get(t)
  local data = storage.loadTable(fileName)
  if data == nil then
    return "value \"" .. t .. "\" does not exist"
  else
    return data[t]
  end
end

function this:set(t,v)
  local data = storage.loadTable(fileName)
  if data == nil then
    print("File is Nil. Creating a new file.")
    data = {}
  end
  data[t] = v
  storage.saveTable(data, fileName)
  return v
end

function this:load()
  local file = storage.loadTable(fileName)  
  if file == nil then
    return nil
  else
    if file["__init__"] == nil then
      return nil
    else
      return file
    end
  end
end

function this:reset()
  -- [Total score]
  this:set("TotalScore", 0)

  -- [City level]
  --[[ Readme:

    ==Syntax parameter==
    gameData:set( {str} 1 , { {bool} 2 , {int} 3 , {object} 4 })

    1: City name
    2: City locked/unlocked from World map
    3: Playable level. Default is 1
    4: levelData is an {object} which will contain n of level index based on City data. For an example:

    levelData[1] = {
      score = {int},        // Best score
      achievement = {int},  // Num of stars user got from certain stage
    }
  ]]  

  -- DEFAULT
  -- this:set("NewYork", { locked = false, currentLevel = 1, levelTotal = 15, levelData = { {score = 0, achievement = 0} } })
  -- this:set("London", { locked = true, currentLevel = 0, levelTotal = 13, levelData = { {score = 0, achievement = 0} } })
  -- this:set("Milan", { locked = true, currentLevel = 0, levelTotal = 10, levelData = { {score = 0, achievement = 0} } })
  -- this:set("Paris", { locked = true, currentLevel = 0, levelTotal = 8, levelData = { {score = 0, achievement = 0} } })  
  
  this:set("NewYork", { locked = false, currentLevel = 15, levelTotal = 15, levelData = { 
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 1000, achievement = 1},
    {score = 0, achievement = 0}
    }
  })

  this:set("London", { locked = false, currentLevel = 13, levelTotal = 13, levelData = { 
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0}
    }
  })



  this:set("Milan", { locked = false, currentLevel = 10, levelTotal = 10, levelData = { 
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0}
    }
  })

  this:set("Paris", { locked = false, currentLevel = 8, levelTotal = 8, levelData = { 
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0},
    {score = 1000, achievement = 0}
    } 
  })
end

return this