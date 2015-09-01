require "com.vfiles.core.Class"

Armory = Class()

local stage, stagePadding, btnW, btnH, btnGap = nil, 12, 48, 48, 8
local toggleBtn, btnContainer


local currBtn
local btns = {}
local enabled = true
local expended = false

-- Size of each button is 48 x 48 in standard definition

--------------------------------------------------
-- Private workers & Listeners
--------------------------------------------------
local function expandBtns()
  expended = true
  btnContainer.isVisible = expended
  toggleArrow.isVisible = false
end

local function collapseBtns()
  expended = false
  btnContainer.isVisible = expended
  toggleArrow.isVisible = true
end


local function updateToggleBtn(nm, ammo)
  toggleBtn.sprite:setSequence(nm)
  toggleBtn.label.text = ammo
end


local function toggleBtnTapListener(e)
  if enabled then
    if expended then
      collapseBtns()
    else
      expandBtns()
    end
  end
end

local function weaponBtnTapListener(e)
  if enabled then
    if e.target ~= currBtn then
      currBtn.sprite:setSequence('off')
      e.target.sprite:setSequence('on')
      currBtn = e.target
      scene:dispatchEvent( {name = "weaponChangeEvent", target = currBtn.name} )
    end    
    -- collapseBtns()
    updateToggleBtn(currBtn.name, currBtn.label.text)
  end
end

local function build(prop, ammo, spriteSheet, spriteSheetInfo)  

  local baseY = -btnH - stagePadding
  local toggleBtnSeqData = {}
  local toggleBtnSprite, toggleBtnLabel

  -- Create weapon buttons container
  btnContainer = display.newContainer( stage, btnW, (btnH + btnGap) * #prop -btnGap)  
  btnContainer.anchorChildren, btnContainer.anchorX, btnContainer.anchorY, btnContainer.y = false, 0, 0, baseY - btnContainer.height - btnGap
  
  -- TEMP BG
  -- temp = display.newRect(btnContainer, 0, 0, btnContainer.width, btnContainer.height )
  -- temp.anchorX, temp.anchorY = 0,0
  -- temp:setFillColor( 0,1,0, .5)


  -- Create weapon buttons
  for i=1, #prop do
    -- Create sequence data
    local nm = prop[i].name
    local seqData = {
      {name='off', frames= { spriteSheetInfo:getFrameIndex('armory-' .. nm)} },
      {name='on', frames= { spriteSheetInfo:getFrameIndex('armory-' .. nm .. '-on')} }
    }
    
    local btn = display.newContainer(btnContainer, btnW, btnH)
    local btnSprite = display.newSprite(btn, spriteSheet, seqData)
    local btnLabel = display.newText(
      { parent=btn, text = (ammo[nm] == -1) and "" or ammo[nm], 
        x = 24, 
        y = 30, 
        width = 20,
        align = "right",        
        font = native.systemFont,
        fontSize=12
      })
  
    btn.name = nm
    btn.sprite = btnSprite
    btn.label = btnLabel
    btn.anchorChildren, btn.anchorX, btn.anchorY, btn.y = false, 0, 0, (i-1) * (btnH + btnGap)
    btnSprite.anchorX, btnSprite.anchorY = 0,0
    btnLabel.anchorX, btnLabel.anchorY = 0,0
    btn:addEventListener( 'tap', weaponBtnTapListener)

    if i == 1 then
      btnSprite:setSequence('on')
      currBtn = btn
    end

    -- Populdate btns table
    btns[nm] = btn

    -- While looping we also define sequence data for toggle button. (only need on state defined by button name)
    toggleBtnSeqData[i] = {name = nm, frames= { spriteSheetInfo:getFrameIndex('armory-' .. nm .. '-selected')} }
  end
  -- loop end


  -- Create toggle button (bottom)
  toggleBtn = display.newContainer(stage, btnW, btnH)
  toggleBtnSprite = display.newSprite(toggleBtn, spriteSheet, toggleBtnSeqData)
  toggleBtnLabel = display.newText(
    { parent = toggleBtn, 
      text = (ammo[currBtn.name] == -1) and "" or ammo[currBtn.name], 
      x = 24, 
      y = 30, 
      width = 20,
      align = "right",
      font = native.systemFont,
      fontSize = 12
    })

  toggleArrow = display.newSprite(stage, spriteSheet, {name = "arrow", frames = { spriteSheetInfo:getFrameIndex('arrow')} } )
  toggleArrow.anchorX, toggleArrow.anchorY, toggleArrow.x, toggleArrow.y = 0, 0, 16, -72

  toggleBtn.anchorChildren, toggleBtn.anchorX, toggleBtn.anchorY, toggleBtn.y = false, 0, 0, baseY
  toggleBtn:addEventListener( "tap", toggleBtnTapListener )
  toggleBtnLabel:setFillColor( 0,0,0 )
  toggleBtnSprite.anchorX, toggleBtnSprite.anchorY = 0, 0
  toggleBtnLabel.anchorX, toggleBtnLabel.anchorY = 0, 0
  toggleBtn.sprite = toggleBtnSprite
  toggleBtn.label = toggleBtnLabel


  collapseBtns()
end

--------------------------------------------------
-- Public workers
--------------------------------------------------
function Armory:getSelectedWeapon()
  return currBtn.name
end


--------------------------------------------------
-- Constructor
--------------------------------------------------
function Armory:initialize(config)
  -- Prop list (key is item name w/ lowercase )
  -- [1] bag
  -- [2] umbrella
  -- [3] cellphone
  -- [4] stiletto (high hill)
  -- [5] bottle (water)
  -- [6] cigarettes

  stage = display.newGroup()
  config.parent:insert(stage)
  build(config.prop, config.ammo, config.spriteSheet, config.spriteSheetInfo)

  -- Reposition stage
  stage.x = display.contentWidth - btnW - stagePadding
  stage.y = display.contentHeight
  self:enable()

  -- Start with expend state
  expandBtns()

end

function Armory:disable()
  enabled = false
end

function Armory:enable()
  enabled = true
end

function Armory:updateAmmo(btn)
  btns[btn.name].label.text = (btn.ammo == -1) and "" or btn.ammo
  toggleBtn.label.text = (btn.ammo == -1) and "" or btn.ammo
end

function Armory:collapse()
  if expended then collapseBtns() end
end

function Armory:reposition(isPortrait)
  stage.x = display.contentWidth - btnW- stagePadding
  stage.y = display.contentHeight
end

function Armory:destroy()
  print("--X-- Armory")
  for i=1, #btns do
    btns[1].sprite:removeSelf()
    btns[1].sprite = nil
    btns[1]:removeSelf()
    btns[1]= nil
  end
  toggleBtn:removeSelf()
  toggleArrow:removeSelf()
  toggleBtn = nil
  toggleArrow = nil
  self = nil
end