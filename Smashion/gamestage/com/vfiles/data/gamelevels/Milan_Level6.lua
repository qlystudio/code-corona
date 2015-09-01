return {

  --------------------------------------------------
  -- conditions config
  -- Note:
  -- timeLimit is int
  -------------------------------------------------- 
  timeLimit = 80, 
  --------------------------------------------------
  -- Weapon config
  -- ammo -1 is infinite
  --------------------------------------------------
  weapons = {
    {
      name = 4,
      ammo = 8
    },

    {
      name = 5,
      ammo = 8
    },

    {
      name = 6,
      ammo = 8
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
    basePoint = 1000,
    chars = {
      {
        name = 1,
        type = 3,
        basePoint = 1000,
        pointException = nil
      },

      {
        name = 3,
        type = 3,
        basePoint = 1500,
        pointException = { weapon = 6, point = 2000 }
      },

      {
        name = 6,
        type = 4,
        basePoint = 2000,
        pointException = { weapon = 5, point = 2500 }
      },

      {
        name = 8,
        type = 5,
        basePoint = 1000,
        pointException = nil
      },

      {
        name = 9,
        type = 3,
        basePoint = -5000,
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
  achievements = { 19500, 20500, 21500 }
}
