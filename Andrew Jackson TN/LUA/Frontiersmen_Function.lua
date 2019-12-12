-- Mayor S
-- Frontiersmen_Function

function frontiersmanCityState(player)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_TENNESSEE then
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == GameInfoTypes.UNIT_JACKSON_FRONTIERSMAN then
			print("Got Frontiersman")
				if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_FRONTIERS_CITY_STATE) then
					local pPlot = pUnit:GetPlot()
					print("Got Plot")
					local pCS = Players[pPlot:GetOwner()]
						if pCS ~= pPlayer then
							if pCS:IsMinorCiv() then
								print("Got CityState")
								if pCS:GetMinorCivTrait() == MinorCivTraitTypes.MINOR_CIV_TRAIT_CULTURED then
								print("Got Culture CityState")
									local name = pUnit:GetName()
									print("May create a Great Work of Art")
									local face = pUnit:GetFacingDirection()
									print("About to spawn Great Artist Frontiersman!")
									local nUnit = pPlayer:InitUnit(GameInfoTypes.UNIT_JACKSON_FRONTIERSMAN_GA, pPlot:GetX(), pPlot:GetY(), UNITAI_FAST_ATTACK, face)
									nUnit:Convert(pUnit)
									nUnit:SetName(name)
									nUnit:SetHasPromotion(GameInfoTypes.PROMOTION_FRONTIERS_CITY_STATE, false)
								elseif pCS:GetMinorCivTrait() == MinorCivTraitTypes.MINOR_CIV_TRAIT_MILITARISTIC then
								print("Got Militaristic CityState")
									print("+10 Combat Point when near death")
									pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_NEAR_DEATH, true)
									pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_FRONTIERS_CITY_STATE, false)
								elseif pCS:GetMinorCivTrait() == MinorCivTraitTypes.MINOR_CIV_TRAIT_MARITIME then
								print("Got Maritime CityState")
									print("Marine promotion")
									pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_ALLWATER_EMBARKATION, true)
									pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_DEFENSIVE_EMBARKATION, true)
									pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_FRONTIERS_CITY_STATE, false)
								elseif pCS:GetMinorCivTrait() == MinorCivTraitTypes.MINOR_CIV_TRAIT_MERCANTILE then
								print("Got Mercantile CityState")
									print("This Unit can earn City State Influence by standing in its land.")
									pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CITY_STATE_LOVE, true)
									pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_FRONTIERS_CITY_STATE, false)
								elseif pCS:GetMinorCivTrait() == MinorCivTraitTypes.MINOR_CIV_TRAIT_RELIGIOUS then
								print("Got Religious CityState")
									print("May create a Great Work of Art")
									local name = pUnit:GetName()
									print("May create a Great Work of Art")
									local face = pUnit:GetFacingDirection()
									print("About to spawn Great Artist Frontiersman!")
									local nUnit = pPlayer:InitUnit(GameInfoTypes.UNIT_JACKSON_FRONTIERSMAN_GA, pPlot:GetX(), pPlot:GetY(), UNITAI_FAST_ATTACK, face)
									nUnit:Convert(pUnit)
									nUnit:SetName(name)
									nUnit:SetHasPromotion(GameInfoTypes.PROMOTION_FRONTIERS_CITY_STATE, false)
								end
							end
						end
					end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(frontiersmanCityState)

function FrontiersNearDeath(player)
	local pPlayer = Players[player]
	for unit in pPlayer:Units() do
		if unit:IsHasPromotion(GameInfoTypes.PROMOTION_NEAR_DEATH) then
			if unit:GetCurrHitPoints() < 51 then
				unit:SetHasPromotion(GameInfoTypes.PROMOTION_NEAR_DEATH_TRUE, true)
			else
				unit:SetHasPromotion(GameInfoTypes.PROMOTION_NEAR_DEATH_TRUE, false)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(FrontiersNearDeath)


function frontiersmanCityStateLove(player)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_TENNESSEE then
		for pUnit in pPlayer:Units() do
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CITY_STATE_LOVE) then
				local pPlot = pUnit:GetPlot()
				print("Got Plot")
				local pCS = Players[pPlot:GetOwner()]
				if pCS ~= pPlayer then
					if pCS:IsMinorCiv() then
						print("Got CityState")
						pCS:ChangeMinorCivFriendshipWithMajor(pPlayer, 5)
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(frontiersmanCityStateLove)

--gListofFrontiersNames = {}
--
--gListofFrontiersNames[0] = "Boonesborough"
--gListofFrontiersNames[1] = "Detroit"
--gListofFrontiersNames[2] = "Austin"
--gListofFrontiersNames[3] = "Knoxville"
--gListofFrontiersNames[4] = "Houston"
--gListofFrontiersNames[5] = "Dallas"
--gListofFrontiersNames[6] = "San Francisco"
--gListofFrontiersNames[7] = "Laramie"
--gListofFrontiersNames[8] = "Kearny"
--gListofFrontiersNames[9] = "Dodge City"
--gListofFrontiersNames[10] = "St. Joseph"
--gListofFrontiersNames[11] = "Fort Worth"
--gListofFrontiersNames[12] = "Chattanooga"
--gListofFrontiersNames[13] = "Murfreesboro"
--gListofFrontiersNames[14] = "Bartlett"
--gListofFrontiersNames[15] = "Nashville"
--gListofFrontiersNames[16] = "Owensboro"
--gListofFrontiersNames[17] = "Hopkinsville"
--gListofFrontiersNames[18] = "Elizabethtown"
--gListofFrontiersNames[19] = "Omaha"
--gListofFrontiersNames[20] = "Spokane"
--gListofFrontiersNames[21] = "Caspar"
--gListofFrontiersNames[22] = "Abilene"
--gListofFrontiersNames[23] = "Beatrice"
--gListofFrontiersNames[24] = "Deadwood"
--gListofFrontiersNames[25] = "Cripple Creek"
--gListofFrontiersNames[26] = "Sheridan"
--gListofFrontiersNames[27] = "Deseret"
--gListofFrontiersNames[28] = "Bannack"
--gListofFrontiersNames[29] = "Walla Walla"



--function frontiersCity (player, x, y)
--	local pPlayer = Players[player]
--	local pPlot = Map.GetPlot(x, y)
--	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_TENNESSEE then
--		local happiness = pPlayer:GetHappiness()
--		if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FRONTIERS_FORT then
--			print("Got Fort")
--			if happiness > 0 then
--				local randNum = Game.Rand(2, "Random City")
--				if randNum == 1 or randNum == 0 then
--					print("About to spawn Settler!")
--					pPlayer:InitUnit(GameInfoTypes["UNIT_SETTLER"], pPlot:GetX(), pPlot:GetY()):PushMission(GameInfoTypes["MISSION_FOUND"])
--					local pCity = pPlot:GetPlotCity()
--					local randCity = Game.Rand(30, "")
--					pCity:SetName(gListofFrontiersNames[randCity], true)
--					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CIRCUS, 1)
--				end
--			end
--		end		
--	end
--end

--GameEvents.PlayerDoTurn.Add(frontiersCity)