-- Mayor S
-- Spoils_System_Function

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "Jackson";
print("Loaded Spoils System Function from Line 5!");

local bPostMaster = {
	GameInfoTypes.BUILDING_JACKSON_PM_1,
	GameInfoTypes.BUILDING_JACKSON_PM_2,
	GameInfoTypes.BUILDING_JACKSON_PM_3,
	GameInfoTypes.BUILDING_JACKSON_PM_4,
	GameInfoTypes.BUILDING_JACKSON_PM_5,
	GameInfoTypes.BUILDING_JACKSON_PM_6,
	GameInfoTypes.BUILDING_JACKSON_PM_7,
	GameInfoTypes.BUILDING_JACKSON_PM_8,
	GameInfoTypes.BUILDING_JACKSON_PM_9,
	GameInfoTypes.BUILDING_JACKSON_PM_10,
	GameInfoTypes.BUILDING_JACKSON_PM_11,
}
local bSergeant = {
	GameInfoTypes.BUILDING_JACKSON_SER_1,
	GameInfoTypes.BUILDING_JACKSON_SER_2,
	GameInfoTypes.BUILDING_JACKSON_SER_3,
	GameInfoTypes.BUILDING_JACKSON_SER_4,
	GameInfoTypes.BUILDING_JACKSON_SER_5,
	GameInfoTypes.BUILDING_JACKSON_SER_6,
	GameInfoTypes.BUILDING_JACKSON_SER_7,
	GameInfoTypes.BUILDING_JACKSON_SER_8,
	GameInfoTypes.BUILDING_JACKSON_SER_9,
	GameInfoTypes.BUILDING_JACKSON_SER_10,
	GameInfoTypes.BUILDING_JACKSON_SER_11,
}
local bTax = {
	GameInfoTypes.BUILDING_JACKSON_TAX_1,
	GameInfoTypes.BUILDING_JACKSON_TAX_2,
	GameInfoTypes.BUILDING_JACKSON_TAX_3,
	GameInfoTypes.BUILDING_JACKSON_TAX_4,
	GameInfoTypes.BUILDING_JACKSON_TAX_5,
	GameInfoTypes.BUILDING_JACKSON_TAX_6,
	GameInfoTypes.BUILDING_JACKSON_TAX_7,
	GameInfoTypes.BUILDING_JACKSON_TAX_8,
	GameInfoTypes.BUILDING_JACKSON_TAX_9,
	GameInfoTypes.BUILDING_JACKSON_TAX_10,
	GameInfoTypes.BUILDING_JACKSON_TAX_11,
}
local bScribe = {
	GameInfoTypes.BUILDING_JACKSON_SCR_1,
	GameInfoTypes.BUILDING_JACKSON_SCR_2,
	GameInfoTypes.BUILDING_JACKSON_SCR_3,
	GameInfoTypes.BUILDING_JACKSON_SCR_4,
	GameInfoTypes.BUILDING_JACKSON_SCR_5,
	GameInfoTypes.BUILDING_JACKSON_SCR_6,
	GameInfoTypes.BUILDING_JACKSON_SCR_7,
	GameInfoTypes.BUILDING_JACKSON_SCR_8,
	GameInfoTypes.BUILDING_JACKSON_SCR_9,
	GameInfoTypes.BUILDING_JACKSON_SCR_10,
	GameInfoTypes.BUILDING_JACKSON_SCR_11,
}
local bCurrupt = {
	GameInfoTypes.BUILDING_JACKSON_CUR_1,
	GameInfoTypes.BUILDING_JACKSON_CUR_2,
	GameInfoTypes.BUILDING_JACKSON_CUR_3,
	GameInfoTypes.BUILDING_JACKSON_CUR_4,
	GameInfoTypes.BUILDING_JACKSON_CUR_5,
	GameInfoTypes.BUILDING_JACKSON_CUR_6,
	GameInfoTypes.BUILDING_JACKSON_CUR_7,
	GameInfoTypes.BUILDING_JACKSON_CUR_8,
	GameInfoTypes.BUILDING_JACKSON_CUR_9,
	GameInfoTypes.BUILDING_JACKSON_CUR_10,
	GameInfoTypes.BUILDING_JACKSON_CUR_11,
}

