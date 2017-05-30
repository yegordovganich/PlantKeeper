# Add admin@area9.dk user for plantkeeper
INSERT INTO `users` (`email`, `first_name`, `last_name`, `user_name`, `password`, `created_at`, `validation`, `application`, `avatar`, `active`) 
	VALUES (
		'admin@area9.dk', 
		'Admin', 
		'Account', 
		'admin@area9.dk', 
		'sha256:1000:2QmgdPLOjhxAJ3ac6xGG9184jrHQm9ub:FN1SWU6F91fFxN8ClzJM/qB46raZgiyS', 
		'2016-03-15 13:48:28', 
		'OK', 
		'plantkeeper', 
		'', 
		'1'
 	) ON DUPLICATE KEY UPDATE `application` = 'plantkeeper';

# Add demo@area9.dk user for plantkeeper
INSERT INTO `users` (`email`, `first_name`, `last_name`, `user_name`, `password`, `created_at`, `validation`, `application`, `avatar`, `active`) 
	VALUES (
		'demo@area9.dk', 
		'Demo', 
		'Account', 
		'demo@area9.dk', 
		'sha256:1000:2QmgdPLOjhxAJ3ac6xGG9184jrHQm9ub:FN1SWU6F91fFxN8ClzJM/qB46raZgiyS', 
		'2016-03-15 13:48:28', 
		'OK', 
		'plantkeeper', 
		'', 
		'1'
 	) ON DUPLICATE KEY UPDATE `application` = 'plantkeeper';
 	
# Add ulrik@area9.dk user for plantkeeper
INSERT INTO `users` (`email`, `first_name`, `last_name`, `user_name`, `password`, `created_at`, `validation`, `application`, `avatar`, `active`) 
	VALUES (
		'ulrik@area9.dk', 
		'Ulrik', 
		'Juul Christensen', 
		'ulrik@area9.dk', 
		'sha256:1000:k48Zjm7XlmKRD09NDCIrKI6fKZXYhKDS:nX2D8qAFyh82s8Kd7y0w84WSioc0IU7x', 
		'2016-05-10 13:57:16', 
		'OK', 
		'plantkeeper', 
		'', 
		'1'
 	) ON DUPLICATE KEY UPDATE `application` = 'plantkeeper';

# Update shift@daemon user to be compatible with plantkeeper
UPDATE `users` SET `application`='plantkeeper' WHERE `email` ='shift@daemon';

# Create admin role if it doesn't exist yet and assign admin@area9.dk to it
INSERT INTO `product_roles` (`name`, `description`) 
	SELECT 'Admin', 'Application administrator' FROM `users`
	WHERE NOT EXISTS (
		SELECT * FROM `product_roles` WHERE `product_roles`.`name` = 'Admin' 
	) LIMIT 1; 

INSERT IGNORE INTO `users_product_roles` (`user_id`, `role_id`) 
VALUES (
	(SELECT `id` FROM `users` WHERE `email` = 'admin@area9.dk' LIMIT 1), 
	(SELECT `id` FROM `product_roles` WHERE `name` = 'Admin' LIMIT 1) 
); 

INSERT IGNORE INTO `product_permissions` (`name`, `description`)
VALUES 
	("create_user", "Allow to create user using oauth API"),
	("delete_user", "Allow to delete user using oauth API"),
	("change_user_password", "Allow to change another user password using oauth API"),
	("createjwt_permission", "Allow to create JWT using oauth API"),
	("invite_user", "Allow to invite user using oauth API"),
	("send_mail", "Allow to send mails using oauth API"),
	("createidsecret_permission", "Allow to generate id and secret for oauth_server applications using oauth_server API"),
	("manage_roles_permissions", "Allow to do CREATE, UPDATE or DELETE operations with admin_panel's tables data using admin_panel API")
;

INSERT IGNORE INTO `product_roles_permissions` (`role_id`, `permission_id`)
VALUES
	(
		(SELECT `id` FROM `product_roles` WHERE `name` = 'Admin' LIMIT 1), 
		(SELECT `id` FROM `product_permissions` WHERE `name` = 'create_user' LIMIT 1)
	),
	(
		(SELECT `id` FROM `product_roles` WHERE `name` = 'Admin' LIMIT 1), 
		(SELECT `id` FROM `product_permissions` WHERE `name` = 'delete_user' LIMIT 1)
	),
	(
		(SELECT `id` FROM `product_roles` WHERE `name` = 'Admin' LIMIT 1), 
		(SELECT `id` FROM `product_permissions` WHERE `name` = 'change_user_password' LIMIT 1)
	),
	(
		(SELECT `id` FROM `product_roles` WHERE `name` = 'Admin' LIMIT 1), 
		(SELECT `id` FROM `product_permissions` WHERE `name` = 'createjwt_permission' LIMIT 1)
	),
	(
		(SELECT `id` FROM `product_roles` WHERE `name` = 'Admin' LIMIT 1), 
		(SELECT `id` FROM `product_permissions` WHERE `name` = 'invite_user' LIMIT 1)
	),
	(
		(SELECT `id` FROM `product_roles` WHERE `name` = 'Admin' LIMIT 1), 
		(SELECT `id` FROM `product_permissions` WHERE `name` = 'send_mail' LIMIT 1)
	),
	(
		(SELECT `id` FROM `product_roles` WHERE `name` = 'Admin' LIMIT 1), 
		(SELECT `id` FROM `product_permissions` WHERE `name` = 'createidsecret_permission' LIMIT 1)
	),
	(
		(SELECT `id` FROM `product_roles` WHERE `name` = 'Admin' LIMIT 1), 
		(SELECT `id` FROM `product_permissions` WHERE `name` = 'manage_roles_permissions' LIMIT 1)
	)
;

