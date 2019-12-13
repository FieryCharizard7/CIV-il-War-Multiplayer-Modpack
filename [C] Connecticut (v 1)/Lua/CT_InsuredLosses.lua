-- CT_InsuredLosses
-- Author: calcul8or
-- DateCreated: 6/17/2016 4:34:30 AM
--------------------------------------------------------------

print("CT_InsuredLosses loaded. There was much rejoicing.");

function PolicyOpener(player)
	--print("Thanks to JFD for this script")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALC_CONNECTICUT"] then
			GameEvents.PlayerDoTurn.Add(PillageCheck)
			--GameEvents.PlayerDoTurn.Add(TradeProdBonus)
			GameEvents.UnitKilledInCombat.Add(InsuredUnits)
			--if not player:HasPolicy(GameInfoTypes["POLICY_CT_TRAIT"]) then
				--player:SetPolicyBranchUnlocked(GameInfoTypes["POLICY_BRANCH_PIETY"], true)
			--	player:SetNumFreePolicies(1)
			--	player:SetNumFreePolicies(0)
			--	player:SetHasPolicy(GameInfoTypes["POLICY_CT_TRAIT"], true)	
			--end
		end
	end 
end
Events.SequenceGameInitComplete.Add(PolicyOpener)

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
-- TradeProdBonus
--------------------------------------------------------------------------------------------------------------------

function TradeProdBonus(playerID)
	local pPlayer = Players[playerID]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALC_CONNECTICUT"]) then
		for city in pPlayer:Cities() do
			if city:IsProductionUnit() then
				if (city:GetProductionUnit() == GameInfoTypes.UNIT_CARGO_SHIP or city:GetProductionUnit() == GameInfoTypes.UNIT_CARAVAN) then
					--print("Found a city producing a trade unit")
					local productionTurnsLeft = city:GetProductionTurnsLeft();
					--print("Turns left = " .. productionTurnsLeft);
					local ProdAmtTimes100 = city:GetCurrentProductionDifferenceTimes100(false, false)
					--print("ProdAmtTimes100 = " .. ProdAmtTimes100);
					local ProdMod = math.floor(ProdAmtTimes100/30)
					--print("ProdMod = " .. ProdMod);
					local ProdModDiv10 = math.ceil(ProdMod/10)
					--print("ProdModDiv10 / 10 = " .. ProdModDiv10);
					local ProdChange = math.max(1, ProdModDiv10)
					--print("ProdChange = " .. ProdChange);
					city:ChangeProduction(ProdChange)
				end
			end
		end
	end
end

--------------------------------------------------------------------------------------------------------------------
-- Insured Units
--------------------------------------------------------------------------------------------------------------------

function InsuredUnits(killerID, killedID, killedUnitType)
	print("killerID is " .. killerID .. " killedID is " .. killedID .. " killedUnitType is " .. killedUnitType);
	local pPlayer = Players[killedID]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALC_CONNECTICUT"]) then
		if (killerID >= 0) then
			local CapCity = pPlayer:GetCapitalCity();
			if (CapCity:IsHasBuilding(GameInfoTypes.BUILDING_CT_INS_CO)) then
				print("We have CT and Ins Co.");
				local cost = math.floor(CapCity:GetUnitPurchaseCost(killedUnitType) / 2)
				pPlayer:ChangeGold(cost)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("Your Insurance Companies have reimbursed you for a lost unit, giving you {1_Gold} Gold", cost))
			end
		end
	end
end