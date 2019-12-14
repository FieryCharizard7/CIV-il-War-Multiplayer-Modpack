INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_KY_CORN','Resource','Corn');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_KY_CORN','Resource','Corn/Art/SV_Corn.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.9399999976158142','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_KY_CORN','Corn/Assets/Resource_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_KY_CORN','Corn/Assets/HB_Plantation_MID_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_KY_CORN','Corn/Assets/Plantation_MID_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Ancient','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_KY_CORN','Corn/Assets/PL_Plantation_MID_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_KY_CORN','Corn/Assets/HB_Plantation_IND_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_KY_CORN','Corn/Assets/Plantation_IND_Corn.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_KY_CORN','Corn/Assets/PL_Plantation_IND_Corn.fxsxml','1',null);

-- Granary Update --------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges	(BuildingType,				ResourceType,				YieldType,				Yield) 
VALUES										('BUILDING_GRANARY',		'RESOURCE_KY_CORN',			'YIELD_FOOD',			1);

-- Atlas -----------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases
			(Atlas,				IconSize,	Filename,				IconsPerRow,	IconsPerColumn)
VALUES		('KY_CORN_ATLAS',	256,		'Corn_Atlas256.dds',	1,				1),
			('KY_CORN_ATLAS',	80,			'Corn_Atlas80.dds',		1,				1),
			('KY_CORN_ATLAS',	64,			'Corn_Atlas64.dds',		1,				1),
			('KY_CORN_ATLAS',	45,			'Corn_Atlas45.dds',		1,				1);