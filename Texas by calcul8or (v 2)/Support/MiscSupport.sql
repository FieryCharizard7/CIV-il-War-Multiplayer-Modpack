--==========================================================================================================================
-- Civ IV Leader Traits
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_CALCHOUSTON',		'POLICY_IMPERIALISTIC_X',		'POLICY_EXPANSIVE_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Sam Houston [ICON_FOOD][ICON_CITY_STATE]'
	ELSE 'TXT_KEY_LEADER_CALCHOUSTON' END) 
WHERE Type = 'LEADER_CALCHOUSTON';

CREATE TRIGGER CivIVTraitsMainwaring
AFTER INSERT ON Leaders WHEN 'LEADER_CALCHOUSTON' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Sam Houston [ICON_FOOD][ICON_CITY_STATE]'
		ELSE 'TXT_KEY_LEADER_CALCHOUSTON' END) 
	WHERE Type = 'LEADER_CALCHOUSTON';
END;	

--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------   
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
    CivilizationType                            text    REFERENCES Civilizations(Type)          default null,
    CultureType                                 text                                            default null,
    ArtDefineTag                                text                                            default null,
    IdealsTag                                   text                                            default null,
    SplashScreenTag                             text                                            default null,
    SoundtrackTag                               text                                            default null,
    UnitDialogueTag                             text                                            default null);
 
-- This is an example of support which copies all attributes from an existing civ (i.e. Denmark). For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_NORWAY' to the
-- tag of your custom civ. 
INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,          ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT  'CIVILIZATION_CALCTEXAS',  ArtDefineTag, CultureType, IdealsTag, 'JFD_Colonial', SoundtrackTag, 'AS2D_SOUND_JFD_AMERICAN_WEST'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';
 
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Colonial'
WHERE Type = 'CIVILIZATION_CALCTEXAS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial');

--==========================================================================================================================    
-- JFD's PIETY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================   
INSERT OR REPLACE INTO Flavors 
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
--A value of 1-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
            (LeaderType,            FlavorType,                             Flavor)
VALUES      ('LEADER_CALCHOUSTON',  'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',     6);

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
        (LeaderType,                FlavorType,               Flavor)
VALUES  ('LEADER_CALCHOUSTON',    'FLAVOR_JFD_MERCENARY',     8);

--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23)
--==========================================================================================================================
------------------------------------------------------------
-- Civilizations_YagemStartPosition
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,						X,		Y)
VALUES		('CIVILIZATION_CALCTEXAS',	140,	56);

------------------------------------------------------------
-- Civilizations_YahemStartPosition
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,					X,	Y)
VALUES		('CIVILIZATION_CALCTEXAS',	21,	50);

------------------------------------------------------------
-- Civilizations_CordiformStartPosition
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,					X,	Y)
VALUES		('CIVILIZATION_CALCTEXAS',	8,	32);

------------------------------------------------------------
-- Civilizations_AmericaStandardStartPosition
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericaStandardStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericaStandardStartPosition
			(Type,					X,	Y)
VALUES		('CIVILIZATION_CALCTEXAS',	37,	50);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 						Req1,		Yield1, Req2,		Yield2, Req3)
VALUES		('CIVILIZATION_CALCTEXAS',	'RESOURCE_HORSE', 2, 'RESOURCE_OIL', 5, 'RESOURCE_COW');
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);	
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 						Req1,		Yield1, Req2,		Yield2, Req3)
VALUES		('CIVILIZATION_CALCTEXAS',	'RESOURCE_HORSE', 2, 'RESOURCE_OIL', 5, 'RESOURCE_COW');
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);		
INSERT INTO Civilizations_AmericasRequestedResource
			(Type, 						Req1,		 Yield1, Req2,		Yield2, Req3)
VALUES		('CIVILIZATION_CALCTEXAS',	'RESORCSE_HORSE', 2, 'RESOURCE_OIL', 5, 'RESOURCE_COW');

--==========================================================================================================================
-- SUKRITACTS EVENTS AND DECISIONS
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('TX_Decision_Support.lua');