-- TX_Trait
-- Author: calcul8or
-- DateCreated: 11/21/2015 8:24:32 PM
--------------------------------------------------------------
include("PlotIterators.lua")
print("TX_Trait loaded")


local civilisationID	= GameInfoTypes["CIVILIZATION_CALCTEXAS"]
local CattleID			= GameInfoTypes["RESOURCE_COW"]
local HorseID			= GameInfoTypes["RESOURCE_HORSE"]
local improvementID		= GameInfoTypes["IMPROVEMENT_PASTURE"]
local cowboyTech		= GameInfoTypes["TECH_MILITARY_SCIENCE"]
local cowboy			= GameInfoTypes["UNIT_CALC_COWBOY"]
local happyBldg			= GameInfoTypes["BUILDING_TXHAPPY"]

--------------------------------------------------------------
-- Improving Cattle, Horses at city founding
--------------------------------------------------------------
function TXCattle(iPlayer, cityX, cityY)
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(cityX, cityY)
	local city = pPlot:GetPlotCity();
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilisationID) then
		print("Texas City");
		for loopPlot in PlotAreaSpiralIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if (loopPlot:GetOwner() == -1 or loopPlot:GetOwner() == iPlayer) then
				--print("Unclaimed territory");
				if (loopPlot:GetResourceType() == CattleID or loopPlot:GetResourceType() == HorseID) then
					print("We've got horses or cattle");
					loopPlot:SetImprovementType(improvementID);
					loopPlot:SetOwner(pPlayer:GetID(), city, true, true);
				end
			end
		end
	end
end

GameEvents.PlayerCityFounded.Add(TXCattle)

--------------------------------------------------------------
-- Cowboy functions
--------------------------------------------------------------

function CowboyFunctions(playerID)
	local pPlayer = Players[playerID]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilisationID) then
		--print("We've got Texas");
		for unit in pPlayer:Units() do
			if (unit:GetUnitType() == cowboy) then
				--print("Found a Cowboy");
				local unitPlot = unit:GetPlot();
				if unitPlot:GetOwner() == playerID then
					--print("Cowboy's home");
					unit:ChangeMoves(60)
				end
			end
		end
		--print("Checking cities");
		--[[
		for i = 0, pPlayer:GetNumCities() - 1, 1 do
			local iCity = pPlayer:GetCityByID(i);
			local cityX = iCity:GetX();
			local cityY = iCity:GetY();
			local plot = Map.GetPlot(iCity:GetX(), iCity:GetY());
			local numUnits = plot:GetNumUnits();
			local plotUnit = iCity:GetGarrisonedUnit();
			if (plotUnit ~= nil and plotUnit:GetUnitType() == cowboy) then
				iCity:SetNumRealBuilding(happyBldg, 1)
				print("Cowboy is garrisoned");
			else
				--print("No cowboy here");
				iCity:SetNumRealBuilding(happyBldg, 0)
			end
		end
		]]--

		for city in pPlayer:Cities() do
			local cityPlot = city:Plot();
			local plotUnit = city:GetGarrisonedUnit();
			--print("Checking cities");
			if (cityPlot and plotUnit ~= nil) then
				if (plotUnit:GetUnitType() == cowboy) then
					city:SetNumRealBuilding(happyBldg, 1)
					print("Cowboy is garrisoned");
				else
					--print("No cowboy here");
					city:SetNumRealBuilding(happyBldg, 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(CowboyFunctions)


--[[
function CowboyGarrison(iPlayer, iUnitID, iX, iY)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilisationID) then
		print("Texas unit")
		local iUnitType = iUnitID:GetUnitType();
		if (iUnitType == cowboy) then
			print("Texas Cowboy")
			local city = iUnitID:GetGarrisonedCity();
			if (city ~= nil) then
				print("Cowboy is garrisoned");
				iCity:SetNumRealBuilding(happyBldg, 1)
			end
		end
	end
end

GameEvents.UnitSetXY.Add(CowboyGarrison)
]]--