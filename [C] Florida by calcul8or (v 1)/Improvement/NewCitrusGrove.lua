-- NewCitrusGrove
-- Author: calcul8or
-- DateCreated: 6/11/2016 9:43:41 AM
--------------------------------------------------------------
print("NewCitrusGrove has loaded. There was much rejoicing");

local CitrusRes = GameInfoTypes.RESOURCE_CITRUS
--local bFirst = true

function CitrusGrove(iPlayer, iX, iY, iImprovement)
	--print("Build finished for " .. iPlayer .. " and improvement " .. iImprovement)
	if (iImprovement == GameInfoTypes.IMPROVEMENT_CITRUSGROVE) then
		local pPlayer = Players[iPlayer]
		local iPlantation = GameInfoTypes.IMPROVEMENT_PLANTATION
		print("Got the Improvement");
		--print("bFirst: " .. tostring(bFirst))
		local pPlot = Map.GetPlot(iX, iY);
		ChangeResource(pPlot, CitrusRes, 1, iPlantation)
	end
end

GameEvents.BuildFinished.Add(CitrusGrove)

function ChangeResource(pPlot, iResource, iCount, iImprovement)
	print("Moved to ChangeResource");
  local iOwner = pPlot:GetOwner()
  if (iOwner ~= -1) then
     local pCity = pPlot:GetWorkingCity()
     local bWorking = false
     local bForced = false
  
     if (pCity ~= nil) then
        bWorking = pCity:IsWorkingPlot(pPlot)
	    if (bWorking) then
	      bForced = pCity:IsForcedWorkingPlot(pPlot)
	      pCity:AlterWorkingPlot(pCity:GetCityPlotIndex(pPlot))
	   end
     end

    pPlot:SetOwner(-1)
	pPlot:SetFeatureType(-1)
    pPlot:SetResourceType(iResource, iCount)
    pPlot:SetOwner(iOwner)
    pPlot:SetImprovementType(iImprovement)
  
    if (bWorking) then
      if (bForced) then
	    pCity:AlterWorkingPlot(pCity:GetCityPlotIndex(pPlot))
	  else
        Network.SendDoTask(pCity:GetID(), TaskTypes.TASK_CHANGE_WORKING_PLOT, 0)
	  end
    end
  else
    pPlot:SetFeatureType(-1)
    pPlot:SetResourceType(iResource, iCount)
    pPlot:SetImprovementType(iImprovement)
  end
end