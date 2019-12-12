print("This is the 'Promotions - Crossovers' mod script.")

local iPromotionCrossoverID = GameInfo.UnitPromotions["PROMOTION_CROSSOVER"].ID

function promotionCrossover(pUnit)
  if (pUnit) then
    local sUnitCombatType = GameInfo.Units[pUnit:GetUnitType()].CombatClass

    if (sUnitCombatType ~= nil) then
      if (not pUnit:IsHasPromotion(iPromotionCrossoverID)) then
        for row in GameInfo.UnitPromotions_UnitCombatCrossovers{UnitCombatType = sUnitCombatType} do
          local iFromPromotionID = GameInfo.UnitPromotions[row.FromType].ID
          local iToPromotionID = GameInfo.UnitPromotions[row.ToType].ID

          if (pUnit:IsHasPromotion(iFromPromotionID)) then
            -- Must be in the order toPromotion then fromPromotion to enable promotions to be deleted
            pUnit:SetHasPromotion(iToPromotionID, true)
            pUnit:SetHasPromotion(iFromPromotionID, false)
          end
        end

        -- Give the crossover promotion so we don't spend time doing this again
        pUnit:SetHasPromotion(iPromotionCrossoverID, true)
      end
    end
  end
end

-- If only there was a UnitUpgraded event ...        
function onActivePlayerTurnEnd()
  local pPlayer = Players[Game.GetActivePlayer()]
  for pUnit in pPlayer:Units() do
    if (not pUnit:IsDelayedDeath()) then
      promotionCrossover(pUnit)
    end
  end
end
Events.ActivePlayerTurnEnd.Add(onActivePlayerTurnEnd)
