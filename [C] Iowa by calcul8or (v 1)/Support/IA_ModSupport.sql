--==========================================================================================================================
-- Civ IV Leader Traits in Civ V 1153b26a-69fd-4cd5-899c-a8ba8e0e5e5d
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,            TraitOne,                  TraitTwo)
VALUES      ('LEADER_CALCBORLAUG',	'POLICY_PROTECTIVE_X',		'POLICY_MERCANTILE_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Norman Borlaug [ICON_STRENGTH][ICON_GOLD]'
	ELSE 'TXT_KEY_LEADER_CALCBORLAUG' END) 
WHERE Type = 'LEADER_CALCBORLAUG';

CREATE TRIGGER CivIVTraitsCalcIowa
AFTER INSERT ON Leaders WHEN 'LEADER_CALCBORLAUG' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Norman Borlaug [ICON_HAPPINESS_1][ICON_TRADE]'
		ELSE 'TXT_KEY_LEADER_CALCBORLAUG' END) 
	WHERE Type = 'LEADER_CALCBORLAUG';
END;
---==========================================================================================================================
-- JFD's CULTURAL DIVERSITY            31a31d1c-b9d7-45e1-842c-23232d66cd47
-- JFD's CULTURAL DIVERSITY SOUNDTRACK cae0781c-556f-4c97-8fba-4d6eb612533f
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------   
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
    CivilizationType                            text    REFERENCES Civilizations(Type)          default null,
    CultureType                                 text                                            default null,
    ArtDefineTag                                text                                            default null,
    DefeatScreenEarlyTag                        text                                            default null,
    DefeatScreenMidTag                          text                                            default null,
    DefeatScreenLateTag                         text                                            default null,
    IdealsTag                                   text                                            default null,
    SplashScreenTag                             text                                            default null,
    SoundtrackTag                               text                                            default null,
    UnitDialogueTag                             text                                            default null);
 
-- This is an example of support which copies all attributes from an existing civ (i.e. Denmark). For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_NORWAY' to the
-- tag of your custom civ. 
INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,			ArtDefineTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT  'CIVILIZATION_CALC_IOWA',   ArtDefineTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, CultureType, IdealsTag, 'JFD_Colonial',  SoundtrackTag, 'AS2D_SOUND_JFD_AMERICAN'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';
/*
CultureTypes:
  JFD_Andean, JFD_Bantu, JFD_Bharata, JFD_Central, JFD_Colonial, JFD_Eastern, JFD_Islamic, JFD_Katuje, JFD_Mandala, JFD_Mediterranean, JFD_Mesoamerican, JFD_Mesopotamic, JFD_Northern, JFD_Oceanic, JFD_Oriental, JFD_Polar, JFD_Sahul, JFD_Semitic, JFD_Steppe, JFD_Southern, JFD_TribalAmerican, JFD_Totalitarian, JFD_WestAfrican, JFD_Western
 
SplashScreenTags (As above, unless otherwise specified)
  JFD_ColonialLatin, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SouthernPapal
   
SoundtrackTag (As above, unless otherwise specified)
  JFD_MesopotamicEgyptian, JFD_NorthernCeltic, JFD_OrientalJapanese
   
 UnitDialogueTag
    AS2D_SOUND_JFD_AMERICAN, AS2D_SOUND_JFD_AMERICAN_WEST, AS2D_SOUND_JFD_ALBANIAN*, AS2D_SOUND_JFD_ARABIC, AS2D_SOUND_JFD_AZTEC, AS2D_SOUND_JFD_BABYLONIAN, AS2D_SOUND_JFD_BERBER*, AS2D_SOUND_JFD_BYZANTINE, AS2D_SOUND_JFD_CARTHAGINIAN, AS2D_SOUND_JFD_CELTIC, AS2D_SOUND_JFD_CHINESE, AS2D_SOUND_JFD_COMANCHE*, AS2D_SOUND_JFD_DUTCH, AS2D_SOUND_JFD_EGYPTIAN, AS2D_SOUND_JFD_ENGLISH, AS2D_SOUND_JFD_ETHIOPIAN, AS2D_SOUND_JFD_FINNISH*, AS2D_SOUND_JFD_FRENCH, AS2D_SOUND_JFD_GAELIC*, AS2D_SOUND_JFD_GERMAN, AS2D_SOUND_JFD_GREEK, AS2D_SOUND_JFD_HOLY_ROMAN, AS2D_SOUND_JFD_HUNNIC, AS2D_SOUND_JFD_INCAN, AS2D_SOUND_JFD_INDIAN, AS2D_SOUND_JFD_ITALIAN, AS2D_SOUND_JFD_JAPANESE, AS2D_SOUND_JFD_KHMER, AS2D_SOUND_JFD_KOREAN, AS2D_SOUND_JFD_MALINESE, AS2D_SOUND_JFD_MAMLUKE*, AS2D_SOUND_JFD_MAYAN, AS2D_SOUND_JFD_MONGOL, AS2D_SOUND_JFD_NATIVE_AMERICAN (Mohawk), AS2D_SOUND_JFD_OTTOMAN, AS2D_SOUND_JFD_PERSIAN, AS2D_SOUND_JFD_POLISH, AS2D_SOUND_JFD_PORTUGUESE, AS2D_SOUND_JFD_ROMAN, AS2D_SOUND_JFD_RUSSIAN, AS2D_SOUND_JFD_SIAMESE, AS2D_SOUND_JFD_SPANISH, AS2D_SOUND_JFD_SUMERIAN, AS2D_SOUND_JFD_SWEDISH, AS2D_SOUND_JFD_TUPI*, AS2D_SOUND_JFD_VIKING, AS2D_SOUND_JFD_ZAPOTEC*, AS2D_SOUND_JFD_ZULU
     
    *Recommended to only use for Mercenary Units, as these have fewer tracks.
*/
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Colonial'
WHERE Type = 'CIVILIZATION_CALC_IOWA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);

