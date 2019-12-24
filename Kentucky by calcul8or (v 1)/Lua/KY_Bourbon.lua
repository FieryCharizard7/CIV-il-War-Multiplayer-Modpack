-- KY_Bourbon
-- Author: LeeS, edited by calcul8or
-- DateCreated: 5/28/2016 1:04:28 PM
--------------------------------------------------------------
local tRealBuildingData = {}	--don't change this line
--------------------------------------------------------------
--[[

USER CONFIGURABLE VARIABLES

	Make changes to these variables as desired and needed

]]--
--------------------------------------------------------------

local bRequiresSpecificCiv = true
local iSpecificRequiredCiv = GameInfoTypes["CIVILIZATION_CALC_KENTUCKY"]
local bDoNotApplyToMinorCivs = true




----------------------------------------------------------------
--enter data into table tRealBuildingData here

--each subtable with table 'Counters' for a 'Real' building MUST have a designation of 'DummyBuilding=XXXXX'
----------------------------------------------------------------


tRealBuildingData[GameInfoTypes.BUILDING_KENTUCKY_MARKER_DUMMY] = { Counters={
{DummyBuilding=GameInfoTypes["BUILDING_KY_HORSE_DUMMY"], ImprovementType=GameInfoTypes.IMPROVEMENT_PASTURE, ResourceType=GameInfoTypes.RESOURCE_HORSE, LimitPerCity=99, PlotsPerEffect=1},
{DummyBuilding=GameInfoTypes["BUILDING_KY_BOURBON_DUMMY"], ImprovementType=GameInfoTypes.IMPROVEMENT_KENTUCKY_DISTILLERY, ResourceType=GameInfoTypes.RESOURCE_WHEAT, MustBeWorked=false, LimitPerCity=99, PlotsPerEffect=1},
{DummyBuilding=GameInfoTypes["BUILDING_KY_BOURBON_DUMMY"], ImprovementType=GameInfoTypes.IMPROVEMENT_KENTUCKY_DISTILLERY, ResourceType=GameInfoTypes.RESOURCE_KY_CORN, MustBeWorked=false, LimitPerCity=99, PlotsPerEffect=1}
} }
--[[
tRealBuildingData[GameInfoTypes.BUILDING_WORKSHOP] = {ApplyToAllInClass=true, Counters={ {DummyBuilding=GameInfoTypes["BUILDING_WORKSHOP_DUMMY"], ImprovementType=GameInfoTypes.IMPROVEMENT_LUMBERMILL, LimitPerCity=-1 },
{DummyBuilding="LUMBERMILL_TOTAL", ImprovementType=GameInfoTypes.IMPROVEMENT_LUMBERMILL, MustBeOwned=false, MustBeWorked=false, LimitPerCity=-1 },
{DummyBuilding="LUMBERMILL_OWNED", ImprovementType=GameInfoTypes.IMPROVEMENT_LUMBERMILL, MustBeOwned=true, MustBeWorked=false, LimitPerCity=-1 }}}
tRealBuildingData[GameInfoTypes.BUILDING_WORKSHOP].SpecialHandling = (
	function(BuildingID, tDummyQuantitiesTable, pCity, iPlayer)
		local pPlayer = Players[iPlayer]
		if not pPlayer:IsHuman() then return end
		local iDummyBuilding = GameInfoTypes["BUILDING_WORKSHOP_DUMMY"]
		local iOwnedLumbermills = tDummyQuantitiesTable["LUMBERMILL_OWNED"]
		local iTotalLumbermills = tDummyQuantitiesTable["LUMBERMILL_TOTAL"]
		local iNumberDummyToAdd = tDummyQuantitiesTable[iDummyBuilding]
		local sDummyBuildingName = Locale.ConvertTextKey(GameInfo.Buildings[iDummyBuilding].Description)
		print("The total number of Lumbermills within the working range of " .. pCity:GetName() .. " is " .. iTotalLumbermills)
		print("The total number of Lumbermills within the working range of " .. pCity:GetName() .. " that are owned by player " .. pPlayer:GetName() .. " is " .. iOwnedLumbermills)
		print("The total number of Dummy Buildings " .. sDummyBuildingName .. " that should be added if " .. pCity:GetName() .. " has a Workshop-Class Building is " .. iNumberDummyToAdd)
		if pCity:IsHasBuilding(BuildingID) then
			pCity:SetNumRealBuilding(iDummyBuilding, iNumberDummyToAdd)
		else pCity:SetNumRealBuilding(iDummyBuilding, 0)
		end
	end
	)
]]--












