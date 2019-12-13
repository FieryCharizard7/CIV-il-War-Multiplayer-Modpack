-- Created by Kaduseon's XML to SQL+XML Translator-Splitter on 8/07/2015 8:46:31 PM
--==================================================
-- Units
--==================================================
INSERT INTO Units (Type,               Class,               PrereqTech,              Cost,  FaithCost, RequiresFaithPurchaseEnabled, Combat, Moves, CombatClass,          Domain,        DefaultUnitAI,        Description,                Civilopedia,                                   Strategy,                            Help,                            MilitarySupport, MilitaryProduction, Pillage, AdvancedStartCost, XPValueAttack, XPValueDefense, UnitArtInfo,                 MoveRate,    UnitFlagIconOffset, UnitFlagAtlas,            PortraitIndex, IconAtlas              )
           VALUES ('UNIT_TEXASRANGER', 'UNITCLASS_CAVALRY', 'TECH_MILITARY_SCIENCE', '225', '450',     '1',                          '34',   '4',   'UNITCOMBAT_MOUNTED', 'DOMAIN_LAND', 'UNITAI_FAST_ATTACK', 'TXT_KEY_UNIT_TEXASRANGER', 'TXT_KEY_CIVILOPEDIA_UNITS_TEXASRANGERS_TEXT', 'TXT_KEY_UNIT_TEXASRANGER_STRATEGY', 'TXT_KEY_UNIT_HELP_TEXASRANGER', '1',             '1',                '1',     '30',              '3',           '3',            'ART_DEF_UNIT_TEXAS_RANGER', 'QUADRUPED', '0',                'CIV_RANGER_ATLAS_TEXAS', '2',           'CIV_COLOR_ATLAS_TEXAS');

-- 1 total SQL entries for Units

--==================================================
-- Unit_AITypes
--==================================================
INSERT INTO Unit_AITypes (UnitType,           UnitAIType      )
                  VALUES ('UNIT_TEXASRANGER', 'UNITAI_DEFENSE');

INSERT INTO Unit_AITypes (UnitType,           UnitAIType          )
                  VALUES ('UNIT_TEXASRANGER', 'UNITAI_FAST_ATTACK');

-- 2 total SQL entries for Unit_AITypes

--==================================================
-- Unit_Flavors
--==================================================
INSERT INTO Unit_Flavors (UnitType,           FlavorType,       Flavor)
                  VALUES ('UNIT_TEXASRANGER', 'FLAVOR_OFFENSE', '20'  );

INSERT INTO Unit_Flavors (UnitType,           FlavorType,       Flavor)
                  VALUES ('UNIT_TEXASRANGER', 'FLAVOR_DEFENSE', '12'  );

INSERT INTO Unit_Flavors (UnitType,           FlavorType,      Flavor)
                  VALUES ('UNIT_TEXASRANGER', 'FLAVOR_MOBILE', '14'  );

-- 3 total SQL entries for Unit_Flavors

--==================================================
-- Unit_ClassUpgrades
--==================================================
INSERT INTO Unit_ClassUpgrades (UnitType,           UnitClassType       )
                        VALUES ('UNIT_TEXASRANGER', 'UNITCLASS_WWI_TANK');

-- 1 total SQL entries for Unit_ClassUpgrades

--==================================================
-- Unit_FreePromotions
--==================================================
INSERT INTO Unit_FreePromotions (UnitType,           PromotionType                       )
                         VALUES ('UNIT_TEXASRANGER', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING');

INSERT INTO Unit_FreePromotions (UnitType,           PromotionType                )
                         VALUES ('UNIT_TEXASRANGER', 'PROMOTION_GOLDEN_AGE_POINTS');

INSERT INTO Unit_FreePromotions (UnitType,           PromotionType                )
                         VALUES ('UNIT_TEXASRANGER', 'PROMOTION_CITY_PENALTY');

-- 2 total SQL entries for Unit_FreePromotions

--==================================================
-- Unit_YieldFromKills
--==================================================
INSERT INTO Unit_YieldFromKills (UnitType,           YieldType,       Yield)
                         VALUES ('UNIT_TEXASRANGER', 'YIELD_CULTURE', '100');

-- 1 total SQL entries for Unit_YieldFromKills

--==================================================
-- Civilization_UnitClassOverrides
--==================================================
INSERT INTO Civilization_UnitClassOverrides (CivilizationType,     UnitClassType,       UnitType          )
                                     VALUES ('CIVILIZATION_TEXAS', 'UNITCLASS_CAVALRY', 'UNIT_TEXASRANGER');

-- 1 total SQL entries for Civilization_UnitClassOverrides

--==================================================
-- Unit_ResourceQuantityRequirements
--==================================================
INSERT INTO Unit_ResourceQuantityRequirements (UnitType,           ResourceType    )
                                       VALUES ('UNIT_TEXASRANGER', 'RESOURCE_HORSE');

-- 1 total SQL entries for Unit_ResourceQuantityRequirements

--==================================================
-- ArtDefine_UnitInfos
--==================================================
INSERT INTO ArtDefine_UnitInfos (Type,                        DamageStates, Formation       )
                         VALUES ('ART_DEF_UNIT_TEXAS_RANGER', '1',          'DefaultCavalry');

-- 1 total SQL entries for ArtDefine_UnitInfos

--==================================================
-- ArtDefine_UnitInfoMemberInfos
--==================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,                UnitMemberInfoType,                         NumMembers)
                                   VALUES ('ART_DEF_UNIT_TEXAS_RANGER', 'ART_DEF_UNIT_MEMBER_UNION_CAVALRY_PISTOL', '5'       );

-- 1 total SQL entries for ArtDefine_UnitInfoMemberInfos

--==================================================
-- ArtDefine_StrategicView
--==================================================
INSERT INTO ArtDefine_StrategicView (StrategicViewType,           TileType, Asset               )
                             VALUES ('ART_DEF_UNIT_TEXAS_RANGER', 'Unit',   'sv_texasranger.dds');

INSERT INTO ArtDefine_StrategicView (StrategicViewType,                 TileType, Asset               )
                             VALUES ('ART_DEF_UNIT_TEXAS_OUTLAW_EARLY', 'Unit',   'sv_texasoutlaw.dds');

INSERT INTO ArtDefine_StrategicView (StrategicViewType,                TileType, Asset               )
                             VALUES ('ART_DEF_UNIT_TEXAS_OUTLAW_LATE', 'Unit',   'sv_texasoutlaw.dds');

-- 3 total SQL entries for ArtDefine_StrategicView

