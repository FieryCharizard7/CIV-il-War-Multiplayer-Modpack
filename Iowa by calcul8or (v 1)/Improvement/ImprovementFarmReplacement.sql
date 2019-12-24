-- Create an Arable improvement type
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_ARABLE', 'Improvement', 'Arable';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.96, 'ART_DEF_IMPROVEMENT_ARABLE', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'Improvement/Art/Plantation_MID_Corn.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed',       0.96, 'ART_DEF_IMPROVEMENT_ARABLE', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'Improvement/Art/Plantation_MID_Corn.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged',          0.96, 'ART_DEF_IMPROVEMENT_ARABLE', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'Improvement/Art/pl_plantation_mid_mango.fxsxml', 1;

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_ARABLE', 'Improvement', 'SV_GrtFarm.dds';
