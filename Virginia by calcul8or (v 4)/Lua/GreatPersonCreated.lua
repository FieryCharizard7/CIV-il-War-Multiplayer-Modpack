-- GreatPersonCreated
-- Author: Machiavelli, edited by calcul8or
-- DateCreated: 2/15/2015 8:26:47 PM
--------------------------------------------------------------

function GreatPersonCreated(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	local player = Players[playerID];
	local unit = player:GetUnitByID(unitID);

	--print("A " .. unit:GetName() .. " was created for " .. player:GetName());
	--print("LOADED");

	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_VIRGINIA"] then
		--print("Virginia found");
		--print("Unit Type is " .. unit:GetName())
		if unit:GetUnitType() == GameInfoTypes["UNIT_WRITER"] or unit:GetUnitType() == GameInfoTypes["UNIT_ARTIST"] or unit:GetUnitType() == GameInfoTypes["UNIT_MUSICIAN"] or unit:GetUnitType() == GameInfoTypes["UNIT_SCIENTIST"] or unit:GetUnitType() == GameInfoTypes["UNIT_MERCHANT"] or unit:GetUnitType() == GameInfoTypes["UNIT_ENGINEER"] or unit:GetUnitType() == GameInfoTypes["UNIT_GREAT_GENERAL"] or unit:GetUnitType() == GameInfoTypes["UNIT_VENETIAN_MERCHANT"] or unit:GetUnitType() == GameInfoTypes["UNIT_PROPHET"] or unit:GetUnitType() == GameInfoTypes["UNIT_GREAT_ADMIRAL"] then
			--print("Writer, artist, or musician found")
			local GoldenAgeLimit = player:GetGoldenAgeProgressThreshold(); 
			local GAProgressChange = math.floor(GoldenAgeLimit/10);
			player:ChangeGoldenAgeProgressMeter(GAProgressChange);
			print("Virginia GA change is " .. GAProgressChange)
		end
	end
end
LuaEvents.SerialEventUnitCreatedGood.Add(GreatPersonCreated);