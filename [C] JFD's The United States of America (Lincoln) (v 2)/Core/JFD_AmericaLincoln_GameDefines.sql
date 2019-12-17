--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_LINCOLN', 		'TXT_KEY_LEADER_JFD_LINCOLN', 		'TXT_KEY_LEADER_JFD_LINCOLN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_LINCOLN', 		'Lincoln_Scene.xml',	3, 						2, 						3, 							3, 			8, 				8, 				4, 						9, 				9, 			3, 			8, 				5, 			1, 			'JFD_AMERICA_LINCOLN_ATLAS', 0);	
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	1),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_GUARDED', 		1),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LINCOLN', 		'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_JFD_LINCOLN', 		'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_LINCOLN', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_JFD_LINCOLN', 		'MINOR_CIV_APPROACH_CONQUEST', 		1),
			('LEADER_JFD_LINCOLN', 		'MINOR_CIV_APPROACH_BULLY', 		1);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_LINCOLN', 		'FLAVOR_OFFENSE', 					3),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_DEFENSE', 					8),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_CITY_DEFENSE', 				8),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_RECON', 					4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_RANGED', 					3),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_NAVAL', 					6),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_AIR', 						4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_EXPANSION', 				4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_GROWTH', 					3),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_GOLD', 						4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_CULTURE', 					5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_HAPPINESS', 				7),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_WONDER', 					3),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_RELIGION', 					2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_DIPLOMACY', 				4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_NUKE', 						2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_ESPIONAGE', 				2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_LINCOLN', 		'TRAIT_JFD_AMERICA_LINCOLN');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 							Description, 							ShortDescription)
VALUES		('TRAIT_JFD_AMERICA_LINCOLN', 	'TXT_KEY_TRAIT_JFD_AMERICA_LINCOLN', 	'TXT_KEY_TRAIT_JFD_AMERICA_LINCOLN_SHORT');
--==========================================================================================================================	
-- POLICIES
--==========================================================================================================================	
-- Policies
--------------------------------	
INSERT INTO Policies
			(Type, 							Description,							UnitGoldMaintenanceMod, UnhappinessMod, GreatGeneralRateModifier, 	GreatAdmiralRateModifier, 	UnitPurchaseCostModifier, 	MilitaryProductionModifier)
VALUES		('POLICY_JFD_LINCOLN_SPEECH_1',	'TXT_KEY_JFD_LINCOLN_SPEECH_1_BUTTON',	0,						0,				0, 							0, 							0, 							0),
			('POLICY_JFD_LINCOLN_SPEECH_2',	'TXT_KEY_JFD_LINCOLN_SPEECH_2_BUTTON',	-15,					0,				0, 							0, 							0, 							0),
			('POLICY_JFD_LINCOLN_SPEECH_3', 'TXT_KEY_JFD_LINCOLN_SPEECH_3_BUTTON',	0,						0,				30, 						30, 						0, 							0),
			('POLICY_JFD_LINCOLN_SPEECH_4',	'TXT_KEY_JFD_LINCOLN_SPEECH_4_BUTTON',	0,						0,				0, 							0, 							0, 							20),
			('POLICY_JFD_LINCOLN_SPEECH_5',	'TXT_KEY_JFD_LINCOLN_SPEECH_5_BUTTON',	0,						-15,			0, 							0, 							0, 							0),
			('POLICY_JFD_LINCOLN_SPEECH_6',	'TXT_KEY_JFD_LINCOLN_SPEECH_6_BUTTON',	0,						0,				0, 							0, 							-15, 						0);			
--------------------------------	
-- Policy_FreePromotions
--------------------------------	
INSERT INTO Policy_FreePromotions 
			(PolicyType, 						PromotionType)
