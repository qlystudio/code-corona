-- WEAPON FILE FOR MODULE MAKING
module(..., package.seeall);

function new(params)
	
	local cellBtnRect = display.newGroup();
	cellBtnRect.contentWidth = 144;
	cellBtnRect.contentHeight = 144;

	local rect = display.newRect(0,0,144, 144);
	rect:setFillColor( 255, 255, 255, 0)
	rect.strokeWidth = 3; rect:setStrokeColor( 255, 242, 0 );

	cellBtnRect:insert( rect )
	

	local img, w, h, r, offset, padding
	img = "images/items/cell.png"
	w=53;
	h=122;
	offset = 0;
	padding = 40;

	if(params) then
		print("We have params")
		if(params.type == "cigs") then
			img = "images/items/cigs.png"
			w=61; h=119; r=45;
			offset = 144 + padding;

		elseif(params.type == "cell") then
			img = "images/items/cell.png"
			w=53; h=122; r=45;
			offset = 0;

		elseif(params.type == "bag") then
			img = "images/items/bag.png"
			w=98; h=120; r=0;
			offset = 144*2 + padding * 2;

		elseif(params.type == "shoe") then
			img = "images/items/shoe.png"
			w=75; h=119; r=0;
			offset = -144 + -padding;

		elseif(params.type == "bottle-water") then
			img = "images/items/bottle-water.png"
			w=38; h=121; r=0;
			offset = -144*2 + -padding * 2;

		elseif(params.type == "umbrella") then
			img = "images/items/umbrella.png"
			w=20; h=121; r=45;
			offset = -144*3 + -padding * 3;

		end
	end

	local weaponItem = display.newImageRect(img, w, h);
	weaponItem.rotation = r; 
	cellBtnRect:insert(weaponItem)
	cellBtnRect.x = _W/2 + offset + 144/2;
	cellBtnRect.y = _H - 144;
	-- cellBtnRect.rotation = r; 

	function callBtnRect(e)
		if(e.phase == "ended") then
			print("you have touched a weaponItem")
			if(params.type) then
				print(params.type)
			end
		end
	end

	-- TRYING TO ATTACH TOUCH EVENT TO SQUARES INSTEAD OF PICS
	cellBtnRect:addEventListener( "touch", callBtnRect )

	return cellBtnRect;
end