-- TX_Decision_Support
-- Author: calcul8or
-- DateCreated: 2/20/2016 7:23:25 PM
--------------------------------------------------------------
print("Texas Decisions has loaded")

local Decisions_TXannexation = {}
	Decisions_TXannexation.Name = "TXT_KEY_DECISIONS_TX_ANNEXATION"
	Decisions_TXannexation.Desc = "TXT_KEY_DECISIONS_TX_ANNEXATION_DESC"
	Decisions_TXannexation.CanFunc = (
	function(pPlayer)
		--Generate Decisions
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CALCTEXAS) then return false, false end
		if load(pPlayer, "Decisions_TX_Annexation") == true then
			Decisions_TX_Annexation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALCTEXAS_TX_ANNEXATION_ADOPTED")
			return false, false, true
		end	
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		
		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do
			local CSplayer = Players[i];
			if (CSplayer:IsAlive()) then
				local CScapital = CSplayer:GetCapitalCity()
				local sKey = "Decisions_TXannexation" .. CompileCityID(CScapital)
				local sName = CScapital:GetName()
				
				local sNote = ""
				
				tTempDecisions[sKey] = {}
				tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TX_ANNEXATION", sName)
				tTempDecisions[sKey].Desc = "TXT_KEY_DECISIONS_TX_ANNEXATION_DESC"
				tTempDecisions[sKey].Pedia = "TXT_KEY_DECISIONS_BUILDING_TX_ANNEXATION"
				tTempDecisions[sKey].Data1 = CScapital
				tTempDecisions[sKey].CanFunc = (
				function(pPlayer, CScapital)
				
					local sKey = "Decisions_TXannexation" .. CompileCityID(CScapital)
					local sName = CScapital:GetName()

					if load(pPlayer, sKey) == true then
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TX_ANNEXATION_ENACTED_DESC", sName)
						return false, false, true
					end
				
					local playerTeam = Teams[pPlayer:GetTeam()]
					local csTeam = Teams[CSplayer:GetTeam()]
					if (not csTeam:IsHasMet(playerTeam)) then return false, false end
					
					local CurrentEra = pPlayer:GetCurrentEra();
					local iGoldCost = math.ceil(400 * (1 + CurrentEra * 0.25));
					local iCultureCost = math.ceil(300 * (1 + CurrentEra * 0.25))
					tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TX_ANNEXATION_DESC", sName, iGoldCost, iCultureCost)
					if (pPlayer:GetGold() < iGoldCost) then	return true, false end
					if (pPlayer:GetJONSCulture() < iCultureCost) then	return true, false end
					if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
					return true, true
				end
				)
				
				tTempDecisions[sKey].DoFunc = (
				function(pPlayer, CScapital)
				
					local sKey = "Decisions_TXannexation" .. CompileCityID(CScapital)
					local iGoldCost = math.ceil(500 * iMod)
					local iCultureCost = math.ceil(500 * iMod)
					pPlayer:ChangeGold(-iGoldCost)
					pPlayer:ChangeJONSCulture(-iCultureCost)
					pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
					CraigConvertCity(pPlayer, CScapital)
					save(pPlayer, sKey, true)
				end
				)
				
			end
		end
		
		return
	end
	)

	
tDecisions.Decisions_TXannexation = Decisions_TXannexation

function CraigConvertCity(pPlayer, CScapital)
	--Adapted from code from Craig_Sutter
	local iplayer = CScapital:GetOwner()
	local CSplayer = Players[iplayer]
	for unit in CSplayer:Units() do
		local pNewUnit = pPlayer:InitUnit(unit:GetUnitType(), unit:GetX(), unit:GetY())
		pNewUnit:SetOriginalOwner(unit:GetOwner());
		pNewUnit:SetDamage(unit:GetDamage())
		pNewUnit:SetExperience(unit:GetExperience())
		pNewUnit:SetLevel(unit:GetLevel())
		
		for unitPromotion in GameInfo.UnitPromotions() do
			local iPromotionID = unitPromotion.ID;   
			if (unit:IsHasPromotion(iPromotionID)) then
				if (pNewUnit:IsPromotionValid(iPromotionID)) then
					pNewUnit:SetHasPromotion(iPromotionID, true)
				end
			end
		end
	end
	
	for pCity in CSplayer:Cities() do
			if pCity ~= nil then
				print("Transferring...", pCity:GetName(), "to" , pPlayer:GetName(), "from", CSplayer:GetName() )
				pPlayer:AcquireCity(pCity, false, true)
				pCity:DoTask(TaskTypes.TASK_UNRAZE);
			end
	end
end
