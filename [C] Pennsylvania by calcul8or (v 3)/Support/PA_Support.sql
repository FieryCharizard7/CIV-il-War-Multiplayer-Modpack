--=======================================================================================================================
-- Civ IV Leader_Traits 1153b26a-69fd-4cd5-899c-a8ba8e0e5e5d
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
            (LeaderType,                    TraitOne,                   TraitTwo)
VALUES      ('LEADER_BENFRANKLIN',		    'POLICY_INVENTIVE_X',		'POLICY_PHILOSOPHICAL_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_SPIRITUAL_X' )
	THEN 'Ben Franklin [ICON_RESEARCH][ICON_GREAT_PEOPLE]'
	ELSE 'TXT_KEY_LEADER_BENFRANKLIN' END) 
WHERE Type = 'LEADER_BENFRANKLIN';

CREATE TRIGGER CivIVTraitsCalcFranklin
AFTER INSERT ON Leaders WHEN 'LEADER_BENFRANKLIN' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_SPIRITUAL_X' )
		THEN 'Ben Franklin [ICON_RESEARCH][ICON_GREAT_PEOPLE]'
		ELSE 'TXT_KEY_LEADER_BENFRANKLIN' END) 
	WHERE Type = 'LEADER_BENFRANKLIN';
END;	

--==========================================================================================================================
-- Civilization_JFD_CultureTypes
--==========================================================================================================================
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

INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,               ArtDefineTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT  ('CIVILIZATION_PENNSYLVANIA'),   ArtDefineTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';
 
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Colonial'
WHERE Type = 'CIVILIZATION_PENNSYLVANIA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial');

--==========================================================================================================================    
-- JFDs RISE TO POWER eea66053-7579-481a-bb8d-2f3959b59974
--==========================================================================================================================   
------------------------------------------------------------
-- Piety
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors 
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
--A value of 1-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
            (LeaderType,            FlavorType,                             Flavor)
VALUES      ('LEADER_BENFRANKLIN',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',     4);
------------------------------------------------------------
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Currencies (
    CivilizationType                text        REFERENCES Civilizations(Type)  default null,
    CurrencyType                    text                                        default null);
 
INSERT INTO Civilization_JFD_Currencies
        (CivilizationType,          CurrencyType)
SELECT  'CIVILIZATION_PENNSYLVANIA', CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_AMERICA';  

------------------------------------------------------------
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
        (CivilizationType,        LegislatureName,  OfficeTitle,  GovernmentType,  Weight)
SELECT  'CIVILIZATION_PENNSYLVANIA',   LegislatureName,  OfficeTitle,  GovernmentType,  Weight
FROM	Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_AMERICA'; 
------------------------------------------------------------    
-- Civilization_JFD_HeadsOfGovernment   
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    HeadOfGovernmentName            text                                                        default null);
 
--These are the Heads of your Government, which are randomly chosen when a new Legislature is formed.
--The standard number for each civ is 25. However, you may leave this table empty and your civ will call
--from a cultural list (so long as you have Cultural Diversity support).
INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      HeadOfGovernmentName)
SELECT  'CIVILIZATION_PENNSYLVANIA', HeadOfGovernmentName
FROM	Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Titles (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    ReligionType                    text        REFERENCES Religions(Type)                      default null,
    DefaultTitle                    text                                                        default null,
    UniqueTitle                     text                                                        default null,
    UseAdjective                    boolean                                                     default 0); 
 
--This lists all the unique titles that a civilization should use instead of a standard one. If left blank, a culture-specific title will be used instead (if CulDiv support).
--The default titles are as follows:
----TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT (Tribe)
----TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER (Chief/Chieftess)
----TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER (Grand Prince)
----TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT (Grand Principality)
----TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER (King/Queen)
----TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT (Kingdom)
----TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER (Emperor/Empress)
----TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_GOVERNMENT (Empire)
----TXT_KEY_GOVERNMENT_JFD_COMMONWEALTH_TITLE_GOVERNMENT (Commonwealth)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER (Consul)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE (President)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_GOVERNMENT (Republic)
----TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER (Dictator)
----TXT_KEY_GOVERNMENT_JFD_FEDERATION_TITLE_GOVERNMENT (Federation)
 
--For 'LEADER' titles, just include the title in the text, e.g. "Pharoah." 
--For 'GOVERNMENT' titles, include a placeholder for your civ's short description, e.g. "Kingdom of {1_CivName}"
--Use 'UseAdjective' when you want the 'GOVERNMENT' title to read (e.g.): "{1_CivAdj} Kingdom" instead of "Kingdom of {1_CivName}"
INSERT INTO Civilization_JFD_Titles
        (CivilizationType,        DefaultTitle,  UniqueTitle)
SELECT  'CIVILIZATION_PENNSYLVANIA',   DefaultTitle,  UniqueTitle
FROM	Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Politics (
    CivilizationType                    text        REFERENCES Civilizations(Type)                  default null,
    PoliticsType                        text                                                        default null,
    UniqueName                          text                                                        default null);
 
--This lists all the unique names for a civ's political parties.
--Political Parties are as follows:
----PARTY_JFD_CLERGY
----PARTY_JFD_NOBILITY
----PARTY_JFD_REVOLUTIONARY
----PARTY_JFD_CONSERVATIVE
----PARTY_JFD_LIBERAL
----PARTY_JFD_REACTIONARY
----PARTY_JFD_SOCIALIST
----PARTY_JFD_COMMUNIST
----PARTY_JFD_FASCIST
----PARTY_JFD_LIBERTARIAN
INSERT INTO Civilization_JFD_Politics
        (CivilizationType,      PoliticsType,               UniqueName)
