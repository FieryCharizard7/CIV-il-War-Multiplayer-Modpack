--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_SHOSHONE")
		THEN "_SHOSHONE"
		ELSE "_AMER" END
	) WHERE Type = "CIVILIZATION_SIOUX_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							  CultureType,	CultureEra)
VALUES		('CIVILIZATION_SIOUX_MOD',		'FIRST_AMERICANS',		 'ANY'),
			('CIVILIZATION_SIOUX_MOD',		     'US_WESTERN',	  'MODERN');

--JFD
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                                        text                                        default null,
    Value                                       integer                                     default 1);

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,												 FlavorType,    Flavor)
VALUES      ('LEADER_SIOUX_SITTING_BULL_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         0);

--Prestige
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    LegislatureName                 text                                                        default null,
    OfficeTitle                     text                                                        default null,
    GovernmentType                  text                                                        default null,
    Weight                          integer                                                     default 0);

CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    HeadOfGovernmentName            text                                                        default null);

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Titles (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    ReligionType                    text        REFERENCES Religions(Type)                      default null,
    DefaultTitle                    text                                                        default null,
    UniqueTitle                     text                                                        default null,
    UseAdjective                    boolean                                                     default 0); 

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Politics (
    CivilizationType                    text        REFERENCES Civilizations(Type)                  default null,
    PoliticsType                        text                                                        default null,
    UniqueName                          text                                                        default null);

INSERT INTO Civilization_JFD_Governments
        (CivilizationType,          LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT  ('CIVILIZATION_SIOUX_MOD'), LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,          HeadOfGovernmentName)
SELECT  ('CIVILIZATION_SIOUX_MOD'), HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';

INSERT INTO Civilization_JFD_Titles
        (CivilizationType,          DefaultTitle,   UniqueTitle)
SELECT  ('CIVILIZATION_SIOUX_MOD'), DefaultTitle,   UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';

INSERT INTO Civilization_JFD_Politics
        (CivilizationType,          PoliticsType, UniqueName)
SELECT  ('CIVILIZATION_SIOUX_MOD'), PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';

INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
        ('FLAVOR_JFD_REFORM_CULTURE'),
        ('FLAVOR_JFD_REFORM_ECONOMIC'),
        ('FLAVOR_JFD_REFORM_FOREIGN'),
        ('FLAVOR_JFD_REFORM_INDUSTRY'),
        ('FLAVOR_JFD_REFORM_MILITARY'),
        ('FLAVOR_JFD_REFORM_RELIGION');

INSERT INTO Leader_Flavors
        (LeaderType,							                 FlavorType,                         Flavor)
VALUES  ('LEADER_SIOUX_SITTING_BULL_MOD',    'FLAVOR_JFD_REFORM_GOVERNMENT',                              2),
        ('LEADER_SIOUX_SITTING_BULL_MOD',       'FLAVOR_JFD_REFORM_CULTURE',                              5),
        ('LEADER_SIOUX_SITTING_BULL_MOD',      'FLAVOR_JFD_REFORM_ECONOMIC',                              2),
        ('LEADER_SIOUX_SITTING_BULL_MOD',       'FLAVOR_JFD_REFORM_FOREIGN',                              5),
        ('LEADER_SIOUX_SITTING_BULL_MOD',      'FLAVOR_JFD_REFORM_INDUSTRY',                              2),
        ('LEADER_SIOUX_SITTING_BULL_MOD',      'FLAVOR_JFD_REFORM_RELIGION',                              2);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	('CIVILIZATION_SIOUX_MOD'),	ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_TribalAmerican'
WHERE Type = 'CIVILIZATION_SIOUX_MOD'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_TribalAmerican')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

--Bison
UPDATE Resources SET Civilopedia =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_SIOUX_MOD" )
		THEN "TXT_KEY_RESOURCE_SIOUX_BISON_MOD_TEXT"
		ELSE "TXT_KEY_RESOURCE_SIOUX_BISON_MOD_TEXT" END
    ) WHERE Type = "RESOURCE_BISON";

UPDATE Resources SET Help =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_SIOUX_MOD" )
		THEN "TXT_KEY_RESOURCE_STANDARD_BISON_MOD_HELP"
		ELSE "TXT_KEY_RESOURCE_STANDARD_BISON_MOD_HELP" END
    ) WHERE Type = "RESOURCE_BISON";

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
 
