-------------------------------------------------------------------------
--T and G Apps Ltd.
--Created by Jamie Trinder
--www.tandgapps.co.uk

--CoronaSDK version 2013.1179 was used for this template.

--You are not allowed to publish this template to the Appstore as it is. 
--You need to work on it, improve it and replace the graphics. 

--For questions and/or bugs found, please contact me using our contact
--form on http://www.tandgapps.co.uk/contact-us/
-------------------------------------------------------------------------


--This file controls the difficulty of each level. E.g. easy, medium and hard
--You can edit the values here for them to take effect in the game.


--Table to hold it all
local M = {}



--Special Drag game
M["drag"] = {
	-----
	{
		question="23+27",  --The question.
		answers={"50", "52", "53", "55", "59"},  --Array of possible answers for the question. Only go to up to 5!
		answer=1   --Which one from the above array is the correct answer.
	},
	-----
	{
		question="3+17+123",  
		answers={"143", "144", "153", "155", "159"}, 
		answer=1  
	},
	-----
	{
		question="1+2+3+4+5+6+7+8+9",  
		answers={"42", "43", "44", "45", "46"}, 
		answer=4  
	},
	-----
	{
		question="1554+2423",  
		answers={"3877", "3967", "3977", "4007", "4017"}, 
		answer=3  
	},
	-----
	{
		question="89+89",  
		answers={"177", "178", "179", "188", "189"}, 
		answer=2  
	},
}




--OTHERS
--Start off with the "add" questions.
M["add"] = {
	-----
	{
		question="23+27",  --The question.
		answers={"50", "52", "53", "55", "59"},  --Array of possible answers for the question. Only go to up to 5!
		answer=1   --Which one from the above array is the correct answer.
	},
	-----
	{
		question="3+17+123",  
		answers={"143", "144", "153", "155", "159"}, 
		answer=1  
	},
	-----
	{
		question="1+2+3+4+5+6+7+8+9",  
		answers={"42", "43", "44", "45", "46"}, 
		answer=4  
	},
	-----
	{
		question="1554+2423",  
		answers={"3877", "3967", "3977", "4007", "4017"}, 
		answer=3  
	},
	-----
	{
		question="89+89",  
		answers={"177", "178", "179", "188", "189"}, 
		answer=2  
	},
}




--Now the minus questions.
M["minus"] = {
	-----
	{
		question="11-23",  --The question.
		answers={"-12", "-13", "-14", "-15", "-16"},  --Array of possible answers for the question. Only go to up to 5!
		answer=1   --Which one from the above array is the correct answer.
	},
	-----
	{
		question="80-80-80",  
		answers={"80", "0", "-80", "-160"}, 
		answer=3  
	},
	-----
	{
		question="56-32",  
		answers={"14", "15", "18", "24", "25"}, 
		answer=4  
	},
	-----
	{
		question="63-17",  
		answers={"45", "46", "47", "48", "49"}, 
		answer=2  
	},
	-----
	{
		question="2456-27877",  
		answers={"-24,151", "-25,221", "-25,287", "-25,324", "-25,421"}, 
		answer=5  
	},
}




--Now the times questions.
M["times"] = {
	-----
	{
		question="3x5",  --The question.
		answers={"15", "16", "18", "20"},  --Array of possible answers for the question. Only go to up to 5!
		answer=1   --Which one from the above array is the correct answer.
	},
	-----
	{
		question="10x10",  
		answers={"80", "100", "110", "1000"}, 
		answer=2  
	},
	-----
	{
		question="9x9",  
		answers={"63", "72", "81", "90", "99"}, 
		answer=3  
	},
	-----
	{
		question="40x11",  
		answers={"300", "340", "400", "440", "444"}, 
		answer=4  
	},
	-----
	{
		question="7x3",  
		answers={"17", "18", "19", "20", "21"}, 
		answer=5  
	},
}




--Now the divide questions.
M["divide"] = {
	-----
	{
		question="15/3",  --The question.
		answers={"5", "6", "7", "8"},  --Array of possible answers for the question. Only go to up to 5!
		answer=1   --Which one from the above array is the correct answer.
	},
	-----
	{
		question="100/10",  
		answers={"100", "10", "11", "20"}, 
		answer=2  
	},
	-----
	{
		question="56/8",  
		answers={"5", "6", "7", "8", "9"}, 
		answer=3  
	},
	-----
	{
		question="56/100",  
		answers={"0.50", "0.52", "0.54", "0.56", "0.58"}, 
		answer=4  
	},
	-----
	{
		question="194/2",  
		answers={"80", "82", "90", "95", "97"}, 
		answer=5  
	},
}






--Return it all
return M


