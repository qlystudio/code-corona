require "com.vfiles.core.Class"

require "com.vfiles.objects.weapons.Bag"
require "com.vfiles.objects.weapons.Bottle"
require "com.vfiles.objects.weapons.Cellphone"
require "com.vfiles.objects.weapons.Cigarettes"
require "com.vfiles.objects.weapons.Stiletto"
require "com.vfiles.objects.weapons.Camera"
require "com.vfiles.objects.huds.Armory"

WeaponController = Class()
local armory, ammo, ammoTotal, weaponCollection, assetStage, assetTable, powerMeter, powerMeterTimer


--------------------------------------------------
-- Private workers
--------------------------------------------------
local function updatePowerMeter(n) 
  if powerMeter > n then
    powerMeter = powerMeter - n
    return true
  else
    print("Need more power")
    scene:dispatchEvent( {name = "powerMeterEvent", data = {value = powerMeter, shootable = false} } )
    return false
  end
end


--------------------------------------------------
-- Listeners
--------------------------------------------------
local function updatePowerGauage()
  if powerMeter < 100 then
    powerMeter = math.round(powerMeter + 1)
    scene:dispatchEvent( {name = "powerMeterEvent", data = {value = powerMeter} } )
  end
end

--------------------------------------------------
-- Constructor
--------------------------------------------------
function WeaponController:initialize(config)
  assetStage = config.assetStage
  assetTable = config.assetTable

  -- Build weapon collection
  weaponCollection = {
    bag = Bag,
    bottle = Bottle,
    cellphone = Cellphone,
    cigarettes = Cigarettes,
    stiletto = Stiletto,
    camera = Camera
  }

  -- Setup Ammo
  ammo = {}
  ammoTotal = 0
  for i=1, #config.prop do
    ammo[config.prop[i].name] = config.prop[i].ammo
    -- Sum all ammo to ammoTotal. 
    -- If one of any weapon has infinite ammo(-1) then ammoTotal also should become infinite(-1)
    if config.prop[i].ammo == -1 then ammoTotal = -1 end
    if ammoTotal ~= -1 then ammoTotal = ammoTotal + config.prop[i].ammo end
  end

  -- Build armory
  local config = {
    parent = config.mainStage, 
    prop = config.prop, 
    ammo = ammo,
    spriteSheet = config.spriteSheet, 
    spriteSheetInfo = config.spriteSheetInfo
  }
  armory = Armory:new(config)

  -- Setup powermeter (% for powerGauge)
  powerMeter = 100
  powerMeterTimer = timer.performWithDelay( 50, updatePowerGauage, 0)
end

--------------------------------------------------
-- Public workers
--------------------------------------------------
function WeaponController:fireWeapon(topDeg, sideDeg, velocity)  
  local weaponNm = armory:getSelectedWeapon()
  -- Check # of ammo first. -1 is infinite
  if ammo[weaponNm] > 0 or ammo[weaponNm] == -1 then
    
    -- Create weapon
    local weapon = weaponCollection[weaponNm]:new({parent = assetStage, groupTable = assetTable})
      -- Fire when power meter can handel the weight
      if updatePowerMeter(weapon:getWeight()/4 * 10) == true then
        weapon:fire(topDeg, sideDeg, velocity)
        -- Decrease taget ammo value
        if ammo[weaponNm] > 0 then ammo[weaponNm] = ammo[weaponNm]-1 end
        -- Decrease total ammo value
        if ammoTotal ~= -1 then ammoTotal = ammoTotal-1 end
        -- Update ammo number in armory UI
        armory:updateAmmo({name=weaponNm, ammo=ammo[weaponNm]})
      else
        weapon:destroy()
      end
    sfx("swipe")
  else
    print("out of ammo")
  end
  -- armory:collapse()
end

function WeaponController:disable()
  armory:disable()
  timer.pause(powerMeterTimer)
  for i = 1, #assetTable do
    if assetTable[i].body ~=nil then assetTable[i].body:pause() end
  end  
end

function WeaponController:enable()
  armory:enable()
  timer.resume(powerMeterTimer)
  for i = 1, #assetTable do
    if assetTable[i].body ~= nil then assetTable[i].body:play() end
  end    
end

function WeaponController:rotate(isPortrait)
  armory:reposition(isPortrait)
end

function WeaponController:getAmmoTotal()
  return ammoTotal
end

function WeaponController:destroy()
  print("--X-- WeaponController")
  armory:destroy()
  self = nil
end