INSERT OR REPLACE INTO Leader_SharedTraits
			(LeaderType,														   TraitOne,					 TraitTwo)
SELECT		('LEADER_SIOUX_SITTING_BULL_MOD'),		               ('POLICY_CHARISMATIC_X'),	    ('POLICY_EXPANSIVE_X')
WHERE EXISTS (SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X'); 
     
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Sitting Bull[ICON_HAPPINESS_1][ICON_FOOD]'
	ELSE 'TXT_KEY_SIOUX_SITTING_BULL_MOD_DESC' END) 
WHERE Type = 'LEADER_SIOUX_SITTING_BULL_MOD';

CREATE TRIGGER CivIVTraitsSioux
AFTER INSERT ON Leaders WHEN 'LEADER_SIOUX_SITTING_BULL_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Sitting Bull[ICON_HAPPINESS_1][ICON_FOOD]'
		ELSE 'TXT_KEY_SIOUX_SITTING_BULL_MOD_DESC' END) 
	WHERE Type = 'LEADER_SIOUX_SITTING_BULL_MOD';
END;	

--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,								LinguisticType)
VALUES		('CIVILIZATION_SIOUX_MOD', 			null,									'JFD_NorthAmerican');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,				RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_SIOUX_MOD',			   'CIVILIZATION_AMERICA');

--Mercenaries 
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');

INSERT INTO Leader_Flavors
        (LeaderType,									      FlavorType,                 Flavor)
VALUES  ('LEADER_SIOUX_SITTING_BULL_MOD',         'FLAVOR_JFD_MERCENARY',                      3);

--Cultural Development
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
			(Description,								                            CivilizationType,						                CultureType)
VALUES		('TXT_KEY_EVENT_CULDEV_TOMATEKH_SIOUX_01',			            'CIVILIZATION_SIOUX_MOD',					           'JFD_TribalAmerican');

--EE
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SIOUX_HORSEMAN_MOD' AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');

INSERT INTO Unit_ClassUpgrades
			(UnitType, UnitClassType)
SELECT		('UNIT_SIOUX_HORSEMAN_MOD'),	('UNITCLASS_EE_CUIRASSIER')		 
WHERE EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');

UPDATE Units
SET ObsoleteTech = 'TECH_EE_IMPERIALISM'
WHERE Type = 'UNIT_SIOUX_HORSEMAN_MOD'
AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_CUIRASSIER');

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_CUIRASSIER'
WHERE Type = 'UNIT_SIOUX_HORSEMAN_MOD'
AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_CUIRASSIER');

CREATE TRIGGER TimuridLancerEE
AFTER INSERT ON Buildings WHEN 'BUILDING_EE_CRYSTAL_PALACE' = NEW.TYPE
BEGIN

	DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SIOUX_HORSEMAN_MOD' AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');

	INSERT INTO Unit_ClassUpgrades
				(UnitType, UnitClassType)
	SELECT		('UNIT_SIOUX_HORSEMAN_MOD'),	('UNITCLASS_EE_CUIRASSIER')		 
	WHERE EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');

	UPDATE Units
	SET ObsoleteTech = 'TECH_EE_IMPERIALISM'
	WHERE Type = 'UNIT_SIOUX_HORSEMAN_MOD'
	AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_CUIRASSIER');

	UPDATE Units
	SET GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_CUIRASSIER'
	WHERE Type = 'UNIT_SIOUX_HORSEMAN_MOD'
	AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_CUIRASSIER');

END;

--CiD
INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_SIOUX_TIPI_MOD',			'YIELD_JFD_DEVELOPMENT',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

CREATE TRIGGER SiouxDevelopmentTipi
AFTER INSERT ON Buildings WHEN 'BUILDING_JFD_DEVELOPMENT_DEFICIT_CRIME' = NEW.TYPE
BEGIN

	INSERT INTO Improvement_Yields
			(ImprovementType, 						YieldType,					Yield)
	SELECT	'IMPROVEMENT_SIOUX_TIPI_MOD',			'YIELD_JFD_DEVELOPMENT',	10
	WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

END;