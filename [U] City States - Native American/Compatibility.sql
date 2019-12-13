------------------------
-- Resolves certain city-state - major civ conflicts likely to occur with DLC or civ-adding mods active
-- Code based on Gedemon's YnAEMP City States mod
------------------------

-- AMSTERDAM: CS removed if Holland/Dutch/Netherlands civ present
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_HOLLAND" )
		THEN "MINOR_CIV_AMSTERDAM"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_AMSTERDAM";
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_DUTCH" )
		THEN "MINOR_CIV_AMSTERDAM"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_AMSTERDAM";
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NETHERLANDS" )
		THEN "MINOR_CIV_AMSTERDAM"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_AMSTERDAM";
DELETE FROM MinorCivilizations WHERE Type = "REMOVE_THIS";

-- BILBAO: Spanish city of the same name removed if Spain civ and Bilbao CS present
UPDATE Civilization_CityNames SET CityName =
	( CASE WHEN EXISTS(SELECT Type FROM MinorCivilizations WHERE Type="MINOR_CIV_BASQUE" )
		THEN( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_SPAIN" )
			THEN "REMOVE_THIS" END
		) END
	) WHERE CityName = "TXT_KEY_CITY_NAME_BILBAO" OR CityName = "Bilbao";
DELETE FROM Civilization_CityNames WHERE CityName = "REMOVE_THIS";

-- CARTHAGE: CS removed if a Carthage city is present
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilization_CityNames WHERE CityName="TXT_KEY_CITY_NAME_CARTHAGE" )
		THEN "MINOR_CIV_CARTHAGE"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_CARTHAGE";
DELETE FROM MinorCivilizations WHERE Type = "REMOVE_THIS";

-- CONSTANTINOPLE: CS removed if Byzantine/Byzantium civ present
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_BYZANTINE" )
		THEN "MINOR_CIV_CONSTANTINOPLE"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_CONSTANTINOPLE";
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_BYZANTIUM" )
		THEN "MINOR_CIV_CONSTANTINOPLE"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_CONSTANTINOPLE";
DELETE FROM MinorCivilizations WHERE Type = "REMOVE_THIS";

-- CUBA: CS removed if a Havana city is present
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilization_CityNames WHERE CityName="TXT_KEY_CITY_NAME_HAVANA" )
		THEN "MINOR_CIV_HAVANA"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_HAVANA";
DELETE FROM MinorCivilizations WHERE Type = "REMOVE_THIS";

-- ETHIOPIA: CS removed if a Addis Ababa city is present
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilization_CityNames WHERE CityName="TXT_KEY_CITY_NAME_ADDIS_ABABA" )
		THEN "MINOR_CIV_ADDIS_ABABA"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_ADDIS_ABABA";
DELETE FROM MinorCivilizations WHERE Type = "REMOVE_THIS";

-- HAWAII: CS removed if Polynesia civ present
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "MINOR_CIV_HAWAII"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_HAWAII";
DELETE FROM MinorCivilizations WHERE Type = "REMOVE_THIS";

-- LISBON: CS removed if Portugal civ present
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_PORTUGAL" )
		THEN "MINOR_CIV_LISBON"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_LISBON";
DELETE FROM MinorCivilizations WHERE Type = "REMOVE_THIS";

-- MADRID: CS removed if Spain civ present
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_SPAIN" )
		THEN "MINOR_CIV_MADRID"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_MADRID";
DELETE FROM MinorCivilizations WHERE Type = "REMOVE_THIS";

-- MAYA: CS removed if a Tikal city is present
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilization_CityNames WHERE CityName="TXT_KEY_CITY_NAME_TIKAL" )
		THEN "MINOR_CIV_TIKAL"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_TIKAL";
DELETE FROM MinorCivilizations WHERE Type = "REMOVE_THIS";

-- RAPA NUI: CS removed if Polynesia civ present
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "MINOR_CIV_RAPANUI"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_RAPANUI";
DELETE FROM MinorCivilizations WHERE Type = "REMOVE_THIS";

-- STRASBOURG: French city of the same name removed if France civ and Strasbourg CS present
UPDATE Civilization_CityNames SET CityName =
	( CASE WHEN EXISTS(SELECT Type FROM MinorCivilizations WHERE Type="MINOR_CIV_STRASBOURG" )
		THEN( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_FRANCE" )
			THEN "REMOVE_THIS" END
		) END
	) WHERE CityName = "TXT_KEY_CITY_NAME_STRASBOURG";
DELETE FROM Civilization_CityNames WHERE CityName = "REMOVE_THIS";

-- SWITZERLAND: CS removed if a Bern city is present
UPDATE MinorCivilizations SET Type =
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilization_CityNames WHERE CityName="TXT_KEY_CITY_NAME_BERN" )
		THEN "MINOR_CIV_BERN"
		ELSE "REMOVE_THIS" END
    ) WHERE Type = "MINOR_CIV_BERN";
DELETE FROM MinorCivilizations WHERE Type = "REMOVE_THIS";