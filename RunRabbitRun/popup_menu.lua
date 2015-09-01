module(..., package.seeall)
new = function ( params )
	local localGroup = display.newGroup()

	local function resume_bt(event)
		if event.phase == "ended" then
			pcall( package.loaded["play"].resume_game, {} )
			director.closePopUp()
		end
	end

	local function restart_bt(event)
		if event.phase == "ended" then
			pcall( package.loaded["play"].restart_game, {} )
			director.closePopUp()
		end
	end

	local function exit_bt(event)
		if event.phase == "ended" then
			pcall( package.loaded["play"].to_main_menu, {} )
			director.closePopUp()
		end
	end

	local initVars = function ()
		local background = display.newImage( "media/play/menu/bg.png" )
		localGroup:insert( background )
		background.x, background.y = display.contentWidth/2, display.contentHeight/2

		local resume_btn = ui.newButton{
			default = "media/play/menu/b_resume.png",
			over = "media/play/menu/b_resume.png",
			onRelease = resume_bt,
			text = "",
			emboss = true
		}
		resume_btn.x, resume_btn.y = display.contentWidth/2, display.contentHeight/2 - 40
		localGroup:insert(resume_btn)
		
--		print_r(package.loaded)

		local restart_btn = ui.newButton{
			default = "media/play/menu/b_restart.png",
			over = "media/play/menu/b_restart.png",
			onRelease = restart_bt,
			text = "",
			emboss = true
		}
		restart_btn.x, restart_btn.y = display.contentWidth/2, display.contentHeight/2
		localGroup:insert(restart_btn)

		local exit_btn = ui.newButton{
			default = "media/play/menu/b_menu.png",
			over = "media/play/menu/b_menu.png",
			onRelease = exit_bt,
			text = "",
			emboss = true
		}
		exit_btn.x, exit_btn.y = display.contentWidth/2, display.contentHeight/2 + 40
		localGroup:insert(exit_btn)

	end	
	
	
	initVars()
	return localGroup
end