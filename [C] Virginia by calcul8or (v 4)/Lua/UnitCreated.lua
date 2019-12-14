-- UnitCreated
-- Author: Machiavelli
-- DateCreated: 2/15/2015 8:24:08 PM
--------------------------------------------------------------

function CallSerialEventUnitCreatedGood(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	if(Players[playerID] == nil or
		Players[playerID]:GetUnitByID(unitID) == nil or
		Players[playerID]:GetUnitByID(unitID):IsDead() or
		Players[playerID]:GetUnitByID(unitID):IsHasPromotion(GameInfoTypes["PROMOTION_CREATED"])) then
		return;
	end

	local unit = Players[playerID]:GetUnitByID(unitID);

	-- Always mark the unit with the created promotion
	unit:SetHasPromotion(GameInfoTypes["PROMOTION_CREATED"], true);

	-- Call the good event
	LuaEvents.SerialEventUnitCreatedGood(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible);

	-- Kill the unit if some code hooked into the event has indicated the unit should be deleted
	if(unit:IsHasPromotion(GameInfoTypes["PROMOTION_MARKED_FOR_DEATH"])) then
		unit:Kill();
	end
end

--------------
-- Initialization check.  Ensures this code isn't loaded twice
--------------
local retVal = {};
LuaEvents.SerialEventUnitCreatedGood_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.SerialEventUnitCreatedGood_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	Events.SerialEventUnitCreated.Add(CallSerialEventUnitCreatedGood);
end