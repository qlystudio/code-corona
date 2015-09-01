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
      ammo = 8
    },

    {
      name = 2,
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
        name = 2,
        type = 4,
        basePoint = 1000,
        pointException = nil
      },

      {
        name = 5,
        type = 2,
        basePoint = 2000,
        pointException = { weapon = 2, point = 2500 }
      },

      {
        name = 6,
        type = 5,
        basePoint = 2500,
        pointException = { weapon = 6, point = 3000 }
      },

      {
        name = 7,
        type = 2,
        basePoint = -5000,
        pointException = nil
      },

      {
        name = 8,
        type = 4,
        basePoint = 1000,
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
  achievements = { 17500, 18500, 19500 }
}
