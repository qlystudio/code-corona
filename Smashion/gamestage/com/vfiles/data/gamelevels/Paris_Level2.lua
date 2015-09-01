return {

  --------------------------------------------------
  -- conditions config
  -- Note:
  -- timeLimit is int
  -------------------------------------------------- 
  timeLimit = 70, 
  --------------------------------------------------
  -- Weapon config
  -- ammo -1 is infinite
  --------------------------------------------------
  weapons = {
    {
      name = 1,
      ammo = 6
    },

    {
      name = 3,
      ammo = 6
    },

    {
      name = 6,
      ammo = 6
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
    basePoint = 2000,
    chars = {
      {
        name = 1,
        type = 1,
        basePoint = 4000,
        pointException = nil
      },

      {
        name = 2,
        type = 2,
        basePoint = 2000,
        pointException = { weapon = 6, point = 5000 }
      },

      {
        name = 4,
        type = 2,
        basePoint = 2000,
        pointException = { weapon = 1, point = -10000 }
      },

      {
        name = 8,
        type = 5,
        basePoint = 2000,
        pointException = nil
      },

      {
        name = 10,
        type = 1,
        basePoint = 2000,
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
  achievements = { 39000, 41000, 43000 }
}
