return {

  --------------------------------------------------
  -- conditions config
  -- Note:
  -- timeLimit is int
  -------------------------------------------------- 
  timeLimit = 60, 
  --------------------------------------------------
  -- Weapon config
  -- ammo -1 is infinite
  --------------------------------------------------
  weapons = {
    {
      name = 2,
      ammo = -1
    },

    {
      name = 4,
      ammo = -1
    },

    {
      name = 6,
      ammo = -1
    }        
  },

  --------------------------------------------------
  -- Enemies config
  -- Note:
  -- maxOnStage is max number of enemies on stage 
  -- All name should be in lowercase
  -- basePoint is required
  -- pointException can be nil
  --------------------------------------------------
  enemies = {
    maxOnStage = 2,
    basePoint = 100,
    chars = {
      {
        name = 1,
        type = 1,
        basePoint = 100,
        pointException = nil
      },

      {
        name = 2,
        type = 1,
        basePoint = 100,
        pointException = nil
      },

      {
        name = 6,
        type = 1,
        basePoint = 600,
        pointException = nil
      },

      {
        name = 7,
        type = 2,
        basePoint = 100,
        pointException = { weapon = 4, point = 400 }
      },

      {
        name = 8,
        type = 1,
        basePoint = 100,
        pointException = nil
      }

    }
  },

  --------------------------------------------------
  -- Achievements config
  -- Note:
  -- Minimum number of requirement to obtain stars
  -- Start from 1 star to 3 starts
  -------------------------------------------------- 
  achievements = { 2800, 3000, 3200 }
}
