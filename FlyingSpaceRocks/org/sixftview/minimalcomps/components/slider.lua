Slider = {}

function Slider:new(orientation, xpos, ypos)
	local group = require("org.sixftview.minimalcomps.components.component"):new(
							xpos, ypos)
	
	local _orientation = orientation
	local _max = 100
	local _min = 0
	local _tick = 0.1
	local _value = 0
	local _width = 150
	local _height = 20
	local _value = 0
	
	local _back
	local _handle
	local positionHandle
	
	local function onDrag(event)
		
		local t = event.target
        local phase = event.phase
        if "began" == phase then
                -- Make target the top-most object
                local parent = t.parent
                parent:insert( t )
                display.getCurrentStage():setFocus( t )

                t.isFocus = true

                -- Store initial position
                t.x0 = event.x - t.x
                t.y0 = event.y - t.y
        elseif t.isFocus then
                if "moved" == phase then

                    t.x = event.x - t.x0

					if t.x < 0 then t.x = 0 end
					if t.x > _width - t.width then t.x = _width - (t.width + 2) end
                    --t.y = event.y - t.y0

					local oldvalue = _value
					if _orientation == "horizontal" then
						_value = _handle.x / (_width - _height) * 
										(_max - _min) + _min
					else
						_value = (_height - _width - _handle.y) / 
								(height - _width) * (_max - _min) + _min
					end

					if _value ~= oldvalue then
						_value = math.floor(_value / _tick) * _tick
						
						local e = {name="change", value=_value, target=group}
						group:dispatchEvent(e)
					end
                elseif "ended" == phase or "cancelled" == phase then
                        display.getCurrentStage():setFocus( nil )
                        t.isFocus = false
                end
        end
        return true
	end
	
	local function drawBack()
		if _back ~= nil then _back:removeSelf() end
		_back = display.newRect(group, 0, 0, _width, _height )
		_back:setReferencePoint(display.TopLeftReferencePoint)
		_back.x, _back.y = 0, 0
		_back:setFillColor(255,255,255)
		_back.strokeWidth = 1
		_back:setStrokeColor(102, 102, 102)
	end
	
	local function drawHandle()
		if _handle ~= nil then 
			
			_handle:removeSelf() 
		end
		_handle = display.newRect(group, 1, 1, _height-2, _height-3 )
		_handle:setReferencePoint(display.TopLeftReferencePoint)
		_handle.x, _handle.y = 1, 1
		_handle:setFillColor(169, 169, 169)
		_handle:addEventListener("touch", onDrag)
	end
	
	positionHandle = function()
		local range = 0
		if _orientation == "horizontal" then
			range = _width - _height
			_handle.x = (_value - _min) / (_max - _min) * range
		else
			range = _height - _width
			_handle.y = _height - _width - (_value - _min) / (_max - _min) * range
		end
	end
	
	 function group.draw()
		drawBack()
		drawHandle()
		positionHandle()
	end
	
	function group:setSliderParams(min, max, value)
		_min = min
		_max = max
		_value = value
		group.draw()
	end
	
	function group:setWidth(value)
		_width = value
		group.draw()
	end
	
	function group:setHeight(value)
		_height = value
		group.draw()
	end
	
	group.draw()
	return group
end

return Slider