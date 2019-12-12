-- VAMarch
-- Author: calcul8or
-- DateCreated: 2/19/2015 7:46:50 AM
--------------------------------------------------------------

function VAMArch(playerID)
	--print("VAMarch loaded")
	local pPlayer = Players[playerID];
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_VIRGINIA"]) then
		for unit in pPlayer:Units() do
			if (pPlayer:IsGoldenAge()) then
				--print("Golden Age!")
				unit:SetHasPromotion(GameInfoTypes.PROMOTION_VA_MARCH, true)
			else
				--print("No golden age!")
				unit:SetHasPromotion(GameInfoTypes.PROMOTION_VA_MARCH, false)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(VAMArch)