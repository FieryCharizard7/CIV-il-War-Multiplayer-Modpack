
--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 				text 			default null,
	Value 				integer 		default 1);

--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
-- Please Note: it is NOT necessary to make any changes to this if you had supported Colony Names under the ExCE ID. 
-- You will only need to add support for Claims if you wish some of your Decisions to cost Dignitaries instead of Magistrates. Examples TBD.
--==========================================================================================================================

--==========================================================	
-- COLONIES 
--==========================================================	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);
	
/*
Linguistic Types:
JFD_Germanic, JFD_Latinate, JFD_Tai_Khmer, JFD_Austronesian, JFD_Arabic, JFD_Slavic, JFD_Mesopotamian, JFD_Mesoamerican, JFD_Oriental,
JFD_Finno_Ugric, JFD_Semitic, JFD_Hellenic, JFD_Bantu, JFD_Songhay, JFD_Indo_Iranian, JFD_Altaic, JFD_Celtic, JFD_NorthAmerican, JFD_Quechumaran
*/
INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 						ColonyName,								LinguisticType)
VALUES	('CIVILIZATION_MASSACHUSETTS', 			null,									'JFD_Germanic'),
		('CIVILIZATION_MASSACHUSETTS', 			null,									'JFD_Finno_Ugric'),
		('CIVILIZATION_MASSACHUSETTS', 			'TXT_KEY_COLONY_NAME_MASSACHUSETTS_01',	null),
		('CIVILIZATION_MASSACHUSETTS', 			'TXT_KEY_COLONY_NAME_MASSACHUSETTS_02',	null),
		('CIVILIZATION_MASSACHUSETTS', 			'TXT_KEY_COLONY_NAME_MASSACHUSETTS_03',	null),
		('CIVILIZATION_MASSACHUSETTS', 			'TXT_KEY_COLONY_NAME_MASSACHUSETTS_04',	null),
		('CIVILIZATION_MASSACHUSETTS', 			'TXT_KEY_COLONY_NAME_MASSACHUSETTS_05',	null);
------------------------------------------------------------		
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-10 may be set. This value determines the proclivity a civ has toward annexing a colony, where 0 means never, and 10 means as soon as possible.
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,						Flavor)
VALUES	('LEADER_WILLIAM',		'FLAVOR_JFD_DECOLONIZATION',	0);
--==========================================================	
-- PROVINCES 
--==========================================================	
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	ReligionType  					text 		REFERENCES Religions(Type) 						default null, -- ignore this
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	
	