------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
--Don't make changes in the following code
------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

---------------------------------------------------------------------------------------------------------------------------
--Is Building Within Class Correct for Player
---------------------------------------------------------------------------------------------------------------------------
function IsBuildingCorrectForPlayer(iPlayer, iBuilding)
	local pPlayer = Players[iPlayer]
	local sCivilizationType = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type
	local sBuildingName = GameInfo.Buildings[iBuilding].Type
	local sBuildingClass = GameInfo.Buildings[iBuilding].BuildingClass
	local sDefaultBuilding
	for row in GameInfo.BuildingClasses("Type='" .. sBuildingClass .. "'") do
		sDefaultBuilding = row.DefaultBuilding
	end
	for row in GameInfo.Civilization_BuildingClassOverrides("CivilizationType='" .. sCivilizationType .. "'") do
		if sBuildingClass == row.BuildingClassType then
			return (sBuildingName == row.BuildingType)
		end
	end
	return (sBuildingName == sDefaultBuilding)
end

---------------------------------------------------------------------------------------------------------------------------
--function IrreconcilableData handles the busy-work of print error data to the lua log and making an error notification
---------------------------------------------------------------------------------------------------------------------------
function IrreconcilableData(sOriginator, sMessage)
	local sLongMessage = sOriginator .. ": Bad Data Was Encountered"
	if sMessage then
		sLongMessage = sOriginator .. ": " .. sMessage
	end
	local sShortMessage = "[COLOR_NEGATIVE_TEXT]Invalid Data within table tRealBuildingData[ENDCOLOR]"
	Players[0]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], sShortMessage .. "[NEWLINE][NEWLINE]" .. sLongMessage, sShortMessage)
	print(sLongMessage)
end


bDataIsIrreconcilable = false
local tCityImprovementEffectUnlockerBuildings = {}
local tCityLocalImprovements = { }
for BuildingID,DataTable in pairs(tRealBuildingData) do
	local bApplyToAllInClass = (DataTable.ApplyToAllInClass or false)
	local BuildingSpecialHandling = (DataTable.SpecialHandling or "NONE")
	----------------------------------------------------------------------------------------------------------------------
	--error checking on data entered by user into table tRealBuildingData
	--looking only for errors that are going to cause spectacular failure of the code
	----------------------------------------------------------------------------------------------------------------------
	for Item,CounterData in pairs(DataTable.Counters) do
		local sRealBuildingName = Locale.ConvertTextKey(GameInfo.Buildings[BuildingID].Description)
		if not CounterData.DummyBuilding then
			IrreconcilableData("Game Loading", "Dummy Building needed is missing for a Counter for 'Real' Building " .. sRealBuildingName .. "! A valid GameInfoTypes reference or a Unique Text-String must be supplied")
			bDataIsIrreconcilable = true
		end
		local sDummyName = CounterData.DummyBuilding
		local sDummyNameDataType = type(sDummyName)
		local sDummyBuildingType = "NONE"
		if sDummyNameDataType == "number" then			
			for row in GameInfo.Buildings("ID='" .. CounterData.DummyBuilding .. "'") do
				sDummyBuildingType = row.Type
			end
			if sDummyBuildingType == "NONE" then
				IrreconcilableData("Game Loading", "For Counter with DummyBuilding as " .. sDummyName .. " within the data for " .. sRealBuildingName .. "! The DummyBuilding has been designated as an integer value (ie, as if it were an ID # for a valid Building) but there is no matching Building ID # within table <Buildings>")
				bDataIsIrreconcilable = true
			else
				sDummyName = Locale.ConvertTextKey(GameInfo.Buildings[CounterData.DummyBuilding].Description)
			end
		elseif sDummyNameDataType == "string" then
			if ((BuildingSpecialHandling == nil) or (BuildingSpecialHandling == "NONE")) then
				IrreconcilableData("Game Loading", "For Counter with DummyBuilding as " .. sDummyName .. " within the data for " .. sRealBuildingName .. "! The DummyBuilding is a Text-String, but SpecialHandling for " .. sRealBuildingName .. " is either unspecified or set to NONE")
				bDataIsIrreconcilable = true
			end
		else
			IrreconcilableData("Game Loading", "For Counter with DummyBuilding as " .. tostring(sDummyName) .. " within the data for " .. sRealBuildingName .. "! The DummyBuilding has not been designated as a proper Building ID# from table <Buildings>, or it is not a Text-String")
			bDataIsIrreconcilable = true
		end
		if (CounterData.ResourceType ~= nil) and (CounterData.DoNotCountResourceTiles == true) then
			IrreconcilableData("Game Loading", "For Counter with DummyBuilding as " .. sDummyName .. " within the data for " .. sRealBuildingName .. "! A ResourceType is specified while DoNotCountResourceTiles is set to true")
			bDataIsIrreconcilable = true
		end
	end
	-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--using the data in table tRealBuildingData to construct a table called tCityImprovementEffectUnlockerBuildings
	--data is essentially copied from tRealBuildingData into tCityImprovementEffectUnlockerBuildings
	--where required, however, all buildings from within the same class as a building listed in tRealBuildingData is duplicated into table tCityImprovementEffectUnlockerBuildings
	-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	if bApplyToAllInClass then
		local sBuildingClass = GameInfo.Buildings[BuildingID].BuildingClass
		for Building in GameInfo.Buildings("BuildingClass='" .. sBuildingClass .. "'") do
			tCityImprovementEffectUnlockerBuildings[Building.ID] = { Counters=DataTable.Counters, SpecialHandling=BuildingSpecialHandling }
		end
	else
		tCityImprovementEffectUnlockerBuildings[BuildingID] = { Counters=DataTable.Counters, SpecialHandling=BuildingSpecialHandling }
	end
