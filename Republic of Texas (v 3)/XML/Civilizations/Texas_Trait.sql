-- Created by Kaduseon's XML to SQL+XML Translator-Splitter on 8/07/2015 8:46:30 PM
--==================================================
-- Traits
--==================================================
INSERT INTO Traits (Type,           Description,            ShortDescription            )
            VALUES ('TRAIT_TAKEIT', 'TXT_KEY_TRAIT_TAKEIT', 'TXT_KEY_TRAIT_TAKEIT_SHORT');

-- 1 total SQL entries for Traits

--==================================================
-- Trait_FreePromotionUnitCombats
--==================================================
INSERT INTO Trait_FreePromotionUnitCombats (TraitType,      UnitCombatType,     PromotionType                  )
                                    VALUES ('TRAIT_TAKEIT', 'UNITCOMBAT_MELEE', 'PROMOTION_DEFEND_NEAR_CAPITAL');

INSERT INTO Trait_FreePromotionUnitCombats (TraitType,      UnitCombatType,     PromotionType                  )
                                    VALUES ('TRAIT_TAKEIT', 'UNITCOMBAT_SIEGE', 'PROMOTION_DEFEND_NEAR_CAPITAL');

INSERT INTO Trait_FreePromotionUnitCombats (TraitType,      UnitCombatType,   PromotionType                  )
                                    VALUES ('TRAIT_TAKEIT', 'UNITCOMBAT_GUN', 'PROMOTION_DEFEND_NEAR_CAPITAL');

INSERT INTO Trait_FreePromotionUnitCombats (TraitType,      UnitCombatType,       PromotionType                  )
                                    VALUES ('TRAIT_TAKEIT', 'UNITCOMBAT_MOUNTED', 'PROMOTION_DEFEND_NEAR_CAPITAL');

-- 4 total SQL entries for Trait_FreePromotionUnitCombats

--==================================================
-- Trait_ImprovementYieldChanges
--==================================================
INSERT INTO Trait_ImprovementYieldChanges (TraitType,      ImprovementType,    YieldType,       Yield)
                                   VALUES ('TRAIT_TAKEIT', 'IMPROVEMENT_FORT', 'YIELD_CULTURE', '2'  );

-- 1 total SQL entries for Trait_ImprovementYieldChanges

