--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 				DefaultBuilding, 					Description,								MaxGlobalInstances)
VALUES	('BUILDINGCLASS_TOMWDAVIS_CLOCKTOWER', 		'BUILDING_TOMWDAVIS_CLOCKTOWER',	'TXT_KEY_BUILDING_TOMWDAVIS_CLOCKTOWER',	1	);

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,								BuildingClass,							MutuallyExclusiveGroup,	Cost, 	FaithCost,	MinAreaSize,	MaxStartEra, 	GreatWorkSlotType,			GreatWorkCount,		UnmoddedHappiness, 	UnhappinessModifier,  	PrereqTech, 					ArtDefineTag, 	ConquestProb, 	HurryCostModifier,	NukeImmune,	WonderSplashImage, 				WonderSplashAnchor,	WonderSplashAudio,			Help,											ThemingBonusHelp,									Quote,											Description,							Civilopedia,										Strategy,											IconAtlas,								PortraitIndex)
VALUES		('BUILDING_TOMWDAVIS_CLOCKTOWER',	'BUILDINGCLASS_TOMWDAVIS_CLOCKTOWER',	-1,						750, 	0,			-1,				'ERA_MODERN', 	'GREAT_WORK_SLOT_MUSIC',	2,					2, 					10,						'TECH_SCIENTIFIC_THEORY', 		'BIG BEN', 		100,			-1,					-1,			'TomWDavis_Clocktower.dds', 	'L,T',				'AS2D_WONDER_CLOCKTOWER',	'TXT_KEY_BUILDING_TOMWDAVIS_CLOCKTOWER_HELP',	'TXT_KEY_TOMWDAVIS_CLOCKTOWER_THEMING_BONUS_HELP',	'TXT_KEY_WONDER_TOMWDAVIS_CLOCKTOWER_QUOTE',	'TXT_KEY_BUILDING_TOMWDAVIS_CLOCKTOWER', 'TXT_KEY_BUILDING_TOMWDAVIS_CLOCKTOWER_TEXT',		'TXT_KEY_BUILDING_TOMWDAVIS_CLOCKTOWER_STRATEGY',	'BUILDING_TOMWDAVIS_CLOCKTOWER_ATLAS',	0);	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType,				Flavor)
VALUES		('BUILDING_TOMWDAVIS_CLOCKTOWER',	'FLAVOR_HAPPINESS',		60),
			('BUILDING_TOMWDAVIS_CLOCKTOWER',	'FLAVOR_CULTURE',		40),
			('BUILDING_TOMWDAVIS_CLOCKTOWER',	'FLAVOR_SCIENCE',		60),
			('BUILDING_TOMWDAVIS_CLOCKTOWER',	'FLAVOR_WONDER',		25),
			('BUILDING_TOMWDAVIS_CLOCKTOWER',	'FLAVOR_EXPANSION',		35);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						YieldType,			Yield)
VALUES		('BUILDING_TOMWDAVIS_CLOCKTOWER',	'YIELD_CULTURE',	5);
------------------------------	
-- Building_YieldModifier
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						YieldType,			Yield)
VALUES		('BUILDING_TOMWDAVIS_CLOCKTOWER',	'YIELD_CULTURE',	5);
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO Building_BuildingClassYieldChanges 	
			(BuildingType,						BuildingClassType,					YieldType,				YieldChange)
VALUES		('BUILDING_TOMWDAVIS_CLOCKTOWER',	'BUILDINGCLASS_UNIVERSITY',			'YIELD_GOLD',			1),
			('BUILDING_TOMWDAVIS_CLOCKTOWER',	'BUILDINGCLASS_PUBLIC_SCHOOL',		'YIELD_GOLD',			1),
			('BUILDING_TOMWDAVIS_CLOCKTOWER',	'BUILDINGCLASS_LIBRARY',			'YIELD_GOLD',			1);
------------------------------	
-- Building_ResourceYieldChanges
------------------------------			
INSERT INTO Building_ResourceYieldChanges
			(BuildingType, 						ResourceType, 		YieldType, 				Yield)
VALUES		('BUILDING_TOMWDAVIS_CLOCKTOWER', 	'RESOURCE_SALT', 	'YIELD_GOLD', 			2);
------------------------------	
-- Building_ThemingBonuses
------------------------------
	
INSERT INTO Building_ThemingBonuses	
			(BuildingType,						Description,											Bonus,	RequiresOwner,	RequiresUniquePlayers,	MustBeArtifact,	AIPriority)
VALUES		('BUILDING_TOMWDAVIS_CLOCKTOWER',	'TXT_KEY_THEMING_BONUS_TOMWDAVIS_CLOCKTOWER_LOCAL',		6,		1,				0,						0,				1),
			('BUILDING_TOMWDAVIS_CLOCKTOWER',	'TXT_KEY_THEMING_BONUS_TOMWDAVIS_CLOCKTOWER_GLOBAL',	3,		0,				1,						0,				1);

--==========================================================================================================================	

