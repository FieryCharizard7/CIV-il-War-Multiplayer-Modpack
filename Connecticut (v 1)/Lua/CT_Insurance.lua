-- CT_Insurance
-- Author: calcul8or
-- DateCreated: 6/11/2016 9:51:59 AM
--------------------------------------------------------------

print("CT_Insurance loaded. Yay.");

--------------------------------------------------------------------------------------------------------------------
-- Pillage Check
--------------------------------------------------------------------------------------------------------------------

function PillageCheck(PlayerID)
	local pPlayer = Players[PlayerID]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALC_CONNECTICUT"]) then
		print("CT turn")
		local NumFixed = 0
		for city in pPlayer:Cities() do
			--print("Checking CT city " .. city:GetName());
			for i = 0, city:GetNumCityPlots() - 1, 1 do
				local pPlot = city:GetCityIndexPlot(i)
				if (pPlot:IsImprovementPillaged()) then
					print("Pillaged! at " .. pPlot:GetX() .. "," .. pPlot:GetY());
					if city:IsHasBuilding(GameInfoTypes.BUILDING_CT_INS_CO) then
						local unitBool = false
						if (pPlot:GetNumUnits() > 0) then
							for k = 0, pPlot:GetNumUnits() - 1, 1 do
								local PlotUnit = pPlot:GetUnit(k)
								if PlotUnit:GetOwner() ~= PlayerID then
									unitBool = true
								end
							end
						end	
						
						if not unitBool then
							if (pPlayer:GetGold() > 25) then
								pPlot:SetImprovementPillaged(unitBool)
								pPlayer:ChangeGold(-25)
								NumFixed = NumFixed + 1
							end
						end
					end
				end
			end
		end
		if (pPlayer:IsHuman() and NumFixed > 0) then
			print("Sending message for " .. NumFixed .. " fixed tiles");
			cost = NumFixed * 25
			Events.GameplayAlertMessage(Locale.ConvertTextKey("Your Insurance Companies have repaired {1_Num} pillaged tiles, costing {2_Gold} Gold", NumFixed, cost)) 
		end
	end
end

--------------------------------------------------------------------------------------------------------------------
-- Insured Trade
--------------------------------------------------------------------------------------------------------------------

function InsuredTrade(iPlayer, iUnit, UnitTypeID, iX, iY, bDelay, iOtherPlayer)
	local pPlayer = Players[iPlayer]
	print("---------------------------------------------------------------");
	print("bDelay:  " .. tostring(bDelay) .. " UnitTypeID:  " .. UnitTypeID);
	print("iPlayer: " .. iPlayer .. "    iOtherPlayer: " .. iOtherPlayer);
	if bDelay then
		--if (iOtherPlayer > 0) then
			if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALC_CONNECTICUT"]) then
				if pPlayer:GetCapitalCity():IsHasBuilding(GameInfoTypes.BUILDING_CT_INS_CO) then
					print("We have CT and Ins Co.");
					if (UnitTypeID == GameInfoTypes.UNIT_CARAVAN or UnitTypeID == GameInfoTypes.UNIT_CARGO_SHIP) then
						print("Got a Caravan or Cargo Ship");
						local pPlot = Map.GetPlot(iX, iY)
						local bReplace = false
						if (pPlot:GetNumUnits() > 0) then
							for k = 0, pPlot:GetNumUnits() - 1, 1 do
								print("Checking plot units");
								local PlotUnit = pPlot:GetUnit(k)
								print("PlotUnit: " .. PlotUnit:GetName() .. " Owner: " .. PlotUnit:GetOwner());
								if PlotUnit:GetOwner() ~= iPlayer then
									bReplace = true
								end
							end
						end
						if bReplace then
							print("bReplace is true");
							ReplaceTrade(iPlayer, UnitTypeID)
						end
					end
				end
			end
		--end
	end
	print("---------------------------------------------------------------");
end

function ReplaceTrade(iPlayer, UnitTypeID)
	print("Moved to ReplaceTrade");
	local pPlayer = Players[iPlayer]
	local CapCity = pPlayer:GetCapitalCity();
	local cost = math.floor(CapCity:GetUnitPurchaseCost(UnitTypeID) / 2)
	if pPlayer:GetGold() > cost then
		pPlayer:InitUnit(UnitTypeID, CapCity:GetX(), CapCity:GetY()) --GameInfoTypes.UNITAI_TRADE_UNIT
		pPlayer:ChangeGold(-cost)
		if (pPlayer:IsHuman()) then
			print("Sending message for pillaged trade unit, cost is " .. cost);
			Events.GameplayAlertMessage(Locale.ConvertTextKey("Your Insurance Companies have replaced a pillaged trade units, costing {1_Gold} Gold", cost)) 
		end
	end
end

--[[
function FindClosestCity(iPlayer, iX, iY, bCoastal)
	local pPlayer = Players[iPlayer]
	local newCity = nil;
	local newCityDist = 100000000;
    for city in pPlayer:Cities() do
		local dist = Map.PlotDistance(city:GetX(), city:GetY(), iX, iY);
		print("Checking city " .. city:GetName());
		if bCoastal then
			if city:IsCoastal() then
				if dist < newCityDist then
					newCity = city;
					newCityDist = dist
					if city ~= nil then
						print("newCity is " .. city:GetName() .. " and distance is " .. dist);
					end
				end
			end
		else
			if dist < newCityDist then
				newCity = city;
				newCityDist = dist
				print("newCity is " .. city:GetName() .. " and distance is " .. dist);
			end
		end
    end
	if newCity == nil then
		newCity = pPlayer:GetCapitalCity()
	end
	return newCity;
end
]]--