SELECT  'CIVILIZATION_PENNSYLVANIA', PoliticsType,               UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------------------------------------
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
        ('FLAVOR_JFD_REFORM_CULTURE'),
        ('FLAVOR_JFD_REFORM_ECONOMIC'),
        ('FLAVOR_JFD_REFORM_FOREIGN'),
        ('FLAVOR_JFD_REFORM_INDUSTRY'),
        ('FLAVOR_JFD_REFORM_MILITARY'),
        ('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--Each flavour corresponds to one of the seven Reform Categories, and how likely a civ is to take a reform in either the Right, Centre, or Left column.
--A value of 1-3 will favour Left Reforms. A value of 4-6 will value Centre Reforms. A value of 7-10 will value Right Reforms. The strength of the value will determine how soon a Leader will implement that Reform.
INSERT INTO Leader_Flavors
        (LeaderType,            FlavorType,                         Flavor)
VALUES  ('LEADER_BENFRANKLIN',    'FLAVOR_JFD_REFORM_GOVERNMENT',     3),
        ('LEADER_BENFRANKLIN',    'FLAVOR_JFD_REFORM_CULTURE',        3),
        ('LEADER_BENFRANKLIN',    'FLAVOR_JFD_REFORM_ECONOMIC',       7),
        ('LEADER_BENFRANKLIN',    'FLAVOR_JFD_REFORM_FOREIGN',        3),
        ('LEADER_BENFRANKLIN',    'FLAVOR_JFD_REFORM_INDUSTRY',       2),
        ('LEADER_BENFRANKLIN',    'FLAVOR_JFD_REFORM_MILITARY',       7),
        ('LEADER_BENFRANKLIN',    'FLAVOR_JFD_REFORM_RELIGION',       2);
--==========================================================================================================================  

--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
--==========================================================================================================================
------------------------------------------------------------
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    ColonyName                                  text                                        default null,
    LinguisticType                              text                                        default null,
    CultureType                                 text                                        default null);
/*
JFD_Germanic, JFD_Latinate, JFD_Tai_Khmer, JFD_Austronesian, JFD_Arabic, JFD_Slavic, JFD_Mesopotamian, JFD_Mesoamerican, JFD_Oriental,
JFD_Finno_Ugric, JFD_Semitic, JFD_Hellenic, JFD_Bantu, JFD_Songhay, JFD_Indo_Iranian, JFD_Altaic, JFD_Celtic, JFD_NorthAmerican, JFD_Quechumaran
*/
INSERT INTO Civilization_JFD_ColonialCityNames
        (CivilizationType,                      ColonyName,                             LinguisticType)
VALUES  ('CIVILIZATION_PENNSYLVANIA',             null,                                   'JFD_Germanic'),
        ('CIVILIZATION_PENNSYLVANIA',             null,                                   'JFD_Finno_Ugric'),
        ('CIVILIZATION_PENNSYLVANIA',             'TXT_KEY_COLONY_NAME_PENNSYLVANIA_01',    null),
        ('CIVILIZATION_PENNSYLVANIA',             'TXT_KEY_COLONY_NAME_PENNSYLVANIA_02',    null),
        ('CIVILIZATION_PENNSYLVANIA',             'TXT_KEY_COLONY_NAME_PENNSYLVANIA_03',    null),
        ('CIVILIZATION_PENNSYLVANIA',             'TXT_KEY_COLONY_NAME_PENNSYLVANIA_04',    null),
        ('CIVILIZATION_PENNSYLVANIA',             'TXT_KEY_COLONY_NAME_PENNSYLVANIA_05',    null);
------------------------------------------------------------   
-- Slavery
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--A value of 0-10 may be set. This value determines the proclivity a civ has toward enslaving a captured city and toward spending Slavery on Units.
INSERT INTO Leader_Flavors
        (LeaderType,            FlavorType,                 Flavor)
VALUES  ('LEADER_BENFRANKLIN',   'FLAVOR_JFD_SLAVERY',       4);
--==========================================================================================================================    
-- JFD and Pouakai's Mercenaries a19351c5-c0b3-4b07-8695-4affaa199949
--==========================================================================================================================     
INSERT INTO Leader_Flavors
			(LeaderType,			FlavorType,					Flavor)
VALUES		('LEADER_BENFRANKLIN',	'FLAVOR_JFD_MERCENARY',		6);

--==========================================================================================================================    
-- ENLIGHTENMENT ERA ce8aa614-7ef7-4a45-a179-5329869e8d6d
--==========================================================================================================================  
UPDATE Unit_ClassUpgrades
SET UnitClassType = (CASE WHEN EXISTS(SELECT Type FROM UnitClasses WHERE Type = 'UNITCLASS_EE_LINE_INFANTRY' )
		THEN 'UNITCLASS_EE_LINE_INFANTRY'
	    ELSE 'UNITCLASS_RIFLEMAN' END) 
WHERE UnitType = 'UNIT_PAMUSKET';

--==========================================================================================================================    
-- Events and Decisions 1f941088-b185-4159-865c-472df81247b2
--==========================================================================================================================      

--INSERT INTO DecisionsAddin_Support (FileName) VALUES ('GA_ED.lua');
