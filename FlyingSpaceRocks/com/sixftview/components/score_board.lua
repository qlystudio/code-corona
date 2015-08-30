
ScoreBoard = {}


function ScoreBoard:new()
	local score_board = display.newGroup()
	local txt_score
	local txt_totalscore
	local score = 0
	
	local background = display.newRect(0,0,display.contentWidth,100)
	background:setFillColor(0,0,0,0)
	score_board:insert(background)
	
	local txt_level = display.newText("level :", 0, 0, app_data.font_Robofan, 30)
	txt_level:setTextColor( 64, 0, 255 )
	txt_level:setReferencePoint( display.TopLeftReferencePoint )
	txt_level.x = 20
	txt_level.y = 10
	txt_level.alpha = 0
	score_board:insert(txt_level)
	
	txt_score = display.newText("", 0, 0, app_data.font_Robofan, 30)
	txt_score:setTextColor( 64, 0, 255 )
	txt_score:setReferencePoint( display.TopLeftReferencePoint )
	txt_score.y = 10
	score_board:insert(txt_score)
	
	local txt_total = display.newText("total :", 0, 0, app_data.font_Robofan, 30)
	txt_total:setTextColor(92, 84, 255)
	txt_total:setReferencePoint( display.TopLeftReferencePoint )
	txt_total.x = 25
	txt_total.y = 40
	txt_total.alpha = 0
	score_board:insert(txt_total)
	
	txt_totalscore = display.newText("", 0, 0, app_data.font_Robofan, 30)
	txt_totalscore:setTextColor(92, 84, 255)
	txt_totalscore:setReferencePoint( display.TopLeftReferencePoint )
	txt_totalscore.y = 40
	score_board:insert(txt_totalscore)
	
	local function saveScore(value)
		local level = {level=app_data:getCurrentLevel(), score=value}
		local e = {name="saveLevelScore", value=level}
		score_board:dispatchEvent(e)
	end
	
	function score_board:setScore(value)
		score = score + value
		txt_score.text = tostring(score)
		txt_score:setReferencePoint(display.TopLeftReferencePoint);
		txt_score.x = 120
		txt_score.y = 10
		if score % 25000 == 0 then
			local e = {name="playerUp", value=1}
			score_board:dispatchEvent(e)
		end
		saveScore(score)
		
		if txt_level.alpha == 0 then
			txt_level.alpha = 1
		end
	end
	
	function score_board:setTotalScore(value)
		txt_totalscore.text = value
		txt_totalscore:setReferencePoint( display.TopLeftReferencePoint )
		txt_totalscore.x = txt_total.x + (txt_total.width + 10)
		txt_totalscore.y = 40
		if txt_total.alpha == 0 then
			txt_total.alpha = 1 
		end
	end
	
	return score_board
end

return ScoreBoard