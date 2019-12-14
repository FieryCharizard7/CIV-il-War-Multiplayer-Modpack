-- FL_Decisions
-- Author: calcul8or
-- DateCreated: 3/6/2016 9:51:55 AM
--------------------------------------------------------------
print("Florida decisions loaded");

--=======================================================================================================================
-- Enter the space race
-- req: have completed Apollo Project
-- cost: Culture, gold, magistrate
-- rewards: 4 copies Aluminum, spaceship factory in capital
--=======================================================================================================================
Decision_FL_Space_Race = {}
	Decision_FL_Space_Race.Name = "TXT_KEY_DECISION_FL_SPACE_RACE"
	Decision_FL_Space_Race.Desc = "TXT_KEY_DECISION_FL_SPACE_RACE_DESC"
	HookDecisionCivilizationIcon(Decision_FL_Space_Race, "CIVILIZATION_FLORIDA")
	Decision_FL_Space_Race.CanFunc = (
		function(pPlayer)
			if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_FLORIDA) then return false, false end
			if (pPlayer:GetCapitalCity() == nil) then return true, false end
			if (load(pPlayer, "Decision_FL_Space_Race") == true) then 
				Decision_FL_Space_Race.Desc = Locale.ConvertTextKey("TXT_KEY_DECISION_FL_SPACE_RACE_DESC_ENACTED")
				return false, false, true
			end
			local pTeam = pPlayer:GetTeam();
			--local Apollo = Teams[pTeam]:GetProjectCount(GameInfoTypes["PROJECT_APOLLO_PROGRAM"])
			--if not pPlayer:GetTeam():IsHasTech(GameInfoTypes.TECH_ROCKETRY) then return true, false end
			local CulCost = math.ceil(iMod * 300);
			local GoldCost = math.ceil(iMod * 800);
			Decision_FL_Space_Race.Desc = Locale.ConvertTextKey("TXT_KEY_DECISION_FL_SPACE_RACE_DESC", CulCost, GoldCost)
			if Teams[pTeam]:GetProjectCount(GameInfoTypes["PROJECT_APOLLO_PROGRAM"]) ~= 1 then return true, false end
			if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
			if (pPlayer:GetJONSCulture() < CulCost) then return true, false end
			if (pPlayer:GetGold() < GoldCost) then return true, false end
			return true, true
		end
	)
	Decision_FL_Space_Race.DoFunc = (
		function(pPlayer)
			local CulCost = math.ceil(iMod * 300);
			local GoldCost = math.ceil(iMod * 800);
			pPlayer:ChangeJONSCulture(-CulCost)
			pPlayer:ChangeGold(-GoldCost)
			pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
			local CapCity = pPlayer:GetCapitalCity()
				CapCity:SetNumRealBuilding(GameInfoTypes["BUILDING_SPACESHIP_FACTORY"], 1)
			
			pPlayer:ChangeNumResourceTotal(GameInfoTypes["RESOURCE_ALUMINUM"], 4)
			save(pPlayer, "Decision_FL_Space_Race", true)
		end
		)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_FLORIDA, "Decision_FL_Space_Race", Decision_FL_Space_Race)
--=======================================================================================================================
-- Incorporate Florida Man somehow?
-- req: once per era?
-- cost: ??
-- rewards: Random effect (on enacting, either 10 damage (40%?) or 10 XP (60%?)
--=======================================================================================================================
Decision_FL_Florida_Man = {}
	Decision_FL_Florida_Man.Name = "TXT_KEY_DECISION_FL_FLORIDA_MAN"
	Decision_FL_Florida_Man.Desc = "TXT_KEY_DECISION_FL_FLORIDA_MAN_DESC"
	HookDecisionCivilizationIcon(Decision_FL_Florida_Man, "CIVILIZATION_FLORIDA")
	Decision_FL_Florida_Man.CanFunc = (
		function(pPlayer)
			if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_FLORIDA) then return false, false end
			if (pPlayer:GetCapitalCity() == nil) then return true, false end
			local iEra = load(pPlayer, "Decision_FL_Florida_Man")
			local iCurrentEra = pPlayer:GetCurrentEra()
			if iEra ~= nil then
				if iEra < iCurrentEra then
					save(pPlayer, "Decision_FL_Florida_Man", nil)
				else
					Decision_FL_Florida_Man.Desc = Locale.ConvertTextKey("TXT_KEY_DECISION_FL_FLORIDA_MAN_ENACTED_DESC")
					return false, false, true
				end
			end
			if iCurrentEra < GameInfoTypes.ERA_CLASSICAL then return false, false end
			--if (load(pPlayer, "Decision_FL_Florida_Man") == true) then 
			--	Decision_FL_Florida_Man.Desc = Locale.ConvertTextKey("TXT_KEY_DECISION_FL_FLORIDA_MAN_DESC_ENACTED")
			--	return false, false, true
			--end
			
			--local CulCost = math.ceil(iMod * 300);
			local GoldCost = math.ceil((iCurrentEra + 1) * 50 * iMod);
			Decision_FL_Florida_Man.Desc = Locale.ConvertTextKey("TXT_KEY_DECISION_FL_FLORIDA_MAN_DESC", GoldCost)
			--if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
			--if (pPlayer:GetJONSCulture() < CulCost) then return true, false end
			if (pPlayer:GetGold() < GoldCost) then return true, false end
			return true, true
		end
	)
	Decision_FL_Florida_Man.DoFunc = (
		function(pPlayer)
			--local CulCost = math.ceil(iMod * 300);
			local iCurrentEra = pPlayer:GetCurrentEra()
			local GoldCost = math.ceil((iCurrentEra + 1) * 50 * iMod);
			--pPlayer:ChangeJONSCulture(-CulCost)
			pPlayer:ChangeGold(-GoldCost)
			--pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
			for unit in pPlayer:Units() do
				print("affecting units");
				if unit:IsCombatUnit() then
					print("Combat Unit");
					local iRandNum = Game.Rand(100, "Florida Man Strikes");
					print("iRandNum = " .. iRandNum)
					if (iRandNum <= 20) then
						if (unit:GetDamage() < 89 ) then
							unit:ChangeDamage(10)
						else
							unit:ChangeDamage(math.ceil((100 - unit:GetDamage())/2))
						end
					elseif (iRandNum >= 40) then
						unit:ChangeExperience(10)
					end
				end
			end
			save(pPlayer, "Decision_FL_Florida_Man", iCurrentEra)
		end
		)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_FLORIDA, "Decision_FL_Florida_Man", Decision_FL_Florida_Man)