/*
Default Titles:
TXT_KEY_PROVINCE_JFD_BARONY_DESC_MONARCHY -- Barony
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_MONARCHY -- County
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_MONARCHY -- Duchy
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_COLONY_DESC_MONARCHY -- Colony
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_MONARCHY_FEMININE 

(Generally, Republics do not have unique titles)
TXT_KEY_PROVINCE_JFD_BARONY_DESC_REPUBLIC -- Municipality
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_REPUBLIC
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_REPUBLIC_FEMININE
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_REPUBLIC -- County
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_REPUBLIC_MONARCHY
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_REPUBLIC_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_REPUBLIC -- State
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_REPUBLIC
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_REPUBLIC_FEMININE
TXT_KEY_PROVINCE_JFD_COLONY_DESC_REPUBLIC -- Colony
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_REPUBLIC
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_REPUBLIC_FEMININE 
*/	
--This is an example of support which copies all attributes from an existing civ (i.e. Denmark). For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_NORWAY' to the
--tag of your custom civ. 
INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,			DefaultTitle, UniqueTitle, UseAdjective)
SELECT	'CIVILIZATION_MASSACHUSETTS',	DefaultTitle, UniqueTitle, UseAdjective
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--==========================================================	
-- SLAVERY 
--==========================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-10 may be set. This value determines the proclivity a civ has toward enslaving a captured city and toward spending Slavery on Units.
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,					Flavor)
VALUES	('LEADER_MONTEZUMA',	'FLAVOR_JFD_SLAVERY',		7);
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);
/*
CultureTypes:
  JFD_Andean, JFD_Bantu, JFD_Bharata, JFD_Central, JFD_Colonial, JFD_Eastern, JFD_Islamic, JFD_Katuje, JFD_Mandala, JFD_Mediterranean, JFD_Mesoamerican, JFD_Mesopotamic, JFD_Northern, JFD_Oceanic, JFD_Oriental, JFD_Polar, JFD_Sahul, JFD_Semitic, JFD_Steppe, JFD_Southern, JFD_TribalAmerican, JFD_Totalitarian, JFD_WestAfrican, JFD_Western

SplashScreenTags (As above, unless otherwise specified):
  JFD_ColonialLatin, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SouthernPapal
  
SoundtrackTag (As above, unless otherwise specified):
  JFD_MesopotamicEgyptian, JFD_NorthernCeltic, JFD_OrientalJapanese
  
 UnitDialogueTag:
	AS2D_SOUND_JFD_AMERICAN, AS2D_SOUND_JFD_AMERICAN_WEST, AS2D_SOUND_JFD_ALBANIAN*, AS2D_SOUND_JFD_ARABIC, AS2D_SOUND_JFD_AZTEC, AS2D_SOUND_JFD_BABYLONIAN, AS2D_SOUND_JFD_BERBER*, AS2D_SOUND_JFD_BYZANTINE, AS2D_SOUND_JFD_CARTHAGINIAN, AS2D_SOUND_JFD_CELTIC, AS2D_SOUND_JFD_CHINESE, AS2D_SOUND_JFD_COMANCHE*, AS2D_SOUND_JFD_DUTCH, AS2D_SOUND_JFD_EGYPTIAN, AS2D_SOUND_JFD_ENGLISH, AS2D_SOUND_JFD_ETHIOPIAN, AS2D_SOUND_JFD_FINNISH*, AS2D_SOUND_JFD_FRENCH, AS2D_SOUND_JFD_GAELIC*, AS2D_SOUND_JFD_GERMAN, AS2D_SOUND_JFD_GREEK, AS2D_SOUND_JFD_HOLY_ROMAN, AS2D_SOUND_JFD_HUNNIC, AS2D_SOUND_JFD_INCAN, AS2D_SOUND_JFD_INDIAN, AS2D_SOUND_JFD_ITALIAN, AS2D_SOUND_JFD_JAPANESE, AS2D_SOUND_JFD_KHMER, AS2D_SOUND_JFD_KOREAN, AS2D_SOUND_JFD_MALINESE, AS2D_SOUND_JFD_MAMLUKE*, AS2D_SOUND_JFD_MAYAN, AS2D_SOUND_JFD_MONGOL, AS2D_SOUND_JFD_NATIVE_AMERICAN (Mohawk), AS2D_SOUND_JFD_OTTOMAN, AS2D_SOUND_JFD_PERSIAN, AS2D_SOUND_JFD_POLISH, AS2D_SOUND_JFD_PORTUGUESE, AS2D_SOUND_JFD_ROMAN, AS2D_SOUND_JFD_RUSSIAN, AS2D_SOUND_JFD_SIAMESE, AS2D_SOUND_JFD_SPANISH, AS2D_SOUND_JFD_SUMERIAN, AS2D_SOUND_JFD_SWEDISH, AS2D_SOUND_JFD_TUPI*, AS2D_SOUND_JFD_VIKING, AS2D_SOUND_JFD_ZAPOTEC*, AS2D_SOUND_JFD_ZULU
	
	*Recommended to only use for Mercenary Units, as these have fewer tracks.
*/

--This is an example of support which copies all attributes from an existing civ (i.e. Denmark). For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_NORWAY' to the
--tag of your custom civ. 
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_MASSACHUSETTS',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Colonial'
WHERE Type = 'CIVILIZATION_MASSACHUSETTS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial');

--==========================================================================================================================
-- JFD's EXPLORATION CONTINUED EXPANDED (6676902b-b907-45f1-8db5-32dcb2135eee)
--==========================================================================================================================
--PROMOTION_JFD_SNOW_IMMUNITY, PROMOTION_JFD_DESERT_IMMUNITY, PROMOTION_JFD_DISEASE_IMMUNITY, PROMOTION_JFD_JUNGLE_IMMUNITY, PROMOTION_JFD_SCUVRY_IMMUNITY
INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
SELECT	'UNIT_MASCHOONER',	'PROMOTION_JFD_SCURVY_IMMUNITY'
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_SCURVY_IMMUNITY');
--==========================================================================================================================	
-- JFD's AND POUAKAI's MERCENARIES (a19351c5-c0b3-4b07-8695-4affaa199949)
--==========================================================================================================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-10 may be set. This value determines the likelihood that a leader will take out Mercenary Contracts (provided they have the funds).
--A value of 10 means this civilization will always take a Contract if available. A value of 0 means this civilization will never take out a contract.
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,					Flavor)
VALUES	('LEADER_SAMADAMS',	'FLAVOR_JFD_MERCENARY',		8);
--==========================================================================================================================	
-- JFD's RISE TO POWER (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================	
-- PIETY
--==========================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_SAMADAMS',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4);
--==========================================================	
-- PROSPERITY
--==========================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,					CurrencyType)
SELECT	'CIVILIZATION_MASSACHUSETTS',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_AMERICA';	
--==========================================================	
-- SOVEREIGNTY
--==========================================================
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType	  					text 		 												default null,
	LegislatureName					text														default	null,
	OfficeTitle						text														default	null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

