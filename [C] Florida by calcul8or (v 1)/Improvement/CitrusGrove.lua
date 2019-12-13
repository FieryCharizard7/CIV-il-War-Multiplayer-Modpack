-- CitrusGrove
-- Author: calcul8or
-- DateCreated: 1/17/2016 8:52:05 AM
--------------------------------------------------------------
print("CitrusGrove loaded")

function CitrusGrove(playerID, plotX, plotY, improvementID)
	--print("Build completed")
	local pPlayer = Players[playerID];
	local iGrove = GameInfoTypes["IMPROVEMENT_CITRUSGROVE"];
	local iPlantation = GameInfoTypes["IMPROVEMENT_PLANTATION"];
	if (pPlayer:IsAlive() and improvementID == iGrove) then
		local iCitrus = GameInfoTypes["RESOURCE_CITRUS"]
		print("Found a Citrus Grove")
		local plot = Map.GetPlot(plotX, plotY)
		plot:SetResourceType(iCitrus, 1)
		plot:SetImprovementType(-1);
		--plot:SetImprovementType(iPlantation);
		plot:SetFeatureType(-1)
		--plot:ChangeNumResource(1)
	--elseif (improvementID == nil or improvementID <= 0) then
		--print("Improvement is nil")
	end
end

GameEvents.BuildFinished.Add(CitrusGrove)