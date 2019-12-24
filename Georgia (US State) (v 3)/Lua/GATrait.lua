-- GATrait
-- Author: calcul8or, with parts borrowed from JFD
-- DateCreated: 8/9/2015 10:04:41 AM
--------------------------------------------------------------
--------------------------------------------------------------
--Georgia Trait, +1 population in new cities
--------------------------------------------------------------
function GATrait(PlayerID, cityX, cityY)
	local pPlayer = Players[PlayerID];
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALCGEORGIA"]) then
		print("++++++Georgian city++++++")
		local pPlot = Map.GetPlot(cityX, cityY);
		local NewCity = pPlot:GetPlotCity()
		NewCity:ChangePopulation(1,true)
	end
end
GameEvents.PlayerCityFounded.Add(GATrait)

--------------------------------------------------------------
--Find Georgia, activate building code if in game, line 20
--------------------------------------------------------------

--local ActiveGA = IsCivilisationActive(civilisationID)

--if ActiveGA then
--	print"(Georgia's here");
--	GameEvents.CityConstructed.Add(AddExtraBarracks)
--end

function IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == GameInfoTypes["CIVILIZATION_CALCGEORGIA"] then
				print("Georgia's here");
				EraCheck()
				GameEvents.CityConstructed.Add(AddExtraBarracks)
				GameEvents.CityCanConstruct.Add(AllowCola)
			end
		end
	end

	return false
end

Events.SequenceGameInitComplete.Add(IsCivilisationActive)

---------------------------------------------------------
--Add Archer Building on construction (line 48)
---------------------------------------------------------