end
if not bDataIsIrreconcilable then
	for BuildingID,DataTable in pairs(tCityImprovementEffectUnlockerBuildings) do
		print("In table tCityImprovementEffectUnlockerBuildings a primary building with ID # of " .. BuildingID .. " (" .. Locale.ConvertTextKey(GameInfo.Buildings[BuildingID].Description) .. ") is being processed")
		for Item,CounterData in pairs(DataTable.Counters) do
			local iResourceType = (CounterData.ResourceType or -1)
			local iResourceLinkedDummyBuilding = (CounterData.DummyBuilding or -1)
			if not tCityLocalImprovements[CounterData.ImprovementType] then
				tCityLocalImprovements[CounterData.ImprovementType] = {}
			end
			if not tCityLocalImprovements[CounterData.ImprovementType][BuildingID] then
				tCityLocalImprovements[CounterData.ImprovementType][BuildingID] = {}
			end
			if not tCityLocalImprovements[CounterData.ImprovementType][BuildingID][iResourceType] then
				tCityLocalImprovements[CounterData.ImprovementType][BuildingID][iResourceType] = {}
			end
			tCityLocalImprovements[CounterData.ImprovementType][BuildingID][iResourceType][iResourceLinkedDummyBuilding] = {DoNotCountResourceTiles=(CounterData.DoNotCountResourceTiles or false),
					MustBeOwned=((CounterData.MustBeOwned == nil) and true or CounterData.MustBeOwned), MustBeWorked=((CounterData.MustBeWorked == nil) and true or CounterData.MustBeWorked),
					CannotBePillaged=((CounterData.CannotBePillaged == nil) and true or CounterData.CannotBePillaged), LimitPerCity=(CounterData.LimitPerCity or -1),
					CountSameTileOnlyOnce=((CounterData.CountSameTileOnlyOnce == nil) and true or CounterData.CountSameTileOnlyOnce)}
		end
	end
end

