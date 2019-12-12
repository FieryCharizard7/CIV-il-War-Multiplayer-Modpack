-- ExtraPop
-- Author: calcul8or
-- DateCreated: 8/24/2015 10:30:00 PM
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

------------------------------------------------------------
-- Assign random promotion
------------------------------------------------------------
local Benning				= GameInfoTypes["BUILDING_BENNING"];
local BenningArcher			= GameInfoTypes["BUILDING_BENNING_ARCHER"];

local BenningPromo0			= GameInfoTypes["PROMOTION_GREEN"];
local BenningPromo1			= GameInfoTypes["PROMOTION_CAP_DEFENSE"];
local BenningPromo2			= GameInfoTypes["PROMOTION_FOREST_MOVES"];
local BenningPromo3			= GameInfoTypes["PROMOTION_SIGHT_CHANGE"];
local BenningPromo4			= GameInfoTypes["PROMOTION_CITY_ATTACK"];
local BenningPromo5			= GameInfoTypes["PROMOTION_XTRA_ATTACK"];

local BenningArcherPromo0	= GameInfoTypes["PROMOTION_GREEN_ARCHER"];
local BenningArcherPromo1	= GameInfoTypes["PROMOTION_OPEN_DEFENSE_ARCHER"];
local BenningArcherPromo2	= GameInfoTypes["PROMOTION_FOREST_MOVES_ARCHER"];
local BenningArcherPromo3	= GameInfoTypes["PROMOTION_SIGHT_CHANGE_ARCHER"];
local BenningArcherPromo4	= GameInfoTypes["PROMOTION_CITY_ATTACK_ARCHER"];
local BenningArcherPromo5	= GameInfoTypes["PROMOTION_XTRA_ATTACK_ARCHER"];

function RandomPromo(ownerId, cityId, unitId, bGold, bFaithOrCulture)
	local player = Players[ownerId];
	local unit = player:GetUnitByID(unitId);
	local PromoBool
	--print("Checking unit for promo")
	if (player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALCGEORGIA"]) then
		if unit:IsHasPromotion(BenningPromo0) then
			PromoBool = true
			--print("Benning Promo")
			AssignPromo(unit, PromoBool)
		elseif unit:IsHasPromotion(BenningArcherPromo0) then
			PromoBool = false
			--print("Benning Archer Promo")
			AssignPromo(unit, PromoBool)
		end
	end
end
GameEvents.CityTrained.Add(RandomPromo)

function AssignPromo(unit, PromoBool)
	local Throwaway = math.random(1,100)
	if PromoBool then
		local RandomNum = math.random(1, 100)
		print("Benning Random number is " .. RandomNum)
		if RandomNum < 25 then
			unit:SetHasPromotion(BenningPromo0, false);
			unit:SetHasPromotion(BenningPromo1, true);
		elseif RandomNum < 45 then
			unit:SetHasPromotion(BenningPromo0, false);
			unit:SetHasPromotion(BenningPromo2, true);
		elseif RandomNum < 65 then
			unit:SetHasPromotion(BenningPromo0, false);
			unit:SetHasPromotion(BenningPromo3, true);
		elseif	RandomNum < 85 then
			unit:SetHasPromotion(BenningPromo0, false);
			unit:SetHasPromotion(BenningPromo4, true);
		else
			unit:SetHasPromotion(BenningPromo0, false);
			unit:SetHasPromotion(BenningPromo5, true);
		end
	else
		local RandomNum = math.random(1, 100)
		print("Archer Benning Random number is " .. RandomNum)
		if RandomNum < 25 then
			unit:SetHasPromotion(BenningArcherPromo0, false);
			unit:SetHasPromotion(BenningArcherPromo1, true);
		elseif RandomNum < 45 then
			unit:SetHasPromotion(BenningArcherPromo0, false);
			unit:SetHasPromotion(BenningArcherPromo2, true);
		elseif RandomNum < 65 then
			unit:SetHasPromotion(BenningArcherPromo0, false);
			unit:SetHasPromotion(BenningArcherPromo3, true);
		elseif	RandomNum < 85 then
			unit:SetHasPromotion(BenningArcherPromo0, false);
			unit:SetHasPromotion(BenningArcherPromo4, true);
		else
			unit:SetHasPromotion(BenningArcherPromo0, false);
			unit:SetHasPromotion(BenningArcherPromo5, true);
		end
	end
end

------------------------------------------------------------
--Add Marker for going to war
------------------------------------------------------------

function GA_war(TeamID1, TeamID2, bWar)
	if bWar then
		print("Someone went to war!")
		local player = Players[Teams[TeamID1]:GetLeaderID()]
		local otherPlayer = Players[Teams[TeamID2]:GetLeaderID()]
		local marker = GameInfoTypes["BUILDING_DECISIONS_GAWARMARKER"]
		if (otherPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALCGEORGIA"]) then 
			print("otherPlayer of the warring factions is Georgia!")
			--local GAID = GameInfoTypes["CIVILIZATION_CALCGEORGIA"]
			--local GAPlayer = Players[GAID]
			local Capital = otherPlayer:GetCapitalCity()
			if not (Capital:IsHasBuilding(marker)) then
					Capital:SetNumRealBuilding(marker,1)
					print("Set war marker for otherPlayer")
			end
		elseif (player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALCGEORGIA"]) then
			local Capital = player:GetCapitalCity()
			if not (Capital:IsHasBuilding(marker)) then
					Capital:SetNumRealBuilding(marker,1)
					print("Set war marker for player")
			end
		end
	end
end

Events.WarStateChanged.Add(GA_war);


