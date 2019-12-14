-- MA_Bldgs
-- Author: calcul8or
-- DateCreated: 9/3/2016 2:35:46 PM
--------------------------------------------------------------

print("MA Buildings loaded. Yippee.");

local civID = GameInfoTypes["CIVILIZATION_MASSACHUSETTS"]
local uni1  = GameInfoTypes["BUILDING_AGRI_UNIVERSITY"]
local uni2  = GameInfoTypes["BUILDING_MILITARY_UNIVERSITY"]
local uni3  = GameInfoTypes["BUILDING_RESEARCH_UNIVERSITY"]
local uni4  = GameInfoTypes["BUILDING_ENGINEERING_UNIVERSITY"]
local uni5  = GameInfoTypes["BUILDING_ARTS_UNIVERSITY"]
local uni6  = GameInfoTypes["BUILDING_BUSINESS_UNIVERSITY"]
local uni7  = GameInfoTypes["BUILDING_RELIGIOUS_UNIVERSITY"]

--------------------------------------------------------------------------------------------------------
function IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civID then
				--print("Generic Civ is here");
				GameEvents.CityCanConstruct.Add(MA_Oxford)
			end
		end
	end
end
--------------------------------------------------------------------------------------------------------

Events.SequenceGameInitComplete.Add(IsCivilisationActive)

--------------------------------------------------------------------------------------------------------
--[[
function MA_unis(playerID, iCity, iBuilding)
	local pPlayer = Players[playerID]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civID) then
		--local pBuilding = GameInfo.Buildings["BUILDING_PUBLIC_SCHOOL"].ID
		if iBuilding == GameInfo.Buildings["BUILDING_PUBLIC_SCHOOL"].ID then
			local pCity = pPlayer:GetCityByID(iCity);
			if (pCity:IsHasBuilding(uni1) or
				pCity:IsHasBuilding(uni2) or
				pCity:IsHasBuilding(uni3) or
				pCity:IsHasBuilding(uni4) or
				pCity:IsHasBuilding(uni5) or
				pCity:IsHasBuilding(uni6) or
				pCity:IsHasBuilding(uni7) ) then
					return true
			else return false
			end
		end
	end
	else return true
end
]]--
--------------------------------------------------------------------------------------------------------
function MA_Oxford(playerID, iCity, iBuilding)
	local pPlayer = Players[playerID]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civID) then
		--print("Massachusetts, building is " .. iBuilding)
		if iBuilding == GameInfoTypes["BUILDING_MA_OXFORD"] then
			--print("Oxford")
			local bOxford = true
			for city in pPlayer:Cities() do
				--print("City is " .. city:GetName() .. " bOxford is " .. tostring(bOxford));
				if (city:IsHasBuilding(uni1) or
					city:IsHasBuilding(uni2) or
					city:IsHasBuilding(uni3) or
					city:IsHasBuilding(uni4) or
					city:IsHasBuilding(uni5) or
					city:IsHasBuilding(uni6) or
					city:IsHasBuilding(uni7) ) and bOxford then
						bOxford = true
				else bOxford = false
				end
			end
			--print("Final is " .. tostring(bOxford));
			return bOxford
		else return true
		end
	else return true
	end
end