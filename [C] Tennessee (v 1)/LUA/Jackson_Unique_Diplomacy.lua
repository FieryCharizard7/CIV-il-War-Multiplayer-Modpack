-- Mayor S
-- Jackson_Unique_Diplomacy

include("UniqueDiplomacyUtilsV3.lua");

local tNativeLeaders = {
	["LEADER_BLACKFOOTCROWFOOT"] = true,			-- Crowfoot
	["LEADER_CREEPOUNDMAKER"] = true,				-- Poundmaker
	["LEADER_DENETHANADELTHUR"] = true,				-- Thanadelthur
	["LEADER_RJOHN_ROSS"] = true,					-- John Ross
	["LEADER_SIOUX_SITTING_BULL_MOD"] = true,		-- Sitting Bull
	["LEADER_MC_FOURBEARS"] = true,					-- Fourbears
	["LEADER_QUANAH_PARKER"] = true,				-- Quanah Parker
	["LEADER_DULL_KNIFE"] = true,					-- Dull Knife
	["LEADER_SHARITAHRISH"] = true,					-- Sharitahrish
	["LEADER_RED_CLOUD"] = true,					-- Red Cloud
	["LEADER_BLACKBIRD"] = true,					-- Blackbird
	["LEADER_HIAWATHA"] = true,						-- Hiawatha
	["LEADER_POCATELLO"] = true,					-- Pocatello
	["LEADER_CLMEMBERTOU"] = true,					-- Membertou
	["LEADER_CLPONTIAC"] = true,					-- Pontiac
	["LEADER_CLNONOSBAWSUT"] = true					-- Nonosbawsut
}				
	
function JacksonUniqueResponses()
	local pActivePlayer = Players[Game.GetActivePlayer()]
	local sLeaderType = GameInfo.Leaders[pActivePlayer:GetLeaderType()].Type
	if (tNativeLeaders[sLeaderType]) then
		ChangeDiplomacyResponse("LEADER_JACKSON", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JACKSON_NATIVE_FIRSTGREETING%");
		ChangeDiplomacyResponse("LEADER_JACKSON", "RESPONSE_DEFEATED", "TXT_KEY_LEADER_JACKSON_NATIVE_DEFEATED%");
	end
end

