--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType, 						TileType,	Asset)
VALUES		('ART_DEF_UNIT_UNION_ARTILLERY_PARROTT', 	'Unit', 	'sv_parrottcannon_acw.dds'),
			('ART_DEF_UNIT_UNION_IRONCLAD', 			'Unit', 	'sv_union_ironclad_acw.dds');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------	
UPDATE ArtDefine_UnitInfoMemberInfos
SET NumMembers = 1
WHERE UnitInfoType = 'ART_DEF_UNIT_UNION_ARTILLERY_PARROTT';
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_AMERICA_LINCOLN_ATLAS', 			256, 		'JFD_AmericaLincolnAtlas_256.dds',		1, 				1),
			('JFD_AMERICA_LINCOLN_ATLAS', 			128, 		'JFD_AmericaLincolnAtlas_128.dds',		1, 				1),
			('JFD_AMERICA_LINCOLN_ATLAS', 			64, 		'JFD_AmericaLincolnAtlas_64.dds',		1, 				1);
------------------------------
-- Colors
------------------------------
INSERT INTO Colors 
			(Type, 													Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_AMERICA_LINCOLN_ICON', 				1,		1,		1,		1),
			('COLOR_PLAYER_JFD_AMERICA_LINCOLN_BACKGROUND', 		0.074,	0.086,	0.250,	1);
------------------------------	
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
			(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES		('PLAYERCOLOR_JFD_AMERICA_LINCOLN',		'COLOR_PLAYER_JFD_AMERICA_LINCOLN_ICON', 	'COLOR_PLAYER_JFD_AMERICA_LINCOLN_BACKGROUND', 		'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_LINCOLN_PEACE', 	'Lincoln_Peace',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_LINCOLN_WAR', 	'Lincoln_War',		'DynamicResident');			
------------------------------
-- Audio_2DSounds
------------------------------
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_LINCOLN_PEACE', 'SND_LEADER_MUSIC_JFD_LINCOLN_PEACE',	'GAME_MUSIC',	50, 		50, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_LINCOLN_WAR', 	'SND_LEADER_MUSIC_JFD_LINCOLN_WAR', 	'GAME_MUSIC',	50, 		50, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	
