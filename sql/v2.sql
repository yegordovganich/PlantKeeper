INSERT INTO `families`(`name`, `description`) VALUES ('tree', 'all trees');
INSERT INTO `families`(`name`) VALUES ('bush');
INSERT INTO `families`(`name`) VALUES ('flower');

INSERT INTO `color_types`(`id`, `name`) VALUES (1, 'Leaf');
INSERT INTO `color_types`(`id`, `name`) VALUES (2, 'Bud');
INSERT INTO `color_types`(`id`, `name`) VALUES (3, 'Both');

INSERT INTO `plant_colors`(`name`, `color_number`, `color_type_id`) VALUES ('GreenYellow', '#ADFF2F', 1);
INSERT INTO `plant_colors`(`name`, `color_number`, `color_type_id`) VALUES ('Chartreuse', '#7FFF00', 1);
INSERT INTO `plant_colors`(`name`, `color_number`, `color_type_id`) VALUES ('LawnGreen', '#7CFC00', 1);
INSERT INTO `plant_colors`(`name`, `color_number`, `color_type_id`) VALUES ('IndianRed', '#CD5C5C', 2);
INSERT INTO `plant_colors`(`name`, `color_number`, `color_type_id`) VALUES ('LightCoral', '#F08080', 2);
INSERT INTO `plant_colors`(`name`, `color_number`, `color_type_id`) VALUES ('Salmon', '#FA8072', 2);
INSERT INTO `plant_colors`(`name`, `color_number`, `color_type_id`) VALUES ('Olive', '#808000', 3);

INSERT INTO `leaf_types`(`id`, `name`, `description`, `picture`) VALUES (1, 'Simple', 'single leaf on a branch', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzw0cHglDcZII37WoT6qKIRSsTsIIZLm22s-VFNB3yNOhcP7gP');
INSERT INTO `leaf_types`(`id`, `name`, `description`, `picture`) VALUES (2, 'Compound', 'group of leaves', 'http://www.buzzle.com/images/trees/tree-leaves/mimosa-tree-single-leaf.jpg');
INSERT INTO `leaf_types`(`id`, `name`, `description`, `picture`) VALUES (3, 'Opposite leaves', 'two opposite leaves on a branch', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl6mhDGTvyf1-cUPWRqi5TIhE05CTnzmlDreI4IqtcxTE3Zx5HJA');

INSERT INTO `care_plans`(`name`, `description`, `pour`, `light`, `turn`, `tempreture`, `spray`, `wipe_leaves`) 
	VALUES ('Common 1', 'An example of simple common care plan', 2, 1, 1, 21, 1, 0.5);

UPDATE `plantkeeper_version` SET `version` = 2 WHERE `version` = 1;