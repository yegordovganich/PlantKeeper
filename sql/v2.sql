ALTER TABLE `colors` CHANGE `color` `name` INT(11) NOT NULL;

UPDATE `plantkeeper_version` SET `version`=2 WHERE `version`=1 LIMIT 1;