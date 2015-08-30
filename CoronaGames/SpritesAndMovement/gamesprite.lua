-- START:gameSpriteClass
GameSprite = Class( )

function GameSprite:new( )
end
-- END:gameSpriteClass

-- START:initSprite
-- Initialize the sprite using the spriteData for spriteName
function GameSprite:initSprite( sequence )
    self.spriteInstance = display.newSprite( imageSheet, 
        sequence )
    -- Store the instance in the sprite
    self.spriteInstance.object = self
end
-- END:initSprite

-- START:removeSpriteFunc
-- Remove the sprite
function GameSprite:removeSprite( )
    self.spriteInstance:removeSelf( )
    self.spriteInstance = nil
end
-- END:removeSpriteFunc

-- START:changeAnimation
-- Change the animation to animName and start playing
function GameSprite:changeAnimation( animName )
    self.spriteInstance:setSequence( animName )
    self.spriteInstance:play( )
end
-- END:changeAnimation

-- START:moveTo
-- Translocate to posX, posY
function GameSprite:moveTo( posX, posY )
    self.spriteInstance.x = posX
    self.spriteInstance.y = posY
end
-- END:moveTo

-- START:move
-- Move distanceX and distanceY
function GameSprite:move( distanceX, distanceY )
    self.spriteInstance.x = self.spriteInstance.x + distanceX
    self.spriteInstance.y = self.spriteInstance.y + distanceY
end
-- END:move

-- START:addToGroup
-- Initialize the sprite and add it to the group
function GameSprite:initialize( sequence, group )
    self:initSprite( sequence )
    
    -- Only add it to the group if it is not nil
    if group ~= nil then
        group:insert( self.spriteInstance )
    end
end
-- END:addToGroup