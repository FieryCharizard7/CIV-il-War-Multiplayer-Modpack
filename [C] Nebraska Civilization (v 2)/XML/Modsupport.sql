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
	VALUES      ('LEADER_NEB',	 'POLICY_MERCANTILE_X',	 'POLICY_PHILOSOPHICAL_X');
	------------------------------
	-- Leaders
	------------------------------
	UPDATE Leaders
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_MERCANTILE_X' )
	THEN 'J. S. Morton [ICON_GOLD][ICON_GREAT_PEOPLE]'
	ELSE 'TXT_KEY_LEADER_NEB' END)
	WHERE Type = 'LEADER_NEB';

	CREATE TRIGGER CivIVTraitsIndibilis
	AFTER INSERT ON Leaders WHEN 'LEADER_NEB' = NEW.Type
	BEGIN
	UPDATE Leaders
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'J. S. Morton [ICON_GOLD][ICON_GREAT_PEOPLE]'
	ELSE 'TXT_KEY_LEADER_NEB' END)
	WHERE Type = 'LEADER_NEB';
	END;
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
VALUES		('CIVILIZATION_S_NEBRASKA',	'JFD_Colonial',		'JFD_Colonial',		'JFD_Colonial');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Colonial' )
	THEN 'JFD_Colonial'
	ELSE 'America' END) 
WHERE Type = 'CIVILIZATION_S_NEBRASKA';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,								CultureType,		CultureEra)
VALUES		('CIVILIZATION_S_NEBRASKA',				'BRITISH',			'ANY'),
			('CIVILIZATION_S_NEBRASKA',				'FIRST_AMERICANS',	'ANY'),
			('CIVILIZATION_S_NEBRASKA',				'SPANISH',			'MODERN');
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
VALUES		('CIVILIZATION_S_NEBRASKA',				null,											'JFD_Germanic'),
			('CIVILIZATION_S_NEBRASKA',				null,											'JFD_Latinate'),
						------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_AMERICA',				'CIVILIZATION_S_NEBRASKA'),

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_S_NEBRASKA'),	('CIVILIZATION_JFD_AMERICA_ROOSEVELT')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_AMERICA_ROOSEVELT');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_S_NEBRASKA'),	('CIVILIZATION_JFD_AMERICA_LINCOLN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_AMERICA_LINCOLN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_S_NEBRASKA'),		('CIVILIZATION_JFK_AMERICA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_S_NEBRASKA');

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
VALUES		('LEADER_NEB',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4);