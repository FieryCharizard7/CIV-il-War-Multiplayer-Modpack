
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_TOMJEFFERSON',	 'POLICY_PHILOSOPHICAL_X',	'POLICY_MERCANTILE_X');

------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Jefferson [ICON_GREAT_PEOPLE][ICON_CONNECTED]'
	ELSE 'TXT_KEY_LEADER_TOMJEFFERSON' END) 
WHERE Type = 'LEADER_TOMJEFFERSON';

CREATE TRIGGER CivIVTraitsVirginia
AFTER INSERT ON Leaders WHEN 'LEADER_TOMJEFFERSON' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Jefferson [ICON_GREAT_PEOPLE][ICON_CONNECTED]'
		ELSE 'TXT_KEY_LEADER_TOMJEFFERSON' END) 
	WHERE Type = 'LEADER_TOMJEFFERSON';
END;	