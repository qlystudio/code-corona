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
      ammo = 10
    },

    {
      name = 3,
      ammo = 10
    },

    {
      name = 4,
      ammo = 10
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
    basePoint = 500,
    chars = {
      {
        name = 1,
        type = 1,
        basePoint = 500,
        pointException = { weapon = 2, point = 1000 }
      },

      {
        name = 4,
        type = 1,
        basePoint = 500,
        pointException = { weapon = 3, point = 1000 }
      },

      {
        name = 5,
        type = 3,
        basePoint = 500,
        pointException = { weapon = 4, point = 1000 }
      },

      {
        name = 8,
        type = 5,
        basePoint = 500,
        pointException = nil
      },

      {
        name = 9,
        type = 3,
        basePoint = 500,
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
  achievements = { 8000, 8500, 9000 }
}
