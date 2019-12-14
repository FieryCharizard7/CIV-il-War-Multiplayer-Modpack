-- IA_functions
-- Author: calcul8or
-- DateCreated: 6/19/2016 2:11:05 PM
--------------------------------------------------------------
print("IA_functions loaded. Good job");

local civilisationID = GameInfoTypes["CIVILIZATION_CALC_IOWA"]

function IowaCheck(player)
	--print("Thanks to JFD for this script")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == civilisationID then
			GameEvents.PlayerDoTurn.Add(IA_ImprovementCheck)
			GameEvents.PlayerDoTurn.Add(IA_TradeBoost)
		end
	end 
end
Events.SequenceGameInitComplete.Add(IowaCheck)
-------------------------------------------------------------------------------------
-- Improvement Check
-------------------------------------------------------------------------------------
function IA_ImprovementCheck(playerID)
	local pPlayer = Players[playerID]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilisationID) then
		--print("Iowa IA_ImprovementCheck");
		for city in pPlayer:Cities() do
			local iCounter = 0
			for i = 0, city:GetNumCityPlots() - 1, 1 do
				local plot = city:GetCityIndexPlot(i)
				if (plot and plot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_IA_GREAT_FARM) then
					iCounter = iCounter + 1
				end
			end
			--print("City: " .. city:GetName()) -- .. " iCounter: " .. iCounter
			if iCounter > 1 then iCounter = 1 end
			--print("Setting building")
			city:SetNumRealBuilding(GameInfoTypes.BUILDING_IA_MARKER, iCounter)
		end
	end
end
-------------------------------------------------------------------------------------
-- Trade route influence boost
-------------------------------------------------------------------------------------
function IA_TradeBoost(PlayerID)
	local pPlayer = Players[PlayerID]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilisationID) then
		--print("Iowa TradeBoost");
		local Routes = pPlayer:GetTradeRoutes();
		local NumRoutes = pPlayer:GetNumInternationalTradeRoutesUsed()
		if (NumRoutes > 0) then
			--print("Number of International Trade Routes is " .. NumRoutes .. ".")
			--remove city for... loop; change line 70 from city to OrigCity
			--for city in pPlayer:Cities() do
			--	local iCounter = 0;
			--	local cityID = city:GetID();
			--	print("Current city is " .. city:GetName() .. " iCounter is " .. iCounter .. ".");
				for tradeRouteID, tradeRoute in ipairs(Routes) do
					local OrigCity = tradeRoute.FromCity
					local OrigCityID = OrigCity:GetID();
					local DestCity = tradeRoute.ToCity
					local DestPlayer = DestCity:GetOwner()
					local dPlayer = Players[DestPlayer]
					--print("OrigCity is " .. OrigCity:GetName() .. "DestPlayer is " .. DestPlayer .. ", " .. dPlayer:GetName() .. ".");
					if dPlayer:IsMinorCiv() then
						--print("Route to minor civ " .. dPlayer:GetName())
						--if (dPlayer ~= pPlayer) then
						--if (cityID == OrigCityID) then
						--add check for improvement or building marking improvement
						if OrigCity:IsHasBuilding(GameInfoTypes.BUILDING_IA_MARKER) then
							--print("Changing friendship");
							dPlayer:ChangeMinorCivFriendshipWithMajor(pPlayer, 1)
						end
					end
				--end
			end
		end
	end
end
