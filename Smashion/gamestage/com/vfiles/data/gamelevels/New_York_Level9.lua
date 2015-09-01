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
      name = 1,
      ammo = -1
    },

    {
      name = 3,
      ammo = -1
    },

    {
      name = 5,
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
        type = 4,
        basePoint = 100,
        pointException = nil
      },

      {
        name = 3,
        type = 3,
        basePoint = 100,
        pointException = nil
      },

      {
        name = 6,
        type = 4,
        basePoint = 600,
        pointException = nil
      },

      {
        name = 9,
        type = 3,
        basePoint = 200,
        pointException = { weapon = 1, point = 400 }
      },

      {
        name = 10,
        type = 3,
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
  achievements = { 2800, 2900, 3000 }
}
