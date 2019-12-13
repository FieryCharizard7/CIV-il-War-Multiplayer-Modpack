-- EDSupport
-- Author: calcul8or
-- DateCreated: 9/7/2015 6:39:17 AM

--=============================================================
--Post-war Reconstruction
--=============================================================
print("GA_ED has loaded")

local Decisions_GAReconstruction = {}
	Decisions_GAReconstruction.Name = "TXT_KEY_DECISIONS_CALCGEORGIA_GARECONSTRUCTION_NAME"
	Decisions_GAReconstruction.Desc = "TXT_KEY_DECISIONS_CALCGEORGIA_GARECONSTRUCTION_DESC"
	HookDecisionCivilizationIcon(Decisions_GAReconstruction, "CIVILIZATION_CALCGEORGIA")

	Decisions_GAReconstruction.CanFunc = ( 
	function(pPlayer)
		--print("GA Reconstruction War line 17")
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CALCGEORGIA) then return false, false end
		if load(pPlayer, "Decisions_GAReconstruction") == true then
			Decisions_GAReconstruction.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALCGEORGIA_GARECONSTRUCTION_ADOPTED")
			return false, false, true
		end		
		Decisions_GAReconstruction.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALCGEORGIA_GARECONSTRUCTION_DESC")
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end		
		if pPlayer:GetGold() < 500 then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		local pPlayerID = pPlayer:GetID()
		local iNumWarsFought = 0
		for iOtherPlayer, pOtherPlayer in pairs(Players) do
			if pPlayerID ~= iOtherPlayer and iOtherPlayer ~= 63 then
			iNumWarsFought = iNumWarsFought + pPlayer:GetNumWarsFought(iOtherPlayer) + pOtherPlayer:GetNumWarsFought(pPlayerID)
			end
		end
		if not (Teams[pPlayer:GetTeam()]:IsAtWar()) then
			if iNumWarsFought < 1 then return true, false end
		else return true, false end

		--local CapCity = pPlayer:GetCapitalCity()
		--local pMarker = GameInfoTypes["BUILDING_DECISIONS_GAWARMARKER"]
		--if (CapCity:IsHasBuilding(pMarker)) and not (Teams[pPlayer:GetTeam()]:IsAtWar()) then return true, true end
		--if (Teams[pPlayer:GetTeam()]:GetAtWarCount() > 0) then return true, false end
		--if not Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MILITARY_SCIENCE) then return true, false end
		--if pPlayer:GetFaith() < 50 then return true, false end
	end
	)
	
	Decisions_GAReconstruction.DoFunc = ( --Payment Block
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeGold(-500)
		--pPlayer:ChangeFaith(-50)

		save(pPlayer, "Decisions_GAReconstruction", true)
		Initialize_Decisions_GAReconstruction()
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_CALCGEORGIA"], "Decisions_GAReconstruction", Decisions_GAReconstruction)

function Initialize_Decisions_GAReconstruction()
	local n = GameDefines.MAX_MAJOR_CIVS - 1
	for playerID = 0, n, 1 do
		local pPlayer = Players[playerID]
		if pPlayer and load(pPlayer, "Decisions_GAReconstruction") then
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


--=============================================================
--Civil Rights
--=============================================================
--print("GA_ED has loaded")

local Decisions_GACivilRights = {}
	Decisions_GACivilRights.Name = "TXT_KEY_DECISIONS_CALCGEORGIA_GACIVILRIGHTS_NAME"
	Decisions_GACivilRights.Desc = "TXT_KEY_DECISIONS_CALCGEORGIA_GACIVILRIGHTS_DESC"
	HookDecisionCivilizationIcon(Decisions_GACivilRights, "CIVILIZATION_CALCGEORGIA")

	Decisions_GACivilRights.CanFunc = ( 
	function(pPlayer)
		--print("GA Civil Rights")
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CALCGEORGIA) then return false, false end
		if load(pPlayer, "Decisions_GACivilRights") == true then
			Decisions_GACivilRights.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALCGEORGIA_GACIVILRIGHTS_ADOPTED")
			return false, false, true
		end		
		Decisions_GACivilRights.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALCGEORGIA_GACIVILRIGHTS_DESC")
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end		
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		if (pPlayer:GetGold() < 500) then return true, false end
		if (Teams[pPlayer:GetTeam()]:GetCurrentEra() > 4) then 
			return true, true 
		else
			return true, false
		end
		--if not Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MILITARY_SCIENCE) then return true, false end
		--if (CapCity:IsHasBuilding(pMarker)) and not (Teams[pPlayer:GetTeam()]:IsAtWar()) then return true, true end
		--local CapCity = pPlayer:GetCapitalCity()
		--if pPlayer:GetFaith() < 50 then return true, false end
		--local pMarker = GameInfoTypes["BUILDING_DECISIONS_GAWARMARKER"]
	end
	)
	
	Decisions_GACivilRights.DoFunc = ( --Payment Block
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeGold(-500)
		--pPlayer:ChangeFaith(-50)

		save(pPlayer, "Decisions_GACivilRights", true)
		Initialize_Decisions_GACivilRights()
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_CALCGEORGIA"], "Decisions_GACivilRights", Decisions_GACivilRights)

function Initialize_Decisions_GACivilRights()
	local n = GameDefines.MAX_MAJOR_CIVS - 1
	for playerID = 0, n, 1 do
		local pPlayer = Players[playerID]
		if pPlayer and load(pPlayer, "Decisions_GACivilRights") then
			georgiaID = playerID
			georgiaTeamID = pPlayer:GetTeam()
		    break
		end
	end

	if (georgiaID ~= -1) then
		print("GA Civil Rights enacted line 61ish")
		local dPlayer = Players[georgiaID]
		local CapCity = dPlayer:GetCapitalCity()
		local PlotX = CapCity:GetX()
		local PlotY = CapCity:GetY()
		dPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_DECISIONS_GACIVILRIGHTS"], 1)
		--dPlayer:InitUnit(GameInfoTypes["UNIT_WORKER"], PlotX, PlotY):JumpToNearestValidPlot()
		--dPlayer:InitUnit(GameInfoTypes["UNIT_CAVALRY"], PlotX, PlotY):JumpToNearestValidPlot()
		--dPlayer:InitUnit(GameInfoTypes["UNIT_CAVALRY"], PlotX, PlotY):JumpToNearestValidPlot()
		--dPlayer:InitUnit(GameInfoTypes["UNIT_CAVALRY"], PlotX, PlotY):JumpToNearestValidPlot()
	end
end
