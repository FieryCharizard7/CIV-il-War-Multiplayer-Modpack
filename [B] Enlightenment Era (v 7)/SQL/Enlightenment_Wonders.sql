--Topkapi Palace effect
INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 			BuildingClassType, 	YieldType, 		YieldChange)
SELECT 	'BUILDING_EE_TOPKAPI', 	BuildingClass,		'YIELD_CULTURE', 	1
FROM Buildings WHERE Defense > 0 AND ExtraCityHitPoints > 0 AND WonderSplashImage IS NULL;

CREATE TRIGGER EE_Topkapi_BuildingClassYieldChanges
AFTER INSERT ON Buildings
WHEN NEW.Defense > 0 AND NEW.ExtraCityHitPoints > 0 AND NEW.WonderSplashImage IS NULL
BEGIN
	INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType, 			BuildingClassType, 	YieldType, 			YieldChange)
	VALUES 	('BUILDING_EE_TOPKAPI', NEW.BuildingClass,	'YIELD_CULTURE', 	1);
END;