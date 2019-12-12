-- CT_Trait
-- Author: calcul8or
-- DateCreated: 8/20/2016 12:11:59 PM
--------------------------------------------------------------

print("CT_Trait has loaded. Woo hoo.");

local civID   = GameInfoTypes["CIVILIZATION_CALC_CONNECTICUT"]
local bldgID  = GameInfoTypes["BUILDING_CT_MIL_TRAIT"];
local bldgID2 = GameInfoTypes["BUILDING_CT_GOLD_TRAIT"];

function CTcheck(player)
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == civID then
			GameEvents.PlayerDoTurn.Add(CT_Trait)
		end
	end 
end
Events.SequenceGameInitComplete.Add(CTcheck)

function CT_Trait(playerID)
	local pPlayer = Players[playerID]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civID) then
		local capCity = pPlayer:GetCapitalCity();
		local capCityPlot = capCity:Plot();
		local CurrentEra = pPlayer:GetCurrentEra()
		local iNumCurrentDeals = UI.GetNumCurrentDeals(playerID);
		if iNumCurrentDeals ~= nil then
			print("iNumCurrentDeals = " .. iNumCurrentDeals);
			if iNumCurrentDeals > 5 then iNumCurrentDeals = 5 end
			if CurrentEra >= GameInfoTypes.ERA_INDUSTRIAL then iNumCurrentDeals = iNumCurrentDeals * 2 end
			pPlayer:ChangeGold(iNumCurrentDeals)
			if (pPlayer:IsHuman() and iNumCurrentDeals > 0) then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_YIELD_GOLD]Your trade deals have earned you an additional {1_Gold} Gold[ENDCOLOR]", iNumCurrentDeals))
			end
			--capCity:SetNumRealBuilding(bldgID2, iNumCurrentDeals)
		end
		local DOF = DOFcount(playerID)
		print("Final DOF count = " .. DOF);	
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(bldgID, DOF)
		end
	end
end

function DOFcount(iPlayer)
	local player = Players[iPlayer]
	local iCounter = 0
	for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local pOtherPlayer = Players[i]
		--print("Checking for DoF with " .. pOtherPlayer:GetName());
		if (pOtherPlayer:IsAlive()) then
			if (i ~= iPlayer and player:IsDoF(i)) then
				iCounter = iCounter + 1
				--print("iCounter = " .. iCounter);
			end
		end
	end
	if iCounter > 5 then 
		iCounter = 5 
	end
	--print("Final iCounter = " .. iCounter);
	return iCounter
end