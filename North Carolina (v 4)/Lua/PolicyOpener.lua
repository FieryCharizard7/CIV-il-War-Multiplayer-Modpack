-- Built from JFDs PietyOpener
-- Author: JFD, edited by calcul8or
-- DateCreated: 8/20/2014 8:54:07 PM
--------------------------------------------------------------
function PolicyOpener(player)
	print("Thanks to JFD for this script")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_NOCAROLINA"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_NCUA"]) then
				--player:SetPolicyBranchUnlocked(GameInfoTypes["POLICY_BRANCH_PIETY"], true)
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_NCUA"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(PolicyOpener)