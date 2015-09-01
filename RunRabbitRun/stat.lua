module(..., package.seeall)
new = function ( params )
--	local score = tonumber(settings.game.best_score)
	local distance = params.distance
	local carrots = params.carrots

	local localGroup = display.newGroup()
	local initVars = function ()
		local networkListener = function( event )
		        if ( event.isError ) then
		                print( "Network error!")
						print_r(event)
		        else
	                local data = Json.Decode(event.response)
					local function print_entry(e, pos_y, id)
						local lbl_pos = display.newText( id..".", 30, 110+tonumber(pos_y)*16, native.systemFontBold, 14 )
						localGroup:insert(lbl_pos)
						lbl_pos:setTextColor(255,255,255)

						local lbl_name = display.newText( e.name, 55, 110+tonumber(pos_y)*16, native.systemFontBold, 14 )
						localGroup:insert(lbl_name)
						local lbl_score = display.newText( e.score, 350, 110+tonumber(pos_y)*16, native.systemFontBold, 14 )
						localGroup:insert(lbl_score)
						local lbl_carrots = display.newText( e.carrots, 250, 110+tonumber(pos_y)*16, native.systemFontBold, 14 )
						localGroup:insert(lbl_carrots)
						lbl_name.x, lbl_carrots.x, lbl_score.x = 122, 245, 365
						if id==data.pos then
							lbl_name:setTextColor(0,200,0)
							lbl_score:setTextColor(0,200,0)
							lbl_carrots:setTextColor(0,200,0)
						else
							lbl_name:setTextColor(255,255,255)
							lbl_score:setTextColor(255,255,255)
							lbl_carrots:setTextColor(255,255,255)
						end
					end
					for _,e in pairs(data.top) do
						if e.id<=10 then
							print_entry(e, e.id, e.id)
						end
					end
					--[[
					if data.pos>10 then
						local i = 1
						for _,e in pairs(data.player) do
							print_entry(e, 10+i, e.id)
							i = i+1
						end
					end
					]]
		        end
		end

		local params = {
			player_id = settings.game.player_id,
			player_name = settings.game.player_name,
			score = distance,
			carrots = carrots,
			info_name = system.getInfo("name"),
			info_mode = system.getInfo("mode"),
			info_deviceID = system.getInfo("deviceID"),
			info_environment = system.getInfo("environment"),
			info_simulator = system.getInfo("simulator"),
			info_device = system.getInfo("device"),
			info_platformName = system.getInfo("platformName"),
			info_platformVersion = system.getInfo("platformVersion"),
			info_version = system.getInfo("version"),
			info_build = system.getInfo("build"),
		}
		local p = {body=""}
		local i = 1
		for k,v in pairs(params) do
			p.body = p.body..k.."="..url_encode(v)
			if i~=table.count(params) then
				p.body = p.body.."&"
			end
			i = i+1
		end
		network.request( "http://run_rabbit_run.aabweber.com/stat.php", "POST", networkListener, p )
--		timer.performWithDelay(100, function() director:changeScene("play") end)
		local chsc
		chsc = function(event)
			if event.phase=="ended" then
				Runtime:removeEventListener("touch", chsc)
				director:changeScene("play")
			end
		end
		Runtime:addEventListener("touch", chsc)

		local background = display.newImage( "media/menu/bg.png" )
		localGroup:insert( background )
		background.x, background.y = display.contentWidth/2, display.contentHeight/2

		local background2 = display.newImage( "media/play/menu/highscores_bg.png" )
		localGroup:insert( background2 )
		background2.x, background2.y = display.contentWidth/2, display.contentHeight/2+20
	end	
	
	
	initVars()
	return localGroup
end