-- JFD_AmericaLincoln_Functions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS
--=======================================================================================================================
-- JFD_CanConstructBuilding
----------------------------------------------------------------------------------------------------------------------------	
local buildingHarborID		= GameInfoTypes["BUILDING_HARBOR"]
local buildingMintID		= GameInfoTypes["BUILDING_MINT"]
local buildingSeaportID		= GameInfoTypes["BUILDING_SEAPORT"]
local improvementMineID		= GameInfoTypes["IMPROVEMENT_MINE"]
local resourceCopperID		= GameInfoTypes["RESOURCE_COPPER"]
local resourceGoldID		= GameInfoTypes["RESOURCE_GOLD"]
local resourceSilverID		= GameInfoTypes["RESOURCE_SILVER"]

function JFD_CanConstructBuilding(city, buildingID)
	for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
		local plot = city:GetCityIndexPlot(cityPlot)
		if buildingID == buildingMintID then
			if (plot and plot:GetImprovementType() == improvementMineID and (plot:GetResourceType() == resourceGoldID or plot:GetResourceType() == resourceSilverID or plot:GetResourceType() == resourceCopperID)) then
				return true
			end
		elseif (buildingID == buildingSeaportID or buildingID == buildingHarborID) then
			if (plot and city:IsCoastal()) then
				return true
			end
		else
			return true
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------	
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------	
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
----------------------------------------------------------------------------------------------------------------------------	
-- JFD_GetEarliestGoldBuildingForCity
----------------------------------------------------------------------------------------------------------------------------	
local buildingBankID			= GameInfoTypes["BUILDING_BANK"]
local buildingCaravansaryID		= GameInfoTypes["BUILDING_CARAVANSARY"]
local buildingHarbourID			= GameInfoTypes["BUILDING_HARBOR"]
local buildingMarketID			= GameInfoTypes["BUILDING_MARKET"]
local buildingMintID			= GameInfoTypes["BUILDING_MINT"]
local buildingSeaportID			= GameInfoTypes["BUILDING_SEAPORT"]
local buildingStockExchangeID	= GameInfoTypes["BUILDING_STOCK_EXCHANGE"]
local buildingTraderID			= GameInfoTypes["BUILDING_JFD_TRADER"] or nil
local goldBuildings = {
	buildingStockExchangeID,
	buildingBankID,
	buildingSeaportID,
	buildingHarbourID,
	buildingMarketID,
	buildingMintID,
	buildingCaravansaryID,
	buildingTraderID
	}
	
function JFD_GetGoldBuildingToConstruct(city)
	local player = Players[city:GetOwner()]
	local buildingToConstructID
	for _, buildingID in ipairs(goldBuildings) do
		if (player:CanConstruct(buildingID) and JFD_CanConstructBuilding(city, buildingID) and not (city:IsHasBuilding(buildingID))) then
			buildingToConstructID = buildingID
			break
		end
	end

	return buildingToConstructID
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayer						= Players[Game.GetActivePlayer()]
local civilisationID					= GameInfoTypes["CIVILIZATION_JFD_AMERICA_LINCOLN"]
local eraIndustrialID					= GameInfoTypes["ERA_INDUSTRIAL"]
local isAmericaLincolnCivActive			= JFD_IsCivilisationActive(civilisationID)
local isAmericaLincolnCivActivePlayer	= activePlayer:GetCivilizationType() == civilisationID
local mathCeil = math.ceil

if isAmericaLincolnCivActive then
	print("President Lincoln is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_BlockMonitor
----------------------------------------------------------------------------------------------------------------------------	
local techSteamPowerID		= GameInfoTypes["TECH_STEAM_POWER"]
local unitMonitorRangedID	= GameInfoTypes["UNIT_JFD_MONITOR_RANGED"]
function JFD_BlockMonitor(playerID, unitID)
	local player = Players[playerID]
	if unitID == unitMonitorRangedID then
		if (Teams[player:GetTeam()]:GetTeamTechs():HasTech(techSteamPowerID) and player:GetCivilizationType() == civilisationID) then 
			return true
		else
			return
		end
	end
	
	return true
end
GameEvents.PlayerCanTrain.Add(JFD_BlockMonitor)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_LincolnCapitalism
----------------------------------------------------------------------------------------------------------------------------	
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
function JFD_LincolnCapitalism(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		for city in player:Cities() do	
			if (city and not (city:IsPuppet())) then
				local buildingID = JFD_GetGoldBuildingToConstruct(city)
				if buildingID then
					local productionChange = city:GetBaseYieldRate(yieldProductionID) + ((city:GetBaseYieldRate(yieldProductionID)*city:GetProductionModifier(buildingID))/100)
					local productionNeeded = player:GetBuildingProductionNeeded(buildingID) 
					local turnsLeft = city:GetBuildingProductionTurnsLeft(buildingID)
					if turnsLeft <= 1 then
						city:SetNumRealBuilding(buildingID, 1)
						if player:IsHuman() then
							local capitalistType = "Merchants"
							if player:GetCurrentEra() >= eraIndustrialID then capitalistType = "Investors"  end
							
							local buildingDescription = GameInfo.Buildings[buildingID].Description
							local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_CAPITALIST_BUILDING_SHORT", buildingDescription, city:GetName())
							local description = Locale.ConvertTextKey("TXT_KEY_JFD_CAPITALIST_BUILDING", capitalistType, buildingDescription, city:GetName())
							player:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort, city:GetX(), city:GetY())
						end
					else
						city:ChangeBuildingProduction(buildingID, productionChange)
					end
				end
			end
		end
	end
end

if isAmericaLincolnCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_LincolnCapitalism)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ParrottRifleDefense
----------------------------------------------------------------------------------------------------------------------------	
local direction_types = {
	DirectionTypes["DIRECTION_NORTHEAST"],
	DirectionTypes["DIRECTION_NORTHWEST"],
	DirectionTypes["DIRECTION_EAST"],
	DirectionTypes["DIRECTION_SOUTHEAST"],
	DirectionTypes["DIRECTION_SOUTHWEST"],
	DirectionTypes["DIRECTION_WEST"]
	}
