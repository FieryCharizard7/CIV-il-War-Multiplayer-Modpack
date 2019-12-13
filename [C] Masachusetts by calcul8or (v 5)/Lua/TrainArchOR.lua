-- TrainArchOR
-- Author: calcul8or
-- DateCreated: 9/5/2016 7:55:19 AM
--------------------------------------------------------------

print("TrainArchOR loaded. Borrowed from JFD from the EE mod.");

local tUnitBuildingClassInCityORS = {}
for row in GameInfo.Unit_BuildingClassRequiredsOR() do
	if not tUnitBuildingClassInCityORS[GameInfoTypes[row.UnitType]] then
		tUnitBuildingClassInCityORS[GameInfoTypes[row.UnitType]] = { [GameInfoTypes[row.BuildingClassType]] = row.BuildingClassType }
	else
		tUnitBuildingClassInCityORS[GameInfoTypes[row.UnitType]][GameInfoTypes[row.BuildingClassType]] = row.BuildingClassType
	end
end
function JFD_Unit_BuildingClassRequiredsOR(playerID, cityID, unitID)
	if tUnitBuildingClassInCityORS[unitID] then
		local pCity = Players[playerID]:GetCityByID(cityID)
		for k,v in pairs(tUnitBuildingClassInCityORS[unitID]) do
			if HasBuildingClass(pCity, v) then
				return true
			end
		end
		return false
	end
	return true
end
GameEvents.CityCanTrain.Add(JFD_Unit_BuildingClassRequiredsOR)
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
