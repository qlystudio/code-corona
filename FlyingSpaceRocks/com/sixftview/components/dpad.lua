
Dpad = {}



--[[ local function onTouch( dpad, event)
	
	if(event.phase == "moved") then
		local a1 = event.y - dpad.y
		local b1 = event.x - dpad.x
		local radians1 = math.atan2(a1, b1)
		local degrees1 = radians1 / (math.pi / 180)
		
		dpad.rotation = degrees1
		local event = { name="onDPadRotation", rotation=dpad.rotation }
		dpad:dispatchEvent( event )
	end
end --]]


function Dpad:new()
	
	local joystickClass = require "com.vendor.joystick"
	
 	local function printOutput( event )
		if(event.joyX ~= false) then
			local e = {name="onDPad", joyTable={joyX=event.joyX, joyY=event.joyY, 
				joyAngle=event.joyAngle, joyVector=event.joyVector} }
			
			dpad:dispatchEvent(e)
		end
		--
	end

	-- Add A New Joystick
	dpad = joystickClass.newJoystick{
		outerImage = "joystickOuter.png",		-- Outer Image - Circular - Leave Empty For Default Vector
		outerAlpha = 0.8,						-- Outer Alpha ( 0 - 1 )
		innerImage = "joystickInner.png",		-- Inner Image - Circular - Leave Empty For Default Vector
		innerAlpha = 0.8,						-- Inner Alpha ( 0 - 1 )
		position_x = 25,						-- X Position Top - From Left Of Screen - Positions Outer Image
		position_y = 335,						-- Y Position - From Left Of Screen - Positions Outer Image
		onMove = printOutput					-- Move Event
	}
	
	return dpad
end

return Dpad