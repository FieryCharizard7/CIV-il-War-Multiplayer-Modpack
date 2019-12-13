INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_KENTUCKY_DISTILLERY', 'Improvement', 'KENTUCKY_DISTILLERY';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.2,  'ART_DEF_IMPROVEMENT_KENTUCKY_DISTILLERY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Industrial Factory HB.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.8,  'ART_DEF_IMPROVEMENT_KENTUCKY_DISTILLERY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Industrial Factory B.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.2,  'ART_DEF_IMPROVEMENT_KENTUCKY_DISTILLERY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Industrial Factory PL.fxsxml', 1;


INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_KENTUCKY_DISTILLERY', 'Improvement', 'SV_distillery.dds';