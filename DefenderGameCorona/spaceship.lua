Spaceship = Class(GameSprite)

function Spaceship:new(group)
  self:initialize(spriteAnims.spaceshipSequence, group)
  local rot = math.pi * (-0.4 + math.random(8) / 10)
  local dx = SHIP_DIST * math.sin(rot)
  local dy = - SHIP_DIST * math.cos(rot)
  local x = PLANET_X + dx
  local y = PLANET_Y + dy
  local rot = 90 + math.atan2(dy,dx) * 180 / math.pi
  self.spriteInstance.rotation = rot
  self:moveTo(x,y)
  self.speed = 1 + math.random(3)
  self.isAlive = true
  self.wasKilled = false
end

function Spaceship:update()
  local dx = PLANET_X - self.spriteInstance.x
  local dy = PLANET_Y - self.spriteInstance.y
  local hypotenuse = dx * dx + dy * dy
  hypotenuse = math.sqrt(hypotenuse)
  self:move(self.speed * dx / hypotenuse, self.speed * dy / hypotenuse)
  if hypotenuse < PLANET_RADIUS then
    self.isAlive = false
  end
end

function Spaceship:toggleDelete()
  if(self.isAlive == false) then
    return true
  end

  return false
end

function Spaceship:removeMe()
  self:removeSprite()
end

function Spaceship:destroy()
  self.isAlive = false
  self.wasKilled = true
end
