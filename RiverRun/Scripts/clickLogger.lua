local startTime = os.time()
local isKiosk = false
local levelChoice = 1
local playerChoice = "solo"
local choice
local path = system.pathForFile("clickLog.txt", system.TemporaryDirectory)
local path2 = system.pathForFile("clickLog2.txt", system.TemporaryDirectory)  

function logClicks(self, event)
	local file = io.open(path,"a")
	file:write(self.x.." "..self.y.." "..os.time()+3-startTime.."\n")
	io.close(file)
end

function logClicks2(self, event)
	local file = io.open(path2,"a")
	file:write(self.x.." "..self.y.." "..os.time()-startTime.."\n")
	io.close(file)
end

function getTime()
	return startTime
end

function setTime()
	startTime = os.time()
end

function getKioskMode()
	return isKiosk
end

function startKioskMode()
	isKiosk = true
end

function endKioskMode()
	isKiosk = false
end

function selectChoice()
	if(levelChoice == 1 and playerChoice == "solo") then
		playerChoice = "multi"
		choice = 1
		return choice
	elseif(levelChoice == 1 and playerChoice == "multi") then
		levelChoice = 2
		playerChoice = "solo"
		choice = 2
		return choice
	elseif(levelChoice == 2 and playerChoice == "solo") then
		playerChoice = "multi"
		choice = 3
		return choice
	else
		levelChoice = 1
		playerChoice = "solo"
		choice = 4
		return choice
	end
end

function getChoice()
	return choice
end