function CountCityImprovementsAndImplementEffectsForCity(pCity, iPlayer, tTableAlreadyCountedPlots)
	local pPlayer = Players[iPlayer]
	local tNumberCityLocalImprovements = {}
	for ImprovementID,BuildingDataTable in pairs(tCityLocalImprovements) do
		if not tNumberCityLocalImprovements[ImprovementID] then
			tNumberCityLocalImprovements[ImprovementID] = {}
		end
		for BuildingID,ResourceDataTable in pairs(BuildingDataTable) do
			if not tNumberCityLocalImprovements[ImprovementID][BuildingID] then
				tNumberCityLocalImprovements[ImprovementID][BuildingID] = {}
			end
			for ResourceID,DummyBuildingTable in pairs(ResourceDataTable) do
				if not tNumberCityLocalImprovements[ImprovementID][BuildingID][ResourceID] then
					tNumberCityLocalImprovements[ImprovementID][BuildingID][ResourceID] = {}
				end
				for DummyBuilding,SettingsTable in pairs(DummyBuildingTable) do
					tNumberCityLocalImprovements[ImprovementID][BuildingID][ResourceID][DummyBuilding] = 0
				end
			end
		end
	end
	local bCityHasBuildings = false
	for BuildingID,DataTable in pairs(tCityImprovementEffectUnlockerBuildings) do
		if pCity:IsHasBuilding(BuildingID) then
			bCityHasBuildings = true
			break
		end
	end
	if bCityHasBuildings then
		-- scanning through the city plots
		local iNumPlots = pCity:GetNumCityPlots()
		for i = 0, iNumPlots - 1 do
			local bPlotHasBeenCountedAtLeastOnce = false
			local pPlot = pCity:GetCityIndexPlot(i)
			local iPlotX, iPlotY = pPlot:GetX(), pPlot:GetY()
			local iPlotOwner = pPlot:GetOwner() 
			local iImprovementType = pPlot:GetImprovementType()
			local iResourceType = pPlot:GetResourceType()
			local bPlotIsPillaged = pPlot:IsImprovementPillaged()
			local bPlotIsBeingWorked = pPlot:IsBeingWorked()
			local bCityIsWorkingPlot = (pPlot:GetWorkingCity() == pCity)
			local bPlotOwnerIsCuurentPlayer = (iPlotOwner == iPlayer)
			if tCityLocalImprovements[iImprovementType] then
				local sImprovementName = Locale.ConvertTextKey(GameInfo.Improvements[iImprovementType].Description)
				--print("A Valid Improvement for the Handler has been found! The Improvement is a " .. sImprovementName)
				for BuildingID,ResourceTable in pairs(tCityLocalImprovements[iImprovementType]) do
					if pCity:IsHasBuilding(BuildingID) then
						local sBuildingName = Locale.ConvertTextKey(GameInfo.Buildings[BuildingID].Description)
						--print("The city has building " .. sBuildingName)
						if tCityLocalImprovements[iImprovementType][BuildingID][iResourceType] then
							for DummyBuilding,SettingsData in pairs(tCityLocalImprovements[iImprovementType][BuildingID][iResourceType]) do
								local bAddToCount = true
								if SettingsData.MustBeOwned then
									--print("The plot with the " .. sImprovementName .. " must be owned to be counted")
									bAddToCount = bPlotOwnerIsCuurentPlayer
								end
								if bAddToCount then
									if SettingsData.CannotBePillaged then
										--print("The plot with the " .. sImprovementName .. " cannot be pillaged to be counted")
										bAddToCount = not bPlotIsPillaged
									end
								end
								if bAddToCount then
									if SettingsData.DoNotCountResourceTiles and (iResourceType ~= -1) then
										--print("The plot with the " .. sImprovementName .. " cannot have a Resource to be counted")
										bAddToCount = false
									end
								end
								if bAddToCount then
									if bPlotIsBeingWorked then
										--print("The plot with the " .. sImprovementName .. " is being worked")
										bAddToCount = bCityIsWorkingPlot
										--print("The plot with the " .. sImprovementName .. " is being worked is by the correct city is " .. tostring(bCityIsWorkingPlot))
									else
										--print("The plot with the " .. sImprovementName .. " is not being worked")
										if SettingsData.MustBeWorked then
											--print("The plot with the " .. sImprovementName .. " must be worked to be counted")
											--print("The plot with the " .. sImprovementName .. " is NOT being worked so cannot be counted")
											bAddToCount = false
										else
											if SettingsData.CountSameTileOnlyOnce then
												--print("The plot with the " .. sImprovementName .. " can only be counted once")
												for i,PlotData in pairs(tTableAlreadyCountedPlots) do
													if (PlotData.X == iPlotX) and (PlotData.Y == iPlotY) then
														--print("The plot with the " .. sImprovementName .. " has already been counted")
														bAddToCount = false
														break
													end
												end
											end
										end
									end
								end
								if bAddToCount then
									bPlotHasBeenCountedAtLeastOnce = true
									--print("The plot with the " .. sImprovementName .. " should be counted")
									tNumberCityLocalImprovements[iImprovementType][BuildingID][iResourceType][DummyBuilding] = tNumberCityLocalImprovements[iImprovementType][BuildingID][iResourceType][DummyBuilding] + 1
									--print("Before adjustment for LimitPerCity the " .. sImprovementName .. " total plots count for " .. sBuildingName .. " is " .. tNumberCityLocalImprovements[iImprovementType][BuildingID][iResourceType][DummyBuilding])
									if (SettingsData.LimitPerCity > 0) then
										if tNumberCityLocalImprovements[iImprovementType][BuildingID][iResourceType][DummyBuilding] > SettingsData.LimitPerCity then
											tNumberCityLocalImprovements[iImprovementType][BuildingID][iResourceType][DummyBuilding] = SettingsData.LimitPerCity
										end
									end
									--print("After adjustment for LimitPerCity the " .. sImprovementName .. " total plots count for " .. sBuildingName .. " is " .. tNumberCityLocalImprovements[iImprovementType][BuildingID][iResourceType][DummyBuilding])
								end
							end
						end
					end
				end
				if bPlotHasBeenCountedAtLeastOnce then
					table.insert(tTableAlreadyCountedPlots, {X=iPlotX,Y=iPlotY})
				end
			end
		end
	end
	for BuildingID,BuildingDataTable in pairs(tCityImprovementEffectUnlockerBuildings) do
		local sBuildingIDName = Locale.ConvertTextKey(GameInfo.Buildings[BuildingID].Description)
		if IsBuildingCorrectForPlayer(iPlayer, BuildingID) then
			--print("Processing Dummy Buildings to be added for Primary Building " .. sBuildingIDName)
			local tDummyQuantitiesToSet = {}
			for Item,CounterData in pairs(BuildingDataTable.Counters) do
				local DummyBuilding = (CounterData.DummyBuilding or -1)
				local PlotsPerEffect = (CounterData.PlotsPerEffect or 1)
				local iImprovementType = CounterData.ImprovementType
				local iResourceType = (CounterData.ResourceType or -1)
				if not tDummyQuantitiesToSet[DummyBuilding] then
					tDummyQuantitiesToSet[DummyBuilding] = 0
				end
				if PlotsPerEffect ~= 1 then
					tNumberCityLocalImprovements[iImprovementType][BuildingID][iResourceType][DummyBuilding] = math.floor(tNumberCityLocalImprovements[iImprovementType][BuildingID][iResourceType][DummyBuilding]/PlotsPerEffect)
				end
				tDummyQuantitiesToSet[DummyBuilding] = tDummyQuantitiesToSet[DummyBuilding] + tNumberCityLocalImprovements[iImprovementType][BuildingID][iResourceType][DummyBuilding]
			end
			----------------------------------------------------------------------------------------------------------------------------------------------------------------
			--the following is for Debug purposes only
			--for DummyBuildingNeeded,QuantityToSet in pairs(tDummyQuantitiesToSet) do
				--if type(DummyBuildingNeeded) == "number" then
					--print("....." .. Locale.ConvertTextKey(GameInfo.Buildings[DummyBuildingNeeded].Description) .. " has a quantity to set value of " .. QuantityToSet)
				--elseif type(DummyBuildingNeeded) == "string" then
					--print("....." .. DummyBuildingNeeded .. " has a quantity to set value of " .. QuantityToSet)
				--else --print(".....Invalid Data for DummyBuildingNeeded in table tDummyQuantitiesToSet:" .. tostring(DummyBuildingNeeded))
				--end
			--end
			----------------------------------------------------------------------------------------------------------------------------------------------------------------
			if BuildingDataTable.SpecialHandling == "NONE" then
				for DummyBuildingNeeded,QuantityToSet in pairs(tDummyQuantitiesToSet) do
					if pCity:IsHasBuilding(BuildingID) then
						pCity:SetNumRealBuilding(DummyBuildingNeeded, QuantityToSet)
					else
						pCity:SetNumRealBuilding(DummyBuildingNeeded, 0)
					end
				end
			else	--this is where we do special handling
				BuildingDataTable.SpecialHandling(BuildingID, tDummyQuantitiesToSet, pCity, iPlayer)
			end
		else
			--print("No processing of Dummy Buildings for Primary Building " .. sBuildingIDName .. " is needed because " .. sBuildingIDName .. " is not cirrect for the current player")
		end
	end
	return tTableAlreadyCountedPlots