local improvementCitadelID				= GameInfoTypes["IMPROVEMENT_CITADEL"]
local improvementFortID					= GameInfoTypes["IMPROVEMENT_FORT"]
local unitPromotionParottRifleID		= GameInfoTypes["PROMOTION_JFD_PARROTT_RIFLE"]
local unitPromotionParottRifleDefenseID = GameInfoTypes["PROMOTION_JFD_PARROTT_DEFENSE"]

function JFD_ParrottRifleDefense(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local adjacentToParrottRifle = false
	if Map.GetPlot(unitX, unitY) then
		for loop, direction in ipairs(direction_types) do
			local adjPlot = Map.PlotDirection(unitX, unitY, direction)
			if adjPlot then
				if (adjPlot:GetImprovementType() == improvementFortID or adjPlot:GetImprovementType() == improvementCitadelID) then
					if (adjPlot:GetUnit() and adjPlot:GetUnit():IsHasPromotion(unitPromotionParottRifleID) and adjPlot:GetUnit():GetOwner() == playerID) then
						adjacentToParrottRifle = true
						break
					end
				end
			end
		end
	end
	
	if adjacentToParrottRifle then
		if not unit:IsHasPromotion(unitPromotionParottRifleDefenseID) then
			unit:SetHasPromotion(unitPromotionParottRifleDefenseID, true)
		end
	else
		if unit:IsHasPromotion(unitPromotionParottRifleDefenseID) then
			unit:SetHasPromotion(unitPromotionParottRifleDefenseID, false)
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_ParrottRifleDefense)
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
--Globals
----------------------------------------------------------------------------------------------------------------------------
local isCityViewOpen = false
----------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateGoldBuildingProgress
----------------------------------------------------------------------------------------------------------------------------
function JFD_UpdateGoldBuildingProgress()
	Controls.BuildingBackground:SetHide(true)
	Controls.BuildingImage:SetHide(true)
	Controls.BuildingButton:SetDisabled(true)
	Controls.BuildingButton:LocalizeAndSetToolTip(nil)
	local city = UI.GetHeadSelectedCity()
	if (city and not (city:IsPuppet())) then
		local buildingID = JFD_GetGoldBuildingToConstruct(city)
		if buildingID then
			local building = GameInfo.Buildings[buildingID]
			Controls.BuildingBackground:SetHide(false)
			
			local capitalistType = "Merchants"
			if activePlayer:GetCurrentEra() >= eraIndustrialID then capitalistType = "Investors" end
			local productionProgress = city:GetBuildingProduction(buildingID)
			local productionRequired = activePlayer:GetBuildingProductionNeeded(buildingID)
			local turnsLeft = city:GetBuildingProductionTurnsLeft(buildingID)
			local buildingButtonText = Locale.ConvertTextKey("TXT_KEY_JFD_LINCOLN_GOLD_BUILDING_PROGRESS", productionProgress, productionRequired)
			local toolTip = Locale.ConvertTextKey("TXT_KEY_JFD_LINCOLN_GOLD_BUILDING_PROGRESS_TT", building.Description, turnsLeft, capitalistType)
			IconHookup(building.PortraitIndex, 64, building.IconAtlas, Controls.BuildingImage)
			Controls.BuildingImage:SetHide(false)
			Controls.BuildingButton:SetText(buildingButtonText)
			Controls.BuildingButton:LocalizeAndSetToolTip(toolTip)
			Controls.BuildingMeter:SetPercent(productionProgress/productionRequired)
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnEnterCityScreen
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnEnterCityScreen()
	isCityViewOpen = true
	JFD_UpdateGoldBuildingProgress()
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnExitCityScreen
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnExitCityScreen()
	isCityViewOpen = false
	JFD_UpdateGoldBuildingProgress()
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnNextCityScren
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnNextCityScren()
	if isCityViewOpen then
		JFD_UpdateGoldBuildingProgress()
	end
end

if (isAmericaLincolnCivActive and isAmericaLincolnCivActivePlayer) then
	Events.SerialEventEnterCityScreen.Add(JFD_OnEnterCityScreen)
	Events.SerialEventExitCityScreen.Add(JFD_OnExitCityScreen)
	Events.SerialEventCityScreenDirty.Add(JFD_OnNextCityScren)
end
--==========================================================================================================================
--==========================================================================================================================