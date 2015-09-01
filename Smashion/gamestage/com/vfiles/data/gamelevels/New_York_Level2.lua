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
      name = 2,
      ammo = -1
    },

    {
      name = 3,
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
        type = 2,
        basePoint = 100,
        pointException = nil
      },

      {
        name = 3,
        type = 1,
        basePoint = 100,
        pointException = nil
      },

      {
        name = 5,
        type = 1,
        basePoint = 100,
        pointException = nil
      },

      {
        name = 7,
        type = 3,
        basePoint = 100,
        pointException = nil
      },

      {
        name = 10,
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
  achievements = { 1400, 1600, 1800 }
}
