local tBuildingClassInCityORS = {}
for row in GameInfo.Building_ClassesNeededInCityOR() do
	if not tBuildingClassInCityORS[GameInfoTypes[row.BuildingType]] then
		tBuildingClassInCityORS[GameInfoTypes[row.BuildingType]] = { [GameInfoTypes[row.BuildingClassType]] = row.BuildingClassType }
	else
		tBuildingClassInCityORS[GameInfoTypes[row.BuildingType]][GameInfoTypes[row.BuildingClassType]] = row.BuildingClassType
	end
end
function JFD_Building_ClassesNeededInCityOR(playerID, cityID, buildingID)
	if tBuildingClassInCityORS[buildingID] then
		local pCity = Players[playerID]:GetCityByID(cityID)
		for k,v in pairs(tBuildingClassInCityORS[buildingID]) do
			if HasBuildingClass(pCity, v) then
				return true
			end
		end
		return false
	end
	return true
end
GameEvents.CityCanConstruct.Add(JFD_Building_ClassesNeededInCityOR)
--------------------------------------------------------------------------------------------
---- Whoward69' BuildingClass in a city check
--------------------------------------------------------------------------------------------

function HasBuildingClass(pCity, sBuildingClass)
  for building in GameInfo.Buildings("BuildingClass='" .. sBuildingClass .. "'") do
    if (pCity:IsHasBuilding(building.ID)) then
      return true
    end
  end
  
  return false
end

--------------------------------------------------------------------------------------------
---- Oxford check
--------------------------------------------------------------------------------------------
local uni1  = GameInfoTypes["BUILDING_AGRI_UNIVERSITY"]
local uni2  = GameInfoTypes["BUILDING_MILITARY_UNIVERSITY"]
local uni3  = GameInfoTypes["BUILDING_RESEARCH_UNIVERSITY"]
local uni4  = GameInfoTypes["BUILDING_ENGINEERING_UNIVERSITY"]
local uni5  = GameInfoTypes["BUILDING_ARTS_UNIVERSITY"]
local uni6  = GameInfoTypes["BUILDING_BUSINESS_UNIVERSITY"]
local uni7  = GameInfoTypes["BUILDING_RELIGIOUS_UNIVERSITY"]

function JFD_Building_ClassesPrereqOR(playerID, cityID, buildingID)
	local pPlayer = Players[playerID]
	if buildingID == GameInfoTypes["BUILDING_OXFORD_UNIVERSITY"] then
		if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MASSACHUSETTS"]) then
			--local pCity = Players[playerID]:GetCityByID(cityID)
			print("Got Massachusetts Oxford");
			local bOxford = true
			for city in pPlayer:Cities() do
				print("City is " .. city:GetName() .. " bOxford is " .. tostring(bOxford));
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
			--[[
			local bOxford = true
			for city in pPlayer:Cities() do
				print("Checking " .. city:GetName() .. " bOxford is " .. tostring(bOxford));
				for k,v in pairs(tBuildingClassInCityORS[buildingID]) do
					if (HasBuildingClass(city, v) and bOxford) then
						bOxford = true
					else bOxford = false
					end
				end
			end
			]]--
			print("Final is " .. tostring(bOxford));
			return bOxford
		
		elseif (pPlayer:IsAlive() and pPlayer:GetCapitalCity() ~= nil) then
			print("Got other player Oxford");
			local bOtherOxford = true
			for pCity in pPlayer:Cities() do
				if (pCity:IsHasBuilding(GameInfoTypes["BUILDING_UNIVERSITY"]) and bOtherOxford) then
					bOtherOxford = true
				else bOtherOxford = false
				end
			end
			print("Player is " .. pPlayer:GetName() .. " bOtherOxford is " .. tostring(bOtherOxford));
			return bOtherOxford
		else return true
		end

	else return true
	end
end
GameEvents.CityCanConstruct.Add(JFD_Building_ClassesPrereqOR)


function OxfordListener(iPlayer, iCity, iBuilding, bGold, bFaithOrCulture)
	if iBuilding == GameInfoTypes["BUILDING_OXFORD_UNIVERSITY"] then
		print("Oxford constructed by " .. Players[iPlayer]:GetName());
	end
end

GameEvents.CityConstructed.Add(OxfordListener)