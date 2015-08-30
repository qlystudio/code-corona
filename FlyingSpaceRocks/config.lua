if system.getInfo("model") == "iPad" then
	application =
	{
		content =
		{
			fps = 60, 
			width=768,
			height=1024,
			scale="zoomEvent",
			xAlign="center",
			yAlign="middle",
			antialias = true
		},
	
	}
elseif system.getInfo("model") == "iPhone" then
	application =
	{
		content =
		{
			fps = 60, 
			width=640,
			height=960,
			scale="zoomEvent",
			xAlign="center",
			yAlign="middle",
			antialias = true
		},
	
	}
	
elseif system.getInfo("model") == "Kindle Fire" then
	application =
	{
		content =
		{
			fps = 60, 
			width=580,
			height=1024,
			scale="zoomEvent",
			xAlign="center",
			yAlign="middle",
			antialias = true,
		},
	
	}
	
elseif system.getInfo("model") == "Nook Color" or system.getInfo("model") == "Nook Tablet" then
	application =
	{
		content =
		{
			fps = 60, 
			width=600,
			height=1024,
			scale="zoomEvent",
			xAlign="center",
			yAlign="middle",
			antialias = true
		},

	}
end