function AddExtraBarracks(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	local pPlayer = Players[ownerId]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALCGEORGIA"]) then
		print("Georgia built a building");
		local Benning = GameInfoTypes["BUILDING_BENNING"]
		if buildingType == Benning then
			print("Benning built");
			local BuildCity = pPlayer:GetCityByID(CityId)
			if not BuildCity:IsHasBuilding(GameInfoTypes["BUILDING_BENNING_ARCHER"]) then
				BuildCity:SetNumRealBuilding(GameInfoTypes["BUILDING_BENNING_ARCHER"], 1);
			end
		end
	end
end

------------------------------------------------------------
--Add Archer building if starting era is Industrial or later
------------------------------------------------------------

function EraCheck()
	local StartEra = PreGame.GetEra();
	if (StartEra ~= nil) then
		if (StartEra > 3) then
			print("Start era is greater than 3");
			GameEvents.PlayerCityFounded.Add(ArcherBarracks)
		end
	else
		print("Start Era is nil")
	end
end

function ArcherBarracks(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALCGEORGIA"]) then
		print("ArcherBarracks is running")
		local pPlot = Map.GetPlot(iCityX, iCityY);
		local iCity = pPlot:GetPlotCity();
		if not iCity:IsHasBuilding(GameInfoTypes["BUILDING_BENNING_ARCHER"]) then
			iCity:SetNumRealBuilding(GameInfoTypes["BUILDING_BENNING_ARCHER"], 1);
		end
	end
end

------------------------------------------------------------
-- Assign random promotion
------------------------------------------------------------
local Benning				= GameInfoTypes["BUILDING_BENNING"];
local BenningArcher			= GameInfoTypes["BUILDING_BENNING_ARCHER"];

local BenningPromo0			= GameInfoTypes["PROMOTION_GREEN"];
local BenningPromo1			= GameInfoTypes["PROMOTION_CAP_DEFENSE"];
local BenningPromo2			= GameInfoTypes["PROMOTION_FOREST_MOVES"];
local BenningPromo3			= GameInfoTypes["PROMOTION_SIGHT_CHANGE"];
local BenningPromo4			= GameInfoTypes["PROMOTION_OPEN_ATTACK"];
local BenningPromo5			= GameInfoTypes["PROMOTION_XTRA_ATTACK"];

local BenningArcherPromo0	= GameInfoTypes["PROMOTION_GREEN_ARCHER"];
local BenningArcherPromo1	= GameInfoTypes["PROMOTION_OPEN_DEFENSE_ARCHER"];
local BenningArcherPromo2	= GameInfoTypes["PROMOTION_FOREST_MOVES_ARCHER"];
local BenningArcherPromo3	= GameInfoTypes["PROMOTION_SIGHT_CHANGE_ARCHER"];
local BenningArcherPromo4	= GameInfoTypes["PROMOTION_CITY_ATTACK_ARCHER"];
local BenningArcherPromo5	= GameInfoTypes["PROMOTION_XTRA_ATTACK_ARCHER"];

function RandomPromo(ownerId, cityId, unitId, bGold, bFaithOrCulture)
	local player = Players[ownerID];
	--local city	 = player:GetCityByID(cityId);
	local unit = Units(unitId);
	local PromoBool
	if (player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALCGEORGIA"]) then
		if unit:IsHasPromotion(BenningPromo0) then
			PromoBool = true
			print("Benning Promo")
			AssignPromo(unit, PromoBool)
		elseif unit:IsHasPromotion(BenningArcherPromo0) then
			PromoBool = false
			print("Benning Archer Promo")
			AssignPromo(unit, PromoBool)
		end
	end
end
GameEvents.CityTrained.Add(RandomPromo)

function AssignPromo(unit, PromoBool)
	local Throwaway = JFD_GetRandom(1,100)
	if PromoBool then
		local RandomNum = JFD_GetRandom(1, 100)
		print("Benning Random number is " .. RandomNum)
		if RandomNum < 25 then
			unit:SetHasPromotion(BenningPromo1, true);
		elseif RandomNum < 45 then
			unit:SetHasPromotion(BenningPromo2, true);
		elseif RandomNum < 65 then
			unit:SetHasPromotion(BenningPromo3, true);
		elseif	RandomNum < 85 then
			unit:SetHasPromotion(BenningPromo4, true);
		else
			unit:SetHasPromotion(BenningPromo5, true);
		end
	else
		local RandomNum = JFD_GetRandom(1, 100)
		print("Archer Benning Random number is " .. RandomNum)
		if RandomNum < 25 then
			unit:SetHasPromotion(BenningArcherPromo1, true);
		elseif RandomNum < 45 then
			unit:SetHasPromotion(BenningArcherPromo2, true);
		elseif RandomNum < 65 then
			unit:SetHasPromotion(BenningArcherPromo3, true);
		elseif	RandomNum < 85 then
			unit:SetHasPromotion(BenningArcherPromo4, true);
		else
			unit:SetHasPromotion(BenningArcherPromo5, true);
		end
	end
end

------------------------------------------------------------
--Allow Cola Corp Branches
------------------------------------------------------------

local CorpBranch = GameInfoTypes["BUILDING_CORPBRANCH"]
local CorpHQ	 = GameInfoTypes["BUILDING_COLACORP"]
local CorpMarker = GameInfoTypes["BUILDING_COLACORP_MARKER"]

function AllowCola(iPlayer, iCity, iBuildingType)
	local pPlayer = Players[iPlayer]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALCGEORGIA"]) then
		print("Gerogia's trying to build something");
		local pTeam = Teams[pPlayer:GetTeam()];
		local eTech = GameInfoTypes["TECH_ELECTRICITY"];
		if (pTeam:IsHasTech(eTech)) then
			print("Player has Electricity");
			local BuildCity = pPlayer:GetCityByID(cityID)
			local iBuilding = GameInfoTypes[iBuildingType]
			--print("BuildCity is " .. BuildCity .. "city")
			if (iBuilding ~= CorpBranch) then
				return true
			else
				print("Building is the marker? " .. CorpMarker .. "?");
				if not BuildCity:IsHasBuilding(CorpMarker) then
						print("No marker here, move along")
						return false
				else 
					print("It's got the marker!")
				return true
				end
			end
		else return true
		end
	end
end
