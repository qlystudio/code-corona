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
      ammo = 6
    },

    {
      name = 4,
      ammo = 6
    },

    {
      name = 5,
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
        name = 2,
        type = 5,
        basePoint = 2000,
        pointException = nil
      },

      {
        name = 4,
        type = 4,
        basePoint = 4000,
        pointException = nil
      },

      {
        name = 7,
        type = 3,
        basePoint = 2000,
        pointException = { weapon = 4, point = 5000 }
      },

      {
        name = 9,
        type = 1,
        basePoint = 2000,
        pointException = { weapon = 5, point = -10000 }
      },

      {
        name = 10,
        type = 4,
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
  achievements = { 42000, 45000, 47000 }
}
