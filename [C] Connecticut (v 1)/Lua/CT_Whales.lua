-- CT_Whales
-- Author: calcul8or
-- DateCreated: 6/11/2016 9:43:41 AM
--------------------------------------------------------------
print("CT_Whales has loaded. There was much rejoicing");

local WhaleRes = GameInfoTypes.RESOURCE_WHALE
--local bFirst = true

function CT_whales(iPlayer, iX, iY, iImprovement)
	
	if (iImprovement == GameInfoTypes.IMPROVEMENT_WHALE_SITE) then
		local pPlayer = Players[iPlayer]
		print("Got the Improvement");
		--print("bFirst: " .. tostring(bFirst))
		local pPlot = Map.GetPlot(iX, iY);
		ChangeResource(pPlot, WhaleRes, 1, iImprovement)
		for i = 0, pPlot:GetNumUnits(), 1 do
			local PlotUnit = pPlot:GetUnit(i)
			if (PlotUnit and PlotUnit:GetUnitType() == GameInfoTypes.UNIT_CT_WHALER and PlotUnit:IsHasPromotion(GameInfoTypes.PROMOTION_BUILD_WHALE_SITE)) then
				--bFirst = false
				print("Right unit, right promo")
				PlotUnit:SetHasPromotion(GameInfoTypes.PROMOTION_BUILD_WHALE_SITE, false)
				local NewUnit = pPlayer:InitUnit(GameInfoTypes.UNIT_CT_WHALER_NOBUILD, iX, iY, UNITAI_EXPLORE_SEA)
				NewUnit:Convert(PlotUnit)
				--NewUnit:SetHasPromotion(GameInfoTypes.PROMOTION_BUILD_WHALE_SITE, false)
				local MovesLeft = NewUnit:GetMoves()
				NewUnit:ChangeMoves(-MovesLeft)
				if not NewUnit:IsHasPromotion(GameInfoTypes.PROMOTION_EXTRA_SIGHT_I) then
					NewUnit:SetHasPromotion(GameInfoTypes.PROMOTION_EXTRA_SIGHT_I, true)
				end
			end
		end
	end
	--bFirst = true
end

GameEvents.BuildFinished.Add(CT_whales)

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
    pPlot:SetResourceType(iResource, iCount)
    pPlot:SetImprovementType(iImprovement)
  end
end