-- JFD_AmericaLincoln_ChooseWarTimeBonusPopup
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("IconSupport")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
--Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_AMERICA_LINCOLN"]
local isAmericaLincolnCivActive = JFD_IsCivilisationActive(civilisationID)
local policyLincolnSpeech1ID = GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_1"]
local policyLincolnSpeech2ID = GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_2"]
local policyLincolnSpeech3ID = GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_3"]
local policyLincolnSpeech4ID = GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_4"]
local policyLincolnSpeech5ID = GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_5"]
local unitPromotionSpeech1ID = GameInfoTypes["PROMOTION_JFD_LINCOLN_SPEECH_1"]
local warringPlayer = nil
----------------------------------------------------------------------------------------------------------------------------
--JFD_OnWarLincolnSpeaksWell
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnWarLincolnSpeaksWell(teamID, otherTeamID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
	if (otherPlayer:GetCivilizationType() == civilisationID and Teams[otherPlayer:GetTeam()]:GetAtWarCount(true) == 1) then
		if otherPlayer:IsHuman() then
			JFD_ShowChooseWarTimeBonusPopup(player)
			warringPlayer = player
		else
			local policyToGiveID = "POLICY_JFD_LINCOLN_SPEECH_" .. JFD_GetRandom(1,6)
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyToGiveID, true)
		end
	end
end

if isAmericaLincolnCivActive then
	GameEvents.DeclareWar.Add(JFD_OnWarLincolnSpeaksWell)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_OnLastPeaceRemoveEffects
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnLastPeaceRemoveEffects(teamID, otherTeamID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
	if ((otherPlayer:GetCivilizationType() == civilisationID and Teams[otherPlayer:GetTeam()]:GetAtWarCount(true) == 0) or (player:GetCivilizationType() == civilisationID and Teams[player:GetTeam()]:GetAtWarCount(true) == 0)) then
		local policiesToRemove = {policyLincolnSpeech1ID, policyLincolnSpeech2ID, policyLincolnSpeech3ID, policyLincolnSpeech4ID, policyLincolnSpeech5ID}
		for _, policyID in pairs(policiesToRemove) do
			if player:HasPolicy(policyID) then
				player:SetHasPolicy(policyID, false)
			end

			if otherPlayer:HasPolicy(policyID) then
				otherPlayer:SetHasPolicy(policyID, false)
			end

			for unit in player:Units() do
				if unit:IsHasPromotion(unitPromotionSpeech1ID) then
					unit:SetHasPromotion(unitPromotionSpeech1ID, false)
				end
			end

			for unit in otherPlayer:Units() do
				if unit:IsHasPromotion(unitPromotionSpeech1ID) then
					unit:SetHasPromotion(unitPromotionSpeech1ID, false)
				end
			end
		end
	end
end

if isAmericaLincolnCivActive then
	GameEvents.MakePeace.Add(JFD_OnLastPeaceRemoveEffects)
end
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
--Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayer = Players[Game.GetActivePlayer()]
local isPopupOpen = false
----------------------------------------------------------------------------------------------------------------------------
--JFD_PopulateButtons
----------------------------------------------------------------------------------------------------------------------------
function JFD_PopulateButtons(speechNumber)
	local policyToGiveID = GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_" .. speechNumber]
	local descriptionKey = "TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_" .. speechNumber
	local description = Locale.ConvertTextKey(descriptionKey, warringPlayer:GetCivilizationShortDescription())
	local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_SHORT")
	activePlayer:SetNumFreePolicies(1)
	activePlayer:SetNumFreePolicies(0)
	activePlayer:SetHasPolicy(policyToGiveID, true)
	activePlayer:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort)
	
	if isPopupOpen then
		JFD_HideChooseWarTimeBonusPopup()
	end
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_ShowChooseWarTimeBonusPopup
----------------------------------------------------------------------------------------------------------------------------
function JFD_ShowChooseWarTimeBonusPopup(attackingPlayer)
	CivIconHookup( Game.GetActivePlayer(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
	Controls.Summary:LocalizeAndSetText("TXT_KEY_JFD_LINCOLN_SPEECHES_MESSAGE", attackingPlayer:GetCivilizationDescription())
	Controls.ButtonStack:CalculateSize();
	Controls.MainUI:DoAutoSize();
	Controls.MainUIBG:SetHide(false)
	Controls.MainUI:SetHide(false)
	isPopupOpen = true
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_HideChooseWarTimeBonusPopup
----------------------------------------------------------------------------------------------------------------------------
function JFD_HideChooseWarTimeBonusPopup()
	Controls.MainUIBG:SetHide(true)
	Controls.MainUI:SetHide(true)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_LincolnSpeeches
----------------------------------------------------------------------------------------------------------------------------
function JFD_LincolnSpeech1()
	JFD_PopulateButtons(1)
end
Controls.Button1:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeech1)

function JFD_LincolnSpeech2()
	JFD_PopulateButtons(2)
end
Controls.Button2:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeech2)

function JFD_LincolnSpeech3()
	JFD_PopulateButtons(3)
end
Controls.Button3:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeech3)

function JFD_LincolnSpeech4()
	JFD_PopulateButtons(4)
end
Controls.Button4:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeech4)

function JFD_LincolnSpeech5()
	JFD_PopulateButtons(5)
end
Controls.Button5:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeech5)

function JFD_LincolnSpeech6()
	JFD_PopulateButtons(6)
end
Controls.Button6:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeech6)
--==========================================================================================================================
--==========================================================================================================================