-- HappinessScript
-- Author: calcul8or
-- DateCreated: 7/26/2014 12:17:17 PM
--------------------------------------------------------------

--GameEvents.PlayerDoTurn.Add(function(GetCities)
	--local pPlayer = Players[PlayerID];
	--local pCiv = pPlayer:GetCivilizationType();
	--if (pCiv == GameInfoTypes.CIVILIZATION_RHODEISLAND) then
		--print ("Getting number of cities")
		--local pRICities = pCiv:GetNumCities()
		--print pRICities
	--end
--end)

--local CivRI = GameInfoTypes.CIVILIZATION_RHODEISLAND;
--local UnhappyPerCity = Players:GetCityCountUnhappinessMod();
--local HappyBldg = GameInfoTypes.BUILDING_RIHAPPYDUMMY;

--GameEvents.PlayerDoTurn.Add(function(iPlayer)
	--if Players[iPlayer]:GetCivilizationType() == CivRI then
		--for dCity in Players[iPlayer]:Cities() do
			--	dCity:SetNumRealBuilding(HappyBldg, 7);
		--end
	--end
--end)
--Old Method
--if (player:IsEverAlive()) then
		--if (player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_RHODEISLAND) then


GameEvents.PlayerDoTurn.Add(
function(playerID)
	local player = Players[playerID];
	local pBuilding = GameInfoTypes.BUILDING_RIHAPPYDUMMY;
	print ("Starting RI city check");
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RHODEISLAND"] and player:IsAlive() then
			print("***Getting first city***")
			pCity1 = player:GetCapitalCity()
			print(string.format("First: %s", pCity1:GetName()))
			--print(string.format("First: %s, Second: %s, Third: %s, Fourth: %s", pCity1:GetName(), pCity2:GetName(), pCity3:GetName(), pCity4:GetName()))
			print("Placing happiness dummy building")
			pCity1:SetNumRealBuilding(pBuilding, 1)
			local pNumCities = player:GetNumCities()
			--print(string.format("Number of cities: %s", pNumCities))
			if pNumCities < 5 then
				for city in player:Cities() do
				SetNumRealBuilding(pBuilding, 1)
			end
		end
	end
end)
