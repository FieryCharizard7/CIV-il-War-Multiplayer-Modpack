-- TX_Decisions
-- Author: calcul8or
-- DateCreated: 1/9/2016 6:09:39 PM
--------------------------------------------------------------
print("Texas Decisions has loaded")

local Decisions_TX_Annexation = {}
	Decisions_TX_Annexation.Name = "TXT_KEY_DECISIONS_CALCTEXAS_TX_ANNEXATION_NAME"
	Decisions_TX_Annexation.Desc = "TXT_KEY_DECISIONS_CALCTEXAS_TX_ANNEXATION_DESC"
	HookDecisionCivilizationIcon(Decisions_TX_Annexation, "CIVILIZATION_CALCTEXAS")

	Decisions_TX_Annexation.CanFunc = ( 
	function(pPlayer)
		--print("GA Reconstruction War line 17")
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CALCTEXAS) then return false, false end
		if load(pPlayer, "Decisions_TX_Annexation") == true then
			Decisions_TX_Annexation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALCTEXAS_TX_ANNEXATION_ADOPTED")
			return false, false, true
		end		
		--Decisions_TX_Annexation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALCTEXAS_TX_ANNEXATION_DESC")
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end		
		if pPlayer:GetGold() < 300 then return true, false end
		if pPlayer:GetJONSCulture() < 300 then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end

		local NearestCS = nil
		local NearestCSDist = 9999

		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
			--local TXCap = pPlayer:GetCapitalCity();
			--local TXCapPlot = TXCap:GetCityIndexPlot();
			--local CSplayer = Players[i];
			--if (CSplayer:IsAlive() and CSplayer:GetCapitalCity() ~= nil) then
				--local CScap = CSplayer:GetCapitalCity();
				--local CScapPlot = CScap:GetCityIndexPlot();
				--local CSDist = Map.PlotDistance(TXCap:GetX(), TXCap:GetY(), CScap:GetX(), CScap:GetX())
				--if (CSDist < NearestCSDist and pPlayer:GetTeam():IsHasMet(CSplayer)) then
					--NearestCSDist = CSDist
					--NearestCS = CSplayer:GetID()
				--end
				--return NearestCS
			--end
		end
		
		Decisions_TX_Annexation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALCTEXAS_TX_ANNEXATION_DESC", NearestCS)

	end
	)
	
	Decisions_TX_Annexation.DoFunc = ( --Payment Block
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeGold(-300)
		pPlayer:ChangeJONSCulture(-300)

		save(pPlayer, "Decisions_TX_Annexation", true)
		Initialize_Decisions_TX_Annexation(pPlayer)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_CALCTEXAS"], "Decisions_TX_Annexation", Decisions_TX_Annexation)

function Initialize_Decisions_TX_Annexation(player)
	local n = GameDefines.MAX_MAJOR_CIVS - 1
	for playerID = 0, n, 1 do
		local pPlayer = Players[playerID]
		if pPlayer and load(pPlayer, "Decisions_TX_Annexation") then
			georgiaID = playerID
			georgiaTeamID = pPlayer:GetTeam()
		    break
		end
	end

	if (georgiaID ~= -1) then
		print("GA Reconstruction enacted line 61ish")
		local dPlayer = Players[georgiaID]
		local CapCity = dPlayer:GetCapitalCity()
		local PlotX = CapCity:GetX()
		local PlotY = CapCity:GetY()
		dPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_DECISIONS_GARECONTRUCTION"], 1)
		dPlayer:InitUnit(GameInfoTypes["UNIT_WORKER"], PlotX, PlotY):JumpToNearestValidPlot()
		--dPlayer:InitUnit(GameInfoTypes["UNIT_CAVALRY"], PlotX, PlotY):JumpToNearestValidPlot()
		--dPlayer:InitUnit(GameInfoTypes["UNIT_CAVALRY"], PlotX, PlotY):JumpToNearestValidPlot()
		--dPlayer:InitUnit(GameInfoTypes["UNIT_CAVALRY"], PlotX, PlotY):JumpToNearestValidPlot()
	end
end