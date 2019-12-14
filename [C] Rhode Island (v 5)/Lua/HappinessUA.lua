-- HappinessUA
-- Author: PawelS and calcul8or
-- DateCreated: 11/7/2014 8:39:30 PM
--------------------------------------------------------------

--Traits table assigned 400% more unhappiness from number of cities or 15 per city
function HappinessUA(PlayerID)

	--print("HappinessUAfunction Starting")
	--local pPlayer = Players[PlayerID]

	--if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_RHODEISLAND) then
		--local UnHap = pPlayer:GetUnhappinessFromCityCount()
		--print(string.format("Unhappy from cities: %s", UnHap))
		--local NumCities = pPlayer:GetNumCities()
		--print "Got RI, got UnHap, got NumCities"
		--local ModUnHap = ((NumCities*(NumCities + 1))/2)
		--print(string.format("ModUnHap is: %s", ModUnHap))
		--local UnHapAdj = math.ceil(((UnHap/100) - ModUnHap)/NumCities)
		--print(string.format("UnHapAdj is: %s", UnHapAdj))
		--pPlayer:ChangeExtraHappinessPerCity(UnHapAdj)
		--print ("Happiness adjusted")
	--end

	local pPlayer = Players[PlayerID]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_RHODEISLAND and pPlayer:IsAlive() and (not pPlayer:IsBarbarian ()) then

		local iOldValue = pPlayer:GetExtraHappinessPerCity ()
		local iCities = pPlayer:GetNumCities ()
		local iNewValue = 0

		if iCities < 15 then
			iNewValue = 16 - iCities
		end

		local iChange = iNewValue - iOldValue
		if iChange ~= 0 then
			pPlayer:ChangeExtraHappinessPerCity (iChange)
			pPlayer:SetHappiness (pPlayer:GetHappiness () + iChange*iCities)
		end
	end
	--print("HappinessUAfunction Ending")
end

GameEvents.PlayerDoTurn.Add(HappinessUA)

-- adjust at the beginning of the game

if Game.GetGameTurn () == 0 then
	for iPlayer = 0, GameDefines.MAX_PLAYERS-1, 1 do
		pPlayer = Players [iPlayer]

		if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_RHODEISLAND and pPlayer:IsAlive () and (not pPlayer:IsBarbarian ()) and pPlayer:GetNumCities () == 0 then
			AdjustHappiness (iPlayer)
			print("Ran on turn 0")
		end

	end
end