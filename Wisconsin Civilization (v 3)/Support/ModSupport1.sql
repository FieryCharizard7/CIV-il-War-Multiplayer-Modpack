--=======================================================================================================================
-- Bingle's Civ IV Traits 1153b26a-69fd-4cd5-899c-a8ba8e0e5e5d
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_NICOLET',	 'POLICY_INDUSTRIOUS_X',		'POLICY_PROTECTIVE_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Nicolet [ICON_PRODUCTION][ICON_STRENGTH]'
	ELSE 'TXT_KEY_LEADER_NICOLET' END) 
WHERE Type = 'LEADER_NICOLET';

CREATE TRIGGER CivIVTraitsWisconsin
AFTER INSERT ON Leaders WHEN 'LEADER_NICOLET' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Nicolet [ICON_PRODUCTION][ICON_STRENGTH]'
		ELSE 'TXT_KEY_LEADER_NICOLET' END) 
	WHERE Type = 'LEADER_NICOLET';
END;

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
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,		ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_WISCONSIN',	ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Colonial'
WHERE Type = 'CIVILIZATION_WISCONSIN'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial');

--==========================================================================================================================	
-- JFD's PIETY (eea66053-7579-481a-bb8d-2f3959b59974)
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
			(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_NICOLET',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		7);

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
VALUES	('LEADER_NICOLET',	'FLAVOR_JFD_MERCENARY',		8);