end

------------------------------------------------------------
---- CityContructedBuilding Game Event
------------------------------------------------------------
function CityConstructedBuilding(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if bGold or bFaithOrCulture then
		if tCityImprovementEffectUnlockerBuildings[buildingType] then
			local pPlayer = Players[ownerId]
			if bDoNotApplyToMinorCivs and pPlayer:IsMinorCiv() then
				return
			end
			if bRequiresSpecificCiv then
				if pPlayer:GetCivilizationType() ~= iSpecificRequiredCiv then
					return
				end
			end 
			local pCity = pPlayer:GetCityByID(cityId);
			local tAlreadyCountedPlots = {}
			tAlreadyCountedPlots = CountCityImprovementsAndImplementEffectsForCity(pCity, ownerId, tAlreadyCountedPlots)
		end
	end
end

------------------------------------------------------------
---- PlayerDoTurn Game Event
------------------------------------------------------------
function InspectPlayerCityImprovementsAndImplementBuildingEffects(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsBarbarian() then
		return
	end
	if bDoNotApplyToMinorCivs and pPlayer:IsMinorCiv() then
		return
	end
	if bRequiresSpecificCiv then
		if pPlayer:GetCivilizationType() ~= iSpecificRequiredCiv then
			return
		end
	end
	local tAlreadyCountedPlots = {}
	for pCity in pPlayer:Cities() do
		tAlreadyCountedPlots = CountCityImprovementsAndImplementEffectsForCity(pCity, iPlayer, tAlreadyCountedPlots)
	end
end
------------------------------------------------------------
---- WilliamHoward's IsCivInPlay
------------------------------------------------------------

function IsCivInPlay(iCivType)
  for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
    local iSlotStatus = PreGame.GetSlotStatus(iSlot)
    if (iSlotStatus == SlotStatus.SS_TAKEN or iSlotStatus == SlotStatus.SS_COMPUTER) then
      if (PreGame.GetCivilization(iSlot) == iCivType) then
        return true
      end
    end
  end
  
  return false
end
------------------------------------------------------------
---- Game Event Hooks
------------------------------------------------------------
if not bDataIsIrreconcilable then
	if bRequiresSpecificCiv then
		if IsCivInPlay(iSpecificRequiredCiv) then
			GameEvents.PlayerDoTurn.Add(InspectPlayerCityImprovementsAndImplementBuildingEffects)
			GameEvents.CityConstructed.Add(CityConstructedBuilding)
		end
	else
		GameEvents.PlayerDoTurn.Add(InspectPlayerCityImprovementsAndImplementBuildingEffects)
		GameEvents.CityConstructed.Add(CityConstructedBuilding)
	end
end



------------------------------------------------------------
---- Loading Confirmation Print Statements
------------------------------------------------------------

if not bDataIsIrreconcilable then
	print("CityBuildingsToNearbyImprovementsHandler.lua loaded successfully")
else
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("CityBuildingsToNearbyImprovementsHandler.lua loaded without lua syntax-errors, but:")
	print("  1)......there were irreconcilable errors or conflicts in the construction of user configurable table tRealBuildingData")
	print("  2)......these errors must be resolved before the code will be allowed to run")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
end



