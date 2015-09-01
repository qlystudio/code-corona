require "com.vfiles.core.Class"
local Panel = require "com.vfiles.objects.panels.LevelPreviewEnemyPanel"
local PanelImgSheetInfo = require "com.vfiles.sprites.ui.global.model-faces"
local PanelImgSheet = graphics.newImageSheet( "assets/images/ui/global/model-faces.png", PanelImgSheetInfo:getSheet() )
local panelTable = {}

local EnemyPanel = Class()

function EnemyPanel:initialize(_)
  local localData = _.localData

  -- stage is container
  stage = display.newContainer(_.parent, 300, 200 )
  stage.anchorChildren, stage.anchorX, stage.anchorY = false, 0, 0
  panelTable = {}

  -- local temp = display.newRect(stage, 0, 0, 300, 200 )
  -- temp.anchorX, temp.anchorY = 0,0
  -- temp:setFillColor( 0,1,0,.2 )

  -- Build enemy panel with score
  local cnt, col, row, total = 1, 0, 0, 0
  function createEnemyPanel(n, pointException)
    local bp, mbp = localData.enemies.basePoint, localData.enemies.chars[n].basePoint
    if (bp == mbp and pointException == nil and total > 6) then
      -- Do not create panel for enemy w/ basePoint
    else
      local enemyPanel = Panel:new({
        parent = stage,
        name = localData.enemies.chars[n].name,
        point = localData.enemies.chars[n].basePoint,
        pointException = pointException,
        imgSheet = PanelImgSheet,
        imgSheetInfo = PanelImgSheetInfo
      })
      enemyPanel:moveTo(col * 155 , row * 70)
      panelTable[cnt] = enemyPanel
      if cnt%2 == 0 then
        col = 0
        row = row + 1
      else
        col = col + 1
      end
      cnt = cnt + 1
    end
  end

  -- Find possible # of panel first.
  -- Note that Enemy panel only can have panel up to 6
  for i=1, #localData.enemies.chars do
    total = total + 1
    if localData.enemies.chars[i].pointException ~= nil then
      total = total + 1
    end
  end

  -- Loop through data and create panel
  for i=1, #localData.enemies.chars do    
    -- If char has pointException then create two panels with & without pointExption data
    if localData.enemies.chars[i].pointException == nil then
      createEnemyPanel(i)
    else
      createEnemyPanel(i)
      createEnemyPanel(i, localData.enemies.chars[i].pointException)
    end
  end

  -- Build basePoint panel (global point with All other models text)
  if total > 6 then
    local basePointPanel = Panel:new({
      parent = stage,
      name = "basepoint",
      point = localData.enemies.basePoint,
      pointException = nil,
      imgSheet = PanelImgSheet,
      imgSheetInfo = PanelImgSheetInfo
    })
    basePointPanel:moveTo(col * 155 , row * 70)
    panelTable[cnt] = basePointPanel
  end
  self.stage = stage
end

function EnemyPanel:destroy()
  print("Destroy EnemyPanel Class")
  for i=1, #panelTable do
    panelTable[i]:destroy()
  end
  self = nil
end

return EnemyPanel