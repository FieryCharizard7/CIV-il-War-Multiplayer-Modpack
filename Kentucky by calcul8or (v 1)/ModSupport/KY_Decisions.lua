-- KY_Decisions
-- Author: calcul8or
-- DateCreated: 7/31/2016 8:13:42 PM
--------------------------------------------------------------
print("KY decisions loaded");

local KentuckyID = GameInfoTypes["CIVILIZATION_CALC_KENTUCKY"]
local RenEraID = GameInfoTypes["ERA_RENAISSANCE"]
local IndEraID = GameInfoTypes["ERA_INDUSTRIAL"]

-------------------------------------------------------------------------------------------------------------------------
-- Great Compromise
-------------------------------------------------------------------------------------------------------------------------

local Decisions_KentuckyCompromise = {}
	Decisions_KentuckyCompromise.Name = "TXT_KEY_DECISIONS_KENTUCKY_COMPROMISE"
	Decisions_KentuckyCompromise.Desc = "TXT_KEY_DECISIONS_KENTUCKY_COMPROMISE_DESC"
	HookDecisionCivilizationIcon(Decisions_KentuckyCompromise, "CIVILIZATION_CALC_KENTUCKY")
	Decisions_KentuckyCompromise.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= KentuckyID then return false, false end
		if load(player, "Decisions_KentuckyCompromise") == true then
			Decisions_KentuckyCompromise.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_KENTUCKY_COMPROMISE_ENACTED_DESC")
			return false, false, true
		end

		local currentEra = player:GetCurrentEra()
		local GoldCost = math.ceil(200 * iMod)
		local iCultureCost = math.ceil(200 * iMod)
		
		Decisions_KentuckyCompromise.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_KENTUCKY_COMPROMISE_DESC", iCultureCost, GoldCost)
		
		if (not player:GetCapitalCity()) 							then return true, false end
		if currentEra < RenEraID									then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end
		if player:GetGold() < GoldCost								then return true, false end
		if (player:GetJONSCulture() < iCultureCost)					then return true, false end
		
		return true, true
	end
	)

	Decisions_KentuckyCompromise.DoFunc = (
	function(player)
		local iCultureCost = math.ceil(200 * iMod)
		local GoldCost = math.ceil(200 * iMod);
		player:ChangeGold(-GoldCost)
		player:ChangeJONSCulture(-iCultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		local CapCity = player:GetCapitalCity()
		--CapCity:SetNumRealBuilding(ArizonaGolfBuilding, 1)
		--local PlotX = CapCity:GetX()
		--local PlotY = CapCity:GetY()
		player:InitUnit(GameInfoTypes.UNIT_SETTLER, CapCity:GetX(), CapCity:GetY()):JumpToNearestValidPlot()
		player:InitUnit(GameInfoTypes.UNIT_SETTLER, CapCity:GetX(), CapCity:GetY()):JumpToNearestValidPlot()
		save(player, "Decisions_KentuckyCompromise", true)
	end
	)
	
Decisions_AddCivilisationSpecific(KentuckyID, "Decisions_KentuckyCompromise", Decisions_KentuckyCompromise)

-------------------------------------------------------------------------------------------------------------------------
-- Kentucky Derby
-------------------------------------------------------------------------------------------------------------------------
local Decisions_KentuckyDerby = {}
	Decisions_KentuckyDerby.Name = "TXT_KEY_DECISIONS_KENTUCKY_DERBY"
	Decisions_KentuckyDerby.Desc = "TXT_KEY_DECISIONS_KENTUCKY_DERBY_DESC"
	HookDecisionCivilizationIcon(Decisions_KentuckyDerby, "CIVILIZATION_CALC_KENTUCKY")
	Decisions_KentuckyDerby.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= KentuckyID then return false, false end
		if load(pPlayer, "Decisions_KentuckyDerby") == true then
			Decisions_KentuckyDerby.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_KENTUCKY_DERBY_ENACTED_DESC")
			return false, false, true
		end

		local currentEra = pPlayer:GetCurrentEra()
		local iGoldCost = math.ceil(300 * iMod)
		Decisions_KentuckyDerby.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_KENTUCKY_DERBY_DESC", iGoldCost)
		if (not pPlayer:GetCapitalCity()) 								then return true, false end
		if (pPlayer:GetGold() < iGoldCost)								then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1)	then return true, false end
		if currentEra < IndEraID										then return true, false end

		return true, true
	end
	)
	
	Decisions_KentuckyDerby.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(300 * iMod)
		local iTurns = math.ceil(10 * iGAMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		local capCity = pPlayer:GetCapitalCity();
		capCity:SetNumRealBuilding(GameInfoTypes.BUILDING_KY_RACE_COURSE, 1)
		pPlayer:ChangeGoldenAgeTurns(iTurns)
		save(pPlayer, "Decisions_KentuckyDerby", true)
	end
	)
	
Decisions_AddCivilisationSpecific(KentuckyID, "Decisions_KentuckyDerby", Decisions_KentuckyDerby)