function spoilsNewEra(player) 
	print("Spoils System Loaded")
	local pPlayer = Players[player]
	local pEra = load(pPlayer, "Jackson") or 0
	local cEra = pPlayer:GetCurrentEra();
	print("Current Era = "..cEra)
	if cEra > pEra then
		print("New Era = "..cEra)
		save(pPlayer, "Jackson", cEra)
		if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_TENNESSEE then
		for pCity in pPlayer:Cities() do
			local randNum = Game.Rand(5, "Random UA Bonus")
			print("Random Number ="..randNum)
			local num = 1
			if randNum == 0 then
				for iKey, iBuilding in ipairs(bPostMaster) do
					if iKey > num then
						pCity:SetNumRealBuilding(iBuilding, 0)
					else
						pCity:SetNumRealBuilding(iBuilding, 1)
					end	
				end
			elseif randNum == 1 then
				for iKey, iBuilding in ipairs(bSergeant) do
					if iKey > num then
						pCity:SetNumRealBuilding(iBuilding, 0)
					else
						pCity:SetNumRealBuilding(iBuilding, 1)
					end	
				end
			elseif randNum == 2 then
				for iKey, iBuilding in ipairs(bTax) do
					if iKey > num then
						pCity:SetNumRealBuilding(iBuilding, 0)
					else
						pCity:SetNumRealBuilding(iBuilding, 1)
					end	
				end
			elseif randNum == 3 then
				for iKey, iBuilding in ipairs(bScribe) do
					if iKey > num then
						pCity:SetNumRealBuilding(iBuilding, 0)
					else
						pCity:SetNumRealBuilding(iBuilding, 1)
					end	
				end
			elseif randNum == 4 then
				for iKey, iBuilding in ipairs(bCurrupt) do
					if iKey > cEra then
						pCity:SetNumRealBuilding(iBuilding, 0)
					else
						pCity:SetNumRealBuilding(iBuilding, 1)
					end
					end	
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(spoilsNewEra)

function spoilNewCity (player)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_TENNESSEE then
	local cEra = pPlayer:GetCurrentEra();
		for pCity in pPlayer:Cities() do
			local randNum = Game.Rand(5, "Random UA Bonus")
			print("Random Number ="..randNum)
			local num = 1
			if randNum == 0 then
				for iKey, iBuilding in ipairs(bPostMaster) do
					if iKey > num then
						pCity:SetNumRealBuilding(iBuilding, 0)
					else
						pCity:SetNumRealBuilding(iBuilding, 1)
					end	
				end
			elseif randNum == 1 then
				for iKey, iBuilding in ipairs(bSergeant) do
					if iKey > num then
						pCity:SetNumRealBuilding(iBuilding, 0)
					else
						pCity:SetNumRealBuilding(iBuilding, 1)
					end	
				end
			elseif randNum == 2 then
				for iKey, iBuilding in ipairs(bTax) do
					if iKey > num then
						pCity:SetNumRealBuilding(iBuilding, 0)
					else
						pCity:SetNumRealBuilding(iBuilding, 1)
					end	
				end
			elseif randNum == 3 then
				for iKey, iBuilding in ipairs(bScribe) do
					if iKey > num then
						pCity:SetNumRealBuilding(iBuilding, 0)
					else
						pCity:SetNumRealBuilding(iBuilding, 1)
					end	
				end
			elseif randNum == 4 then
				for iKey, iBuilding in ipairs(bCurrupt) do
					if iKey > num then
						pCity:SetNumRealBuilding(iBuilding, 0)
					else
						pCity:SetNumRealBuilding(iBuilding, 1)
					end
				end	
			end
		end
	end
end

GameEvents.PlayerCityFounded.Add(spoilNewCity)

local bSerBonus = {
	GameInfoTypes.BUILDING_SER_BONUS_1,
	GameInfoTypes.BUILDING_SER_BONUS_2,
	GameInfoTypes.BUILDING_SER_BONUS_3,
	GameInfoTypes.BUILDING_SER_BONUS_4,
	GameInfoTypes.BUILDING_SER_BONUS_5,
	GameInfoTypes.BUILDING_SER_BONUS_6,
	GameInfoTypes.BUILDING_SER_BONUS_7,
	GameInfoTypes.BUILDING_SER_BONUS_8,
	GameInfoTypes.BUILDING_SER_BONUS_9,
	GameInfoTypes.BUILDING_SER_BONUS_10,
	GameInfoTypes.BUILDING_SER_BONUS_11,
}

function citySerBonus(player) 
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_TENNESSEE then
		for pCity in pPlayer:Cities() do
			local numSpe =  pCity:GetSpecialistCount(GameInfoTypes.SPECIALIST_SERGEANT)
			for iKey, iBuilding in ipairs(bSerBonus) do
				if iKey > numSpe then
					pCity:SetNumRealBuilding(iBuilding, 0)
				else
					pCity:SetNumRealBuilding(iBuilding, 1)
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(spoilsNewEra)

function spoilsGoldBuildings(player)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_TENNESSEE then
		for pCity in pPlayer:Cities() do
			local cityName = pCity:GetName()
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_MARKET, 0)
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_MINT, 0)
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_BANK, 0)
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_STOCK_EXCHANGE, 0)
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MARKET) then
				print("City "..cityName.." Have a Market")
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_MARKET, 1)
				if pCity:IsHasBuilding(GameInfoTypes.BUILDING_JACKSON_MARKET) then
					print("City "..cityName.." Have a Jackson Market")
				end
			else
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_MARKET, 0)
			end
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MINT) then
				print("City "..cityName.." Have a Mint")
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_MINT, 1)
			else
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_MINT, 0)
			end
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_BANK) then
				print("City "..cityName.." Have a Bank")
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_BANK, 1)
			else
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_BANK, 0)
			end
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_STOCK_EXCHANGE) then
				print("City "..cityName.." Have a Stock Exchange")
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_STOCK_EXCHANGE, 1)
			else
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JACKSON_STOCK_EXCHANGE, 0)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(spoilsGoldBuildings)