CREATE TABLE `schema_migrations`(`filename` varchar(255) NOT NULL PRIMARY KEY);
CREATE TABLE `users`(
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `email_address` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL,
  `updated_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL
);
CREATE UNIQUE INDEX `users_email_address_index` ON `users`(`email_address`);
CREATE TABLE `sessions`(
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `user_id` integer NOT NULL REFERENCES `users` ON DELETE CASCADE,
  `token_digest` varchar(255) NOT NULL,
  `ip_address` varchar(255),
  `user_agent` varchar(255),
  `created_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL,
  `updated_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL
);
CREATE INDEX `sessions_user_id_index` ON `sessions`(`user_id`);
CREATE UNIQUE INDEX `sessions_token_digest_index` ON `sessions`(
  `token_digest`
);
CREATE TABLE `notes`(
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `user_id` integer NOT NULL REFERENCES `users` ON DELETE CASCADE,
  `title` varchar(255) NOT NULL,
  `body` text DEFAULT('') NOT NULL,
  `created_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL,
  `updated_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL
);
CREATE INDEX `notes_user_id_index` ON `notes`(`user_id`);
INSERT INTO schema_migrations (filename) VALUES
('20261013004702_create_users.rb'),
('20261013004703_create_sessions.rb'),
('20261013004712_create_notes.rb');
