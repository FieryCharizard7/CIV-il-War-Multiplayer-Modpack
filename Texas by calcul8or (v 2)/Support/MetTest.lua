-- MetTest
-- Author: calcul8or
-- DateCreated: 2/21/2016 6:39:34 AM
--------------------------------------------------------------
function MetTest(playerID)
	local pPlayer    = Players[playerID]
	local playerTeam = Teams[pPlayer:GetTeam()]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALCTEXAS"]) then
		print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do
			local CSplayer = Players[i];
			local csTeam   = Teams[CSplayer:GetTeam()];
			if (CSplayer:IsAlive() and CSplayer:IsMinorCiv()) then
				local iFriendship = CSplayer:GetMinorCivFriendshipWithMajor(playerID);
				if (csTeam:IsHasMet(playerTeam)) then
					print("Texas has met " .. CSplayer:GetName() .. ".");
					CSplayer:ChangeMinorCivFriendshipWithMajor(playerID, 1);
				else 
					print("Texas has not met " .. CSplayer:GetName() .. ".");
				end

				print("Friendship with Texas is " .. iFriendship .. ".")
			end
			--Below always returns nil
			--[[
			if (CSplayer:IsMinorCiv() and iFriendship == nil) then
				print("Relationship with " .. CSplayer:GetName() .. " is nil.");
			elseif (CSplayer:IsMinorCiv() and iFriendship > 0) then
				print("Relationship with " .. CSplayer:GetName() .. " is " .. iFriendship .. " Positive.");
			elseif (CSplayer:IsMinorCiv() and iFriendship < 0) then
				print("Relationship with " .. CSplayer:GetName() .. " is " .. iFriendship .. " Negative.");
			elseif (CSplayer:IsMinorCiv() and iFriendship == 0) then
				print("Relationship with " .. CSplayer:GetName() .. " is " .. iFriendship .. " Zero.");
			else
				print("Relationship not a number");
			end
			]]--
		end
		print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	end
end

GameEvents.PlayerDoTurn.Add(MetTest)