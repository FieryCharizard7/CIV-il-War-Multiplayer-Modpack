INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_KY_FRONTIERSMAN', 1, 'Scout');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_KY_FRONTIERSMAN', 'ART_DEF_UNIT_MEMBER_KY_FRONTIERSMAN', 8);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_KY_FRONTIERSMAN', 0.14, 'Assets/Unit/u_canadian_voyageur.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_KY_FRONTIERSMAN', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.35, 8.0, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_KY_FRONTIERSMAN', 0, 0, 'BLUNT', 'SPEAR');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_KY_FRONTIERSMAN', 'Unit', 'SV_KY_scout.dds');