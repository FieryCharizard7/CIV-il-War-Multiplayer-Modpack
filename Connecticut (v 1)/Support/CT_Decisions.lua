-- CT_Decisions
-- Author: calcul8or
-- DateCreated: 8/25/2016 5:47:20 AM
--------------------------------------------------------------

print("CT Decisions loaded");

local ConnecticutID = GameInfoTypes["CIVILIZATION_CALC_CONNECTICUT"]
local renEraID      = GameInfoTypes["ERA_RENAISSANCE"]
local scientist     = GameInfoTypes["UNIT_SCIENTIST"]
----------------------------------------------------------------------------------------------------
-- Webster's dictionary 
----------------------------------------------------------------------------------------------------
local Decisions_FundDictionary = {}
	Decisions_FundDictionary.Name = "TXT_KEY_DECISIONS_CALC_CONNECTICUT_DICTIONARY"
	Decisions_FundDictionary.Desc = "TXT_KEY_DECISIONS_CALC_CONNECTICUT_DICTIONARY_DESC"
	HookDecisionCivilizationIcon(Decisions_FundDictionary, "CIVILIZATION_CALC_CONNECTICUT")
	Decisions_FundDictionary.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= ConnecticutID then return false, false end
		if load(player, "Decisions_FundDictionary") == true then
			Decisions_FundDictionary.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALC_CONNECTICUT_DICTIONARY_ENACTED_DESC")
			return false, false, true
		end

		local currentEra = player:GetCurrentEra()
		--local capCity = player:GetCapitalCity()
		local GoldCost = math.ceil(500 * iMod)
		--local iCultureCost = math.ceil(200 * iMod)
		
		Decisions_FundDictionary.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALC_CONNECTICUT_DICTIONARY_DESC", GoldCost)
		
		if (not player:GetCapitalCity()) 							then return true, false end
		if currentEra < renEraID									then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < GoldCost								then return true, false end
		
		return true, true
	end
	)

	Decisions_FundDictionary.DoFunc = (
	function(player)
		local GoldCost = math.ceil(500 * iMod);
		player:ChangeGold(-GoldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		local CapCity = player:GetCapitalCity()
		player:InitUnit(scientist, CapCity:GetX(), CapCity:GetY()):JumpToNearestValidPlot()
		save(player, "Decisions_FundDictionary", true)
	end
	)
	
Decisions_AddCivilisationSpecific(ConnecticutID, "Decisions_FundDictionary", Decisions_FundDictionary)

----------------------------------------------------------------------------------------------------
-- Fundamental Orders
----------------------------------------------------------------------------------------------------
local Decisions_CTFundamentalOrders = {}
	Decisions_CTFundamentalOrders.Name = "TXT_KEY_DECISIONS_CALC_CT_FUND_ORDERS"
	Decisions_CTFundamentalOrders.Desc = "TXT_KEY_DECISIONS_CALC_CT_FUND_ORDERS_DESC"
	HookDecisionCivilizationIcon(Decisions_CTFundamentalOrders, "CIVILIZATION_CALC_CONNECTICUT")
	Decisions_CTFundamentalOrders.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= ConnecticutID then return false, false end
		if load(pPlayer, "Decisions_CTFundamentalOrders") == true then
			Decisions_CTFundamentalOrders.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALC_CT_FUND_ORDERS_ENACTED_DESC")
			return false, false, true
		end

		local currentEra = pPlayer:GetCurrentEra()
		local iGoldCost = math.ceil(200 * iMod)
		local iCultureCost = math.ceil(200 * iMod)
		--local iTurns = math.ceil(10 * iGAMod)
		Decisions_CTFundamentalOrders.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALC_CT_FUND_ORDERS_DESC", iGoldCost, iCultureCost)
		if (not pPlayer:GetCapitalCity()) 								then return true, false end
		if (pPlayer:GetGold() < iGoldCost)								then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1)	then return true, false end
		if currentEra > renEraID										then return true, false end
		if (pPlayer:GetJONSCulture() < iCultureCost)					then return true, false end

		return true, true
	end
	)
	
	Decisions_CTFundamentalOrders.DoFunc = (
	function(pPlayer)
		local iGoldCost = math.ceil(200 * iMod)
		local iCultureCost = math.ceil(200 * iMod)
		local iTurns = math.ceil(10 * iGAMod)
		pPlayer:ChangeGold(-iGoldCost)
		pPlayer:ChangeJONSCulture(-iCultureCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		for city in pPlayer:Cities() do
			city:ChangeWeLoveTheKingDayCounter(iTurns)
		end
		pPlayer:ChangeGoldenAgeTurns(iTurns)
		save(pPlayer, "Decisions_CTFundamentalOrders", true)
	end
	)
	
Decisions_AddCivilisationSpecific(ConnecticutID, "Decisions_CTFundamentalOrders", Decisions_CTFundamentalOrders)