--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
-- Please Note: it is NOT necessary to make any changes to this if you had supported Colony Names under the ExCE ID. 
-- You will only need to add support for Claims if you wish some of your Decisions to cost Dignitaries instead of Magistrates. Examples TBD.
--==========================================================================================================================
------------------------------------------------------------
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------ 

------------------------------------------------------------
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--A value of 0-10 may be set. This value determines the proclivity a civ has toward enslaving a captured city and toward spending Slavery on Units.
INSERT INTO Leader_Flavors
        (LeaderType,             FlavorType,                 Flavor)
VALUES  ('LEADER_CALCBORLAUG',    'FLAVOR_JFD_SLAVERY',       4);
--==========================================================================================================================    
-- JFD's RISE TO POWER: SOVEREIGNTY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    LegislatureName                 text                                                        default null,
    OfficeTitle                     text                                                        default null,
    GovernmentType                  text                                                        default null,
    Weight                          integer                                                     default 0);
 
--This table determines a variety of things relating to your Government.
--The LegislatureName refers to the name of your Legislature (e.g. the Imperial Diet). 
--The OfficeTitle refers to the title of your Head of Government (if a Const. Monarchy) (e.g. Vizier. Default is Prime Minister)
--GovernmentType and Weight prefer to a Government preference (GOVERNMENT_JFD_MONARCHY or GOVERNMENT_JFD_REPUBLIC) and how strong that preference is.
INSERT INTO Civilization_JFD_Governments
        (CivilizationType,        LegislatureName, OfficeTitle, GovernmentType,  Weight)
SELECT  'CIVILIZATION_CALC_IOWA', LegislatureName, OfficeTitle, GovernmentType,  Weight
FROM	Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------------------------------------    
-- Civilization_JFD_HeadsOfGovernment   
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    HeadOfGovernmentName            text                                                        default null);
 
--These are the Heads of your Government, which are randomly chosen when a new Legislature is formed.
--The standard number for each civ is 25. However, you may leave this table empty and your civ will call
--from a cultural list (so long as you have Cultural Diversity support).
INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,        HeadOfGovernmentName)
SELECT	'CIVILIZATION_CALC_IOWA', HeadOfGovernmentName
FROM	Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_AMERICA'; 

------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,			PoliticsType, UniqueName)
SELECT	'CIVILIZATION_CALC_IOWA',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------------------------------------			
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
--Each flavour corresponds to one of the seven Reform Categories, and how likely a civ is to take a reform in either the Right, Centre, or Left column.
--A value of 1-3 will favour Left Reforms. A value of 4-6 will value Centre Reforms. A value of 7-10 will value Right Reforms. The strength of the value will determine how soon a Leader will implement that Reform.
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,							 Flavor)
VALUES	('LEADER_CALCBORLAUG',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 3),
		('LEADER_CALCBORLAUG',	'FLAVOR_JFD_REFORM_CULTURE',		 2),
		('LEADER_CALCBORLAUG',	'FLAVOR_JFD_REFORM_ECONOMIC',		 2),
		('LEADER_CALCBORLAUG',	'FLAVOR_JFD_REFORM_FOREIGN',		 2),
		('LEADER_CALCBORLAUG',	'FLAVOR_JFD_REFORM_INDUSTRY',		 6),
		('LEADER_CALCBORLAUG',	'FLAVOR_JFD_REFORM_LEGAL',			 3),
		('LEADER_CALCBORLAUG',	'FLAVOR_JFD_REFORM_MILITARY',		 5),
		('LEADER_CALCBORLAUG',	'FLAVOR_JFD_REFORM_RELIGION',		 5);
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Currencies (
    CivilizationType                text        REFERENCES Civilizations(Type)  default null,
    CurrencyType                    text                                        default null);
 
INSERT INTO Civilization_JFD_Currencies
        (CivilizationType,                  CurrencyType)
SELECT  'CIVILIZATION_CALC_IOWA', CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_AMERICA';   
--==========================================================================================================================    
-- JFD's AND POUAKAI's MERCENARIES (a19351c5-c0b3-4b07-8695-4affaa199949)
--==========================================================================================================================
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--A value of 0-10 may be set. This value determines the likelihood that a leader will take out Mercenary Contracts (provided they have the funds).
--A value of 10 means this civilization will always take a Contract if available. A value of 0 means this civilization will never take out a contract.
INSERT INTO Leader_Flavors
        (LeaderType,                FlavorType,                Flavor)
VALUES  ('LEADER_CALCBORLAUG',    'FLAVOR_JFD_MERCENARY',     6);
--==========================================================================================================================    
-- JFD's PIETY (RISE TO POWER) (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================    
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--A value of 1-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
            (LeaderType,         FlavorType,                             Flavor)
VALUES      ('LEADER_CALCBORLAUG',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',     7);
--==========================================================================================================================    
-- SUKRITACT'S EVENTS AND DECISIONS (1f941088-b185-4159-865c-472df81247b2)
--==========================================================================================================================  
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('IA_Decisions.lua');

--CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
--INSERT INTO EventsAddin_Support (FileName) VALUES ('AZ_Events.lua');