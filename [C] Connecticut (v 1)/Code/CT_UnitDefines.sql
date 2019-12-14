INSERT INTO ArtDefine_UnitInfos(Type, DamageStates)
  VALUES ('ART_DEF_UNIT_CT_WHALER', 3);
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_CT_WHALER', 'ART_DEF_UNIT_MEMBER_CT_WHALER', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_CT_WHALER', 0.11, 'Sea', 'carrack.fxsxml', 'WOOD', 'WOODLRG');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing)
  VALUES ('ART_DEF_UNIT_MEMBER_CT_WHALER', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir', 1, 1, 0, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_CT_WHALER', 0, 0, 10.0, 20.0, 'ART_DEF_VEFFECT_CANNON_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION6POUND');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_CT_WHALER', 'Unit', 'SV_CT_Whaler.dds');