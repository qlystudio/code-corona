ButtonGroup = {}

function ButtonGroup:new(buttons, default_index)
	local button_group = display.newGroup()
	
	if buttons == nil then buttons = {} end
	button_group.buttons = buttons
	
	if default_index == nil then default_index = 1 end
	button_group.selected_index = default_index
	
	local function onSelected(event)
		local button = event.target
		
		for i=1, table.getn(button_group.buttons) do
			local cur_button = button_group.buttons[i]
			
			if cur_button == button then
				button.setSelected(true)
				button_group.selected_index = i
			else
				cur_button.setSelected(false)
			end
		end
		
		local e = {name="selectionChanged", value=button_group.selected_index}
		button_group:dispatchEvent(e)
	end
	
	for i=1, table.getn(button_group.buttons) do
		local button = button_group.buttons[i]
		button:addEventListener("onSelectedButton", onSelected)
		if i == button_group.selected_index then
			button.setSelected(true)
		end
	end
	
	function button_group.setIndex( value, should_dispatch )
		button_group.selected_index = value
		
		for i=1, table.getn(button_group.buttons) do
			local cur_button = button_group.buttons[i]
			
			if i == button_group.selected_index then
				cur_button.setSelected(true)
			else
				cur_button.setSelected(false)
			end
		end
		
		if should_dispatch ~= nil and should_dispatch == true then
			local e = {name="selectionChanged", value=button_group.selected_index}
			button_group:dispatchEvent(e)
		end
	end
	
	return button_group
end	

return ButtonGroup