VALUES		('POLICY_JFD_LINCOLN_SPEECH_1', 	'PROMOTION_JFD_LINCOLN_SPEECH_1');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 									Description, 								Help, 												Sound, 				AttackMod,	DefenseMod,	AdjacentTileHealChange, CityAttack, CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_LINCOLN_SPEECH_1',		'TXT_KEY_PROMOTION_JFD_LINCOLN_SPEECH_1',	'TXT_KEY_PROMOTION_JFD_LINCOLN_SPEECH_1_HELP', 		'AS2D_IF_LEVELUP',	15, 		0, 			0, 						0, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LINCOLN_SPEECH_1'),
			('PROMOTION_JFD_PARROTT_DEFENSE', 		'TXT_KEY_PROMOTION_JFD_PARROTT_DEFENSE',	'TXT_KEY_PROMOTION_JFD_PARROTT_DEFENSE_HELP', 		'AS2D_IF_LEVELUP',	10, 		10, 		0, 						0, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PARROTT_DEFENSE'),
			('PROMOTION_JFD_PARROTT_RIFLE', 		'TXT_KEY_PROMOTION_JFD_PARROTT_RIFLE',		'TXT_KEY_PROMOTION_JFD_PARROTT_RIFLE_HELP', 		'AS2D_IF_LEVELUP', 	0, 			0, 			0, 						0, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PARROTT_RIFLE'),
			('PROMOTION_JFD_BONUS_VS_LAND', 		'TXT_KEY_PROMOTION_JFD_BONUS_VS_LAND',		'TXT_KEY_PROMOTION_JFD_BONUS_VS_LAND_HELP', 		'AS2D_IF_LEVELUP', 	0, 			0, 			0, 						0, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BONUS_VS_LAND'),
			('PROMOTION_JFD_BONUS_VS_CITIES', 		'TXT_KEY_PROMOTION_JFD_BONUS_VS_CITIES',	'TXT_KEY_PROMOTION_JFD_BONUS_VS_CITIES_HELP', 		'AS2D_IF_LEVELUP', 	0, 			0, 			0, 						100, 		1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BONUS_VS_CITIES');
------------------------------
-- UnitPromotions_Domains
------------------------------	
INSERT INTO UnitPromotions_Domains
		(PromotionType, 				DomainType, 	Modifier)
VALUES	('PROMOTION_JFD_BONUS_VS_LAND', 'DOMAIN_LAND', 	50);
------------------------------
-- UnitPromotions_UnitCombats
------------------------------	
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType, 						UnitCombatType)
SELECT 		('PROMOTION_JFD_LINCOLN_SPEECH_1'),		Type
FROM UnitCombatInfos;
--=======================================================================================================================
-- UNITCLASSES
--=======================================================================================================================
-- UnitClasses
------------------------------	
INSERT INTO UnitClasses
			(Type, 							DefaultUnit, 						Description)
VALUES		('UNITCLASS_JFD_MONITOR', 		'UNIT_JFD_DUMMY_MONITOR_RANGED', 	'TXT_KEY_UNIT_JFD_MONITOR_MELEE');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
------------------------------	
INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech, Combat,	RangedCombat, 	Range,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, 	Domain, DefaultUnitAI, Description, 						Civilopedia, 											Strategy, 										Help, 									 Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 								UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		Class,		('UNIT_JFD_PARROTT_RIFLE'),	PrereqTech, Combat,	RangedCombat, 	Range, 	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, 	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_PARROTT_RIFLE'),	('TXT_KEY_CIVIL_WAR_SCENARIO_UNIT_RIFLED_CANNON_TEXT'), ('TXT_KEY_UNIT_JFD_PARROTT_RIFLE_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_PARROTT_RIFLE'), Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_UNION_ARTILLERY_PARROTT'), 	2,					('CIVIL_WAR_UNIT_FLAG_ATLAS'),	10, 			('CIVIL_WAR_UNIT_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_CANNON');

INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech, Combat,	Cost,		FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 							Civilopedia, 										Strategy, 								Help, 							Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		Class,		('UNIT_JFD_MONITOR_MELEE'), PrereqTech, Combat,	Cost+40,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_MONITOR_MELEE'),	('TXT_KEY_CIVIL_WAR_SCENARIO_UNIT_MONITOR_TEXT'), 	('TXT_KEY_UNIT_JFD_MONITOR_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_MONITOR'), 	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_UNION_IRONCLAD'), 	1,					('CIVIL_WAR_UNIT_FLAG_ATLAS'),	9, 				('CIVIL_WAR_UNIT_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_IRONCLAD');

INSERT INTO Units 	
			(Class, 						Type, 								ShowInPedia,	PrereqTech, Cost,	FaithCost,	Description, 							Help, 								PortraitIndex, 	IconAtlas)
SELECT		('UNITCLASS_JFD_MONITOR'),		('UNIT_JFD_DUMMY_MONITOR_RANGED'),	0,				null,		-1,		-1,			('TXT_KEY_UNIT_JFD_MONITOR_RANGED'),	('TXT_KEY_UNIT_HELP_JFD_MONITOR'), 	9, 				('CIVIL_WAR_UNIT_ATLAS')
FROM Units WHERE (Type = 'UNIT_IRONCLAD');

INSERT INTO Units 	
			(Class, 						Type, 							ShowInPedia,	PrereqTech, Combat,	RangedCombat, 	Range,	Cost,		FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, 					Domain, DefaultUnitAI, Description, 						Civilopedia, 										Strategy, 								Help, 								Mechanized, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		('UNITCLASS_JFD_MONITOR'),		('UNIT_JFD_MONITOR_RANGED'),	0,				null,		Combat,	28, 			3, 		Cost+50,	FaithCost, RequiresFaithPurchaseEnabled, Moves, ('UNITCOMBAT_NAVALRANGED'), 	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_MONITOR_RANGED'),	('TXT_KEY_CIVIL_WAR_SCENARIO_UNIT_MONITOR_TEXT'), 	('TXT_KEY_UNIT_JFD_MONITOR_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_MONITOR'), 	Mechanized, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_UNION_IRONCLAD'), 	1,					('CIVIL_WAR_UNIT_FLAG_ATLAS'),	9, 				('CIVIL_WAR_UNIT_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_IRONCLAD');
------------------------------	
-- UnitGameplay2DScripts
------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_PARROTT_RIFLE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CANNON');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_MONITOR_MELEE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_IRONCLAD');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_MONITOR_RANGED'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_IRONCLAD');	
------------------------------	
-- Unit_AITypes
------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_PARROTT_RIFLE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CANNON');	

INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_MONITOR_MELEE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_IRONCLAD');	

INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_MONITOR_RANGED'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_IRONCLAD');	
------------------------------	
-- Unit_ClassUpgrades
------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_PARROTT_RIFLE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CANNON');	

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_MONITOR_MELEE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_IRONCLAD');	

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
VALUES		('UNIT_JFD_MONITOR_RANGED', 	'UNITCLASS_BATTLESHIP');
------------------------------	
-- Unit_Flavors
------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_PARROTT_RIFLE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CANNON');

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_MONITOR_MELEE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_IRONCLAD');	

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_MONITOR_RANGED'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_IRONCLAD');	
------------------------------	
-- Unit_ResourceQuantityRequirements
------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 						ResourceType)
SELECT		('UNIT_JFD_MONITOR_MELEE'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_IRONCLAD');	

INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 						ResourceType)
SELECT		('UNIT_JFD_MONITOR_RANGED'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_IRONCLAD');	
------------------------------
-- Unit_FreePromotions
------------------------------
INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_NO_DEFENSIVE_BONUSES'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_SIGHT_PENALTY'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_MUST_SET_UP'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_JFD_BONUS_VS_LAND'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_JFD_BONUS_VS_CITIES'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_JFD_PARROTT_RIFLE'),
			('UNIT_JFD_MONITOR_MELEE', 		'PROMOTION_SUPPLY'),
			('UNIT_JFD_MONITOR_MELEE', 		'PROMOTION_STEAM_POWERED'),
			('UNIT_JFD_MONITOR_MELEE', 		'PROMOTION_FIRE_SUPPORT'),
			('UNIT_JFD_MONITOR_MELEE', 		'PROMOTION_MEDIC'),
			('UNIT_JFD_MONITOR_RANGED', 	'PROMOTION_JFD_BONUS_VS_CITIES'),
			('UNIT_JFD_MONITOR_RANGED', 	'PROMOTION_INDIRECT_FIRE'),
			('UNIT_JFD_MONITOR_RANGED', 	'PROMOTION_MUST_SET_UP'),
			('UNIT_JFD_MONITOR_RANGED', 	'PROMOTION_STEAM_POWERED'),
			('UNIT_JFD_MONITOR_RANGED', 	'PROMOTION_FIRE_SUPPORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
--To enable the alternative map showing clearer distinction between the United States and the Confederate States, change "LincolnAmericaMap512.dds" below to "LincolnAmericaMap512Alt.dds".
INSERT INTO Civilizations 	
			(Type, 										Description,							ShortDescription, 							Adjective, 								Civilopedia, CivilopediaTag, 	DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 								PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 	MapImage, 						DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		('TXT_KEY_JFD_AMERICA_LINCOLN_DESC'),	('TXT_KEY_JFD_AMERICA_LINCOLN_SHORT_DESC'), ('TXT_KEY_JFD_AMERICA_LINCOLN_ADJ'), 	Civilopedia, CivilopediaTag, 	('PLAYERCOLOR_JFD_AMERICA_LINCOLN'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('CIVIL_WAR_CIV_SYMBOLS_COLOR_ATLAS'), 	0, 				('CIVIL_WAR_CIV_SYMBOLS_WHITE_ATLAS'), 	('America'), 	('LincolnAmericaMap512.dds'),	('TXT_KEY_CIV5_DOM_JFD_LINCOLN_TEXT'), 	('Lincoln_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_AMERICA');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_WASHINGTON'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_NEW_YORK'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_PHILADELPHIA'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_ALBANY'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_BALTIMORE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_BOSTON'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_CINCINNATI'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_ST_LOUIS'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_CHICHAGO'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_LOUISVILLE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_BUFFALO'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_PITTSBURGH'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_DETROIT'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_MILWAUKEE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_CLEVELAND'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_LOWELL'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_NEW_HAVEN'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_NEWARK'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_PROVIDENCE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_ALLEGHENY'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_SYRACUSE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_HARRISBURG'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_WILMINGTON'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_MANCHESTER'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_DAYTON'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_INDIANAPOLIS'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_COLUMBUS'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_WORCESTER'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_UTICA'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_GETTYSBURG');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 							BuildingClassType)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 							TechType)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 							LeaderheadType)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN', 		'LEADER_JFD_LINCOLN');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 							UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN', 		'UNITCLASS_IRONCLAD', 		'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 		'UNITCLASS_CANNON', 		'UNIT_JFD_PARROTT_RIFLE'),
			('CIVILIZATION_PENNSYLVANIA', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_MICHIGAN', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_OHIO', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_CALC_KENTUCKY', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_WISCONSIN', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_WEST_VIRGINIA', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_RHODEISLAND', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_NEW_YORK', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_CALC_IOWA', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_NEW_HAMPSHIRE', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_MASSACHUSETTS', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_ILLINOIS', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_S_NEBRASKA', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_CALC_CONNECTICUT', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED'),
			('CIVILIZATION_MICHIGAN', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_OHIO', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_CALC_KENTUCKY', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_WISCONSIN', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_WEST_VIRGINIA', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_RHODEISLAND', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_NEW_YORK', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_CALC_IOWA', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_NEW_HAMPSHIRE', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_MASSACHUSETTS', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_ILLINOIS', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_S_NEBRASKA', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_CALC_CONNECTICUT', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_PENNSYLVANIA', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_MELEE');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions
			(CivilizationType, 						ReligionType)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN',	'RELIGION_PROTESTANTISM');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------		
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 							StartAlongOcean)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		StartAlongOcean
FROM Civilization_Start_Along_Ocean WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 							SpyName)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--==========================================================================================================================
--==========================================================================================================================