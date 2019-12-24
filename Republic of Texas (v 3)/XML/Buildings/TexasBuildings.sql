-- Created by Kaduseon's XML to SQL+XML Translator-Splitter on 8/07/2015 8:46:30 PM
--==================================================
-- Buildings
--==================================================
INSERT INTO Buildings (Type,                  BuildingClass,          Cost, GoldMaintenance, PrereqTech,              Help,                               Description,                        Civilopedia,                              Strategy,                               ArtDefineTag,                    MinAreaSize, HurryCostModifier, IconAtlas,               NeverCapture, PortraitIndex)
               VALUES ('BUILDING_TEXASRANCH', 'BUILDINGCLASS_STABLE', '75', '1',             'TECH_HORSEBACK_RIDING', 'TXT_KEY_BUILDING_TEXASRANCH_HELP', 'TXT_KEY_BUILDING_TEXASRANCH_DESC', 'TXT_KEY_CIV5_BUILDINGS_TEXASRANCH_TEXT', 'TXT_KEY_BUILDING_TEXASRANCH_STRATEGY', 'NULL', '-1',        '25',              'CIV_COLOR_ATLAS_TEXAS', '1',          '3'          );

-- 1 total SQL entries for Buildings

--==================================================
-- Building_Flavors
--==================================================
INSERT INTO Building_Flavors (BuildingType,          FlavorType,      Flavor)
                      VALUES ('BUILDING_TEXASRANCH', 'FLAVOR_MOBILE', '15'  );

INSERT INTO Building_Flavors (BuildingType,          FlavorType,          Flavor)
                      VALUES ('BUILDING_TEXASRANCH', 'FLAVOR_PRODUCTION', '25'  );

INSERT INTO Building_Flavors (BuildingType,          FlavorType,       Flavor)
                      VALUES ('BUILDING_TEXASRANCH', 'FLAVOR_CULTURE', '5'   );

INSERT INTO Building_Flavors (BuildingType,          FlavorType,      Flavor)
                      VALUES ('BUILDING_TEXASRANCH', 'FLAVOR_GROWTH', '10'  );

-- 4 total SQL entries for Building_Flavors

--==================================================
-- Building_LocalResourceOrs
--==================================================
INSERT INTO Building_LocalResourceOrs (BuildingType,          ResourceType    )
                               VALUES ('BUILDING_TEXASRANCH', 'RESOURCE_HORSE');

INSERT INTO Building_LocalResourceOrs (BuildingType,          ResourceType    )
                               VALUES ('BUILDING_TEXASRANCH', 'RESOURCE_SHEEP');

INSERT INTO Building_LocalResourceOrs (BuildingType,          ResourceType  )
                               VALUES ('BUILDING_TEXASRANCH', 'RESOURCE_COW');

-- 4 total SQL entries for Building_LocalResourceOrs

--==================================================
-- Building_ResourceYieldChanges
--==================================================
INSERT INTO Building_ResourceYieldChanges (BuildingType,          ResourceType,     YieldType,          Yield)
                                   VALUES ('BUILDING_TEXASRANCH', 'RESOURCE_SHEEP', 'YIELD_PRODUCTION', '1'  );

INSERT INTO Building_ResourceYieldChanges (BuildingType,          ResourceType,     YieldType,          Yield)
                                   VALUES ('BUILDING_TEXASRANCH', 'RESOURCE_HORSE', 'YIELD_PRODUCTION', '1'  );

INSERT INTO Building_ResourceYieldChanges (BuildingType,          ResourceType,   YieldType,          Yield)
                                   VALUES ('BUILDING_TEXASRANCH', 'RESOURCE_COW', 'YIELD_PRODUCTION', '1'  );

INSERT INTO Building_ResourceYieldChanges (BuildingType,          ResourceType,     YieldType,    Yield)
                                   VALUES ('BUILDING_TEXASRANCH', 'RESOURCE_SHEEP', 'YIELD_FOOD', '1'  );

INSERT INTO Building_ResourceYieldChanges (BuildingType,          ResourceType,     YieldType,       Yield)
                                   VALUES ('BUILDING_TEXASRANCH', 'RESOURCE_HORSE', 'YIELD_CULTURE', '1'  );

INSERT INTO Building_ResourceYieldChanges (BuildingType,          ResourceType,   YieldType,    Yield)
                                   VALUES ('BUILDING_TEXASRANCH', 'RESOURCE_COW', 'YIELD_FOOD', '1'  );

-- 8 total SQL entries for Building_ResourceYieldChanges

--==================================================
-- Building_UnitCombatProductionModifiers
--==================================================
INSERT INTO Building_UnitCombatProductionModifiers (BuildingType,          UnitCombatType,       Modifier)
                                            VALUES ('BUILDING_TEXASRANCH', 'UNITCOMBAT_MOUNTED', '15'    );

-- 1 total SQL entries for Building_UnitCombatProductionModifiers

