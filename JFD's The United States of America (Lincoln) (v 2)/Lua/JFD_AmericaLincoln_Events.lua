-- JFD_AmericaLincoln_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's America (Lincoln) Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID	= GameInfoTypes["CIVILIZATION_JFD_AMERICA_LINCOLN"]
local eraIndustrialID	= GameInfoTypes["ERA_INDUSTRIAL"]
local mathCeil			= math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Civil War
--------------------------------------------------------------------------------------------------------------------------
local playerBarbarian				= Players[63]
local policyEmancipationID			= GameInfoTypes["POLICY_JFD_AMERICA_LINCOLN_EMANCIPATION"]
local policyCivilWarID				= GameInfoTypes["POLICY_JFD_AMERICA_LINCOLN_CIVIL_WAR"]
local unitPromotionNationalismID	= GameInfoTypes["PROMOTION_NATIONALISM"]

local Event_JFDAmericaCivilWar = {}
	Event_JFDAmericaCivilWar.Name = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR"
	Event_JFDAmericaCivilWar.Desc = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR_DESC"
	Event_JFDAmericaCivilWar.Weight = 20
	Event_JFDAmericaCivilWar.CanFunc = (
		function (player)			
			if load(player, "Event_JFDAmericaCivilWar") == true		then return false end
			if player:GetCivilizationType() ~= civilisationID		then return false end
			if (not player:HasPolicy(policyEmancipationID))			then return false end
			if player:GetNumCities() < 3							then return false end
			Event_JFDAmericaCivilWar.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR_DESC", player:GetCapitalCity():GetName())

			return true
		end
		)
	Event_JFDAmericaCivilWar.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDAmericaCivilWar.Outcomes[1] = {}
	Event_JFDAmericaCivilWar.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR_OUTCOME_1"
	Event_JFDAmericaCivilWar.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR_OUTCOME_RESULT_1"
	Event_JFDAmericaCivilWar.Outcomes[1].CanFunc = (
		function(player)
			Event_JFDAmericaCivilWar.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDAmericaCivilWar.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local citiesToRebel = {}
			for city in player:Cities() do
				if city ~= player:GetCapitalCity() then
					if JFD_GetRandom(1,100) <= 20 then
						playerBarbarian:AcquireCity(city, true)
						playerBarbarian:InitUnit(GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_GUN"), city:GetX(), city:GetY()):SetName("Rebel")
					else
						local unionUnitOne = player:InitUnit(GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_GUN"), city:GetX(), city:GetY())
						unionUnitOne:SetName("Unionist")
						unionUnitOne:SetHasPromotion(unitPromotionNationalismID, true)
					end
				else
					local unionUnitOne = player:InitUnit(GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_GUN"), city:GetX(), city:GetY())
					unionUnitOne:SetName("Unionist")
					unionUnitOne:SetHasPromotion(unitPromotionNationalismID, true)
				end
			end
			
			local capitalX = player:GetCapitalCity():GetX() + JFD_GetRandom(1,3)
			local capitalY = player:GetCapitalCity():GetY() + JFD_GetRandom(1,3)
			local unitOne = playerBarbarian:InitUnit(GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_GUN"), capitalX, capitalY)
			local unitTwo = playerBarbarian:InitUnit(GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_GUN"), capitalX, capitalY)
			unitOne:JumpToNearestValidPlot()
			unitOne:SetName("Rebel")
			unitTwo:JumpToNearestValidPlot()
			unitTwo:SetName("Rebel")

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AMERICA_LINCOLN_CIVIL_WAR_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR"))
			save(player, "Event_JFDAmericaCivilWar", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDAmericaCivilWar.Outcomes[2] = {}
	Event_JFDAmericaCivilWar.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR_OUTCOME_2"
	Event_JFDAmericaCivilWar.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR_OUTCOME_RESULT_2"
	Event_JFDAmericaCivilWar.Outcomes[2].CanFunc = (
		function(player)			
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter() * 20 / 100)
			Event_JFDAmericaCivilWar.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR_OUTCOME_RESULT_2", goldenAgeCost)
			return true
		end
		)
	Event_JFDAmericaCivilWar.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter() * 20 / 100)
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyCivilWarID, true)
			player:SetHasPolicy(policyEmancipationID, false)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AMERICA_LINCOLN_CIVIL_WAR_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR"))
			save(player, "Event_JFDAmericaCivilWar", true)
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDAmericaCivilWar", Event_JFDAmericaCivilWar)
--------------------------------------------------------------------------------------------------------------------------
-- Ulysses S Grant
--------------------------------------------------------------------------------------------------------------------------
local buildingMilitaryAcademyID = GameInfoTypes["BUILDING_MILITARY_ACADEMY"]
local unitGrantID				= GameInfoTypes["UNIT_JFD_ULYSSES"]
local unitGreatGeneralID		= GameInfoTypes["UNIT_GREAT_GENERAL"]
local unitPromotionGrantID		= GameInfoTypes["PROMOTION_JFD_ULYSSES"]

local Event_JFDAmericaLincolnUlysses = {}
	Event_JFDAmericaLincolnUlysses.Name = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_GRANT"
	Event_JFDAmericaLincolnUlysses.Desc = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_GRANT_DESC"
	Event_JFDAmericaLincolnUlysses.CanFunc = (
		function(player)			
			if load(player, "Event_JFDAmericaLincolnUlysses") == true	then return false end
			if player:GetCivilizationType() ~= civilisationID			then return false end
			if player:GetCurrentEra() < eraIndustrialID					then return false end
			if player:CountNumBuildings(buildingMilitaryAcademyID) == 0 then return false end
			if Teams[player:GetTeam()]:GetAtWarCount(true) == 0			then return false end

			return true
		end
		)
	Event_JFDAmericaLincolnUlysses.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDAmericaLincolnUlysses.Outcomes[1] = {}
	Event_JFDAmericaLincolnUlysses.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_GRANT_OUTCOME_1"
	Event_JFDAmericaLincolnUlysses.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_GRANT_OUTCOME_RESULT_1"
	Event_JFDAmericaLincolnUlysses.Outcomes[1].CanFunc = (
		function(player)	
			return true
		end
		)
	Event_JFDAmericaLincolnUlysses.Outcomes[1].DoFunc = (
		function(player) 
			local grant = player:InitUnit(unitGreatGeneralID, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())
			grant:SetName("Ulysses S. Grant")
			grant:SetHasPromotion(unitPromotionGrantID, true)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AMERICA_LINCOLN_GRANT_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_GRANT"))
			save(player, "Event_JFDAmericaLincolnUlysses", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDAmericaLincolnUlysses.Outcomes[2] = {}
	Event_JFDAmericaLincolnUlysses.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_GRANT_OUTCOME_2"
	Event_JFDAmericaLincolnUlysses.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_GRANT_OUTCOME_RESULT_2"
	Event_JFDAmericaLincolnUlysses.Outcomes[2].CanFunc = (
		function(player)	
			return true
		end
		)
	Event_JFDAmericaLincolnUlysses.Outcomes[2].DoFunc = (
		function(player) 
			player:InitUnit(unitGrantID, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AMERICA_LINCOLN_GRANT_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_GRANT"))
			save(player, "Event_JFDAmericaLincolnUlysses", true)
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDAmericaLincolnUlysses", Event_JFDAmericaLincolnUlysses)
--=======================================================================================================================
--=======================================================================================================================