--This table determines a variety of things relating to your Government.
--The LegislatureName refers to the name of your Legislature (e.g. the Imperial Diet). 
--The OfficeTitle refers to the title of your Head of Government (e.g. Vizier. Default is Prime Minister)
--GovernmentType and Weight prefer to a Government preference (GOVERNMENT_JFD_MONARCHY or GOVERNMENT_JFD_REPUBLIC or GOVERNMENT_JFD_THEOCRACY) and how strong that preference is.
INSERT INTO Civilization_JFD_Governments
        (CivilizationType,            CultureType, LegislatureName, OfficeTitle, GovernmentType,  Weight)
SELECT  'CIVILIZATION_MASSACHUSETTS', CultureType, LegislatureName, OfficeTitle, GovernmentType,  Weight
FROM	Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

--These are the Heads of your Government, which are randomly chosen when a new Legislature is formed.
--The standard number for each civ is 25. However, you may leave this table empty and your civ will call
--from a cultural list (so long as you have Cultural Diversity support).
INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,            CultureType, HeadOfGovernmentName)
SELECT	'CIVILIZATION_MASSACHUSETTS', CultureType, HeadOfGovernmentName
FROM	Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_AMERICA'; 
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	ReligionType					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

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
        (CivilizationType,            CultureType, ReligionType,    DefaultTitle, UniqueTitle, UseAdjective)
SELECT  'CIVILIZATION_MASSACHUSETTS', CultureType, ReligionType,	DefaultTitle, UniqueTitle, UseAdjective
FROM	Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

--This lists all the unique names for a civ's political parties.
--Political Parties are as follows:
----FACTION_JFD_NATIONALIST
----FACTION_JFD_POPULARIST
----PARTY_JFD_BURGHERS
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
        (CivilizationType,             PoliticsType,               UniqueName)
SELECT  'CIVILIZATION_MASSACHUSETTS',  PoliticsType,               UniqueName
FROM	Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
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
		(LeaderType,		FlavorType,							Flavor)
VALUES	('LEADER_SAMADAMS',	'FLAVOR_JFD_REFORM_GOVERNMENT',		9),
		('LEADER_SAMADAMS',	'FLAVOR_JFD_REFORM_CULTURE',		5),
		('LEADER_SAMADAMS',	'FLAVOR_JFD_REFORM_ECONOMIC',		4),
		('LEADER_SAMADAMS',	'FLAVOR_JFD_REFORM_FOREIGN',		5),
		('LEADER_SAMADAMS',	'FLAVOR_JFD_REFORM_INDUSTRY',		5),
		('LEADER_SAMADAMS',	'FLAVOR_JFD_REFORM_MILITARY',		5),
		('LEADER_SAMADAMS',	'FLAVOR_JFD_REFORM_RELIGION',		8);
--======================================================================

--==========================================================================================================================    
-- ENLIGHTENMENT ERA ce8aa614-7ef7-4a45-a179-5329869e8d6d
--==========================================================================================================================  
UPDATE Units
SET Moves = (CASE WHEN EXISTS(SELECT Type FROM UnitClasses WHERE Type = 'UNITCLASS_EE_EXPLORER' )
		THEN '6'
	    ELSE '5' END) 
WHERE Type = 'UNIT_MASCHOONER';

UPDATE Units
SET Cost = (CASE WHEN EXISTS(SELECT Type FROM UnitClasses WHERE Type = 'UNITCLASS_EE_EXPLORER' )
		THEN '120'
	    ELSE '145' END) 
WHERE Type = 'UNIT_MASCHOONER';

UPDATE Units
SET Combat = (CASE WHEN EXISTS(SELECT Type FROM UnitClasses WHERE Type = 'UNITCLASS_EE_EXPLORER' )
		THEN '16'
	    ELSE '20' END) 
WHERE Type = 'UNIT_MASCHOONER';
--==========================================================================================================================
-- Civ IV Leader Traits 1153b26a-69fd-4cd5-899c-a8ba8e0e5e5d
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_SAMADAMS',		'POLICY_AGGRESSIVE_X',	'POLICY_SEAFARING_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Sam Adams [ICON_WAR] [ICON_GREAT_EXPLORER]'
	ELSE 'TXT_KEY_LEADER_SAMADAMS' END) 
WHERE Type = 'LEADER_SAMADAMS';

CREATE TRIGGER CivIVTraitsSamAdams
AFTER INSERT ON Leaders WHEN 'LEADER_SAMADAMS' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Sam Adams [ICON_WAR] [ICON_GREAT_EXPLORER]'
		ELSE 'TXT_KEY_LEADER_SAMADAMS' END) 
	WHERE Type = 'LEADER_SAMADAMS';
END;
--==========================================================================================================================    
-- SUKRITACT'S EVENTS AND DECISIONS (1f941088-b185-4159-865c-472df81247b2)
--==========================================================================================================================  
--CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
--INSERT INTO DecisionsAddin_Support (FileName) VALUES ('CT_Decisions.lua');

--CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
--INSERT INTO EventsAddin_Support (FileName) VALUES ('FL_Events.lua');	