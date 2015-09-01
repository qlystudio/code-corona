--[[
  This is custom slideController.
  Heavily modified by Click 3x, Aug 2014
  Source code Credit - Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.
]]

require "com.vfiles.core.Class"
local SimpleButton = require "com.vfiles.objects.buttons.SimpleButton"
local SlideController = Class()
local _W, _H = display.contentWidth, display.contentHeight


function SlideController:initialize(_)

  local screenW, screenH, viewableScreenW, viewableScreenH
  local imgNum, lastImgNum = nil, nil
  local images, classes = nil, nil
  local touchListener, nextImage, prevImage, cancelMove
  local g, bg, imgGroup, pagn, navPrev, navNext, dotColor, pad
  local audioSwipe = audio.loadSound( "assets/audios/swipe.wav" )

  screenW, screenH = _.screenW, _.screenH
  viewableScreenW, viewableScreenH = _.viewableScreenW, _.viewableScreenH

  pad = _.padding -- padding in-between images
  g = display.newContainer(_.parent, viewableScreenW, viewableScreenH)
  g.anchorChildren, g.anchorX, g.anchorY = false, 0, 0
    
  bg = display.newRect(g, 0, 0, viewableScreenW, viewableScreenH )
  bg.anchorX = 0
  bg.anchorY = 0  
  bg.isHitTestable = true

  if _.bgColor then
    bg:setFillColor( _.bgColor[1], _.bgColor[2], _.bgColor[3], _.bgColor[4] or 1 )
  else
    bg.isVisible = false
  end


  imgGroup = display.newGroup()
  g:insert(imgGroup)

  if _.pagination then
    pagn = display.newGroup()
    dotColor = {
      off = {.561, .553, .545},
      on  = {1, 1, 0}
    }
    g:insert(pagn)
  end

  if _.arrow then

  function sliderBtnTapEvent(e)
    if e.target.name == "forward" then
      local maxFillPerScreen = math.floor(math.abs((g.width-pad)/screenW - 1))
      if imgNum < #images-maxFillPerScreen then
      nextImage()
      end
    elseif e.target.name =="back" and imgNum > 1 then
      prevImage()
    end
  end


    -- Add slider back button
    navPrev = SimpleButton:new({
      parent = _.parent,
      icon = {path = "assets/images/ui/global/ico-back-arrow.png", width = 15, height = 22},
      name = "back",
      left = 0,
      top = 0,
      width = 38,
      height = 35,    
      color = {default= {1,1,1,0}, over = {1,1,1,0}},
      fontColor = {default= {1,1,1,.6}, over = {1,1,0}},
      onEvent = sliderBtnTapEvent,
    })

    -- Add slider back button
    navNext = SimpleButton:new({
      parent = _.parent,
      icon = {path = "assets/images/ui/global/ico-forward-arrow.png", width = 15, height = 22},
      name = "forward",
      left = 0,
      top = 0,
      width = 38,
      height = 35,    
      color = {default= {1,1,1,0}, over = {1,1,1,0}},
      fontColor = {default= {1,1,1,.6}, over = {1,1,0}},
      onEvent = sliderBtnTapEvent
    })

  end
  
  images, classes = {}, {}
  for i = 1,#_.imageSet do
    local c = _.imageSet[i]
    local p = c:render()
    local h = viewableScreenH
    if p.width > viewableScreenW or p.height > h then
      if p.width/viewableScreenW > p.height/h then 
          p.xScale = viewableScreenW/p.width
          p.yScale = viewableScreenW/p.width
      else
          p.xScale = h/p.height
          p.yScale = h/p.height
      end    
    end

    p.anchorX, p.anchorY = 0, 0
    imgGroup:insert(p)
    
    if (i > 1) then
      p.x = (screenW + pad) * (i-1) -- all images offscreen except the first one      
    end
    classes[i] = c
    images[i] = p

    p.slider = bg
    p.ox = p.x
    p.oy = p.y

    -- add dot to pagination container(pagn)
    if pagn then
      local dot = display.newCircle(pagn, (i-1)*14 , 0, 4)
      dot:setFillColor( dotColor.off[1], dotColor.off[2], dotColor.off[3] )
      dot.anchorX, dot.anchorY = 0, 0
    end
  end

  if pagn then pagn.x, pagn.y = viewableScreenW/2 - pagn.width/2, viewableScreenH - pagn.height - 12 end

  imgNum = 1
  g.x = 0
  g.y = display.screenOriginY
  
  function touchListener (self, touch) 
    local phase = touch.phase
    if ( phase == "began" ) then
      -- Subsequent touch events will target button even if they are outside the contentBounds of button
      display.getCurrentStage():setFocus( self )
      self.isFocus = true
      startPos = touch.x
      prevPos = touch.x

    elseif( self.isFocus ) then
        
      if ( phase == "moved" ) then
        if tween then transition.cancel(tween) end
          
        local delta = touch.x - prevPos
        prevPos = touch.x
        imgGroup.x = imgGroup.x + delta        

      elseif ( phase == "ended" or phase == "cancelled" ) then
        
        dragDistance = touch.x - startPos
        -- print("dragDistance: " .. dragDistance)
        lastImgNum = imgNum
        maxFillPerScreen = math.floor(math.abs((g.width-pad)/screenW - 1))
        if (dragDistance < -40 and imgNum < #images-maxFillPerScreen) then
          nextImage()
        elseif (dragDistance > 40 and imgNum > 1) then
          prevImage()
        else
          cancelMove()
        end
                  
        if ( phase == "cancelled" ) then    
          cancelMove()
        end
          -- Allow touch events to be sent normally to the objects they "hit"
          display.getCurrentStage():setFocus( nil )
          self.isFocus = false                            
      end
    end
          
    return true
  
  end
  
  function setSlideNumber(self)
    --[[
      This funciton will update the dot color by current image number
      and also call play/stop function in slide if available
    ]]
    if lastImgNum ~=nil then
      if self.pagn then self.pagn[lastImgNum]:setFillColor( dotColor.off[1], dotColor.off[2], dotColor.off[3] ) end
      if classes[lastImgNum].hasAnimation then
        print("Stop slide aninmation at " .. lastImgNum)
        classes[lastImgNum]:stop()
      end      
    end
    if self.pagn then self.pagn[imgNum]:setFillColor( dotColor.on[1], dotColor.on[2], dotColor.on[3] ) end


    if self.navPrev and self.navNext then
      if self.imgNum == 1 then self.navPrev:setVisible(false)
      else self.navPrev:setVisible(true) end

      maxFillPerScreen = math.floor(math.abs((self.g.width-pad)/self.screenW - 1))
      if self.imgNum >= #self.images-maxFillPerScreen then self.navNext:setVisible(false)
      else self.navNext:setVisible(true) end

    end

    if classes[imgNum].hasAnimation then
      print("Play slide aninmation at " .. imgNum)
      classes[imgNum]:play()
    end
  end
  
  function cancelTween()
    if prevTween then 
      transition.cancel(prevTween)
    end
    prevTween = tween 
  end
  
  function nextImage()
    local dx = (screenW + pad) * -imgNum
    tween = transition.to( imgGroup, {time=400, x= dx, transition=easing.outExpo } )
    imgNum = imgNum + 1
    self.imgNum = imgNum
    setSlideNumber(self)
    -- Play swipe sound
    if gameData:get("sfx") then audio.play( self.audioSwipe ) end
  end
  
  function prevImage()
    local dx = (screenW + pad) * -(imgNum-2)
    tween = transition.to( imgGroup, {time=400, x= dx, transition=easing.outExpo } )
    imgNum = imgNum - 1
    self.imgNum = imgNum
    setSlideNumber(self)
    -- Play swipe sound
    if gameData:get("sfx") then audio.play( self.audioSwipe ) end
  end
  
  function cancelMove()
    local dx = (screenW + pad) * -(imgNum-1)
    tween = transition.to( imgGroup, {time=400, x= dx, transition=easing.outExpo } )
  end

  bg.touch = touchListener
  bg:addEventListener( "touch", bg )
  self.g = g
  self.classes = classes
  self.bg = bg
  self.pagn = pagn
  self.images = images
  self.navPrev = navPrev
  self.navNext = navNext
  self.pad = pad
  self.screenW = screenW
  self.screenH = screenH
  self.imgNum = imgNum
  self.width, self.height = _.viewableScreenW, _.viewableScreenH
  self.audioSwipe = audioSwipe
  setSlideNumber(self)
end

function SlideController:moveTo(x,y)
  self.g.x, self.g.y = x, y
end

function SlideController:scaleTo(n)
  self.g.xScale, self.g.yScale = n, n
end

function SlideController:changeViewableScreenWidth(n)
  _W, _H = display.contentWidth, display.contentHeight
  self.g.width = n
  self.width, self.height = self.g.width, self.g.height
  if self.navPrev and self.navNext then
    self.navPrev:moveTo(0, _H/2 - self.navPrev.height/2)
    self.navNext:moveTo(_W - self.navNext.width, _H/2 - self.navNext.height/2)

    maxFillPerScreen = math.floor(math.abs((self.g.width-self.pad)/self.screenW - 1))
    if self.imgNum >= #self.images-maxFillPerScreen then self.navNext:setVisible(false)
    else self.navNext:setVisible(true) end

  end
end

function SlideController:destroy()
  print("destroy SlideController")
  for i =1, #self.classes do
    self.classes[i]:destroy()
  end

  if self.pagn then
    for i=1, self.pagn.numChildren do
      self.pagn[1]:removeSelf()
      self.pagn[1] = nil
    end
    self.pagn:removeSelf()
  end

  audio.dispose( self.audioSwipe )
  self.audioSwipe = nil

  self.pagn = nil
  self.bg:removeSelf()
  self.images = nil
  self.classes = nil
  self.bg = nil  
  self.g = nil
  self = nil
end

return SlideController