/** import drive/sql/drive.sql */

CREATE TABLE IF NOT EXISTS `plant_keeper_version` (
`version` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `plant_keeper_version` (`version`) VALUES (0);

CREATE TABLE IF NOT EXISTS `families` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
`description` varchar(255),
PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `colors` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`color` int(11) NOT NULL,
`leaf` tinyint(1)  NOT NULL COMMENT '0 - leaf, 1 - flower/bud',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `leaf_types` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
`description` varchar(255),
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `care_plans` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
`description` varchar(255),
`pour` double NOT NULL COMMENT 'How often you should pour the plant per day. 2 - two times per day, 0.5 - 1 time per two days', 
`light` tinyint(1) NOT NULL COMMENT '0 - the plant prefers dark, 1 - light',
`turn` double NOT NULL COMMENT 'Period of turning plant around per week',
`tempreture` int(3) NOT NULL 'Prefered tempreture',
`spray` double NOT NULL COMMENT 'Period of spraying',
`wipe_leaves` double NOT NULL COMMENT 'Period of wiping leaves',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `plants` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
`family_id` int(11) NOT NULL,
`leaf_color_id` int(11) NOT NULL,
`bud_color_id` int(11) NOT NULL,
`height` int(11) NOT NULL,
`leaf_type_id` int(11) NOT NULL,
`care_plan_id` int(11) NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_plants_families` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT `FK_plants_leaf_colors` FOREIGN KEY (`leaf_color_id`) REFERENCES `colors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT `FK_plants_bud_colors` FOREIGN KEY (`bud_color_id`) REFERENCES `colors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT `FK_plants_leaf_types` FOREIGN KEY (`leaf_type_id`) REFERENCES `leaf_types` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT `FK_plants_families` FOREIGN KEY (`care_plan_id`) REFERENCES `care_plans` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

