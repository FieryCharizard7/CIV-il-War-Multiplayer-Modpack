-- IA_Decisions
-- Author: calcul8or
-- DateCreated: 6/26/2016 11:01:30 AM
--------------------------------------------------------------
print("IA decisions loaded");

local ArizonaID = GameInfoTypes["CIVILIZATION_CALC_IOWA"]
local RenEraID = GameInfoTypes["ERA_RENAISSANCE"]
local IowaStateFairBldg = GameInfoTypes["BUILDING_IOWA_STATE_FAIR"]

-------------------------------------------------------------------------------------------------------------------------
-- State Fair
-------------------------------------------------------------------------------------------------------------------------

local Decisions_IowaStateFiar = {}
	Decisions_IowaStateFiar.Name = "TXT_KEY_DECISIONS_IOWA_STATE_FAIR"
	Decisions_IowaStateFiar.Desc = "TXT_KEY_DECISIONS_IOWA_STATE_FAIR_DESC"
	HookDecisionCivilizationIcon(Decisions_IowaStateFiar, "CIVILIZATION_CALC_IOWA")
	Decisions_IowaStateFiar.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= ArizonaID then return false, false end
		if load(player, "Decisions_IowaStateFiar") == true then
			Decisions_IowaStateFiar.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IOWA_STATE_FAIR_ENACTED_DESC")
			return false, false, true
		end

		local currentEra = player:GetCurrentEra()
		local GoldCost = math.ceil(500 * iMod)
		
		Decisions_IowaStateFiar.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IOWA_STATE_FAIR_DESC", GoldCost)
		
		if (not player:GetCapitalCity()) 							then return true, false end
		if currentEra < RenEraID									then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < GoldCost								then return true, false end
		
		return true, true
	end
	)

	Decisions_IowaStateFiar.DoFunc = (
	function(player)
		print("IA State Fair enacted");
		local GoldCost = math.ceil(500 * iMod);
		player:ChangeGold(-GoldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		local CapCity = player:GetCapitalCity()
		CapCity:SetNumRealBuilding(IowaStateFairBldg, 1)
		--local PlotX = CapCity:GetX()
		--local PlotY = CapCity:GetY()
		--player:InitUnit(GrtProphet, PlotX, PlotY):JumpToNearestValidPlot()
		save(player, "Decisions_IowaStateFiar", true)
	end
	)
	
Decisions_AddCivilisationSpecific(ArizonaID, "Decisions_IowaStateFiar", Decisions_IowaStateFiar)
-------------------------------------------------------------------------------------------------------------------------
-- Amana Colony
-------------------------------------------------------------------------------------------------------------------------
local Decisions_IowaAmanaColony = {}
	Decisions_IowaAmanaColony.Name = "TXT_KEY_DECISIONS_IOWA_AMANA_COLONY"
	Decisions_IowaAmanaColony.Desc = "TXT_KEY_DECISIONS_IOWA_AMANA_COLONY_DESC"
	HookDecisionCivilizationIcon(Decisions_IowaAmanaColony, "CIVILIZATION_CALC_IOWA")
	Decisions_IowaAmanaColony.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= ArizonaID then return false, false end
		if load(player, "Decisions_IowaAmanaColony") == true then
			Decisions_IowaAmanaColony.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IOWA_AMANA_COLONY_ENACTED_DESC")
			return false, false, true
		end

		local currentEra = player:GetCurrentEra()
		local GoldCost = math.ceil(200 * iMod)
		local CultureCost = math.ceil(200 * iMod)
		
		Decisions_IowaAmanaColony.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IOWA_AMANA_COLONY_DESC", GoldCost, CultureCost)
		
		if (not player:GetCapitalCity()) 							then return true, false end
		if currentEra < RenEraID									then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < GoldCost								then return true, false end
		if player:GetJONSCulture() < CultureCost					then return true, false end
		
		return true, true
	end
	)

	Decisions_IowaAmanaColony.DoFunc = (
	function(player)
		print("IA Amana enacted");
		local GoldCost = math.ceil(200 * iMod)
		local CultureCost = math.ceil(200 * iMod)
		player:ChangeGold(-GoldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeJONSCulture(-CultureCost)
		local CapCity = player:GetCapitalCity()
		local CulThresh = CapCity:GetJONSCultureThreshold()
		CapCity:ChangePopulation(2)
		CapCity:ChangeJONSCultureStored(CulThresh)
		save(player, "Decisions_IowaAmanaColony", true)
	end
	)
	
Decisions_AddCivilisationSpecific(ArizonaID, "Decisions_IowaAmanaColony", Decisions_IowaAmanaColony)