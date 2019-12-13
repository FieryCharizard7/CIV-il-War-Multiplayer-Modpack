--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,				TraitOne,                  TraitTwo)
VALUES      ('LEADER_JFD_LINCOLN',		'POLICY_CHARISMATIC_X',		'POLICY_PROTECTIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Lincoln [ICON_HAPPINESS_1][ICON_STRENGTH]'
	ELSE 'TXT_KEY_LEADER_JFD_LINCOLN' END) 
WHERE Type = 'LEADER_JFD_LINCOLN';

CREATE TRIGGER CivIVTraitsAmericaLincoln
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_LINCOLN' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Lincoln [ICON_HAPPINESS_1][ICON_STRENGTH]'
		ELSE 'TXT_KEY_LEADER_JFD_LINCOLN' END) 
	WHERE Type = 'LEADER_JFD_LINCOLN';
END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_AMERICA' )
	THEN '_AMERICA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_AMERICA_LINCOLN';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	X,	Y
FROM Civilizations_YagemStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	X,	Y
FROM Civilizations_YahemStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	X,	Y
FROM Civilizations_CordiformStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	X,	Y
FROM Civilizations_NorthAtlanticStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	X,	Y
FROM Civilizations_AmericasStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,								CultureType,		CultureEra)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN',	'BRITISH',			'ANY'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'FIRST_AMERICANS',	'ANY'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'SPANISH',			'MODERN');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	CultureType 								text										default null,
	SplashScreenTag								text										default	null,
	SoundtrackTag								text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,						CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN',	'JFD_Colonial',		'JFD_Colonial',		'JFD_Colonial');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Colonial' )
	THEN 'JFD_Colonial'
	ELSE 'America' END) 
WHERE Type = 'CIVILIZATION_JFD_AMERICA_LINCOLN';
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,										LinguisticType)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN',	null,											'JFD_Germanic'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	null,											'JFD_Latinate'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_01',	null),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_02',	null),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_03',	null),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_04',	null),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_05',	null),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_06',	null),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_07',	null),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_08',	null),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_09',	null),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_10',	null),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_11',	null),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_LINCOLN_12',	null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_AMERICA',				'CIVILIZATION_JFD_AMERICA_LINCOLN'),
			('CIVILIZATION_ENGLAND',				'CIVILIZATION_JFD_AMERICA_LINCOLN'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN',	'CIVILIZATION_AMERICA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),	('CIVILIZATION_JFD_AMERICA_ROOSEVELT')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_AMERICA_ROOSEVELT');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_GREAT_BRITAIN'),		('CIVILIZATION_JFD_AMERICA_LINCOLN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_GREAT_BRITAIN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_AMERICA_HENRY'),		('CIVILIZATION_JFD_AMERICA_LINCOLN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_AMERICA_HENRY');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
			(LeaderType,				FlavorType,								Flavor)
VALUES		('LEADER_JFD_LINCOLN',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_AmericaLincoln_Decisions.lua');
------------------------------	
-- Policies
------------------------------
INSERT INTO Policies 	
			(Type, 						 					Description,											ExtraHappinessPerCity)
VALUES		('POLICY_JFD_AMERICA_LINCOLN_EMANCIPATION', 	'TXT_KEY_DECISIONS_AMERICAEMANCIPATION',				1),
			('POLICY_JFD_AMERICA_ANACONDA_PLAN', 			'TXT_KEY_DECISIONS_JFD_AMERICA_LINCOLN_ANACONDA_PLAN',	0);
------------------------------
-- Policy_FreePromotions
------------------------------
INSERT INTO Policy_FreePromotions 
			(PolicyType, 								PromotionType) 
VALUES 		('POLICY_JFD_AMERICA_ANACONDA_PLAN',		'PROMOTION_JFD_ANACONDA');
------------------------------	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 						 				DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_JFD_AMERICA_CONSTITUTION', 	'BUILDING_JFD_AMERICA_CONSTITUTION', 	'TXT_KEY_BUILDING_JFD_AMERICA_CONSTITUTION');
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 								GreatWorkCount, Cost, FaithCost, PrereqTech, FreePolicies,	XBuiltTriggersIdeologyChoice,	NeverCapture,	Description, 									Help)
VALUES		('BUILDING_JFD_AMERICA_CONSTITUTION', 	'BUILDINGCLASS_JFD_AMERICA_CONSTITUTION', 	-1, 			-1,   -1, 		 null, 		 1,				1,								1,				'TXT_KEY_BUILDING_JFD_AMERICA_CONSTITUTION', 	'TXT_KEY_BUILDING_JFD_AMERICA_CONSTITUTION_HELP');
------------------------------
-- UnitPromotions
------------------------------	
INSERT INTO UnitPromotions 
			(Type, 							Description, 						Help, 										Sound, 				FlankAttackModifier,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_ANACONDA',		'TXT_KEY_PROMOTION_JFD_ANACONDA',	'TXT_KEY_PROMOTION_JFD_ANACONDA_HELP', 		'AS2D_IF_LEVELUP',	25, 					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ANACONDA');
