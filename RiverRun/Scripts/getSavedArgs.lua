local path = system.pathForFile("multiTemp.txt", system.TemporaryDirectory)
local level, multiPlayMode, multiTempSIZE
function won_lost()
	local file = io.open(path,"r")
   print("-----------------------------------------------")
   print("The contents of the file multiTemp.txt is: \n\n")
   multiTempSIZE = 0
   for line in file:lines() do
      multiTempSIZE=multiTempSIZE+1
      if multiTempSIZE == 1 then
         level = line
      end
   
      if multiTempSIZE == 2 then
         multiPlayMode=line
      end
      
      print(line)
   end   
   print("\n\n")
   print("-----------------------------------------------")
   return {level, multiPlayMode, multiTempSIZE}
end 