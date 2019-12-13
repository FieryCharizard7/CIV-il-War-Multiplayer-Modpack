-- KY_Corn
-- Author: calcul8or
-- DateCreated: 5/29/2016 7:24:56 AM
--------------------------------------------------------------
include("PlotIterators.lua")
print("KY Corn loaded");

--============================================================
-- Is Civ Active?
--============================================================
function IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == GameInfoTypes["CIVILIZATION_GENERIC_CIV"] then
				--print("Generic Civ is here");
				GameEvents.PlayerCityFounded.Add(KY_Corn)
			end
		end
	end
end

Events.SequenceGameInitComplete.Add(IsCivilisationActive)

--============================================================
-- Place corn
--============================================================

function KY_Corn(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(iCityX, iCityY)
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CALC_KENTUCKY) then
		print("Kentucky City");
		local CornCount = 0
		for loopPlot in PlotAreaSpiralIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if (loopPlot:GetResourceType() == GameInfoTypes.RESOURCE_WHEAT) then
				print("Converting Wheat to Corn");
				loopPlot:SetResourceType(-1)
				loopPlot:SetResourceType(GameInfoTypes.RESOURCE_KY_CORN)
				CornCount = CornCount + 1
			end
		end
		if (CornCount == 0) then
			for loopPlot in PlotAreaSpiralIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if (loopPlot:GetTerrainType() == GameInfoTypes.TERRAIN_GRASS or loopPlot:GetTerrainType() == GameInfoTypes.TERRAIN_PLAINS) then
					if (loopPlot:GetResourceType() == -1 and CornCount < 2) then
						if (loopPlot:IsFlatlands() and loopPlot:GetFeatureType() == -1) then
							if (loopPlot:GetOwner() == -1 or loopPlot:GetOwner() == iPlayer) then
								print("Placing some Corn");
								loopPlot:SetResourceType(GameInfoTypes.RESOURCE_KY_CORN)
								CornCount = CornCount + 1
							end
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerCityFounded.Add(KY_Corn)
