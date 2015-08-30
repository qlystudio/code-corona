local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

require('class')
require('gamesprite')
require('spaceship')
require('globals')

spritedata = require('shipsprites')
spriteAnims = require('spriteanims')

local ships = {}
local nextEnemy = 0

-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  local background = display.newImage("./images/space_background.jpg")
  background.x = display.contentWidth / 2
  background.y = display.contentHeight / 2
  group:insert( background )
  imageSheet = graphics.newImageSheet('images/shipsprites.png', spritedata:getSheet())

  lifeGroup = display.newGroup()
  group:insert(lifeGroup)
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
  lives = 3

  for i=1,3 do
    local lifeSprite = display.newImage(
      imageSheet,
      spritedata:getFrameIndex( IMG_LIFE )
    )

    lifeSprite.x = 20 * i - 5
    lifeSprite.y = 10
    lifeGroup:insert(lifeSprite)
  end

  storyboard.purgeScene('menu')

  Runtime:addEventListener('enterFrame', tick)
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
  Runtime:removeEventListener('enterFrame', tick)

  for i = #ships, 1, -1 do
    ships[i]:removeMe()
  end
  ships = {}
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
  local group = self.view
end

function tick()
  updateEnemies()
  addEnemies()
end

function updateEnemies()
  for i=#ships, 1, -1 do
    ships[i]:update()

    if(ships[i]:toggleDelete() == true) then
      if(ships[i].wasKilled == false) then
        lives = lives - 1
        lifeGroup[lifeGroup.numChildren]:removeSelf()
      end
      ships[i]:removeMe()
      removeTableRows(ships, i)
    end
  end

  if(lives <= 0) then
    storyboard.gotoScene('gameover')
  end
end

function addEnemies()
  nextEnemy = nextEnemy - 1
  if nextEnemy < 0 then
    local newShip = Spaceship()
    ships[#ships + 1] = newShip
    newShip.spriteInstance:addEventListener("touch", tappedShip)
    nextEnemy = 90
  end
end

function tappedShip(event)
  event.target.object:destroy()
end

function removeTableRows(array, row)
  table.remove(array, row)
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene)

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene
