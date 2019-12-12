-- SettlerCheck
-- Author: calcul8or
-- DateCreated: 7/27/2014 7:59:21 AM
--------------------------------------------------------------
function SettlerCheck(iPlayer, iCityID, iUnitType)
	--print("Settler Check")
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RHODEISLAND"] and pPlayer:IsAlive() then
		--print("Checking Rhode Island")
		local iNumCities = pPlayer:GetNumCities()
		print(string.format("Number of cities: %s", iNumCities))
		if iNumCities > 3 then
			print("City count greater than 3")
			if (iUnitType == GameInfoTypes["UNIT_SETTLER"]) then
			return false
			end
		else 
			print("City count less than 4")
			return true
		end
	end
	return true
end


GameEvents.CityCanTrain.Add(SettlerCheck)


--function SettlerCheck(iPlayer)
--	print("Settler check")
--	local pPlayer = Players[iPlayer]
--	if pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RHODEISLAND"] and player:IsAlive() then
--		print("Checking Rhode Island")
--		local iNumCities = player:GetNumCities()
--		for city in pPlayer:Cities() do
--			if iNumCities < 5 
--			end
--			--if not city:IsHasBuilding(GameInfoTypes["BUILDING_PALACE"]) then
--				--city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_DUMMY"], 1)	
--			--end
--		end	
--	end
--end
--GameEvents.PlayerDoTurn.Add(SettlerCheck)

