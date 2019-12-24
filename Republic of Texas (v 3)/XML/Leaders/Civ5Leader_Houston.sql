-- Created by Kaduseon's XML to SQL+XML Translator-Splitter on 8/07/2015 8:46:30 PM
--==================================================
-- Leaders
--==================================================
INSERT INTO Leaders (Type,             Description,              Civilopedia,                    CivilopediaTag,                        ArtDefineTag,        VictoryCompetitiveness, WonderCompetitiveness, MinorCivCompetitiveness, Boldness, DiploBalance, WarmongerHate, DenounceWillingness, DoFWillingness, Loyalty, Neediness, Forgiveness, Chattiness, Meanness, PortraitIndex, IconAtlas              )
             VALUES ('LEADER_HOUSTON', 'TXT_KEY_LEADER_HOUSTON', 'TXT_KEY_LEADER_HOUSTON_PEDIA', 'TXT_KEY_CIVILOPEDIA_LEADERS_HOUSTON', 'Houston_Scene.xml', '7',                    '4',                   '4',                     '7',      '6',          '5',           '5',                 '7',            '9',     '5',       '2',         '5',        '4',      '1',           'CIV_COLOR_ATLAS_TEXAS');

-- 1 total SQL entries for Leaders

--==================================================
-- Leader_MajorCivApproachBiases
--==================================================
INSERT INTO Leader_MajorCivApproachBiases (LeaderType,       MajorCivApproachType,     Bias)
                                   VALUES ('LEADER_HOUSTON', 'MAJOR_CIV_APPROACH_WAR', '5' );

INSERT INTO Leader_MajorCivApproachBiases (LeaderType,       MajorCivApproachType,         Bias)
                                   VALUES ('LEADER_HOUSTON', 'MAJOR_CIV_APPROACH_HOSTILE', '4' );

INSERT INTO Leader_MajorCivApproachBiases (LeaderType,       MajorCivApproachType,           Bias)
                                   VALUES ('LEADER_HOUSTON', 'MAJOR_CIV_APPROACH_DECEPTIVE', '5' );

INSERT INTO Leader_MajorCivApproachBiases (LeaderType,       MajorCivApproachType,         Bias)
                                   VALUES ('LEADER_HOUSTON', 'MAJOR_CIV_APPROACH_GUARDED', '6' );

INSERT INTO Leader_MajorCivApproachBiases (LeaderType,       MajorCivApproachType,        Bias)
                                   VALUES ('LEADER_HOUSTON', 'MAJOR_CIV_APPROACH_AFRAID', '3' );

INSERT INTO Leader_MajorCivApproachBiases (LeaderType,       MajorCivApproachType,          Bias)
                                   VALUES ('LEADER_HOUSTON', 'MAJOR_CIV_APPROACH_FRIENDLY', '7' );

INSERT INTO Leader_MajorCivApproachBiases (LeaderType,       MajorCivApproachType,         Bias)
                                   VALUES ('LEADER_HOUSTON', 'MAJOR_CIV_APPROACH_NEUTRAL', '6' );

-- 7 total SQL entries for Leader_MajorCivApproachBiases

--==================================================
-- Leader_MinorCivApproachBiases
--==================================================
INSERT INTO Leader_MinorCivApproachBiases (LeaderType,       MinorCivApproachType,        Bias)
                                   VALUES ('LEADER_HOUSTON', 'MINOR_CIV_APPROACH_IGNORE', '6' );

INSERT INTO Leader_MinorCivApproachBiases (LeaderType,       MinorCivApproachType,          Bias)
                                   VALUES ('LEADER_HOUSTON', 'MINOR_CIV_APPROACH_FRIENDLY', '7' );

INSERT INTO Leader_MinorCivApproachBiases (LeaderType,       MinorCivApproachType,            Bias)
                                   VALUES ('LEADER_HOUSTON', 'MINOR_CIV_APPROACH_PROTECTIVE', '7' );

INSERT INTO Leader_MinorCivApproachBiases (LeaderType,       MinorCivApproachType,          Bias)
                                   VALUES ('LEADER_HOUSTON', 'MINOR_CIV_APPROACH_CONQUEST', '4' );

INSERT INTO Leader_MinorCivApproachBiases (LeaderType,       MinorCivApproachType,       Bias)
                                   VALUES ('LEADER_HOUSTON', 'MINOR_CIV_APPROACH_BULLY', '5' );

-- 5 total SQL entries for Leader_MinorCivApproachBiases

--==================================================
-- Leader_Flavors
--==================================================
INSERT INTO Leader_Flavors (LeaderType,       FlavorType,       Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_OFFENSE', '7'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,       Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_DEFENSE', '10'  );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,            Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_CITY_DEFENSE', '8'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,                 Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_MILITARY_TRAINING', '8'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,     Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_RECON', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,      Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_RANGED', '5'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,      Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_MOBILE', '8'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,     Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_NAVAL', '5'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,           Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_NAVAL_RECON', '5'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,            Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_NAVAL_GROWTH', '5'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,                      Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_NAVAL_TILE_IMPROVEMENT', '5'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,   Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_AIR', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,         Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_EXPANSION', '8'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,      Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_GROWTH', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,                Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_TILE_IMPROVEMENT', '7'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,              Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_INFRASTRUCTURE', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,          Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_PRODUCTION', '7'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,    Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_GOLD', '5'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,       Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_SCIENCE', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,       Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_CULTURE', '7'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,         Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_HAPPINESS', '7'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,            Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_GREAT_PEOPLE', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,      Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_WONDER', '4'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,        Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_RELIGION', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,         Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_DIPLOMACY', '7'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,         Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_SPACESHIP', '7'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,                Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_WATER_CONNECTION', '5'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,    Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_NUKE', '9'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,        Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_USE_NUKE', '9'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,         Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_ESPIONAGE', '7'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,       Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_ANTIAIR', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,           Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_AIR_CARRIER', '5'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,           Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_ARCHAEOLOGY', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,                  Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_I_LAND_TRADE_ROUTE', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,                 Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_I_SEA_TRADE_ROUTE', '4'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,              Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_I_TRADE_ORIGIN', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,                   Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_I_TRADE_DESTINATION', '6'   );

INSERT INTO Leader_Flavors (LeaderType,       FlavorType,       Flavor)
                    VALUES ('LEADER_HOUSTON', 'FLAVOR_AIRLIFT', '6'   );

-- 38 total SQL entries for Leader_Flavors

--==================================================
-- Leader_Traits
--==================================================
INSERT INTO Leader_Traits (LeaderType,       TraitType     )
                   VALUES ('LEADER_HOUSTON', 'TRAIT_TAKEIT');

-- 1 total SQL entries for Leader_Traits

