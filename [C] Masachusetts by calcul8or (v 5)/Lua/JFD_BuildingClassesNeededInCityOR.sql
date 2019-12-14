CREATE TABLE IF NOT EXISTS
	Building_ClassesNeededInCityOR (
        BuildingType                text    REFERENCES Buildings(TYPE)                  DEFAULT NULL,
        BuildingClassType           text    REFERENCES BuildingClasses(TYPE)            DEFAULT NULL);

CREATE TABLE IF NOT EXISTS
	Unit_BuildingClassRequiredsOR (
		UnitType					text	REFERENCES Units(Type)						DEFAULT NULL,
		BuildingClassType			text	REFERENCES BuildingClasses(TYPE)            DEFAULT NULL);