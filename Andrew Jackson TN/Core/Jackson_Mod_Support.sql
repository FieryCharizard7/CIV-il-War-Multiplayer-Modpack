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
	(LeaderType,			 TraitOne,               TraitTwo)
	VALUES      ('LEADER_JACKSON',	 'POLICY_AGGRESSIVE_X',	 'POLICY_IMPERIALISTIC_X');
	------------------------------
	-- Leaders
	------------------------------
	UPDATE Leaders
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_AGGRESSIVE_X' )
	THEN 'Jackson [ICON_WAR][ICON_CITY_STATE]'
	ELSE 'TXT_KEY_LEADER_JACKSON' END)
	WHERE Type = 'LEADER_JACKSON';

	CREATE TRIGGER CivIVTraitsIndibilis
	AFTER INSERT ON Leaders WHEN 'LEADER_JACKSON' = NEW.Type
	BEGIN
	UPDATE Leaders
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_IMPERIALISTIC_X' )
	THEN 'Jackson [ICON_WAR][ICON_CITY_STATE]'
	ELSE 'TXT_KEY_LEADER_JACKSON' END)
	WHERE Type = 'LEADER_JACKSON';
	END;
	--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_TENNESSEE'),	X,	Y
FROM Civilizations_YagemStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_TENNESSEE'),	X,	Y
FROM Civilizations_YahemStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_TENNESSEE'),	X,	Y
FROM Civilizations_CordiformStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_TENNESSEE'),	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_TENNESSEE'),	X,	Y
FROM Civilizations_NorthAtlanticStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_TENNESSEE'),	X,	Y
FROM Civilizations_AmericasStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TENNESSEE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TENNESSEE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TENNESSEE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TENNESSEE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TENNESSEE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
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

INSERT INTO Civilization_JFD_CultureTypes
			(CivilizationType,						CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_TENNESSEE',	'JFD_Colonial',		'JFD_Colonial',		'JFD_Colonial');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Colonial' )
	THEN 'JFD_Colonial'
	ELSE 'America' END) 
WHERE Type = 'CIVILIZATION_TENNESSEE';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,								CultureType,		CultureEra)
VALUES		('CIVILIZATION_TENNESSEE',	'BRITISH',			'ANY'),
			('CIVILIZATION_TENNESSEE',	'FIRST_AMERICANS',	'ANY'),
			('CIVILIZATION_TENNESSEE',	'SPANISH',			'MODERN');
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
VALUES		('CIVILIZATION_TENNESSEE',	null,											'JFD_Germanic'),
			('CIVILIZATION_TENNESSEE',	null,											'JFD_Latinate'),
			------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_AMERICA',				'CIVILIZATION_TENNESSEE'),
			('CIVILIZATION_ENGLAND',				'CIVILIZATION_TENNESSEE'),
			('CIVILIZATION_TENNESSEE',			'CIVILIZATION_AMERICA');
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_TENNESSEE'),	('CIVILIZATION_JFD_AMERICA_ROOSEVELT')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_AMERICA_ROOSEVELT');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_TENNESSEE'),	('CIVILIZATION_JFD_AMERICA_LINCOLN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_AMERICA_LINCOLN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_GREAT_BRITAIN'),		('CIVILIZATION_TENNESSEE')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_GREAT_BRITAIN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_AMERICA_HENRY'),		('CIVILIZATION_TENNESSEE')
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
VALUES		('LEADER_JACKSON',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0);
--==========================================================================================================================
-- Tomatekh's Historical Religions
--==========================================================================================================================
-- Civilizations
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
	THEN 'RELIGION_PROTESTANTISM'
	ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIANITY' )
	THEN 'RELIGION_CHRISTIANITY'
	ELSE 'RELIGION_PROTESTANT_CALVINISM' END ) END
) WHERE CivilizationType IN ('CIVILIZATION_TENNESSEE');

CREATE TRIGGER ReligionAmericaJFK
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_CALVINISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIANITY' )
		THEN 'RELIGION_CHRISTIANITY'
		ELSE 'RELIGION_PROTESTANT_CALVINISM' END ) END
	) WHERE CivilizationType IN ('CIVILIZATION_TENNESSEE');
END;
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_SHOSHONE' )
	THEN '_AMERICA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_TENNESSEE';
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);
 
--Any items entered into this table will not show into the Civilopedia. There is no technical limitation as to what can be hidden (I think).
INSERT INTO JFD_Civilopedia_HideFromPedia
        (Type)
VALUES  ('BUILDING_SPACE_RACE'),
        ('BUILDING_JFK_LIBRARY'),
		('BUILDING_JFK_UNIVERSITY'),
		('BUILDING_JFK_PUBLIC_SCHOOL'),
		('BUILDING_JFK_LABORATORY'),
		('BUILDING_JFK_OBSERVATORY');
 --==========================================================================================================================
-- JFD's CHARTERED VENTURES (34c6919a-fcb5-44cf-8a76-78380dbc39ab)
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Currencies (
    CivilizationType                text        REFERENCES Civilizations(Type)  default null,
    CurrencyType                    text                                        default null);
 
INSERT INTO Civilization_JFD_Currencies
        (CivilizationType,                  CurrencyType)
SELECT  'CIVILIZATION_TENNESSEE', CurrencyType
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
        (LeaderType,                FlavorType,                 Flavor)
VALUES  ('LEADER_JACKSON',    'FLAVOR_JFD_MERCENARY',     0);
--==========================================================================================================================    
-- JFD's SOVEREIGNTY (d99bf7aa-51ac-4bef-bd88-d765b28e260e)
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
		(CivilizationType,						LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT	'CIVILIZATION_TENNESSEE',		LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_AMERICA';
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
        (CivilizationType,                      HeadOfGovernmentName)
VALUES  ('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_1'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_2'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_3'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_4'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_5'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_6'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_7'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_8'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_9'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_10'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_11'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_12'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_13'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_14'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_15'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_16'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_17'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_18'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_19'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_20'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_21'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_22'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_23'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_24'),
		('CIVILIZATION_TENNESSEE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TENNESSEE_25');

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

INSERT INTO Civilization_JFD_Titles
		(CivilizationType,						DefaultTitle,	UniqueTitle)
SELECT	'CIVILIZATION_TENNESSEE',		DefaultTitle,	UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,					PoliticsType, UniqueName)
SELECT	'CIVILIZATION_TENNESSEE',	PoliticsType, UniqueName
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
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_JACKSON',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 6),
		('LEADER_JACKSON',	'FLAVOR_JFD_REFORM_CULTURE',		 5),
		('LEADER_JACKSON',	'FLAVOR_JFD_REFORM_ECONOMIC',		 8),
		('LEADER_JACKSON',	'FLAVOR_JFD_REFORM_FOREIGN',		 7),
		('LEADER_JACKSON',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_JACKSON',	'FLAVOR_JFD_REFORM_MILITARY',		 5),
		('LEADER_JACKSON',	'FLAVOR_JFD_REFORM_RELIGION',		 5),
		('LEADER_JACKSON',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 5);