------------------------------
-- UnitPromotions_UnitCombats
------------------------------	
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType, 				UnitCombatType)
VALUES		('PROMOTION_JFD_ANACONDA',		'UNITCOMBAT_GUN');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_AmericaLincoln_Events.lua');
------------------------------	
-- Policies
------------------------------
INSERT INTO Policies 	
			(Type, 						 				Description)
VALUES		('POLICY_JFD_AMERICA_LINCOLN_CIVIL_WAR', 	'TXT_KEY_EVENT_JFD_AMERICA_LINCOLN_CIVIL_WAR');
------------------------------
-- Units
------------------------------
INSERT INTO Units 	
			(Class, 				Type, 					Cost,	Moves,	Domain,			DefaultUnitAI,		Description, 				ShowInPedia, 	AdvancedStartCost,	UnitArtInfo, 			UnitFlagIconOffset,		UnitArtInfoEraVariation,	PortraitIndex,	IconAtlas, 		MoveRate)
VALUES		('UNITCLASS_WRITER',	'UNIT_JFD_ULYSSES', 	-1,		2,		'DOMAIN_LAND',	'UNITAI_WRITER',	'TXT_KEY_UNIT_JFD_ULYSSES',	0,				-1,					'ART_DEF_UNIT_GENERAL',	90,						1,							48, 			'UNIT_ATLAS_2',	'GREAT_PERSON');
------------------------------
-- UnitGameplay2DScripts
------------------------------
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_ULYSSES'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WRITER');	
------------------------------
-- Unit_UniqueNames
------------------------------
INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName,									GreatWorkType)
VALUES		('UNIT_JFD_ULYSSES', 	'TXT_KEY_GREAT_PERSON_ULYSSES_DESC',	'GREAT_WORK_ULYSSES');
------------------------------	
-- GreatWorks
------------------------------	
INSERT INTO GreatWorks 
			(Type, 					GreatWorkClassType,			Description,						Quote,									Audio,							Image)
VALUES		('GREAT_WORK_ULYSSES', 	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_JFD_ULYSSES',	'TXT_KEY_GREAT_WORK_QUOTE_JFD_ULYSSES',	'AS2D_GREAT_ARTIST_ARTWORK',	'GreatWriter_Background.dds');			
------------------------------
-- UnitPromotions
------------------------------	
INSERT INTO UnitPromotions 
			(Type, 						Description, 						Help, 									Sound, 				IgnoreZOC,	IgnoreTerrainCost,	NearbyEnemyCombatMod,	NearbyEnemyCombatRange, CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_ULYSSES',	'TXT_KEY_PROMOTION_JFD_ULYSSES',	'TXT_KEY_PROMOTION_JFD_ULYSSES_HELP',	'AS2D_IF_LEVELUP',	1, 			1, 					-5, 					1, 						1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ULYSSES');
--==========================================================================================================================
-- Tomatekh's Historical Religions
--==========================================================================================================================
-- Civilizations
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_CALVINISM' )
	THEN 'RELIGION_PROTESTANT_CALVINISM'
	ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
	THEN 'RELIGION_PROTESTANTISM'
	ELSE 'RELIGION_CHRISTIANITY' END ) END
) WHERE CivilizationType IN ('CIVILIZATION_JFD_AMERICA_LINCOLN');

CREATE TRIGGER ReligionAmericaLincoln
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_CALVINISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_CALVINISM' )
		THEN 'RELIGION_PROTESTANT_CALVINISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType IN ('CIVILIZATION_JFD_AMERICA_LINCOLN');
END;
--==========================================================================================================================
--==========================================================================================================================