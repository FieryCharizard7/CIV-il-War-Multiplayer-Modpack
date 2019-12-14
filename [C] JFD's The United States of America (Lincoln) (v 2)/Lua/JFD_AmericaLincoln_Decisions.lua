-- JFD_AmericaLincoln_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's America (Lincoln) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_IsHasIdeology
--------------------------------------------------------------------------------------------------------------------------
local policyBranchAutocracyID	= GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]
local policyBranchFreedomID		= GameInfoTypes["POLICY_BRANCH_FREEDOM"]
local policyBranchOrderID		= GameInfoTypes["POLICY_BRANCH_ORDER"]

function JFD_IsHasIdeology(playerID)
	local player = Players[playerID]
	local isHasIdeology = false
	if player:IsPolicyBranchUnlocked(policyBranchAutocracyID) then
		isHasIdeology = true
	elseif player:IsPolicyBranchUnlocked(policyBranchFreedomID) then
		isHasIdeology = true
	elseif player:IsPolicyBranchUnlocked(policyBranchOrderID) then
		isHasIdeology = true
	end
	
	return isHasIdeology
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_AMERICA_LINCOLN"]
local civilisationAmericaID = GameInfoTypes["CIVILIZATION_AMERICA"]
local eraIndustrialID		= GameInfoTypes["ERA_INDUSTRIAL"]
local mathCeil				= math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- United States: Emancipation Proclamation
-------------------------------------------------------------------------------------------------------------------------
local buildingCourthouseID	= GameInfoTypes["BUILDING_COURTHOUSE"]
local policyCivilWarID		= GameInfoTypes["POLICY_JFD_AMERICA_LINCOLN_CIVIL_WAR"]
local policyEmancipationID	= GameInfoTypes["POLICY_JFD_AMERICA_LINCOLN_EMANCIPATION"]

tDecisions.Decisions_AmericaEmancipation = nil
local Decisions_AmericaEmancipation = {}
	Decisions_AmericaEmancipation.Name = "TXT_KEY_DECISIONS_AMERICAEMANCIPATION"
	Decisions_AmericaEmancipation.Desc = "TXT_KEY_DECISIONS_AMERICAEMANCIPATION_DESC"
	HookDecisionCivilizationIcon(Decisions_AmericaEmancipation, "CIVILIZATION_JFD_AMERICA_LINCOLN")
	Decisions_AmericaEmancipation.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if player:HasPolicy(policyCivilWarID) then return false, false end
		
		if load(player, "Decisions_AmericaEmancipation") == true then
			Decisions_AmericaEmancipation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AMERICAEMANCIPATION_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_AmericaEmancipation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AMERICAEMANCIPATION_DESC")
		if player:GetNumResourceAvailable(iMagistrate, false) < 2	then return true, false end
		if player:GetCurrentEra() < eraIndustrialID					then return true, false end

		return true, true
	end
	)
	
	Decisions_AmericaEmancipation.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeGoldenAgeTurns(12)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyEmancipationID, true)
		for city in player:Cities() do
			if city:IsOccupied() then
				city:SetNumRealBuilding(buildingCourthouseID, 1)
			end
		end
		save(player, "Decisions_AmericaEmancipation", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_AmericaEmancipation", Decisions_AmericaEmancipation)
-------------------------------------------------------------------------------------------------------------------------
-- United States: Anaconda Plan
-------------------------------------------------------------------------------------------------------------------------
local policyAnacondaID			= GameInfoTypes["POLICY_JFD_AMERICA_ANACONDA_PLAN"]
local unitCombatGunID			= GameInfoTypes["UNITCOMBAT_GUN"]
local unitPromotionAnacondaID	= GameInfoTypes["PROMOTION_JFD_ANACONDA"]

local Decisions_AmericaAnacondaPlan = {}
	Decisions_AmericaAnacondaPlan.Name = "TXT_KEY_DECISIONS_JFD_AMERICA_LINCOLN_ANACONDA_PLAN"
	Decisions_AmericaAnacondaPlan.Desc = "TXT_KEY_DECISIONS_JFD_AMERICA_LINCOLN_ANACONDA_PLAN_DESC"
	HookDecisionCivilizationIcon(Decisions_AmericaAnacondaPlan, "CIVILIZATION_JFD_AMERICA_LINCOLN")
	Decisions_AmericaAnacondaPlan.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_AmericaAnacondaPlan") == true then
			Decisions_AmericaAnacondaPlan.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AMERICA_LINCOLN_ANACONDA_PLAN_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(400 * iMod)
		Decisions_AmericaAnacondaPlan.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AMERICA_LINCOLN_ANACONDA_PLAN_DESC", goldCost)
		if player:GetGold() < goldCost						then return true, false end
		if player:GetCurrentEra() < eraIndustrialID			then return true, false end
		if Teams[player:GetTeam()]:GetAtWarCount(true) == 0 then return true, false end

		return true, true
	end
	)
	
	Decisions_AmericaAnacondaPlan.DoFunc = (
	function(player)
		local goldCost = mathCeil(400 * iMod)
		player:ChangeGold(-goldCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyAnacondaID, true)
		for unit in player:Units() do
			if unit:GetUnitCombatType() == unitCombatGunID then
				unit:SetHasPromotion(unitPromotionAnacondaID, true)
			end
		end
		save(player, "Decisions_AmericaAnacondaPlan", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_AmericaAnacondaPlan", Decisions_AmericaAnacondaPlan)
-------------------------------------------------------------------------------------------------------------------------
-- America: Create the American Constitution
-------------------------------------------------------------------------------------------------------------------------
local buildingConstitutionID	= GameInfoTypes["BUILDING_JFD_AMERICA_CONSTITUTION"]
local techEconomicsID			= GameInfoTypes["TECH_ECONOMICS"]

local Decisions_AmericanConstitution = {}
	Decisions_AmericanConstitution.Name = "TXT_KEY_DECISIONS_JFD_AMERICA_WASHINGTON_CONSTITUTION"
	Decisions_AmericanConstitution.Desc = "TXT_KEY_DECISIONS_JFD_AMERICA_WASHINGTON_CONSTITUTION_DESC"
	HookDecisionCivilizationIcon(Decisions_AmericanConstitution, "CIVILIZATION_AMERICA")
	Decisions_AmericanConstitution.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationAmericaID	then return false, false end
		if JFD_IsHasIdeology(player:GetID())						then return false, false end
		if load(player, "Decisions_AmericanConstitution") == true then
			Decisions_AmericanConstitution.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AMERICA_WASHINGTON_CONSTITUTION_ENACTED_DESC")
			return false, false, true
		end
		
		local cultureCost = mathCeil(350 * iMod)
		Decisions_AmericanConstitution.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AMERICA_WASHINGTON_CONSTITUTION_DESC", cultureCost)
		
		if (player:GetNumResourceAvailable(iMagistrate, false) < 1)		then return true, false end
		if (player:GetJONSCulture() < cultureCost)						then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techEconomicsID)) 	then return true, false end
		
		return true, true
	end
	)
	
	Decisions_AmericanConstitution.DoFunc = (
	function(player)
		local cultureCost = mathCeil(350 * iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:GetCapitalCity():SetNumRealBuilding(buildingConstitutionID, 1)
		save(player, "Decisions_AmericanConstitution", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationAmericaID, "Decisions_AmericanConstitution", Decisions_AmericanConstitution)
--=======================================================================================================================
--=======================================================================================================================