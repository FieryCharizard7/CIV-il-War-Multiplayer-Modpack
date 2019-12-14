-- Test
-- Author: calcul8or	
-- DateCreated: 9/4/2015 11:55:40 PM
--------------------------------------------------------------

function Testprint(playerID)
	local pPlayer = Players[playerID];
	local pPlayerName = pPlayer:GetName();
	print("Player is " .. playerID .. " who is known as " .. pPlayerName .. ".")
end

GameEvents.PlayerDoTurn.Add(Testprint)

