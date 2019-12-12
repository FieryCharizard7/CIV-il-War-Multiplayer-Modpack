-- TPangTest
-- Author: calcul8or
-- DateCreated: 3/9/2016 8:21:00 PM
--------------------------------------------------------------

include("PlotIterators.lua")

local civID   = GameInfoTypes["CIVILIZATION_MASSACHUSETTS"];
local promoID = GameInfoTypes["PROMOTION_DRILL_1"];
local bGreatPerson = false
local PlotX
local PlotY

function PreKillTest(iPlayer, UnitID, UnitType, iX, iY, bDelay, eByPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civID) then
		print("prekillListener: Dumping data..")
		print("iPlayer: " .. iPlayer)
		print("UnitID: " .. UnitID)
		print("UnitType: " .. UnitType .. " (" .. GameInfo.Units[UnitType].Type .. ")")
		print("iX: " .. iX)
		print("iY: " .. iY)
		print("bDelay: " .. tostring(bDelay))
		if bGreatPerson then
			print("Great person expended")
			local pPlot = Map.GetPlot(iX, iY)
			for loopPlot in PlotAreaSpiralIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				print("Checking plot " .. loopPlot:GetX() .. "-" .. loopPlot:GetY());
				local NumPlotUnits = loopPlot:GetNumUnits();
				for i = 0, NumPlotUnits - 1, 1 do
					print("Checking units in plot. i is " .. i);
					local plotUnit = loopPlot:GetUnit(i);
					if (plotUnit ~= nil and plotUnit:IsPromotionValid(promoID)) then
						print("Valid unit " .. plotUnit:GetName());
						if (not plotUnit:IsHasPromotion(promoID)) then
							plotUnit:SetHasPromotion(promoID, true)
						end
					end
				end
			end
			bGreatPerson = false
		end
	end
end

GameEvents.UnitPrekill.Add(PreKillTest)

function TPangExpendToPromotion(playerID, iUnit)
	local pPlayer = Players[playerID]
	--print("PlayerID is " .. playerID .. " iUnit is " .. iUnit);
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civID) then
		print("Great person expended");
		print("PlayerID is " .. playerID .. " iUnit is " .. iUnit);
		bGreatPerson = true
	end
end

GameEvents.GreatPersonExpended.Add(TPangExpendToPromotion)


