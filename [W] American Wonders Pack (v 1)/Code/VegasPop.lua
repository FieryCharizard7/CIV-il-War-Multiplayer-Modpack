-- InmigrationScripts
-- Author: Leugi
-- DateCreated: 3/31/2014 8:18:33 PM
--------------------------------------------------------------

local VivaVegas = "BUILDING_LASVEGASSTRIP"
local VegasDone = "BUILDING_VEGASDUMMY"


function VegasBoom (iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then

			for pCity in pPlayer:Cities() do
				local IsLasVegas = pCity:GetNumBuilding(GameInfoTypes["" .. VivaVegas .. ""])
				local IsVegasDone = pCity:GetNumBuilding(GameInfoTypes["" .. VegasDone .. ""])
				if IsLasVegas == 1 and IsVegasDone == 0 then
					local CityPops = pCity:GetPopulation();
					local NewCitizens = CityPops + 2
					pCity:SetPopulation(NewCitizens, true);
					pCity:SetNumRealBuilding(GameInfoTypes["" .. VegasDone .. ""], 1)
				end
			end

	end
end

GameEvents.PlayerDoTurn.Add(VegasBoom);