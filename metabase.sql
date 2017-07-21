/*
Navicat MySQL Data Transfer

Source Server         : litaoa
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : metabase

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-07-07 11:02:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `model` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `database_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `custom_id` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_activity_timestamp` (`timestamp`),
  KEY `idx_activity_user_id` (`user_id`),
  KEY `idx_activity_custom_id` (`custom_id`),
  CONSTRAINT `fk_activity_ref_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', 'install', '2017-06-20 22:22:51', null, 'install', null, null, null, null, '{}');
INSERT INTO `activity` VALUES ('2', 'user-joined', '2017-06-22 11:26:28', '2', 'user', '2', null, null, null, '{}');
INSERT INTO `activity` VALUES ('3', 'card-create', '2017-06-22 12:27:18', '1', 'card', '1', '3', '91', null, '{\"name\":\"Tasks\",\"description\":null}');
INSERT INTO `activity` VALUES ('4', 'dashboard-add-cards', '2017-06-22 12:27:41', '1', 'dashboard', '1', null, null, null, '{\"description\":null,\"name\":\"sasfd\",\"dashcards\":[{\"name\":\"Tasks\",\"description\":null,\"id\":1,\"card_id\":1}]}');
INSERT INTO `activity` VALUES ('5', 'card-create', '2017-06-22 14:52:33', '1', 'card', '2', '3', '73', null, '{\"name\":\"Projects\",\"description\":null}');
INSERT INTO `activity` VALUES ('6', 'dashboard-add-cards', '2017-06-22 14:52:48', '1', 'dashboard', '1', null, null, null, '{\"description\":null,\"name\":\"sasfd\",\"dashcards\":[{\"name\":\"Projects\",\"description\":null,\"id\":2,\"card_id\":2}]}');
INSERT INTO `activity` VALUES ('7', 'card-update', '2017-06-22 14:53:50', '1', 'card', '2', '3', '73', null, '{\"name\":\"Projects\",\"description\":null}');
INSERT INTO `activity` VALUES ('8', 'card-update', '2017-06-22 14:53:50', '1', 'card', '1', '3', '91', null, '{\"name\":\"Tasks\",\"description\":null}');
INSERT INTO `activity` VALUES ('9', 'card-create', '2017-06-22 16:31:27', '1', 'card', '3', '3', '91', null, '{\"name\":\"Tasks\",\"description\":null}');
INSERT INTO `activity` VALUES ('10', 'dashboard-add-cards', '2017-06-22 16:31:46', '1', 'dashboard', '1', null, null, null, '{\"description\":null,\"name\":\"sasfd\",\"dashcards\":[{\"name\":\"Tasks\",\"description\":null,\"id\":3,\"card_id\":3}]}');
INSERT INTO `activity` VALUES ('11', 'card-create', '2017-06-24 17:38:06', '1', 'card', '4', '3', null, null, '{\"name\":\"项目进度\",\"description\":null}');
INSERT INTO `activity` VALUES ('12', 'dashboard-add-cards', '2017-06-24 17:38:56', '1', 'dashboard', '1', null, null, null, '{\"description\":null,\"name\":\"sasfd\",\"dashcards\":[{\"name\":\"项目进度\",\"description\":null,\"id\":4,\"card_id\":4}]}');
INSERT INTO `activity` VALUES ('13', 'card-update', '2017-06-24 17:44:23', '1', 'card', '3', '3', '91', null, '{\"name\":\"Tasks\",\"description\":null}');
INSERT INTO `activity` VALUES ('14', 'card-update', '2017-06-24 17:44:34', '1', 'card', '2', '3', '73', null, '{\"name\":\"Projects\",\"description\":null}');
INSERT INTO `activity` VALUES ('15', 'card-update', '2017-06-24 17:44:35', '1', 'card', '1', '3', '91', null, '{\"name\":\"Tasks\",\"description\":null}');
INSERT INTO `activity` VALUES ('16', 'card-update', '2017-06-24 17:44:47', '1', 'card', '2', '3', '73', null, '{\"name\":\"Projects\",\"description\":null}');
INSERT INTO `activity` VALUES ('17', 'card-update', '2017-06-24 17:44:47', '1', 'card', '3', '3', '91', null, '{\"name\":\"Tasks\",\"description\":null}');
INSERT INTO `activity` VALUES ('18', 'card-update', '2017-06-24 17:44:47', '1', 'card', '1', '3', '91', null, '{\"name\":\"Tasks\",\"description\":null}');
INSERT INTO `activity` VALUES ('19', 'card-update', '2017-06-24 17:49:46', '1', 'card', '4', '3', null, null, '{\"name\":\"项目进度\",\"description\":null}');
INSERT INTO `activity` VALUES ('20', 'card-update', '2017-06-24 17:52:57', '1', 'card', '4', '3', null, null, '{\"name\":\"项目进度\",\"description\":null}');
INSERT INTO `activity` VALUES ('21', 'card-update', '2017-06-24 17:54:40', '1', 'card', '4', '3', null, null, '{\"name\":\"项目进度\",\"description\":null}');

-- ----------------------------
-- Table structure for `card_label`
-- ----------------------------
DROP TABLE IF EXISTS `card_label`;
CREATE TABLE `card_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_card_label_card_id_label_id` (`card_id`,`label_id`),
  KEY `idx_card_label_card_id` (`card_id`),
  KEY `idx_card_label_label_id` (`label_id`),
  CONSTRAINT `fk_card_label_ref_card_id` FOREIGN KEY (`card_id`) REFERENCES `report_card` (`id`),
  CONSTRAINT `fk_card_label_ref_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of card_label
-- ----------------------------

-- ----------------------------
-- Table structure for `collection`
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'The unique, user-facing name of this Collection.',
  `slug` varchar(254) COLLATE utf8_unicode_ci NOT NULL COMMENT 'URL-friendly, sluggified, indexed version of name.',
  `description` text COLLATE utf8_unicode_ci COMMENT 'Optional description for this Collection.',
  `color` char(7) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Seven-character hex color for this Collection, including the preceding hash sign.',
  `archived` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Whether this Collection has been archived and should be hidden from users.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_collection_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Collections are an optional way to organize Cards and handle permissions for them.';

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('1', 'testcollecti', 'testcollecti', null, '#7B8797', '');

-- ----------------------------
-- Table structure for `collection_revision`
-- ----------------------------
DROP TABLE IF EXISTS `collection_revision`;
CREATE TABLE `collection_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `before` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Serialized JSON of the collections graph before the changes.',
  `after` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Serialized JSON of the collections graph after the changes.',
  `user_id` int(11) NOT NULL COMMENT 'The ID of the admin who made this set of changes.',
  `created_at` datetime NOT NULL COMMENT 'The timestamp of when these changes were made.',
  `remark` text COLLATE utf8_unicode_ci COMMENT 'Optional remarks explaining why these changes were made.',
  PRIMARY KEY (`id`),
  KEY `fk_collection_revision_user_id` (`user_id`),
  CONSTRAINT `fk_collection_revision_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used to keep track of changes made to collections.';

-- ----------------------------
-- Records of collection_revision
-- ----------------------------

-- ----------------------------
-- Table structure for `core_session`
-- ----------------------------
DROP TABLE IF EXISTS `core_session`;
CREATE TABLE `core_session` (
  `id` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_session_ref_user_id` (`user_id`),
  CONSTRAINT `fk_session_ref_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_session
-- ----------------------------
INSERT INTO `core_session` VALUES ('aae61207-f00c-43eb-bdaa-6168d90f292e', '1', '2017-06-22 00:18:02');
INSERT INTO `core_session` VALUES ('d77e77ea-e2bc-4d85-9d29-569b948d7721', '2', '2017-06-22 11:28:36');

-- ----------------------------
-- Table structure for `core_user`
-- ----------------------------
DROP TABLE IF EXISTS `core_user`;
CREATE TABLE `core_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `password_salt` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `date_joined` datetime NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` bit(1) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `reset_token` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_triggered` bigint(20) DEFAULT NULL,
  `is_qbnewb` bit(1) NOT NULL DEFAULT b'1',
  `google_auth` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_user
-- ----------------------------
INSERT INTO `core_user` VALUES ('1', '1055586866@qq.com', 's', 'cc', '$2a$10$w89YP1BE8coyLzO.R6dL4uQn626TQV2uEsQYsIjNbjpvoR6RFICZu', 'd92955d4-ea91-4ee4-bfc3-70d6b8b2d8ac', '2017-06-22 00:18:01', null, '', '', null, null, '', '');
INSERT INTO `core_user` VALUES ('2', 'xiaoshou1@litaoa.com', '销售1', 'xs', '$2a$10$3mNuNYWyN/r0eqIYd5lwvuDfym1sfzpUUHpQ8c/OhtpJ.lkOeQg5W', '55a1b9d5-3ea8-47e8-b0d6-3527b34dabe0', '2017-06-22 11:20:29', '2017-06-22 11:28:36', '', '', null, null, '', '');

-- ----------------------------
-- Table structure for `dashboardcard_series`
-- ----------------------------
DROP TABLE IF EXISTS `dashboardcard_series`;
CREATE TABLE `dashboardcard_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dashboardcard_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dashboardcard_series_dashboardcard_id` (`dashboardcard_id`),
  KEY `idx_dashboardcard_series_card_id` (`card_id`),
  CONSTRAINT `fk_dashboardcard_series_ref_card_id` FOREIGN KEY (`card_id`) REFERENCES `report_card` (`id`),
  CONSTRAINT `fk_dashboardcard_series_ref_dashboardcard_id` FOREIGN KEY (`dashboardcard_id`) REFERENCES `report_dashboardcard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dashboardcard_series
-- ----------------------------

-- ----------------------------
-- Table structure for `dashboard_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_favorite`;
CREATE TABLE `dashboard_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'ID of the User who favorited the Dashboard.',
  `dashboard_id` int(11) NOT NULL COMMENT 'ID of the Dashboard favorited by the User.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_dashboard_favorite_user_id_dashboard_id` (`user_id`,`dashboard_id`),
  KEY `idx_dashboard_favorite_user_id` (`user_id`),
  KEY `idx_dashboard_favorite_dashboard_id` (`dashboard_id`),
  CONSTRAINT `fk_dashboard_favorite_dashboard_id` FOREIGN KEY (`dashboard_id`) REFERENCES `report_dashboard` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dashboard_favorite_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Presence of a row here indicates a given User has favorited a given Dashboard.';

-- ----------------------------
-- Records of dashboard_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `databasechangelog`
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('1', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:01', '1', 'EXECUTED', '7:1b0742414a26a9b52ed5622ce7516ad7', 'createTable tableName=core_organization; createTable tableName=core_user; createTable tableName=core_userorgperm; addUniqueConstraint constraintName=idx_unique_user_id_organization_id, tableName=core_userorgperm; createIndex indexName=idx_userorgp...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('2', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:01', '2', 'EXECUTED', '7:e63cf4e800ec122c1a19c04b8c07cc3f', 'createTable tableName=core_session', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('4', 'cammsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:20:02', '3', 'EXECUTED', '7:1ed887e91a846f4d6cbe84d1efd126c4', 'createTable tableName=setting', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('5', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:03', '4', 'EXECUTED', '7:593149128c8f3a7e1f37a483bc67a924', 'addColumn tableName=core_organization', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('6', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:13', '5', 'EXECUTED', '7:d24f2f950306f150d87c4208520661d5', 'dropNotNullConstraint columnName=organization_id, tableName=metabase_database; dropForeignKeyConstraint baseTableName=metabase_database, constraintName=fk_database_ref_organization_id; dropNotNullConstraint columnName=organization_id, tableName=re...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('7', 'cammsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:20:16', '6', 'EXECUTED', '7:baec0ec600ccc9bdadc176c1c4b29b77', 'addColumn tableName=metabase_field', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('8', 'tlrobinson', 'migrations/000_migrations.yaml', '2017-06-20 22:20:18', '7', 'EXECUTED', '7:ea2727c7ce666178cff436549f81ddbd', 'addColumn tableName=metabase_table; addColumn tableName=metabase_field', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('9', 'tlrobinson', 'migrations/000_migrations.yaml', '2017-06-20 22:20:19', '8', 'EXECUTED', '7:c05cf8a25248b38e281e8e85de4275a2', 'addColumn tableName=metabase_table', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('10', 'cammsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:20:20', '9', 'EXECUTED', '7:97fec69516d0dfe424ea7365f51bb87e', 'createTable tableName=revision; createIndex indexName=idx_revision_model_model_id, tableName=revision', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('11', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:20', '10', 'EXECUTED', '7:c7ef8b4f4dcb3528f9282b51aea5bb2a', 'sql', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('12', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:24', '11', 'EXECUTED', '7:f78e18f669d7c9e6d06c63ea9929391f', 'addColumn tableName=report_card', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('13', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:25', '12', 'EXECUTED', '7:f27286894439bef33ff93761f9b32bc4', 'createTable tableName=activity; createIndex indexName=idx_activity_timestamp, tableName=activity; createIndex indexName=idx_activity_user_id, tableName=activity; createIndex indexName=idx_activity_custom_id, tableName=activity', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('14', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:27', '13', 'EXECUTED', '7:2bc8ad9e775091db38a79ee610eafc97', 'createTable tableName=view_log; createIndex indexName=idx_view_log_user_id, tableName=view_log; createIndex indexName=idx_view_log_timestamp, tableName=view_log', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('15', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:28', '14', 'EXECUTED', '7:50c72a51651af76928c06f21c9e04f97', 'addColumn tableName=revision', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('16', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:28', '15', 'EXECUTED', '7:70484ee18e0067988963d3042343e300', 'dropNotNullConstraint columnName=last_login, tableName=core_user', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('17', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:29', '16', 'EXECUTED', '7:5401ec35a5bd1275f93a7cac1ddd7591', 'addColumn tableName=metabase_database; sql', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('18', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:20:30', '17', 'EXECUTED', '7:329d897d44ba9893fdafc9ce7e876d73', 'createTable tableName=data_migrations; createIndex indexName=idx_data_migrations_id, tableName=data_migrations', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('19', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:20:31', '18', 'EXECUTED', '7:e8fa976811e4d58d42a45804affa1d07', 'addColumn tableName=metabase_table', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('20', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:40', '19', 'EXECUTED', '7:e9f9ab6a3f7a54d3cf1ab70bf7f288b9', 'createTable tableName=pulse; createIndex indexName=idx_pulse_creator_id, tableName=pulse; createTable tableName=pulse_card; createIndex indexName=idx_pulse_card_pulse_id, tableName=pulse_card; createIndex indexName=idx_pulse_card_card_id, tableNam...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('21', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:42', '20', 'EXECUTED', '7:10f47e47d4a6b5479702485355968d60', 'createTable tableName=segment; createIndex indexName=idx_segment_creator_id, tableName=segment; createIndex indexName=idx_segment_table_id, tableName=segment', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('22', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:43', '21', 'EXECUTED', '7:cb6776ec86ab0ad9e74806a5460b9085', 'addColumn tableName=revision', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('23', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:45', '22', 'EXECUTED', '7:43b9662bd798db391d4bbb7d4615bf0d', 'modifyDataType columnName=rows, tableName=metabase_table', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('24', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:47', '23', 'EXECUTED', '7:b77dea78a3645ab993b30d949abee28a', 'createTable tableName=dependency; createIndex indexName=idx_dependency_model, tableName=dependency; createIndex indexName=idx_dependency_model_id, tableName=dependency; createIndex indexName=idx_dependency_dependent_on_model, tableName=dependency;...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('25', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:49', '24', 'EXECUTED', '7:c40bd959d6a76be99e324a8a821c0bde', 'createTable tableName=metric; createIndex indexName=idx_metric_creator_id, tableName=metric; createIndex indexName=idx_metric_table_id, tableName=metric', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('26', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:50', '25', 'EXECUTED', '7:ac7f40d2a3fbf3fea7936aa79bb1532b', 'addColumn tableName=metabase_database; sql', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('27', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:51', '26', 'EXECUTED', '7:6daeade421b85d930b07f95d8d6a14c5', 'createTable tableName=dashboardcard_series; createIndex indexName=idx_dashboardcard_series_dashboardcard_id, tableName=dashboardcard_series; createIndex indexName=idx_dashboardcard_series_card_id, tableName=dashboardcard_series', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('28', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:53', '27', 'EXECUTED', '7:335e7e6b32dcbeb392150b3c3db2d5eb', 'addColumn tableName=core_user', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('29', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:54', '28', 'EXECUTED', '7:7b0bb8fcb7de2aa29ce57b32baf9ff31', 'addColumn tableName=pulse_channel', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('30', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:56', '29', 'EXECUTED', '7:7b5245de5d964eedb5cd6fdf5afdb6fd', 'addColumn tableName=metabase_field; addNotNullConstraint columnName=visibility_type, tableName=metabase_field', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('31', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:20:57', '30', 'EXECUTED', '7:347281cdb65a285b03aeaf77cb28e618', 'addColumn tableName=metabase_field', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('32', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:21:03', '31', 'EXECUTED', '7:ff40b5fbe06dc5221d0b9223992ece25', 'createTable tableName=label; createIndex indexName=idx_label_slug, tableName=label; createTable tableName=card_label; addUniqueConstraint constraintName=unique_card_label_card_id_label_id, tableName=card_label; createIndex indexName=idx_card_label...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('32', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:21:11', '32', 'EXECUTED', '7:143cf1041ee698943cc6d1c6650105b4', 'createTable tableName=raw_table; createIndex indexName=idx_rawtable_database_id, tableName=raw_table; addUniqueConstraint constraintName=uniq_raw_table_db_schema_name, tableName=raw_table; createTable tableName=raw_column; createIndex indexName=id...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('34', 'tlrobinson', 'migrations/000_migrations.yaml', '2017-06-20 22:21:12', '33', 'EXECUTED', '7:e65d70b4c914cfdf5b3ef9927565e899', 'addColumn tableName=pulse_channel', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('35', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:21:14', '34', 'EXECUTED', '7:ab80b6b8e6dfc3fa3e8fa5954e3a8ec4', 'modifyDataType columnName=value, tableName=setting', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('36', 'agilliland', 'migrations/000_migrations.yaml', '2017-06-20 22:21:19', '35', 'EXECUTED', '7:de534c871471b400d70ee29122f23847', 'addColumn tableName=report_dashboard; addNotNullConstraint columnName=parameters, tableName=report_dashboard; addColumn tableName=report_dashboardcard; addNotNullConstraint columnName=parameter_mappings, tableName=report_dashboardcard', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('37', 'tlrobinson', 'migrations/000_migrations.yaml', '2017-06-20 22:21:22', '36', 'EXECUTED', '7:487dd1fa57af0f25edf3265ed9899588', 'addColumn tableName=query_queryexecution; addNotNullConstraint columnName=query_hash, tableName=query_queryexecution; createIndex indexName=idx_query_queryexecution_query_hash, tableName=query_queryexecution; createIndex indexName=idx_query_querye...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('38', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:21:47', '37', 'EXECUTED', '7:5e32fa14a0c34b99027e25901b7e3255', 'addColumn tableName=metabase_database; addColumn tableName=metabase_table; addColumn tableName=metabase_field; addColumn tableName=report_dashboard; addColumn tableName=metric; addColumn tableName=segment; addColumn tableName=metabase_database; ad...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('39', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:21:48', '38', 'EXECUTED', '7:a63ada256c44684d2649b8f3c28a3023', 'addColumn tableName=core_user', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('40', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:21:56', '39', 'EXECUTED', '7:0ba56822308957969bf5ad5ea8ee6707', 'createTable tableName=permissions_group; createIndex indexName=idx_permissions_group_name, tableName=permissions_group; createTable tableName=permissions_group_membership; addUniqueConstraint constraintName=unique_permissions_group_membership_user...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('41', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:21:58', '40', 'EXECUTED', '7:e1aa5b70f61426b29d74d38936e560de', 'dropColumn columnName=field_type, tableName=metabase_field; addDefaultValue columnName=active, tableName=metabase_field; addDefaultValue columnName=preview_display, tableName=metabase_field; addDefaultValue columnName=position, tableName=metabase_...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('42', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:10', '41', 'EXECUTED', '7:779407e2ea3b8d89092fc9f72e29fdaa', 'dropForeignKeyConstraint baseTableName=query_queryexecution, constraintName=fk_queryexecution_ref_query_id; dropColumn columnName=query_id, tableName=query_queryexecution; dropColumn columnName=is_staff, tableName=core_user; dropColumn columnName=...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('43', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:10', '42', 'EXECUTED', '7:dbc18c8ca697fc335869f0ed0eb5f4cb', 'createTable tableName=permissions_revision', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('44', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:14', '43', 'EXECUTED', '7:1d09a61933bbc5a01b0ddef7bd1b1336', 'dropColumn columnName=public_perms, tableName=report_card; dropColumn columnName=public_perms, tableName=report_dashboard; dropColumn columnName=public_perms, tableName=pulse', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('45', 'tlrobinson', 'migrations/000_migrations.yaml', '2017-06-20 22:22:16', '44', 'EXECUTED', '7:9198081e3329df7903d9016804ef0cf0', 'addColumn tableName=report_dashboardcard; addNotNullConstraint columnName=visualization_settings, tableName=report_dashboardcard', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('46', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:18', '45', 'EXECUTED', '7:aab12e940225b458986e15cf53d5d816', 'addNotNullConstraint columnName=row, tableName=report_dashboardcard; addNotNullConstraint columnName=col, tableName=report_dashboardcard; addDefaultValue columnName=row, tableName=report_dashboardcard; addDefaultValue columnName=col, tableName=rep...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('47', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:23', '46', 'EXECUTED', '7:381e18d5008269e299f12c9726163675', 'createTable tableName=collection; createIndex indexName=idx_collection_slug, tableName=collection; addColumn tableName=report_card; createIndex indexName=idx_card_collection_id, tableName=report_card', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('48', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:25', '47', 'EXECUTED', '7:b8957fda76bab207f99ced39353df1da', 'createTable tableName=collection_revision', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('49', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:34', '48', 'EXECUTED', '7:bb653dc1919f366bb81f3356a4cbfa6c', 'addColumn tableName=report_card; createIndex indexName=idx_card_public_uuid, tableName=report_card; addColumn tableName=report_dashboard; createIndex indexName=idx_dashboard_public_uuid, tableName=report_dashboard; dropNotNullConstraint columnName...', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('50', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:38', '49', 'EXECUTED', '7:6a45ed802c2f724731835bfaa97c57c9', 'addColumn tableName=report_card; addColumn tableName=report_dashboard', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('51', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:40', '50', 'EXECUTED', '7:2b28e18d04212a1cbd82eb7888ae4af3', 'createTable tableName=query_execution; createIndex indexName=idx_query_execution_started_at, tableName=query_execution; createIndex indexName=idx_query_execution_query_hash_started_at, tableName=query_execution', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('52', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:42', '51', 'EXECUTED', '7:bcf30d329f6398876caa78af39c78830', 'createTable tableName=query_cache; createIndex indexName=idx_query_cache_updated_at, tableName=query_cache; addColumn tableName=report_card', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('53', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:43', '52', 'EXECUTED', '7:cc7ef026c3375d31df5f03036bb7e850', 'createTable tableName=query', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('54', 'tlrobinson', 'migrations/000_migrations.yaml', '2017-06-20 22:22:44', '53', 'EXECUTED', '7:0857800db71a4757e7202aad4eaed48d', 'addColumn tableName=pulse', '', null, '3.5.3', null, null, '7968372760');
INSERT INTO `databasechangelog` VALUES ('55', 'camsaul', 'migrations/000_migrations.yaml', '2017-06-20 22:22:48', '54', 'EXECUTED', '7:e169c9d0a5220127b97630e95717c033', 'addColumn tableName=report_dashboard; createTable tableName=dashboard_favorite; addUniqueConstraint constraintName=unique_dashboard_favorite_user_id_dashboard_id, tableName=dashboard_favorite; createIndex indexName=idx_dashboard_favorite_user_id, ...', '', null, '3.5.3', null, null, '7968372760');

-- ----------------------------
-- Table structure for `databasechangeloglock`
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES ('1', '', null, null);

-- ----------------------------
-- Table structure for `data_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `data_migrations`;
CREATE TABLE `data_migrations` (
  `id` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_data_migrations_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_migrations
-- ----------------------------
INSERT INTO `data_migrations` VALUES ('add-admin-group-root-entry', '2017-06-20 22:22:50');
INSERT INTO `data_migrations` VALUES ('add-databases-to-magic-permissions-groups', '2017-06-20 22:22:50');
INSERT INTO `data_migrations` VALUES ('add-users-to-default-permissions-groups', '2017-06-20 22:22:50');
INSERT INTO `data_migrations` VALUES ('copy-site-url-setting-and-remove-trailing-slashes', '2017-06-20 22:22:50');
INSERT INTO `data_migrations` VALUES ('create-raw-tables', '2017-06-20 22:22:49');
INSERT INTO `data_migrations` VALUES ('drop-old-query-execution-table', '2017-06-20 22:22:51');
INSERT INTO `data_migrations` VALUES ('fix-invalid-field-types', '2017-06-20 22:22:50');
INSERT INTO `data_migrations` VALUES ('migrate-field-types', '2017-06-20 22:22:50');
INSERT INTO `data_migrations` VALUES ('migrate-field-visibility-type', '2017-06-20 22:22:49');
INSERT INTO `data_migrations` VALUES ('migrate-query-executions', '2017-06-20 22:22:50');
INSERT INTO `data_migrations` VALUES ('remove-database-sync-activity-entries', '2017-06-20 22:22:49');
INSERT INTO `data_migrations` VALUES ('set-admin-email', '2017-06-20 22:22:49');
INSERT INTO `data_migrations` VALUES ('set-card-database-and-table-ids', '2017-06-20 22:22:48');
INSERT INTO `data_migrations` VALUES ('set-default-schemas', '2017-06-20 22:22:48');
INSERT INTO `data_migrations` VALUES ('set-mongodb-databases-ssl-false', '2017-06-20 22:22:48');
INSERT INTO `data_migrations` VALUES ('update-dashboards-to-new-grid', '2017-06-20 22:22:49');

-- ----------------------------
-- Table structure for `dependency`
-- ----------------------------
DROP TABLE IF EXISTS `dependency`;
CREATE TABLE `dependency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` int(11) NOT NULL,
  `dependent_on_model` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `dependent_on_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dependency_model` (`model`),
  KEY `idx_dependency_model_id` (`model_id`),
  KEY `idx_dependency_dependent_on_model` (`dependent_on_model`),
  KEY `idx_dependency_dependent_on_id` (`dependent_on_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dependency
-- ----------------------------

-- ----------------------------
-- Table structure for `label`
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_label_slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of label
-- ----------------------------

-- ----------------------------
-- Table structure for `metabase_database`
-- ----------------------------
DROP TABLE IF EXISTS `metabase_database`;
CREATE TABLE `metabase_database` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `details` text COLLATE utf8_unicode_ci,
  `engine` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_sample` bit(1) NOT NULL DEFAULT b'0',
  `is_full_sync` bit(1) NOT NULL DEFAULT b'1',
  `points_of_interest` text COLLATE utf8_unicode_ci,
  `caveats` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of metabase_database
-- ----------------------------
INSERT INTO `metabase_database` VALUES ('3', '2017-06-22 10:45:39', '2017-06-22 10:45:39', 'localhost2', null, '{\"host\":\"127.0.0.1\",\"port\":3306,\"dbname\":\"wxb_site_new\",\"user\":\"root\",\"password\":\"13430252119scca\",\"tunnel-port\":22}', 'mysql', '', '', null, null);
INSERT INTO `metabase_database` VALUES ('4', '2017-06-22 10:59:28', '2017-07-02 10:08:28', 'Sample Dataset', null, '{\"db\":\"/D:/metabase-master/resources/sample-dataset.db;USER=GUEST;PASSWORD=guest\"}', 'h2', '', '', null, null);

-- ----------------------------
-- Table structure for `metabase_field`
-- ----------------------------
DROP TABLE IF EXISTS `metabase_field`;
CREATE TABLE `metabase_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `base_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `special_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `description` text COLLATE utf8_unicode_ci,
  `preview_display` bit(1) NOT NULL DEFAULT b'1',
  `position` int(11) NOT NULL DEFAULT '0',
  `table_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `display_name` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'normal',
  `fk_target_field_id` int(11) DEFAULT NULL,
  `raw_column_id` int(11) DEFAULT NULL,
  `last_analyzed` datetime DEFAULT NULL,
  `points_of_interest` text COLLATE utf8_unicode_ci,
  `caveats` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_field_table_id` (`table_id`),
  KEY `fk_field_parent_ref_field_id` (`parent_id`),
  CONSTRAINT `fk_field_parent_ref_field_id` FOREIGN KEY (`parent_id`) REFERENCES `metabase_field` (`id`),
  CONSTRAINT `fk_field_ref_table_id` FOREIGN KEY (`table_id`) REFERENCES `metabase_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1780 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of metabase_field
-- ----------------------------
INSERT INTO `metabase_field` VALUES ('35', '2017-06-22 10:46:23', '2017-06-22 10:46:23', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '5', null, 'ID', 'normal', null, '698', '2017-06-25 14:18:24', null, null);
INSERT INTO `metabase_field` VALUES ('36', '2017-06-22 10:46:23', '2017-06-22 10:46:23', 'resource_id', 'type/Integer', null, '', null, '', '0', '5', null, 'Resource ID', 'normal', null, '700', '2017-06-25 14:18:24', null, null);
INSERT INTO `metabase_field` VALUES ('37', '2017-06-22 10:46:24', '2017-06-22 10:46:24', 'resourceId', 'type/Integer', null, '', null, '', '0', '5', null, 'Resource ID', 'normal', null, '699', '2017-06-25 14:18:24', null, null);
INSERT INTO `metabase_field` VALUES ('38', '2017-06-22 10:46:24', '2017-06-22 10:46:24', 'task_id', 'type/Integer', null, '', null, '', '0', '5', null, 'Task ID', 'normal', null, '701', '2017-06-25 14:18:24', null, null);
INSERT INTO `metabase_field` VALUES ('39', '2017-06-22 10:46:24', '2017-06-22 10:46:24', 'units_val', 'type/Integer', null, '', null, '', '0', '5', null, 'Units Val', 'normal', null, '703', '2017-06-25 14:18:24', null, null);
INSERT INTO `metabase_field` VALUES ('40', '2017-06-22 10:46:24', '2017-06-22 10:46:24', 'unitsVal', 'type/Integer', null, '', null, '', '0', '5', null, 'Units Val', 'normal', null, '702', '2017-06-25 14:18:24', null, null);
INSERT INTO `metabase_field` VALUES ('41', '2017-06-22 10:46:25', '2017-06-22 10:48:01', 'addbyuser', 'type/Text', 'type/Category', '', null, '', '0', '6', null, 'Add By User', 'normal', null, '72', '2017-06-25 14:18:25', null, null);
INSERT INTO `metabase_field` VALUES ('42', '2017-06-22 10:46:25', '2017-06-22 10:48:02', 'addtime', 'type/Text', 'type/Category', '', null, '', '0', '6', null, 'Add Time', 'normal', null, '73', '2017-06-25 14:18:25', null, null);
INSERT INTO `metabase_field` VALUES ('43', '2017-06-22 10:46:25', '2017-06-22 10:48:02', 'content', 'type/Text', 'type/Category', '', null, '', '0', '6', null, 'Content', 'details-only', null, '74', '2017-06-25 14:18:25', null, null);
INSERT INTO `metabase_field` VALUES ('44', '2017-06-22 10:46:25', '2017-06-22 10:48:02', 'edittime', 'type/Text', 'type/Category', '', null, '', '0', '6', null, 'Edit Time', 'normal', null, '75', '2017-06-25 14:18:25', null, null);
INSERT INTO `metabase_field` VALUES ('45', '2017-06-22 10:46:25', '2017-06-22 10:46:25', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '6', null, 'ID', 'normal', null, '76', '2017-06-25 14:18:25', null, null);
INSERT INTO `metabase_field` VALUES ('46', '2017-06-22 10:46:25', '2017-06-22 10:48:03', 'pid', 'type/Integer', 'type/Category', '', null, '', '0', '6', null, 'Pid', 'normal', null, '77', '2017-06-25 14:18:25', null, null);
INSERT INTO `metabase_field` VALUES ('47', '2017-06-22 10:46:25', '2017-06-22 10:48:03', 'smtitle', 'type/Text', 'type/Category', '', null, '', '0', '6', null, 'Sm Title', 'normal', null, '78', '2017-06-25 14:18:25', null, null);
INSERT INTO `metabase_field` VALUES ('48', '2017-06-22 10:46:25', '2017-06-22 10:48:03', 'title', 'type/Text', 'type/Category', '', null, '', '0', '6', null, 'Title', 'normal', null, '79', '2017-06-25 14:18:25', null, null);
INSERT INTO `metabase_field` VALUES ('49', '2017-06-22 10:46:25', '2017-06-22 10:48:04', 'artid', 'type/Text', 'type/Category', '', null, '', '0', '7', null, 'Art ID', 'normal', null, '273', '2017-06-25 14:18:26', null, null);
INSERT INTO `metabase_field` VALUES ('50', '2017-06-22 10:46:26', '2017-06-22 10:48:04', 'content', 'type/Text', 'type/Category', '', null, '', '0', '7', null, 'Content', 'normal', null, '274', '2017-06-25 14:18:26', null, null);
INSERT INTO `metabase_field` VALUES ('51', '2017-06-22 10:46:26', '2017-06-22 10:46:26', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '7', null, 'ID', 'normal', null, '275', '2017-06-25 14:18:26', null, null);
INSERT INTO `metabase_field` VALUES ('52', '2017-06-22 10:46:26', '2017-06-22 10:48:04', 'time', 'type/Text', 'type/Category', '', null, '', '0', '7', null, 'Time', 'normal', null, '276', '2017-06-25 14:18:26', null, null);
INSERT INTO `metabase_field` VALUES ('53', '2017-06-22 10:46:26', '2017-06-22 10:48:04', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '7', null, 'UID', 'normal', null, '277', '2017-06-25 14:18:26', null, null);
INSERT INTO `metabase_field` VALUES ('54', '2017-06-22 10:46:26', '2017-06-22 10:48:05', 'addbyuser', 'type/Text', 'type/Category', '', null, '', '0', '8', null, 'Add By User', 'normal', null, '774', '2017-06-25 14:18:27', null, null);
INSERT INTO `metabase_field` VALUES ('55', '2017-06-22 10:46:26', '2017-06-22 10:48:05', 'addtime', 'type/Text', 'type/Category', '', null, '', '0', '8', null, 'Add Time', 'normal', null, '775', '2017-06-25 14:18:27', null, null);
INSERT INTO `metabase_field` VALUES ('56', '2017-06-22 10:46:26', '2017-06-22 10:46:26', 'content', 'type/Text', null, '', null, '', '0', '8', null, 'Content', 'normal', null, '776', '2017-06-25 14:18:27', null, null);
INSERT INTO `metabase_field` VALUES ('57', '2017-06-22 10:46:26', '2017-06-22 10:48:05', 'edittime', 'type/Text', 'type/Category', '', null, '', '0', '8', null, 'Edit Time', 'normal', null, '777', '2017-06-25 14:18:27', null, null);
INSERT INTO `metabase_field` VALUES ('58', '2017-06-22 10:46:26', '2017-06-22 10:46:26', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '8', null, 'ID', 'normal', null, '778', '2017-06-25 14:18:27', null, null);
INSERT INTO `metabase_field` VALUES ('59', '2017-06-22 10:46:26', '2017-06-22 10:48:06', 'pid', 'type/Integer', 'type/Category', '', null, '', '0', '8', null, 'Pid', 'normal', null, '779', '2017-06-25 14:18:27', null, null);
INSERT INTO `metabase_field` VALUES ('60', '2017-06-22 10:46:26', '2017-06-22 10:46:26', 'smtitle', 'type/Text', null, '', null, '', '0', '8', null, 'Sm Title', 'normal', null, '780', '2017-06-25 14:18:27', null, null);
INSERT INTO `metabase_field` VALUES ('61', '2017-06-22 10:46:26', '2017-06-22 10:48:06', 'title', 'type/Text', 'type/Category', '', null, '', '0', '8', null, 'Title', 'normal', null, '781', '2017-06-25 14:18:27', null, null);
INSERT INTO `metabase_field` VALUES ('62', '2017-06-22 10:46:27', '2017-06-22 10:48:07', 'desc', 'type/Text', 'type/Category', '', null, '', '0', '9', null, 'Desc', 'details-only', null, '513', '2017-06-25 14:18:28', null, null);
INSERT INTO `metabase_field` VALUES ('63', '2017-06-22 10:46:27', '2017-06-22 10:46:27', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '9', null, 'ID', 'normal', null, '514', '2017-06-25 14:18:28', null, null);
INSERT INTO `metabase_field` VALUES ('64', '2017-06-22 10:46:27', '2017-06-22 10:46:27', 'name', 'type/Text', 'type/Name', '', null, '', '0', '9', null, 'Name', 'normal', null, '515', '2017-06-25 14:18:28', null, null);
INSERT INTO `metabase_field` VALUES ('65', '2017-06-22 10:46:27', '2017-06-22 10:48:07', 'pid', 'type/Text', 'type/Category', '', null, '', '0', '9', null, 'Pid', 'normal', null, '516', '2017-06-25 14:18:28', null, null);
INSERT INTO `metabase_field` VALUES ('66', '2017-06-22 10:46:27', '2017-06-22 10:48:08', 'sort_id', 'type/Integer', 'type/Category', '', null, '', '0', '9', null, 'Sort ID', 'normal', null, '517', '2017-06-25 14:18:28', null, null);
INSERT INTO `metabase_field` VALUES ('67', '2017-06-22 10:46:27', '2017-06-22 10:48:08', 'subcount', 'type/Integer', 'type/Category', '', null, '', '0', '9', null, 'Sub Count', 'normal', null, '518', '2017-06-25 14:18:28', null, null);
INSERT INTO `metabase_field` VALUES ('68', '2017-06-22 10:46:27', '2017-06-22 10:48:08', 'time', 'type/Text', 'type/Category', '', null, '', '0', '9', null, 'Time', 'normal', null, '519', '2017-06-25 14:18:28', null, null);
INSERT INTO `metabase_field` VALUES ('69', '2017-06-22 10:46:27', '2017-06-22 10:48:09', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '9', null, 'UID', 'normal', null, '520', '2017-06-25 14:18:28', null, null);
INSERT INTO `metabase_field` VALUES ('70', '2017-06-22 10:46:27', '2017-06-22 10:46:27', 'desc', 'type/Text', null, '', null, '', '0', '10', null, 'Desc', 'normal', null, '478', '2017-06-25 14:18:29', null, null);
INSERT INTO `metabase_field` VALUES ('71', '2017-06-22 10:46:27', '2017-06-22 10:46:27', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '10', null, 'ID', 'normal', null, '479', '2017-06-25 14:18:29', null, null);
INSERT INTO `metabase_field` VALUES ('72', '2017-06-22 10:46:27', '2017-06-22 10:46:27', 'name', 'type/Text', 'type/Name', '', null, '', '0', '10', null, 'Name', 'normal', null, '480', '2017-06-25 14:18:29', null, null);
INSERT INTO `metabase_field` VALUES ('73', '2017-06-22 10:46:28', '2017-06-22 10:48:09', 'pid', 'type/Text', 'type/Category', '', null, '', '0', '10', null, 'Pid', 'normal', null, '481', '2017-06-25 14:18:29', null, null);
INSERT INTO `metabase_field` VALUES ('74', '2017-06-22 10:46:28', '2017-06-22 10:48:09', 'time', 'type/Text', 'type/Category', '', null, '', '0', '10', null, 'Time', 'normal', null, '482', '2017-06-25 14:18:29', null, null);
INSERT INTO `metabase_field` VALUES ('75', '2017-06-22 10:46:28', '2017-06-22 10:48:09', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '10', null, 'UID', 'normal', null, '483', '2017-06-25 14:18:29', null, null);
INSERT INTO `metabase_field` VALUES ('76', '2017-06-22 10:46:28', '2017-06-22 10:46:28', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '11', null, 'ID', 'normal', null, '782', '2017-06-25 14:18:29', null, null);
INSERT INTO `metabase_field` VALUES ('77', '2017-06-22 10:46:28', '2017-06-22 10:46:28', 'tid', 'type/Text', null, '', null, '', '0', '11', null, 'Tid', 'normal', null, '783', '2017-06-25 14:18:29', null, null);
INSERT INTO `metabase_field` VALUES ('78', '2017-06-22 10:46:28', '2017-06-22 10:46:28', 'uid', 'type/Text', null, '', null, '', '0', '11', null, 'UID', 'normal', null, '784', '2017-06-25 14:18:29', null, null);
INSERT INTO `metabase_field` VALUES ('79', '2017-06-22 10:46:28', '2017-06-22 10:46:28', 'city_id', 'type/Integer', 'type/PK', '', null, '', '0', '12', null, 'City ID', 'normal', null, '674', '2017-06-25 14:18:30', null, null);
INSERT INTO `metabase_field` VALUES ('80', '2017-06-22 10:46:28', '2017-06-22 10:46:28', 'city_name', 'type/Text', null, '', null, '', '0', '12', null, 'City Name', 'normal', null, '675', '2017-06-25 14:18:30', null, null);
INSERT INTO `metabase_field` VALUES ('81', '2017-06-22 10:46:29', '2017-06-22 10:48:11', 'first_letter', 'type/Text', 'type/Category', '', null, '', '0', '12', null, 'First Letter', 'normal', null, '676', '2017-06-25 14:18:30', null, null);
INSERT INTO `metabase_field` VALUES ('82', '2017-06-22 10:46:29', '2017-06-22 10:48:11', 'is_hot', 'type/Integer', 'type/Category', '', null, '', '0', '12', null, 'Is Hot', 'normal', null, '677', '2017-06-25 14:18:30', null, null);
INSERT INTO `metabase_field` VALUES ('83', '2017-06-22 10:46:29', '2017-06-22 10:48:12', 'province_id', 'type/Text', 'type/Category', '', null, '', '0', '12', null, 'Province ID', 'normal', null, '678', '2017-06-25 14:18:30', null, null);
INSERT INTO `metabase_field` VALUES ('84', '2017-06-22 10:46:29', '2017-06-22 10:48:12', 'state', 'type/Integer', 'type/Category', '', null, '', '0', '12', null, 'State', 'normal', null, '679', '2017-06-25 14:18:30', null, null);
INSERT INTO `metabase_field` VALUES ('85', '2017-06-22 10:46:29', '2017-06-22 10:46:29', 'cid', 'type/Integer', 'type/PK', '', null, '', '0', '13', null, 'Cid', 'normal', null, '268', '2017-06-25 14:18:30', null, null);
INSERT INTO `metabase_field` VALUES ('86', '2017-06-22 10:46:29', '2017-06-22 10:46:29', 'createtime', 'type/DateTime', null, '', null, '', '0', '13', null, 'Create Time', 'normal', null, '269', '2017-06-25 14:18:30', null, null);
INSERT INTO `metabase_field` VALUES ('87', '2017-06-22 10:46:30', '2017-06-22 10:46:30', 'msql_text', 'type/Text', null, '', null, '', '0', '13', null, 'Ms Ql Text', 'normal', null, '270', '2017-06-25 14:18:30', null, null);
INSERT INTO `metabase_field` VALUES ('88', '2017-06-22 10:46:30', '2017-06-22 10:48:13', 'otype', 'type/Text', 'type/Category', '', null, '', '0', '13', null, 'O Type', 'normal', null, '271', '2017-06-25 14:18:30', null, null);
INSERT INTO `metabase_field` VALUES ('89', '2017-06-22 10:46:30', '2017-06-22 10:48:13', 'state', 'type/Integer', 'type/Category', '', null, '', '0', '13', null, 'State', 'normal', null, '272', '2017-06-25 14:18:30', null, null);
INSERT INTO `metabase_field` VALUES ('90', '2017-06-22 10:46:30', '2017-06-22 10:48:14', 'from_id', 'type/Integer', 'type/Category', '', null, '', '0', '14', null, 'From ID', 'normal', null, '718', '2017-06-25 14:18:31', null, null);
INSERT INTO `metabase_field` VALUES ('91', '2017-06-22 10:46:30', '2017-06-22 10:46:30', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '14', null, 'ID', 'normal', null, '719', '2017-06-25 14:18:31', null, null);
INSERT INTO `metabase_field` VALUES ('92', '2017-06-22 10:46:30', '2017-06-22 10:48:14', 'pid', 'type/Integer', 'type/Category', '', null, '', '0', '14', null, 'Pid', 'normal', null, '720', '2017-06-25 14:18:31', null, null);
INSERT INTO `metabase_field` VALUES ('93', '2017-06-22 10:46:30', '2017-06-22 10:48:15', 'to_id', 'type/Integer', 'type/Category', '', null, '', '0', '14', null, 'To ID', 'normal', null, '721', '2017-06-25 14:18:31', null, null);
INSERT INTO `metabase_field` VALUES ('94', '2017-06-22 10:46:31', '2017-06-22 10:46:31', 'type', 'type/Integer', 'type/Category', '', null, '', '0', '14', null, 'Type', 'normal', null, '722', '2017-06-25 14:18:31', null, null);
INSERT INTO `metabase_field` VALUES ('95', '2017-06-22 10:46:31', '2017-06-22 10:48:15', 'book', 'type/Text', 'type/Category', '', null, '', '0', '15', null, 'Book', 'normal', null, '537', '2017-06-25 14:18:32', null, null);
INSERT INTO `metabase_field` VALUES ('96', '2017-06-22 10:46:31', '2017-06-22 10:46:31', 'desc', 'type/Text', null, '', null, '', '0', '15', null, 'Desc', 'normal', null, '538', '2017-06-25 14:18:32', null, null);
INSERT INTO `metabase_field` VALUES ('97', '2017-06-22 10:46:31', '2017-06-22 10:46:31', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '15', null, 'ID', 'normal', null, '539', '2017-06-25 14:18:32', null, null);
INSERT INTO `metabase_field` VALUES ('98', '2017-06-22 10:46:31', '2017-06-22 10:48:16', 'leader', 'type/Text', 'type/Category', '', null, '', '0', '15', null, 'Leader', 'normal', null, '540', '2017-06-25 14:18:32', null, null);
INSERT INTO `metabase_field` VALUES ('99', '2017-06-22 10:46:31', '2017-06-22 10:46:31', 'name', 'type/Text', 'type/Name', '', null, '', '0', '15', null, 'Name', 'normal', null, '541', '2017-06-25 14:18:32', null, null);
INSERT INTO `metabase_field` VALUES ('100', '2017-06-22 10:46:31', '2017-06-22 10:46:31', 'role', 'type/Text', 'type/Category', '', null, '', '0', '15', null, 'Role', 'normal', null, '542', '2017-06-25 14:18:32', null, null);
INSERT INTO `metabase_field` VALUES ('101', '2017-06-22 10:46:31', '2017-06-22 10:48:17', 'fbsl', 'type/Text', 'type/Category', '', null, '', '0', '16', null, 'Fb Sl', 'normal', null, '408', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('102', '2017-06-22 10:46:32', '2017-06-22 10:48:17', 'fzr', 'type/Text', 'type/Category', '', null, '', '0', '16', null, 'Fzr', 'normal', null, '409', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('103', '2017-06-22 10:46:32', '2017-06-22 10:46:32', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '16', null, 'ID', 'normal', null, '410', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('104', '2017-06-22 10:46:32', '2017-06-22 10:46:32', 'mtbm', 'type/Text', null, '', null, '', '0', '16', null, 'Mt Bm', 'normal', null, '411', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('105', '2017-06-22 10:46:32', '2017-06-22 10:48:17', 'nextSteptIsStart', 'type/Text', 'type/Category', '', null, '', '0', '16', null, 'Next Ste Pt Is Start', 'normal', null, '412', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('106', '2017-06-22 10:46:32', '2017-06-22 10:48:18', 'nrmd', 'type/Text', 'type/Category', '', null, '', '0', '16', null, 'Nr Md', 'normal', null, '413', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('107', '2017-06-22 10:46:32', '2017-06-22 10:48:18', 'nrsd', 'type/Text', 'type/Category', '', null, '', '0', '16', null, 'Nr Sd', 'normal', null, '414', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('108', '2017-06-22 10:46:32', '2017-06-22 10:48:18', 'proj', 'type/Text', 'type/Category', '', null, '', '0', '16', null, 'Pr Oj', 'normal', null, '415', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('109', '2017-06-22 10:46:32', '2017-06-22 10:48:18', 'qzsl', 'type/Text', 'type/Category', '', null, '', '0', '16', null, 'Q Zsl', 'normal', null, '416', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('110', '2017-06-22 10:46:32', '2017-06-22 10:48:18', 'wanx', 'type/Text', 'type/Category', '', null, '', '0', '16', null, 'Wan X', 'normal', null, '417', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('111', '2017-06-22 10:46:32', '2017-06-22 10:46:32', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '17', null, 'ID', 'normal', null, '335', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('112', '2017-06-22 10:46:32', '2017-06-22 10:48:19', 'watime', 'type/Text', 'type/Category', '', null, '', '0', '17', null, 'Wa Time', 'normal', null, '336', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('113', '2017-06-22 10:46:32', '2017-06-22 10:48:19', 'watype', 'type/Text', 'type/Category', '', null, '', '0', '17', null, 'Wa Type', 'normal', null, '337', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('114', '2017-06-22 10:46:33', '2017-06-22 10:46:33', 'fwl', 'type/Text', null, '', null, '', '0', '18', null, 'Fwl', 'normal', null, '729', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('115', '2017-06-22 10:46:33', '2017-06-22 10:46:33', 'ggf', 'type/Text', null, '', null, '', '0', '18', null, 'Ggf', 'normal', null, '730', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('116', '2017-06-22 10:46:33', '2017-06-22 10:46:33', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '18', null, 'ID', 'normal', null, '731', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('117', '2017-06-22 10:46:33', '2017-06-22 10:46:33', 'planid', 'type/Text', null, '', null, '', '0', '18', null, 'Plan ID', 'normal', null, '732', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('118', '2017-06-22 10:46:33', '2017-06-22 10:46:33', 'rq', 'type/Text', null, '', null, '', '0', '18', null, 'Rq', 'normal', null, '733', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('119', '2017-06-22 10:46:33', '2017-06-22 10:46:33', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '19', null, 'ID', 'normal', null, '555', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('120', '2017-06-22 10:46:33', '2017-06-22 10:46:33', 'mtbm', 'type/Text', null, '', null, '', '0', '19', null, 'Mt Bm', 'normal', null, '556', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('121', '2017-06-22 10:46:33', '2017-06-22 10:46:33', 'mtpt', 'type/Text', null, '', null, '', '0', '19', null, 'Mt Pt', 'normal', null, '557', '2017-06-25 14:18:33', null, null);
INSERT INTO `metabase_field` VALUES ('122', '2017-06-22 10:46:33', '2017-06-22 10:46:33', 'dfj', 'type/Text', null, '', null, '', '0', '20', null, 'Dfj', 'normal', null, '761', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('123', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'fsl', 'type/Text', null, '', null, '', '0', '20', null, 'Fsl', 'normal', null, '762', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('124', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'fwl', 'type/Text', null, '', null, '', '0', '20', null, 'Fwl', 'normal', null, '763', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('125', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'fzr', 'type/Text', null, '', null, '', '0', '20', null, 'Fzr', 'normal', null, '764', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('126', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'ggf', 'type/Text', null, '', null, '', '0', '20', null, 'Ggf', 'normal', null, '765', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('127', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '20', null, 'ID', 'normal', null, '766', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('128', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'jfl', 'type/Text', null, '', null, '', '0', '20', null, 'Jfl', 'normal', null, '767', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('129', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'kfzh', 'type/Text', null, '', null, '', '0', '20', null, 'Kf Zh', 'normal', null, '768', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('130', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'mtbm', 'type/Text', null, '', null, '', '0', '20', null, 'Mt Bm', 'normal', null, '769', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('131', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'mtpt', 'type/Text', null, '', null, '', '0', '20', null, 'Mt Pt', 'normal', null, '770', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('132', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'mtzh', 'type/Text', null, '', null, '', '0', '20', null, 'Mt Zh', 'normal', null, '771', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('133', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'tcbl', 'type/Text', null, '', null, '', '0', '20', null, 'Tc Bl', 'normal', null, '772', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('134', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'waid', 'type/Integer', null, '', null, '', '0', '20', null, 'Wa ID', 'normal', null, '773', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('135', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'dfl', 'type/Text', null, '', null, '', '0', '21', null, 'Dfl', 'normal', null, '256', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('136', '2017-06-22 10:46:34', '2017-06-22 10:46:34', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '21', null, 'ID', 'normal', null, '257', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('137', '2017-06-22 10:46:35', '2017-06-22 10:46:35', 'pll', 'type/Text', null, '', null, '', '0', '21', null, 'Pll', 'normal', null, '258', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('138', '2017-06-22 10:46:35', '2017-06-22 10:46:35', 'rq', 'type/Text', null, '', null, '', '0', '21', null, 'Rq', 'normal', null, '259', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('139', '2017-06-22 10:46:35', '2017-06-22 10:46:35', 'uid', 'type/Text', null, '', null, '', '0', '21', null, 'UID', 'normal', null, '260', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('140', '2017-06-22 10:46:35', '2017-06-22 10:46:35', 'xzfsl', 'type/Text', null, '', null, '', '0', '21', null, 'Xzfsl', 'normal', null, '261', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('141', '2017-06-22 10:46:35', '2017-06-22 10:46:35', 'zxl', 'type/Text', null, '', null, '', '0', '21', null, 'Z Xl', 'normal', null, '262', '2017-06-25 14:18:34', null, null);
INSERT INTO `metabase_field` VALUES ('142', '2017-06-22 10:46:35', '2017-06-22 10:46:35', 'dfl', 'type/Text', null, '', null, '', '0', '22', null, 'Dfl', 'normal', null, '146', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('143', '2017-06-22 10:46:35', '2017-06-22 10:46:35', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '22', null, 'ID', 'normal', null, '147', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('144', '2017-06-22 10:46:35', '2017-06-22 10:46:35', 'mtbm', 'type/Text', null, '', null, '', '0', '22', null, 'Mt Bm', 'normal', null, '148', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('145', '2017-06-22 10:46:35', '2017-06-22 10:46:35', 'time', 'type/Text', null, '', null, '', '0', '22', null, 'Time', 'normal', null, '149', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('146', '2017-06-22 10:46:35', '2017-06-22 10:46:35', 'user_id', 'type/Text', null, '', null, '', '0', '22', null, 'User ID', 'normal', null, '150', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('147', '2017-06-22 10:46:35', '2017-06-22 10:46:35', 'waid', 'type/Text', null, '', null, '', '0', '22', null, 'Wa ID', 'normal', null, '151', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('148', '2017-06-22 10:46:36', '2017-06-22 10:46:36', 'xzfs', 'type/Text', null, '', null, '', '0', '22', null, 'X Zfs', 'normal', null, '152', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('149', '2017-06-22 10:46:36', '2017-06-22 10:46:36', 'zh', 'type/Text', null, '', null, '', '0', '22', null, 'Zh', 'normal', null, '153', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('150', '2017-06-22 10:46:36', '2017-06-22 10:46:36', 'cjdj', 'type/Text', null, '', null, '', '0', '23', null, 'Cj Dj', 'normal', null, '925', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('151', '2017-06-22 10:46:36', '2017-06-22 10:46:36', 'cjds', 'type/Text', null, '', null, '', '0', '23', null, 'Cj Ds', 'normal', null, '926', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('152', '2017-06-22 10:46:36', '2017-06-22 10:46:36', 'cpm', 'type/Text', null, '', null, '', '0', '23', null, 'Cpm', 'normal', null, '927', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('153', '2017-06-22 10:46:36', '2017-06-22 10:46:36', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '23', null, 'ID', 'normal', null, '928', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('154', '2017-06-22 10:46:36', '2017-06-22 10:46:36', 'time', 'type/Text', null, '', null, '', '0', '23', null, 'Time', 'normal', null, '929', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('155', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'uid', 'type/Text', null, '', null, '', '0', '23', null, 'UID', 'normal', null, '930', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('156', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '24', null, 'ID', 'normal', null, '289', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('157', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'nrs', 'type/Text', null, '', null, '', '0', '24', null, 'Nrs', 'normal', null, '290', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('158', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'pll', 'type/Text', null, '', null, '', '0', '24', null, 'Pll', 'normal', null, '291', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('159', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'time', 'type/Text', null, '', null, '', '0', '24', null, 'Time', 'normal', null, '292', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('160', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'user_id', 'type/Text', null, '', null, '', '0', '24', null, 'User ID', 'normal', null, '293', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('161', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'waid', 'type/Text', null, '', null, '', '0', '24', null, 'Wa ID', 'normal', null, '294', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('162', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'zxl', 'type/Text', null, '', null, '', '0', '24', null, 'Z Xl', 'normal', null, '295', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('163', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'cdl', 'type/Text', null, '', null, '', '0', '25', null, 'Cdl', 'normal', null, '587', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('164', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'cjdj', 'type/Text', null, '', null, '', '0', '25', null, 'Cj Dj', 'normal', null, '588', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('165', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '25', null, 'ID', 'normal', null, '589', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('166', '2017-06-22 10:46:37', '2017-06-22 10:46:37', 'mtbm', 'type/Text', null, '', null, '', '0', '25', null, 'Mt Bm', 'normal', null, '590', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('167', '2017-06-22 10:46:38', '2017-06-22 10:46:38', 'time', 'type/Text', null, '', null, '', '0', '25', null, 'Time', 'normal', null, '591', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('168', '2017-06-22 10:46:38', '2017-06-22 10:46:38', 'user_id', 'type/Text', null, '', null, '', '0', '25', null, 'User ID', 'normal', null, '592', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('169', '2017-06-22 10:46:38', '2017-06-22 10:46:38', 'waid', 'type/Text', null, '', null, '', '0', '25', null, 'Wa ID', 'normal', null, '593', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('170', '2017-06-22 10:46:38', '2017-06-22 10:46:38', 'zh', 'type/Text', null, '', null, '', '0', '25', null, 'Zh', 'normal', null, '594', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('171', '2017-06-22 10:46:38', '2017-06-22 10:46:38', 'zhzq', 'type/Text', null, '', null, '', '0', '25', null, 'Z Hz Q', 'normal', null, '595', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('172', '2017-06-22 10:46:38', '2017-06-22 10:46:38', 'cp', 'type/Text', null, '', null, '', '0', '26', null, 'Cp', 'normal', null, '40', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('173', '2017-06-22 10:46:38', '2017-06-22 10:46:38', 'fsl', 'type/Text', null, '', null, '', '0', '26', null, 'Fsl', 'normal', null, '41', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('174', '2017-06-22 10:46:38', '2017-06-22 10:46:38', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '26', null, 'ID', 'normal', null, '42', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('175', '2017-06-22 10:46:38', '2017-06-22 10:46:38', 'user_id', 'type/Text', null, '', null, '', '0', '26', null, 'User ID', 'normal', null, '43', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('176', '2017-06-22 10:46:38', '2017-06-22 10:46:38', 'zh', 'type/Text', 'type/PK', '', null, '', '0', '26', null, 'Zh', 'normal', null, '44', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('177', '2017-06-22 10:46:38', '2017-06-22 10:46:38', 'fktws', 'type/Text', null, '', null, '', '0', '27', null, 'Fktws', 'normal', null, '833', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('178', '2017-06-22 10:46:39', '2017-06-22 10:46:39', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '27', null, 'ID', 'normal', null, '834', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('179', '2017-06-22 10:46:39', '2017-06-22 10:46:39', 'jygxs', 'type/Text', null, '', null, '', '0', '27', null, 'Jygxs', 'normal', null, '835', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('180', '2017-06-22 10:46:39', '2017-06-22 10:46:39', 'uid', 'type/Text', null, '', null, '', '0', '27', null, 'UID', 'normal', null, '836', '2017-06-25 14:18:35', null, null);
INSERT INTO `metabase_field` VALUES ('181', '2017-06-22 10:46:39', '2017-06-22 10:48:25', 'dp', 'type/Text', 'type/Category', '', null, '', '0', '28', null, 'Dp', 'normal', null, '428', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('182', '2017-06-22 10:46:39', '2017-06-22 10:48:25', 'file_size', 'type/Text', 'type/Category', '', null, '', '0', '28', null, 'File Size', 'normal', null, '429', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('183', '2017-06-22 10:46:39', '2017-06-22 10:48:25', 'filename', 'type/Text', 'type/Category', '', null, '', '0', '28', null, 'Filename', 'normal', null, '430', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('184', '2017-06-22 10:46:39', '2017-06-22 10:46:39', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '28', null, 'ID', 'normal', null, '431', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('185', '2017-06-22 10:46:39', '2017-06-22 10:48:26', 'istrash', 'type/Integer', 'type/Category', '', null, '', '0', '28', null, 'Is Trash', 'normal', null, '432', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('186', '2017-06-22 10:46:39', '2017-06-22 10:46:39', 'savetodoc', 'type/*', null, '', null, '', '0', '28', null, 'Save To Doc', 'normal', null, '433', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('187', '2017-06-22 10:46:40', '2017-06-22 10:46:40', 'taskid', 'type/Text', 'type/PK', '', null, '', '0', '28', null, 'Task ID', 'normal', null, '434', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('188', '2017-06-22 10:46:40', '2017-06-22 10:48:26', 'time', 'type/Text', 'type/Category', '', null, '', '0', '28', null, 'Time', 'normal', null, '435', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('189', '2017-06-22 10:46:40', '2017-06-22 10:46:40', 'url', 'type/Text', 'type/URL', '', null, '', '0', '28', null, 'URL', 'normal', null, '436', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('190', '2017-06-22 10:46:40', '2017-06-22 10:48:27', 'user_id', 'type/Text', 'type/Category', '', null, '', '0', '28', null, 'User ID', 'normal', null, '437', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('191', '2017-06-22 10:46:40', '2017-06-22 10:46:40', 'dataSource', 'type/Text', null, '', null, '', '0', '29', null, 'Data Source', 'normal', null, '626', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('192', '2017-06-22 10:46:40', '2017-06-22 10:46:40', 'datatyp', 'type/Text', null, '', null, '', '0', '29', null, 'Datatyp', 'normal', null, '627', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('193', '2017-06-22 10:46:40', '2017-06-22 10:46:40', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '29', null, 'ID', 'normal', null, '628', '2017-06-25 14:18:36', null, null);
INSERT INTO `metabase_field` VALUES ('194', '2017-06-22 10:46:41', '2017-06-22 10:46:41', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '30', null, 'ID', 'normal', null, '188', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('195', '2017-06-22 10:46:41', '2017-06-22 10:48:28', 'linkToField', 'type/Text', 'type/Category', '', null, '', '0', '30', null, 'Link To Field', 'normal', null, '189', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('196', '2017-06-22 10:46:41', '2017-06-22 10:48:28', 'linkToFieldData', 'type/Text', 'type/Category', '', null, '', '0', '30', null, 'Link To Field Data', 'normal', null, '190', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('197', '2017-06-22 10:46:41', '2017-06-22 10:48:29', 'linkToFieldId', 'type/Text', 'type/Category', '', null, '', '0', '30', null, 'Link To Field ID', 'normal', null, '191', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('198', '2017-06-22 10:46:41', '2017-06-22 10:48:29', 'linkToTable', 'type/Text', 'type/Category', '', null, '', '0', '30', null, 'Link To Table', 'normal', null, '192', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('199', '2017-06-22 10:46:41', '2017-06-22 10:48:29', 'nowData', 'type/Text', 'type/Category', '', null, '', '0', '30', null, 'Now Data', 'normal', null, '193', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('200', '2017-06-22 10:46:41', '2017-06-22 10:48:29', 'nowField', 'type/Text', 'type/Category', '', null, '', '0', '30', null, 'Now Field', 'normal', null, '194', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('201', '2017-06-22 10:46:41', '2017-06-22 10:48:30', 'nowTable', 'type/Text', 'type/Category', '', null, '', '0', '30', null, 'Now Table', 'normal', null, '195', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('202', '2017-06-22 10:46:41', '2017-06-22 10:46:41', 'distance', 'type/Text', null, '', null, '', '0', '31', null, 'Distance', 'normal', null, '329', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('203', '2017-06-22 10:46:41', '2017-06-22 10:46:41', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '31', null, 'ID', 'normal', null, '330', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('204', '2017-06-22 10:46:41', '2017-06-22 10:46:41', 'location', 'type/Text', null, '', null, '', '0', '31', null, 'Location', 'normal', null, '331', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('205', '2017-06-22 10:46:41', '2017-06-22 10:46:41', 'time', 'type/Text', null, '', null, '', '0', '31', null, 'Time', 'normal', null, '332', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('206', '2017-06-22 10:46:42', '2017-06-22 10:46:42', 'type', 'type/Text', 'type/Category', '', null, '', '0', '31', null, 'Type', 'normal', null, '333', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('207', '2017-06-22 10:46:42', '2017-06-22 10:46:42', 'uid', 'type/Text', null, '', null, '', '0', '31', null, 'UID', 'normal', null, '334', '2017-06-25 14:18:37', null, null);
INSERT INTO `metabase_field` VALUES ('208', '2017-06-22 10:46:42', '2017-06-22 10:46:42', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '32', null, 'ID', 'normal', null, '654', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('209', '2017-06-22 10:46:42', '2017-06-22 10:48:31', 'isdel', 'type/Integer', 'type/Category', '', null, '', '0', '32', null, 'Is Del', 'normal', null, '655', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('210', '2017-06-22 10:46:42', '2017-06-22 10:48:31', 'ispause', 'type/Integer', 'type/Category', '', null, '', '0', '32', null, 'Is Pause', 'normal', null, '656', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('211', '2017-06-22 10:46:42', '2017-06-22 10:48:31', 'mtbm', 'type/Text', 'type/Category', '', null, '', '0', '32', null, 'Mt Bm', 'normal', null, '657', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('212', '2017-06-22 10:46:42', '2017-06-22 10:46:42', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '33', null, 'ID', 'normal', null, '263', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('213', '2017-06-22 10:46:42', '2017-06-22 10:48:32', 'isdel', 'type/Integer', 'type/Category', '', null, '', '0', '33', null, 'Is Del', 'normal', null, '264', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('214', '2017-06-22 10:46:42', '2017-06-22 10:48:32', 'ispause', 'type/Integer', 'type/Category', '', null, '', '0', '33', null, 'Is Pause', 'normal', null, '265', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('215', '2017-06-22 10:46:42', '2017-06-22 10:48:32', 'mtbmid', 'type/Text', 'type/Category', '', null, '', '0', '33', null, 'Mt Bm ID', 'normal', null, '266', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('216', '2017-06-22 10:46:42', '2017-06-22 10:48:32', 'mtzh', 'type/Text', 'type/Category', '', null, '', '0', '33', null, 'Mt Zh', 'normal', null, '267', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('217', '2017-06-22 10:46:43', '2017-06-22 10:46:43', 'permission', 'type/Text', null, '', null, '', '0', '34', null, 'Permission', 'normal', null, '829', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('218', '2017-06-22 10:46:43', '2017-06-22 10:46:43', 'secret', 'type/Text', null, '', null, '', '0', '34', null, 'Secret', 'normal', null, '830', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('219', '2017-06-22 10:46:43', '2017-06-22 10:46:43', 'subdomain', 'type/Text', 'type/PK', '', null, '', '0', '34', null, 'Subdomain', 'normal', null, '831', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('220', '2017-06-22 10:46:43', '2017-06-22 10:46:43', 'wildcard', 'type/Integer', null, '', null, '', '0', '34', null, 'Wildcard', 'normal', null, '832', '2017-06-25 14:18:38', null, null);
INSERT INTO `metabase_field` VALUES ('221', '2017-06-22 10:46:43', '2017-06-22 10:48:33', 'con', 'type/Text', 'type/Category', '', null, '', '0', '35', null, 'Con', 'normal', null, '278', '2017-06-25 14:18:39', null, null);
INSERT INTO `metabase_field` VALUES ('222', '2017-06-22 10:46:43', '2017-06-22 10:48:33', 'end', 'type/Text', 'type/Category', '', null, '', '0', '35', null, 'End', 'normal', null, '279', '2017-06-25 14:18:39', null, null);
INSERT INTO `metabase_field` VALUES ('223', '2017-06-22 10:46:43', '2017-06-22 10:46:43', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '35', null, 'ID', 'normal', null, '280', '2017-06-25 14:18:39', null, null);
INSERT INTO `metabase_field` VALUES ('224', '2017-06-22 10:46:43', '2017-06-22 10:48:33', 'start', 'type/Text', 'type/Category', '', null, '', '0', '35', null, 'Start', 'normal', null, '281', '2017-06-25 14:18:39', null, null);
INSERT INTO `metabase_field` VALUES ('225', '2017-06-22 10:46:43', '2017-06-22 10:46:43', 'status', 'type/Text', 'type/Category', '', null, '', '0', '35', null, 'Status', 'normal', null, '282', '2017-06-25 14:18:39', null, null);
INSERT INTO `metabase_field` VALUES ('226', '2017-06-22 10:46:43', '2017-06-22 10:46:43', 'type', 'type/Text', 'type/Category', '', null, '', '0', '35', null, 'Type', 'normal', null, '283', '2017-06-25 14:18:39', null, null);
INSERT INTO `metabase_field` VALUES ('227', '2017-06-22 10:46:43', '2017-06-22 10:48:34', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '35', null, 'UID', 'normal', null, '284', '2017-06-25 14:18:39', null, null);
INSERT INTO `metabase_field` VALUES ('228', '2017-06-22 10:46:43', '2017-06-22 10:46:43', 'description', 'type/Text', null, '', null, '', '0', '36', null, 'Description', 'normal', null, '112', '2017-06-25 14:18:39', null, null);
INSERT INTO `metabase_field` VALUES ('229', '2017-06-22 10:46:44', '2017-06-22 10:46:44', 'groupName', 'type/Text', 'type/PK', '', null, '', '0', '36', null, 'Group Name', 'normal', null, '113', '2017-06-25 14:18:39', null, null);
INSERT INTO `metabase_field` VALUES ('230', '2017-06-22 10:46:44', '2017-06-22 10:46:44', 'groupName', 'type/Text', 'type/PK', '', null, '', '0', '37', null, 'Group Name', 'normal', null, '816', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('231', '2017-06-22 10:46:44', '2017-06-22 10:46:44', 'name', 'type/Text', 'type/PK', '', null, '', '0', '37', null, 'Name', 'normal', null, '817', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('232', '2017-06-22 10:46:44', '2017-06-22 10:46:44', 'propValue', 'type/Text', null, '', null, '', '0', '37', null, 'Prop Value', 'normal', null, '818', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('233', '2017-06-22 10:46:44', '2017-06-22 10:46:44', 'administrator', 'type/Integer', 'type/PK', '', null, '', '0', '38', null, 'Administrator', 'normal', null, '37', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('234', '2017-06-22 10:46:44', '2017-06-22 10:46:44', 'groupName', 'type/Text', 'type/PK', '', null, '', '0', '38', null, 'Group Name', 'normal', null, '38', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('235', '2017-06-22 10:46:44', '2017-06-22 10:46:44', 'username', 'type/Text', 'type/PK', '', null, '', '0', '38', null, 'Username', 'normal', null, '39', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('236', '2017-06-22 10:46:44', '2017-06-22 10:46:44', 'id', 'type/BigInteger', 'type/PK', '', null, '', '0', '39', null, 'ID', 'normal', null, '476', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('237', '2017-06-22 10:46:45', '2017-06-22 10:46:45', 'idType', 'type/Integer', 'type/PK', '', null, '', '0', '39', null, 'ID Type', 'normal', null, '477', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('238', '2017-06-22 10:46:45', '2017-06-22 10:46:45', 'affiliation', 'type/Integer', null, '', null, '', '0', '40', null, 'Affiliation', 'normal', null, '931', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('239', '2017-06-22 10:46:45', '2017-06-22 10:46:45', 'jid', 'type/Text', 'type/PK', '', null, '', '0', '40', null, 'Jid', 'normal', null, '932', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('240', '2017-06-22 10:46:45', '2017-06-22 10:46:45', 'roomID', 'type/BigInteger', 'type/PK', '', null, '', '0', '40', null, 'Room ID', 'normal', null, '933', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('241', '2017-06-22 10:46:45', '2017-06-22 10:46:45', 'body', 'type/Text', null, '', null, '', '0', '41', null, 'Body', 'normal', null, '710', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('242', '2017-06-22 10:46:45', '2017-06-22 10:46:45', 'logTime', 'type/Text', null, '', null, '', '0', '41', null, 'Log Time', 'normal', null, '711', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('243', '2017-06-22 10:46:45', '2017-06-22 10:46:45', 'messageID', 'type/BigInteger', null, '', null, '', '0', '41', null, 'Message ID', 'normal', null, '712', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('244', '2017-06-22 10:46:45', '2017-06-22 10:46:45', 'nickname', 'type/Text', null, '', null, '', '0', '41', null, 'Nickname', 'normal', null, '713', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('245', '2017-06-22 10:46:45', '2017-06-22 10:46:45', 'roomID', 'type/BigInteger', null, '', null, '', '0', '41', null, 'Room ID', 'normal', null, '714', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('246', '2017-06-22 10:46:45', '2017-06-22 10:46:45', 'sender', 'type/Text', null, '', null, '', '0', '41', null, 'Sender', 'normal', null, '715', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('247', '2017-06-22 10:46:45', '2017-06-22 10:46:45', 'stanza', 'type/Text', null, '', null, '', '0', '41', null, 'Stanza', 'normal', null, '716', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('248', '2017-06-22 10:46:46', '2017-06-22 10:46:46', 'subject', 'type/Text', null, '', null, '', '0', '41', null, 'Subject', 'normal', null, '717', '2017-06-25 14:18:40', null, null);
INSERT INTO `metabase_field` VALUES ('249', '2017-06-22 10:46:46', '2017-06-22 10:46:46', 'email', 'type/Text', null, '', null, '', '0', '42', null, 'Email', 'normal', null, '468', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('250', '2017-06-22 10:46:46', '2017-06-22 10:46:46', 'faqentry', 'type/Text', null, '', null, '', '0', '42', null, 'Faq Entry', 'normal', null, '469', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('251', '2017-06-22 10:46:46', '2017-06-22 10:46:46', 'firstName', 'type/Text', null, '', null, '', '0', '42', null, 'First Name', 'normal', null, '470', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('252', '2017-06-22 10:46:46', '2017-06-22 10:46:46', 'jid', 'type/Text', 'type/PK', '', null, '', '0', '42', null, 'Jid', 'normal', null, '471', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('253', '2017-06-22 10:46:46', '2017-06-22 10:46:46', 'lastName', 'type/Text', null, '', null, '', '0', '42', null, 'Last Name', 'normal', null, '472', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('254', '2017-06-22 10:46:46', '2017-06-22 10:46:46', 'nickname', 'type/Text', null, '', null, '', '0', '42', null, 'Nickname', 'normal', null, '473', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('255', '2017-06-22 10:46:46', '2017-06-22 10:46:46', 'roomID', 'type/BigInteger', 'type/PK', '', null, '', '0', '42', null, 'Room ID', 'normal', null, '474', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('256', '2017-06-22 10:46:46', '2017-06-22 10:46:46', 'url', 'type/Text', 'type/URL', '', null, '', '0', '42', null, 'URL', 'normal', null, '475', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('257', '2017-06-22 10:46:47', '2017-06-22 10:46:47', 'allowpm', 'type/Integer', null, '', null, '', '0', '43', null, 'Allow Pm', 'normal', null, '859', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('258', '2017-06-22 10:46:47', '2017-06-22 10:46:47', 'canChangeNick', 'type/Integer', null, '', null, '', '0', '43', null, 'Can Change Nick', 'normal', null, '860', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('259', '2017-06-22 10:46:47', '2017-06-22 10:46:47', 'canChangeSubject', 'type/Integer', null, '', null, '', '0', '43', null, 'Can Change Subject', 'normal', null, '861', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('260', '2017-06-22 10:46:47', '2017-06-22 10:46:47', 'canDiscoverJID', 'type/Integer', null, '', null, '', '0', '43', null, 'Can Discover Jid', 'normal', null, '862', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('261', '2017-06-22 10:46:47', '2017-06-22 10:46:47', 'canInvite', 'type/Integer', null, '', null, '', '0', '43', null, 'Can Invite', 'normal', null, '863', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('262', '2017-06-22 10:46:47', '2017-06-22 10:46:47', 'canRegister', 'type/Integer', null, '', null, '', '0', '43', null, 'Can Register', 'normal', null, '864', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('263', '2017-06-22 10:46:47', '2017-06-22 10:46:47', 'creationDate', 'type/Text', null, '', null, '', '0', '43', null, 'Creation Date', 'normal', null, '865', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('264', '2017-06-22 10:46:47', '2017-06-22 10:46:47', 'description', 'type/Text', null, '', null, '', '0', '43', null, 'Description', 'normal', null, '866', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('265', '2017-06-22 10:46:47', '2017-06-22 10:46:47', 'emptyDate', 'type/Text', null, '', null, '', '0', '43', null, 'Empty Date', 'normal', null, '867', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('266', '2017-06-22 10:46:47', '2017-06-22 10:46:47', 'lockedDate', 'type/Text', null, '', null, '', '0', '43', null, 'Locked Date', 'normal', null, '868', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('267', '2017-06-22 10:46:47', '2017-06-22 10:46:47', 'logEnabled', 'type/Integer', null, '', null, '', '0', '43', null, 'Log Enabled', 'normal', null, '869', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('268', '2017-06-22 10:46:48', '2017-06-22 10:46:48', 'maxUsers', 'type/Integer', null, '', null, '', '0', '43', null, 'Max Users', 'normal', null, '870', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('269', '2017-06-22 10:46:48', '2017-06-22 10:46:48', 'membersOnly', 'type/Integer', null, '', null, '', '0', '43', null, 'Members Only', 'normal', null, '871', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('270', '2017-06-22 10:46:48', '2017-06-22 10:46:48', 'moderated', 'type/Integer', null, '', null, '', '0', '43', null, 'Moderated', 'normal', null, '872', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('271', '2017-06-22 10:46:48', '2017-06-22 10:46:48', 'modificationDate', 'type/Text', null, '', null, '', '0', '43', null, 'Modification Date', 'normal', null, '873', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('272', '2017-06-22 10:46:48', '2017-06-22 10:46:48', 'name', 'type/Text', 'type/PK', '', null, '', '0', '43', null, 'Name', 'normal', null, '874', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('273', '2017-06-22 10:46:48', '2017-06-22 10:46:48', 'naturalName', 'type/Text', null, '', null, '', '0', '43', null, 'Natural Name', 'normal', null, '875', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('274', '2017-06-22 10:46:48', '2017-06-22 10:46:48', 'publicRoom', 'type/Integer', null, '', null, '', '0', '43', null, 'Public Room', 'normal', null, '876', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('275', '2017-06-22 10:46:48', '2017-06-22 10:46:48', 'rolesToBroadcast', 'type/Integer', null, '', null, '', '0', '43', null, 'Roles To Broadcast', 'normal', null, '877', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('276', '2017-06-22 10:46:48', '2017-06-22 10:46:48', 'roomID', 'type/BigInteger', null, '', null, '', '0', '43', null, 'Room ID', 'normal', null, '878', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('277', '2017-06-22 10:46:48', '2017-06-22 10:46:48', 'roomPassword', 'type/Text', null, '', null, '', '0', '43', null, 'Room Password', 'normal', null, '879', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('278', '2017-06-22 10:46:49', '2017-06-22 10:46:49', 'serviceID', 'type/BigInteger', 'type/PK', '', null, '', '0', '43', null, 'Service ID', 'normal', null, '880', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('279', '2017-06-22 10:46:49', '2017-06-22 10:46:49', 'subject', 'type/Text', null, '', null, '', '0', '43', null, 'Subject', 'normal', null, '881', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('280', '2017-06-22 10:46:49', '2017-06-22 10:46:49', 'useReservedNick', 'type/Integer', null, '', null, '', '0', '43', null, 'Use Reserved Nick', 'normal', null, '882', '2017-06-25 14:18:41', null, null);
INSERT INTO `metabase_field` VALUES ('281', '2017-06-22 10:46:49', '2017-06-22 10:46:49', 'name', 'type/Text', 'type/PK', '', null, '', '0', '44', null, 'Name', 'normal', null, '883', '2017-06-25 14:18:42', null, null);
INSERT INTO `metabase_field` VALUES ('282', '2017-06-22 10:46:49', '2017-06-22 10:46:49', 'propValue', 'type/Text', null, '', null, '', '0', '44', null, 'Prop Value', 'normal', null, '884', '2017-06-25 14:18:42', null, null);
INSERT INTO `metabase_field` VALUES ('283', '2017-06-22 10:46:49', '2017-06-22 10:46:49', 'roomID', 'type/BigInteger', 'type/PK', '', null, '', '0', '44', null, 'Room ID', 'normal', null, '885', '2017-06-25 14:18:42', null, null);
INSERT INTO `metabase_field` VALUES ('284', '2017-06-22 10:46:49', '2017-06-22 10:46:49', 'description', 'type/Text', null, '', null, '', '0', '45', null, 'Description', 'normal', null, '84', '2017-06-25 14:18:42', null, null);
INSERT INTO `metabase_field` VALUES ('285', '2017-06-22 10:46:49', '2017-06-22 10:48:39', 'isHidden', 'type/Integer', 'type/Category', '', null, '', '0', '45', null, 'Is Hidden', 'normal', null, '85', '2017-06-25 14:18:42', null, null);
INSERT INTO `metabase_field` VALUES ('286', '2017-06-22 10:46:49', '2017-06-22 10:48:39', 'serviceID', 'type/BigInteger', 'type/Category', '', null, '', '0', '45', null, 'Service ID', 'normal', null, '86', '2017-06-25 14:18:42', null, null);
INSERT INTO `metabase_field` VALUES ('287', '2017-06-22 10:46:49', '2017-06-22 10:46:49', 'subdomain', 'type/Text', 'type/PK', '', null, '', '0', '45', null, 'Subdomain', 'normal', null, '87', '2017-06-25 14:18:42', null, null);
INSERT INTO `metabase_field` VALUES ('288', '2017-06-22 10:46:49', '2017-06-22 10:46:49', 'name', 'type/Text', 'type/PK', '', null, '', '0', '46', null, 'Name', 'normal', null, '216', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('289', '2017-06-22 10:46:49', '2017-06-22 10:46:49', 'propValue', 'type/Text', null, '', null, '', '0', '46', null, 'Prop Value', 'normal', null, '217', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('290', '2017-06-22 10:46:50', '2017-06-22 10:46:50', 'serviceID', 'type/BigInteger', 'type/PK', '', null, '', '0', '46', null, 'Service ID', 'normal', null, '218', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('291', '2017-06-22 10:46:50', '2017-06-22 10:46:50', 'creationDate', 'type/Text', null, '', null, '', '0', '47', null, 'Creation Date', 'normal', null, '393', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('292', '2017-06-22 10:46:50', '2017-06-22 10:46:50', 'messageID', 'type/BigInteger', 'type/PK', '', null, '', '0', '47', null, 'Message ID', 'normal', null, '394', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('293', '2017-06-22 10:46:50', '2017-06-22 10:46:50', 'messageSize', 'type/Integer', null, '', null, '', '0', '47', null, 'Message Size', 'normal', null, '395', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('294', '2017-06-22 10:46:50', '2017-06-22 10:46:50', 'stanza', 'type/Text', null, '', null, '', '0', '47', null, 'Stanza', 'normal', null, '396', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('295', '2017-06-22 10:46:50', '2017-06-22 10:46:50', 'username', 'type/Text', 'type/PK', '', null, '', '0', '47', null, 'Username', 'normal', null, '397', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('296', '2017-06-22 10:46:50', '2017-06-22 10:46:50', 'offlineDate', 'type/Text', null, '', null, '', '0', '48', null, 'Offline Date', 'normal', null, '688', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('297', '2017-06-22 10:46:50', '2017-06-22 10:46:50', 'offlinePresence', 'type/Text', null, '', null, '', '0', '48', null, 'Offline Presence', 'normal', null, '689', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('298', '2017-06-22 10:46:50', '2017-06-22 10:46:50', 'username', 'type/Text', 'type/PK', '', null, '', '0', '48', null, 'Username', 'normal', null, '690', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('299', '2017-06-22 10:46:51', '2017-06-22 10:46:51', 'isDefault', 'type/Integer', null, '', null, '', '0', '49', null, 'Is Default', 'normal', null, '684', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('300', '2017-06-22 10:46:51', '2017-06-22 10:46:51', 'list', 'type/Text', null, '', null, '', '0', '49', null, 'List', 'normal', null, '685', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('301', '2017-06-22 10:46:51', '2017-06-22 10:46:51', 'name', 'type/Text', 'type/PK', '', null, '', '0', '49', null, 'Name', 'normal', null, '686', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('302', '2017-06-22 10:46:51', '2017-06-22 10:46:51', 'username', 'type/Text', 'type/PK', '', null, '', '0', '49', null, 'Username', 'normal', null, '687', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('303', '2017-06-22 10:46:51', '2017-06-22 10:46:51', 'name', 'type/Text', 'type/PK', '', null, '', '0', '50', null, 'Name', 'normal', null, '104', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('304', '2017-06-22 10:46:51', '2017-06-22 10:46:51', 'namespace', 'type/Text', 'type/PK', '', null, '', '0', '50', null, 'Namespace', 'normal', null, '105', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('305', '2017-06-22 10:46:51', '2017-06-22 10:46:51', 'privateData', 'type/Text', null, '', null, '', '0', '50', null, 'Private Data', 'normal', null, '106', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('306', '2017-06-22 10:46:51', '2017-06-22 10:46:51', 'username', 'type/Text', 'type/PK', '', null, '', '0', '50', null, 'Username', 'normal', null, '107', '2017-06-25 14:18:43', null, null);
INSERT INTO `metabase_field` VALUES ('307', '2017-06-22 10:46:52', '2017-06-22 10:46:52', 'name', 'type/Text', 'type/PK', '', null, '', '0', '51', null, 'Name', 'normal', null, '210', '2017-06-25 14:18:44', null, null);
INSERT INTO `metabase_field` VALUES ('308', '2017-06-22 10:46:52', '2017-06-22 10:48:43', 'propValue', 'type/Text', 'type/Category', '', null, '', '0', '51', null, 'Prop Value', 'normal', null, '211', '2017-06-25 14:18:44', null, null);
INSERT INTO `metabase_field` VALUES ('309', '2017-06-22 10:46:52', '2017-06-22 10:48:43', 'affiliation', 'type/Text', 'type/Category', '', null, '', '0', '52', null, 'Affiliation', 'normal', null, '80', '2017-06-25 14:18:45', null, null);
INSERT INTO `metabase_field` VALUES ('310', '2017-06-22 10:46:52', '2017-06-22 10:46:52', 'jid', 'type/Text', 'type/PK', '', null, '', '0', '52', null, 'Jid', 'normal', null, '81', '2017-06-25 14:18:45', null, null);
INSERT INTO `metabase_field` VALUES ('311', '2017-06-22 10:46:52', '2017-06-22 10:46:52', 'nodeID', 'type/Text', 'type/PK', '', null, '', '0', '52', null, 'Node ID', 'normal', null, '82', '2017-06-25 14:18:45', null, null);
INSERT INTO `metabase_field` VALUES ('312', '2017-06-22 10:46:52', '2017-06-22 10:46:52', 'serviceID', 'type/Text', 'type/PK', '', null, '', '0', '52', null, 'Service ID', 'normal', null, '83', '2017-06-25 14:18:45', null, null);
INSERT INTO `metabase_field` VALUES ('313', '2017-06-22 10:46:52', '2017-06-22 10:48:44', 'accessModel', 'type/Text', 'type/Category', '', null, '', '0', '53', null, 'Access Model', 'normal', null, '484', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('314', '2017-06-22 10:46:52', '2017-06-22 10:48:44', 'associationPolicy', 'type/Text', 'type/Category', '', null, '', '0', '53', null, 'Association Policy', 'normal', null, '485', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('315', '2017-06-22 10:46:52', '2017-06-22 10:48:45', 'deliverPayloads', 'type/Integer', 'type/Category', '', null, '', '0', '53', null, 'Deliver Payloads', 'normal', null, '486', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('316', '2017-06-22 10:46:52', '2017-06-22 10:48:45', 'language', 'type/Text', 'type/Category', '', null, '', '0', '53', null, 'Language', 'normal', null, '487', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('317', '2017-06-22 10:46:52', '2017-06-22 10:46:52', 'leaf', 'type/Integer', 'type/PK', '', null, '', '0', '53', null, 'Leaf', 'normal', null, '488', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('318', '2017-06-22 10:46:52', '2017-06-22 10:48:45', 'maxItems', 'type/Integer', 'type/Category', '', null, '', '0', '53', null, 'Max Items', 'normal', null, '489', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('319', '2017-06-22 10:46:52', '2017-06-22 10:48:45', 'maxLeafNodes', 'type/Integer', 'type/Category', '', null, '', '0', '53', null, 'Max Leaf Nodes', 'normal', null, '490', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('320', '2017-06-22 10:46:53', '2017-06-22 10:48:45', 'maxPayloadSize', 'type/Integer', 'type/Category', '', null, '', '0', '53', null, 'Max Payload Size', 'normal', null, '491', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('321', '2017-06-22 10:46:53', '2017-06-22 10:48:46', 'notifyConfigChanges', 'type/Integer', 'type/Category', '', null, '', '0', '53', null, 'Notify Config Changes', 'normal', null, '492', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('322', '2017-06-22 10:46:53', '2017-06-22 10:48:46', 'notifyDelete', 'type/Integer', 'type/Category', '', null, '', '0', '53', null, 'Notify Delete', 'normal', null, '493', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('323', '2017-06-22 10:46:53', '2017-06-22 10:48:46', 'notifyRetract', 'type/Integer', 'type/Category', '', null, '', '0', '53', null, 'Notify Retract', 'normal', null, '494', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('324', '2017-06-22 10:46:53', '2017-06-22 10:48:46', 'persistItems', 'type/Integer', 'type/Category', '', null, '', '0', '53', null, 'Persist Items', 'normal', null, '495', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('325', '2017-06-22 10:46:53', '2017-06-22 10:48:47', 'presenceBased', 'type/Integer', 'type/Category', '', null, '', '0', '53', null, 'Presence Based', 'normal', null, '496', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('326', '2017-06-22 10:46:53', '2017-06-22 10:48:47', 'publisherModel', 'type/Text', 'type/Category', '', null, '', '0', '53', null, 'Publisher Model', 'normal', null, '497', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('327', '2017-06-22 10:46:53', '2017-06-22 10:46:53', 'replyPolicy', 'type/Text', null, '', null, '', '0', '53', null, 'Reply Policy', 'normal', null, '498', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('328', '2017-06-22 10:46:53', '2017-06-22 10:48:47', 'sendItemSubscribe', 'type/Integer', 'type/Category', '', null, '', '0', '53', null, 'Send Item Subscribe', 'normal', null, '499', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('329', '2017-06-22 10:46:53', '2017-06-22 10:46:53', 'serviceID', 'type/Text', 'type/PK', '', null, '', '0', '53', null, 'Service ID', 'normal', null, '500', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('330', '2017-06-22 10:46:53', '2017-06-22 10:48:47', 'subscriptionEnabled', 'type/Integer', 'type/Category', '', null, '', '0', '53', null, 'Subscription Enabled', 'normal', null, '501', '2017-06-25 14:18:46', null, null);
INSERT INTO `metabase_field` VALUES ('331', '2017-06-22 10:46:54', '2017-06-22 10:46:54', 'creationDate', 'type/Text', null, '', null, '', '0', '54', null, 'Creation Date', 'normal', null, '755', '2017-06-25 14:18:47', null, null);
INSERT INTO `metabase_field` VALUES ('332', '2017-06-22 10:46:54', '2017-06-22 10:46:54', 'id', 'type/Text', 'type/PK', '', null, '', '0', '54', null, 'ID', 'normal', null, '756', '2017-06-25 14:18:47', null, null);
INSERT INTO `metabase_field` VALUES ('333', '2017-06-22 10:46:54', '2017-06-22 10:46:54', 'jid', 'type/Text', null, '', null, '', '0', '54', null, 'Jid', 'normal', null, '757', '2017-06-25 14:18:47', null, null);
INSERT INTO `metabase_field` VALUES ('334', '2017-06-22 10:46:54', '2017-06-22 10:46:54', 'nodeID', 'type/Text', 'type/PK', '', null, '', '0', '54', null, 'Node ID', 'normal', null, '758', '2017-06-25 14:18:47', null, null);
INSERT INTO `metabase_field` VALUES ('335', '2017-06-22 10:46:54', '2017-06-22 10:46:54', 'payload', 'type/Text', null, '', null, '', '0', '54', null, 'Payload', 'normal', null, '759', '2017-06-25 14:18:47', null, null);
INSERT INTO `metabase_field` VALUES ('336', '2017-06-22 10:46:54', '2017-06-22 10:46:54', 'serviceID', 'type/Text', 'type/PK', '', null, '', '0', '54', null, 'Service ID', 'normal', null, '760', '2017-06-25 14:18:47', null, null);
INSERT INTO `metabase_field` VALUES ('337', '2017-06-22 10:46:54', '2017-06-22 10:48:49', 'accessModel', 'type/Text', 'type/Category', '', null, '', '0', '55', null, 'Access Model', 'normal', null, '219', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('338', '2017-06-22 10:46:54', '2017-06-22 10:48:50', 'associationPolicy', 'type/Text', 'type/Category', '', null, '', '0', '55', null, 'Association Policy', 'normal', null, '220', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('339', '2017-06-22 10:46:54', '2017-06-22 10:48:50', 'bodyXSLT', 'type/Text', 'type/Category', '', null, '', '0', '55', null, 'Body Xslt', 'normal', null, '221', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('340', '2017-06-22 10:46:54', '2017-06-22 10:48:51', 'configSubscription', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Config Subscription', 'normal', null, '222', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('341', '2017-06-22 10:46:54', '2017-06-22 10:48:51', 'creationDate', 'type/Text', 'type/Category', '', null, '', '0', '55', null, 'Creation Date', 'normal', null, '223', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('342', '2017-06-22 10:46:54', '2017-06-22 10:48:52', 'creator', 'type/Text', 'type/Category', '', null, '', '0', '55', null, 'Creator', 'normal', null, '224', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('343', '2017-06-22 10:46:55', '2017-06-22 10:48:52', 'dataformXSLT', 'type/Text', 'type/Category', '', null, '', '0', '55', null, 'Data Form Xslt', 'normal', null, '225', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('344', '2017-06-22 10:46:55', '2017-06-22 10:48:52', 'deliverPayloads', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Deliver Payloads', 'normal', null, '226', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('345', '2017-06-22 10:46:55', '2017-06-22 10:48:53', 'description', 'type/Text', 'type/Category', '', null, '', '0', '55', null, 'Description', 'normal', null, '227', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('346', '2017-06-22 10:46:55', '2017-06-22 10:48:53', 'language', 'type/Text', 'type/Category', '', null, '', '0', '55', null, 'Language', 'normal', null, '228', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('347', '2017-06-22 10:46:55', '2017-06-22 10:48:54', 'leaf', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Leaf', 'normal', null, '229', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('348', '2017-06-22 10:46:55', '2017-06-22 10:48:54', 'maxItems', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Max Items', 'normal', null, '230', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('349', '2017-06-22 10:46:55', '2017-06-22 10:48:54', 'maxLeafNodes', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Max Leaf Nodes', 'normal', null, '231', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('350', '2017-06-22 10:46:55', '2017-06-22 10:48:55', 'maxPayloadSize', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Max Payload Size', 'normal', null, '232', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('351', '2017-06-22 10:46:55', '2017-06-22 10:48:55', 'modificationDate', 'type/Text', 'type/Category', '', null, '', '0', '55', null, 'Modification Date', 'normal', null, '233', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('352', '2017-06-22 10:46:55', '2017-06-22 10:46:55', 'name', 'type/Text', 'type/Name', '', null, '', '0', '55', null, 'Name', 'normal', null, '234', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('353', '2017-06-22 10:46:55', '2017-06-22 10:46:55', 'nodeID', 'type/Text', 'type/PK', '', null, '', '0', '55', null, 'Node ID', 'normal', null, '235', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('354', '2017-06-22 10:46:55', '2017-06-22 10:48:56', 'notifyConfigChanges', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Notify Config Changes', 'normal', null, '236', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('355', '2017-06-22 10:46:55', '2017-06-22 10:48:56', 'notifyDelete', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Notify Delete', 'normal', null, '237', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('356', '2017-06-22 10:46:56', '2017-06-22 10:48:56', 'notifyRetract', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Notify Retract', 'normal', null, '238', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('357', '2017-06-22 10:46:56', '2017-06-22 10:46:56', 'parent', 'type/Text', null, '', null, '', '0', '55', null, 'Parent', 'normal', null, '239', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('358', '2017-06-22 10:46:56', '2017-06-22 10:48:57', 'payloadType', 'type/Text', 'type/Category', '', null, '', '0', '55', null, 'Payload Type', 'normal', null, '240', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('359', '2017-06-22 10:46:56', '2017-06-22 10:48:58', 'persistItems', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Persist Items', 'normal', null, '241', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('360', '2017-06-22 10:46:56', '2017-06-22 10:48:58', 'presenceBased', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Presence Based', 'normal', null, '242', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('361', '2017-06-22 10:46:56', '2017-06-22 10:48:58', 'publisherModel', 'type/Text', 'type/Category', '', null, '', '0', '55', null, 'Publisher Model', 'normal', null, '243', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('362', '2017-06-22 10:46:56', '2017-06-22 10:46:56', 'replyPolicy', 'type/Text', null, '', null, '', '0', '55', null, 'Reply Policy', 'normal', null, '244', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('363', '2017-06-22 10:46:56', '2017-06-22 10:48:58', 'sendItemSubscribe', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Send Item Subscribe', 'normal', null, '245', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('364', '2017-06-22 10:46:56', '2017-06-22 10:46:56', 'serviceID', 'type/Text', 'type/PK', '', null, '', '0', '55', null, 'Service ID', 'normal', null, '246', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('365', '2017-06-22 10:46:56', '2017-06-22 10:48:59', 'subscriptionEnabled', 'type/Integer', 'type/Category', '', null, '', '0', '55', null, 'Subscription Enabled', 'normal', null, '247', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('366', '2017-06-22 10:46:57', '2017-06-22 10:46:57', 'nodeID', 'type/Text', null, '', null, '', '0', '56', null, 'Node ID', 'normal', null, '300', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('367', '2017-06-22 10:46:57', '2017-06-22 10:46:57', 'rosterGroup', 'type/Text', null, '', null, '', '0', '56', null, 'Roster Group', 'normal', null, '301', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('368', '2017-06-22 10:46:57', '2017-06-22 10:46:57', 'serviceID', 'type/Text', null, '', null, '', '0', '56', null, 'Service ID', 'normal', null, '302', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('369', '2017-06-22 10:46:57', '2017-06-22 10:46:57', 'associationType', 'type/Text', null, '', null, '', '0', '57', null, 'Association Type', 'normal', null, '502', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('370', '2017-06-22 10:46:57', '2017-06-22 10:46:57', 'jid', 'type/Text', 'type/PK', '', null, '', '0', '57', null, 'Jid', 'normal', null, '503', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('371', '2017-06-22 10:46:57', '2017-06-22 10:46:57', 'nodeID', 'type/Text', 'type/PK', '', null, '', '0', '57', null, 'Node ID', 'normal', null, '504', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('372', '2017-06-22 10:46:57', '2017-06-22 10:46:57', 'serviceID', 'type/Text', 'type/PK', '', null, '', '0', '57', null, 'Service ID', 'normal', null, '505', '2017-06-25 14:18:50', null, null);
INSERT INTO `metabase_field` VALUES ('373', '2017-06-22 10:46:57', '2017-06-22 10:46:57', 'deliver', 'type/Integer', null, '', null, '', '0', '58', null, 'Deliver', 'normal', null, '131', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('374', '2017-06-22 10:46:57', '2017-06-22 10:46:57', 'digest', 'type/Integer', null, '', null, '', '0', '58', null, 'Digest', 'normal', null, '132', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('375', '2017-06-22 10:46:57', '2017-06-22 10:46:57', 'digest_frequency', 'type/Integer', null, '', null, '', '0', '58', null, 'Digest Frequency', 'normal', null, '133', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('376', '2017-06-22 10:46:57', '2017-06-22 10:46:57', 'expire', 'type/Text', null, '', null, '', '0', '58', null, 'Expire', 'normal', null, '134', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('377', '2017-06-22 10:46:58', '2017-06-22 10:46:58', 'id', 'type/Text', 'type/PK', '', null, '', '0', '58', null, 'ID', 'normal', null, '135', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('378', '2017-06-22 10:46:58', '2017-06-22 10:46:58', 'includeBody', 'type/Integer', null, '', null, '', '0', '58', null, 'Include Body', 'normal', null, '136', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('379', '2017-06-22 10:46:58', '2017-06-22 10:46:58', 'jid', 'type/Text', null, '', null, '', '0', '58', null, 'Jid', 'normal', null, '137', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('380', '2017-06-22 10:46:58', '2017-06-22 10:46:58', 'keyword', 'type/Text', null, '', null, '', '0', '58', null, 'Keyword', 'normal', null, '138', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('381', '2017-06-22 10:46:58', '2017-06-22 10:46:58', 'nodeID', 'type/Text', 'type/PK', '', null, '', '0', '58', null, 'Node ID', 'normal', null, '139', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('382', '2017-06-22 10:46:58', '2017-06-22 10:46:58', 'owner', 'type/Text', null, '', null, '', '0', '58', null, 'Owner', 'normal', null, '140', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('383', '2017-06-22 10:46:58', '2017-06-22 10:46:58', 'serviceID', 'type/Text', 'type/PK', '', null, '', '0', '58', null, 'Service ID', 'normal', null, '141', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('384', '2017-06-22 10:46:58', '2017-06-22 10:46:58', 'showValues', 'type/Text', null, '', null, '', '0', '58', null, 'Show Values', 'normal', null, '142', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('385', '2017-06-22 10:46:58', '2017-06-22 10:46:58', 'state', 'type/Text', 'type/State', '', null, '', '0', '58', null, 'State', 'normal', null, '143', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('386', '2017-06-22 10:46:58', '2017-06-22 10:46:58', 'subscriptionDepth', 'type/Integer', null, '', null, '', '0', '58', null, 'Subscription Depth', 'normal', null, '144', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('387', '2017-06-22 10:46:58', '2017-06-22 10:46:58', 'subscriptionType', 'type/Text', null, '', null, '', '0', '58', null, 'Subscription Type', 'normal', null, '145', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('388', '2017-06-22 10:46:59', '2017-06-22 10:46:59', 'permission', 'type/Text', null, '', null, '', '0', '59', null, 'Permission', 'normal', null, '552', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('389', '2017-06-22 10:46:59', '2017-06-22 10:46:59', 'remotePort', 'type/Integer', null, '', null, '', '0', '59', null, 'Remote Port', 'normal', null, '553', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('390', '2017-06-22 10:46:59', '2017-06-22 10:46:59', 'xmppDomain', 'type/Text', 'type/PK', '', null, '', '0', '59', null, 'Xmpp Domain', 'normal', null, '554', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('391', '2017-06-22 10:46:59', '2017-06-22 10:46:59', 'ask', 'type/Integer', null, '', null, '', '0', '60', null, 'Ask', 'normal', null, '506', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('392', '2017-06-22 10:46:59', '2017-06-22 10:46:59', 'jid', 'type/Text', null, '', null, '', '0', '60', null, 'Jid', 'normal', null, '507', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('393', '2017-06-22 10:46:59', '2017-06-22 10:46:59', 'nick', 'type/Text', null, '', null, '', '0', '60', null, 'Nick', 'normal', null, '508', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('394', '2017-06-22 10:46:59', '2017-06-22 10:46:59', 'recv', 'type/Integer', null, '', null, '', '0', '60', null, 'Re Cv', 'normal', null, '509', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('395', '2017-06-22 10:46:59', '2017-06-22 10:46:59', 'rosterID', 'type/BigInteger', 'type/PK', '', null, '', '0', '60', null, 'Roster ID', 'normal', null, '510', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('396', '2017-06-22 10:46:59', '2017-06-22 10:46:59', 'sub', 'type/Integer', null, '', null, '', '0', '60', null, 'Sub', 'normal', null, '511', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('397', '2017-06-22 10:46:59', '2017-06-22 10:46:59', 'username', 'type/Text', null, '', null, '', '0', '60', null, 'Username', 'normal', null, '512', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('398', '2017-06-22 10:46:59', '2017-06-22 10:46:59', 'groupName', 'type/Text', null, '', null, '', '0', '61', null, 'Group Name', 'normal', null, '443', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('399', '2017-06-22 10:47:00', '2017-06-22 10:47:00', 'rank', 'type/Integer', 'type/PK', '', null, '', '0', '61', null, 'Rank', 'normal', null, '444', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('400', '2017-06-22 10:47:00', '2017-06-22 10:47:00', 'rosterID', 'type/BigInteger', 'type/PK', '', null, '', '0', '61', null, 'Roster ID', 'normal', null, '445', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('401', '2017-06-22 10:47:00', '2017-06-22 10:47:00', 'principal', 'type/Text', 'type/PK', '', null, '', '0', '62', null, 'Principal', 'normal', null, '356', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('402', '2017-06-22 10:47:00', '2017-06-22 10:47:00', 'username', 'type/Text', 'type/PK', '', null, '', '0', '62', null, 'Username', 'normal', null, '357', '2017-06-25 14:18:51', null, null);
INSERT INTO `metabase_field` VALUES ('403', '2017-06-22 10:47:00', '2017-06-22 10:49:02', 'details', 'type/Text', 'type/Category', '', null, '', '0', '63', null, 'Details', 'normal', null, '723', '2017-06-25 14:18:52', null, null);
INSERT INTO `metabase_field` VALUES ('404', '2017-06-22 10:47:00', '2017-06-22 10:49:03', 'entryStamp', 'type/BigInteger', 'type/Category', '', null, '', '0', '63', null, 'Entry Stamp', 'normal', null, '724', '2017-06-25 14:18:52', null, null);
INSERT INTO `metabase_field` VALUES ('405', '2017-06-22 10:47:00', '2017-06-22 10:47:00', 'msgID', 'type/BigInteger', 'type/PK', '', null, '', '0', '63', null, 'Msg ID', 'normal', null, '725', '2017-06-25 14:18:52', null, null);
INSERT INTO `metabase_field` VALUES ('406', '2017-06-22 10:47:00', '2017-06-22 10:49:03', 'node', 'type/Text', 'type/Category', '', null, '', '0', '63', null, 'Node', 'normal', null, '726', '2017-06-25 14:18:52', null, null);
INSERT INTO `metabase_field` VALUES ('407', '2017-06-22 10:47:00', '2017-06-22 10:49:03', 'summary', 'type/Text', 'type/Category', '', null, '', '0', '63', null, 'Summary', 'normal', null, '727', '2017-06-25 14:18:52', null, null);
INSERT INTO `metabase_field` VALUES ('408', '2017-06-22 10:47:00', '2017-06-22 10:49:03', 'username', 'type/Text', 'type/Category', '', null, '', '0', '63', null, 'Username', 'normal', null, '728', '2017-06-25 14:18:52', null, null);
INSERT INTO `metabase_field` VALUES ('409', '2017-06-22 10:47:01', '2017-06-22 10:49:04', 'creationDate', 'type/Text', 'type/Category', '', null, '', '0', '64', null, 'Creation Date', 'normal', null, '93', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('410', '2017-06-22 10:47:01', '2017-06-22 10:49:04', 'email', 'type/Text', 'type/Email', '', null, '', '0', '64', null, 'Email', 'normal', null, '94', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('411', '2017-06-22 10:47:01', '2017-06-22 10:49:05', 'encryptedPassword', 'type/Text', 'type/Category', '', null, '', '0', '64', null, 'Encrypted Password', 'normal', null, '95', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('412', '2017-06-22 10:47:01', '2017-06-22 10:49:05', 'iterations', 'type/Integer', 'type/Category', '', null, '', '0', '64', null, 'Iterations', 'normal', null, '96', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('413', '2017-06-22 10:47:01', '2017-06-22 10:49:05', 'modificationDate', 'type/Text', 'type/Category', '', null, '', '0', '64', null, 'Modification Date', 'normal', null, '97', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('414', '2017-06-22 10:47:01', '2017-06-22 10:47:01', 'name', 'type/Text', 'type/Name', '', null, '', '0', '64', null, 'Name', 'normal', null, '98', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('415', '2017-06-22 10:47:01', '2017-06-22 10:47:01', 'plainPassword', 'type/Text', null, '', null, '', '0', '64', null, 'Plain Password', 'normal', null, '99', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('416', '2017-06-22 10:47:01', '2017-06-22 10:49:06', 'salt', 'type/Text', 'type/Category', '', null, '', '0', '64', null, 'Salt', 'normal', null, '100', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('417', '2017-06-22 10:47:01', '2017-06-22 10:49:06', 'serverKey', 'type/Text', 'type/Category', '', null, '', '0', '64', null, 'Server Key', 'normal', null, '101', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('418', '2017-06-22 10:47:01', '2017-06-22 10:49:06', 'storedKey', 'type/Text', 'type/Category', '', null, '', '0', '64', null, 'Stored Key', 'normal', null, '102', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('419', '2017-06-22 10:47:01', '2017-06-22 10:47:01', 'username', 'type/Text', 'type/PK', '', null, '', '0', '64', null, 'Username', 'normal', null, '103', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('420', '2017-06-22 10:47:01', '2017-06-22 10:47:01', 'endTime', 'type/Text', null, '', null, '', '0', '65', null, 'End Time', 'normal', null, '296', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('421', '2017-06-22 10:47:02', '2017-06-22 10:47:02', 'name', 'type/Text', 'type/PK', '', null, '', '0', '65', null, 'Name', 'normal', null, '297', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('422', '2017-06-22 10:47:02', '2017-06-22 10:47:02', 'startTime', 'type/Text', null, '', null, '', '0', '65', null, 'Start Time', 'normal', null, '298', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('423', '2017-06-22 10:47:02', '2017-06-22 10:47:02', 'username', 'type/Text', 'type/PK', '', null, '', '0', '65', null, 'Username', 'normal', null, '299', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('424', '2017-06-22 10:47:02', '2017-06-22 10:47:02', 'name', 'type/Text', 'type/PK', '', null, '', '0', '66', null, 'Name', 'normal', null, '983', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('425', '2017-06-22 10:47:02', '2017-06-22 10:47:02', 'propValue', 'type/Text', null, '', null, '', '0', '66', null, 'Prop Value', 'normal', null, '984', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('426', '2017-06-22 10:47:02', '2017-06-22 10:47:02', 'username', 'type/Text', 'type/PK', '', null, '', '0', '66', null, 'Username', 'normal', null, '985', '2017-06-25 14:18:53', null, null);
INSERT INTO `metabase_field` VALUES ('427', '2017-06-22 10:47:02', '2017-06-22 10:47:02', 'username', 'type/Text', 'type/PK', '', null, '', '0', '67', null, 'Username', 'normal', null, '682', '2017-06-25 14:18:54', null, null);
INSERT INTO `metabase_field` VALUES ('428', '2017-06-22 10:47:02', '2017-06-22 10:47:02', 'vcard', 'type/Text', null, '', null, '', '0', '67', null, 'Vcard', 'normal', null, '683', '2017-06-25 14:18:54', null, null);
INSERT INTO `metabase_field` VALUES ('429', '2017-06-22 10:47:03', '2017-06-22 10:47:03', 'name', 'type/Text', 'type/PK', '', null, '', '0', '68', null, 'Name', 'normal', null, '680', '2017-06-25 14:18:54', null, null);
INSERT INTO `metabase_field` VALUES ('430', '2017-06-22 10:47:03', '2017-06-22 10:49:08', 'version', 'type/Integer', 'type/Category', '', null, '', '0', '68', null, 'Version', 'normal', null, '681', '2017-06-25 14:18:54', null, null);
INSERT INTO `metabase_field` VALUES ('431', '2017-06-22 10:47:03', '2017-06-22 10:49:09', 'content', 'type/Text', 'type/Category', '', null, '', '0', '69', null, 'Content', 'normal', null, '808', '2017-06-25 14:18:55', null, null);
INSERT INTO `metabase_field` VALUES ('432', '2017-06-22 10:47:03', '2017-06-22 10:47:03', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '69', null, 'ID', 'normal', null, '809', '2017-06-25 14:18:55', null, null);
INSERT INTO `metabase_field` VALUES ('433', '2017-06-22 10:47:03', '2017-06-22 10:49:09', 'isignore', 'type/Text', 'type/Category', '', null, '', '0', '69', null, 'Is Ignore', 'normal', null, '810', '2017-06-25 14:18:55', null, null);
INSERT INTO `metabase_field` VALUES ('434', '2017-06-22 10:47:03', '2017-06-22 10:47:03', 'istodoc', 'type/*', null, '', null, '', '0', '69', null, 'Is To Doc', 'normal', null, '811', '2017-06-25 14:18:55', null, null);
INSERT INTO `metabase_field` VALUES ('435', '2017-06-22 10:47:03', '2017-06-22 10:47:03', 'taskid', 'type/Integer', 'type/PK', '', null, '', '0', '69', null, 'Task ID', 'normal', null, '812', '2017-06-25 14:18:55', null, null);
INSERT INTO `metabase_field` VALUES ('436', '2017-06-22 10:47:03', '2017-06-22 10:49:10', 'time', 'type/Text', 'type/Category', '', null, '', '0', '69', null, 'Time', 'normal', null, '813', '2017-06-25 14:18:55', null, null);
INSERT INTO `metabase_field` VALUES ('437', '2017-06-22 10:47:03', '2017-06-22 10:47:03', 'type', 'type/Text', 'type/Category', '', null, '', '0', '69', null, 'Type', 'normal', null, '814', '2017-06-25 14:18:55', null, null);
INSERT INTO `metabase_field` VALUES ('438', '2017-06-22 10:47:03', '2017-06-22 10:49:10', 'user_id', 'type/Text', 'type/Category', '', null, '', '0', '69', null, 'User ID', 'normal', null, '815', '2017-06-25 14:18:55', null, null);
INSERT INTO `metabase_field` VALUES ('439', '2017-06-22 10:47:03', '2017-06-22 10:49:10', 'gid', 'type/Integer', 'type/Category', '', null, '', '0', '70', null, 'Gid', 'normal', null, '746', '2017-06-25 14:18:57', null, null);
INSERT INTO `metabase_field` VALUES ('440', '2017-06-22 10:47:03', '2017-06-22 10:47:03', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '70', null, 'ID', 'normal', null, '747', '2017-06-25 14:18:57', null, null);
INSERT INTO `metabase_field` VALUES ('441', '2017-06-22 10:47:04', '2017-06-22 10:49:11', 'uid', 'type/Integer', 'type/Category', '', null, '', '0', '70', null, 'UID', 'normal', null, '748', '2017-06-25 14:18:57', null, null);
INSERT INTO `metabase_field` VALUES ('442', '2017-06-22 10:47:04', '2017-06-22 10:49:12', 'deltime', 'type/Text', 'type/Category', '', null, '', '0', '71', null, 'Del Time', 'normal', null, '704', '2017-06-25 14:18:58', null, null);
INSERT INTO `metabase_field` VALUES ('443', '2017-06-22 10:47:04', '2017-06-22 10:49:12', 'folderpid', 'type/Text', 'type/Category', '', null, '', '0', '71', null, 'Folder Pid', 'normal', null, '705', '2017-06-25 14:18:58', null, null);
INSERT INTO `metabase_field` VALUES ('444', '2017-06-22 10:47:04', '2017-06-22 10:47:04', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '71', null, 'ID', 'normal', null, '706', '2017-06-25 14:18:58', null, null);
INSERT INTO `metabase_field` VALUES ('445', '2017-06-22 10:47:04', '2017-06-22 10:47:04', 'name', 'type/Text', 'type/Name', '', null, '', '0', '71', null, 'Name', 'normal', null, '707', '2017-06-25 14:18:58', null, null);
INSERT INTO `metabase_field` VALUES ('446', '2017-06-22 10:47:04', '2017-06-22 10:49:12', 'pid', 'type/Text', 'type/Category', '', null, '', '0', '71', null, 'Pid', 'normal', null, '708', '2017-06-25 14:18:58', null, null);
INSERT INTO `metabase_field` VALUES ('447', '2017-06-22 10:47:04', '2017-06-22 10:49:13', 'time', 'type/Text', 'type/Category', '', null, '', '0', '71', null, 'Time', 'normal', null, '709', '2017-06-25 14:18:58', null, null);
INSERT INTO `metabase_field` VALUES ('448', '2017-06-22 10:47:04', '2017-06-22 10:49:13', 'deltime', 'type/Text', 'type/Category', '', null, '', '0', '72', null, 'Del Time', 'normal', null, '318', '2017-06-25 14:18:59', null, null);
INSERT INTO `metabase_field` VALUES ('449', '2017-06-22 10:47:04', '2017-06-22 10:49:13', 'file_size', 'type/Text', 'type/Category', '', null, '', '0', '72', null, 'File Size', 'normal', null, '319', '2017-06-25 14:18:59', null, null);
INSERT INTO `metabase_field` VALUES ('450', '2017-06-22 10:47:04', '2017-06-22 10:47:04', 'filename', 'type/Text', null, '', null, '', '0', '72', null, 'Filename', 'normal', null, '320', '2017-06-25 14:18:59', null, null);
INSERT INTO `metabase_field` VALUES ('451', '2017-06-22 10:47:04', '2017-06-22 10:47:04', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '72', null, 'ID', 'normal', null, '321', '2017-06-25 14:18:59', null, null);
INSERT INTO `metabase_field` VALUES ('452', '2017-06-22 10:47:05', '2017-06-22 10:49:14', 'istrash', 'type/Text', 'type/Category', '', null, '', '0', '72', null, 'Is Trash', 'normal', null, '322', '2017-06-25 14:18:59', null, null);
INSERT INTO `metabase_field` VALUES ('453', '2017-06-22 10:47:05', '2017-06-22 10:47:05', 'name', 'type/Text', 'type/Name', '', null, '', '0', '72', null, 'Name', 'normal', null, '323', '2017-06-25 14:18:59', null, null);
INSERT INTO `metabase_field` VALUES ('454', '2017-06-22 10:47:05', '2017-06-22 10:49:14', 'pid', 'type/Text', 'type/Category', '', null, '', '0', '72', null, 'Pid', 'normal', null, '324', '2017-06-25 14:18:59', null, null);
INSERT INTO `metabase_field` VALUES ('455', '2017-06-22 10:47:05', '2017-06-22 10:49:14', 'projid', 'type/Text', 'type/Category', '', null, '', '0', '72', null, 'Pro Jid', 'normal', null, '325', '2017-06-25 14:18:59', null, null);
INSERT INTO `metabase_field` VALUES ('456', '2017-06-22 10:47:05', '2017-06-22 10:49:15', 'time', 'type/Text', 'type/Category', '', null, '', '0', '72', null, 'Time', 'normal', null, '326', '2017-06-25 14:18:59', null, null);
INSERT INTO `metabase_field` VALUES ('457', '2017-06-22 10:47:05', '2017-06-22 10:49:15', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '72', null, 'UID', 'normal', null, '327', '2017-06-25 14:18:59', null, null);
INSERT INTO `metabase_field` VALUES ('458', '2017-06-22 10:47:05', '2017-06-22 10:47:05', 'url', 'type/Text', 'type/URL', '', null, '', '0', '72', null, 'URL', 'normal', null, '328', '2017-06-25 14:18:59', null, null);
INSERT INTO `metabase_field` VALUES ('459', '2017-06-22 10:47:05', '2017-06-22 10:49:16', 'boss', 'type/Text', 'type/Category', '', null, '', '0', '73', null, 'Boss', 'normal', null, '558', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('460', '2017-06-22 10:47:05', '2017-06-22 10:49:16', 'content', 'type/Text', 'type/Category', '', null, '', '0', '73', null, 'Content', 'normal', null, '559', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('461', '2017-06-22 10:47:05', '2017-06-22 10:49:16', 'dp', 'type/Text', 'type/Category', '', null, '', '0', '73', null, 'Dp', 'normal', null, '560', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('462', '2017-06-22 10:47:05', '2017-06-22 10:47:05', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '73', null, 'ID', 'normal', null, '561', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('463', '2017-06-22 10:47:05', '2017-06-22 10:49:17', 'isclose', 'type/Text', 'type/Category', '', null, '', '0', '73', null, 'Is Close', 'normal', null, '562', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('464', '2017-06-22 10:47:06', '2017-06-22 10:49:17', 'isdel', 'type/Text', 'type/Category', '', null, '', '0', '73', null, 'Is Del', 'normal', null, '563', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('465', '2017-06-22 10:47:06', '2017-06-22 10:49:17', 'istemplate', 'type/Integer', 'type/Category', '', null, '', '0', '73', null, 'Is Template', 'normal', null, '564', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('466', '2017-06-22 10:47:06', '2017-06-22 10:49:17', 'member', 'type/Text', 'type/Category', '', null, '', '0', '73', null, 'Member', 'normal', null, '565', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('467', '2017-06-22 10:47:06', '2017-06-22 10:47:06', 'name', 'type/Text', 'type/Name', '', null, '', '0', '73', null, 'Name', 'normal', null, '566', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('468', '2017-06-22 10:47:06', '2017-06-22 10:49:18', 'shy', 'type/Text', 'type/Category', '', null, '', '0', '73', null, 'Shy', 'normal', null, '567', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('469', '2017-06-22 10:47:06', '2017-06-22 10:49:18', 'wxhs', 'type/Text', 'type/Category', '', null, '', '0', '73', null, 'Wxhs', 'normal', null, '568', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('470', '2017-06-22 10:47:06', '2017-06-22 10:47:06', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '74', null, 'ID', 'normal', null, '178', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('471', '2017-06-22 10:47:06', '2017-06-22 10:49:19', 'members_back', 'type/Text', 'type/Category', '', null, '', '0', '74', null, 'Members Back', 'details-only', null, '179', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('472', '2017-06-22 10:47:06', '2017-06-22 10:47:06', 'name', 'type/Text', 'type/Name', '', null, '', '0', '74', null, 'Name', 'normal', null, '180', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('473', '2017-06-22 10:47:06', '2017-06-22 10:47:06', 'province_id', 'type/Text', 'type/PK', '', null, '', '0', '75', null, 'Province ID', 'normal', null, '166', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('474', '2017-06-22 10:47:06', '2017-06-22 10:49:20', 'province_name', 'type/Text', 'type/Category', '', null, '', '0', '75', null, 'Province Name', 'normal', null, '167', '2017-06-25 14:19:00', null, null);
INSERT INTO `metabase_field` VALUES ('475', '2017-06-22 10:47:07', '2017-06-22 10:47:07', 'city_id', 'type/Integer', null, '', null, '', '0', '76', null, 'City ID', 'normal', null, '611', '2017-06-25 14:19:01', null, null);
INSERT INTO `metabase_field` VALUES ('476', '2017-06-22 10:47:07', '2017-06-22 10:47:07', 'region_id', 'type/Integer', 'type/PK', '', null, '', '0', '76', null, 'Region ID', 'normal', null, '612', '2017-06-25 14:19:01', null, null);
INSERT INTO `metabase_field` VALUES ('477', '2017-06-22 10:47:07', '2017-06-22 10:47:07', 'region_name', 'type/Text', null, '', null, '', '0', '76', null, 'Region Name', 'normal', null, '613', '2017-06-25 14:19:01', null, null);
INSERT INTO `metabase_field` VALUES ('478', '2017-06-22 10:47:07', '2017-06-22 10:47:07', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '77', null, 'ID', 'normal', null, '886', '2017-06-25 14:19:01', null, null);
INSERT INTO `metabase_field` VALUES ('479', '2017-06-22 10:47:07', '2017-06-22 10:47:07', 'name', 'type/Text', 'type/Name', '', null, '', '0', '77', null, 'Name', 'normal', null, '887', '2017-06-25 14:19:01', null, null);
INSERT INTO `metabase_field` VALUES ('480', '2017-06-22 10:47:07', '2017-06-22 10:49:21', 'code_desc', 'type/Text', 'type/Category', '', null, '', '0', '78', null, 'Code Desc', 'normal', null, '629', '2017-06-25 14:19:02', null, null);
INSERT INTO `metabase_field` VALUES ('481', '2017-06-22 10:47:07', '2017-06-22 10:47:07', 'code_id', 'type/Text', 'type/PK', '', null, '', '0', '78', null, 'Code ID', 'normal', null, '630', '2017-06-25 14:19:02', null, null);
INSERT INTO `metabase_field` VALUES ('482', '2017-06-22 10:47:07', '2017-06-22 10:49:21', 'code_value', 'type/Text', 'type/Category', '', null, '', '0', '78', null, 'Code Value', 'normal', null, '631', '2017-06-25 14:19:02', null, null);
INSERT INTO `metabase_field` VALUES ('483', '2017-06-22 10:47:07', '2017-06-22 10:49:22', 'edit_mode', 'type/Text', 'type/Category', '', null, '', '0', '78', null, 'Edit Mode', 'normal', null, '632', '2017-06-25 14:19:02', null, null);
INSERT INTO `metabase_field` VALUES ('484', '2017-06-22 10:47:07', '2017-06-22 10:49:22', 'enabled', 'type/Text', 'type/Category', '', null, '', '0', '78', null, 'Enabled', 'normal', null, '633', '2017-06-25 14:19:02', null, null);
INSERT INTO `metabase_field` VALUES ('485', '2017-06-22 10:47:07', '2017-06-22 10:49:22', 'field_code', 'type/Text', 'type/Category', '', null, '', '0', '78', null, 'Field Code', 'normal', null, '634', '2017-06-25 14:19:02', null, null);
INSERT INTO `metabase_field` VALUES ('486', '2017-06-22 10:47:08', '2017-06-22 10:49:22', 'field_name', 'type/Text', 'type/Category', '', null, '', '0', '78', null, 'Field Name', 'normal', null, '635', '2017-06-25 14:19:02', null, null);
INSERT INTO `metabase_field` VALUES ('487', '2017-06-22 10:47:08', '2017-06-22 10:49:22', 'remark', 'type/Text', 'type/Category', '', null, '', '0', '78', null, 'Remark', 'normal', null, '636', '2017-06-25 14:19:02', null, null);
INSERT INTO `metabase_field` VALUES ('488', '2017-06-22 10:47:08', '2017-06-22 10:49:23', 'sort_no', 'type/Integer', 'type/Category', '', null, '', '0', '78', null, 'Sort No', 'normal', null, '637', '2017-06-25 14:19:02', null, null);
INSERT INTO `metabase_field` VALUES ('489', '2017-06-22 10:47:08', '2017-06-22 10:49:23', 'aim', 'type/Text', 'type/Category', '', null, '', '0', '79', null, 'Aim', 'normal', null, '793', '2017-06-25 14:19:03', null, null);
INSERT INTO `metabase_field` VALUES ('490', '2017-06-22 10:47:08', '2017-06-22 10:49:23', 'calcData', 'type/Text', 'type/Category', '', null, '', '0', '79', null, 'Calc Data', 'normal', null, '794', '2017-06-25 14:19:03', null, null);
INSERT INTO `metabase_field` VALUES ('491', '2017-06-22 10:47:08', '2017-06-22 10:49:24', 'deptid', 'type/Text', 'type/Category', '', null, '', '0', '79', null, 'Dept ID', 'normal', null, '795', '2017-06-25 14:19:03', null, null);
INSERT INTO `metabase_field` VALUES ('492', '2017-06-22 10:47:08', '2017-06-22 10:49:24', 'deptname', 'type/Text', 'type/Category', '', null, '', '0', '79', null, 'Dept Name', 'normal', null, '796', '2017-06-25 14:19:03', null, null);
INSERT INTO `metabase_field` VALUES ('493', '2017-06-22 10:47:08', '2017-06-22 10:49:25', 'desc', 'type/Text', 'type/Category', '', null, '', '0', '79', null, 'Desc', 'normal', null, '797', '2017-06-25 14:19:03', null, null);
INSERT INTO `metabase_field` VALUES ('494', '2017-06-22 10:47:08', '2017-06-22 10:47:08', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '79', null, 'ID', 'normal', null, '798', '2017-06-25 14:19:03', null, null);
INSERT INTO `metabase_field` VALUES ('495', '2017-06-22 10:47:08', '2017-06-22 10:49:25', 'isdel', 'type/Text', 'type/Category', '', null, '', '0', '79', null, 'Is Del', 'normal', null, '799', '2017-06-25 14:19:03', null, null);
INSERT INTO `metabase_field` VALUES ('496', '2017-06-22 10:47:08', '2017-06-22 10:49:25', 'looptype', 'type/Text', 'type/Category', '', null, '', '0', '79', null, 'Loop Type', 'normal', null, '800', '2017-06-25 14:19:03', null, null);
INSERT INTO `metabase_field` VALUES ('497', '2017-06-22 10:47:08', '2017-06-22 10:49:25', 'reduce', 'type/Text', 'type/Category', '', null, '', '0', '79', null, 'Reduce', 'normal', null, '801', '2017-06-25 14:19:03', null, null);
INSERT INTO `metabase_field` VALUES ('498', '2017-06-22 10:47:09', '2017-06-22 10:49:26', 'teamid', 'type/Text', 'type/Category', '', null, '', '0', '79', null, 'Team ID', 'normal', null, '802', '2017-06-25 14:19:03', null, null);
INSERT INTO `metabase_field` VALUES ('499', '2017-06-22 10:47:09', '2017-06-22 10:49:26', 'tp', 'type/Text', 'type/Category', '', null, '', '0', '79', null, 'Tp', 'normal', null, '803', '2017-06-25 14:19:03', null, null);
INSERT INTO `metabase_field` VALUES ('500', '2017-06-22 10:47:09', '2017-06-22 10:49:26', 'expanded', 'type/Text', 'type/Category', '', null, '', '0', '80', null, 'Expanded', 'normal', null, '446', '2017-06-25 14:19:04', null, null);
INSERT INTO `metabase_field` VALUES ('501', '2017-06-22 10:47:09', '2017-06-22 10:49:26', 'leaf', 'type/Text', 'type/Category', '', null, '', '0', '80', null, 'Leaf', 'normal', null, '447', '2017-06-25 14:19:04', null, null);
INSERT INTO `metabase_field` VALUES ('502', '2017-06-22 10:47:09', '2017-06-22 10:47:09', 'link_url', 'type/Text', 'type/URL', '', null, '', '0', '80', null, 'Link URL', 'normal', null, '448', '2017-06-25 14:19:04', null, null);
INSERT INTO `metabase_field` VALUES ('503', '2017-06-22 10:47:09', '2017-06-22 10:49:27', 'module_code', 'type/Text', 'type/Category', '', null, '', '0', '80', null, 'Module Code', 'normal', null, '449', '2017-06-25 14:19:04', null, null);
INSERT INTO `metabase_field` VALUES ('504', '2017-06-22 10:47:09', '2017-06-22 10:47:09', 'module_desc', 'type/Text', null, '', null, '', '0', '80', null, 'Module Desc', 'normal', null, '450', '2017-06-25 14:19:04', null, null);
INSERT INTO `metabase_field` VALUES ('505', '2017-06-22 10:47:09', '2017-06-22 10:47:09', 'module_id', 'type/Integer', 'type/PK', '', null, '', '0', '80', null, 'Module ID', 'normal', null, '451', '2017-06-25 14:19:04', null, null);
INSERT INTO `metabase_field` VALUES ('506', '2017-06-22 10:47:09', '2017-06-22 10:49:27', 'module_name', 'type/Text', 'type/Category', '', null, '', '0', '80', null, 'Module Name', 'normal', null, '452', '2017-06-25 14:19:04', null, null);
INSERT INTO `metabase_field` VALUES ('507', '2017-06-22 10:47:09', '2017-06-22 10:49:27', 'module_order', 'type/Integer', 'type/Category', '', null, '', '0', '80', null, 'Module Order', 'normal', null, '453', '2017-06-25 14:19:04', null, null);
INSERT INTO `metabase_field` VALUES ('508', '2017-06-22 10:47:09', '2017-06-22 10:49:27', 'parent_module', 'type/Text', 'type/Category', '', null, '', '0', '80', null, 'Parent Module', 'normal', null, '454', '2017-06-25 14:19:04', null, null);
INSERT INTO `metabase_field` VALUES ('509', '2017-06-22 10:47:10', '2017-06-22 10:49:28', 'attime', 'type/Text', 'type/Category', '', null, '', '0', '81', null, 'At Time', 'normal', null, '819', '2017-06-25 14:19:05', null, null);
INSERT INTO `metabase_field` VALUES ('510', '2017-06-22 10:47:10', '2017-06-22 10:49:28', 'desc', 'type/Text', 'type/Category', '', null, '', '0', '81', null, 'Desc', 'normal', null, '820', '2017-06-25 14:19:05', null, null);
INSERT INTO `metabase_field` VALUES ('511', '2017-06-22 10:47:10', '2017-06-22 10:47:10', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '81', null, 'ID', 'normal', null, '821', '2017-06-25 14:19:05', null, null);
INSERT INTO `metabase_field` VALUES ('512', '2017-06-22 10:47:10', '2017-06-22 10:49:29', 'notifytp', 'type/Text', 'type/Category', '', null, '', '0', '81', null, 'Notify Tp', 'normal', null, '822', '2017-06-25 14:19:05', null, null);
INSERT INTO `metabase_field` VALUES ('513', '2017-06-22 10:47:10', '2017-06-22 10:47:10', 'senduid', 'type/Text', null, '', null, '', '0', '81', null, 'Send UID', 'normal', null, '823', '2017-06-25 14:19:05', null, null);
INSERT INTO `metabase_field` VALUES ('514', '2017-06-22 10:47:10', '2017-06-22 10:49:29', 'stat', 'type/Text', 'type/Category', '', null, '', '0', '81', null, 'Stat', 'normal', null, '824', '2017-06-25 14:19:05', null, null);
INSERT INTO `metabase_field` VALUES ('515', '2017-06-22 10:47:10', '2017-06-22 10:49:29', 'tid', 'type/Text', 'type/Category', '', null, '', '0', '81', null, 'Tid', 'normal', null, '825', '2017-06-25 14:19:05', null, null);
INSERT INTO `metabase_field` VALUES ('516', '2017-06-22 10:47:10', '2017-06-22 10:49:29', 'title', 'type/Text', 'type/Category', '', null, '', '0', '81', null, 'Title', 'normal', null, '826', '2017-06-25 14:19:05', null, null);
INSERT INTO `metabase_field` VALUES ('517', '2017-06-22 10:47:11', '2017-06-22 10:49:29', 'touid', 'type/Text', 'type/Category', '', null, '', '0', '81', null, 'To UID', 'normal', null, '827', '2017-06-25 14:19:05', null, null);
INSERT INTO `metabase_field` VALUES ('518', '2017-06-22 10:47:11', '2017-06-22 10:47:11', 'url', 'type/Text', 'type/URL', '', null, '', '0', '81', null, 'URL', 'normal', null, '828', '2017-06-25 14:19:05', null, null);
INSERT INTO `metabase_field` VALUES ('519', '2017-06-22 10:47:11', '2017-06-22 10:47:11', 'param_id', 'type/Integer', 'type/PK', '', null, '', '0', '82', null, 'Param ID', 'normal', null, '837', '2017-06-25 14:19:06', null, null);
INSERT INTO `metabase_field` VALUES ('520', '2017-06-22 10:47:11', '2017-06-22 10:49:30', 'param_key', 'type/Text', 'type/Category', '', null, '', '0', '82', null, 'Param Key', 'normal', null, '838', '2017-06-25 14:19:06', null, null);
INSERT INTO `metabase_field` VALUES ('521', '2017-06-22 10:47:11', '2017-06-22 10:49:30', 'param_value', 'type/Text', 'type/Category', '', null, '', '0', '82', null, 'Param Value', 'normal', null, '839', '2017-06-25 14:19:06', null, null);
INSERT INTO `metabase_field` VALUES ('522', '2017-06-22 10:47:11', '2017-06-22 10:49:31', 'remark', 'type/Text', 'type/Category', '', null, '', '0', '82', null, 'Remark', 'normal', null, '840', '2017-06-25 14:19:06', null, null);
INSERT INTO `metabase_field` VALUES ('523', '2017-06-22 10:47:11', '2017-06-22 10:49:31', 'stat', 'type/Text', 'type/Category', '', null, '', '0', '82', null, 'Stat', 'normal', null, '841', '2017-06-25 14:19:06', null, null);
INSERT INTO `metabase_field` VALUES ('524', '2017-06-22 10:47:11', '2017-06-22 10:49:32', 'changepoint', 'type/Text', 'type/Category', '', null, '', '0', '83', null, 'Change Point', 'normal', null, '521', '2017-06-25 14:19:07', null, null);
INSERT INTO `metabase_field` VALUES ('525', '2017-06-22 10:47:11', '2017-06-22 10:49:32', 'desc', 'type/Text', 'type/Category', '', null, '', '0', '83', null, 'Desc', 'normal', null, '522', '2017-06-25 14:19:07', null, null);
INSERT INTO `metabase_field` VALUES ('526', '2017-06-22 10:47:11', '2017-06-22 10:49:32', 'giftnum', 'type/Text', 'type/Category', '', null, '', '0', '83', null, 'Gift Num', 'normal', null, '523', '2017-06-25 14:19:07', null, null);
INSERT INTO `metabase_field` VALUES ('527', '2017-06-22 10:47:11', '2017-06-22 10:47:11', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '83', null, 'ID', 'normal', null, '524', '2017-06-25 14:19:07', null, null);
INSERT INTO `metabase_field` VALUES ('528', '2017-06-22 10:47:11', '2017-06-22 10:49:33', 'imgurl', 'type/Text', 'type/Category', '', null, '', '0', '83', null, 'Img URL', 'normal', null, '525', '2017-06-25 14:19:07', null, null);
INSERT INTO `metabase_field` VALUES ('529', '2017-06-22 10:47:11', '2017-06-22 10:47:11', 'name', 'type/Text', 'type/Name', '', null, '', '0', '83', null, 'Name', 'normal', null, '526', '2017-06-25 14:19:07', null, null);
INSERT INTO `metabase_field` VALUES ('530', '2017-06-22 10:47:12', '2017-06-22 10:49:33', 'sjsj', 'type/Text', 'type/Category', '', null, '', '0', '83', null, 'Sj', 'normal', null, '527', '2017-06-25 14:19:07', null, null);
INSERT INTO `metabase_field` VALUES ('531', '2017-06-22 10:47:12', '2017-06-22 10:49:34', 'state', 'type/Integer', 'type/Category', '', null, '', '0', '83', null, 'State', 'normal', null, '528', '2017-06-25 14:19:07', null, null);
INSERT INTO `metabase_field` VALUES ('532', '2017-06-22 10:47:12', '2017-06-22 10:47:12', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '84', null, 'ID', 'normal', null, '196', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('533', '2017-06-22 10:47:12', '2017-06-22 10:49:35', 'isdel', 'type/Text', 'type/Category', '', null, '', '0', '84', null, 'Is Del', 'normal', null, '197', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('534', '2017-06-22 10:47:12', '2017-06-22 10:49:35', 'opeuid', 'type/Text', 'type/Category', '', null, '', '0', '84', null, 'Op Eu ID', 'normal', null, '198', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('535', '2017-06-22 10:47:12', '2017-06-22 10:49:35', 'pointdesc', 'type/Text', 'type/Category', '', null, '', '0', '84', null, 'Point Desc', 'normal', null, '199', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('536', '2017-06-22 10:47:12', '2017-06-22 10:49:35', 'pointid', 'type/Text', 'type/Category', '', null, '', '0', '84', null, 'Point ID', 'normal', null, '200', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('537', '2017-06-22 10:47:12', '2017-06-22 10:49:36', 'pointnum', 'type/Text', 'type/Category', '', null, '', '0', '84', null, 'Point Num', 'normal', null, '201', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('538', '2017-06-22 10:47:12', '2017-06-22 10:49:36', 'time', 'type/Text', 'type/Category', '', null, '', '0', '84', null, 'Time', 'normal', null, '202', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('539', '2017-06-22 10:47:12', '2017-06-22 10:49:36', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '84', null, 'UID', 'normal', null, '203', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('540', '2017-06-22 10:47:13', '2017-06-22 10:47:13', 'role_code', 'type/Text', 'type/PK', '', null, '', '0', '85', null, 'Role Code', 'normal', null, '358', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('541', '2017-06-22 10:47:13', '2017-06-22 10:49:37', 'role_desc', 'type/Text', 'type/Category', '', null, '', '0', '85', null, 'Role Desc', 'normal', null, '359', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('542', '2017-06-22 10:47:13', '2017-06-22 10:49:37', 'role_name', 'type/Text', 'type/Category', '', null, '', '0', '85', null, 'Role Name', 'normal', null, '360', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('543', '2017-06-22 10:47:13', '2017-06-22 10:49:37', 'role_order', 'type/Integer', 'type/Category', '', null, '', '0', '85', null, 'Role Order', 'normal', null, '361', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('544', '2017-06-22 10:47:13', '2017-06-22 10:47:13', 'role_type', 'type/Integer', 'type/Category', '', null, '', '0', '85', null, 'Role Type', 'normal', null, '362', '2017-06-25 14:19:08', null, null);
INSERT INTO `metabase_field` VALUES ('545', '2017-06-22 10:47:13', '2017-06-22 10:47:13', 'fun_id', 'type/Integer', 'type/PK', '', null, '', '0', '86', null, 'Fun ID', 'normal', null, '790', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('546', '2017-06-22 10:47:13', '2017-06-22 10:49:38', 'module_id', 'type/Text', 'type/Category', '', null, '', '0', '86', null, 'Module ID', 'normal', null, '791', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('547', '2017-06-22 10:47:13', '2017-06-22 10:49:38', 'role_id', 'type/Text', 'type/Category', '', null, '', '0', '86', null, 'Role ID', 'normal', null, '792', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('548', '2017-06-22 10:47:13', '2017-06-22 10:49:38', 'FIELDNAME', 'type/Text', 'type/Category', '', null, '', '0', '87', null, 'Field Name', 'normal', null, '749', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('549', '2017-06-22 10:47:13', '2017-06-22 10:49:39', 'IDTYPE', 'type/Text', 'type/Category', '', null, '', '0', '87', null, 'ID Type', 'normal', null, '750', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('550', '2017-06-22 10:47:13', '2017-06-22 10:49:39', 'MAXID', 'type/Text', 'type/Category', '', null, '', '0', '87', null, 'Max ID', 'normal', null, '751', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('551', '2017-06-22 10:47:13', '2017-06-22 10:49:39', 'PATTERN', 'type/Text', 'type/Category', '', null, '', '0', '87', null, 'Pattern', 'normal', null, '752', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('552', '2017-06-22 10:47:13', '2017-06-22 10:49:39', 'REMARK', 'type/Text', 'type/Category', '', null, '', '0', '87', null, 'Remark', 'normal', null, '753', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('553', '2017-06-22 10:47:14', '2017-06-22 10:47:14', 'SEQUENCEID', 'type/Text', 'type/PK', '', null, '', '0', '87', null, 'Sequence ID', 'normal', null, '754', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('554', '2017-06-22 10:47:14', '2017-06-22 10:47:14', 'glfa', 'type/Integer', null, '', null, '', '0', '88', null, 'Gl Fa', 'normal', null, '604', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('555', '2017-06-22 10:47:14', '2017-06-22 10:47:14', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '88', null, 'ID', 'normal', null, '605', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('556', '2017-06-22 10:47:14', '2017-06-22 10:47:14', 'loopd', 'type/Text', null, '', null, '', '0', '88', null, 'Loo Pd', 'normal', null, '606', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('557', '2017-06-22 10:47:14', '2017-06-22 10:47:14', 'tid', 'type/Integer', null, '', null, '', '0', '88', null, 'Tid', 'normal', null, '607', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('558', '2017-06-22 10:47:14', '2017-06-22 10:47:14', 'xsjy', 'type/Integer', null, '', null, '', '0', '88', null, 'Xs Jy', 'normal', null, '608', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('559', '2017-06-22 10:47:14', '2017-06-22 10:47:14', 'yycd', 'type/Integer', null, '', null, '', '0', '88', null, 'Yy Cd', 'normal', null, '609', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('560', '2017-06-22 10:47:14', '2017-06-22 10:47:14', 'zxbz', 'type/Integer', null, '', null, '', '0', '88', null, 'Zx Bz', 'normal', null, '610', '2017-06-25 14:19:09', null, null);
INSERT INTO `metabase_field` VALUES ('561', '2017-06-22 10:47:15', '2017-06-22 10:49:40', 'giftid', 'type/Text', 'type/Category', '', null, '', '0', '89', null, 'Gift ID', 'normal', null, '693', '2017-06-25 14:19:10', null, null);
INSERT INTO `metabase_field` VALUES ('562', '2017-06-22 10:47:15', '2017-06-22 10:47:15', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '89', null, 'ID', 'normal', null, '694', '2017-06-25 14:19:10', null, null);
INSERT INTO `metabase_field` VALUES ('563', '2017-06-22 10:47:15', '2017-06-22 10:49:41', 'stat', 'type/Text', 'type/Category', '', null, '', '0', '89', null, 'Stat', 'normal', null, '695', '2017-06-25 14:19:10', null, null);
INSERT INTO `metabase_field` VALUES ('564', '2017-06-22 10:47:15', '2017-06-22 10:49:41', 'time', 'type/Text', 'type/Category', '', null, '', '0', '89', null, 'Time', 'normal', null, '696', '2017-06-25 14:19:10', null, null);
INSERT INTO `metabase_field` VALUES ('565', '2017-06-22 10:47:15', '2017-06-22 10:49:41', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '89', null, 'UID', 'normal', null, '697', '2017-06-25 14:19:10', null, null);
INSERT INTO `metabase_field` VALUES ('566', '2017-06-22 10:47:15', '2017-06-22 10:47:15', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '90', null, 'ID', 'normal', null, '623', '2017-06-25 14:19:10', null, null);
INSERT INTO `metabase_field` VALUES ('567', '2017-06-22 10:47:15', '2017-06-22 10:47:15', 'role_id', 'type/Text', null, '', null, '', '0', '90', null, 'Role ID', 'normal', null, '624', '2017-06-25 14:19:10', null, null);
INSERT INTO `metabase_field` VALUES ('568', '2017-06-22 10:47:15', '2017-06-22 10:47:15', 'user_id', 'type/Text', null, '', null, '', '0', '90', null, 'User ID', 'normal', null, '625', '2017-06-25 14:19:10', null, null);
INSERT INTO `metabase_field` VALUES ('569', '2017-06-22 10:47:15', '2017-06-22 10:47:15', 'baseline_end_date', 'type/DateTime', null, '', null, '', '0', '91', null, 'Baseline End Date', 'normal', null, '894', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('570', '2017-06-22 10:47:15', '2017-06-22 10:47:15', 'baseline_start_date', 'type/DateTime', null, '', null, '', '0', '91', null, 'Baseline Start Date', 'normal', null, '895', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('571', '2017-06-22 10:47:16', '2017-06-22 10:49:43', 'checkpass', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Check Pass', 'normal', null, '896', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('572', '2017-06-22 10:47:16', '2017-06-22 10:49:43', 'color', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Color', 'normal', null, '897', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('573', '2017-06-22 10:47:16', '2017-06-22 10:49:43', 'copyFrom', 'type/Integer', 'type/Category', '', null, '', '0', '91', null, 'Copy From', 'normal', null, '898', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('574', '2017-06-22 10:47:16', '2017-06-22 10:49:43', 'duration', 'type/Float', 'type/Category', '', null, '', '0', '91', null, 'Duration', 'normal', null, '899', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('575', '2017-06-22 10:47:16', '2017-06-22 10:49:44', 'duration_unit', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Duration Unit', 'normal', null, '900', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('576', '2017-06-22 10:47:16', '2017-06-22 10:47:16', 'end_date', 'type/DateTime', null, '', null, '', '0', '91', null, 'End Date', 'normal', null, '901', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('577', '2017-06-22 10:47:16', '2017-06-22 10:49:44', 'formType', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Form Type', 'normal', null, '902', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('578', '2017-06-22 10:47:16', '2017-06-22 10:49:44', 'glfanum', 'type/Integer', 'type/Category', '', null, '', '0', '91', null, 'Gl Fa Num', 'normal', null, '903', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('579', '2017-06-22 10:47:16', '2017-06-22 10:49:44', 'guidang', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Gui Dang', 'normal', null, '904', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('580', '2017-06-22 10:47:16', '2017-06-22 10:47:16', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '91', null, 'ID', 'normal', null, '905', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('581', '2017-06-22 10:47:17', '2017-06-22 10:49:44', 'index', 'type/Integer', 'type/Category', '', null, '', '0', '91', null, 'Index', 'normal', null, '906', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('582', '2017-06-22 10:47:17', '2017-06-22 10:49:45', 'loopd', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Loo Pd', 'normal', null, '907', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('583', '2017-06-22 10:47:17', '2017-06-22 10:47:17', 'name', 'type/Text', 'type/Name', '', null, '', '0', '91', null, 'Name', 'normal', null, '908', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('584', '2017-06-22 10:47:17', '2017-06-22 10:49:45', 'note', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Note', 'normal', null, '909', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('585', '2017-06-22 10:47:17', '2017-06-22 10:49:45', 'other_field', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Other Field', 'normal', null, '910', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('586', '2017-06-22 10:47:17', '2017-06-22 10:49:45', 'parent_id', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Parent ID', 'normal', null, '911', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('587', '2017-06-22 10:47:17', '2017-06-22 10:49:45', 'percent_done', 'type/Float', 'type/Category', '', null, '', '0', '91', null, 'Percent Done', 'normal', null, '912', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('588', '2017-06-22 10:47:17', '2017-06-22 10:49:45', 'pid', 'type/Integer', 'type/Category', '', null, '', '0', '91', null, 'Pid', 'normal', null, '913', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('589', '2017-06-22 10:47:17', '2017-06-22 10:49:46', 'pizhu', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Pi Zhu', 'normal', null, '914', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('590', '2017-06-22 10:47:17', '2017-06-22 10:49:46', 'priority', 'type/Integer', 'type/Category', '', null, '', '0', '91', null, 'Priority', 'normal', null, '915', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('591', '2017-06-22 10:47:17', '2017-06-22 10:49:46', 'shy', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Shy', 'normal', null, '916', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('592', '2017-06-22 10:47:17', '2017-06-22 10:47:17', 'start_date', 'type/DateTime', null, '', null, '', '0', '91', null, 'Start Date', 'normal', null, '917', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('593', '2017-06-22 10:47:17', '2017-06-22 10:49:46', 'taskmember', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Task Member', 'normal', null, '918', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('594', '2017-06-22 10:47:17', '2017-06-22 10:49:46', 'wxhs', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Wxhs', 'normal', null, '919', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('595', '2017-06-22 10:47:17', '2017-06-22 10:49:47', 'xsjynum', 'type/Integer', 'type/Category', '', null, '', '0', '91', null, 'Xs Jy Num', 'normal', null, '920', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('596', '2017-06-22 10:47:18', '2017-06-22 10:49:47', 'yqyy', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Y Q Yy', 'normal', null, '921', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('597', '2017-06-22 10:47:18', '2017-06-22 10:49:47', 'yyzj', 'type/Integer', 'type/Category', '', null, '', '0', '91', null, 'Yyzj', 'normal', null, '922', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('598', '2017-06-22 10:47:18', '2017-06-22 10:49:47', 'zxbz', 'type/Text', 'type/Category', '', null, '', '0', '91', null, 'Zx Bz', 'normal', null, '923', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('599', '2017-06-22 10:47:18', '2017-06-22 10:49:47', 'zxbznum', 'type/Integer', 'type/Category', '', null, '', '0', '91', null, 'Zx Bz Num', 'normal', null, '924', '2017-06-25 14:19:13', null, null);
INSERT INTO `metabase_field` VALUES ('600', '2017-06-22 10:47:18', '2017-06-22 10:49:48', 'con', 'type/Text', 'type/Category', '', null, '', '0', '92', null, 'Con', 'normal', null, '204', '2017-06-25 14:19:14', null, null);
INSERT INTO `metabase_field` VALUES ('601', '2017-06-22 10:47:19', '2017-06-22 10:47:19', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '92', null, 'ID', 'normal', null, '205', '2017-06-25 14:19:14', null, null);
INSERT INTO `metabase_field` VALUES ('602', '2017-06-22 10:47:19', '2017-06-22 10:49:48', 'taskid', 'type/Integer', 'type/Category', '', null, '', '0', '92', null, 'Task ID', 'normal', null, '206', '2017-06-25 14:19:14', null, null);
INSERT INTO `metabase_field` VALUES ('603', '2017-06-22 10:47:19', '2017-06-22 10:47:19', 'time', 'type/Text', null, '', null, '', '0', '92', null, 'Time', 'normal', null, '207', '2017-06-25 14:19:14', null, null);
INSERT INTO `metabase_field` VALUES ('604', '2017-06-22 10:47:19', '2017-06-22 10:49:48', 'tp', 'type/Integer', 'type/Category', '', null, '', '0', '92', null, 'Tp', 'normal', null, '208', '2017-06-25 14:19:14', null, null);
INSERT INTO `metabase_field` VALUES ('605', '2017-06-22 10:47:19', '2017-06-22 10:49:48', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '92', null, 'UID', 'normal', null, '209', '2017-06-25 14:19:14', null, null);
INSERT INTO `metabase_field` VALUES ('606', '2017-06-22 10:47:19', '2017-06-22 10:47:19', 'baseline_end_date', 'type/DateTime', null, '', null, '', '0', '93', null, 'Baseline End Date', 'normal', null, '45', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('607', '2017-06-22 10:47:19', '2017-06-22 10:47:19', 'baseline_start_date', 'type/DateTime', null, '', null, '', '0', '93', null, 'Baseline Start Date', 'normal', null, '46', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('608', '2017-06-22 10:47:20', '2017-06-22 10:49:50', 'checkpass', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Check Pass', 'normal', null, '47', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('609', '2017-06-22 10:47:20', '2017-06-22 10:49:50', 'color', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Color', 'normal', null, '48', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('610', '2017-06-22 10:47:20', '2017-06-22 10:49:50', 'copyFrom', 'type/Integer', 'type/Category', '', null, '', '0', '93', null, 'Copy From', 'normal', null, '49', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('611', '2017-06-22 10:47:20', '2017-06-22 10:49:51', 'duration', 'type/Float', 'type/Category', '', null, '', '0', '93', null, 'Duration', 'normal', null, '50', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('612', '2017-06-22 10:47:20', '2017-06-22 10:49:51', 'duration_unit', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Duration Unit', 'normal', null, '51', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('613', '2017-06-22 10:47:20', '2017-06-22 10:47:20', 'end_date', 'type/DateTime', null, '', null, '', '0', '93', null, 'End Date', 'normal', null, '52', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('614', '2017-06-22 10:47:20', '2017-06-22 10:49:51', 'formType', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Form Type', 'normal', null, '53', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('615', '2017-06-22 10:47:20', '2017-06-22 10:49:51', 'guidang', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Gui Dang', 'normal', null, '54', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('616', '2017-06-22 10:47:20', '2017-06-22 10:47:20', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '93', null, 'ID', 'normal', null, '55', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('617', '2017-06-22 10:47:20', '2017-06-22 10:49:51', 'index', 'type/Integer', 'type/Category', '', null, '', '0', '93', null, 'Index', 'normal', null, '56', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('618', '2017-06-22 10:47:20', '2017-06-22 10:49:51', 'loopd', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Loo Pd', 'normal', null, '57', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('619', '2017-06-22 10:47:21', '2017-06-22 10:47:21', 'name', 'type/Text', 'type/Name', '', null, '', '0', '93', null, 'Name', 'normal', null, '58', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('620', '2017-06-22 10:47:21', '2017-06-22 10:49:52', 'note', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Note', 'normal', null, '59', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('621', '2017-06-22 10:47:21', '2017-06-22 10:49:52', 'other_field', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Other Field', 'normal', null, '60', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('622', '2017-06-22 10:47:21', '2017-06-22 10:49:52', 'parent_id', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Parent ID', 'normal', null, '61', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('623', '2017-06-22 10:47:21', '2017-06-22 10:49:52', 'percent_done', 'type/Float', 'type/Category', '', null, '', '0', '93', null, 'Percent Done', 'normal', null, '62', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('624', '2017-06-22 10:47:21', '2017-06-22 10:49:52', 'pid', 'type/Integer', 'type/Category', '', null, '', '0', '93', null, 'Pid', 'normal', null, '63', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('625', '2017-06-22 10:47:21', '2017-06-22 10:49:53', 'pizhu', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Pi Zhu', 'normal', null, '64', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('626', '2017-06-22 10:47:21', '2017-06-22 10:49:53', 'priority', 'type/Integer', 'type/Category', '', null, '', '0', '93', null, 'Priority', 'normal', null, '65', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('627', '2017-06-22 10:47:22', '2017-06-22 10:49:53', 'shy', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Shy', 'normal', null, '66', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('628', '2017-06-22 10:47:22', '2017-06-22 10:47:22', 'start_date', 'type/DateTime', null, '', null, '', '0', '93', null, 'Start Date', 'normal', null, '67', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('629', '2017-06-22 10:47:22', '2017-06-22 10:49:53', 'taskmember', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Task Member', 'normal', null, '68', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('630', '2017-06-22 10:47:22', '2017-06-22 10:49:53', 'wxhs', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Wxhs', 'normal', null, '69', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('631', '2017-06-22 10:47:23', '2017-06-22 10:49:54', 'yqyy', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Y Q Yy', 'normal', null, '70', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('632', '2017-06-22 10:47:23', '2017-06-22 10:49:54', 'zxbz', 'type/Text', 'type/Category', '', null, '', '0', '93', null, 'Zx Bz', 'normal', null, '71', '2017-06-25 14:19:16', null, null);
INSERT INTO `metabase_field` VALUES ('633', '2017-06-22 10:47:23', '2017-06-22 10:47:23', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '94', null, 'ID', 'normal', null, '88', '2017-06-25 14:19:17', null, null);
INSERT INTO `metabase_field` VALUES ('634', '2017-06-22 10:47:23', '2017-06-22 10:49:54', 'ispass', 'type/Integer', 'type/Category', '', null, '', '0', '94', null, 'Is Pass', 'normal', null, '89', '2017-06-25 14:19:17', null, null);
INSERT INTO `metabase_field` VALUES ('635', '2017-06-22 10:47:23', '2017-06-22 10:49:55', 'rollback', 'type/Integer', 'type/Category', '', null, '', '0', '94', null, 'Rollback', 'normal', null, '90', '2017-06-25 14:19:17', null, null);
INSERT INTO `metabase_field` VALUES ('636', '2017-06-22 10:47:23', '2017-06-22 10:49:55', 'shyid', 'type/Text', 'type/Category', '', null, '', '0', '94', null, 'Shy ID', 'normal', null, '91', '2017-06-25 14:19:17', null, null);
INSERT INTO `metabase_field` VALUES ('637', '2017-06-22 10:47:23', '2017-06-22 10:49:55', 'taskid', 'type/Text', 'type/Category', '', null, '', '0', '94', null, 'Task ID', 'normal', null, '92', '2017-06-25 14:19:17', null, null);
INSERT INTO `metabase_field` VALUES ('638', '2017-06-22 10:47:23', '2017-06-22 10:47:23', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '95', null, 'ID', 'normal', null, '888', '2017-06-25 14:19:17', null, null);
INSERT INTO `metabase_field` VALUES ('639', '2017-06-22 10:47:23', '2017-06-22 10:49:56', 'isclose', 'type/Text', 'type/Category', '', null, '', '0', '95', null, 'Is Close', 'normal', null, '889', '2017-06-25 14:19:17', null, null);
INSERT INTO `metabase_field` VALUES ('640', '2017-06-22 10:47:24', '2017-06-22 10:49:56', 'loopd', 'type/Text', 'type/Category', '', null, '', '0', '95', null, 'Loo Pd', 'normal', null, '890', '2017-06-25 14:19:17', null, null);
INSERT INTO `metabase_field` VALUES ('641', '2017-06-22 10:47:24', '2017-06-22 10:49:56', 'pid', 'type/Text', 'type/Category', '', null, '', '0', '95', null, 'Pid', 'normal', null, '891', '2017-06-25 14:19:17', null, null);
INSERT INTO `metabase_field` VALUES ('642', '2017-06-22 10:47:24', '2017-06-22 10:47:24', 'taskid', 'type/Integer', 'type/PK', '', null, '', '0', '95', null, 'Task ID', 'normal', null, '892', '2017-06-25 14:19:17', null, null);
INSERT INTO `metabase_field` VALUES ('643', '2017-06-22 10:47:24', '2017-06-22 10:49:56', 'taskmember', 'type/Text', 'type/Category', '', null, '', '0', '95', null, 'Task Member', 'normal', null, '893', '2017-06-25 14:19:17', null, null);
INSERT INTO `metabase_field` VALUES ('644', '2017-06-22 10:47:24', '2017-06-22 10:49:57', 'addtime', 'type/Text', 'type/Category', '', null, '', '0', '96', null, 'Add Time', 'normal', null, '418', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('645', '2017-06-22 10:47:24', '2017-06-22 10:49:57', 'djl', 'type/Text', 'type/Category', '', null, '', '0', '96', null, 'Djl', 'normal', null, '419', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('646', '2017-06-22 10:47:24', '2017-06-22 10:49:58', 'ggf', 'type/Text', 'type/Category', '', null, '', '0', '96', null, 'Ggf', 'normal', null, '420', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('647', '2017-06-22 10:47:24', '2017-06-22 10:47:24', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '96', null, 'ID', 'normal', null, '421', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('648', '2017-06-22 10:47:24', '2017-06-22 10:49:58', 'pid', 'type/Text', 'type/Category', '', null, '', '0', '96', null, 'Pid', 'normal', null, '422', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('649', '2017-06-22 10:47:24', '2017-06-22 10:49:58', 'taskid', 'type/Text', 'type/Category', '', null, '', '0', '96', null, 'Task ID', 'normal', null, '423', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('650', '2017-06-22 10:47:24', '2017-06-22 10:49:58', 'tgid', 'type/Text', 'type/Category', '', null, '', '0', '96', null, 'Tg ID', 'normal', null, '424', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('651', '2017-06-22 10:47:25', '2017-06-22 10:49:58', 'tid', 'type/Text', 'type/Category', '', null, '', '0', '96', null, 'Tid', 'normal', null, '425', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('652', '2017-06-22 10:47:25', '2017-06-22 10:49:58', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '96', null, 'UID', 'normal', null, '426', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('653', '2017-06-22 10:47:25', '2017-06-22 10:49:58', 'zsl', 'type/Text', 'type/Category', '', null, '', '0', '96', null, 'Zsl', 'normal', null, '427', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('654', '2017-06-22 10:47:25', '2017-06-22 10:47:25', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '97', null, 'ID', 'normal', null, '691', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('655', '2017-06-22 10:47:25', '2017-06-22 10:49:59', 'projname', 'type/Text', 'type/Category', '', null, '', '0', '97', null, 'Pr Oj Name', 'normal', null, '692', '2017-06-25 14:19:19', null, null);
INSERT INTO `metabase_field` VALUES ('656', '2017-06-22 10:47:25', '2017-06-22 10:50:01', 'addtime', 'type/Text', 'type/Category', '', null, '', '0', '98', null, 'Add Time', 'normal', null, '543', '2017-06-25 14:19:20', null, null);
INSERT INTO `metabase_field` VALUES ('657', '2017-06-22 10:47:25', '2017-06-22 10:47:25', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '98', null, 'ID', 'normal', null, '544', '2017-06-25 14:19:20', null, null);
INSERT INTO `metabase_field` VALUES ('658', '2017-06-22 10:47:25', '2017-06-22 10:50:01', 'mtbm', 'type/Text', 'type/Category', '', null, '', '0', '98', null, 'Mt Bm', 'normal', null, '545', '2017-06-25 14:19:20', null, null);
INSERT INTO `metabase_field` VALUES ('659', '2017-06-22 10:47:25', '2017-06-22 10:50:01', 'mtzh', 'type/Text', 'type/Category', '', null, '', '0', '98', null, 'Mt Zh', 'normal', null, '546', '2017-06-25 14:19:20', null, null);
INSERT INTO `metabase_field` VALUES ('660', '2017-06-22 10:47:25', '2017-06-22 10:50:01', 'projid', 'type/Text', 'type/Category', '', null, '', '0', '98', null, 'Pro Jid', 'normal', null, '547', '2017-06-25 14:19:20', null, null);
INSERT INTO `metabase_field` VALUES ('661', '2017-06-22 10:47:25', '2017-06-22 10:50:02', 'taskid', 'type/Text', 'type/Category', '', null, '', '0', '98', null, 'Task ID', 'normal', null, '548', '2017-06-25 14:19:20', null, null);
INSERT INTO `metabase_field` VALUES ('662', '2017-06-22 10:47:25', '2017-06-22 10:50:02', 'tgproj', 'type/Text', 'type/Category', '', null, '', '0', '98', null, 'Tg Pr Oj', 'normal', null, '549', '2017-06-25 14:19:20', null, null);
INSERT INTO `metabase_field` VALUES ('663', '2017-06-22 10:47:26', '2017-06-22 10:50:02', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '98', null, 'UID', 'normal', null, '550', '2017-06-25 14:19:20', null, null);
INSERT INTO `metabase_field` VALUES ('664', '2017-06-22 10:47:26', '2017-06-22 10:50:03', 'waid', 'type/Text', 'type/Category', '', null, '', '0', '98', null, 'Wa ID', 'normal', null, '551', '2017-06-25 14:19:20', null, null);
INSERT INTO `metabase_field` VALUES ('665', '2017-06-22 10:47:26', '2017-06-22 10:47:26', 'email', 'type/Text', null, '', null, '', '0', '99', null, 'Email', 'normal', null, '847', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('666', '2017-06-22 10:47:26', '2017-06-22 10:47:26', 'fsl', 'type/Integer', null, '', null, '', '0', '99', null, 'Fsl', 'normal', null, '848', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('667', '2017-06-22 10:47:26', '2017-06-22 10:47:26', 'imgurl', 'type/Text', null, '', null, '', '0', '99', null, 'Img URL', 'normal', null, '849', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('668', '2017-06-22 10:47:26', '2017-06-22 10:50:03', 'jid', 'type/Text', 'type/Category', '', null, '', '0', '99', null, 'Jid', 'normal', null, '850', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('669', '2017-06-22 10:47:26', '2017-06-22 10:50:04', 'kfzh', 'type/Text', 'type/Category', '', null, '', '0', '99', null, 'Kf Zh', 'normal', null, '851', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('670', '2017-06-22 10:47:26', '2017-06-22 10:50:04', 'login_num', 'type/Integer', 'type/Category', '', null, '', '0', '99', null, 'Login Num', 'normal', null, '852', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('671', '2017-06-22 10:47:27', '2017-06-22 10:47:27', 'nick_name', 'type/Text', null, '', null, '', '0', '99', null, 'Nick Name', 'normal', null, '853', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('672', '2017-06-22 10:47:27', '2017-06-22 10:50:04', 'point', 'type/Integer', 'type/Category', '', null, '', '0', '99', null, 'Point', 'normal', null, '854', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('673', '2017-06-22 10:47:27', '2017-06-22 10:50:05', 'qq_num', 'type/Text', 'type/Category', '', null, '', '0', '99', null, 'Qq Num', 'normal', null, '855', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('674', '2017-06-22 10:47:27', '2017-06-22 10:47:27', 'sex', 'type/Text', 'type/Category', '', null, '', '0', '99', null, 'Sex', 'normal', null, '856', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('675', '2017-06-22 10:47:27', '2017-06-22 10:50:05', 'telephone', 'type/Text', 'type/Category', '', null, '', '0', '99', null, 'Telephone', 'normal', null, '857', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('676', '2017-06-22 10:47:27', '2017-06-22 10:47:27', 'user_id', 'type/Text', 'type/PK', '', null, '', '0', '99', null, 'User ID', 'normal', null, '858', '2017-06-25 14:19:21', null, null);
INSERT INTO `metabase_field` VALUES ('677', '2017-06-22 10:47:27', '2017-06-22 10:47:27', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '100', null, 'ID', 'normal', null, '804', '2017-06-25 14:19:22', null, null);
INSERT INTO `metabase_field` VALUES ('678', '2017-06-22 10:47:27', '2017-06-22 10:47:27', 'tid', 'type/Text', null, '', null, '', '0', '100', null, 'Tid', 'normal', null, '805', '2017-06-25 14:19:22', null, null);
INSERT INTO `metabase_field` VALUES ('679', '2017-06-22 10:47:27', '2017-06-22 10:47:27', 'tp', 'type/Text', null, '', null, '', '0', '100', null, 'Tp', 'normal', null, '806', '2017-06-25 14:19:22', null, null);
INSERT INTO `metabase_field` VALUES ('680', '2017-06-22 10:47:28', '2017-06-22 10:47:28', 'uid', 'type/Text', null, '', null, '', '0', '100', null, 'UID', 'normal', null, '807', '2017-06-25 14:19:22', null, null);
INSERT INTO `metabase_field` VALUES ('681', '2017-06-22 10:47:28', '2017-06-22 10:50:46', 'account', 'type/Text', 'type/Category', '', null, '', '0', '101', null, 'Account', 'normal', null, '154', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('682', '2017-06-22 10:47:28', '2017-06-22 10:47:28', 'device_uuid', 'type/Text', null, '', null, '', '0', '101', null, 'Device UUID', 'normal', null, '155', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('683', '2017-06-22 10:47:28', '2017-06-22 10:50:46', 'enabled', 'type/Integer', 'type/Category', '', null, '', '0', '101', null, 'Enabled', 'normal', null, '156', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('684', '2017-06-22 10:47:28', '2017-06-22 10:50:47', 'imgurl', 'type/Text', 'type/Category', '', null, '', '0', '101', null, 'Img URL', 'normal', null, '157', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('685', '2017-06-22 10:47:28', '2017-06-22 10:47:28', 'login_time', 'type/DateTime', null, '', null, '', '0', '101', null, 'Login Time', 'normal', null, '158', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('686', '2017-06-22 10:47:28', '2017-06-22 10:50:47', 'macaddr', 'type/Text', 'type/Category', '', null, '', '0', '101', null, 'Maca Ddr', 'normal', null, '159', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('687', '2017-06-22 10:47:28', '2017-06-22 10:50:47', 'password', 'type/Text', 'type/Category', '', null, '', '0', '101', null, 'Password', 'normal', null, '160', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('688', '2017-06-22 10:47:28', '2017-06-22 10:50:48', 'remark', 'type/Text', 'type/Category', '', null, '', '0', '101', null, 'Remark', 'normal', null, '161', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('689', '2017-06-22 10:47:28', '2017-06-22 10:50:49', 'role_id', 'type/Integer', 'type/Category', '', null, '', '0', '101', null, 'Role ID', 'normal', null, '162', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('690', '2017-06-22 10:47:29', '2017-06-22 10:47:29', 'user_id', 'type/Text', 'type/PK', '', null, '', '0', '101', null, 'User ID', 'normal', null, '163', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('691', '2017-06-22 10:47:29', '2017-06-22 10:50:49', 'user_name', 'type/Text', 'type/Category', '', null, '', '0', '101', null, 'User Name', 'normal', null, '164', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('692', '2017-06-22 10:47:29', '2017-06-22 10:47:29', 'user_type', 'type/Integer', 'type/Category', '', null, '', '0', '101', null, 'User Type', 'normal', null, '165', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('693', '2017-06-22 10:47:29', '2017-06-22 10:47:29', 'order_id', 'type/Integer', null, '', null, '', '0', '102', null, 'Order ID', 'normal', null, '338', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('694', '2017-06-22 10:47:29', '2017-06-22 10:47:29', 'reply_id', 'type/Integer', 'type/PK', '', null, '', '0', '102', null, 'Reply ID', 'normal', null, '339', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('695', '2017-06-22 10:47:29', '2017-06-22 10:47:29', 'reply_num', 'type/Text', null, '', null, '', '0', '102', null, 'Reply Num', 'normal', null, '340', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('696', '2017-06-22 10:47:29', '2017-06-22 10:47:29', 'reply_text', 'type/Text', null, '', null, '', '0', '102', null, 'Reply Text', 'normal', null, '341', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('697', '2017-06-22 10:47:29', '2017-06-22 10:47:29', 'reply_time', 'type/DateTime', null, '', null, '', '0', '102', null, 'Reply Time', 'normal', null, '342', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('698', '2017-06-22 10:47:29', '2017-06-22 10:47:29', 'state_id', 'type/Integer', null, '', null, '', '0', '102', null, 'State ID', 'normal', null, '343', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('699', '2017-06-22 10:47:29', '2017-06-22 10:47:29', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '103', null, 'ID', 'normal', null, '398', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('700', '2017-06-22 10:47:29', '2017-06-22 10:47:29', 'projid', 'type/Text', null, '', null, '', '0', '103', null, 'Pro Jid', 'normal', null, '399', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('701', '2017-06-22 10:47:30', '2017-06-22 10:47:30', 'taskid', 'type/Text', null, '', null, '', '0', '103', null, 'Task ID', 'normal', null, '400', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('702', '2017-06-22 10:47:30', '2017-06-22 10:47:30', 'time', 'type/Text', null, '', null, '', '0', '103', null, 'Time', 'normal', null, '401', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('703', '2017-06-22 10:47:30', '2017-06-22 10:47:30', 'uid', 'type/Text', null, '', null, '', '0', '103', null, 'UID', 'normal', null, '402', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('704', '2017-06-22 10:47:30', '2017-06-22 10:47:30', '字段1', 'type/Text', null, '', null, '', '0', '103', null, '字段1', 'normal', null, '403', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('705', '2017-06-22 10:47:30', '2017-06-22 10:47:30', '字段2', 'type/Text', null, '', null, '', '0', '103', null, '字段2', 'normal', null, '404', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('706', '2017-06-22 10:47:30', '2017-06-22 10:47:30', '字段3', 'type/Text', null, '', null, '', '0', '103', null, '字段3', 'normal', null, '405', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('707', '2017-06-22 10:47:30', '2017-06-22 10:47:30', '字段4', 'type/Text', null, '', null, '', '0', '103', null, '字段4', 'normal', null, '406', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('708', '2017-06-22 10:47:30', '2017-06-22 10:47:30', '字段5', 'type/Text', null, '', null, '', '0', '103', null, '字段5', 'normal', null, '407', '2017-06-25 14:19:23', null, null);
INSERT INTO `metabase_field` VALUES ('709', '2017-06-22 10:47:30', '2017-06-22 10:47:30', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '104', null, 'ID', 'retired', null, '569', '2017-06-25 14:19:24', null, null);
INSERT INTO `metabase_field` VALUES ('710', '2017-06-22 10:47:30', '2017-06-22 10:50:53', 'projid', 'type/Text', 'type/Category', '', null, '', '0', '104', null, 'Pro Jid', 'retired', null, '570', '2017-06-25 14:19:24', null, null);
INSERT INTO `metabase_field` VALUES ('711', '2017-06-22 10:47:30', '2017-06-22 10:50:54', 'taskid', 'type/Text', 'type/Category', '', null, '', '0', '104', null, 'Task ID', 'retired', null, '571', '2017-06-25 14:19:24', null, null);
INSERT INTO `metabase_field` VALUES ('712', '2017-06-22 10:47:31', '2017-06-22 10:50:55', 'time', 'type/Text', 'type/Category', '', null, '', '0', '104', null, 'Time', 'retired', null, '572', '2017-06-25 14:19:24', null, null);
INSERT INTO `metabase_field` VALUES ('713', '2017-06-22 10:47:31', '2017-06-22 10:50:55', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '104', null, 'UID', 'retired', null, '573', '2017-06-25 14:19:24', null, null);
INSERT INTO `metabase_field` VALUES ('714', '2017-06-22 10:47:31', '2017-06-22 10:50:56', '字段1', 'type/Text', 'type/Category', '', null, '', '0', '104', null, '字段1', 'retired', null, '574', '2017-06-25 14:19:24', null, null);
INSERT INTO `metabase_field` VALUES ('715', '2017-06-22 10:47:31', '2017-06-22 10:50:57', '字段2', 'type/Text', 'type/Category', '', null, '', '0', '104', null, '字段2', 'retired', null, '575', '2017-06-25 14:19:24', null, null);
INSERT INTO `metabase_field` VALUES ('716', '2017-06-22 10:47:31', '2017-06-22 10:47:31', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '105', null, 'ID', 'retired', null, '734', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('717', '2017-06-22 10:47:31', '2017-06-22 10:50:58', 'projid', 'type/Text', 'type/Category', '', null, '', '0', '105', null, 'Pro Jid', 'retired', null, '735', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('718', '2017-06-22 10:47:31', '2017-06-22 10:50:59', 'taskid', 'type/Text', 'type/Category', '', null, '', '0', '105', null, 'Task ID', 'retired', null, '736', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('719', '2017-06-22 10:47:31', '2017-06-22 10:50:59', 'time', 'type/Text', 'type/Category', '', null, '', '0', '105', null, 'Time', 'retired', null, '737', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('720', '2017-06-22 10:47:32', '2017-06-22 10:50:59', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '105', null, 'UID', 'retired', null, '738', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('721', '2017-06-22 10:47:32', '2017-06-22 10:50:59', '微信号', 'type/Text', 'type/Category', '', null, '', '0', '105', null, '微信号', 'retired', null, '739', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('722', '2017-06-22 10:47:32', '2017-06-22 10:51:00', '成交额', 'type/Text', 'type/Category', '', null, '', '0', '105', null, '成交额', 'retired', null, '740', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('723', '2017-06-22 10:47:32', '2017-06-22 10:51:00', '转化周期', 'type/Text', 'type/Category', '', null, '', '0', '105', null, '转化周期', 'retired', null, '741', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('724', '2017-06-22 10:47:32', '2017-06-22 10:47:32', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '106', null, 'ID', 'normal', null, '108', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('725', '2017-06-22 10:47:32', '2017-06-22 10:51:01', 'taskname', 'type/Text', 'type/Category', '', null, '', '0', '106', null, 'Task Name', 'normal', null, '109', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('726', '2017-06-22 10:47:32', '2017-06-22 10:51:01', 'tid', 'type/Integer', 'type/Category', '', null, '', '0', '106', null, 'Tid', 'normal', null, '110', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('727', '2017-06-22 10:47:32', '2017-06-22 10:51:01', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '106', null, 'UID', 'normal', null, '111', '2017-06-25 14:19:25', null, null);
INSERT INTO `metabase_field` VALUES ('728', '2017-06-22 10:47:32', '2017-06-22 10:47:32', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '107', null, 'ID', 'normal', null, '842', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('729', '2017-06-22 10:47:33', '2017-06-22 10:51:02', 'pid', 'type/Text', 'type/Category', '', null, '', '0', '107', null, 'Pid', 'normal', null, '843', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('730', '2017-06-22 10:47:33', '2017-06-22 10:51:02', 'tid', 'type/Integer', 'type/Category', '', null, '', '0', '107', null, 'Tid', 'normal', null, '844', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('731', '2017-06-22 10:47:33', '2017-06-22 10:51:03', 'tp', 'type/Text', 'type/Category', '', null, '', '0', '107', null, 'Tp', 'normal', null, '845', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('732', '2017-06-22 10:47:33', '2017-06-22 10:51:03', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '107', null, 'UID', 'normal', null, '846', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('733', '2017-06-22 10:47:33', '2017-06-22 10:47:33', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '108', null, 'ID', 'normal', null, '968', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('734', '2017-06-22 10:47:33', '2017-06-22 10:51:05', 'stat', 'type/Text', 'type/Category', '', null, '', '0', '108', null, 'Stat', 'normal', null, '969', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('735', '2017-06-22 10:47:33', '2017-06-22 10:51:05', 'tb', 'type/Text', 'type/Category', '', null, '', '0', '108', null, 'Tb', 'normal', null, '970', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('736', '2017-06-22 10:47:33', '2017-06-22 10:51:05', 'time', 'type/Text', 'type/Category', '', null, '', '0', '108', null, 'Time', 'normal', null, '971', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('737', '2017-06-22 10:47:33', '2017-06-22 10:51:05', 'tn', 'type/Text', 'type/Category', '', null, '', '0', '108', null, 'Tn', 'normal', null, '972', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('738', '2017-06-22 10:47:33', '2017-06-22 10:51:06', 'uname', 'type/Text', 'type/Category', '', null, '', '0', '108', null, 'U Name', 'normal', null, '973', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('739', '2017-06-22 10:47:33', '2017-06-22 10:51:06', 'zs', 'type/Text', 'type/Category', '', null, '', '0', '108', null, 'Zs', 'normal', null, '974', '2017-06-25 14:19:26', null, null);
INSERT INTO `metabase_field` VALUES ('740', '2017-06-22 10:47:34', '2017-06-22 10:47:34', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '109', null, 'ID', 'normal', null, '181', '2017-06-25 14:19:27', null, null);
INSERT INTO `metabase_field` VALUES ('741', '2017-06-22 10:47:34', '2017-06-22 10:47:34', 'openid', 'type/Text', null, '', null, '', '0', '109', null, 'Open ID', 'normal', null, '182', '2017-06-25 14:19:27', null, null);
INSERT INTO `metabase_field` VALUES ('742', '2017-06-22 10:47:34', '2017-06-22 10:47:34', 'visitlink', 'type/Text', null, '', null, '', '0', '109', null, 'Visit Link', 'normal', null, '183', '2017-06-25 14:19:27', null, null);
INSERT INTO `metabase_field` VALUES ('743', '2017-06-22 10:47:34', '2017-06-22 10:47:34', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '110', null, 'ID', 'normal', null, '184', '2017-06-25 14:19:27', null, null);
INSERT INTO `metabase_field` VALUES ('744', '2017-06-22 10:47:34', '2017-06-22 10:51:08', 'openID', 'type/Text', 'type/Category', '', null, '', '0', '110', null, 'Open ID', 'normal', null, '185', '2017-06-25 14:19:27', null, null);
INSERT INTO `metabase_field` VALUES ('745', '2017-06-22 10:47:34', '2017-06-22 10:51:08', 'parentCode', 'type/Text', 'type/Category', '', null, '', '0', '110', null, 'Parent Code', 'normal', null, '186', '2017-06-25 14:19:27', null, null);
INSERT INTO `metabase_field` VALUES ('746', '2017-06-22 10:47:34', '2017-06-22 10:51:08', 'time', 'type/Text', 'type/Category', '', null, '', '0', '110', null, 'Time', 'normal', null, '187', '2017-06-25 14:19:27', null, null);
INSERT INTO `metabase_field` VALUES ('747', '2017-06-22 10:47:34', '2017-06-22 10:51:10', 'addtime', 'type/Text', 'type/Category', '', null, '', '0', '111', null, 'Add Time', 'normal', null, '614', '2017-06-25 14:19:28', null, null);
INSERT INTO `metabase_field` VALUES ('748', '2017-06-22 10:47:34', '2017-06-22 10:47:34', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '111', null, 'ID', 'normal', null, '615', '2017-06-25 14:19:28', null, null);
INSERT INTO `metabase_field` VALUES ('749', '2017-06-22 10:47:34', '2017-06-22 10:51:10', 'nrmd', 'type/Text', 'type/Category', '', null, '', '0', '111', null, 'Nr Md', 'normal', null, '616', '2017-06-25 14:19:28', null, null);
INSERT INTO `metabase_field` VALUES ('750', '2017-06-22 10:47:34', '2017-06-22 10:51:10', 'proj', 'type/Text', 'type/Category', '', null, '', '0', '111', null, 'Pr Oj', 'normal', null, '617', '2017-06-25 14:19:28', null, null);
INSERT INTO `metabase_field` VALUES ('751', '2017-06-22 10:47:35', '2017-06-22 10:51:10', 'projid', 'type/Text', 'type/Category', '', null, '', '0', '111', null, 'Pro Jid', 'normal', null, '618', '2017-06-25 14:19:28', null, null);
INSERT INTO `metabase_field` VALUES ('752', '2017-06-22 10:47:35', '2017-06-22 10:51:11', 'taskid', 'type/Text', 'type/Category', '', null, '', '0', '111', null, 'Task ID', 'normal', null, '619', '2017-06-25 14:19:28', null, null);
INSERT INTO `metabase_field` VALUES ('753', '2017-06-22 10:47:35', '2017-06-22 10:51:11', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '111', null, 'UID', 'normal', null, '620', '2017-06-25 14:19:28', null, null);
INSERT INTO `metabase_field` VALUES ('754', '2017-06-22 10:47:35', '2017-06-22 10:51:11', 'watime', 'type/Text', 'type/Category', '', null, '', '0', '111', null, 'Wa Time', 'normal', null, '621', '2017-06-25 14:19:28', null, null);
INSERT INTO `metabase_field` VALUES ('755', '2017-06-22 10:47:35', '2017-06-22 10:51:11', 'watype', 'type/Text', 'type/Category', '', null, '', '0', '111', null, 'Wa Type', 'normal', null, '622', '2017-06-25 14:19:28', null, null);
INSERT INTO `metabase_field` VALUES ('756', '2017-06-22 10:47:35', '2017-06-22 10:47:35', 'channel_id', 'type/Integer', 'type/PK', '', null, '', '0', '112', null, 'Channel ID', 'normal', null, '285', '2017-06-25 14:19:29', null, null);
INSERT INTO `metabase_field` VALUES ('757', '2017-06-22 10:47:35', '2017-06-22 10:51:12', 'channel_name', 'type/Text', 'type/Category', '', null, '', '0', '112', null, 'Channel Name', 'normal', null, '286', '2017-06-25 14:19:29', null, null);
INSERT INTO `metabase_field` VALUES ('758', '2017-06-22 10:47:35', '2017-06-22 10:51:12', 'channel_txt', 'type/Text', 'type/Category', '', null, '', '0', '112', null, 'Channel Txt', 'normal', null, '287', '2017-06-25 14:19:29', null, null);
INSERT INTO `metabase_field` VALUES ('759', '2017-06-22 10:47:35', '2017-06-22 10:51:13', 'channel_uid', 'type/Text', 'type/Category', '', null, '', '0', '112', null, 'Channel UID', 'normal', null, '288', '2017-06-25 14:19:29', null, null);
INSERT INTO `metabase_field` VALUES ('760', '2017-06-22 10:47:36', '2017-06-22 10:47:36', 'charge_id', 'type/Text', 'type/PK', '', null, '', '0', '113', null, 'Charge ID', 'normal', null, '438', '2017-06-25 14:19:30', null, null);
INSERT INTO `metabase_field` VALUES ('761', '2017-06-22 10:47:36', '2017-06-22 10:47:36', 'charge_money', 'type/Float', null, '', null, '', '0', '113', null, 'Charge Money', 'normal', null, '439', '2017-06-25 14:19:30', null, null);
INSERT INTO `metabase_field` VALUES ('762', '2017-06-22 10:47:36', '2017-06-22 10:47:36', 'charge_time', 'type/DateTime', null, '', null, '', '0', '113', null, 'Charge Time', 'normal', null, '440', '2017-06-25 14:19:30', null, null);
INSERT INTO `metabase_field` VALUES ('763', '2017-06-22 10:47:36', '2017-06-22 10:47:36', 'customer_id', 'type/Text', null, '', null, '', '0', '113', null, 'Customer ID', 'normal', null, '441', '2017-06-25 14:19:30', null, null);
INSERT INTO `metabase_field` VALUES ('764', '2017-06-22 10:47:36', '2017-06-22 10:47:36', 'state', 'type/Integer', null, '', null, '', '0', '113', null, 'State', 'normal', null, '442', '2017-06-25 14:19:30', null, null);
INSERT INTO `metabase_field` VALUES ('765', '2017-06-22 10:47:36', '2017-06-22 10:51:15', 'acc_balance', 'type/Float', 'type/Category', '', null, '', '0', '114', null, 'Acc Balance', 'normal', null, '345', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('766', '2017-06-22 10:47:36', '2017-06-22 10:47:36', 'createtime', 'type/DateTime', null, '', null, '', '0', '114', null, 'Create Time', 'normal', null, '346', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('767', '2017-06-22 10:47:36', '2017-06-22 10:47:36', 'customer_id', 'type/Text', 'type/PK', '', null, '', '0', '114', null, 'Customer ID', 'normal', null, '347', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('768', '2017-06-22 10:47:36', '2017-06-22 10:51:15', 'customer_name', 'type/Text', 'type/Category', '', null, '', '0', '114', null, 'Customer Name', 'normal', null, '348', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('769', '2017-06-22 10:47:37', '2017-06-22 10:51:15', 'level', 'type/Integer', 'type/Category', '', null, '', '0', '114', null, 'Level', 'normal', null, '349', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('770', '2017-06-22 10:47:37', '2017-06-22 10:51:16', 'login_name', 'type/Text', 'type/Category', '', null, '', '0', '114', null, 'Login Name', 'normal', null, '350', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('771', '2017-06-22 10:47:37', '2017-06-22 10:51:16', 'login_pwd', 'type/Text', 'type/Category', '', null, '', '0', '114', null, 'Login Pwd', 'normal', null, '351', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('772', '2017-06-22 10:47:37', '2017-06-22 10:51:16', 'phone', 'type/Text', 'type/Category', '', null, '', '0', '114', null, 'Phone', 'normal', null, '352', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('773', '2017-06-22 10:47:37', '2017-06-22 10:51:17', 'QQ', 'type/Text', 'type/Category', '', null, '', '0', '114', null, 'Qq', 'normal', null, '344', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('774', '2017-06-22 10:47:37', '2017-06-22 10:51:17', 'state', 'type/Integer', 'type/Category', '', null, '', '0', '114', null, 'State', 'normal', null, '353', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('775', '2017-06-22 10:47:37', '2017-06-22 10:47:37', 'update_time', 'type/DateTime', null, '', null, '', '0', '114', null, 'Update Time', 'normal', null, '354', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('776', '2017-06-22 10:47:37', '2017-06-22 10:51:17', 'wxh', 'type/Text', 'type/Category', '', null, '', '0', '114', null, 'Wxh', 'normal', null, '355', '2017-06-25 14:19:31', null, null);
INSERT INTO `metabase_field` VALUES ('777', '2017-06-22 10:47:37', '2017-06-22 10:51:20', 'copy_desc', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Copy Desc', 'normal', null, '363', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('778', '2017-06-22 10:47:37', '2017-06-22 10:51:20', 'copy_ids', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Copy Ids', 'normal', null, '364', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('779', '2017-06-22 10:47:38', '2017-06-22 10:51:21', 'courier_money', 'type/Integer', 'type/Category', '', null, '', '0', '115', null, 'Courier Money', 'normal', null, '365', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('780', '2017-06-22 10:47:38', '2017-06-22 10:47:38', 'create_time', 'type/DateTime', null, '', null, '', '0', '115', null, 'Create Time', 'normal', null, '366', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('781', '2017-06-22 10:47:38', '2017-06-22 10:51:21', 'customer_id', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Customer ID', 'normal', null, '367', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('782', '2017-06-22 10:47:38', '2017-06-22 10:51:21', 'forward_link', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Forward Link', 'normal', null, '368', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('783', '2017-06-22 10:47:38', '2017-06-22 10:47:38', 'good_id', 'type/Text', 'type/PK', '', null, '', '0', '115', null, 'Good ID', 'normal', null, '369', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('784', '2017-06-22 10:47:38', '2017-06-22 10:51:21', 'good_name', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Good Name', 'normal', null, '370', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('785', '2017-06-22 10:47:38', '2017-06-22 10:51:21', 'good_pic', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Good Pic', 'normal', null, '371', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('786', '2017-06-22 10:47:38', '2017-06-22 10:51:22', 'good_pic1', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Good Pic1', 'normal', null, '372', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('787', '2017-06-22 10:47:38', '2017-06-22 10:51:22', 'good_pic2', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Good Pic2', 'normal', null, '373', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('788', '2017-06-22 10:47:38', '2017-06-22 10:51:23', 'good_value', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Good Value', 'normal', null, '374', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('789', '2017-06-22 10:47:38', '2017-06-22 10:51:23', 'isgiven', 'type/Integer', 'type/Category', '', null, '', '0', '115', null, 'Is Given', 'normal', null, '375', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('790', '2017-06-22 10:47:39', '2017-06-22 10:51:23', 'order_no', 'type/Integer', 'type/Category', '', null, '', '0', '115', null, 'Order No', 'normal', null, '376', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('791', '2017-06-22 10:47:39', '2017-06-22 10:51:23', 'promote_desc', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Promote Desc', 'normal', null, '377', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('792', '2017-06-22 10:47:39', '2017-06-22 10:51:24', 'recomed', 'type/Integer', 'type/Category', '', null, '', '0', '115', null, 'Re Com Ed', 'normal', null, '378', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('793', '2017-06-22 10:47:39', '2017-06-22 10:47:39', 'recomed_time', 'type/DateTime', null, '', null, '', '0', '115', null, 'Re Com Ed Time', 'normal', null, '379', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('794', '2017-06-22 10:47:39', '2017-06-22 10:51:24', 'sell_num', 'type/Integer', 'type/Category', '', null, '', '0', '115', null, 'Sell Num', 'normal', null, '380', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('795', '2017-06-22 10:47:39', '2017-06-22 10:51:24', 'sku_cost', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Sk U Cost', 'normal', null, '381', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('796', '2017-06-22 10:47:39', '2017-06-22 10:51:24', 'sku_pmoney', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Sk U Pm One Y', 'normal', null, '382', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('797', '2017-06-22 10:47:39', '2017-06-22 10:51:25', 'sku_price', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Sk U Price', 'normal', null, '383', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('798', '2017-06-22 10:47:39', '2017-06-22 10:51:25', 'sku_title', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Sk U Title', 'normal', null, '384', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('799', '2017-06-22 10:47:39', '2017-06-22 10:51:26', 'sms_check', 'type/Integer', 'type/Category', '', null, '', '0', '115', null, 'Sms Check', 'normal', null, '385', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('800', '2017-06-22 10:47:40', '2017-06-22 10:51:26', 'spc_id', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Spc ID', 'normal', null, '386', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('801', '2017-06-22 10:47:40', '2017-06-22 10:51:26', 'state', 'type/Integer', 'type/Category', '', null, '', '0', '115', null, 'State', 'normal', null, '387', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('802', '2017-06-22 10:47:40', '2017-06-22 10:51:27', 'tags', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Tags', 'normal', null, '388', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('803', '2017-06-22 10:47:40', '2017-06-22 10:51:28', 'toped', 'type/Integer', 'type/Category', '', null, '', '0', '115', null, 'To Ped', 'normal', null, '389', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('804', '2017-06-22 10:47:40', '2017-06-22 10:47:40', 'toped_time', 'type/DateTime', null, '', null, '', '0', '115', null, 'To Ped Time', 'normal', null, '390', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('805', '2017-06-22 10:47:40', '2017-06-22 10:51:28', 'type_id', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Type ID', 'normal', null, '391', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('806', '2017-06-22 10:47:40', '2017-06-22 10:51:29', 'zon_id', 'type/Text', 'type/Category', '', null, '', '0', '115', null, 'Zon ID', 'normal', null, '392', '2017-06-25 14:19:33', null, null);
INSERT INTO `metabase_field` VALUES ('807', '2017-06-22 10:47:40', '2017-06-22 10:47:40', 'copy_content', 'type/Text', null, '', null, '', '0', '116', null, 'Copy Content', 'normal', null, '596', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('808', '2017-06-22 10:47:41', '2017-06-22 10:47:41', 'copy_id', 'type/Integer', 'type/PK', '', null, '', '0', '116', null, 'Copy ID', 'normal', null, '597', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('809', '2017-06-22 10:47:41', '2017-06-22 10:51:32', 'copy_link', 'type/Text', 'type/Category', '', null, '', '0', '116', null, 'Copy Link', 'details-only', null, '598', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('810', '2017-06-22 10:47:41', '2017-06-22 10:51:33', 'copy_thumb', 'type/Text', 'type/Category', '', null, '', '0', '116', null, 'Copy Thumb', 'normal', null, '599', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('811', '2017-06-22 10:47:41', '2017-06-22 10:51:33', 'copy_title', 'type/Text', 'type/Category', '', null, '', '0', '116', null, 'Copy Title', 'normal', null, '600', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('812', '2017-06-22 10:47:41', '2017-06-22 10:51:34', 'customer_id', 'type/Text', 'type/Category', '', null, '', '0', '116', null, 'Customer ID', 'normal', null, '601', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('813', '2017-06-22 10:47:41', '2017-06-22 10:51:34', 'order_no', 'type/Integer', 'type/Category', '', null, '', '0', '116', null, 'Order No', 'normal', null, '602', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('814', '2017-06-22 10:47:41', '2017-06-22 10:51:35', 'type_id', 'type/Integer', 'type/Category', '', null, '', '0', '116', null, 'Type ID', 'normal', null, '603', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('815', '2017-06-22 10:47:41', '2017-06-22 10:51:36', 'good_id', 'type/Text', 'type/Category', '', null, '', '0', '117', null, 'Good ID', 'normal', null, '303', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('816', '2017-06-22 10:47:41', '2017-06-22 10:51:37', 'order_no', 'type/Integer', 'type/Category', '', null, '', '0', '117', null, 'Order No', 'normal', null, '304', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('817', '2017-06-22 10:47:41', '2017-06-22 10:51:37', 'service_money', 'type/Text', 'type/Category', '', null, '', '0', '117', null, 'Service Money', 'normal', null, '305', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('818', '2017-06-22 10:47:41', '2017-06-22 10:51:38', 'sku_cost', 'type/Text', 'type/Category', '', null, '', '0', '117', null, 'Sk U Cost', 'normal', null, '306', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('819', '2017-06-22 10:47:41', '2017-06-22 10:47:41', 'sku_id', 'type/Text', 'type/PK', '', null, '', '0', '117', null, 'Sk U ID', 'normal', null, '307', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('820', '2017-06-22 10:47:42', '2017-06-22 10:51:38', 'sku_name', 'type/Text', 'type/Category', '', null, '', '0', '117', null, 'Sk U Name', 'normal', null, '308', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('821', '2017-06-22 10:47:42', '2017-06-22 10:51:39', 'sku_pmoney', 'type/Text', 'type/Category', '', null, '', '0', '117', null, 'Sk U Pm One Y', 'normal', null, '309', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('822', '2017-06-22 10:47:42', '2017-06-22 10:51:39', 'sku_price', 'type/Text', 'type/Category', '', null, '', '0', '117', null, 'Sk U Price', 'normal', null, '310', '2017-06-25 14:19:35', null, null);
INSERT INTO `metabase_field` VALUES ('823', '2017-06-22 10:47:42', '2017-06-22 10:51:40', 'alisa_code', 'type/Text', 'type/Category', '', null, '', '0', '118', null, 'Alisa Code', 'normal', null, '172', '2017-06-25 14:19:36', null, null);
INSERT INTO `metabase_field` VALUES ('824', '2017-06-22 10:47:42', '2017-06-22 10:51:41', 'order_no', 'type/Integer', 'type/Category', '', null, '', '0', '118', null, 'Order No', 'normal', null, '173', '2017-06-25 14:19:36', null, null);
INSERT INTO `metabase_field` VALUES ('825', '2017-06-22 10:47:42', '2017-06-22 10:51:41', 'parent_id', 'type/Text', 'type/Category', '', null, '', '0', '118', null, 'Parent ID', 'normal', null, '174', '2017-06-25 14:19:36', null, null);
INSERT INTO `metabase_field` VALUES ('826', '2017-06-22 10:47:42', '2017-06-22 10:47:42', 'type_id', 'type/Text', 'type/PK', '', null, '', '0', '118', null, 'Type ID', 'normal', null, '175', '2017-06-25 14:19:36', null, null);
INSERT INTO `metabase_field` VALUES ('827', '2017-06-22 10:47:42', '2017-06-22 10:51:42', 'type_name', 'type/Text', 'type/Category', '', null, '', '0', '118', null, 'Type Name', 'normal', null, '176', '2017-06-25 14:19:36', null, null);
INSERT INTO `metabase_field` VALUES ('828', '2017-06-22 10:47:42', '2017-06-22 10:51:42', 'type_tag', 'type/Text', 'type/Category', '', null, '', '0', '118', null, 'Type Tag', 'normal', null, '177', '2017-06-25 14:19:36', null, null);
INSERT INTO `metabase_field` VALUES ('829', '2017-06-22 10:47:42', '2017-06-22 10:51:43', 'ismobile', 'type/Integer', 'type/Category', '', null, '', '0', '119', null, 'Is Mobile', 'normal', null, '455', '2017-06-25 14:19:37', null, null);
INSERT INTO `metabase_field` VALUES ('830', '2017-06-22 10:47:43', '2017-06-22 10:47:43', 'log_type', 'type/Integer', 'type/Category', '', null, '', '0', '119', null, 'Log Type', 'normal', null, '456', '2017-06-25 14:19:37', null, null);
INSERT INTO `metabase_field` VALUES ('831', '2017-06-22 10:47:43', '2017-06-22 10:47:43', 'login_id', 'type/Integer', 'type/PK', '', null, '', '0', '119', null, 'Login ID', 'normal', null, '457', '2017-06-25 14:19:37', null, null);
INSERT INTO `metabase_field` VALUES ('832', '2017-06-22 10:47:43', '2017-06-22 10:51:44', 'login_ip', 'type/Text', 'type/Category', '', null, '', '0', '119', null, 'Login IP', 'normal', null, '458', '2017-06-25 14:19:37', null, null);
INSERT INTO `metabase_field` VALUES ('833', '2017-06-22 10:47:43', '2017-06-22 10:47:43', 'login_time', 'type/DateTime', null, '', null, '', '0', '119', null, 'Login Time', 'normal', null, '459', '2017-06-25 14:19:37', null, null);
INSERT INTO `metabase_field` VALUES ('834', '2017-06-22 10:47:43', '2017-06-22 10:51:44', 'user_id', 'type/Text', 'type/Category', '', null, '', '0', '119', null, 'User ID', 'normal', null, '460', '2017-06-25 14:19:37', null, null);
INSERT INTO `metabase_field` VALUES ('835', '2017-06-22 10:47:43', '2017-06-22 10:51:46', 'account', 'type/Text', 'type/Category', '', null, '', '0', '120', null, 'Account', 'normal', null, '658', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('836', '2017-06-22 10:47:43', '2017-06-22 10:51:46', 'band_modile', 'type/Integer', 'type/Category', '', null, '', '0', '120', null, 'Band Modi Le', 'normal', null, '659', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('837', '2017-06-22 10:47:43', '2017-06-22 10:51:47', 'email', 'type/Text', 'type/Category', '', null, '', '0', '120', null, 'Email', 'normal', null, '660', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('838', '2017-06-22 10:47:43', '2017-06-22 10:51:47', 'level_code', 'type/Text', 'type/Category', '', null, '', '0', '120', null, 'Level Code', 'normal', null, '661', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('839', '2017-06-22 10:47:43', '2017-06-22 10:51:48', 'memeber_id', 'type/Text', 'type/Category', '', null, '', '0', '120', null, 'Meme Ber ID', 'normal', null, '662', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('840', '2017-06-22 10:47:43', '2017-06-22 10:47:43', 'mid', 'type/Integer', 'type/PK', '', null, '', '0', '120', null, 'Mid', 'normal', null, '663', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('841', '2017-06-22 10:47:44', '2017-06-22 10:47:44', 'name', 'type/Text', 'type/Name', '', null, '', '0', '120', null, 'Name', 'normal', null, '664', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('842', '2017-06-22 10:47:44', '2017-06-22 10:51:48', 'password', 'type/Text', 'type/Category', '', null, '', '0', '120', null, 'Password', 'normal', null, '665', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('843', '2017-06-22 10:47:44', '2017-06-22 10:51:49', 'pay_account', 'type/Text', 'type/Category', '', null, '', '0', '120', null, 'Pay Account', 'normal', null, '666', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('844', '2017-06-22 10:47:44', '2017-06-22 10:51:50', 'phone', 'type/Text', 'type/Category', '', null, '', '0', '120', null, 'Phone', 'normal', null, '667', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('845', '2017-06-22 10:47:44', '2017-06-22 10:51:50', 'qq_num', 'type/Text', 'type/Category', '', null, '', '0', '120', null, 'Qq Num', 'normal', null, '668', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('846', '2017-06-22 10:47:44', '2017-06-22 10:51:51', 'recom_user', 'type/Text', 'type/Category', '', null, '', '0', '120', null, 'Re Com User', 'normal', null, '669', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('847', '2017-06-22 10:47:44', '2017-06-22 10:47:44', 'register_time', 'type/DateTime', null, '', null, '', '0', '120', null, 'Register Time', 'normal', null, '670', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('848', '2017-06-22 10:47:44', '2017-06-22 10:47:44', 'update_time', 'type/DateTime', null, '', null, '', '0', '120', null, 'Update Time', 'normal', null, '671', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('849', '2017-06-22 10:47:44', '2017-06-22 10:51:52', 'use_recom', 'type/Integer', 'type/Category', '', null, '', '0', '120', null, 'Use Re Com', 'normal', null, '672', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('850', '2017-06-22 10:47:44', '2017-06-22 10:51:53', 'visit_code', 'type/Text', 'type/Category', '', null, '', '0', '120', null, 'Visit Code', 'normal', null, '673', '2017-06-25 14:19:38', null, null);
INSERT INTO `metabase_field` VALUES ('851', '2017-06-22 10:47:45', '2017-06-22 10:51:54', 'click_num', 'type/Integer', 'type/Category', '', null, '', '0', '121', null, 'Click Num', 'normal', null, '248', '2017-06-25 14:19:42', null, null);
INSERT INTO `metabase_field` VALUES ('852', '2017-06-22 10:47:45', '2017-06-22 10:47:45', 'create_time', 'type/DateTime', null, '', null, '', '0', '121', null, 'Create Time', 'normal', null, '249', '2017-06-25 14:19:42', null, null);
INSERT INTO `metabase_field` VALUES ('853', '2017-06-22 10:47:45', '2017-06-22 10:51:55', 'news_content', 'type/Text', 'type/Category', '', null, '', '0', '121', null, 'News Content', 'details-only', null, '250', '2017-06-25 14:19:42', null, null);
INSERT INTO `metabase_field` VALUES ('854', '2017-06-22 10:47:45', '2017-06-22 10:47:45', 'news_id', 'type/Integer', 'type/PK', '', null, '', '0', '121', null, 'News ID', 'normal', null, '251', '2017-06-25 14:19:42', null, null);
INSERT INTO `metabase_field` VALUES ('855', '2017-06-22 10:47:45', '2017-06-22 10:51:56', 'news_state', 'type/Text', 'type/Category', '', null, '', '0', '121', null, 'News State', 'normal', null, '252', '2017-06-25 14:19:42', null, null);
INSERT INTO `metabase_field` VALUES ('856', '2017-06-22 10:47:45', '2017-06-22 10:51:57', 'news_title', 'type/Text', 'type/Category', '', null, '', '0', '121', null, 'News Title', 'normal', null, '253', '2017-06-25 14:19:42', null, null);
INSERT INTO `metabase_field` VALUES ('857', '2017-06-22 10:47:45', '2017-06-22 10:51:58', 'order_no', 'type/Integer', 'type/Category', '', null, '', '0', '121', null, 'Order No', 'normal', null, '254', '2017-06-25 14:19:42', null, null);
INSERT INTO `metabase_field` VALUES ('858', '2017-06-22 10:47:45', '2017-06-22 10:51:59', 'show_top', 'type/Text', 'type/Category', '', null, '', '0', '121', null, 'Show Top', 'normal', null, '255', '2017-06-25 14:19:42', null, null);
INSERT INTO `metabase_field` VALUES ('859', '2017-06-22 10:47:45', '2017-06-22 10:52:01', 'address', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Address', 'normal', null, '934', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('860', '2017-06-22 10:47:46', '2017-06-22 10:47:46', 'admin_remark', 'type/Text', null, '', null, '', '0', '122', null, 'Admin Remark', 'normal', null, '935', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('861', '2017-06-22 10:47:46', '2017-06-22 10:47:46', 'alipay_state', 'type/*', null, '', null, '', '0', '122', null, 'Ali Pay State', 'normal', null, '936', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('862', '2017-06-22 10:47:46', '2017-06-22 10:52:02', 'area', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Area', 'normal', null, '937', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('863', '2017-06-22 10:47:46', '2017-06-22 10:52:03', 'buy_num', 'type/Integer', 'type/Category', '', null, '', '0', '122', null, 'Buy Num', 'normal', null, '938', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('864', '2017-06-22 10:47:46', '2017-06-22 10:52:04', 'buyer_name', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Buyer Name', 'normal', null, '939', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('865', '2017-06-22 10:47:46', '2017-06-22 10:52:05', 'buyer_phone', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Buyer Phone', 'normal', null, '940', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('866', '2017-06-22 10:47:46', '2017-06-22 10:52:05', 'buyer_reamrk', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Buyer Ream Rk', 'normal', null, '941', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('867', '2017-06-22 10:47:46', '2017-06-22 10:52:05', 'channel_id', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Channel ID', 'normal', null, '942', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('868', '2017-06-22 10:47:46', '2017-06-22 10:47:46', 'check_time', 'type/DateTime', null, '', null, '', '0', '122', null, 'Check Time', 'normal', null, '943', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('869', '2017-06-22 10:47:46', '2017-06-22 10:47:46', 'city', 'type/Text', 'type/City', '', null, '', '0', '122', null, 'City', 'normal', null, '944', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('870', '2017-06-22 10:47:46', '2017-06-22 10:52:06', 'courier_id', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Courier ID', 'normal', null, '945', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('871', '2017-06-22 10:47:46', '2017-06-22 10:52:07', 'good_id', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Good ID', 'normal', null, '946', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('872', '2017-06-22 10:47:47', '2017-06-22 10:47:47', 'oid', 'type/Integer', 'type/PK', '', null, '', '0', '122', null, 'Oid', 'normal', null, '947', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('873', '2017-06-22 10:47:47', '2017-06-22 10:52:07', 'operator', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Operator', 'normal', null, '948', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('874', '2017-06-22 10:47:47', '2017-06-22 10:52:07', 'order_id', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Order ID', 'normal', null, '949', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('875', '2017-06-22 10:47:47', '2017-06-22 10:52:08', 'order_ip', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Order IP', 'normal', null, '950', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('876', '2017-06-22 10:47:47', '2017-06-22 10:52:09', 'order_remark', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Order Remark', 'normal', null, '951', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('877', '2017-06-22 10:47:47', '2017-06-22 10:47:47', 'order_time', 'type/DateTime', null, '', null, '', '0', '122', null, 'Order Time', 'normal', null, '952', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('878', '2017-06-22 10:47:47', '2017-06-22 10:47:47', 'order_type', 'type/Integer', 'type/Category', '', null, '', '0', '122', null, 'Order Type', 'normal', null, '953', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('879', '2017-06-22 10:47:47', '2017-06-22 10:47:47', 'pay_type', 'type/Integer', 'type/Category', '', null, '', '0', '122', null, 'Pay Type', 'normal', null, '954', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('880', '2017-06-22 10:47:47', '2017-06-22 10:52:10', 'province', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Province', 'normal', null, '955', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('881', '2017-06-22 10:47:47', '2017-06-22 10:47:47', 'sender_type', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Sender Type', 'normal', null, '956', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('882', '2017-06-22 10:47:47', '2017-06-22 10:52:11', 'sku_id', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'Sk U ID', 'normal', null, '957', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('883', '2017-06-22 10:47:47', '2017-06-22 10:52:12', 'state', 'type/Integer', 'type/Category', '', null, '', '0', '122', null, 'State', 'normal', null, '958', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('884', '2017-06-22 10:47:48', '2017-06-22 10:47:48', 'update_time', 'type/DateTime', null, '', null, '', '0', '122', null, 'Update Time', 'normal', null, '959', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('885', '2017-06-22 10:47:48', '2017-06-22 10:52:12', 'user_id', 'type/Text', 'type/Category', '', null, '', '0', '122', null, 'User ID', 'normal', null, '960', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('886', '2017-06-22 10:47:48', '2017-06-22 10:47:48', 'createtime', 'type/DateTime', null, '', null, '', '0', '123', null, 'Create Time', 'normal', null, '638', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('887', '2017-06-22 10:47:48', '2017-06-22 10:47:48', 'exp_pay_date', 'type/DateTime', null, '', null, '', '0', '123', null, 'Exp Pay Date', 'normal', null, '639', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('888', '2017-06-22 10:47:48', '2017-06-22 10:47:48', 'ocid', 'type/Text', 'type/PK', '', null, '', '0', '123', null, 'O Cid', 'normal', null, '640', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('889', '2017-06-22 10:47:48', '2017-06-22 10:52:13', 'order_id', 'type/Text', 'type/Category', '', null, '', '0', '123', null, 'Order ID', 'normal', null, '641', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('890', '2017-06-22 10:47:48', '2017-06-22 10:52:14', 'order_money', 'type/Float', 'type/Category', '', null, '', '0', '123', null, 'Order Money', 'normal', null, '642', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('891', '2017-06-22 10:47:48', '2017-06-22 10:52:14', 'order_pmoney', 'type/Float', 'type/Category', '', null, '', '0', '123', null, 'Order Pm One Y', 'normal', null, '643', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('892', '2017-06-22 10:47:48', '2017-06-22 10:52:15', 'remark', 'type/Text', 'type/Category', '', null, '', '0', '123', null, 'Remark', 'normal', null, '644', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('893', '2017-06-22 10:47:48', '2017-06-22 10:52:16', 'state_id', 'type/Integer', 'type/Category', '', null, '', '0', '123', null, 'State ID', 'normal', null, '645', '2017-06-25 14:19:44', null, null);
INSERT INTO `metabase_field` VALUES ('894', '2017-06-22 10:47:49', '2017-06-22 10:47:49', 'createtime', 'type/DateTime', null, '', null, '', '0', '124', null, 'Create Time', 'normal', null, '742', '2017-06-25 14:19:45', null, null);
INSERT INTO `metabase_field` VALUES ('895', '2017-06-22 10:47:49', '2017-06-22 10:47:49', 'log_id', 'type/Integer', 'type/PK', '', null, '', '0', '124', null, 'Log ID', 'normal', null, '743', '2017-06-25 14:19:45', null, null);
INSERT INTO `metabase_field` VALUES ('896', '2017-06-22 10:47:49', '2017-06-22 10:52:17', 'log_txt', 'type/Text', 'type/Category', '', null, '', '0', '124', null, 'Log Txt', 'normal', null, '744', '2017-06-25 14:19:45', null, null);
INSERT INTO `metabase_field` VALUES ('897', '2017-06-22 10:47:49', '2017-06-22 10:52:18', 'order_id', 'type/Text', 'type/Category', '', null, '', '0', '124', null, 'Order ID', 'normal', null, '745', '2017-06-25 14:19:45', null, null);
INSERT INTO `metabase_field` VALUES ('898', '2017-06-22 10:47:49', '2017-06-22 10:52:19', 'account_name', 'type/Text', 'type/Category', '', null, '', '0', '125', null, 'Account Name', 'normal', null, '576', '2017-06-25 14:19:46', null, null);
INSERT INTO `metabase_field` VALUES ('899', '2017-06-22 10:47:49', '2017-06-22 10:52:20', 'alipay_code', 'type/Text', 'type/Category', '', null, '', '0', '125', null, 'Ali Pay Code', 'normal', null, '577', '2017-06-25 14:19:46', null, null);
INSERT INTO `metabase_field` VALUES ('900', '2017-06-22 10:47:49', '2017-06-22 10:47:49', 'createtime', 'type/DateTime', null, '', null, '', '0', '125', null, 'Create Time', 'normal', null, '578', '2017-06-25 14:19:46', null, null);
INSERT INTO `metabase_field` VALUES ('901', '2017-06-22 10:47:49', '2017-06-22 10:47:49', 'customer_id', 'type/Text', null, '', null, '', '0', '125', null, 'Customer ID', 'normal', null, '579', '2017-06-25 14:19:46', null, null);
INSERT INTO `metabase_field` VALUES ('902', '2017-06-22 10:47:49', '2017-06-22 10:52:20', 'operater', 'type/Text', 'type/Category', '', null, '', '0', '125', null, 'Opera Ter', 'normal', null, '580', '2017-06-25 14:19:46', null, null);
INSERT INTO `metabase_field` VALUES ('903', '2017-06-22 10:47:50', '2017-06-22 10:52:21', 'pay_account', 'type/Text', 'type/Category', '', null, '', '0', '125', null, 'Pay Account', 'normal', null, '581', '2017-06-25 14:19:46', null, null);
INSERT INTO `metabase_field` VALUES ('904', '2017-06-22 10:47:50', '2017-06-22 10:47:50', 'pay_id', 'type/Integer', 'type/PK', '', null, '', '0', '125', null, 'Pay ID', 'normal', null, '582', '2017-06-25 14:19:46', null, null);
INSERT INTO `metabase_field` VALUES ('905', '2017-06-22 10:47:50', '2017-06-22 10:52:22', 'pay_money', 'type/Float', 'type/Category', '', null, '', '0', '125', null, 'Pay Money', 'normal', null, '583', '2017-06-25 14:19:46', null, null);
INSERT INTO `metabase_field` VALUES ('906', '2017-06-22 10:47:50', '2017-06-22 10:47:50', 'pay_time', 'type/DateTime', null, '', null, '', '0', '125', null, 'Pay Time', 'normal', null, '584', '2017-06-25 14:19:46', null, null);
INSERT INTO `metabase_field` VALUES ('907', '2017-06-22 10:47:50', '2017-06-22 10:52:22', 'remark', 'type/Text', 'type/Category', '', null, '', '0', '125', null, 'Remark', 'normal', null, '585', '2017-06-25 14:19:46', null, null);
INSERT INTO `metabase_field` VALUES ('908', '2017-06-22 10:47:50', '2017-06-22 10:52:22', 'um_id', 'type/Text', 'type/Category', '', null, '', '0', '125', null, 'Um ID', 'normal', null, '586', '2017-06-25 14:19:46', null, null);
INSERT INTO `metabase_field` VALUES ('909', '2017-06-22 10:47:50', '2017-06-22 10:47:50', 'createtime', 'type/DateTime', null, '', null, '', '0', '126', null, 'Create Time', 'normal', null, '311', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('910', '2017-06-22 10:47:50', '2017-06-22 10:52:24', 'order_id', 'type/Text', 'type/Category', '', null, '', '0', '126', null, 'Order ID', 'normal', null, '312', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('911', '2017-06-22 10:47:50', '2017-06-22 10:52:25', 'order_money', 'type/Float', 'type/Category', '', null, '', '0', '126', null, 'Order Money', 'normal', null, '313', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('912', '2017-06-22 10:47:51', '2017-06-22 10:52:26', 'remark', 'type/Text', 'type/Category', '', null, '', '0', '126', null, 'Remark', 'normal', null, '314', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('913', '2017-06-22 10:47:51', '2017-06-22 10:47:51', 'scid', 'type/Text', 'type/PK', '', null, '', '0', '126', null, 'Sc ID', 'normal', null, '315', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('914', '2017-06-22 10:47:51', '2017-06-22 10:52:27', 'server_pmoney', 'type/Float', 'type/Category', '', null, '', '0', '126', null, 'Server Pm One Y', 'normal', null, '316', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('915', '2017-06-22 10:47:51', '2017-06-22 10:52:27', 'state_id', 'type/Integer', 'type/Category', '', null, '', '0', '126', null, 'State ID', 'normal', null, '317', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('916', '2017-06-22 10:47:51', '2017-06-22 10:47:51', 'createtime', 'type/DateTime', null, '', null, '', '0', '127', null, 'Create Time', 'normal', null, '785', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('917', '2017-06-22 10:47:51', '2017-06-22 10:47:51', 'log_id', 'type/Integer', 'type/PK', '', null, '', '0', '127', null, 'Log ID', 'normal', null, '786', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('918', '2017-06-22 10:47:51', '2017-06-22 10:47:51', 'log_txt', 'type/Text', null, '', null, '', '0', '127', null, 'Log Txt', 'normal', null, '787', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('919', '2017-06-22 10:47:51', '2017-06-22 10:47:51', 'order_id', 'type/Text', null, '', null, '', '0', '127', null, 'Order ID', 'normal', null, '788', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('920', '2017-06-22 10:47:52', '2017-06-22 10:47:52', 'user_id', 'type/Text', null, '', null, '', '0', '127', null, 'User ID', 'normal', null, '789', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('921', '2017-06-22 10:47:52', '2017-06-22 10:47:52', 'createtime', 'type/DateTime', null, '', null, '', '0', '128', null, 'Create Time', 'normal', null, '961', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('922', '2017-06-22 10:47:52', '2017-06-22 10:47:52', 'own_money', 'type/Float', null, '', null, '', '0', '128', null, 'Own Money', 'normal', null, '962', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('923', '2017-06-22 10:47:52', '2017-06-22 10:47:52', 'scid', 'type/Text', null, '', null, '', '0', '128', null, 'Sc ID', 'normal', null, '963', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('924', '2017-06-22 10:47:52', '2017-06-22 10:47:52', 'server_money', 'type/Float', null, '', null, '', '0', '128', null, 'Server Money', 'normal', null, '964', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('925', '2017-06-22 10:47:52', '2017-06-22 10:47:52', 'sm_id', 'type/Integer', 'type/PK', '', null, '', '0', '128', null, 'Sm ID', 'normal', null, '965', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('926', '2017-06-22 10:47:52', '2017-06-22 10:47:52', 'state', 'type/Integer', null, '', null, '', '0', '128', null, 'State', 'normal', null, '966', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('927', '2017-06-22 10:47:53', '2017-06-22 10:47:53', 'user_id', 'type/Text', null, '', null, '', '0', '128', null, 'User ID', 'normal', null, '967', '2017-06-25 14:19:47', null, null);
INSERT INTO `metabase_field` VALUES ('928', '2017-06-22 10:47:53', '2017-06-22 10:47:53', 'account_name', 'type/Text', null, '', null, '', '0', '129', null, 'Account Name', 'normal', null, '114', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('929', '2017-06-22 10:47:53', '2017-06-22 10:47:53', 'alipay_code', 'type/Text', null, '', null, '', '0', '129', null, 'Ali Pay Code', 'normal', null, '115', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('930', '2017-06-22 10:47:53', '2017-06-22 10:47:53', 'createtime', 'type/DateTime', null, '', null, '', '0', '129', null, 'Create Time', 'normal', null, '116', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('931', '2017-06-22 10:47:53', '2017-06-22 10:47:53', 'operater', 'type/Text', null, '', null, '', '0', '129', null, 'Opera Ter', 'normal', null, '117', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('932', '2017-06-22 10:47:53', '2017-06-22 10:47:53', 'pay_account', 'type/Text', null, '', null, '', '0', '129', null, 'Pay Account', 'normal', null, '118', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('933', '2017-06-22 10:47:53', '2017-06-22 10:47:53', 'pay_id', 'type/Integer', 'type/PK', '', null, '', '0', '129', null, 'Pay ID', 'normal', null, '119', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('934', '2017-06-22 10:47:53', '2017-06-22 10:47:53', 'pay_money', 'type/Float', null, '', null, '', '0', '129', null, 'Pay Money', 'normal', null, '120', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('935', '2017-06-22 10:47:53', '2017-06-22 10:47:53', 'pay_time', 'type/DateTime', null, '', null, '', '0', '129', null, 'Pay Time', 'normal', null, '121', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('936', '2017-06-22 10:47:54', '2017-06-22 10:47:54', 'pay_type', 'type/Integer', 'type/Category', '', null, '', '0', '129', null, 'Pay Type', 'normal', null, '122', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('937', '2017-06-22 10:47:54', '2017-06-22 10:47:54', 'remark', 'type/Text', null, '', null, '', '0', '129', null, 'Remark', 'normal', null, '123', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('938', '2017-06-22 10:47:54', '2017-06-22 10:47:54', 'sm_id', 'type/Text', null, '', null, '', '0', '129', null, 'Sm ID', 'normal', null, '124', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('939', '2017-06-22 10:47:54', '2017-06-22 10:47:54', 'createtime', 'type/DateTime', null, '', null, '', '0', '130', null, 'Create Time', 'normal', null, '646', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('940', '2017-06-22 10:47:54', '2017-06-22 10:52:30', 'ocid', 'type/Text', 'type/Category', '', null, '', '0', '130', null, 'O Cid', 'normal', null, '647', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('941', '2017-06-22 10:47:54', '2017-06-22 10:52:32', 'order_money', 'type/Float', 'type/Category', '', null, '', '0', '130', null, 'Order Money', 'normal', null, '648', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('942', '2017-06-22 10:47:54', '2017-06-22 10:52:32', 'own_money', 'type/Float', 'type/Category', '', null, '', '0', '130', null, 'Own Money', 'normal', null, '649', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('943', '2017-06-22 10:47:54', '2017-06-22 10:52:32', 'state', 'type/Integer', 'type/Category', '', null, '', '0', '130', null, 'State', 'normal', null, '650', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('944', '2017-06-22 10:47:55', '2017-06-22 10:47:55', 'um_id', 'type/Integer', 'type/PK', '', null, '', '0', '130', null, 'Um ID', 'normal', null, '651', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('945', '2017-06-22 10:47:55', '2017-06-22 10:52:33', 'user_id', 'type/Text', 'type/Category', '', null, '', '0', '130', null, 'User ID', 'normal', null, '652', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('946', '2017-06-22 10:47:55', '2017-06-22 10:52:33', 'visit_money', 'type/Float', 'type/Category', '', null, '', '0', '130', null, 'Visit Money', 'normal', null, '653', '2017-06-25 14:19:48', null, null);
INSERT INTO `metabase_field` VALUES ('947', '2017-06-22 10:47:55', '2017-06-22 10:52:34', 'channel_id', 'type/Integer', 'type/Category', '', null, '', '0', '131', null, 'Channel ID', 'normal', null, '529', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('948', '2017-06-22 10:47:55', '2017-06-22 10:52:34', 'good_id', 'type/Text', 'type/Category', '', null, '', '0', '131', null, 'Good ID', 'normal', null, '530', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('949', '2017-06-22 10:47:55', '2017-06-22 10:47:55', 'log_id', 'type/Integer', 'type/PK', '', null, '', '0', '131', null, 'Log ID', 'normal', null, '531', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('950', '2017-06-22 10:47:55', '2017-06-22 10:52:34', 'order_id', 'type/Text', 'type/Category', '', null, '', '0', '131', null, 'Order ID', 'normal', null, '532', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('951', '2017-06-22 10:47:55', '2017-06-22 10:52:34', 'user_id', 'type/Text', 'type/Category', '', null, '', '0', '131', null, 'User ID', 'normal', null, '533', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('952', '2017-06-22 10:47:55', '2017-06-22 10:52:35', 'visit_ip', 'type/Text', 'type/Category', '', null, '', '0', '131', null, 'Visit IP', 'normal', null, '534', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('953', '2017-06-22 10:47:55', '2017-06-22 10:52:36', 'visit_num', 'type/Integer', 'type/Category', '', null, '', '0', '131', null, 'Visit Num', 'normal', null, '535', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('954', '2017-06-22 10:47:55', '2017-06-22 10:47:55', 'visit_time', 'type/DateTime', null, '', null, '', '0', '131', null, 'Visit Time', 'normal', null, '536', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('955', '2017-06-22 10:47:56', '2017-06-22 10:52:37', 'access_token', 'type/Text', 'type/Category', '', null, '', '0', '132', null, 'Access Token', 'details-only', null, '128', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('956', '2017-06-22 10:47:56', '2017-06-22 10:52:37', 'access_token_time', 'type/Text', 'type/Category', '', null, '', '0', '132', null, 'Access Token Time', 'normal', null, '129', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('957', '2017-06-22 10:47:56', '2017-06-22 10:52:37', 'AppID', 'type/Text', 'type/Category', '', null, '', '0', '132', null, 'App ID', 'normal', null, '125', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('958', '2017-06-22 10:47:56', '2017-06-22 10:52:38', 'AppName', 'type/Text', 'type/Category', '', null, '', '0', '132', null, 'App Name', 'normal', null, '126', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('959', '2017-06-22 10:47:56', '2017-06-22 10:52:38', 'AppSecret', 'type/Text', 'type/Category', '', null, '', '0', '132', null, 'App Secret', 'normal', null, '127', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('960', '2017-06-22 10:47:56', '2017-06-22 10:47:56', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '132', null, 'ID', 'normal', null, '130', '2017-06-25 14:19:49', null, null);
INSERT INTO `metabase_field` VALUES ('961', '2017-06-22 10:47:57', '2017-06-22 10:52:39', 'cjje', 'type/Text', 'type/Category', '', null, '', '0', '133', null, 'Cj Je', 'normal', null, '975', '2017-06-25 14:19:50', null, null);
INSERT INTO `metabase_field` VALUES ('962', '2017-06-22 10:47:57', '2017-06-22 10:52:40', 'cjtime', 'type/Text', 'type/Category', '', null, '', '0', '133', null, 'Cj Time', 'normal', null, '976', '2017-06-25 14:19:50', null, null);
INSERT INTO `metabase_field` VALUES ('963', '2017-06-22 10:47:57', '2017-06-22 10:47:57', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '133', null, 'ID', 'normal', null, '977', '2017-06-25 14:19:50', null, null);
INSERT INTO `metabase_field` VALUES ('964', '2017-06-22 10:47:57', '2017-06-22 10:52:40', 'taskid', 'type/Text', 'type/Category', '', null, '', '0', '133', null, 'Task ID', 'normal', null, '978', '2017-06-25 14:19:50', null, null);
INSERT INTO `metabase_field` VALUES ('965', '2017-06-22 10:47:57', '2017-06-22 10:52:40', 'tgjx', 'type/Text', 'type/Category', '', null, '', '0', '133', null, 'Tg Jx', 'normal', null, '979', '2017-06-25 14:19:50', null, null);
INSERT INTO `metabase_field` VALUES ('966', '2017-06-22 10:47:57', '2017-06-22 10:52:41', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '133', null, 'UID', 'normal', null, '980', '2017-06-25 14:19:50', null, null);
INSERT INTO `metabase_field` VALUES ('967', '2017-06-22 10:47:57', '2017-06-22 10:52:41', 'wxh', 'type/Text', 'type/Category', '', null, '', '0', '133', null, 'Wxh', 'normal', null, '981', '2017-06-25 14:19:50', null, null);
INSERT INTO `metabase_field` VALUES ('968', '2017-06-22 10:47:57', '2017-06-22 10:52:41', 'zhzq', 'type/Text', 'type/Category', '', null, '', '0', '133', null, 'Z Hz Q', 'normal', null, '982', '2017-06-25 14:19:50', null, null);
INSERT INTO `metabase_field` VALUES ('969', '2017-06-22 10:47:58', '2017-06-22 10:52:42', 'addtime', 'type/Text', 'type/Category', '', null, '', '0', '134', null, 'Add Time', 'normal', null, '461', '2017-06-25 14:19:51', null, null);
INSERT INTO `metabase_field` VALUES ('970', '2017-06-22 10:47:58', '2017-06-22 10:47:58', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '134', null, 'ID', 'normal', null, '462', '2017-06-25 14:19:51', null, null);
INSERT INTO `metabase_field` VALUES ('971', '2017-06-22 10:47:58', '2017-06-22 10:52:43', 'taskid', 'type/Text', 'type/Category', '', null, '', '0', '134', null, 'Task ID', 'normal', null, '463', '2017-06-25 14:19:51', null, null);
INSERT INTO `metabase_field` VALUES ('972', '2017-06-22 10:47:58', '2017-06-22 10:52:44', 'tgjxid', 'type/Text', 'type/Category', '', null, '', '0', '134', null, 'Tg Jx ID', 'normal', null, '464', '2017-06-25 14:19:51', null, null);
INSERT INTO `metabase_field` VALUES ('973', '2017-06-22 10:47:58', '2017-06-22 10:52:44', 'uid', 'type/Text', 'type/Category', '', null, '', '0', '134', null, 'UID', 'normal', null, '465', '2017-06-25 14:19:51', null, null);
INSERT INTO `metabase_field` VALUES ('974', '2017-06-22 10:47:58', '2017-06-22 10:52:44', 'wxh', 'type/Text', 'type/Category', '', null, '', '0', '134', null, 'Wxh', 'normal', null, '466', '2017-06-25 14:19:51', null, null);
INSERT INTO `metabase_field` VALUES ('975', '2017-06-22 10:47:58', '2017-06-22 10:52:45', 'xzfs', 'type/Text', 'type/Category', '', null, '', '0', '134', null, 'X Zfs', 'normal', null, '467', '2017-06-25 14:19:51', null, null);
INSERT INTO `metabase_field` VALUES ('976', '2017-06-22 10:47:59', '2017-06-22 10:47:59', 'code', 'type/Text', null, '', null, '', '0', '135', null, 'Code', 'normal', null, '212', '2017-06-25 14:19:51', null, null);
INSERT INTO `metabase_field` VALUES ('977', '2017-06-22 10:47:59', '2017-06-22 10:47:59', 'region_id', 'type/Text', null, '', null, '', '0', '135', null, 'Region ID', 'normal', null, '213', '2017-06-25 14:19:51', null, null);
INSERT INTO `metabase_field` VALUES ('978', '2017-06-22 10:47:59', '2017-06-22 10:47:59', 'zip_id', 'type/Integer', 'type/PK', '', null, '', '0', '135', null, 'Zip ID', 'normal', null, '214', '2017-06-25 14:19:51', null, null);
INSERT INTO `metabase_field` VALUES ('979', '2017-06-22 10:47:59', '2017-06-22 10:47:59', 'zip_number', 'type/Text', null, '', null, '', '0', '135', null, 'Zip Number', 'normal', null, '215', '2017-06-25 14:19:51', null, null);
INSERT INTO `metabase_field` VALUES ('980', '2017-06-22 10:47:59', '2017-06-22 10:47:59', 'content', 'type/Text', null, '', null, '', '0', '136', null, 'Content', 'normal', null, '168', '2017-06-25 14:19:52', null, null);
INSERT INTO `metabase_field` VALUES ('981', '2017-06-22 10:47:59', '2017-06-22 10:47:59', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '136', null, 'ID', 'normal', null, '169', '2017-06-25 14:19:52', null, null);
INSERT INTO `metabase_field` VALUES ('982', '2017-06-22 10:47:59', '2017-06-22 10:47:59', 'tid', 'type/Text', 'type/PK', '', null, '', '0', '136', null, 'Tid', 'normal', null, '170', '2017-06-25 14:19:52', null, null);
INSERT INTO `metabase_field` VALUES ('983', '2017-06-22 10:47:59', '2017-06-22 10:47:59', 'uid', 'type/Text', null, '', null, '', '0', '136', null, 'UID', 'normal', null, '171', '2017-06-25 14:19:52', null, null);
INSERT INTO `metabase_field` VALUES ('1658', '2017-06-22 10:59:31', '2017-06-22 10:59:31', 'CREATED_AT', 'type/DateTime', null, '', 'The date and time an order was submitted.', '', '0', '224', null, 'Created At', 'normal', null, '1943', '2017-06-22 10:59:38', null, null);
INSERT INTO `metabase_field` VALUES ('1659', '2017-06-22 10:59:31', '2017-06-22 10:59:31', 'ID', 'type/BigInteger', 'type/PK', '', 'This is a unique ID for the product. It is also called the “Invoice number” or “Confirmation number” in customer facing emails and screens.', '', '0', '224', null, 'ID', 'normal', null, '1944', '2017-06-22 10:59:38', null, null);
INSERT INTO `metabase_field` VALUES ('1660', '2017-06-22 10:59:31', '2017-06-22 10:59:34', 'PRODUCT_ID', 'type/Integer', 'type/FK', '', 'The product ID. This is an internal identifier for the product, NOT the SKU.', '', '0', '224', null, 'Product ID', 'normal', '1681', '1945', '2017-06-22 10:59:38', null, null);
INSERT INTO `metabase_field` VALUES ('1661', '2017-06-22 10:59:31', '2017-06-22 10:59:38', 'SUBTOTAL', 'type/Float', 'type/Category', '', 'The raw, pre-tax cost of the order. Note that this might be different in the future from the product price due to promotions, credits, etc.', '', '0', '224', null, 'Subtotal', 'normal', null, '1946', '2017-06-22 10:59:38', null, null);
INSERT INTO `metabase_field` VALUES ('1662', '2017-06-22 10:59:31', '2017-06-22 10:59:31', 'TAX', 'type/Float', null, '', 'This is the amount of local and federal taxes that are collected on the purchase. Note that other governmental fees on some products are not included here, but instead are accounted for in the subtotal.', '', '0', '224', null, 'Tax', 'normal', null, '1947', '2017-06-22 10:59:38', null, null);
INSERT INTO `metabase_field` VALUES ('1663', '2017-06-22 10:59:31', '2017-06-22 10:59:31', 'TOTAL', 'type/Float', null, '', 'The total billed amount.', '', '0', '224', null, 'Total', 'normal', null, '1948', '2017-06-22 10:59:38', null, null);
INSERT INTO `metabase_field` VALUES ('1664', '2017-06-22 10:59:31', '2017-06-22 10:59:34', 'USER_ID', 'type/Integer', 'type/FK', '', 'The id of the user who made this order. Note that in some cases where an order was created on behalf of a customer who phoned the order in, this might be the employee who handled the request.', '', '0', '224', null, 'User ID', 'normal', '1670', '1949', '2017-06-22 10:59:38', null, null);
INSERT INTO `metabase_field` VALUES ('1665', '2017-06-22 10:59:31', '2017-06-22 10:59:31', 'ADDRESS', 'type/Text', null, '', 'The street address of the account’s billing address', '', '0', '225', null, 'Address', 'normal', null, '1950', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1666', '2017-06-22 10:59:31', '2017-06-22 10:59:31', 'BIRTH_DATE', 'type/Date', null, '', 'The date of birth of the user', '', '0', '225', null, 'Birth Date', 'normal', null, '1951', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1667', '2017-06-22 10:59:31', '2017-06-22 10:59:31', 'CITY', 'type/Text', 'type/City', '', 'The city of the account’s billing address', '', '0', '225', null, 'City', 'normal', null, '1952', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1668', '2017-06-22 10:59:31', '2017-06-22 10:59:31', 'CREATED_AT', 'type/DateTime', null, '', 'The date the user record was created. Also referred to as the user’s \"join date\"', '', '0', '225', null, 'Created At', 'normal', null, '1953', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1669', '2017-06-22 10:59:32', '2017-06-22 10:59:39', 'EMAIL', 'type/Text', 'type/Email', '', 'The contact email for the account.', '', '0', '225', null, 'Email', 'normal', null, '1954', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1670', '2017-06-22 10:59:32', '2017-06-22 10:59:32', 'ID', 'type/BigInteger', 'type/PK', '', 'A unique identifier given to each user.', '', '0', '225', null, 'ID', 'normal', null, '1955', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1671', '2017-06-22 10:59:32', '2017-06-22 10:59:32', 'LATITUDE', 'type/Float', 'type/Latitude', '', 'This is the latitude of the user on sign-up. It might be updated in the future to the last seen location.', '', '0', '225', null, 'Latitude', 'normal', null, '1956', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1672', '2017-06-22 10:59:32', '2017-06-22 10:59:32', 'LONGITUDE', 'type/Float', 'type/Longitude', '', 'This is the longitude of the user on sign-up. It might be updated in the future to the last seen location.', '', '0', '225', null, 'Longitude', 'normal', null, '1957', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1673', '2017-06-22 10:59:32', '2017-06-22 10:59:32', 'NAME', 'type/Text', 'type/Name', '', 'The name of the user who owns an account', '', '0', '225', null, 'Name', 'normal', null, '1958', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1674', '2017-06-22 10:59:32', '2017-06-22 10:59:32', 'PASSWORD', 'type/Text', null, '', 'This is the salted password of the user. It should not be visible', '', '0', '225', null, 'Password', 'normal', null, '1959', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1675', '2017-06-22 10:59:32', '2017-06-22 10:59:39', 'SOURCE', 'type/Text', 'type/Category', '', 'The channel through which we acquired this user. Valid values include: Affiliate, Facebook, Google, Organic and Twitter', '', '0', '225', null, 'Source', 'normal', null, '1960', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1676', '2017-06-22 10:59:32', '2017-06-22 10:59:32', 'STATE', 'type/Text', 'type/State', '', 'The state or province of the account’s billing address', '', '0', '225', null, 'State', 'normal', null, '1961', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1677', '2017-06-22 10:59:32', '2017-06-22 10:59:32', 'ZIP', 'type/Text', 'type/ZipCode', '', 'The postal code of the account’s billing address', '', '0', '225', null, 'Zip', 'normal', null, '1962', '2017-06-22 10:59:39', null, null);
INSERT INTO `metabase_field` VALUES ('1678', '2017-06-22 10:59:33', '2017-06-22 10:59:40', 'CATEGORY', 'type/Text', 'type/Category', '', 'The type of product, valid values include: Doohicky, Gadget, Gizmo and Widget', '', '0', '226', null, 'Category', 'normal', null, '1935', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1679', '2017-06-22 10:59:33', '2017-06-22 10:59:33', 'CREATED_AT', 'type/DateTime', null, '', 'The date the product was added to our catalog.', '', '0', '226', null, 'Created At', 'normal', null, '1936', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1680', '2017-06-22 10:59:33', '2017-06-22 10:59:40', 'EAN', 'type/Text', 'type/Category', '', 'The international article number. A 13 digit number uniquely identifying the product.', '', '0', '226', null, 'Ean', 'normal', null, '1937', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1681', '2017-06-22 10:59:33', '2017-06-22 10:59:33', 'ID', 'type/BigInteger', 'type/PK', '', 'The numerical product number. Only used internally. All external communication should use the title or EAN.', '', '0', '226', null, 'ID', 'normal', null, '1938', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1682', '2017-06-22 10:59:33', '2017-06-22 10:59:40', 'PRICE', 'type/Float', 'type/Category', '', 'The list price of the product. Note that this is not always the price the product sold for due to discounts, promotions, etc.', '', '0', '226', null, 'Price', 'normal', null, '1939', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1683', '2017-06-22 10:59:33', '2017-06-22 10:59:40', 'RATING', 'type/Float', 'type/Category', '', 'The average rating users have given the product. This ranges from 1 - 5', '', '0', '226', null, 'Rating', 'normal', null, '1940', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1684', '2017-06-22 10:59:33', '2017-06-22 10:59:41', 'TITLE', 'type/Text', 'type/Category', '', 'The name of the product as it should be displayed to customers.', '', '0', '226', null, 'Title', 'normal', null, '1941', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1685', '2017-06-22 10:59:33', '2017-06-22 10:59:41', 'VENDOR', 'type/Text', 'type/Category', '', 'The source of the product.', '', '0', '226', null, 'Vendor', 'normal', null, '1942', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1686', '2017-06-22 10:59:34', '2017-06-22 10:59:34', 'BODY', 'type/Text', 'type/Description', '', 'The review the user left. Limited to 2000 characters.', '', '0', '227', null, 'Body', 'normal', null, '1965', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1687', '2017-06-22 10:59:34', '2017-06-22 10:59:34', 'CREATED_AT', 'type/DateTime', null, '', 'The day and time a review was written by a user.', '', '0', '227', null, 'Created At', 'normal', null, '1966', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1688', '2017-06-22 10:59:34', '2017-06-22 10:59:34', 'ID', 'type/BigInteger', 'type/PK', '', 'A unique internal identifier for the review. Should not be used externally.', '', '0', '227', null, 'ID', 'normal', null, '1967', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1689', '2017-06-22 10:59:34', '2017-06-22 10:59:34', 'PRODUCT_ID', 'type/Integer', 'type/FK', '', 'The product the review was for', '', '0', '227', null, 'Product ID', 'normal', '1681', '1968', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1690', '2017-06-22 10:59:34', '2017-06-22 10:59:34', 'RATING', 'type/Integer', 'type/Category', '', 'The rating (on a scale of 1-5) the user left.', '', '0', '227', null, 'Rating', 'normal', null, '1969', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1691', '2017-06-22 10:59:34', '2017-06-22 10:59:34', 'REVIEWER', 'type/Text', null, '', 'The user who left the review', '', '0', '227', null, 'Reviewer', 'normal', null, '1970', '2017-06-22 10:59:41', null, null);
INSERT INTO `metabase_field` VALUES ('1692', '2017-06-22 17:50:42', '2017-06-22 17:50:42', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '228', null, 'ID', 'normal', null, '1971', '2017-06-25 14:19:52', null, null);
INSERT INTO `metabase_field` VALUES ('1693', '2017-06-22 17:50:42', '2017-06-29 21:50:59', 'projid', 'type/Integer', null, '', null, '', '0', '228', null, 'Pro Jid', 'normal', null, '1972', '2017-06-25 14:19:52', null, null);
INSERT INTO `metabase_field` VALUES ('1694', '2017-06-22 17:50:42', '2017-06-29 21:51:00', 'taskid', 'type/Integer', null, '', null, '', '0', '228', null, 'Task ID', 'normal', null, '1973', '2017-06-25 14:19:52', null, null);
INSERT INTO `metabase_field` VALUES ('1695', '2017-06-22 17:50:42', '2017-06-29 21:51:00', 'time', 'type/Integer', null, '', null, '', '0', '228', null, 'Time', 'normal', null, '1974', '2017-06-25 14:19:52', null, null);
INSERT INTO `metabase_field` VALUES ('1696', '2017-06-22 17:50:43', '2017-06-29 21:51:00', 'uid', 'type/Integer', null, '', null, '', '0', '228', null, 'UID', 'normal', null, '1975', '2017-06-25 14:19:52', null, null);
INSERT INTO `metabase_field` VALUES ('1697', '2017-06-22 17:50:43', '2017-06-22 17:50:43', '内容时', 'type/Text', null, '', null, '', '0', '228', null, '内容时', 'retired', null, '1976', '2017-06-25 14:19:52', null, null);
INSERT INTO `metabase_field` VALUES ('1698', '2017-06-22 17:50:43', '2017-06-22 17:50:43', '内容目的', 'type/Text', null, '', null, '', '0', '228', null, '内容目的', 'retired', null, '1977', '2017-06-25 14:19:52', null, null);
INSERT INTO `metabase_field` VALUES ('1699', '2017-06-25 14:12:38', '2017-06-25 14:12:38', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '229', null, 'ID', 'retired', null, '1978', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1700', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '加客时间', 'type/Text', null, '', null, '', '0', '229', null, '加客时间', 'retired', null, '1979', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1701', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '加客量', 'type/Text', null, '', null, '', '0', '229', null, '加客量', 'retired', null, '1980', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1702', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '媒体平台', 'type/Text', null, '', null, '', '0', '229', null, '媒体平台', 'retired', null, '1981', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1703', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '媒体编码', 'type/Text', null, '', null, '', '0', '229', null, '媒体编码', 'retired', null, '1982', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1704', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '客单价', 'type/Text', null, '', null, '', '0', '229', null, '客单价', 'retired', null, '1983', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1705', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '展示量', 'type/Text', null, '', null, '', '0', '229', null, '展示量', 'retired', null, '1984', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1706', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '广告费', 'type/Text', null, '', null, '', '0', '229', null, '广告费', 'retired', null, '1985', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1707', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '成交单价', 'type/Text', null, '', null, '', '0', '229', null, '成交单价', 'retired', null, '1986', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1708', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '成单时间', 'type/Text', null, '', null, '', '0', '229', null, '成单时间', 'retired', null, '1987', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1709', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '成单量', 'type/Text', null, '', null, '', '0', '229', null, '成单量', 'retired', null, '1988', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1710', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '推广员', 'type/Text', null, '', null, '', '0', '229', null, '推广员', 'retired', null, '1989', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1711', '2017-06-25 14:12:39', '2017-06-25 14:12:39', '推广计划ID', 'type/Text', null, '', null, '', '0', '229', null, '推广计划id', 'retired', null, '1990', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1712', '2017-06-25 14:12:40', '2017-06-25 14:12:40', '文案内容时间', 'type/Text', null, '', null, '', '0', '229', null, '文案内容时间', 'retired', null, '1991', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1713', '2017-06-25 14:12:40', '2017-06-25 14:12:40', '文案内容目的', 'type/Text', null, '', null, '', '0', '229', null, '文案内容目的', 'retired', null, '1992', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1714', '2017-06-25 14:12:40', '2017-06-25 14:12:40', '文案负责人', 'type/Text', null, '', null, '', '0', '229', null, '文案负责人', 'retired', null, '1993', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1715', '2017-06-25 14:12:40', '2017-06-25 14:12:40', '点击量', 'type/Text', null, '', null, '', '0', '229', null, '点击量', 'retired', null, '1994', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1716', '2017-06-25 14:12:40', '2017-06-25 14:12:40', '转化周期', 'type/Text', null, '', null, '', '0', '229', null, '转化周期', 'retired', null, '1995', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1717', '2017-06-25 14:12:40', '2017-06-25 14:12:40', '销售员', 'type/Text', null, '', null, '', '0', '229', null, '销售员', 'retired', null, '1996', '2017-06-25 14:14:12', null, null);
INSERT INTO `metabase_field` VALUES ('1718', '2017-06-25 14:18:21', '2017-06-25 14:18:21', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '230', null, 'ID', 'retired', null, '1997', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1719', '2017-06-25 14:18:22', '2017-06-25 14:19:53', '加客时间', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '加客时间', 'retired', null, '1998', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1720', '2017-06-25 14:18:22', '2017-06-25 14:19:53', '加客量', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '加客量', 'retired', null, '1999', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1721', '2017-06-25 14:18:22', '2017-06-25 14:19:53', '媒体平台', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '媒体平台', 'retired', null, '2000', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1722', '2017-06-25 14:18:22', '2017-06-25 14:19:54', '媒体编码', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '媒体编码', 'retired', null, '2001', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1723', '2017-06-25 14:18:22', '2017-06-25 14:18:22', '客单价', 'type/Text', null, '', null, '', '0', '230', null, '客单价', 'retired', null, '2002', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1724', '2017-06-25 14:18:22', '2017-06-25 14:19:54', '展示量', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '展示量', 'retired', null, '2003', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1725', '2017-06-25 14:18:22', '2017-06-25 14:19:54', '广告费', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '广告费', 'retired', null, '2004', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1726', '2017-06-25 14:18:22', '2017-06-25 14:19:54', '成交单价', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '成交单价', 'retired', null, '2005', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1727', '2017-06-25 14:18:22', '2017-06-25 14:19:54', '成单时间', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '成单时间', 'retired', null, '2006', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1728', '2017-06-25 14:18:22', '2017-06-25 14:19:54', '成单量', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '成单量', 'retired', null, '2007', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1729', '2017-06-25 14:18:23', '2017-06-25 14:19:54', '推广员', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '推广员', 'retired', null, '2008', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1730', '2017-06-25 14:18:23', '2017-06-25 14:19:54', '推广计划ID', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '推广计划id', 'retired', null, '2009', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1731', '2017-06-25 14:18:23', '2017-06-25 14:19:55', '文案内容时间', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '文案内容时间', 'retired', null, '2010', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1732', '2017-06-25 14:18:24', '2017-06-25 14:19:55', '文案内容目的', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '文案内容目的', 'retired', null, '2011', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1733', '2017-06-25 14:18:24', '2017-06-25 14:19:55', '文案负责人', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '文案负责人', 'retired', null, '2012', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1734', '2017-06-25 14:18:24', '2017-06-25 14:19:55', '点击量', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '点击量', 'retired', null, '2013', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1735', '2017-06-25 14:18:24', '2017-06-25 14:19:55', '转化周期', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '转化周期', 'retired', null, '2014', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1736', '2017-06-25 14:18:24', '2017-06-25 14:19:55', '销售员', 'type/Text', 'type/Category', '', null, '', '0', '230', null, '销售员', 'retired', null, '2015', '2017-06-25 14:19:57', null, null);
INSERT INTO `metabase_field` VALUES ('1737', '2017-06-29 21:50:57', '2017-06-29 21:50:57', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '231', null, 'ID', 'normal', null, '2019', null, null, null);
INSERT INTO `metabase_field` VALUES ('1738', '2017-06-29 21:50:57', '2017-06-29 21:50:57', 'projid', 'type/Text', null, '', null, '', '0', '231', null, 'Pro Jid', 'normal', null, '2020', null, null, null);
INSERT INTO `metabase_field` VALUES ('1739', '2017-06-29 21:50:57', '2017-06-29 21:50:57', 'taskid', 'type/Text', null, '', null, '', '0', '231', null, 'Task ID', 'normal', null, '2021', null, null, null);
INSERT INTO `metabase_field` VALUES ('1740', '2017-06-29 21:50:57', '2017-06-29 21:50:57', 'time', 'type/Text', null, '', null, '', '0', '231', null, 'Time', 'normal', null, '2022', null, null, null);
INSERT INTO `metabase_field` VALUES ('1741', '2017-06-29 21:50:57', '2017-06-29 21:50:57', 'uid', 'type/Text', null, '', null, '', '0', '231', null, 'UID', 'normal', null, '2023', null, null, null);
INSERT INTO `metabase_field` VALUES ('1742', '2017-06-29 21:50:57', '2017-06-29 21:50:57', '加客量', 'type/Integer', null, '', null, '', '0', '231', null, '加客量', 'normal', null, '2024', null, null, null);
INSERT INTO `metabase_field` VALUES ('1743', '2017-06-29 21:50:57', '2017-06-29 21:50:57', '推广计划ID', 'type/Text', null, '', null, '', '0', '231', null, '推广计划id', 'normal', null, '2025', null, null, null);
INSERT INTO `metabase_field` VALUES ('1744', '2017-06-29 21:50:57', '2017-06-29 21:50:57', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '232', null, 'ID', 'normal', null, '2035', null, null, null);
INSERT INTO `metabase_field` VALUES ('1745', '2017-06-29 21:50:57', '2017-06-29 21:50:57', 'projid', 'type/Text', null, '', null, '', '0', '232', null, 'Pro Jid', 'normal', null, '2036', null, null, null);
INSERT INTO `metabase_field` VALUES ('1746', '2017-06-29 21:50:58', '2017-06-29 21:50:58', 'taskid', 'type/Text', null, '', null, '', '0', '232', null, 'Task ID', 'normal', null, '2037', null, null, null);
INSERT INTO `metabase_field` VALUES ('1747', '2017-06-29 21:50:58', '2017-06-29 21:50:58', 'time', 'type/Text', null, '', null, '', '0', '232', null, 'Time', 'normal', null, '2038', null, null, null);
INSERT INTO `metabase_field` VALUES ('1748', '2017-06-29 21:50:58', '2017-06-29 21:50:58', 'uid', 'type/Text', null, '', null, '', '0', '232', null, 'UID', 'normal', null, '2039', null, null, null);
INSERT INTO `metabase_field` VALUES ('1749', '2017-06-29 21:50:58', '2017-06-29 21:50:58', '咨询量', 'type/Text', null, '', null, '', '0', '232', null, '咨询量', 'normal', null, '2040', null, null, null);
INSERT INTO `metabase_field` VALUES ('1750', '2017-06-29 21:50:58', '2017-06-29 21:50:58', '成交量', 'type/Text', null, '', null, '', '0', '232', null, '成交量', 'normal', null, '2041', null, null, null);
INSERT INTO `metabase_field` VALUES ('1751', '2017-06-29 21:50:58', '2017-06-29 21:50:58', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '233', null, 'ID', 'normal', null, '2026', null, null, null);
INSERT INTO `metabase_field` VALUES ('1752', '2017-06-29 21:50:58', '2017-06-29 21:50:58', 'projid', 'type/Integer', null, '', null, '', '0', '233', null, 'Pro Jid', 'normal', null, '2027', null, null, null);
INSERT INTO `metabase_field` VALUES ('1753', '2017-06-29 21:50:58', '2017-06-29 21:50:58', 'taskid', 'type/Integer', null, '', null, '', '0', '233', null, 'Task ID', 'normal', null, '2028', null, null, null);
INSERT INTO `metabase_field` VALUES ('1754', '2017-06-29 21:50:58', '2017-06-29 21:50:58', 'time', 'type/Integer', null, '', null, '', '0', '233', null, 'Time', 'normal', null, '2029', null, null, null);
INSERT INTO `metabase_field` VALUES ('1755', '2017-06-29 21:50:58', '2017-06-29 21:50:58', 'uid', 'type/Integer', null, '', null, '', '0', '233', null, 'UID', 'normal', null, '2030', null, null, null);
INSERT INTO `metabase_field` VALUES ('1756', '2017-06-29 21:50:58', '2017-06-29 21:50:58', '展示量', 'type/Integer', null, '', null, '', '0', '233', null, '展示量', 'normal', null, '2031', null, null, null);
INSERT INTO `metabase_field` VALUES ('1757', '2017-06-29 21:50:58', '2017-06-29 21:50:58', '广告费', 'type/Float', null, '', null, '', '0', '233', null, '广告费', 'normal', null, '2032', null, null, null);
INSERT INTO `metabase_field` VALUES ('1758', '2017-06-29 21:50:59', '2017-06-29 21:50:59', '推广计划ID', 'type/Integer', null, '', null, '', '0', '233', null, '推广计划id', 'normal', null, '2033', null, null, null);
INSERT INTO `metabase_field` VALUES ('1759', '2017-06-29 21:50:59', '2017-06-29 21:50:59', '点击量', 'type/Integer', null, '', null, '', '0', '233', null, '点击量', 'normal', null, '2034', null, null, null);
INSERT INTO `metabase_field` VALUES ('1760', '2017-06-29 21:50:59', '2017-06-29 21:50:59', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '234', null, 'ID', 'normal', null, '2042', null, null, null);
INSERT INTO `metabase_field` VALUES ('1761', '2017-06-29 21:50:59', '2017-06-29 21:50:59', 'projid', 'type/Integer', null, '', null, '', '0', '234', null, 'Pro Jid', 'normal', null, '2043', null, null, null);
INSERT INTO `metabase_field` VALUES ('1762', '2017-06-29 21:50:59', '2017-06-29 21:50:59', 'taskid', 'type/Integer', null, '', null, '', '0', '234', null, 'Task ID', 'normal', null, '2044', null, null, null);
INSERT INTO `metabase_field` VALUES ('1763', '2017-06-29 21:50:59', '2017-06-29 21:50:59', 'time', 'type/Integer', null, '', null, '', '0', '234', null, 'Time', 'normal', null, '2045', null, null, null);
INSERT INTO `metabase_field` VALUES ('1764', '2017-06-29 21:50:59', '2017-06-29 21:50:59', 'uid', 'type/Integer', null, '', null, '', '0', '234', null, 'UID', 'normal', null, '2046', null, null, null);
INSERT INTO `metabase_field` VALUES ('1765', '2017-06-29 21:50:59', '2017-06-29 21:50:59', '媒体编码', 'type/Text', null, '', null, '', '0', '234', null, '媒体编码', 'normal', null, '2047', null, null, null);
INSERT INTO `metabase_field` VALUES ('1766', '2017-06-29 21:50:59', '2017-06-29 21:50:59', '媒体账号', 'type/Text', null, '', null, '', '0', '234', null, '媒体账号', 'normal', null, '2048', null, null, null);
INSERT INTO `metabase_field` VALUES ('1767', '2017-06-29 21:50:59', '2017-06-29 21:50:59', '文案ID', 'type/Integer', null, '', null, '', '0', '234', null, '文案id', 'normal', null, '2049', null, null, null);
INSERT INTO `metabase_field` VALUES ('1768', '2017-06-29 21:51:00', '2017-06-29 21:51:00', '文案内容时', 'type/Text', null, '', null, '', '0', '228', null, '文案内容时', 'normal', null, '2016', null, null, null);
INSERT INTO `metabase_field` VALUES ('1769', '2017-06-29 21:51:00', '2017-06-29 21:51:00', '文案内容目的', 'type/Text', null, '', null, '', '0', '228', null, '文案内容目的', 'normal', null, '2017', null, null, null);
INSERT INTO `metabase_field` VALUES ('1770', '2017-06-29 21:51:00', '2017-06-29 21:51:00', '文案类型', 'type/Text', null, '', null, '', '0', '228', null, '文案类型', 'normal', null, '2018', null, null, null);
INSERT INTO `metabase_field` VALUES ('1771', '2017-06-29 21:51:00', '2017-06-29 21:51:00', 'id', 'type/Integer', 'type/PK', '', null, '', '0', '235', null, 'ID', 'normal', null, '2050', null, null, null);
INSERT INTO `metabase_field` VALUES ('1772', '2017-06-29 21:51:00', '2017-06-29 21:51:00', 'projid', 'type/Integer', null, '', null, '', '0', '235', null, 'Pro Jid', 'normal', null, '2051', null, null, null);
INSERT INTO `metabase_field` VALUES ('1773', '2017-06-29 21:51:00', '2017-06-29 21:51:00', 'taskid', 'type/Integer', null, '', null, '', '0', '235', null, 'Task ID', 'normal', null, '2052', null, null, null);
INSERT INTO `metabase_field` VALUES ('1774', '2017-06-29 21:51:00', '2017-06-29 21:51:00', 'time', 'type/Integer', null, '', null, '', '0', '235', null, 'Time', 'normal', null, '2053', null, null, null);
INSERT INTO `metabase_field` VALUES ('1775', '2017-06-29 21:51:00', '2017-06-29 21:51:00', 'uid', 'type/Integer', null, '', null, '', '0', '235', null, 'UID', 'normal', null, '2054', null, null, null);
INSERT INTO `metabase_field` VALUES ('1776', '2017-06-29 21:51:00', '2017-06-29 21:51:00', '微信号', 'type/Text', null, '', null, '', '0', '235', null, '微信号', 'normal', null, '2055', null, null, null);
INSERT INTO `metabase_field` VALUES ('1777', '2017-06-29 21:51:00', '2017-06-29 21:51:00', '推广计划ID', 'type/Integer', null, '', null, '', '0', '235', null, '推广计划id', 'normal', null, '2056', null, null, null);
INSERT INTO `metabase_field` VALUES ('1778', '2017-06-29 21:51:01', '2017-06-29 21:51:01', '转化周期', 'type/Float', null, '', null, '', '0', '235', null, '转化周期', 'normal', null, '2057', null, null, null);
INSERT INTO `metabase_field` VALUES ('1779', '2017-06-29 21:51:01', '2017-06-29 21:51:01', '销售单价', 'type/Float', null, '', null, '', '0', '235', null, '销售单价', 'normal', null, '2058', null, null, null);

-- ----------------------------
-- Table structure for `metabase_fieldvalues`
-- ----------------------------
DROP TABLE IF EXISTS `metabase_fieldvalues`;
CREATE TABLE `metabase_fieldvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `values` text COLLATE utf8_unicode_ci,
  `human_readable_values` text COLLATE utf8_unicode_ci,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fieldvalues_field_id` (`field_id`),
  CONSTRAINT `fk_fieldvalues_ref_field_id` FOREIGN KEY (`field_id`) REFERENCES `metabase_field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=551 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of metabase_fieldvalues
-- ----------------------------
INSERT INTO `metabase_fieldvalues` VALUES ('11', '2017-06-22 10:48:01', '2017-06-25 14:18:24', '[\"23946449\",\"99338236\"]', null, '41');
INSERT INTO `metabase_fieldvalues` VALUES ('12', '2017-06-22 10:48:02', '2017-06-25 14:18:24', '[\"1476199317273\",\"1477128624869\",\"1481596575715\",\"1481600727531\",\"1481601140802\",\"1482315450532\",\"1483101432635\",\"1483454024559\",\"1483454962453\"]', null, '42');
INSERT INTO `metabase_fieldvalues` VALUES ('14', '2017-06-22 10:48:02', '2017-06-25 14:18:25', '[\"1476199317273\",\"1477128624869\",\"1481600727531\",\"1482315450532\",\"1483101216507\",\"1483438554028\",\"1483453107930\",\"1483454024559\",\"1483454962453\"]', null, '44');
INSERT INTO `metabase_fieldvalues` VALUES ('15', '2017-06-22 10:48:03', '2017-06-25 14:18:25', '[67812013,67812014,67812022,67812057]', null, '46');
INSERT INTO `metabase_fieldvalues` VALUES ('16', '2017-06-22 10:48:03', '2017-06-25 14:18:25', '[\"\"]', null, '47');
INSERT INTO `metabase_fieldvalues` VALUES ('17', '2017-06-22 10:48:03', '2017-06-25 14:18:25', '[\"3\",\"5\",\"8\",\"afds\",\"dsfdsaf\",\"sdfasdfsadf\",\"倒萨发射点\",\"图片测试\",\"阿斯蒂芬\"]', null, '48');
INSERT INTO `metabase_fieldvalues` VALUES ('18', '2017-06-22 10:48:04', '2017-06-25 14:18:25', '[\"3\",\"7\"]', null, '49');
INSERT INTO `metabase_fieldvalues` VALUES ('19', '2017-06-22 10:48:04', '2017-06-25 14:18:25', '[\"asdfsadfsadf\",\"法大师傅撒旦啊发多少发士大夫阿斯蒂芬第三方撒地方发士大夫\",\"评论试一下\"]', null, '50');
INSERT INTO `metabase_fieldvalues` VALUES ('20', '2017-06-22 10:48:04', '2017-06-25 14:18:25', '[\"1480217368549\",\"1482809050563\",\"1482812616367\"]', null, '52');
INSERT INTO `metabase_fieldvalues` VALUES ('21', '2017-06-22 10:48:04', '2017-06-25 14:18:25', '[\"99338236\"]', null, '53');
INSERT INTO `metabase_fieldvalues` VALUES ('22', '2017-06-22 10:48:05', '2017-06-25 14:18:26', '[\"23946449\",\"99338236\",\"null\"]', null, '54');
INSERT INTO `metabase_fieldvalues` VALUES ('23', '2017-06-22 10:48:05', '2017-06-25 14:18:26', '[\"1476780058403\",\"1478058171504\",\"1478067810945\",\"1478319296389\",\"1478676487221\",\"1478676525722\",\"1478699065626\",\"1478876239909\",\"1480135078632\",\"1480324707740\",\"1481007986833\",\"1481009156059\",\"1481341248182\",\"1481966069167\",\"1481966101666\",\"1482648622551\",\"1482845507905\",\"1483496474250\"]', null, '55');
INSERT INTO `metabase_fieldvalues` VALUES ('24', '2017-06-22 10:48:06', '2017-06-25 14:18:26', '[\"1476780058403\",\"1478058171504\",\"1478067810945\",\"1478319296389\",\"1478676487221\",\"1478676525722\",\"1478699065626\",\"1478876239909\",\"1480135078632\",\"1480324707740\",\"1481007986833\",\"1481009156059\",\"1481341248182\",\"1481966069167\",\"1481966101666\",\"1482648622551\",\"1482845507905\",\"1483496474250\"]', null, '57');
INSERT INTO `metabase_fieldvalues` VALUES ('25', '2017-06-22 10:48:06', '2017-06-25 14:18:26', '[1,2,3,4,5,6]', null, '59');
INSERT INTO `metabase_fieldvalues` VALUES ('26', '2017-06-22 10:48:06', '2017-06-25 14:18:26', '[\"history\",\"下一阶段\",\"历史\",\"将自动生成的项目文档编辑成标准文档\",\"报表\",\"数据分析\",\"数据库更改记录\",\"文档整理\",\"方向\",\"添加文章\",\"甘特图\",\"知识整理\",\"自动生成项目文档\",\"通知\",\"量化\",\"销售量报表\",\"项目模板\"]', null, '61');
INSERT INTO `metabase_fieldvalues` VALUES ('28', '2017-06-22 10:48:07', '2017-06-25 14:18:27', '[\"\",\"3\",\"5\",\"8888\",\"9999\",\"adfasdfasdf\",\"adsf\",\"afdsf\",\"afsd\",\"AFSDF\",\"asdf\",\"asdfafdsf\",\"asdfafdsffasdf\",\"asdfas\",\"asdfasd\",\"asdfasf\",\"asfdd\",\"DDD\",\"DDDDDDD\",\"dddddddddddddddddddddd\",\"dfsad\",\"eeee\",\"fadsf\",\"fasd\",\"fasdf\",\"FFF\",\"FFFFF\",\"fsad\",\"fsda\",\"jixianc\",\"RRR\",\"sadfasdfsadfasfdasdfasfdasdfasdfasfd\",\"table-bordered\",\"TTT\",\"vxzcv\",\"zzz\",\"zzzz\",\"一级目录\",\"付费电视\",\"任务审核优化\",\"任务页优化\",\"似的发射点发射点\",\"前端工程化\",\"参考资料：安晴公司积分及行政管理制度\",\"发\",\"发士大夫\",\"发大水\",\"啊三大富士达\",\"啊手动阀\",\"啊手动阀手动阀\",\"啊手动阀阿迪斯发\",\"士大夫撒地方\",\"大法师大法师\",\"实施方案\",\"开发阶段\",\"我的积分\",\"手动阀第三方\",\"报表\",\"撒旦范德萨分\",\"是打发士大夫\",\"测试\",\"测试2\",\"添加子目录\",\"添加子目录2\",\"添加目录\",\"添加目录1\",\"添加目录2\",\"添加目录3\",\"添加目录4\",\"添加目录5\",\"添加目录6\",\"添加空木\",\"爱的色放\",\"甘特图\",\"的首发式地方\",\"知识整理\",\"积分制管理解决方案\",\"积分商城\",\"系统设置\",\"通用\",\"通知\",\"阿斯蒂芬\",\"阿斯蒂芬2\",\"阿斯蒂芬23\",\"阿斯蒂芬234\",\"阿斯蒂芬2345\",\"阿斯蒂芬撒地方\",\"阿斯顿发生\"]', null, '64');
INSERT INTO `metabase_fieldvalues` VALUES ('29', '2017-06-22 10:48:08', '2017-06-25 14:18:28', '[\"0\",\"67812013\",\"67812014\",\"67812016\",\"67812017\",\"67812022\",\"67812057\",\"67812058\",\"67812059\",\"67812063\",\"67812079\",\"67812081\",\"67812093\",\"67812096\",\"67812097\",\"67812098\",\"67812099\",\"67812100\",\"67812111\",\"67812112\",\"67812116\",\"67812118\",\"67812126\",\"67812128\",\"67812130\",\"67812131\",\"67812134\",\"67812155\",\"67812224\",\"67812229\",\"67812234\",\"67812239\",\"67812242\",\"67812266\",\"67812267\"]', null, '65');
INSERT INTO `metabase_fieldvalues` VALUES ('30', '2017-06-22 10:48:08', '2017-06-25 14:18:28', '[-3,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35]', null, '66');
INSERT INTO `metabase_fieldvalues` VALUES ('31', '2017-06-22 10:48:08', '2017-06-25 14:18:28', '[-6,-5,-4,-3,-2,-1,0,1,2,3]', null, '67');
INSERT INTO `metabase_fieldvalues` VALUES ('32', '2017-06-22 10:48:08', '2017-06-25 14:18:28', '[\"1477128453390\",\"1477128459744\",\"1477128789838\",\"1477128793479\",\"1477128810259\",\"1477128813355\",\"1477128816742\",\"1477128819941\",\"1483453661718\",\"1483453774901\",\"1483454968281\",\"1483454974704\",\"1483454980666\",\"1483454987798\",\"1483454997250\",\"1483520996436\",\"1483521290221\",\"1483521294324\",\"1483544061619\",\"1483544077724\",\"1483544175272\",\"1483544245607\",\"1483587436472\",\"1483587551541\",\"1483587854022\",\"1483587874609\",\"1483625996391\",\"1483626001989\",\"1483626011883\",\"1484110650893\",\"1484124966567\",\"1484140527375\",\"1484149094597\",\"1484149120811\",\"1484149137928\",\"1484542370121\",\"1486389854245\",\"1486703689869\",\"1487753457429\",\"1488249468240\",\"1488250370594\",\"1488250415550\",\"1488273689096\",\"1488857832615\",\"1489125703057\",\"1490175946353\",\"1490693845599\",\"1491475612967\",\"1493273215376\",\"1494405847361\",\"1494407398456\",\"1494408170766\",\"1494408285151\",\"1494408370158\",\"1496216816636\",\"1496217133726\",\"1496217198338\",\"1496220504408\",\"1496220742813\",\"1496220907833\",\"1496222065192\",\"1496286457017\",\"1496287771244\",\"1496289949564\",\"1496290092628\",\"1496653677130\",\"1496654716652\",\"1496656085839\",\"1496656098005\",\"1496656447800\",\"1496656459082\",\"1496656467803\",\"1496656479046\",\"1496738295865\",\"1496740213571\",\"1496740221087\",\"1496740589714\",\"1497621802048\",\"1497622007386\",\"1497622009315\",\"1497622010652\",\"1497622011961\",\"1497622013792\",\"1497622077140\",\"1497622582708\",\"1497622592089\",\"1497627157151\",\"1497627165086\",\"1497627169809\",\"1497627175433\",\"1497627179333\",\"1497631874284\",\"1497631877191\",\"1497631879681\",\"1497632136233\",\"1497632151003\",\"1497632168433\",\"1497632245344\",\"1497632253436\",\"1497632261679\",\"1497632269937\",\"1497632275376\",\"1497632308261\",\"1497632313903\"]', null, '68');
INSERT INTO `metabase_fieldvalues` VALUES ('33', '2017-06-22 10:48:09', '2017-06-25 14:18:28', '[\"23946449\",\"99338236\"]', null, '69');
INSERT INTO `metabase_fieldvalues` VALUES ('34', '2017-06-22 10:48:09', '2017-06-25 14:18:28', '[\"OA开发\",\"stock\",\"开发\",\"报表目录\",\"添加笔记本\",\"高级学习课程\"]', null, '72');
INSERT INTO `metabase_fieldvalues` VALUES ('35', '2017-06-22 10:48:09', '2017-06-25 14:18:28', '[\"0\",\"3\"]', null, '73');
INSERT INTO `metabase_fieldvalues` VALUES ('36', '2017-06-22 10:48:09', '2017-06-25 14:18:28', '[\"1476780048667\",\"1478058166120\",\"1478067804988\",\"1478676514475\",\"1481341236255\",\"1482648610645\"]', null, '74');
INSERT INTO `metabase_fieldvalues` VALUES ('37', '2017-06-22 10:48:10', '2017-06-25 14:18:28', '[\"23946449\",\"99338236\",\"null\"]', null, '75');
INSERT INTO `metabase_fieldvalues` VALUES ('38', '2017-06-22 10:48:11', '2017-06-25 14:18:30', '[\"ab\",\"ak\",\"al\",\"aq\",\"as\",\"ay\",\"bb\",\"bc\",\"bd\",\"be\",\"bh\",\"bj\",\"bs\",\"bt\",\"bx\",\"by\",\"bz\",\"cc\",\"cd\",\"cf\",\"ch\",\"cq\",\"cs\",\"cx\",\"cy\",\"cz\",\"dd\",\"dh\",\"dl\",\"dq\",\"dt\",\"dw\",\"dx\",\"dxal\",\"dy\",\"dz\",\"ee\",\"es\",\"ez\",\"fc\",\"fs\",\"ft\",\"fx\",\"fy\",\"fz\",\"ga\",\"gg\",\"gl\",\"gm\",\"gn\",\"gs\",\"gy\",\"gz\",\"ha\",\"hb\",\"hc\",\"hd\",\"heb\",\"hf\",\"hg\",\"hh\",\"hk\",\"hl\",\"hld\",\"hm\",\"hn\",\"hs\",\"ht\",\"hx\",\"hy\",\"hz\",\"ja\",\"jc\",\"jd\",\"jdz\",\"jh\",\"jj\",\"jl\",\"jm\",\"jms\",\"jn\",\"jq\",\"jx\",\"jy\",\"jz\",\"kf\",\"kl\",\"km\",\"kz\",\"la\",\"lb\",\"lc\",\"ld\",\"lf\",\"lh\",\"lj\",\"ll\",\"ln\",\"lp\",\"ls\",\"lw\",\"lx\",\"ly\",\"lyg\",\"lz\",\"mas\",\"mdj\",\"mm\",\"ms\",\"mz\",\"nb\",\"nc\",\"nd\",\"nj\",\"nn\",\"np\",\"nq\",\"nt\",\"ny\",\"pds\",\"pj\",\"pl\",\"px\",\"py\",\"pzh\",\"qd\",\"qhd\",\"qj\",\"qq\",\"qth\",\"qy\",\"qz\",\"rg\",\"rz\",\"sg\",\"sh\",\"sjz\",\"sl\",\"sm\",\"smx\",\"sn\",\"sp\",\"sq\",\"st\",\"sw\",\"sx\",\"sy\",\"sz\",\"ta\",\"tc\",\"th\",\"tj\",\"tl\",\"tr\",\"ts\",\"ty\",\"tz\",\"wh\",\"wl\",\"wn\",\"ws\",\"ww\",\"wx\",\"wz\",\"xa\",\"xc\",\"xf\",\"xg\",\"xl\",\"xm\",\"xn\",\"xs\",\"xt\",\"xx\",\"xy\",\"xz\",\"ya\",\"yb\",\"yc\",\"yf\",\"yj\",\"yk\",\"yl\",\"yq\",\"ys\",\"yt\",\"yx\",\"yy\",\"yz\",\"zb\",\"zc\",\"zg\",\"zh\",\"zj\",\"zjj\",\"zjk\",\"zk\",\"zmd\",\"zq\",\"zs\",\"zt\",\"zw\",\"zy\",\"zz\"]', null, '81');
INSERT INTO `metabase_fieldvalues` VALUES ('39', '2017-06-22 10:48:12', '2017-06-25 14:18:30', '[0,1]', null, '82');
INSERT INTO `metabase_fieldvalues` VALUES ('40', '2017-06-22 10:48:12', '2017-06-25 14:18:30', '[\"110000\",\"120000\",\"130000\",\"140000\",\"150000\",\"210000\",\"220000\",\"230000\",\"310000\",\"320000\",\"330000\",\"340000\",\"350000\",\"360000\",\"370000\",\"410000\",\"420000\",\"430000\",\"440000\",\"450000\",\"460000\",\"500000\",\"510000\",\"520000\",\"530000\",\"540000\",\"610000\",\"620000\",\"630000\",\"640000\",\"650000\"]', null, '83');
INSERT INTO `metabase_fieldvalues` VALUES ('41', '2017-06-22 10:48:12', '2017-06-25 14:18:30', '[1]', null, '84');
INSERT INTO `metabase_fieldvalues` VALUES ('42', '2017-06-22 10:48:13', '2017-06-25 14:18:30', '[\"INSERT\",\"UPDATE\"]', null, '88');
INSERT INTO `metabase_fieldvalues` VALUES ('43', '2017-06-22 10:48:13', '2017-06-25 14:18:30', '[0,1]', null, '89');
INSERT INTO `metabase_fieldvalues` VALUES ('44', '2017-06-22 10:48:14', '2017-06-25 14:18:30', '[1,2,3,4,6,14,16,17,23,24,25,29,30,32,33,35,36,40,41,45,46,50,51,55,56,60,64,65,85,99,100,104,105,106,116,117,121,122,123,133,134,138,139,140,150,151,155,159,160,176,187,188,192,193,194,204,205,209,210,211,221,222,226,227,228,238,239,243,244,245,256,257,261,262,263,274,275,279,280,281,292,293,297,298,299,309,310,314,315,316,327,328,332,333,334,360,361,362,363,364,408,409,419,420,437,450,525,544,559,560,561,562,563,623,624]', null, '90');
INSERT INTO `metabase_fieldvalues` VALUES ('45', '2017-06-22 10:48:14', '2017-06-25 14:18:31', '[42,45,46,47,48,49,50,51,52,55,56,58,59,61,62,63,64,65,66,67,68,73,76,77,78,79,81,91]', null, '92');
INSERT INTO `metabase_fieldvalues` VALUES ('46', '2017-06-22 10:48:15', '2017-06-25 14:18:31', '[2,3,4,5,6,11,14,17,18,19,20,21,24,25,26,27,28,30,31,32,33,34,36,37,38,39,41,42,43,44,46,47,48,49,51,52,53,54,56,57,58,59,60,61,62,63,65,66,67,68,73,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,151,152,153,154,155,156,157,158,160,161,162,163,165,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,361,362,363,364,365,409,410,411,412,420,421,422,423,437,451,544,550,560,561,562,563,564,624,626]', null, '93');
INSERT INTO `metabase_fieldvalues` VALUES ('47', '2017-06-22 10:48:15', '2017-06-25 14:18:31', '[1,2,3]', null, '94');
INSERT INTO `metabase_fieldvalues` VALUES ('48', '2017-06-22 10:48:15', '2017-06-25 14:18:31', '[\"67812013\",\"67812022\",\"67812022,67812131,67812132,67812135,67812136,67812137,67812152,67812153,67812154,67812155,67812242\",\"67812023\",\"67812118\"]', null, '95');
INSERT INTO `metabase_fieldvalues` VALUES ('49', '2017-06-22 10:48:16', '2017-06-25 14:18:31', '[\"\",\"04187198\",\"99338236\",\"99338236,51230085\",\"99338236,99338236\"]', null, '98');
INSERT INTO `metabase_fieldvalues` VALUES ('50', '2017-06-22 10:48:16', '2017-06-25 14:18:32', '[\"推广\",\"文案\",\"测试\",\"管理元\",\"销售部\"]', null, '99');
INSERT INTO `metabase_fieldvalues` VALUES ('51', '2017-06-22 10:48:16', '2017-06-25 14:18:32', '[\"1,2,3,4,5,6,7,8,10,12\",\"1,2,3,4,5,6,7,8,10,12,13\",\"1,2,3,4,5,7,10\",\"1,2,3,5,7\",\"1,2,4,5,7\"]', null, '100');
INSERT INTO `metabase_fieldvalues` VALUES ('52', '2017-06-22 10:48:17', '2017-06-25 14:18:32', '[\"\"]', null, '101');
INSERT INTO `metabase_fieldvalues` VALUES ('53', '2017-06-22 10:48:17', '2017-06-25 14:18:32', '[\"\"]', null, '102');
INSERT INTO `metabase_fieldvalues` VALUES ('54', '2017-06-22 10:48:17', '2017-06-25 14:18:32', '[\"0\"]', null, '105');
INSERT INTO `metabase_fieldvalues` VALUES ('55', '2017-06-22 10:48:18', '2017-06-25 14:18:32', '[\"目asdf的3\"]', null, '106');
INSERT INTO `metabase_fieldvalues` VALUES ('56', '2017-06-22 10:48:18', '2017-06-25 14:18:32', '[\"\",\"fdsafsad\"]', null, '107');
INSERT INTO `metabase_fieldvalues` VALUES ('57', '2017-06-22 10:48:18', '2017-06-25 14:18:32', '[\"2\"]', null, '108');
INSERT INTO `metabase_fieldvalues` VALUES ('58', '2017-06-22 10:48:18', '2017-06-25 14:18:33', '[\"\"]', null, '109');
INSERT INTO `metabase_fieldvalues` VALUES ('59', '2017-06-22 10:48:18', '2017-06-25 14:18:33', '[\"fdsa\",\"fdsafsad\"]', null, '110');
INSERT INTO `metabase_fieldvalues` VALUES ('60', '2017-06-22 10:48:19', '2017-06-25 14:18:33', '[\"10点\",\"asdf\",\"asdfafsd\"]', null, '112');
INSERT INTO `metabase_fieldvalues` VALUES ('61', '2017-06-22 10:48:19', '2017-06-25 14:18:33', '[\"fdsa\",\"fdsafsad\",\"落地页\"]', null, '113');
INSERT INTO `metabase_fieldvalues` VALUES ('62', '2017-06-22 10:48:25', '2017-06-25 14:18:36', '[\"0F\"]', null, '181');
INSERT INTO `metabase_fieldvalues` VALUES ('63', '2017-06-22 10:48:25', '2017-06-25 14:18:36', '[\"0.16KB\",\"0.36KB\",\"0.65KB\",\"113.76KB\",\"12.04KB\",\"12.83KB\",\"14.71KB\",\"148.44KB\",\"15.76KB\",\"17.69KB\",\"2.7KB\",\"335.56KB\",\"39KB\",\"4.57KB\",\"68.96KB\",\"6KB\",\"73.54KB\",\"75.33KB\"]', null, '182');
INSERT INTO `metabase_fieldvalues` VALUES ('64', '2017-06-22 10:48:26', '2017-06-25 14:18:36', '[\"888888.pdf\",\"a9c530c2d154af2bd6ed8e1b1437a49.jpg\",\"app.docx\",\"gui-config.json\",\"mytask.txt\",\"OA优化.docx\",\"python同花顺外挂试用说明.docx\",\"QQ截图20161012171844.png\",\"Scan.pdf\",\"test.py\",\"thstrade.cpython-35.pyc\",\"thstrade.py\",\"~$thon同花顺外挂试用说明.docx\",\"截图00.png\",\"报表.xls\",\"策略改进1.txt\",\"策略改进3.txt\",\"自动输入代码双均线策略.py\"]', null, '183');
INSERT INTO `metabase_fieldvalues` VALUES ('65', '2017-06-22 10:48:26', '2017-06-25 14:18:36', '[0]', null, '185');
INSERT INTO `metabase_fieldvalues` VALUES ('66', '2017-06-22 10:48:27', '2017-06-25 14:18:36', '[\"1476189188600\",\"1476416767336\",\"1476416794033\",\"1476418684774\",\"1478067925390\",\"1478272620182\",\"1478272902614\",\"1478272922726\",\"1478332922491\",\"1480651961195\",\"1480659611646\",\"1480659641520\",\"1480660161131\",\"1480660171465\",\"1480660181762\",\"1481611962419\",\"1481621686408\",\"1481621697542\",\"1481621703322\",\"1481621709075\",\"1481862513584\",\"1481862521421\",\"1482732709246\",\"1482733566578\",\"1482733803969\",\"1482734498301\",\"1482734883491\",\"1482735342922\"]', null, '188');
INSERT INTO `metabase_fieldvalues` VALUES ('67', '2017-06-22 10:48:27', '2017-06-25 14:18:36', '[\"23569849\",\"23946449\",\"99338236\"]', null, '190');
INSERT INTO `metabase_fieldvalues` VALUES ('68', '2017-06-22 10:48:28', '2017-06-25 14:18:36', '[\"媒体编码\",\"项目\"]', null, '195');
INSERT INTO `metabase_fieldvalues` VALUES ('69', '2017-06-22 10:48:28', '2017-06-25 14:18:36', '[\"士大夫\",\"爱的色放\",\"第三方\",\"阿斯蒂芬\",\"项目1\"]', null, '196');
INSERT INTO `metabase_fieldvalues` VALUES ('70', '2017-06-22 10:48:29', '2017-06-25 14:18:37', '[\"1\",\"2\",\"3\",\"4\"]', null, '197');
INSERT INTO `metabase_fieldvalues` VALUES ('71', '2017-06-22 10:48:29', '2017-06-25 14:18:37', '[\"媒体编码表\",\"所有项目\"]', null, '198');
INSERT INTO `metabase_fieldvalues` VALUES ('72', '2017-06-22 10:48:29', '2017-06-25 14:18:37', '[\"111\",\"222\",\"adsf\",\"afdsdfasfd\",\"as\",\"asd\",\"asdf\",\"asdfa\",\"asdfadsfadsf\",\"asfd\",\"ddsf\",\"df\",\"dfasdfsdfasdfasd\",\"f\",\"fd\",\"sadf\",\"啊放大说\",\"士大夫111\",\"士大夫222\",\"士大夫333\",\"撒地方\",\"第三方1\",\"第三方2\",\"第三方3\",\"范德萨\",\"阿斯蒂芬\"]', null, '199');
INSERT INTO `metabase_fieldvalues` VALUES ('73', '2017-06-22 10:48:29', '2017-06-25 14:18:37', '[\"a\",\"媒体账号\",\"字段2\",\"选择媒体账号\"]', null, '200');
INSERT INTO `metabase_fieldvalues` VALUES ('74', '2017-06-22 10:48:30', '2017-06-25 14:18:37', '[\"fasdf\",\"下拉选择框注释测试\",\"媒体账号表\",\"添加推广计划\",\"添加推广计划2\"]', null, '201');
INSERT INTO `metabase_fieldvalues` VALUES ('75', '2017-06-22 10:48:31', '2017-06-25 14:18:37', '[0,1]', null, '209');
INSERT INTO `metabase_fieldvalues` VALUES ('76', '2017-06-22 10:48:31', '2017-06-25 14:18:37', '[0,1]', null, '210');
INSERT INTO `metabase_fieldvalues` VALUES ('77', '2017-06-22 10:48:31', '2017-06-25 14:18:37', '[\"dsfads\",\"dsfasdfdsaf\",\"啊都是范德萨发\",\"啊飞洒地方\",\"媒体编码\",\"添加媒体编码\",\"添加媒体编码2\",\"爱的色放撒旦发射点\",\"连续添加\",\"阿斯蒂芬撒地方\"]', null, '211');
INSERT INTO `metabase_fieldvalues` VALUES ('78', '2017-06-22 10:48:32', '2017-06-25 14:18:38', '[0,1]', null, '213');
INSERT INTO `metabase_fieldvalues` VALUES ('79', '2017-06-22 10:48:32', '2017-06-25 14:18:38', '[0,1]', null, '214');
INSERT INTO `metabase_fieldvalues` VALUES ('80', '2017-06-22 10:48:32', '2017-06-25 14:18:38', '[\"1\",\"10\",\"11\",\"13\",\"2\",\"3\"]', null, '215');
INSERT INTO `metabase_fieldvalues` VALUES ('81', '2017-06-22 10:48:32', '2017-06-25 14:18:38', '[\"asdfsad fsdf asdf\",\"d\",\"f\",\"fd\",\"啊倒萨发射点发士大夫撒旦速度\",\"啊手动阀手动阀士大夫都是\",\"媒体编码1\",\"媒体编码2\",\"媒体账号\",\"媒体账号2\",\"撒旦飞洒地方阿斯蒂芬\"]', null, '216');
INSERT INTO `metabase_fieldvalues` VALUES ('82', '2017-06-22 10:48:33', '2017-06-25 14:18:39', '[\"\",\"asdfsadfsadfsadf\"]', null, '221');
INSERT INTO `metabase_fieldvalues` VALUES ('83', '2017-06-22 10:48:33', '2017-06-25 14:18:39', '[\"2016-10-12 00:00\",\"2016-10-13 00:00\",\"2016-10-21 00:00\",\"2016-11-06 00:00\"]', null, '222');
INSERT INTO `metabase_fieldvalues` VALUES ('84', '2017-06-22 10:48:34', '2017-06-25 14:18:39', '[\"2016-10-12 00:00\",\"2016-10-13 00:00\",\"2016-10-18 00:00\",\"2016-11-05 00:00\"]', null, '224');
INSERT INTO `metabase_fieldvalues` VALUES ('85', '2017-06-22 10:48:34', '2017-06-25 14:18:39', '[\"1\",\"2\",\"3\"]', null, '225');
INSERT INTO `metabase_fieldvalues` VALUES ('86', '2017-06-22 10:48:34', '2017-06-25 14:18:39', '[\"事假\",\"年假\"]', null, '226');
INSERT INTO `metabase_fieldvalues` VALUES ('87', '2017-06-22 10:48:34', '2017-06-25 14:18:39', '[\"23946449\",\"76821697\",\"99338236\"]', null, '227');
INSERT INTO `metabase_fieldvalues` VALUES ('88', '2017-06-22 10:48:39', '2017-06-25 14:18:42', '[0]', null, '285');
INSERT INTO `metabase_fieldvalues` VALUES ('89', '2017-06-22 10:48:39', '2017-06-25 14:18:42', '[1]', null, '286');
INSERT INTO `metabase_fieldvalues` VALUES ('90', '2017-06-22 10:48:43', '2017-06-25 14:18:44', '[\"0\",\"1.0\",\"13430252119scca\",\"1491817194440\",\"25\",\"4096\",\"5\",\"9090\",\"9091\",\"admin@localhost,99338236@localhost\",\"com.mysql.jdbc.Driver\",\"false\",\"jdbc:mysql://localhost:3306/wxb_site_new?rewriteBatchedStatements=true\",\"localhost\",\"mFK35Pz571J700q\",\"org.jivesoftware.database.DefaultConnectionProvider\",\"org.jivesoftware.openfire.admin.DefaultAdminProvider\",\"org.jivesoftware.openfire.auth.DefaultAuthProvider\",\"org.jivesoftware.openfire.group.DefaultGroupProvider\",\"org.jivesoftware.openfire.lockout.DefaultLockOutProvider\",\"org.jivesoftware.openfire.security.DefaultSecurityAuditProvider\",\"org.jivesoftware.openfire.user.DefaultUserProvider\",\"org.jivesoftware.openfire.vcard.DefaultVCardProvider\",\"root\",\"select 1\",\"true\",\"zh_CN\"]', null, '308');
INSERT INTO `metabase_fieldvalues` VALUES ('91', '2017-06-22 10:48:43', '2017-06-25 14:18:44', '[\"owner\"]', null, '309');
INSERT INTO `metabase_fieldvalues` VALUES ('92', '2017-06-22 10:48:44', '2017-06-25 14:18:45', '[\"open\"]', null, '313');
INSERT INTO `metabase_fieldvalues` VALUES ('93', '2017-06-22 10:48:44', '2017-06-25 14:18:45', '[\"all\"]', null, '314');
INSERT INTO `metabase_fieldvalues` VALUES ('94', '2017-06-22 10:48:45', '2017-06-25 14:18:45', '[0,1]', null, '315');
INSERT INTO `metabase_fieldvalues` VALUES ('95', '2017-06-22 10:48:45', '2017-06-25 14:18:45', '[\"English\"]', null, '316');
INSERT INTO `metabase_fieldvalues` VALUES ('96', '2017-06-22 10:48:45', '2017-06-25 14:18:45', '[0,1]', null, '318');
INSERT INTO `metabase_fieldvalues` VALUES ('97', '2017-06-22 10:48:45', '2017-06-25 14:18:46', '[-1]', null, '319');
INSERT INTO `metabase_fieldvalues` VALUES ('98', '2017-06-22 10:48:46', '2017-06-25 14:18:46', '[0,5120]', null, '320');
INSERT INTO `metabase_fieldvalues` VALUES ('99', '2017-06-22 10:48:46', '2017-06-25 14:18:46', '[1]', null, '321');
INSERT INTO `metabase_fieldvalues` VALUES ('100', '2017-06-22 10:48:46', '2017-06-25 14:18:46', '[1]', null, '322');
INSERT INTO `metabase_fieldvalues` VALUES ('101', '2017-06-22 10:48:46', '2017-06-25 14:18:46', '[1]', null, '323');
INSERT INTO `metabase_fieldvalues` VALUES ('102', '2017-06-22 10:48:46', '2017-06-25 14:18:46', '[0]', null, '324');
INSERT INTO `metabase_fieldvalues` VALUES ('103', '2017-06-22 10:48:47', '2017-06-25 14:18:46', '[0]', null, '325');
INSERT INTO `metabase_fieldvalues` VALUES ('104', '2017-06-22 10:48:47', '2017-06-25 14:18:46', '[\"publishers\"]', null, '326');
INSERT INTO `metabase_fieldvalues` VALUES ('105', '2017-06-22 10:48:47', '2017-06-25 14:18:46', '[0,1]', null, '328');
INSERT INTO `metabase_fieldvalues` VALUES ('106', '2017-06-22 10:48:47', '2017-06-25 14:18:46', '[1]', null, '330');
INSERT INTO `metabase_fieldvalues` VALUES ('107', '2017-06-22 10:48:49', '2017-06-25 14:18:47', '[\"open\"]', null, '337');
INSERT INTO `metabase_fieldvalues` VALUES ('108', '2017-06-22 10:48:50', '2017-06-25 14:18:47', '[\"all\"]', null, '338');
INSERT INTO `metabase_fieldvalues` VALUES ('109', '2017-06-22 10:48:51', '2017-06-25 14:18:47', '[\"\"]', null, '339');
INSERT INTO `metabase_fieldvalues` VALUES ('110', '2017-06-22 10:48:51', '2017-06-25 14:18:47', '[0]', null, '340');
INSERT INTO `metabase_fieldvalues` VALUES ('111', '2017-06-22 10:48:52', '2017-06-25 14:18:48', '[\"001491817157779\"]', null, '341');
INSERT INTO `metabase_fieldvalues` VALUES ('112', '2017-06-22 10:48:52', '2017-06-25 14:18:48', '[\"localhost\"]', null, '342');
INSERT INTO `metabase_fieldvalues` VALUES ('113', '2017-06-22 10:48:52', '2017-06-25 14:18:48', '[\"\"]', null, '343');
INSERT INTO `metabase_fieldvalues` VALUES ('114', '2017-06-22 10:48:53', '2017-06-25 14:18:48', '[0]', null, '344');
INSERT INTO `metabase_fieldvalues` VALUES ('115', '2017-06-22 10:48:53', '2017-06-25 14:18:48', '[\"\"]', null, '345');
INSERT INTO `metabase_fieldvalues` VALUES ('116', '2017-06-22 10:48:54', '2017-06-25 14:18:48', '[\"English\"]', null, '346');
INSERT INTO `metabase_fieldvalues` VALUES ('117', '2017-06-22 10:48:54', '2017-06-25 14:18:48', '[0]', null, '347');
INSERT INTO `metabase_fieldvalues` VALUES ('118', '2017-06-22 10:48:54', '2017-06-25 14:18:48', '[0]', null, '348');
INSERT INTO `metabase_fieldvalues` VALUES ('119', '2017-06-22 10:48:55', '2017-06-25 14:18:49', '[-1]', null, '349');
INSERT INTO `metabase_fieldvalues` VALUES ('120', '2017-06-22 10:48:55', '2017-06-25 14:18:49', '[0]', null, '350');
INSERT INTO `metabase_fieldvalues` VALUES ('121', '2017-06-22 10:48:55', '2017-06-25 14:18:49', '[\"001491817157779\"]', null, '351');
INSERT INTO `metabase_fieldvalues` VALUES ('122', '2017-06-22 10:48:56', '2017-06-25 14:18:49', '[\"\"]', null, '352');
INSERT INTO `metabase_fieldvalues` VALUES ('123', '2017-06-22 10:48:56', '2017-06-25 14:18:49', '[1]', null, '354');
INSERT INTO `metabase_fieldvalues` VALUES ('124', '2017-06-22 10:48:56', '2017-06-25 14:18:49', '[1]', null, '355');
INSERT INTO `metabase_fieldvalues` VALUES ('125', '2017-06-22 10:48:57', '2017-06-25 14:18:49', '[1]', null, '356');
INSERT INTO `metabase_fieldvalues` VALUES ('126', '2017-06-22 10:48:57', '2017-06-25 14:18:49', '[\"\"]', null, '358');
INSERT INTO `metabase_fieldvalues` VALUES ('127', '2017-06-22 10:48:58', '2017-06-25 14:18:49', '[0]', null, '359');
INSERT INTO `metabase_fieldvalues` VALUES ('128', '2017-06-22 10:48:58', '2017-06-25 14:18:49', '[0]', null, '360');
INSERT INTO `metabase_fieldvalues` VALUES ('129', '2017-06-22 10:48:58', '2017-06-25 14:18:49', '[\"publishers\"]', null, '361');
INSERT INTO `metabase_fieldvalues` VALUES ('130', '2017-06-22 10:48:58', '2017-06-25 14:18:50', '[0]', null, '363');
INSERT INTO `metabase_fieldvalues` VALUES ('131', '2017-06-22 10:48:59', '2017-06-25 14:18:50', '[1]', null, '365');
INSERT INTO `metabase_fieldvalues` VALUES ('132', '2017-06-22 10:49:03', '2017-06-25 14:18:52', '[\"name = 99338236, email = null, admin = true\"]', null, '403');
INSERT INTO `metabase_fieldvalues` VALUES ('133', '2017-06-22 10:49:03', '2017-06-25 14:18:52', '[1491817197406]', null, '404');
INSERT INTO `metabase_fieldvalues` VALUES ('134', '2017-06-22 10:49:03', '2017-06-25 14:18:52', '[\"localhost\"]', null, '406');
INSERT INTO `metabase_fieldvalues` VALUES ('135', '2017-06-22 10:49:03', '2017-06-25 14:18:52', '[\"created new user 99338236\"]', null, '407');
INSERT INTO `metabase_fieldvalues` VALUES ('136', '2017-06-22 10:49:03', '2017-06-25 14:18:52', '[\"admin\"]', null, '408');
INSERT INTO `metabase_fieldvalues` VALUES ('137', '2017-06-22 10:49:04', '2017-06-25 14:18:53', '[\"001490854626737\",\"001491817142619\",\"001491817197361\"]', null, '409');
INSERT INTO `metabase_fieldvalues` VALUES ('139', '2017-06-22 10:49:05', '2017-06-25 14:18:53', '[\"0d7a20cc3a04ee0e485fe4b0fa370c2745fb38d324d493b9\",\"8e2804d03ca3a786c0b8846b38313c240655dfeae76cbfc2\",\"e45ed86a0e0546dd0cfedc14e017486ec85e879d1ee4003a\"]', null, '411');
INSERT INTO `metabase_fieldvalues` VALUES ('140', '2017-06-22 10:49:05', '2017-06-25 14:18:53', '[4096]', null, '412');
INSERT INTO `metabase_fieldvalues` VALUES ('141', '2017-06-22 10:49:05', '2017-06-25 14:18:53', '[\"0\",\"001490854626737\",\"001491817197361\"]', null, '413');
INSERT INTO `metabase_fieldvalues` VALUES ('142', '2017-06-22 10:49:05', '2017-06-25 14:18:53', '[\"47222076\",\"66286007\",\"99338236\",\"Administrator\"]', null, '414');
INSERT INTO `metabase_fieldvalues` VALUES ('143', '2017-06-22 10:49:06', '2017-06-25 14:18:53', '[\"i32KqW/9abt50RSXMsM6alPPw/7Rdz1L\",\"QCmw2zrx0hMh7LmY7SIlFBD8n+BwbBg/\",\"ZYGqQr/ihNaWWdTl+xKv0W/MFv35Nlkv\"]', null, '416');
INSERT INTO `metabase_fieldvalues` VALUES ('144', '2017-06-22 10:49:06', '2017-06-25 14:18:53', '[\"BmpPW8fXTpkOfGHxiHt4BcxIoVk=\",\"KwFC4iVB5xbn3Itz9T8JbcDN6cw=\",\"wNC1sP8MEZWUrDYuuQyUaaKIhHI=\"]', null, '417');
INSERT INTO `metabase_fieldvalues` VALUES ('145', '2017-06-22 10:49:06', '2017-06-25 14:18:53', '[\"+6uPq1iKEgsX05CKck1rsLzKhqE=\",\"18OeKLXqllofFYPK2/Znua5Ie4U=\",\"PQPSnBStA3/plEHtkGlIiTVmXeI=\"]', null, '418');
INSERT INTO `metabase_fieldvalues` VALUES ('146', '2017-06-22 10:49:08', '2017-06-25 14:18:54', '[25]', null, '430');
INSERT INTO `metabase_fieldvalues` VALUES ('147', '2017-06-22 10:49:09', '2017-06-25 14:18:54', '[\"\",\" f三大fsdfdsf sd \",\" sdafsd发\",\"6666\",\"????\",\"???????\",\"aaa\",\"adfsadfasdfas\",\"ads\",\"adsfasdfasdfasdf\",\"adsfasdfsadfsadf\",\"as\",\"asd\",\"asdf\",\"asdfasdf\",\"asdfasdfasdfasfd\",\"asdfasdfsa\",\"asdfasdfsadfdsf\",\"asdfasfd\",\"asdfdsf\",\"asdfsadf\",\"asdfsadfsadfsd范德萨发士大夫fsd范德萨发士大夫fsd范德萨发士大夫fsd范德萨发士大夫fsd范德萨发士大夫fsd范德萨发士大夫fsd范德萨发士大夫fsd范德萨发士大夫fsd范德萨发士大夫fsd范德萨发士大夫fsd范德萨发士大夫fsd范德萨发士大夫\",\"asdfsd\",\"ddsf dsfdsf sda是fd fds \",\"df\",\"dfa\",\"dfas\",\"dsfasdfsdf\",\"dsfsadf\",\"f\",\"fas\",\"fasdf\",\"fasdfasdfasdfasfasdf\",\"fd\",\"fffffffffffffff\",\"fsa\",\"fuck\",\"null\",\"sa\",\"sad\",\"sadf\",\"sadfasdfasdfsadfasdf\",\"sadfsadf\",\"sadfsadfadsfsadfsadfsadfsadfsadf\",\"sdf\",\"sdfasdfsadf\",\"{\\\"name\\\":\\\"????:???????\\\",\\\"zsid\\\":\\\"67812131\\\"}\",\"{\\\"name\\\":\\\"????:onchange??\\\",\\\"zsid\\\":\\\"67812022\\\"}\",\"{\\\"name\\\":\\\"aaa\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"AAAAA\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"adsf\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"adsfasdf\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"adsfasfdasfd\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"asdf\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"asdfasdf\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"asdfs \\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"asdfsdf\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"fasd\\\",\\\"zsid\\\":\\\"67812108\\\"}\",\"{\\\"name\\\":\\\"fasdf \\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"fasdf\\\"}\",\"{\\\"name\\\":\\\"fffff\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"new\\\",\\\"zsid\\\":\\\"67812057\\\"}\",\"{\\\"name\\\":\\\"onchange事件\\\",\\\"zsid\\\":\\\"67812022\\\"}\",\"{\\\"name\\\":\\\"sadf\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"sdfasdf\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"任务数据\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"任务讨论内容空UI\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"任务页优化\\\",\\\"zsid\\\":\\\"67812174\\\"}\",\"{\\\"name\\\":\\\"协同消息处理服务器\\\",\\\"zsid\\\":\\\"67812153\\\"}\",\"{\\\"name\\\":\\\"发大水\\\",\\\"zsid\\\":\\\"67812094\\\"}\",\"{\\\"name\\\":\\\"啊手动阀\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀啊手动阀\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"啊手动阀手动阀\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"完成率\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"审核人\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"开发\\\",\\\"zsid\\\":\\\"67812118\\\"}\",\"{\\\"name\\\":\\\"开始时间\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"循环\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"执行标准\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"新版数据库架构\\\",\\\"zsid\\\":\\\"67812131\\\"}\",\"{\\\"name\\\":\\\"标记\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"根目录\\\",\\\"zsid\\\":\\\"67812128\\\"}\",\"{\\\"name\\\":\\\"水岸东方\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"添加成员引导按钮\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"添加空木\\\",\\\"zsid\\\":\\\"67812093\\\"}\",\"{\\\"name\\\":\\\"甘特图\\\",\\\"zsid\\\":\\\"67812135\\\"}\",\"{\\\"name\\\":\\\"积分制管理解决方案\\\",\\\"zsid\\\":\\\"67812155\\\"}\",\"{\\\"name\\\":\\\"绑定知识:fasd\\\",\\\"zsid\\\":\\\"67812108\\\"}\",\"{\\\"name\\\":\\\"绑定知识:onchange事件\\\",\\\"zsid\\\":\\\"67812022\\\"}\",\"{\\\"name\\\":\\\"结束时间\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"负责人\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"通知\\\",\\\"zsid\\\":\\\"67812119\\\"}\",\"{\\\"name\\\":\\\"量化项目\\\",\\\"zsid\\\":\\\"67812126\\\"}\",\"{\\\"name\\\":\\\"阿斯蒂芬\\\",\\\"zsid\\\":\\\"67812138\\\"}\",\"{\\\"name\\\":\\\"阿斯顿发射点\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"阿斯顿发生\\\",\\\"zsid\\\":null}\",\"{\\\"name\\\":\\\"飞洒地方\\\",\\\"zsid\\\":null}\",\"{}\",\"一边更换服务器一边做优化\",\"任务没有逾期啊 不用填吧\",\"写落地页文案，写好后要填表格\",\"原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因原因\",\"吸收经验吸收经验吸收经验吸收经验\",\"吸收经验吸收经验吸收经验吸收经验吸收经验吸收经验吸收经验吸收经验吸收经验吸收经验\",\"哈哈哈哈哈\",\"啊手动阀手动阀撒旦飞洒地方士大夫大师傅啊手动阀手动阀撒旦飞洒地方士大夫大师傅啊手动阀手动阀撒旦飞洒地方士大夫大师傅啊手动阀手动阀撒旦飞洒地方士大夫大师傅啊手动阀手动阀撒旦飞洒地方士大夫大师傅\",\"啊手动阀手动阀撒旦飞洒地方士大夫大师傅啊手动阀手动阀撒旦飞洒地方士大夫大师傅啊手动阀手动阀撒旦飞洒地方士大夫大师傅啊手动阀手动阀撒旦飞洒地方士大夫大师傅啊手动阀手动阀撒旦飞洒地方士大夫大师傅啊手动阀手动阀撒旦飞洒地方士大夫大师傅\",\"士大夫\",\"士大夫士大夫撒旦士大夫\",\"士大夫撒地方\",\"士大夫的萨菲山大发生士大夫 \",\"大师傅撒地方\",\"将写的文案文件上传上来\",\"打发士大夫士大夫\",\"执行标准\",\"执行标准1\",\"执行标准2\",\"执行标准3\",\"推广落地页并且填写表格\",\"早上9点填一次，下午6点填一次\",\"添加了一个新的文案\",\"爱的色放\",\"经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验\",\"经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验经验\",\"这是一个循环任务，每天都要填写加粉量，项目关闭或者停止后任务结束\",\"这是一个循环任务，项目停止后任务才停止，每天填写推广费用\",\"这是一个循环任务，项目结束后任务结束，每成交一单填一次表格\",\"逾期原因逾期原因逾期原因逾期原因逾期原因\",\"都是发士大夫撒旦发射点发的萨芬的撒发多少发 \",\"阿斯蒂芬\",\"阿斯蒂芬三大\",\"阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬\",\"预期原因预期原因预期原因预期原因预期原因\"]', null, '431');
INSERT INTO `metabase_fieldvalues` VALUES ('148', '2017-06-22 10:49:09', '2017-06-25 14:18:54', '[\"0\"]', null, '433');
INSERT INTO `metabase_fieldvalues` VALUES ('149', '2017-06-22 10:49:10', '2017-06-25 14:18:54', '[\"0\",\"1476199204599\",\"1476199205322\",\"1476412470377\",\"1476412471213\",\"1476412471406\",\"1476412471582\",\"1476412471761\",\"1476412471935\",\"1476412472068\",\"1476412472226\",\"1476412472382\",\"1476412472534\",\"1476412472670\",\"1476412472847\",\"1476412472976\",\"1476412473130\",\"1476412473267\",\"1476412473438\",\"1476412473593\",\"1476412473743\",\"1476412473898\",\"1476412474053\",\"1476412474202\",\"1476412474357\",\"1476412474534\",\"1476412474665\",\"1476412474836\",\"1476412474995\",\"1476412475143\",\"1476412475322\",\"1476412475473\",\"1476412475645\",\"1476412475826\",\"1476412475972\",\"1476412476155\",\"1476412476309\",\"1476412476460\",\"1476412476638\",\"1476412476788\",\"1476412476942\",\"1476412477097\",\"1476412477269\",\"1476414597775\",\"1476416531557\",\"1476416543279\",\"1476416565557\",\"1476419467114\",\"1478060135716\",\"1478060166558\",\"1478060200790\",\"1478060247764\",\"1478060283907\",\"1478061485967\",\"1478080525441\",\"1478272638799\",\"1478272651672\",\"1478333092413\",\"1480408976861\",\"1480408979934\",\"1480410204996\",\"1480410210905\",\"1480579928295\",\"1480651776419\",\"1480651791110\",\"1480660234348\",\"1480660235512\",\"1480660236439\",\"1480660237281\",\"1480660238478\",\"1480660239904\",\"1480660240066\",\"1480660240213\",\"1481600286856\",\"1481600294390\",\"1481611302203\",\"1481611401551\",\"1481611687129\",\"1481611688821\",\"1481611690432\",\"1481621668563\",\"1481621676717\",\"1481684640959\",\"1481684664046\",\"1481684682281\",\"1481862495123\",\"1482120841810\",\"1482805252098\",\"1482805255961\",\"1482805259962\",\"1486391335388\",\"1488169242960\",\"1488169243863\",\"1488169244416\",\"1488169245027\",\"1491465578473\",\"1491465579278\",\"1491465580382\",\"1491467055854\",\"1491467057246\",\"1491467057399\",\"1491467057724\",\"1491467058403\",\"1491467058789\",\"1491467059150\",\"1491467059304\",\"1491557712910\",\"1491557713037\",\"1491557713162\",\"1491557713292\",\"1491557713400\",\"1491557713551\",\"1491557713680\",\"1491557713831\",\"1491557713943\",\"1492574460713\",\"1492574579857\",\"1492574586225\",\"1492574755858\",\"1492575199682\",\"1492575416612\",\"1492575434598\",\"1492575440173\",\"1492575442770\",\"1492576746413\",\"1492577566625\",\"1492577570565\",\"1492577592618\",\"1492577636631\",\"1492577651653\",\"1492577735398\",\"1492577746813\",\"1492578878862\",\"1492744871694\",\"1492744875642\",\"1493172798709\",\"1493197244006\",\"1493201923135\",\"1493201936645\",\"1493350664290\",\"1493351003236\",\"1493351014143\",\"1493351092636\",\"1493351105765\",\"1493351680814\",\"1493351683705\",\"1493351802450\",\"1493352259281\",\"1493352260151\",\"1493352260826\",\"1493352261530\",\"1493352262227\",\"1493352262928\",\"1493352263519\",\"1493352264060\",\"1493352264780\",\"1493352270989\",\"1493354100421\",\"1493354517302\",\"1493354606042\",\"1493354611983\",\"1493354612792\",\"1493355960722\",\"1493696018070\",\"1493715683853\",\"1493715759966\",\"1493715776093\",\"1493715912843\",\"1493781572561\",\"1493781573147\",\"1493781581400\",\"1493782265328\",\"1494049807014\",\"1494049810985\",\"1494049829004\",\"1494049970440\",\"1494050496414\",\"1494050500840\",\"1494050749320\",\"1494050765117\",\"1494051043171\",\"1494051050286\",\"1494051214210\",\"1494051221909\",\"1494051252730\",\"1494051264070\",\"1494067104100\",\"1494067108533\",\"1494067120077\",\"1494067122072\",\"1494067124576\",\"1494067136197\",\"1494067148058\",\"1494067176530\",\"1496130391795\",\"1496307328862\",\"1496308268508\",\"1496308399578\",\"1496308822849\",\"1496308919193\",\"1496308921123\",\"1496309165708\",\"1496309714095\",\"1496310582494\",\"1496310605726\",\"1496311164666\",\"1496311169668\",\"1496311345564\",\"1496311710713\",\"1496371927935\",\"1496372496719\",\"1496372885969\",\"1496385091672\",\"1496385094000\",\"1496385113138\",\"1496472745034\",\"1496472826149\",\"1496472843447\",\"1496475271306\",\"1496644529318\",\"1496644533319\",\"1496644566495\",\"1496645100166\",\"1496645102207\",\"1496645104452\",\"1496645106030\",\"1496645107822\",\"1496645256474\",\"1496645259080\",\"1496718894454\",\"1496736625061\",\"1496736753335\",\"1496736792474\",\"1496736794111\",\"1496736822445\",\"1496736831800\"]', null, '436');
INSERT INTO `metabase_fieldvalues` VALUES ('150', '2017-06-22 10:49:10', '2017-06-25 14:18:54', '[\"0\",\"1\",\"2\"]', null, '437');
INSERT INTO `metabase_fieldvalues` VALUES ('151', '2017-06-22 10:49:10', '2017-06-25 14:18:55', '[\"0\",\"23946449\",\"99338236\"]', null, '438');
INSERT INTO `metabase_fieldvalues` VALUES ('152', '2017-06-22 10:49:11', '2017-06-25 14:18:55', '[40,42,43,44,45,47]', null, '439');
INSERT INTO `metabase_fieldvalues` VALUES ('153', '2017-06-22 10:49:11', '2017-06-25 14:18:56', '[62546,4187198,4633412,16805144,20827976,23193255,30999876,35338561,42331933,47222076,49586903,52335272,52386384,53269522,59115380,63878251,64016422,71504603,73129799,77204597,81169690,82716842,83767413,92476576,92815211,99338236,99896464]', null, '441');
INSERT INTO `metabase_fieldvalues` VALUES ('154', '2017-06-22 10:49:12', '2017-06-25 14:18:57', '[\"0\",\"1476977734366\",\"1476977762313\",\"1477035560911\",\"1477039440791\",\"1477039448050\",\"1477039465612\",\"1477039572117\",\"1477039915919\",\"1477039957334\",\"1477040015142\"]', null, '442');
INSERT INTO `metabase_fieldvalues` VALUES ('155', '2017-06-22 10:49:12', '2017-06-25 14:18:57', '[\"0\",\"1\",\"2\",\"21\",\"35\",\"5\"]', null, '443');
INSERT INTO `metabase_fieldvalues` VALUES ('156', '2017-06-22 10:49:12', '2017-06-25 14:18:57', '[\"5656\",\"adfsasdf\",\"adsfasdfasdf\",\"asdfasdf\",\"asdfasdfas\",\"asdfasdfasdf\",\"asdfasdfasdfasdf\",\"asdfasdfasdfasdfasdf\",\"asdfasdfasdfasfdasdf\",\"asdfasdfsadf\",\"asdfasfasfd\",\"asdfasfdasdf\",\"asdfsadfasdf\",\"asfdasdfasdf\",\"dfadsfasdf\",\"dsfadsfsadfdsaf\",\"dsfasdfsdfsad\",\"dsfdsgfds\",\"fasdfasdfd\",\"fasdfsadfsad\",\"fdsasdfasdf\",\"fewrwerwerqwer\",\"sdfasdfasdfasdf\",\"sdfasdfsadf\",\"撒旦飞洒地方\",\"放入回收站测试\",\"新建文件夹\",\"新建文件夹啊士大夫撒旦阿斯蒂芬\",\"移动到子文件夹测试2\",\"移动到测试\",\"移动子文件夹测试\",\"重命名文件夹测试\",\"阿斯蒂芬\",\"阿斯顿发射点发的是撒旦发射点\"]', null, '445');
INSERT INTO `metabase_fieldvalues` VALUES ('157', '2017-06-22 10:49:12', '2017-06-25 14:18:57', '[\"16\",\"97002664\",\"97002665\"]', null, '446');
INSERT INTO `metabase_fieldvalues` VALUES ('158', '2017-06-22 10:49:13', '2017-06-25 14:18:58', '[\"1476498355245\",\"1476498361261\",\"1476498364963\",\"1476624759399\",\"1476627189782\",\"1476627205987\",\"1476627211996\",\"1476627735383\",\"1476627740003\",\"1476627742336\",\"1476627758627\",\"1476627760198\",\"1476627761792\",\"1476627770394\",\"1476851940099\",\"1476852005295\",\"1476977755484\",\"1477039945993\",\"1477039948246\",\"1477039950137\",\"1477040006919\",\"1477040008954\",\"1477127410024\",\"1477127412541\",\"1477127417503\",\"1477127421555\",\"1477127423860\",\"1477127425953\",\"1477221003918\",\"1477221174575\",\"1477221929178\",\"1481343235500\",\"1481343250447\",\"1488176778331\"]', null, '447');
INSERT INTO `metabase_fieldvalues` VALUES ('159', '2017-06-22 10:49:13', '2017-06-25 14:18:58', '[\"0\",\"1476978043300\",\"1477039453725\",\"1477039465622\",\"1477039572127\",\"1477041928120\",\"1481344175102\"]', null, '448');
INSERT INTO `metabase_fieldvalues` VALUES ('160', '2017-06-22 10:49:14', '2017-06-25 14:18:58', '[\"1073408\",\"12.83KB\",\"12995\",\"13762\",\"14280\",\"14502\",\"15822\",\"17560\",\"18115\",\"18940\",\"1998454\",\"2.7KB\",\"234837\",\"2763\",\"27955440\",\"294\",\"362979\",\"4.57KB\",\"41105\",\"53607\",\"5378048\",\"58683200\",\"6319\",\"66850\",\"68871\",\"70618\",\"73.54KB\",\"75.33KB\",\"77140\",\"80029464\",\"846\"]', null, '449');
INSERT INTO `metabase_fieldvalues` VALUES ('161', '2017-06-22 10:49:14', '2017-06-25 14:18:58', '[\"0\"]', null, '452');
INSERT INTO `metabase_fieldvalues` VALUES ('162', '2017-06-22 10:49:14', '2017-06-25 14:18:58', '[\"02.png\",\"115AEA6732C40DBBF9B41CB9B130263A0AADB2F9.torrent\",\"40AABFA693089F151FAA1F4AEF4E1CA02C2E0D70.torrent\",\"8C32AF5579FE4F181FB2C80BB31C3121FD32478F.torrent\",\"a9c530c2d154af2bd6ed8e1b1437a49.jpg\",\"app.docx\",\"b.csv\",\"CentOS-6.8-x86_64-bin-DVD1to2.torrent\",\"E15C7DCB6084C2C3F45B88B6AFCEB9C50E624D12.torrent\",\"inst.exe\",\"jdk-6u23-windows-i586.exe\",\"mytask.txt\",\"NuGet.config\",\"oa.docx\",\"OABUG.docx\",\"qd.exe\",\"QQ_8.5.18600.0_setup.exe\",\"QQ截图20161007093659.png\",\"QQ截图20161008102235.png\",\"QQ截图20161012171844.png\",\"RightMenu.rar\",\"stock.docx\",\"TA_Lib-0.4.9-cp35-none-win_amd64.whl\",\"thstrade.py\",\"VisualSVN-5.1.4.msi\",\"wxb_site_new.sql\",\"wx_dev.zip\",\"啊士大夫撒旦飞洒登封市大是大非爱的色放的萨芬阿迪斯发士大夫倒萨发射点发.torrent\",\"策略改进1.txt\",\"策略改进3.txt\",\"重命名文件\",\"重命名文件测试\"]', null, '453');
INSERT INTO `metabase_fieldvalues` VALUES ('163', '2017-06-22 10:49:14', '2017-06-25 14:18:58', '[\"0\",\"1\",\"10\",\"2\",\"3\",\"34\",\"35\",\"6\",\"7\"]', null, '454');
INSERT INTO `metabase_fieldvalues` VALUES ('164', '2017-06-22 10:49:14', '2017-06-25 14:18:58', '[\"16\",\"26\",\"97002664\",\"97002665\",\"97002666\"]', null, '455');
INSERT INTO `metabase_fieldvalues` VALUES ('165', '2017-06-22 10:49:15', '2017-06-25 14:18:58', '[\"1476778095792\",\"1476778111589\",\"1476779520147\",\"1476779618343\",\"1476779764280\",\"1476779855853\",\"1476779864372\",\"1476783021709\",\"1476783101059\",\"1476783459321\",\"1476783599839\",\"1476798342098\",\"1476798721885\",\"1476798728659\",\"1476798889970\",\"1476799094435\",\"1476799622068\",\"1476799757478\",\"1476800002380\",\"1476800034582\",\"1476800091867\",\"1476800234031\",\"1476805669134\",\"1476805777972\",\"1476805786892\",\"1476805830917\",\"1476850710992\",\"1476851358751\",\"1476851472882\",\"1476851601826\",\"1476851667568\",\"1476864673327\",\"1476885423910\",\"1477041916754\",\"1477119403482\",\"1477119403483\",\"1477130461960\",\"1477221937205\",\"1478332933929\",\"1480133831866\",\"1480133855582\",\"1480133866436\",\"1481343254796\",\"1481343713052\",\"1481343744047\",\"1482562144926\",\"1488178717963\",\"1491575273448\"]', null, '456');
INSERT INTO `metabase_fieldvalues` VALUES ('166', '2017-06-22 10:49:15', '2017-06-25 14:18:58', '[\"23946449\",\"99338236\"]', null, '457');
INSERT INTO `metabase_fieldvalues` VALUES ('167', '2017-06-22 10:49:16', '2017-06-25 14:18:59', '[\"\",\"23946449,\",\"49586903,\",\"49586903,99338236,64016422,30999876,35338561,99896464,47222076,92476576,71504603,\",\"99338236,\"]', null, '459');
INSERT INTO `metabase_fieldvalues` VALUES ('168', '2017-06-22 10:49:16', '2017-06-25 14:18:59', '[\"                                \",\"                                asdfsadf\",\"????\",\"adsfadsfsdf\",\"asdfsadffsda\",\"sdfgsdfgsdfgdsf\",\"万能报表测试\",\"业绩积分测试\",\"即时通讯服务测试\",\"啊三大富士达范德萨\",\"啊手动阀手动阀士大夫撒\",\"啊手动阀手动阀多舒服啊\",\"士大夫撒地方\",\"开发任务\",\"报表数据准确性测试\",\"报表数据录入测试\",\"撒旦发生\",\"撒旦飞洒地方     \",\"模板 需求管理\",\"测试填写报表流程和按天循环任务流程\",\"测试测试\",\"计划模板。产品设计\",\"这是项目模板\",\"项目模板\"]', null, '460');
INSERT INTO `metabase_fieldvalues` VALUES ('169', '2017-06-22 10:49:17', '2017-06-25 14:18:59', '[\"\"]', null, '461');
INSERT INTO `metabase_fieldvalues` VALUES ('170', '2017-06-22 10:49:17', '2017-06-25 14:18:59', '[\"0\",\"1\"]', null, '463');
INSERT INTO `metabase_fieldvalues` VALUES ('171', '2017-06-22 10:49:17', '2017-06-25 14:18:59', '[\"0\",\"1\"]', null, '464');
INSERT INTO `metabase_fieldvalues` VALUES ('172', '2017-06-22 10:49:17', '2017-06-25 14:18:59', '[0,1]', null, '465');
INSERT INTO `metabase_fieldvalues` VALUES ('173', '2017-06-22 10:49:17', '2017-06-25 14:18:59', '[\"25\",\"39\",\"40\",\"43\"]', null, '466');
INSERT INTO `metabase_fieldvalues` VALUES ('174', '2017-06-22 10:49:18', '2017-06-25 14:18:59', '[\"????\",\"??????\",\"adsfasdf\",\"asdfdasf\",\"baobiaoceshi\",\"copy:copy:copy:项目模板\",\"copy:copy:项目模板\",\"copy:项目模板\",\"fsafd\",\"业绩积分测试\",\"产品设计\",\"仪表板测试\",\"即时通讯服务测试\",\"啊手动阀\",\"幅度萨芬\",\"开发\",\"循环任务+报表测试\",\"志-陌陌--www.zkmm.wdbbzz.cn \",\"报表数据准确性测试\",\"报表测试\",\"新建计划\",\"新建项目1\",\"最后一次测试\",\"测试\",\"爱的色放\",\"用户反馈\",\"计划计划\",\"阿斯蒂芬\",\"需求管理\",\"项目3\",\"项目模板\",\"项目项目\"]', null, '467');
INSERT INTO `metabase_fieldvalues` VALUES ('175', '2017-06-22 10:49:18', '2017-06-25 14:18:59', '[\"\",\"23946449,\",\"71504603,23193255,\",\"99338236,\"]', null, '468');
INSERT INTO `metabase_fieldvalues` VALUES ('176', '2017-06-22 10:49:18', '2017-06-25 14:19:00', '[\"0\"]', null, '469');
INSERT INTO `metabase_fieldvalues` VALUES ('178', '2017-06-22 10:49:19', '2017-06-25 14:19:00', '[\"dsfasdf\",\"hahaha\",\"sadfasf\",\"乱码2乱码\",\"乱码？\",\"开发\",\"测试\",\"销售\"]', null, '472');
INSERT INTO `metabase_fieldvalues` VALUES ('179', '2017-06-22 10:49:20', '2017-06-25 14:19:00', '[\"上海市\",\"云南省\",\"内蒙古自治区\",\"北京市\",\"台湾省\",\"吉林省\",\"四川省\",\"天津市\",\"宁夏回族自治区\",\"安徽省\",\"山东省\",\"山西省\",\"广东省\",\"广西壮族自治区\",\"新疆维吾尔自治区\",\"江苏省\",\"江西省\",\"河北省\",\"河南省\",\"浙江省\",\"海南省\",\"湖北省\",\"湖南省\",\"澳门特别行政区\",\"甘肃省\",\"福建省\",\"西藏自治区\",\"贵州省\",\"辽宁省\",\"重庆市\",\"陕西省\",\"青海省\",\"香港特别行政区\",\"黑龙江省\"]', null, '474');
INSERT INTO `metabase_fieldvalues` VALUES ('180', '2017-06-22 10:49:21', '2017-06-25 14:19:01', '[\"管理账号\"]', null, '480');
INSERT INTO `metabase_fieldvalues` VALUES ('181', '2017-06-22 10:49:22', '2017-06-25 14:19:01', '[\"2\"]', null, '482');
INSERT INTO `metabase_fieldvalues` VALUES ('182', '2017-06-22 10:49:22', '2017-06-25 14:19:01', '[\"1\"]', null, '483');
INSERT INTO `metabase_fieldvalues` VALUES ('183', '2017-06-22 10:49:22', '2017-06-25 14:19:01', '[\"1\"]', null, '484');
INSERT INTO `metabase_fieldvalues` VALUES ('184', '2017-06-22 10:49:22', '2017-06-25 14:19:01', '[\"USERTYPE\"]', null, '485');
INSERT INTO `metabase_fieldvalues` VALUES ('185', '2017-06-22 10:49:22', '2017-06-25 14:19:02', '[\"用户类型\"]', null, '486');
INSERT INTO `metabase_fieldvalues` VALUES ('186', '2017-06-22 10:49:23', '2017-06-25 14:19:02', '[\"管理账号\"]', null, '487');
INSERT INTO `metabase_fieldvalues` VALUES ('187', '2017-06-22 10:49:23', '2017-06-25 14:19:02', '[2]', null, '488');
INSERT INTO `metabase_fieldvalues` VALUES ('188', '2017-06-22 10:49:23', '2017-06-25 14:19:02', '[\"1\",\"2\",\"3\",\"sadf\",\"当事人所在团队\"]', null, '489');
INSERT INTO `metabase_fieldvalues` VALUES ('189', '2017-06-22 10:49:24', '2017-06-25 14:19:02', '[\"\",\"{&quot;type&quot;:&quot;number&quot;,&quot;number&quot;:&quot;6&quot;}\",\"{&quot;type&quot;:&quot;number&quot;,&quot;number&quot;:&quot;6&quot;},{&quot;type&quot;:&quot;calc&quot;,&quot;calc&quot;:&quot;+&quot;},{&quot;type&quot;:&quot;tableField&quot;,&quot;table&quot;:&quot;所有项目&quot;,&quot;field&quot;:&quot;项目&quot;,&quot;screen&quot;:&quot;2&quot;,&quot;calc&quot;:&quot;1&quot;}\",\"{&quot;type&quot;:&quot;number&quot;,&quot;number&quot;:&quot;6&quot;}{&quot;type&quot;:&quot;tableField&quot;,&quot;table&quot;:&quot;销售量&quot;,&quot;field&quot;:&quot;成交价格&quot;,&quot;screen&quot;:&quot;1&quot;,&quot;calc&quot;:&quot;1&quot;}\",\"{&quot;type&quot;:&quot;number&quot;,&quot;number&quot;:&quot;6&quot;}{{{&quot;type&quot;:&quot;number&quot;,&quot;number&quot;:&quot;6&quot;}\",\"{&quot;type&quot;:&quot;tableField&quot;,&quot;table&quot;:&quot;销售业绩&quot;,&quot;field&quot;:&quot;成交额&quot;,&quot;screen&quot;:&quot;1&quot;,&quot;calc&quot;:&quot;1&quot;}\"]', null, '490');
INSERT INTO `metabase_fieldvalues` VALUES ('190', '2017-06-22 10:49:24', '2017-06-25 14:19:02', '[\"-1\",\"16\",\"22\",\"26\",\"27\",\"null\"]', null, '491');
INSERT INTO `metabase_fieldvalues` VALUES ('191', '2017-06-22 10:49:25', '2017-06-25 14:19:02', '[\"\",\"asfd\",\"hahaha\",\"none\",\"开发\",\"推广\",\"管理元\"]', null, '492');
INSERT INTO `metabase_fieldvalues` VALUES ('192', '2017-06-22 10:49:25', '2017-06-25 14:19:03', '[\"adsf\",\"adsfas\",\"asdf\",\"asdfds\",\"dsfadsf555\",\"fasd\",\"fasdf\",\"fdsaf\",\"sdfsadfasdf\",\"团队全勤分\",\"团队积分测试1\",\"扣分原因\",\"测试更改团队\",\"通用积分测试1\",\"通用部门积分测试\",\"部门积分测试\",\"部门针对型积分测试1\",\"部门针对型积分测试3\",\"阿斯蒂芬\"]', null, '493');
INSERT INTO `metabase_fieldvalues` VALUES ('193', '2017-06-22 10:49:25', '2017-06-25 14:19:03', '[\"0\",\"1\"]', null, '495');
INSERT INTO `metabase_fieldvalues` VALUES ('194', '2017-06-22 10:49:25', '2017-06-25 14:19:03', '[\"0\",\"1\",\"2\"]', null, '496');
INSERT INTO `metabase_fieldvalues` VALUES ('195', '2017-06-22 10:49:25', '2017-06-25 14:19:03', '[\"\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"adsf\"]', null, '497');
INSERT INTO `metabase_fieldvalues` VALUES ('196', '2017-06-22 10:49:26', '2017-06-25 14:19:03', '[\"40\",\"42\",\"null\"]', null, '498');
INSERT INTO `metabase_fieldvalues` VALUES ('197', '2017-06-22 10:49:26', '2017-06-25 14:19:03', '[\"1\",\"2\",\"3\",\"4\"]', null, '499');
INSERT INTO `metabase_fieldvalues` VALUES ('198', '2017-06-22 10:49:26', '2017-06-25 14:19:03', '[\"0\"]', null, '500');
INSERT INTO `metabase_fieldvalues` VALUES ('199', '2017-06-22 10:49:26', '2017-06-25 14:19:03', '[\"0\"]', null, '501');
INSERT INTO `metabase_fieldvalues` VALUES ('200', '2017-06-22 10:49:27', '2017-06-25 14:19:04', '[\"\",\"0\",\"1\",\"10\",\"12\",\"13\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"]', null, '503');
INSERT INTO `metabase_fieldvalues` VALUES ('201', '2017-06-22 10:49:27', '2017-06-25 14:19:04', '[\"团队\",\"报表\",\"报表设计器\",\"文档\",\"文档整理\",\"标准\",\"知识整理\",\"系统设置\",\"组织\",\"行动\",\"计划\"]', null, '506');
INSERT INTO `metabase_fieldvalues` VALUES ('202', '2017-06-22 10:49:27', '2017-06-25 14:19:04', '[1]', null, '507');
INSERT INTO `metabase_fieldvalues` VALUES ('203', '2017-06-22 10:49:27', '2017-06-25 14:19:04', '[\"0\"]', null, '508');
INSERT INTO `metabase_fieldvalues` VALUES ('204', '2017-06-22 10:49:28', '2017-06-25 14:19:04', '[\"\",\"2017-1-11 15:23\",\"2017-1-11 16:24\",\"2017-1-11 17:58\",\"2017-1-11 21:12\",\"2017-1-14 14:13\",\"2017-2-10 16:54\",\"2017-2-10 17:12\",\"2017-2-10 17:14\",\"2017-2-10 17:15\",\"2017-2-10 17:16\",\"2017-2-10 17:18\",\"2017-2-10 17:19\",\"2017-2-10 17:26\",\"2017-2-10 17:31\",\"2017-2-10 17:32\",\"2017-2-10 17:36\",\"2017-2-10 17:37\",\"2017-2-10 17:40\",\"2017-2-10 17:43\",\"2017-2-10 17:44\",\"2017-2-10 17:53\",\"2017-2-10 17:54\",\"2017-2-10 18:10\",\"2017-2-10 18:11\",\"2017-2-10 18:2\",\"2017-2-10 18:5\",\"2017-2-10 18:8\",\"2017-2-10 18:9\",\"2017-2-11 11:46\",\"2017-2-11 16:47\",\"2017-2-11 9:49\",\"2017-2-9\",\"2017-2-9 10:21\",\"2017-2-9 10:58\",\"2017-2-9 14:46\",\"2017-3-4 11:32\",\"2017-3-4 11:9\",\"2017-3-4 12:55\",\"2017-3-4 12:57\",\"2017-3-4 13:21\",\"2017-3-4 13:3\",\"2017-3-4 13:4\",\"2017-3-4 13:5\",\"2017-3-4 13:7\",\"2017-3-4 17:1\",\"2017-3-4 17:11\",\"2017-3-4 17:12\",\"2017-3-4 17:13\",\"2017-3-4 17:14\",\"2017-3-4 17:3\",\"2017-3-4 17:4\",\"2017-3-4 17:9\",\"function getTime(tim\"]', null, '509');
INSERT INTO `metabase_fieldvalues` VALUES ('205', '2017-06-22 10:49:28', '2017-06-25 14:19:04', '[\"任务名\",\"您的任务：haha 审核通过\",\"您的任务：任务完成后发送审核通知测试 审核通过\",\"您的任务：任务审核失败通知测试 审核未通过\",\"您的任务：任务审核失败通知测试 审核通过\",\"您的任务：任务审核成功通知测试 审核通过\",\"您的任务：即时通知 审核未通过\",\"您的任务：即时通知 审核通过\",\"您的任务：设置任务负责人审核人后拖动任务本地负责人审核人消失BUG 审核未通过\"]', null, '510');
INSERT INTO `metabase_fieldvalues` VALUES ('206', '2017-06-22 10:49:29', '2017-06-25 14:19:05', '[\"2\",\"3\",\"4\"]', null, '512');
INSERT INTO `metabase_fieldvalues` VALUES ('207', '2017-06-22 10:49:29', '2017-06-25 14:19:05', '[\"0\",\"1\"]', null, '514');
INSERT INTO `metabase_fieldvalues` VALUES ('208', '2017-06-22 10:49:29', '2017-06-25 14:19:05', '[\"347\",\"354\",\"356\",\"358\",\"359\",\"391\",\"393\",\"394\",\"395\",\"558\",\"562\",\"563\"]', null, '515');
INSERT INTO `metabase_fieldvalues` VALUES ('209', '2017-06-22 10:49:29', '2017-06-25 14:19:05', '[\"任务审核失败通知\",\"任务审核通过通知\",\"最新进度：0%.任务：??????（来自关注任务的通知）\",\"最新进度：0%.任务：填写推广数据（来自关注任务的通知）\",\"最新进度：0%.任务：富士达发士大夫（来自关注任务的通知）\",\"最新进度：0%.任务：爱的色放爱的色放（来自关注任务的通知）\",\"最新进度：0%.任务：编辑器表格添加默认样式（来自关注任务的通知）\",\"最新进度：0%.任务：设置项目模板（来自关注任务的通知）\",\"最新进度：0%.任务：阿斯蒂芬（来自关注任务的通知）\",\"最新进度：100%.任务：????????（来自关注任务的通知）\",\"最新进度：100%.任务：a法大师傅（来自关注任务的通知）\",\"最新进度：100%.任务：u53d1u5c04u70b9u7684dsfa（来自关注任务的通知）\",\"最新进度：100%.任务：发射点的dsfa （来自关注任务的通知）\",\"最新进度：100%.任务：填写销售量（来自关注任务的通知）\",\"最新进度：100%.任务：爱的色放（来自关注任务的通知）\",\"最新进度：25%.任务：????????（来自关注任务的通知）\",\"最新进度：25%.任务：??????（来自关注任务的通知）\",\"最新进度：25%.任务：a法大师傅（来自关注任务的通知）\",\"最新进度：25%.任务：d士大夫的萨芬（来自关注任务的通知）\",\"最新进度：25%.任务：d士大夫（来自关注任务的通知）\",\"最新进度：25%.任务：fdsaf（来自关注任务的通知）\",\"最新进度：25%.任务：填写推广数据（来自关注任务的通知）\",\"最新进度：25%.任务：爱的色放（来自关注任务的通知）\",\"最新进度：25%.任务：的萨芬的（来自关注任务的通知）\",\"最新进度：25%.任务：的萨芬（来自关注任务的通知）\",\"最新进度：25%.任务：设置项目模板（来自关注任务的通知）\",\"最新进度：25%.任务：阿斯蒂芬（来自关注任务的通知）\",\"最新进度：50%.任务：????????（来自关注任务的通知）\",\"最新进度：50%.任务：a法大师傅（来自关注任务的通知）\",\"最新进度：75%.任务：a法大师傅（来自关注任务的通知）\",\"有待审核任务\",\"有未通过审核的任务\"]', null, '516');
INSERT INTO `metabase_fieldvalues` VALUES ('210', '2017-06-22 10:49:29', '2017-06-25 14:19:05', '[\"\",\"64016422\",\"99338236\",\"99896464\"]', null, '517');
INSERT INTO `metabase_fieldvalues` VALUES ('211', '2017-06-22 10:49:30', '2017-06-25 14:19:05', '[\"BOTTOM_COPYRIGHT\",\"dayloop\",\"monthloop\",\"mtbm\",\"mtzh\",\"MULTI_SESSION\",\"PAGE_MSIZE\",\"Qjsh\",\"sign_distance\",\"sign_location\",\"sign_time\",\"SITE_LOGO\",\"SITE_TITLE\",\"SYS_TITLE\",\"TEST_MODE\",\"TITLE_ICON\",\"wa_nrmd\",\"weekloop\"]', null, '520');
INSERT INTO `metabase_fieldvalues` VALUES ('212', '2017-06-22 10:49:30', '2017-06-25 14:19:05', '[\"\",\",X经贸,H经贸,1121761902,UC信息流-易通化妆品,quban@qq.com,zrl@qq.com,3476115629,baidu-A29亿恩电子8163769,baidu-享购28-8163553,北京同同心园,1592955996@qq.com,qinwataiwww@163.com,402487490,3296601389\",\",百度-WAP-SS,百度-WAP-WM,百度-WAP-XXL,智慧推,广点通,公众号-CPM,公众号-CPC,UC头条-CPC,神马-WAP-SS,搜狗-WAP-SS,搜狐-WAP-SS,搜狐-CPC,陌陌-CPC,有道-DSP-CPC,小米-CPM,头条-CPC\",\"0\",\"05:23,11:00\",\"100\",\"2017524\",\"23.138309,113.401221\",\"5\",\"Copyright\",\"litaOa\",\"llj.ico\",\"wxb/images/logo.png\",\"目的1||目的2||目asdf的3||目的5||\"]', null, '521');
INSERT INTO `metabase_fieldvalues` VALUES ('213', '2017-06-22 10:49:31', '2017-06-25 14:19:05', '[\"允许签到的半径\",\"前端分页参数\",\"右下角的版权信息\",\"周循环任务\",\"天循环任务\",\"媒体编码\",\"打卡时间。签到，签退\",\"文案的内容目的，用||分割开\",\"是否允许同一个帐户建立多个会话连接。1:允许;0:不允许\",\"是否测试模式\",\"显示在浏览器标题前面的小图标(注:必须为.ico格式)\",\"月循环任务\",\"签到中心位置\",\"系统标题\",\"网站logo图片\",\"网站标题\",\"请假审核员\"]', null, '522');
INSERT INTO `metabase_fieldvalues` VALUES ('214', '2017-06-22 10:49:31', '2017-06-25 14:19:05', '[\"0\",\"1\",\"状态\"]', null, '523');
INSERT INTO `metabase_fieldvalues` VALUES ('215', '2017-06-22 10:49:32', '2017-06-25 14:19:06', '[\"0\",\"1\",\"2\",\"5\",\"6\"]', null, '524');
INSERT INTO `metabase_fieldvalues` VALUES ('216', '2017-06-22 10:49:32', '2017-06-25 14:19:06', '[\"asdf\",\"asdfasdf\",\"前三名可以兑换\",\"描述描述描述前三名可以兑换\",\"测试\"]', null, '525');
INSERT INTO `metabase_fieldvalues` VALUES ('217', '2017-06-22 10:49:33', '2017-06-25 14:19:06', '[\"-1\",\"1\",\"3\",\"5\"]', null, '526');
INSERT INTO `metabase_fieldvalues` VALUES ('218', '2017-06-22 10:49:33', '2017-06-25 14:19:06', '[\"\"]', null, '528');
INSERT INTO `metabase_fieldvalues` VALUES ('219', '2017-06-22 10:49:33', '2017-06-25 14:19:06', '[\"adsfasdf\",\"asdf\",\"sdaf\",\"添加礼物测试\",\"积分礼物测试\",\"苹果shoji\"]', null, '529');
INSERT INTO `metabase_fieldvalues` VALUES ('220', '2017-06-22 10:49:34', '2017-06-25 14:19:06', '[\"1490196729431\",\"1490336830394\",\"1490337234745\",\"1490345601831\",\"1490595165209\",\"1491489338110\"]', null, '530');
INSERT INTO `metabase_fieldvalues` VALUES ('221', '2017-06-22 10:49:34', '2017-06-25 14:19:07', '[1,3]', null, '531');
INSERT INTO `metabase_fieldvalues` VALUES ('222', '2017-06-22 10:49:35', '2017-06-25 14:19:07', '[\"0\"]', null, '533');
INSERT INTO `metabase_fieldvalues` VALUES ('223', '2017-06-22 10:49:35', '2017-06-25 14:19:07', '[\"99338236\",\"99896464\",\"system\"]', null, '534');
INSERT INTO `metabase_fieldvalues` VALUES ('224', '2017-06-22 10:49:35', '2017-06-25 14:19:07', '[\"团队积分测试1\",\"通用积分测试1\",\"通用部门积分测试\",\"部门针对型积分测试1\",\"部门针对型积分测试3\"]', null, '535');
INSERT INTO `metabase_fieldvalues` VALUES ('225', '2017-06-22 10:49:35', '2017-06-25 14:19:07', '[\"24\",\"25\",\"26\",\"27\",\"28\",\"29\"]', null, '536');
INSERT INTO `metabase_fieldvalues` VALUES ('226', '2017-06-22 10:49:36', '2017-06-25 14:19:08', '[\"1\",\"2\",\"5\"]', null, '537');
INSERT INTO `metabase_fieldvalues` VALUES ('227', '2017-06-22 10:49:36', '2017-06-25 14:19:08', '[\"1490505419641\",\"1490505439198\",\"1490505442191\",\"1490505443635\",\"1490505466749\",\"1490505475501\",\"1490505500614\",\"1490506069749\",\"1490506302644\",\"1490507853380\",\"1490507901731\",\"1490510899934\",\"1490510901370\",\"1490510902998\",\"1490510904656\",\"1490510906154\",\"1490510907616\",\"1490510909091\",\"1490511125794\",\"1490512871124\",\"1490512893483\",\"1490513097594\",\"1490513710180\",\"1490513710181\"]', null, '538');
INSERT INTO `metabase_fieldvalues` VALUES ('228', '2017-06-22 10:49:36', '2017-06-25 14:19:08', '[\"05429609\",\"23946449\",\"30999876\",\"35338561\",\"49586903\",\"99338236\",\"99896464\"]', null, '539');
INSERT INTO `metabase_fieldvalues` VALUES ('229', '2017-06-22 10:49:37', '2017-06-25 14:19:08', '[\"\",\"推广\",\"操作业务数据\",\"系统管理员角色\",\"编辑\",\"财务专员角色\"]', null, '541');
INSERT INTO `metabase_fieldvalues` VALUES ('230', '2017-06-22 10:49:37', '2017-06-25 14:19:08', '[\"客服专员角色\",\"推广部\",\"管理员角色\",\"编辑\",\"财务专员角色\",\"销售部\"]', null, '542');
INSERT INTO `metabase_fieldvalues` VALUES ('231', '2017-06-22 10:49:37', '2017-06-25 14:19:08', '[1,2,3,5]', null, '543');
INSERT INTO `metabase_fieldvalues` VALUES ('232', '2017-06-22 10:49:37', '2017-06-25 14:19:08', '[1,2]', null, '544');
INSERT INTO `metabase_fieldvalues` VALUES ('233', '2017-06-22 10:49:38', '2017-06-25 14:19:08', '[\"0101\",\"010101\",\"01010101\",\"01010102\",\"01010105\",\"010102\",\"01010201\",\"01010202\",\"01010203\",\"010104\",\"01010401\",\"01010402\",\"01010403\",\"01010404\",\"01010405\",\"01010406\",\"01010407\",\"01010408\",\"01010409\",\"010105\",\"01010506\",\"0101050601\",\"0101050602\",\"0101050603\",\"0101050604\",\"0101050605\",\"01010507\",\"0101050701\",\"0101050702\",\"0101050703\",\"0101050704\",\"010106\",\"01010601\",\"01010602\",\"01010603\",\"01010604\",\"01010605\",\"01010606\",\"01010607\",\"01010608\",\"01010609\",\"010107\",\"01010706\",\"01010707\",\"01010708\",\"010108\",\"01010801\",\"01010802\",\"010109\",\"010110\",\"01011001\",\"01011002\",\"01011003\",\"010111\",\"01011101\",\"01011102\",\"01011103\",\"01011104\",\"010112\",\"01011201\",\"01011202\",\"01011203\",\"01011204\",\"01011205\",\"010113\",\"01011301\",\"0101130101\",\"01011302\",\"01011303\",\"01011304\",\"01011305\",\"01011306\",\"01011307\",\"010114\",\"01011401\",\"01011403\",\"01011404\",\"01011405\"]', null, '546');
INSERT INTO `metabase_fieldvalues` VALUES ('234', '2017-06-22 10:49:38', '2017-06-25 14:19:09', '[\"19382472\",\"31058276\",\"57414897\",\"63792215\",\"92122707\",\"97002664\"]', null, '547');
INSERT INTO `metabase_fieldvalues` VALUES ('235', '2017-06-22 10:49:39', '2017-06-25 14:19:09', '[\"CODEID\",\"PARAMID\",\"ROLEID\",\"USERID\"]', null, '548');
INSERT INTO `metabase_fieldvalues` VALUES ('236', '2017-06-22 10:49:39', '2017-06-25 14:19:09', '[\"1\"]', null, '549');
INSERT INTO `metabase_fieldvalues` VALUES ('237', '2017-06-22 10:49:39', '2017-06-25 14:19:09', '[\"10000000\",\"10000061\",\"10000188\"]', null, '550');
INSERT INTO `metabase_fieldvalues` VALUES ('238', '2017-06-22 10:49:39', '2017-06-25 14:19:09', '[\"00000000\"]', null, '551');
INSERT INTO `metabase_fieldvalues` VALUES ('239', '2017-06-22 10:49:39', '2017-06-25 14:19:09', '[\"代码表ID\",\"参数ID\",\"用户ID\",\"角色ID\"]', null, '552');
INSERT INTO `metabase_fieldvalues` VALUES ('240', '2017-06-22 10:49:40', '2017-06-25 14:19:10', '[\"1\",\"4\"]', null, '561');
INSERT INTO `metabase_fieldvalues` VALUES ('241', '2017-06-22 10:49:41', '2017-06-25 14:19:10', '[\"0\",\"1\",\"2\"]', null, '563');
INSERT INTO `metabase_fieldvalues` VALUES ('242', '2017-06-22 10:49:41', '2017-06-25 14:19:10', '[\"1490254223981\",\"1490255394699\",\"1490345637012\"]', null, '564');
INSERT INTO `metabase_fieldvalues` VALUES ('243', '2017-06-22 10:49:41', '2017-06-25 14:19:10', '[\"99338236\"]', null, '565');
INSERT INTO `metabase_fieldvalues` VALUES ('244', '2017-06-22 10:49:43', '2017-06-25 14:19:10', '[\"-1\",\"0\",\"1\",\"2\",\"3\",\"5\",\"6\",\"7\",\"8\"]', null, '571');
INSERT INTO `metabase_fieldvalues` VALUES ('245', '2017-06-22 10:49:43', '2017-06-25 14:19:11', '[\"\",\"1\",\"2\",\"3\",\"4\"]', null, '572');
INSERT INTO `metabase_fieldvalues` VALUES ('246', '2017-06-22 10:49:43', '2017-06-25 14:19:11', '[0,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,73,74,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,97,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291]', null, '573');
INSERT INTO `metabase_fieldvalues` VALUES ('247', '2017-06-22 10:49:43', '2017-06-25 14:19:11', '[0.0,0.3580902777777778,0.35834490740740743,0.35912037037037037,1.0,1.2949537037037038,1.295,1.4268981481481482,1.471087962962963,2.0,2.0648263888888887,3.0,3.9822685185185187,4.0,5.0,7.0,8.0,9.0,10.0,27.0]', null, '574');
INSERT INTO `metabase_fieldvalues` VALUES ('248', '2017-06-22 10:49:44', '2017-06-25 14:19:11', '[\"\",\"d\"]', null, '575');
INSERT INTO `metabase_fieldvalues` VALUES ('249', '2017-06-22 10:49:44', '2017-06-25 14:19:11', '[\"\",\"0\",\"1\",\"2\",\"3\",\"4\",\"48\",\"5\",\"52\",\"54\",\"55\",\"56\",\"57\"]', null, '577');
INSERT INTO `metabase_fieldvalues` VALUES ('250', '2017-06-22 10:49:44', '2017-06-25 14:19:11', '[0]', null, '578');
INSERT INTO `metabase_fieldvalues` VALUES ('251', '2017-06-22 10:49:44', '2017-06-25 14:19:11', '[\"0\",\"1\"]', null, '579');
INSERT INTO `metabase_fieldvalues` VALUES ('252', '2017-06-22 10:49:44', '2017-06-25 14:19:11', '[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47]', null, '581');
INSERT INTO `metabase_fieldvalues` VALUES ('253', '2017-06-22 10:49:45', '2017-06-25 14:19:11', '[\"\",\"0\",\"0:\",\"1:\",\"2:1\",\"2:1,2\",\"2:1,2,3,4,5,6,7\",\"2:3\",\"4:15\",\"4:9\"]', null, '582');
INSERT INTO `metabase_fieldvalues` VALUES ('254', '2017-06-22 10:49:45', '2017-06-25 14:19:12', '[\"\",\"1\",\"2\",\"3\",\"4\",\"5\",\"?????s????da\",\"adsfa\",\"Ajax提交是否成功验证\",\"asdf\",\"debug\",\"dsfasdf\",\"fdsafsadf\",\"FFFFF\",\"haha\",\"New task\",\"renwuming\",\"sadfasdfadsf\",\"xinrenwu \",\"交互设计\",\"今日头条\",\"任务1\",\"任务完成\",\"任务完成待审核通知\",\"任务审核失败通知测试\",\"任务审核成功通知测试\",\"任务数据测试\",\"任务标记可配置设置！\",\"任务的前置任务完成后任务才可以开始进行\",\"任务讨论删除功能以及删除后同步更改数量\",\"任务讨论显示个数\",\"任务讨论空UI处理\",\"任务讨论自己说的话增加删除按钮\",\"任务讨论，执行标准非关联项样式\",\"倒萨发射点\",\"关注任务\",\"关注的任务进度改变\",\"再添加一个推广计划\",\"写落地页\",\"列入开发\",\"列入开发计划\",\"加客量\",\"加粉量\",\"即时通知\",\"反馈收件箱\",\"发射点犯得上\",\"周业绩目标\",\"周循环任务测试\",\"啊倒萨发射点\",\"啊士大夫士大夫\",\"啊士大夫撒旦\",\"啊方式dads\",\"团队删除按钮鼠标经过显示移除隐藏\",\"团队数据库结构优化\",\"团队添加团队成员样式\",\"团队页面空UI处理\",\"基本测试\",\"填写加分两\",\"填写加客亮\",\"填写加客量\",\"填写加粉量\",\"填写加销售量\",\"填写广告费\",\"填写成交量\",\"填写推广数据\",\"填写推广数据-百度推广\",\"填写推广费用\",\"填写新增粉丝\",\"填写销售数据\",\"填写销售量\",\"填表验证\",\"增加团队UI优化\",\"士大夫撒旦\",\"处理中\",\"处理结果确认\",\"天循环任务测试\",\"字体效果对比\",\"定期进行大型设计终审，最好由产品、设计、研发、运营等部门人的参与。\",\"审核任务和历史任务去掉完成按钮\",\"审核和历史任务时间排序问题\",\"审核失败\",\"审核测试审核测试审核测试\",\"将确定好的需求放进列表\",\"将落地页生成HTML\",\"已处理\",\"幅度萨芬\",\"广点通\",\"归档\",\"循环任务\",\"成果总结讨论\",\"所有按钮都设置验证，防止重复按按钮\",\"所有访问必须带上MAC地址\",\"手动阀手动阀\",\"打发士大夫\",\"打发士大夫士大夫\",\"执行标准\",\"批量更新数据库\",\"批量添加任务\",\"批量设置任务详情\",\"报表2.0\",\"报表测试\",\"推广文案\",\"推广计划2\",\"推广费-今日头条\",\"推广费-广点通\",\"推广费-神马搜索\",\"推广页面\",\"撒旦发射点\",\"撒旦发生\",\"撒旦发生大\",\"文件取消上传，上传超时，上传错误的处理\",\"文档整理图标优化\",\"新任务表甘特图团队成员BUG\",\"月业绩目标\",\"月循环任务测试\",\"服务器更换好\",\"查看任务讨论时默认UI\",\"法撒旦飞洒的\",\"测试填写报表\",\"测试循环任务\",\"测试积分运算\",\"添加任务快捷键\",\"添加或者选文案\",\"添加推广计划\",\"添加文案\",\"烦烦烦\",\"版本2需求\",\"版本3需求\",\"甘特图任务完成后打勾\",\"甘特图任务讨论UI同步\",\"甘特图批量添加任务\",\"甘特图，逾期任务改为已完成后红色标记未消失BUG\",\"由交互设计师设计产品原型,附上说明和附件\",\"百度推广\",\"知识整理不显示任务附件BUG\",\"知识整理图片太大的处理\",\"确定需求\",\"神马搜索\",\"空UI处理\",\"组织页面，添加重置密码\",\"编辑器表格添加默认样式\",\"视觉设计\",\"设计终审\",\"进度-1\",\"通知测试\",\"通知用户\",\"通过任务ID关联相关的研发任务，以便于设计师跟进\",\"里程碑测试\",\"销售\",\"销售量\",\"阿斯蒂芬\",\"阿斯蒂芬撒地方\",\"阿斯顿发射点\",\"需求分析\",\"需求收集\",\"需求暂缓\",\"需求确认\",\"需求评估\",\"项目列表/成果总结页面换成controller不用servle\",\"颜色测试\"]', null, '583');
INSERT INTO `metabase_fieldvalues` VALUES ('255', '2017-06-22 10:49:45', '2017-06-25 14:19:12', '[\"\"]', null, '584');
INSERT INTO `metabase_fieldvalues` VALUES ('256', '2017-06-22 10:49:45', '2017-06-25 14:19:12', '[\"\"]', null, '585');
INSERT INTO `metabase_fieldvalues` VALUES ('257', '2017-06-22 10:49:45', '2017-06-25 14:19:12', '[\"\",\"0\",\"156\",\"162\",\"349\",\"360\",\"361\",\"362\",\"363\",\"364\",\"380\",\"382\",\"385\",\"387\",\"391\",\"414\",\"418\",\"444\",\"545\",\"551\",\"558\"]', null, '586');
INSERT INTO `metabase_fieldvalues` VALUES ('258', '2017-06-22 10:49:45', '2017-06-25 14:19:12', '[-1.0,0.0,25.0,40.0,50.0,100.0]', null, '587');
INSERT INTO `metabase_fieldvalues` VALUES ('259', '2017-06-22 10:49:46', '2017-06-25 14:19:12', '[42,45,46,47,48,49,50,51,52,53,54,55,56,58,59,66,67,68,72,73,74,75,76,77,78,79,80,81,88,91]', null, '588');
INSERT INTO `metabase_fieldvalues` VALUES ('260', '2017-06-22 10:49:46', '2017-06-25 14:19:12', '[\"\"]', null, '589');
INSERT INTO `metabase_fieldvalues` VALUES ('261', '2017-06-22 10:49:46', '2017-06-25 14:19:12', '[0]', null, '590');
INSERT INTO `metabase_fieldvalues` VALUES ('262', '2017-06-22 10:49:46', '2017-06-25 14:19:12', '[\"\"]', null, '591');
INSERT INTO `metabase_fieldvalues` VALUES ('263', '2017-06-22 10:49:46', '2017-06-25 14:19:12', '[\"\",\"04187198\",\"04187198,99338236\",\"04633412,77204597\",\"16805144\",\"23193255,59115380\",\"23569849\",\"30999876\",\"30999876,35338561,99338236,23569849,99896464,71688553\",\"35338561\",\"51230085\",\"51230085,92476576\",\"52335272\",\"52335272,92815211\",\"52386384,00062546\",\"63878251\",\"64016422\",\"71504603,52335272\",\"71504603,52335272,92815211,53269522,04633412,77204597,23193255,59115380,52386384,00062546,82716842,81169690,83767413,20827976\",\"71504603,52335272,92815211,53269522,04633412,77204597,23193255,59115380,52386384,00062546,82716842,81169690,83767413,20827976,99338236\",\"71504603,76821697,91534332\",\"71688553\",\"73129799\",\"82716842,81169690\",\"82716842,81169690,99338236\",\"91534332\",\"91534332,52335272\",\"92476576\",\"92476576,99338236\",\"92815211,53269522\",\"99338236\",\"99338236,64016422\",\"99338236,64016422,30999876\",\"99896464\"]', null, '593');
INSERT INTO `metabase_fieldvalues` VALUES ('264', '2017-06-22 10:49:46', '2017-06-25 14:19:13', '[\"\",\"dsfa,dfasdfasdf\",\"gcd666b\",\"gcd666b,gcd666h\",\"gcd666c\",\"gcd666c,gcd666e\",\"gcd666d,gcd777Q\",\"gcd666g,gcd666k\",\"gcd666h\",\"gcd666h,gcd666c\",\"gcd666p,gcd666j\",\"gcd777h,gcd666a,gcd666b\",\"gcd777h,gcd666a,gcd666h,gcd666c\",\"gcd777h,gcd666h\",\"gcd777h,gcd666h,gcd666c,gcd666e,gcd666g,gcd666k,gcd666d,gcd777Q,gcd777p,gcd666f,gcd666p,gcd666j,gcd666t,gcd666p\",\"gcd777p,gcd666f\",\"wxh1,wxh1,wxh2,wxh3\",\"wxh1,wxh2\",\"wxh2,wxh4\"]', null, '594');
INSERT INTO `metabase_fieldvalues` VALUES ('265', '2017-06-22 10:49:47', '2017-06-25 14:19:13', '[-8,0,1,2,4,10,13,42]', null, '595');
INSERT INTO `metabase_fieldvalues` VALUES ('266', '2017-06-22 10:49:47', '2017-06-25 14:19:13', '[\"\"]', null, '596');
INSERT INTO `metabase_fieldvalues` VALUES ('267', '2017-06-22 10:49:47', '2017-06-25 14:19:13', '[0,1,2,4,6]', null, '597');
INSERT INTO `metabase_fieldvalues` VALUES ('268', '2017-06-22 10:49:47', '2017-06-25 14:19:13', '[\"\"]', null, '598');
INSERT INTO `metabase_fieldvalues` VALUES ('269', '2017-06-22 10:49:48', '2017-06-25 14:19:13', '[0,1,2,3,9,12,23,50]', null, '599');
INSERT INTO `metabase_fieldvalues` VALUES ('270', '2017-06-22 10:49:48', '2017-06-25 14:19:14', '[\" \",\"       阿斯蒂芬\",\"      asdf \",\"     啊手动阀手动阀\",\"    阿斯蒂芬\",\"  asdf\",\"  asdfasdfasdf\",\"  阿斯蒂芬\",\"  阿斯蒂芬阿斯蒂芬撒地方撒大苏打幅度萨芬士大夫爱的色放撒大发射点发射点反对撒发射点范德萨发大水  \",\" 45345\",\" asdf \",\"&lt;a target=&quot;new&quot; href=&quot;/base/book!showArtPage.ct?id=67812022&quot;&gt;绑定知识:onchange事件&lt;/a&gt;\",\"/base/kindeditor/attached/image/20161227/20161227101852_924.txt---cutfile---策略改进1.txt---cutfile---2.7KB\",\"/base/kindeditor/attached/image/20161227/20161227101902_862.png---cutfile---截图00.png---cutfile---175.43KB\",\"/base/kindeditor/attached/image/20161227/20161227102024_16.dmp---cutfile---dump.dmp---cutfile---0KB\",\"/base/kindeditor/attached/image/20161227/20161227121953_495.png---cutfile---截图00.png---cutfile---175.43KB\",\"/base/kindeditor/attached/image/20161227/20161227122010_64.txt---cutfile---策略改进1.txt---cutfile---2.7KB\",\"/base/kindeditor/attached/image/20170103/20170103173830_33.jpg---cutfile---WeChatImage635866810208661038.jpg---cutfile---307.35KB\",\"/base/kindeditor/attached/image/20170303/20170303164730_282.png---cutfile---截图00.png---cutfile---71.92KB\",\"/base/kindeditor/attached/image/20170303/20170303164747_761.txt---cutfile---小盘股.txt---cutfile---10.37KB\",\"/base/kindeditor/attached/image/20170406/20170406182048_380.xls---cutfile---报表.xls---cutfile---39KB\",\"/base/kindeditor/attached/image/20170406/20170406223122_428.png---cutfile---pyocr.png---cutfile---2.79KB\",\"/base/kindeditor/attached/image/20170505/20170505122158_35.sql---cutfile---wxb_site_new.sql---cutfile---1.91MB\",\"/base/kindeditor/attached/image/20170505/20170505153025_483.sh---cutfile---bootscript.sh---cutfile---8.34KB\",\"/base/kindeditor/attached/image/20170505/20170505155608_405.png---cutfile---QQ截图20170505155556.png---cutfile---5.08KB\",\"/base/kindeditor/attached/image/20170505/20170505155735_68.py---cutfile---机器学习测试模型.py---cutfile---8.1KB\",\"/base/kindeditor/attached/image/20170505/20170505155743_901.png---cutfile---QQ截图20170505155556.png---cutfile---5.08KB\",\"/base/kindeditor/attached/image/20170505/20170505161032_500.png---cutfile---QQ截图20170505155556.png---cutfile---5.08KB\",\"/base/kindeditor/attached/image/20170516/20170516151223_621.png---cutfile---QQ截图20170516151208.png---cutfile---11.88KB\",\"/base/kindeditor/attached/image/20170516/20170516151228_931.png---cutfile---QQ截图20170516151216.png---cutfile---7.16KB\",\"2\",\"23\",\"234\",\"324\",\"34\",\"345\",\"4\",\"43\",\"435\",\"43534\",\"435345\",\"43543\",\"45\",\"4534\",\"4543\",\"45435\",\"5\",\"53\",\"5345\",\"5345435234234234\",\"5354\",\"543\",\"543324\",\"?\",\"???\",\"????\",\"????:????\",\"????:onchange??\",\"?????\",\"??????\",\"???????\",\"?????????\",\"?????fd\",\"?????onchange??\",\"a\",\"AAA\",\"aaaaa\",\"AAAAAAAAAA\",\"aasdfsdf\",\"adf\",\"adfs\",\"ads\",\"adsf\",\"adsf.\",\"adsfdsaf\",\"adsffdsa\",\"adsfsadf\",\"adsfsaf\",\"afdas\",\"afds\",\"afdsasdf\",\"afsd\",\"afsdffdaadsfafds\",\"as\",\"asd\",\"asdf \",\"asdf.\",\"asdfa\",\"asdfadsfsadf\",\"asdfafds\",\"asdfas\",\"asdfasd\",\"asdfasdf\",\"asdfasdfasdf\",\"asdfasdfasdfasdfasdf\",\"asdfasdfasdfasfdsadf\",\"asdfasdfasdfsadf\",\"asdfasdfasfd\",\"asdfasdfsadf\",\"asdfasdfsadfsadfasdf\",\"asdfasdfsdaf\",\"asdfasdfsdfasdfasdf\",\"asdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdfasdfasdfsdf\",\"asdfasfd\",\"asdfdsaf\",\"asdfdsf\",\"asdfdsfa\",\"asdff\",\"asdffds\",\"asdfsad\",\"asdfsadf\",\"asdfsadfdsf\",\"asdfsadfsadfasdfasdf\",\"asdfsadfsadfsadfasdfsadfsadf啊撒旦飞洒范德萨范德萨地方士大夫倒萨发士大夫撒旦法大师傅士大夫撒旦范德萨富士达飞洒地方倒萨范德萨飞洒地方收到发射点法士大夫撒旦幅度萨芬士大夫士大夫阿斯蒂芬萨德发射点发射点发射点富士达发啊士大夫倒萨发士大夫撒旦发射点发阿斯弗\",\"asdfsadfsadfsafd\",\"asdfsadfsafasfdasdfasdf\",\"asdfsdaf\",\"asdfsdf\",\"asdfsdfa\",\"asdfsfad\",\"asf\",\"asfd\",\"daf\",\"dafssdf\",\"ddd\",\"ddddd\",\"df\",\"dfa\",\"dfadsf\",\"DSAF\",\"dsaf s \",\"dsafsdaf\",\"dsf\",\"dsfasdf\",\"dsfasdfsadfasdfdsfasdfsadfasdf\",\"dsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdf\",\"dsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdf\",\"dsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdf\",\"dsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdfdsfasdfsadfasdf\",\"dsfasdfsdf\",\"dsfsadfsadfsadf\",\"dsfsda\",\"erewradsf\",\"f\",\"fa\",\"fadsfsadf\",\"fas\",\"fasd\",\"fasdaf\",\"fasdf\",\"fasdfasdf\",\"fasdfsadfdsaf\",\"fd\",\"fda\",\"fdsaf\",\"FFF\",\"fffd\",\"ffff\",\"fffff\",\"fffffffffffff\",\"ffffffffffffff\",\"ffffffffffffffffffffffff\",\"fsa\",\"fsad\",\"fsadf\",\"fsadfadsf\",\"fsadfasdf\",\"fsd\",\"fsdfsadf\",\"h\",\"haha\",\"hahahaha\",\"hehe\",\"jjjjjjjjjjjjjjjjjjjjjjjj\",\"jnkjhl\",\"s\",\"sa\",\"sad\",\"sadf\",\"sadfadsffasd\",\"sadfasdf\",\"sadfasff\",\"sadfdsa\",\"sadfdsafdsa\",\"sadfsd\",\"sadfsdaf\",\"sadfsdfasdfasdfasdf\",\"sd\",\"sdad\",\"sdaf\",\"sdafasdfasdfadsf\",\"sdafds \",\"sdaff \",\"sdafsadf\",\"sdf\",\"sdfa\",\"sdfadsf\",\"sdfasdf\",\"sdfasdfsadfasdf\",\"sdfasfdasdf\",\"sdfsad sda \",\"sdfsadf\",\"sdfsdaf\",\"sdfsdfs sadf\",\"sf\",\"sfd\",\"sfdsadf\",\"tongbu\",\"{\\\"name\\\":\\\"????:asdf\\\",\\\"zsid\\\":\\\"67812096\\\"}\",\"{\\\"name\\\":\\\"????:onchange??\\\",\\\"zsid\\\":\\\"67812022\\\"}\",\"{&quot;name&quot;:&quot;????&quot;}\",\"{&quot;name&quot;:&quot;??????&quot;}\",\"{&quot;name&quot;:&quot;asdf &quot;}\",\"{&quot;name&quot;:&quot;asdf&quot;}\",\"{&quot;name&quot;:&quot;dbhelper优化&quot;,&quot;zsid&quot;:&quot;67812136&quot;}\",\"{&quot;name&quot;:&quot;fasdf&quot;}\",\"{&quot;name&quot;:&quot;new&quot;,&quot;zsid&quot;:&quot;67812057&quot;}\",\"{&quot;name&quot;:&quot;onchange事件&quot;,&quot;zsid&quot;:&quot;67812022&quot;}\",\"{&quot;name&quot;:&quot;table测试&quot;,&quot;zsid&quot;:&quot;67812137&quot;}\",\"{&quot;name&quot;:&quot;worktile技术架构&quot;,&quot;zsid&quot;:&quot;67812154&quot;}\",\"{&quot;name&quot;:&quot;协同消息处理服务器&quot;,&quot;zsid&quot;:&quot;67812153&quot;}\",\"{&quot;name&quot;:&quot;新版数据库架构&quot;,&quot;zsid&quot;:&quot;67812131&quot;}\",\"{&quot;name&quot;:&quot;甘特图&quot;,&quot;zsid&quot;:&quot;67812135&quot;}\",\"其实以上的举例，只是在证明我始终在做一件事，那就是尽量将文字图片化的处理，让文字给人的第一感觉更像是颜色或符号，从而消除观看者阅读前的心理障碍。\",\"原因查找似的发多少\",\"发士大夫\",\"发士大夫多舒服啊\",\"发士大夫撒地方\",\"发射点发射点\",\"发射点发射点发啊士大夫阿斯顿发撒地方阿斯顿发\",\"发射点发射点发阿斯蒂芬啊都是范德萨\",\"同步消息并且设置任务同步人\",\"啊倒萨发射点发三大范德萨\",\"啊士大夫似的\",\"啊士大夫但是\",\"啊士大夫地方\",\"啊士大夫士大夫\",\"啊士大夫撒旦\",\"啊士大夫的撒法\",\"啊大水法大水法\",\"啊富士达发\",\"啊手动阀\",\"啊手动阀士大夫阿斯顿发多少分\",\"啊手动阀手动阀\",\"啊手动阀爱的色放\",\"啊手动阀第三方\",\"士大夫\",\"士大夫的\",\"复杂\",\"多少分\",\"多舒服啊\",\"手动阀手动阀\",\"手动阀手动阀士大夫\",\"撒地方\",\"撒打发士大夫\",\"撒旦发射点\",\"撒旦发生大\",\"撒旦飞洒地方\",\"撒旦飞洒地方 阿斯顿\",\"改良方案手动阀手动阀萨德发的萨芬\",\"是打发士大夫\",\"根据个人每月业绩指标得完成度取系数，未完成当月定制得目标业绩，最低系数0.5封底；超出当月定制得目标系数1.5封顶；刚好完成目标业绩系数为1.例：目标为10万，实际完成12万，系数为12/10=1.2\",\"水岸东方\",\"添加经验\",\"爱的色放\",\"爱的色放但是\",\"爱的色放撒大\",\"的首发式地方\",\"经验总价啊 爱的色放士大夫撒旦\",\"错误纠正\",\"错误纠正2\",\"阿三地方\",\"阿斯蒂芬\",\"阿斯蒂芬撒地方\",\"阿斯蒂芬撒地方阿斯蒂芬撒地方\",\"阿斯蒂芬阿斯蒂芬撒地方撒大苏打幅度萨芬士大夫爱的色放撒大发射点发射点反对撒发射点范德萨发大水\",\"阿斯顿\",\"阿斯顿发射点\",\"阿斯顿发生\",\"阿斯顿发生、大法师、地方、阿斯蒂芬、撒、df\",\"阿斯顿发生士大夫倒萨\",\"阿斯顿法撒旦幅度萨芬sdf\",\"阿迪斯发\",\"飞洒地方\",\"高富帅的风格\"]', null, '600');
INSERT INTO `metabase_fieldvalues` VALUES ('271', '2017-06-22 10:49:48', '2017-06-25 14:19:14', '[2,346,347,348,349,351,352,354,355,391,396,398,399,402,405,407,408,419,426,440,551,552,555,557,558,565,576,578,585]', null, '602');
INSERT INTO `metabase_fieldvalues` VALUES ('272', '2017-06-22 10:49:48', '2017-06-25 14:19:14', '[1,2,3,4,10,20,557]', null, '604');
INSERT INTO `metabase_fieldvalues` VALUES ('273', '2017-06-22 10:49:49', '2017-06-25 14:19:14', '[\"16805144\",\"47222076\",\"64016422\",\"71688553\",\"99338236\",\"99896464\"]', null, '605');
INSERT INTO `metabase_fieldvalues` VALUES ('274', '2017-06-22 10:49:50', '2017-06-25 14:19:15', '[\"-1\",\"0\",\"1\",\"2\",\"3\",\"5\"]', null, '608');
INSERT INTO `metabase_fieldvalues` VALUES ('275', '2017-06-22 10:49:50', '2017-06-25 14:19:15', '[\"\",\"1\",\"2\",\"3\",\"4\"]', null, '609');
INSERT INTO `metabase_fieldvalues` VALUES ('276', '2017-06-22 10:49:51', '2017-06-25 14:19:15', '[0,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,73,74,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,97,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291]', null, '610');
INSERT INTO `metabase_fieldvalues` VALUES ('277', '2017-06-22 10:49:51', '2017-06-25 14:19:15', '[0.0,0.3580902777777778,0.35834490740740743,0.35912037037037037,1.0,1.2949537037037038,1.295,1.4268981481481482,1.471087962962963,2.0,3.0,3.9822685185185187,4.0,5.0,7.0,8.0,8.620868055555556,9.0,10.0]', null, '611');
INSERT INTO `metabase_fieldvalues` VALUES ('278', '2017-06-22 10:49:51', '2017-06-25 14:19:15', '[\"d\"]', null, '612');
INSERT INTO `metabase_fieldvalues` VALUES ('279', '2017-06-22 10:49:51', '2017-06-25 14:19:15', '[\"\",\"0\",\"1\",\"2\",\"23\",\"3\",\"36\",\"4\",\"48\",\"49\",\"5\",\"52\",\"54\",\"55\",\"56\",\"57\",\"65\"]', null, '614');
INSERT INTO `metabase_fieldvalues` VALUES ('280', '2017-06-22 10:49:51', '2017-06-25 14:19:15', '[\"0\",\"1\",\"2\"]', null, '615');
INSERT INTO `metabase_fieldvalues` VALUES ('281', '2017-06-22 10:49:51', '2017-06-25 14:19:15', '[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,26,27,28,29,30,31,32,33,34]', null, '617');
INSERT INTO `metabase_fieldvalues` VALUES ('282', '2017-06-22 10:49:51', '2017-06-25 14:19:15', '[\"\",\"0\",\"0:\",\"1:\",\"2:1,2\",\"2:3\",\"4:15\",\"4:9\"]', null, '618');
INSERT INTO `metabase_fieldvalues` VALUES ('283', '2017-06-22 10:49:52', '2017-06-25 14:19:15', '[\"\",\"?????s????da\",\"adsfa\",\"asdf\",\"a法大师傅\",\"debug\",\"dsfasdf\",\"dsfsd\",\"fdsafsadf\",\"FFFFF\",\"haha\",\"New task\",\"renwuming\",\"sadf\",\"sadfasdfadsf\",\"xinrenwu \",\"交互设计\",\"今日头条\",\"任务完成\",\"任务完成后发送审核通知测试\",\"任务完成待审核通知\",\"任务审核失败通知测试\",\"任务审核成功通知测试\",\"任务数据测试\",\"任务标记可配置设置！\",\"任务的前置任务完成后任务才可以开始进行\",\"倒萨发射点\",\"关注任务\",\"关注的任务进度改变\",\"再添加一个推广计划\",\"写落地页\",\"列入开发\",\"列入开发计划\",\"加客量\",\"加粉量\",\"即时通知\",\"反馈收件箱\",\"发射点犯得上\",\"周业绩目标\",\"周循环任务测试\",\"啊倒萨发射点\",\"啊士大夫士大夫\",\"啊士大夫撒旦\",\"啊方式dads\",\"基本测试\",\"填写加分两\",\"填写加客亮\",\"填写加客量\",\"填写加粉量\",\"填写加销售量\",\"填写广告费\",\"填写成交量\",\"填写推广数据\",\"填写推广数据-百度推广\",\"填写推广费用\",\"填写新增粉丝\",\"填写销售数据\",\"填写销售量\",\"士大夫撒旦\",\"处理中\",\"处理结果确认\",\"天循环任务测试\",\"字体效果对比\",\"定期进行大型设计终审，最好由产品、设计、研发、运营等部门人的参与。\",\"审核失败\",\"审核测试审核测试审核测试\",\"富士达发士大夫\",\"将确定好的需求放进列表\",\"将落地页生成HTML\",\"已处理\",\"幅度萨芬\",\"广点通\",\"归档\",\"循环任务\",\"成果总结讨论\",\"所有访问必须带上MAC地址\",\"手动阀手动阀\",\"打发士大夫\",\"打发士大夫士大夫\",\"执行标准\",\"报表2.0\",\"报表测试\",\"推广文案\",\"推广计划2\",\"推广费-今日头条\",\"推广费-广点通\",\"推广费-神马搜索\",\"推广页面\",\"撒旦发射点\",\"撒旦发生\",\"撒旦发生大\",\"文件取消上传，上传超时，上传错误的处理\",\"月业绩目标\",\"月循环任务测试\",\"服务器更换好\",\"法撒旦飞洒的\",\"添加或者选文案\",\"添加推广计划\",\"添加文案\",\"烦烦烦\",\"爱的色放爱的色放撒地方\",\"版本2需求\",\"版本3需求\",\"用GIT进行版本控制用GIT进行版本控制用GIT进行版本控制\",\"由交互设计师设计产品原型,附上说明和附件\",\"百度推广\",\"确定需求\",\"神马搜索\",\"编辑器表格添加默认样式\",\"视觉设计\",\"设置任务负责人审核人后拖动任务本地负责人审核人消失BUG\",\"设计终审\",\"请假\",\"进度-1\",\"通知测试\",\"通知演示\",\"通知用户\",\"通过任务ID关联相关的研发任务，以便于设计师跟进\",\"销售\",\"销售量\",\"阿斯蒂芬\",\"阿斯蒂芬撒地方\",\"阿斯顿发射点\",\"需求分析\",\"需求收集\",\"需求暂缓\",\"需求确认\",\"需求评估\",\"颜色测试\"]', null, '619');
INSERT INTO `metabase_fieldvalues` VALUES ('284', '2017-06-22 10:49:52', '2017-06-25 14:19:15', '[\"\"]', null, '620');
INSERT INTO `metabase_fieldvalues` VALUES ('285', '2017-06-22 10:49:52', '2017-06-25 14:19:15', '[\"\"]', null, '621');
INSERT INTO `metabase_fieldvalues` VALUES ('286', '2017-06-22 10:49:52', '2017-06-25 14:19:15', '[\"\",\"0\",\"156\",\"162\",\"349\",\"360\",\"361\",\"362\",\"363\",\"364\",\"380\",\"382\",\"385\",\"387\",\"391\",\"414\",\"418\",\"444\",\"545\",\"551\",\"558\"]', null, '622');
INSERT INTO `metabase_fieldvalues` VALUES ('287', '2017-06-22 10:49:52', '2017-06-25 14:19:16', '[-1.0,0.0,25.0,40.0,50.0,75.0,100.0]', null, '623');
INSERT INTO `metabase_fieldvalues` VALUES ('288', '2017-06-22 10:49:53', '2017-06-25 14:19:16', '[42,45,46,47,48,49,50,51,52,53,54,55,56,58,59,66,67,68,72,73,74,75,76,77,78,79,80,81]', null, '624');
INSERT INTO `metabase_fieldvalues` VALUES ('289', '2017-06-22 10:49:53', '2017-06-25 14:19:16', '[\"\"]', null, '625');
INSERT INTO `metabase_fieldvalues` VALUES ('290', '2017-06-22 10:49:53', '2017-06-25 14:19:16', '[0]', null, '626');
INSERT INTO `metabase_fieldvalues` VALUES ('291', '2017-06-22 10:49:53', '2017-06-25 14:19:16', '[\"\"]', null, '627');
INSERT INTO `metabase_fieldvalues` VALUES ('292', '2017-06-22 10:49:53', '2017-06-25 14:19:16', '[\"\",\"04187198\",\"04187198,99338236\",\"04633412,77204597\",\"16805144\",\"23193255,59115380\",\"23569849\",\"30999876\",\"30999876,35338561,99338236,23569849,99896464,71688553\",\"35338561\",\"51230085\",\"51230085,92476576\",\"52335272\",\"52335272,92815211\",\"52386384,00062546\",\"63878251\",\"71504603,52335272\",\"71504603,52335272,92815211,53269522\",\"71504603,52335272,92815211,53269522,04633412,77204597,23193255,59115380,52386384,00062546,82716842,81169690,83767413,20827976\",\"71504603,52335272,92815211,53269522,04633412,77204597,23193255,59115380,52386384,00062546,82716842,81169690,83767413,20827976,99338236\",\"71504603,76821697,91534332\",\"71688553\",\"73129799\",\"82716842,81169690\",\"82716842,81169690,99338236\",\"91534332\",\"91534332,52335272\",\"92476576\",\"92476576,99338236\",\"92815211,53269522\",\"99338236\",\"99338236,64016422\",\"99896464\"]', null, '629');
INSERT INTO `metabase_fieldvalues` VALUES ('293', '2017-06-22 10:49:53', '2017-06-25 14:19:16', '[\"\",\"dsfa,dfasdfasdf\",\"gcd666b\",\"gcd666b,gcd666h\",\"gcd666c\",\"gcd666c,gcd666e\",\"gcd666d,gcd777Q\",\"gcd666g,gcd666k\",\"gcd666h\",\"gcd666h,gcd666c\",\"gcd666p,gcd666j\",\"gcd777h,gcd666a,gcd666b\",\"gcd777h,gcd666a,gcd666h,gcd666c\",\"gcd777h,gcd666h\",\"gcd777h,gcd666h,gcd666c,gcd666e,gcd666g,gcd666k,gcd666d,gcd777Q,gcd777p,gcd666f,gcd666p,gcd666j,gcd666t,gcd666p\",\"gcd777p,gcd666f\",\"wxh1,wxh1,wxh2,wxh3\",\"wxh1,wxh2\",\"wxh2,wxh4\"]', null, '630');
INSERT INTO `metabase_fieldvalues` VALUES ('294', '2017-06-22 10:49:54', '2017-06-25 14:19:16', '[\"\"]', null, '631');
INSERT INTO `metabase_fieldvalues` VALUES ('295', '2017-06-22 10:49:54', '2017-06-25 14:19:16', '[\"\"]', null, '632');
INSERT INTO `metabase_fieldvalues` VALUES ('296', '2017-06-22 10:49:55', '2017-06-25 14:19:16', '[0,1]', null, '634');
INSERT INTO `metabase_fieldvalues` VALUES ('297', '2017-06-22 10:49:55', '2017-06-25 14:19:17', '[0,1]', null, '635');
INSERT INTO `metabase_fieldvalues` VALUES ('298', '2017-06-22 10:49:55', '2017-06-25 14:19:17', '[\"\",\"04187198\",\"23569849\",\"23946449\",\"30999876\",\"35338561\",\"49586903\",\"51230085\",\"52335272\",\"64016422\",\"92476576\",\"99338236\",\"99896464\"]', null, '636');
INSERT INTO `metabase_fieldvalues` VALUES ('299', '2017-06-22 10:49:55', '2017-06-25 14:19:17', '[\"0\",\"1\",\"116\",\"13\",\"133\",\"15\",\"187\",\"2\",\"204\",\"206\",\"207\",\"209\",\"221\",\"225\",\"23\",\"238\",\"24\",\"249\",\"25\",\"255\",\"256\",\"258\",\"259\",\"26\",\"261\",\"27\",\"273\",\"274\",\"276\",\"277\",\"279\",\"28\",\"291\",\"292\",\"296\",\"3\",\"309\",\"311\",\"312\",\"314\",\"326\",\"327\",\"329\",\"330\",\"332\",\"344\",\"345\",\"346\",\"347\",\"348\",\"349\",\"350\",\"351\",\"352\",\"355\",\"357\",\"358\",\"359\",\"361\",\"369\",\"391\",\"392\",\"393\",\"394\",\"395\",\"396\",\"397\",\"398\",\"399\",\"4\",\"400\",\"401\",\"402\",\"403\",\"404\",\"405\",\"407\",\"408\",\"409\",\"410\",\"411\",\"412\",\"413\",\"416\",\"418\",\"427\",\"435\",\"437\",\"525\",\"526\",\"527\",\"528\",\"529\",\"530\",\"531\",\"532\",\"533\",\"534\",\"535\",\"536\",\"537\",\"544\",\"545\",\"546\",\"547\",\"548\",\"549\",\"557\",\"558\",\"561\",\"562\",\"563\",\"564\",\"565\",\"566\",\"567\",\"568\",\"569\",\"570\",\"571\",\"572\",\"573\",\"576\",\"577\",\"578\",\"579\",\"580\",\"581\",\"582\",\"583\",\"584\",\"585\",\"586\",\"587\",\"588\",\"589\",\"590\",\"591\",\"592\",\"593\",\"595\",\"596\",\"597\",\"598\",\"599\",\"6\",\"618\",\"619\",\"620\",\"621\",\"622\",\"623\",\"8\",\"9\",\"99\"]', null, '637');
INSERT INTO `metabase_fieldvalues` VALUES ('300', '2017-06-22 10:49:56', '2017-06-25 14:19:17', '[\"0\"]', null, '639');
INSERT INTO `metabase_fieldvalues` VALUES ('301', '2017-06-22 10:49:56', '2017-06-25 14:19:17', '[\"0:\",\"1:\",\"2:1\",\"2:1,2\",\"2:1,2,3,4,5,6,7\",\"2:3\",\"4:15\",\"4:9\"]', null, '640');
INSERT INTO `metabase_fieldvalues` VALUES ('302', '2017-06-22 10:49:56', '2017-06-25 14:19:17', '[\"42\",\"45\",\"46\",\"47\",\"50\",\"52\",\"55\",\"72\",\"79\",\"91\"]', null, '641');
INSERT INTO `metabase_fieldvalues` VALUES ('303', '2017-06-22 10:49:57', '2017-06-25 14:19:17', '[\"\",\"04187198\",\"04633412,77204597\",\"23193255,59115380\",\"30999876\",\"35338561\",\"49586903\",\"49586903,99338236\",\"51230085\",\"52335272\",\"52386384,00062546\",\"71504603,52335272\",\"71504603,76821697,91534332\",\"82716842,81169690\",\"92476576\",\"92815211,53269522\",\"99338236\"]', null, '643');
INSERT INTO `metabase_fieldvalues` VALUES ('304', '2017-06-22 10:49:57', '2017-06-25 14:19:18', '[\"1478015776042\",\"1478070873397\",\"1478233558026\",\"1478403401890\",\"1479041277660\",\"1479092523553\",\"1479093931209\",\"1479108340376\",\"1479528296683\",\"1479739736646\",\"1480002113385\",\"1480669436376\",\"1481035073921\",\"1481035189298\",\"1481035210386\",\"1483176266417\",\"1483177011594\",\"1483421390860\"]', null, '644');
INSERT INTO `metabase_fieldvalues` VALUES ('305', '2017-06-22 10:49:57', '2017-06-25 14:19:18', '[\"100\",\"10000\",\"1500\",\"15000\",\"200\",\"20000\",\"300\",\"3000\",\"30000\",\"5\",\"500\",\"5000\",\"5060\",\"6\",\"8\"]', null, '645');
INSERT INTO `metabase_fieldvalues` VALUES ('306', '2017-06-22 10:49:58', '2017-06-25 14:19:18', '[\"10000\",\"14000\",\"20000\",\"30000\",\"5\",\"50\",\"5000\",\"6\",\"600\",\"6000\",\"8\"]', null, '646');
INSERT INTO `metabase_fieldvalues` VALUES ('307', '2017-06-22 10:49:58', '2017-06-25 14:19:18', '[\"42\",\"45\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"55\",\"72\"]', null, '648');
INSERT INTO `metabase_fieldvalues` VALUES ('308', '2017-06-22 10:49:58', '2017-06-25 14:19:18', '[\"0\",\"354\"]', null, '649');
INSERT INTO `metabase_fieldvalues` VALUES ('309', '2017-06-22 10:49:58', '2017-06-25 14:19:18', '[\"1\",\"10\",\"11\",\"12\",\"15\",\"16\",\"17\",\"18\",\"2\",\"3\",\"4\",\"6\",\"7\",\"8\",\"9\"]', null, '650');
INSERT INTO `metabase_fieldvalues` VALUES ('310', '2017-06-22 10:49:58', '2017-06-25 14:19:18', '[\"109\",\"110\",\"115\",\"14\",\"20\",\"31\",\"354\",\"37\",\"42\",\"47\",\"52\",\"57\",\"61\",\"68\"]', null, '651');
INSERT INTO `metabase_fieldvalues` VALUES ('311', '2017-06-22 10:49:58', '2017-06-25 14:19:18', '[\"30999876\",\"51230085\",\"92476576\",\"99338236\"]', null, '652');
INSERT INTO `metabase_fieldvalues` VALUES ('312', '2017-06-22 10:49:59', '2017-06-25 14:19:19', '[\"1000\",\"10000\",\"14000\",\"2000\",\"20000\",\"300\",\"3000\",\"30000\",\"5\",\"505\",\"6\",\"600\",\"6000\",\"8\",\"8000\"]', null, '653');
INSERT INTO `metabase_fieldvalues` VALUES ('313', '2017-06-22 10:50:00', '2017-06-25 14:19:19', '[\"d\",\"dsf\",\"dsfsdsadfsadf\",\"dsfsdsadfsadfafsd\",\"的说法都是\",\"祛斑\",\"项目\"]', null, '655');
INSERT INTO `metabase_fieldvalues` VALUES ('314', '2017-06-22 10:50:01', '2017-06-25 14:19:19', '[\"1477926839899\",\"1478068808632\",\"1478272603227\",\"1478403382307\",\"1478684105172\",\"1479041117403\",\"1479093922109\",\"1479108326291\",\"1479526981859\",\"1479739719980\",\"1480002093639\",\"1480669375219\",\"1480952477342\",\"1480952500605\",\"1481034224768\",\"1481034240524\",\"1481034277645\",\"1483176237400\",\"1483176586006\"]', null, '656');
INSERT INTO `metabase_fieldvalues` VALUES ('315', '2017-06-22 10:50:01', '2017-06-25 14:19:20', '[\"asdf\",\"dsfads\",\"dsfasdf\",\"dsfasdfdsaf\",\"啊倒萨发射点发\",\"啊飞洒地方\",\"媒体编码\",\"媒体编码1\",\"媒体编码2\",\"媒体编码3\",\"添加媒体编码\"]', null, '658');
INSERT INTO `metabase_fieldvalues` VALUES ('316', '2017-06-22 10:50:01', '2017-06-25 14:19:20', '[\"adsfdsaf\",\"asdfsad fsdf asdf\",\"d\",\"dsf\",\"sadfasdfsad\",\"sda\",\"媒体账号\",\"媒体账号3\",\"媒体账户\",\"撒旦飞洒地方阿斯蒂芬\",\"账号1\",\"账号2\",\"阿斯蒂芬第三方\"]', null, '659');
INSERT INTO `metabase_fieldvalues` VALUES ('317', '2017-06-22 10:50:02', '2017-06-25 14:19:20', '[\"42\",\"45\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"55\",\"72\"]', null, '660');
INSERT INTO `metabase_fieldvalues` VALUES ('318', '2017-06-22 10:50:02', '2017-06-25 14:19:20', '[\"1\",\"104\",\"105\",\"106\",\"17\",\"30\",\"353\",\"36\",\"41\",\"46\",\"51\",\"56\",\"60\",\"65\"]', null, '661');
INSERT INTO `metabase_fieldvalues` VALUES ('319', '2017-06-22 10:50:02', '2017-06-25 14:19:20', '[\"d\",\"dsf\",\"dsfsdsadfsadfafsd\",\"祛斑\",\"选择推广的产品\",\"项目1·\",\"项目3\"]', null, '662');
INSERT INTO `metabase_fieldvalues` VALUES ('320', '2017-06-22 10:50:03', '2017-06-25 14:19:20', '[\"30999876\",\"51230085\",\"92476576\",\"99338236\"]', null, '663');
INSERT INTO `metabase_fieldvalues` VALUES ('321', '2017-06-22 10:50:03', '2017-06-25 14:19:20', '[\"1\",\"10\",\"11\",\"13\",\"2\",\"3\",\"4\",\"6\",\"7\",\"8\",\"9\"]', null, '664');
INSERT INTO `metabase_fieldvalues` VALUES ('322', '2017-06-22 10:50:04', '2017-06-25 14:19:21', '[\"64016422@localhost/56wrpa6135\",\"99338236@localhost/a243fspbei\",\"99896464@localhost.com\"]', null, '668');
INSERT INTO `metabase_fieldvalues` VALUES ('323', '2017-06-22 10:50:04', '2017-06-25 14:19:21', '[\"\",\"enabledtest\",\"fasdf\",\"gcd666a\",\"gcd666b\",\"gcd666c\",\"gcd666d\",\"gcd666e\",\"gcd666f\",\"gcd666g\",\"gcd666h\",\"gcd666j\",\"gcd666k\",\"gcd666p\",\"gcd666t\",\"gcd777f\",\"gcd777h\",\"gcd777k\",\"gcd777n\",\"gcd777p\",\"gcd777Q\",\"werwer\",\"wxh1\",\"wxh1,wxh2,wxh3\"]', null, '669');
INSERT INTO `metabase_fieldvalues` VALUES ('324', '2017-06-22 10:50:04', '2017-06-25 14:19:21', '[0]', null, '670');
INSERT INTO `metabase_fieldvalues` VALUES ('325', '2017-06-22 10:50:04', '2017-06-25 14:19:21', '[0,17,31,35,37,44,59,73]', null, '672');
INSERT INTO `metabase_fieldvalues` VALUES ('326', '2017-06-22 10:50:05', '2017-06-25 14:19:21', '[\"1055586866\",\"123456\",\"3232\"]', null, '673');
INSERT INTO `metabase_fieldvalues` VALUES ('327', '2017-06-22 10:50:05', '2017-06-25 14:19:21', '[\"0\"]', null, '674');
INSERT INTO `metabase_fieldvalues` VALUES ('328', '2017-06-22 10:50:05', '2017-06-25 14:19:21', '[\"123456\",\"13060823518\",\"3232\"]', null, '675');
INSERT INTO `metabase_fieldvalues` VALUES ('329', '2017-06-22 10:50:46', '2017-06-25 14:19:22', '[\"1105\",\"1155\",\"a\",\"adsfasd\",\"bianji1\",\"ceshi111\",\"ceshi222\",\"ceshi333\",\"ceshia\",\"ch\",\"ch2\",\"cy\",\"dl\",\"enabledtest\",\"fkfk\",\"haha\",\"ht\",\"hw\",\"jiabowen\",\"jx\",\"lh\",\"lt\",\"ly\",\"mq\",\"my\",\"s\",\"s2\",\"scca\",\"sm\",\"ss2\",\"sssss\",\"super\",\"super2432\",\"tuiguang1\",\"tuiguang2\",\"tuiguang3\",\"webim\",\"webim2\",\"webim3\",\"wenan1\",\"wenan12\",\"wer\",\"wera\",\"werfds\",\"ws\",\"xiaoshou1\",\"xm\",\"yl\",\"zt\"]', null, '681');
INSERT INTO `metabase_fieldvalues` VALUES ('330', '2017-06-22 10:50:46', '2017-06-25 14:19:22', '[0,1]', null, '683');
INSERT INTO `metabase_fieldvalues` VALUES ('331', '2017-06-22 10:50:47', '2017-06-25 14:19:22', '[\"20161105/71504603head1478324993881.txt\",\"20161105/76821697head1478333461518.txt\",\"20161227/99338236head1482845963599.txt\"]', null, '684');
INSERT INTO `metabase_fieldvalues` VALUES ('332', '2017-06-22 10:50:47', '2017-06-25 14:19:22', '[\"00:15:5D:68:90:E7\",\"D8CB8AF40C51\"]', null, '686');
INSERT INTO `metabase_fieldvalues` VALUES ('333', '2017-06-22 10:50:48', '2017-06-25 14:19:22', '[\"/Db3irW13/Y=\",\"0kXR/KhaaOU=\",\"0YqREMgANCQMba0K881Jmg==\",\"47O+vQTff1I=\",\"4BBUVP3JpR8Mba0K881Jmg==\",\"7cXQ6nlCOmw=\",\"83cURX0oGy8=\",\"auhoepvxIEQ=\",\"axtnevzIuDU=\",\"Brm9UWSPEgU=\",\"bS0I6YBpaC4=\",\"c9sVzHEqbbc=\",\"DwmhCsRWh30=\",\"fvWZ53u93se3yrGcvivf4A==\",\"GBTuST56n+A=\",\"GqZjPH2hRNs=\",\"HOp6ypCOmNPeoDuwA3iP3g==\",\"igdjMALtpVQ=\",\"iJn/tX/WiDQ=\",\"JW1VMu62YoU=\",\"K6lg/Nr+FoA=\",\"KNre3Ix9dDw=\",\"L8SPzitbl4sMba0K881Jmg==\",\"ld9aDhiOrMI=\",\"lezi9Zq7FTs=\",\"M+VbbzHtSL0=\",\"MoU5bR7a/sw=\",\"oRnU2l+YcxQ=\",\"OTdaCFCA2js=\",\"RlmVBnNy5cc=\",\"s76aDCJ/9No=\",\"ShzyNUClufw=\",\"skCuCRtaPrY=\",\"t6MVKtPjeTw=\",\"To8kuotgFxU=\",\"trjcFknLk6I=\",\"U15DNOVoFGo=\",\"Yre1HAkWoLg=\",\"zEiyst7gC9A=\"]', null, '687');
INSERT INTO `metabase_fieldvalues` VALUES ('334', '2017-06-22 10:50:49', '2017-06-25 14:19:22', '[\"系统管理员账号\"]', null, '688');
INSERT INTO `metabase_fieldvalues` VALUES ('335', '2017-06-22 10:50:49', '2017-06-25 14:19:22', '[0,16,26,27,28,29,97002664,97002665,97002666]', null, '689');
INSERT INTO `metabase_fieldvalues` VALUES ('336', '2017-06-22 10:50:49', '2017-06-25 14:19:22', '[\"a\",\"aadsfsdfasdf\",\"asdf\",\"bianji1\",\"ceshi1.wenan\",\"ceshi12.tuiguang\",\"ceshi3.xiaoshou\",\"ceshia\",\"enabledtest\",\"fkfkd\",\"haha\",\"jiabowen\",\"rerewr\",\"rerewrasfd\",\"rerewrasfdafdafdsadsf\",\"rerewrasfdafds\",\"root\",\"root2\",\"s2\",\"scc\",\"webim\",\"webim2\",\"华微1\",\"同步添加用户\",\"啊飞洒地方\",\"嘉欣\",\"妹琴\",\"彩虹\",\"推广1\",\"推广4\",\"推广员1\",\"文斯\",\"文案1\",\"春花\",\"林婷\",\"柳华\",\"柳缘\",\"梦媛\",\"泽田\",\"燕玲\",\"申长春\",\"秀梅\",\"程英\",\"素素2\",\"胡婷\",\"苏漫\",\"董娜\",\"销售1\",\"阿斯蒂芬\"]', null, '691');
INSERT INTO `metabase_fieldvalues` VALUES ('337', '2017-06-22 10:50:50', '2017-06-25 14:19:22', '[1,3]', null, '692');
INSERT INTO `metabase_fieldvalues` VALUES ('338', '2017-06-22 10:50:53', '2017-06-25 14:19:23', '[\"77\"]', null, '710');
INSERT INTO `metabase_fieldvalues` VALUES ('339', '2017-06-22 10:50:54', '2017-06-25 14:19:23', '[\"486\"]', null, '711');
INSERT INTO `metabase_fieldvalues` VALUES ('340', '2017-06-22 10:50:55', '2017-06-25 14:19:23', '[\"1490773384056\",\"1493779768541\",\"1493779770779\"]', null, '712');
INSERT INTO `metabase_fieldvalues` VALUES ('341', '2017-06-22 10:50:56', '2017-06-25 14:19:23', '[\"99338236\"]', null, '713');
INSERT INTO `metabase_fieldvalues` VALUES ('342', '2017-06-22 10:50:56', '2017-06-25 14:19:24', '[\"阿三地方\",\"阿斯蒂芬\"]', null, '714');
INSERT INTO `metabase_fieldvalues` VALUES ('343', '2017-06-22 10:50:57', '2017-06-25 14:19:24', '[\"士大夫\",\"爱的色放\"]', null, '715');
INSERT INTO `metabase_fieldvalues` VALUES ('344', '2017-06-22 10:50:58', '2017-06-25 14:19:24', '[\"5\"]', null, '717');
INSERT INTO `metabase_fieldvalues` VALUES ('345', '2017-06-22 10:50:59', '2017-06-25 14:19:24', '[\"5\"]', null, '718');
INSERT INTO `metabase_fieldvalues` VALUES ('346', '2017-06-22 10:50:59', '2017-06-25 14:19:24', '[\"5\"]', null, '719');
INSERT INTO `metabase_fieldvalues` VALUES ('347', '2017-06-22 10:50:59', '2017-06-25 14:19:24', '[\"23946449\"]', null, '720');
INSERT INTO `metabase_fieldvalues` VALUES ('348', '2017-06-22 10:51:00', '2017-06-25 14:19:24', '[\"55\"]', null, '721');
INSERT INTO `metabase_fieldvalues` VALUES ('349', '2017-06-22 10:51:00', '2017-06-25 14:19:25', '[\"5555\"]', null, '722');
INSERT INTO `metabase_fieldvalues` VALUES ('350', '2017-06-22 10:51:00', '2017-06-25 14:19:25', '[\"555\"]', null, '723');
INSERT INTO `metabase_fieldvalues` VALUES ('351', '2017-06-22 10:51:01', '2017-06-25 14:19:25', '[\" 任务1 \"]', null, '725');
INSERT INTO `metabase_fieldvalues` VALUES ('352', '2017-06-22 10:51:01', '2017-06-25 14:19:25', '[1]', null, '726');
INSERT INTO `metabase_fieldvalues` VALUES ('353', '2017-06-22 10:51:01', '2017-06-25 14:19:25', '[\"23946449\"]', null, '727');
INSERT INTO `metabase_fieldvalues` VALUES ('354', '2017-06-22 10:51:02', '2017-06-25 14:19:26', '[\"72\",\"78\",\"81\"]', null, '729');
INSERT INTO `metabase_fieldvalues` VALUES ('355', '2017-06-22 10:51:02', '2017-06-25 14:19:26', '[346,347,349,351,352,354,356,357,358,359,393,399,402,420,558]', null, '730');
INSERT INTO `metabase_fieldvalues` VALUES ('356', '2017-06-22 10:51:03', '2017-06-25 14:19:26', '[\"0\"]', null, '731');
INSERT INTO `metabase_fieldvalues` VALUES ('357', '2017-06-22 10:51:03', '2017-06-25 14:19:26', '[\"99338236\",\"99896464\"]', null, '732');
INSERT INTO `metabase_fieldvalues` VALUES ('358', '2017-06-22 10:51:05', '2017-06-25 14:19:26', '[\"1\",\"2\"]', null, '734');
INSERT INTO `metabase_fieldvalues` VALUES ('359', '2017-06-22 10:51:05', '2017-06-25 14:19:26', '[\"user_service_ceshiceshi\",\"user_service_测试啊啊啊\",\"user_service_添加文案\",\"user_service_销售业绩\"]', null, '735');
INSERT INTO `metabase_fieldvalues` VALUES ('360', '2017-06-22 10:51:05', '2017-06-25 14:19:26', '[\"2017-3-18\",\"2017-3-29\",\"2017-4-24\",\"2017-6-22\"]', null, '736');
INSERT INTO `metabase_fieldvalues` VALUES ('361', '2017-06-22 10:51:06', '2017-06-25 14:19:26', '[\"ceshiceshi\",\"测试啊啊啊\",\"添加文案\",\"销售业绩\"]', null, '737');
INSERT INTO `metabase_fieldvalues` VALUES ('362', '2017-06-22 10:51:06', '2017-06-25 14:19:26', '[\"scc\"]', null, '738');
INSERT INTO `metabase_fieldvalues` VALUES ('363', '2017-06-22 10:51:06', '2017-06-25 14:19:26', '[\"cccccc\",\"写的文案记录\",\"发士大夫\",\"销售表\"]', null, '739');
INSERT INTO `metabase_fieldvalues` VALUES ('364', '2017-06-22 10:51:08', '2017-06-25 14:19:27', '[\"a\"]', null, '744');
INSERT INTO `metabase_fieldvalues` VALUES ('365', '2017-06-22 10:51:08', '2017-06-25 14:19:27', '[\"a\"]', null, '745');
INSERT INTO `metabase_fieldvalues` VALUES ('366', '2017-06-22 10:51:08', '2017-06-25 14:19:27', '[\"a\"]', null, '746');
INSERT INTO `metabase_fieldvalues` VALUES ('367', '2017-06-22 10:51:10', '2017-06-25 14:19:28', '[\"1477925312294\",\"1478067597434\",\"1478272597108\",\"1478403306807\",\"1479040504691\",\"1479093893461\",\"1479108143724\",\"1479526923621\",\"1479739693420\",\"1480669348727\",\"1481033835587\",\"1483176080541\",\"1483262312359\",\"1483262520502\",\"1483262550127\",\"1484146171418\",\"1486807223993\"]', null, '747');
INSERT INTO `metabase_fieldvalues` VALUES ('368', '2017-06-22 10:51:10', '2017-06-25 14:19:28', '[\"目asdf的3\",\"目的1\",\"目的2\",\"目的5\"]', null, '749');
INSERT INTO `metabase_fieldvalues` VALUES ('369', '2017-06-22 10:51:10', '2017-06-25 14:19:28', '[\"d\",\"dsf\",\"dsfsd\",\"dsfsdsadfsadf\",\"祛斑\",\"项目\"]', null, '750');
INSERT INTO `metabase_fieldvalues` VALUES ('370', '2017-06-22 10:51:10', '2017-06-25 14:19:28', '[\"42\",\"45\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"55\",\"72\",\"76\"]', null, '751');
INSERT INTO `metabase_fieldvalues` VALUES ('371', '2017-06-22 10:51:11', '2017-06-25 14:19:28', '[\"16\",\"29\",\"348\",\"35\",\"352\",\"396\",\"40\",\"408\",\"45\",\"50\",\"55\",\"6\",\"64\",\"99\"]', null, '752');
INSERT INTO `metabase_fieldvalues` VALUES ('372', '2017-06-22 10:51:11', '2017-06-25 14:19:28', '[\"04187198\",\"16805144\",\"23569849\",\"99338236\"]', null, '753');
INSERT INTO `metabase_fieldvalues` VALUES ('373', '2017-06-22 10:51:11', '2017-06-25 14:19:28', '[\"10点\",\"asdf\",\"asdfafsd\"]', null, '754');
INSERT INTO `metabase_fieldvalues` VALUES ('374', '2017-06-22 10:51:11', '2017-06-25 14:19:28', '[\"fdsa\",\"fdsafsad\",\"落地页\"]', null, '755');
INSERT INTO `metabase_fieldvalues` VALUES ('375', '2017-06-22 10:51:12', '2017-06-25 14:19:29', '[\"\",\"dsfasdf\",\"QQ\",\"QQ空间\",\"sfd\",\"xinqudao\",\"微信\",\"微博\",\"论坛\"]', null, '757');
INSERT INTO `metabase_fieldvalues` VALUES ('376', '2017-06-22 10:51:13', '2017-06-25 14:19:29', '[\"\",\"dsfasdf\",\"QQ好友推广\",\"saf\",\"xinqudao\",\"微信\",\"微信分享链接\",\"微信推广\",\"微博分享\",\"微博推广\",\"空间推广\",\"论坛推广\"]', null, '758');
INSERT INTO `metabase_fieldvalues` VALUES ('377', '2017-06-22 10:51:13', '2017-06-25 14:19:29', '[\"20168352\",\"31921440\",\"33285374\",\"97566786\",\"99633853\"]', null, '759');
INSERT INTO `metabase_fieldvalues` VALUES ('378', '2017-06-22 10:51:15', '2017-06-25 14:19:30', '[0.0]', null, '765');
INSERT INTO `metabase_fieldvalues` VALUES ('379', '2017-06-22 10:51:15', '2017-06-25 14:19:30', '[\"一品斋\",\"品质生活馆\",\"无限互联精品店\"]', null, '768');
INSERT INTO `metabase_fieldvalues` VALUES ('380', '2017-06-22 10:51:16', '2017-06-25 14:19:30', '[0,3]', null, '769');
INSERT INTO `metabase_fieldvalues` VALUES ('381', '2017-06-22 10:51:16', '2017-06-25 14:19:30', '[\"jack520007\",\"jack520009\",\"jackson020\"]', null, '770');
INSERT INTO `metabase_fieldvalues` VALUES ('382', '2017-06-22 10:51:16', '2017-06-25 14:19:30', '[\"RaFutWeh0ww=\"]', null, '771');
INSERT INTO `metabase_fieldvalues` VALUES ('383', '2017-06-22 10:51:16', '2017-06-25 14:19:30', '[\"13787047370\",\"13787047375\"]', null, '772');
INSERT INTO `metabase_fieldvalues` VALUES ('384', '2017-06-22 10:51:17', '2017-06-25 14:19:30', '[\"343434\",\"546464342\",\"654151151\"]', null, '773');
INSERT INTO `metabase_fieldvalues` VALUES ('385', '2017-06-22 10:51:17', '2017-06-25 14:19:30', '[1]', null, '774');
INSERT INTO `metabase_fieldvalues` VALUES ('386', '2017-06-22 10:51:18', '2017-06-25 14:19:31', '[\"pz3423\",\"wxh54651\",\"yp0725\"]', null, '776');
INSERT INTO `metabase_fieldvalues` VALUES ('387', '2017-06-22 10:51:20', '2017-06-25 14:19:31', '[\"\",\"666\"]', null, '777');
INSERT INTO `metabase_fieldvalues` VALUES ('388', '2017-06-22 10:51:21', '2017-06-25 14:19:31', '[\" \",\"74616487\",\"74616487,74616488\",\"74616494,74616493,74616492,74616488\",\"74616504,74616506,74616507,74616505\",\"74616507\",\"74616509,74616510,74616511,74616508\",\"74616514,74616516,74616515,74616513\",\"74616521,74616520,74616517,74616519,74616518\",\"74616532,74616531,74616527,74616529,74616530,74616526\",\"74616534,74616539,74616533,74616535,74616537,74616536,74616538\",\"74616544,74616545,74616548,74616546,74616547\",\"74616559,74616554,74616557,74616555,74616560,74616558,74616556\",\"74616562,74616561,74616512,74616563,74616565,74616564,74616566\",\"74616569,74616568,74616572,74616567,74616570,74616571\",\"74616579,74616578,74616580,74616581\",\"74616582,74616575,74616576,74616584,74616574,74616577,74616583,74616573\",\"74616586,74616587,74616585\",\"74616588\",\"74616592,74616595,74616602,74616594,74616598,74616599,74616597,74616604,74616608,74616601,74616607\",\"74616612,74616609,74616614,74616610,74616615,74616613,74616611\",\"74616616,74616617\",\"74616619,74616620\",\"74616621\",\"74616623\",\"74616626,74616625\",\"74616628,74616627\",\"74616630,74616629\",\"74616631\",\"74616632\",\"74616634,74616637,74616633,74616636,74616635\",\"74616638,74616639,74616641,74616642,74616640\",\"74616656\",\"74616656,74616658,74616657\",\"74616659,74616660,74616661\",\"74616666,74616664,74616667,74616665,74616662,74616663\",\"74616668,74616669\",\"74616677,74616678,74616675,74616676,74616681,74616682,74616679,74616680\",\"74616696,74616690,74616683,74616691,74616692,74616689,74616695,74616694,74616693,74616684\",\"74616698,74616707,74616708,74616705,74616701,74616699,74616704,74616706,74616702\"]', null, '778');
INSERT INTO `metabase_fieldvalues` VALUES ('389', '2017-06-22 10:51:21', '2017-06-25 14:19:31', '[0,2,5]', null, '779');
INSERT INTO `metabase_fieldvalues` VALUES ('390', '2017-06-22 10:51:21', '2017-06-25 14:19:31', '[\"00496560\",\"62414540\"]', null, '781');
INSERT INTO `metabase_fieldvalues` VALUES ('391', '2017-06-22 10:51:21', '2017-06-25 14:19:31', '[\"\",\"666\",\"www.chanskin.com/aijia/\",\"www.chanskin.com/bcyws/\",\"www.chanskin.com/egot_p/\",\"www.chanskin.com/flhs/\",\"www.chanskin.com/ftm/\",\"www.chanskin.com/jzb/\",\"www.chanskin.com/ltxy/\",\"www.chanskin.com/mcjr/\",\"www.chanskin.com/qhqc/\",\"www.chanskin.com/qhys\",\"www.chanskin.com/qhys/\",\"www.chanskin.com/quzhi/\",\"www.chanskin.com/sanhuacha\",\"www.chanskin.com/sqc/\",\"www.chanskin.com/tzy/\",\"www.chanskin.com/wzhy/\",\"www.chanskin.com/xbs/\",\"www.chanskin.com/xlqh/\",\"www.chanskin.com/yww/\",\"www.chanskin.com/zdy/\",\"www.chanskin.com/zdyjf/\"]', null, '782');
INSERT INTO `metabase_fieldvalues` VALUES ('392', '2017-06-22 10:51:21', '2017-06-25 14:19:31', '[\"11111\",\"aaaaaaaaa\",\"afasdf\",\"EGO-T电子烟（戒烟）\",\"fdsa\",\"JADO去黑头套装\",\"V立体仟颜组合（瘦脸）\",\"【聚财聚运】黑曜石本命佛\",\"三清茶（去口臭）\",\"三花茶\",\"丽润爱 液体避孕套\",\"五芷黑元茶（养发黑发）\",\"印度小叶紫檀佛珠\",\"发囊活素（防脱发）\",\"古法养肾茶\",\"台湾宝岛魔皂\",\"台湾神奇洁牙粉\",\"增高佳尔利片\",\"多宝珠手串\",\"好字通练字套装\",\"威力士玛卡咖啡【壮阳】\",\"微信支付测试商品\",\"思兰朵丰挺美\",\"撕拉式魔法唇彩\",\"支付宝支付测试\",\"智能三合一手机镜头\",\"桃之韵嫩红素（嫩红素）\",\"止鼾神器\",\"气垫bb霜\",\"波波小姐隐形浮力内衣\",\"泰国嫩红素\",\"活漾晶体能量液（鱼尾纹）\",\"清古清茶（清肺毒）\",\"清赘1+1（祛痣、除疣）\",\"熙贝诺水光针\",\"爱甲（去灰指甲）\",\"爱肤宜24K黄金眼霜\",\"男士劲能舒缓湿巾\",\"百草益胃砂（养胃）\",\"磁力瘦腿袜\",\"红朱砂情侣手链\",\"纤博士果蔬酵素营养餐（体重管理）\",\"罪爱佛洛蒙香水\",\"美唇净滑组合（去唇毛）\",\"自动卷发神器\",\"英国卫裤第七代VK\",\"薰衣草精油\",\"速瘦甩脂腰带\",\"郑多燕木瓜葛根粉\",\"郑多燕营养餐\",\"雪莲祛红养源组合（去红血丝）\",\"青核原色白斑遮盖液\",\"青核原色白斑遮盖液（白斑肤色不均）\",\"韩国双眼皮神器\",\"韩国大肚贴\",\"顶级沉香烟丝\",\"骨盆矫正美臀短裤\",\"魔茶贴贴瘦\",\"黄金丰胸膜贴\",\"黑豹延时喷剂\",\"鼎技堂酒渣鼻修复凝胶（酒渣鼻修复）\"]', null, '784');
INSERT INTO `metabase_fieldvalues` VALUES ('393', '2017-06-22 10:51:22', '2017-06-25 14:19:31', '[\"imageFolder/20150925/06896116_1.jpg\",\"imageFolder/20150925/06900756_1.jpg\",\"imageFolder/20150925/14840772_1.jpg\",\"imageFolder/20150925/17147076_1.jpg\",\"imageFolder/20150925/21809608_1.jpg\",\"imageFolder/20150925/25639055_1.jpg\",\"imageFolder/20150925/27634352_1.jpg\",\"imageFolder/20150925/30811218_1.jpg\",\"imageFolder/20150925/53712157_1.jpg\",\"imageFolder/20150925/58719423_1.jpg\",\"imageFolder/20150925/60695539_1.jpg\",\"imageFolder/20150925/62073339_1.jpg\",\"imageFolder/20150925/72555478_1.jpg\",\"imageFolder/20150925/73569868_1.jpg\",\"imageFolder/20150925/73586750_1.jpg\",\"imageFolder/20150925/84349917_1.jpg\",\"imageFolder/20150925/91931635_1.jpg\",\"imageFolder/20150925/92717498_1.jpg\",\"imageFolder/20150925/94138058_1.jpg\",\"imageFolder/20150926/98640952_1.jpg\",\"imageFolder/20151010/99540648_1.jpg\",\"imageFolder/20151124/34295137_1.jpg\",\"null\",\"wxb_site2/imageFolder/20151125/02239444_1.jpg\",\"wxb_site2/imageFolder/20151125/04116237_1.jpg\",\"wxb_site2/imageFolder/20151125/08472831_1.jpg\",\"wxb_site2/imageFolder/20151125/12658079_1.jpg\",\"wxb_site2/imageFolder/20151125/13351587_1.jpg\",\"wxb_site2/imageFolder/20151125/16520335_1.jpg\",\"wxb_site2/imageFolder/20151125/17962802_1.jpg\",\"wxb_site2/imageFolder/20151125/20178822_1.jpg\",\"wxb_site2/imageFolder/20151125/21769245_1.jpg\",\"wxb_site2/imageFolder/20151125/22127004_1.jpg\",\"wxb_site2/imageFolder/20151125/22938900_1.jpg\",\"wxb_site2/imageFolder/20151125/24424427_1.jpg\",\"wxb_site2/imageFolder/20151125/26946844_1.jpg\",\"wxb_site2/imageFolder/20151125/27211897_1.jpg\",\"wxb_site2/imageFolder/20151125/29109407_1.jpg\",\"wxb_site2/imageFolder/20151125/30632977_1.jpg\",\"wxb_site2/imageFolder/20151125/31073323_1.jpg\",\"wxb_site2/imageFolder/20151125/46912349_1.jpg\",\"wxb_site2/imageFolder/20151125/47950325_1.jpg\",\"wxb_site2/imageFolder/20151125/48310609_1.jpg\",\"wxb_site2/imageFolder/20151125/50274604_1.jpg\",\"wxb_site2/imageFolder/20151125/50506249_1.jpg\",\"wxb_site2/imageFolder/20151125/63793982_1.jpg\",\"wxb_site2/imageFolder/20151125/66096510_1.jpg\",\"wxb_site2/imageFolder/20151125/75161940_1.jpg\",\"wxb_site2/imageFolder/20151125/76969706_1.jpg\",\"wxb_site2/imageFolder/20151125/77197601_1.jpg\",\"wxb_site2/imageFolder/20151125/81252039_1.jpg\",\"wxb_site2/imageFolder/20151125/82812770_1.jpg\",\"wxb_site2/imageFolder/20151125/85688942_1.jpg\",\"wxb_site2/imageFolder/20151125/86805872_1.jpg\",\"wxb_site2/imageFolder/20151125/87029276_1.jpg\",\"wxb_site2/imageFolder/20151125/87457434_1.jpg\",\"wxb_site2/imageFolder/20151125/87674484_1.jpg\",\"wxb_site2/imageFolder/20151125/94689049_1.jpg\",\"wxb_site2/imageFolder/20151125/95011731_1.jpg\",\"wxb_site2/imageFolder/20151126/61059935_1.jpg\",\"wxb_site2/imageFolder/20160525/65371359_1.jpg\"]', null, '785');
INSERT INTO `metabase_fieldvalues` VALUES ('394', '2017-06-22 10:51:22', '2017-06-25 14:19:32', '[\"null\",\"wxb_site2/imageFolder/20160525/65371359_2.jpg\"]', null, '786');
INSERT INTO `metabase_fieldvalues` VALUES ('395', '2017-06-22 10:51:23', '2017-06-25 14:19:32', '[\"null\",\"wxb_site2/imageFolder/20160525/65371359_3.jpg\"]', null, '787');
INSERT INTO `metabase_fieldvalues` VALUES ('396', '2017-06-22 10:51:23', '2017-06-25 14:19:32', '[\"0\",\"22\",\"5\",\"8\",\"NULL\"]', null, '788');
INSERT INTO `metabase_fieldvalues` VALUES ('397', '2017-06-22 10:51:23', '2017-06-25 14:19:32', '[0]', null, '789');
INSERT INTO `metabase_fieldvalues` VALUES ('398', '2017-06-22 10:51:23', '2017-06-25 14:19:32', '[1,2,4,5,6,7,8,9,11,55,66,88,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,500]', null, '790');
INSERT INTO `metabase_fieldvalues` VALUES ('399', '2017-06-22 10:51:23', '2017-06-25 14:19:32', '[\"111\",\"2015爆单产品，推它您必聚财又聚运，赚到手抽筋！！！\",\"20天永绝皮肤疣！祛痣、除疣、消痦、平瘊！ 无刺激，不反复，不留疤\",\"4444444444\",\"6666\",\"88888\",\"ddd\",\"sdfasfsf\",\"V美塑颜，28天打造巴掌脸 植物活能 击退水肿 软化咬肌 分解脂肪\",\"“丰”姿卓越，“胸”涌澎湃 郑多燕木瓜葛根粉 高端安全定制傲人双峰\",\"《武媚娘传奇》的热播掀起丰胸热潮，贴力挺，实现A-G的飞跃。建议女粉多的推！\",\"【情人节文案已出】爆款新品上线，男女款都有！男女都需要异性的钦慕，用户心灵最深处的需求，无可抵挡！发就赚！\",\"专业修复酒渣鼻、酒糟鼻、红鼻子\",\"乳房的水果，丰挺的诱惑。7天乳房热涨、30天明显饱满、60天急速丰胸。\",\"产品正规，非常好发，男女通杀！\",\"以黑养黑，黑发所需营养元素，调整新陈代谢，促进毛发营养吸收，乌黑浓密的头发喝出来！\",\"健康产品，年末最好推！男粉最佳，戒不了就选择抽的健康一点，这简直是众多老烟民的内心呼唤啊！\",\"傣族养胃圣品，富含百草成分，缓解胃胀、胃痛、胃酸等胃部不适问题。\",\"全新产品上架，已测试， 春季最火爆款，女号放心派，多文案选择\",\"全新产品上架，已测试，出单火爆！！填补市场空白，早推早赚！！货源充足~\",\"全网包装最精美的印度\\\"帝王木\\\"小叶紫檀佛珠，高端大气，出单率高！\",\"关爱您和家人的健康！ 没有焦油，没有一氧化碳，没有二手烟！ 健康替烟 轻松控烟 辅助戒烟\",\"减肥秘籍，吃一顿比饿7天瘦得快！甩掉顽固肥肉 永不反弹\",\"出单很猛。男粉必杀，派单就赚，建议早上7-8点，中午13-14点，晚上20-21点，凌晨0点发（能量树升级版）\",\"出单超好，女粉万粉出单8单，已经测试，货源充足，大家拼命推，大部分用户会选择三支装\",\"医美霖白斑遮盖液，主要解决皮肤白斑，肤色不均等问题，产品利用自然界生物褐化反应，产生接近人体正常肤色的褐色物质，起到长效的遮盖作用。\",\"医美霖雪莲祛红养源 为你扫去“红”景，留下美丽的天！ 完美击退红血丝2大根源 专业褪红 双重修复最有效\",\"发就赚！有多少粉就发多少粉！抓紧时间赚快钱！80%以上是订购518元以上的套餐，不用犹豫！随便发吧！建议发送时段：7-8点，13-14点，16点，20-21点，23点，0点\",\"发的萨芬\",\"台湾正品货源，文案超级好发！\",\"品牌、产品高大上，转化很高！女粉可以疯狂推！！\",\"地方撒斯蒂芬 \",\"增高产品网购爆款，全网唯一！成人男女士青少年增高产品正品，让你长高3-8CM\",\"女性必备单品，2015年赚钱文案，可以大量发！\",\"女粉通杀，产品质量有保障！已测试，女粉出单很好，佣金高，不伤粉，推出去就是赚！！\",\"新品爆款，绝对走量，发就赚！不用犹豫！\",\"春分肾气微，宜助肾补肝。喝茶补肾，夜夜威猛，十男九虚，男粉刚需。\",\"最新爆款！男女粉都可以发！\",\"最科学健康的体重管理产品，采用控制热量摄入，加速脂肪消耗，科学健康减肥瘦身。\",\"有效清除因吸入雾霾中有害微粒，和吸烟造成的血液内烟毒，以及长期因雾霾、烟毒、以及粉尘污染侵蚀而积累在肺内的老肺毒。\",\"桃花活性肽，瞬间激活细胞活性，瓦解唇部、私处黑色素、28天重现少女粉嫩！\",\"止鼾神器！给自己一个生命保障，给TA一份安静。\",\"正品产品，效果好，真的不影响粉丝，走单很猛，派单就赚,货量充足，有多少粉就发多少粉！\",\"正品台货，女粉完全无抵抗，出单量每天都爆仓，对粉丝完全无影响！发到赚到！\",\"清火、清肠、清口气！清新口气，由内而外。 效果、口感俱佳的茶饮配方。\",\"湖南卫视《我是大美人》节目倾力推荐产品！价格有优势！正品台货，男女通杀，需求大，签收率非常高！非常好发！发到就赚到！\",\"激活发根细胞，生发从根治起！ 破解脱发奥秘，还原生发真相！\",\"特含六胜肽+EGF修复因子，修复肌肤储水性能，补充肌肤胶原蛋白，重塑肌肤结构，逆转肌龄！\",\"男士需求量大，适合男号！\",\"精美包装，出单高，拒收低，男女粉均可推广，货源充足，大家拼命推~\",\"经过测试，出单率很惊人！走单很猛，平均每万粉出单率3-9单，建议男粉多的推！早推早赚！有授权，已拿到资质！\",\"经过测试，火爆产品，全年龄段出单刚需产品上线。转化高，分成高！\",\"美国品牌丽润爱，史上最强防艾液体避孕套，男女粉通杀，百分百正品，官网价格，早推早赚\",\"联合方案3大法宝 攻克灰指甲修复难题。治愈灰指甲更快、更强\",\"脱唇毛，变靓女，和小胡子说拜拜！女人就要唇净无瑕\",\"腰有多细，爱有多深，每个女人对自己的腰都舍得下血本，推吧，火爆新款，发到赚到！\",\"走单很猛，派单就赚，周六晚上出单很猛，建议今晚22点-23点推送，有多少粉就发多少粉！！\",\"重新优化了文案，直击用户心坎，出单率提高了一大截！货量充足，我们平台独家有备货！放心发，放心赚！\",\"高科技新产品，不伤粉，出单很好。货源充足，放心推！\"]', null, '791');
INSERT INTO `metabase_fieldvalues` VALUES ('400', '2017-06-22 10:51:24', '2017-06-25 14:19:32', '[0]', null, '792');
INSERT INTO `metabase_fieldvalues` VALUES ('401', '2017-06-22 10:51:24', '2017-06-25 14:19:32', '[0,1,2,5,6,7,8,9,56,15673]', null, '794');
INSERT INTO `metabase_fieldvalues` VALUES ('402', '2017-06-22 10:51:24', '2017-06-25 14:19:32', '[\"\",\"0.01|0.01|0.01|\",\"0.1|\",\"100|160|320|40|\",\"12|24|36|\",\"12|36|\",\"13|13|13|13|39|39|39|39|\",\"15.98|47.94|111.86|\",\"15|45|75|\",\"16|16|48|48|\",\"18|45|81|117|\",\"18|54|\",\"18|54|108|\",\"19.8|19.8|19.8|19.8|59.4|59.4|59.4|59.4|\",\"19|\",\"20|60|100|20|60|100|20|60|100|\",\"21|63|105|\",\"22|22|66|66|\",\"22|40|80|\",\"24|48|72|96|\",\"24|54|96|\",\"24|72|168|\",\"25|25|25|25|25|25|25|25|50|\",\"25|25|25|75|125|75|125|75|125|\",\"25|50|75|100|\",\"25|67|100|\",\"26|26|52|\",\"30|\",\"30|30|30|\",\"30|45|75|120|\",\"32|96|160|\",\"33|99|\",\"35|84|126|\",\"36|108|180|\",\"36|73|108|144|180|\",\"42|84|126|\",\"44|\",\"46|92|138|\",\"48|96|144|192|\",\"4|\",\"50|100|150|\",\"52|104|234|\",\"6.5|7.8|8.19|22.49|\",\"64|128|192|\",\"64|128|192|256|\",\"64|128|256|\",\"64|144|224|\",\"65|195|\",\"6|\",\"7.5|7.5|22.5|22.5|22.5|22.5|\",\"70|140|210|280|\",\"7|21|35|\",\"8.5|25.5|51|\",\"8|\",\"8|24|48|\",\"8|24|56|\",\"90|180|300|480|\"]', null, '795');
INSERT INTO `metabase_fieldvalues` VALUES ('403', '2017-06-22 10:51:25', '2017-06-25 14:19:32', '[\"0.01|0.01|0.01|\",\"0.1|\",\"100.00|\",\"100.00|100.00|100.00|100.00|200.00|200.00|200.00|200.00|\",\"100.00|100.00|100.00|200.00|300.00|200.00|300.00|200.00|300.00|\",\"100.00|100.00|200.00|200.00|\",\"100.00|200.00|\",\"100.00|200.00|300.00|\",\"100.00|200.00|300.00|400.00|\",\"100.00|200.00|400.00|\",\"110.00|110.00|210.00|210.00|\",\"120.00|\",\"120.00|200.00|300.00|\",\"120.00|222.00|\",\"120.00|222.00|350.00|\",\"120.00|240.00|360.00|\",\"130.00|260.00|400.00|\",\"140|250|350|450|\",\"145|290|420|540|\",\"150.00|260.00|400.00|\",\"150|150|150|150|150|150|150|150|300|\",\"150|240|490|\",\"150|250|350|\",\"150|270|400|490|550|\",\"150|290|420|\",\"159|318|\",\"160.00|260.00|360.00|\",\"162|204|330|\",\"170|340|490|640|\",\"170|350|530|\",\"180.00|400.00|680.00|\",\"180|330|430|530|\",\"180|340|480|\",\"180|350|500|\",\"190|380|550|700|\",\"190|380|590|790|\",\"200.00|200.00|260.00|\",\"200|\",\"200|390|560|\",\"200|400|600|\",\"280|380|520|720|\",\"350|500|850|200|\",\"38|38|76|76|76|76|\",\"44|\",\"4|\",\"50.00|100.00|150.00|\",\"6|\",\"80.00|90.00|110.00|300.00|\",\"80|160|240|80|160|240|80|160|240|\",\"8|\",\"90.00|180.00|270.00|\",\"90.00|90.00|90.00|90.00|160.00|160.00|160.00|160.00|\"]', null, '796');
INSERT INTO `metabase_fieldvalues` VALUES ('404', '2017-06-22 10:51:25', '2017-06-25 14:19:32', '[\"0.01|0.02|0.03|\",\"0.1|\",\"128.00|256.00|384.00|\",\"128|128|256|256|256|256|\",\"168.00|168.00|168.00|168.00|336.00|336.00|336.00|336.00|\",\"198.00|\",\"198.00|198.00|198.00|198.00|396.00|396.00|396.00|396.00|\",\"198.00|198.00|396.00|396.00|\",\"198.00|228.00|288.00|698.00|\",\"198.00|396.00|\",\"198.00|396.00|594.00|\",\"198.00|396.00|594.00|792.00|\",\"198.00|396.00|792.00|\",\"198|396|594|198|396|594|198|396|594|\",\"218.00|218.00|218.00|436.00|654.00|436.00|654.00|436.00|654.00\\t|\",\"268.00|536.00|1288.00|\",\"268|498|698|898|\",\"296|579|849|1080|\",\"298.00|\",\"298.00|498.00|698.00|\",\"298.00|518.00|793.00|\",\"298.00|546.00|794.00|\",\"298.00|596.00|\",\"298.00|596.00|894.00|\",\"298|298|298|298|298|298|298|298|596|\",\"298|498|698|\",\"298|550|798|980|1098|\",\"298|568|828|\",\"336|504|998|\",\"348|680|980|1280|\",\"354|708|1062|\",\"358|658|858|1058|\",\"358|680|960|\",\"368|698|998|\",\"380.00|780.00|1380.00|\",\"388|488|788|\",\"398.00|398.00|498.00|\",\"398|\",\"398|768|1098|1398|\",\"398|768|1180|1580|\",\"398|780|1120|\",\"398|796|\",\"398|798|1197|\",\"44|\",\"4|\",\"560|760|1040|1440|\",\"698|998|1698|396|\",\"6|\",\"8|\"]', null, '797');
INSERT INTO `metabase_fieldvalues` VALUES ('405', '2017-06-22 10:51:25', '2017-06-25 14:19:33', '[\"15mm*15颗|18mm*13颗|20mm*12颗|全家福套餐（15mm/18mm/20mm各一串）|\",\"1|\",\"1套体验价|买2套送1套|\",\"1瓶198元|2瓶送1瓶396元|4瓶送2瓶792元|\",\"1盒198元|2盒送1盒396元|3盒送2盒594元|\",\"444|\",\"4|\",\"6|\",\"70B一副|80B一副|70C一副|70B买2送1|70B买3送2|80B买2送1|80B买3送2|70C买2送1|70C买3送2|\",\"8MM长串108颗|15MM单串15颗|20MM单串12颗|\",\"8|\",\"EGO-T电子烟体验一支装带3瓶烟油|EGO-T电子烟豪华双支装带5瓶烟油|EGO-T电子烟至尊双支装带20瓶烟油|\",\"L码一条|XL码一条|XXL码一条|XXXL码一条|L码2送1（超值备用装）|XL码2送1（超值备用装）|XXL码2送1（超值备用装）|XXXL码2送1（超值备用装）|\",\"S码一条|M码一条|L码一条|XL码一条|S码2送1（超值备用装）|L码2送1（超值备用装）|XL码2送1（超值备用装）|M码2送1（超值备用装）|\",\"一支|买二支送一支|\",\"一条|买二送一|\",\"一瓶|买2瓶送1瓶|\",\"一疗程8盒|二个疗程16盒送2盒|三个疗程24盒送4盒|\",\"一盒|买2盒送1盒|买3盒送2盒|\",\"一盒|买二送一|买四送三|\",\"一盒|气垫BB霜买2送1|气垫BB霜买4送3|\",\"三清茶清新口气效果装（6盒）|三清茶清新口气巩固装（12盒）|三清茶清新口气养生装（18盒）|\",\"丰挺美丰胸1盒体验装|丰挺美熟女2盒丰满装|丰挺美强效3盒丰挺装|丰挺美完美4盒全效装|\",\"买1瓶， 198元，1个疗程/7天|买2瓶，送1瓶 396元，2个疗程/15天|买4瓶， 送2瓶 792元，3个疗程/30天|\",\"买20贴只要298元！|买40贴送5贴，518元！|买70贴送10贴，793元！|\",\"买2支|买4支送1支|买6支送3支|买8支送5支|\",\"五芷黑元茶6盒（30天量）送2盒|五芷黑元茶12盒（60天量）送4盒|五芷黑元茶18盒（90天量）送6盒|五芷黑元茶24盒（120天量）送8盒|\",\"享瘦10-15斤轻度肥胖套装|享瘦15-20斤中度肥胖套装|享瘦20-40斤重度肥胖套装|享瘦5-10斤纤体体验套装|\",\"体验装128元1盒|洁白装买2送1，共3盒256元！|亮白装买3送2，5盒384元！|\",\"体验装1瓶|优惠装买2送1抢购价596|买3送2原价1377抢购价894|\",\"体验装|\",\"体验装买1盒只要198元！|买2盒送1盒，396元！|买3盒送2盒，594元！|\",\"单只装（玫瑰粉）|三只装（玫瑰粉）|五只装（玫瑰粉）|单只装（性感红）|三只装（性感红）|五只装（性感红）|单只装（甜蜜橘）|三只装（甜蜜橘）|五只装（甜蜜橘）|\",\"发根活の素轻度脱发修复装（1瓶）|发根活の素防脱生发修复装（3瓶）|发根活の素防脱生发加强装（5瓶）|\",\"商品套餐1|1|1|\",\"好字通1套|\",\"好字通1套|好字通2套减50|好字通买3套减100|\",\"恭请属「鼠」守护神千手观音|恭请属「牛」「虎」守护神虚空藏菩萨|恭请属「兔」守护神文殊菩萨|恭请属「龙」「蛇」守护神普贤菩萨|恭请属「马」守护神大势至菩萨|恭请属「羊」「猴」守护神大日如来菩萨|恭请属「鸡」守护神不动明王菩萨|恭请属「狗」「猪」守护神阿弥陀佛菩萨|[恭请两位守护神]|\",\"手链女款（1条）|手链男款（1条）|手链情侣装（2条立减88 ）|\",\"捷度去黑头三件套|\",\"桃之韵嫩红素美白初试装（3支）|桃之韵嫩红素粉嫩基础装（6支）|桃之韵嫩红素诱惑熟女装（9支）|桃之韵嫩红素完美女人装（12支）|\",\"活漾晶体快速祛纹装(2瓶)|活漾晶体快速祛纹装(3瓶)|活漾晶体强效修复装(4瓶送1瓶)|活漾晶体完美脱变装(6瓶送2瓶)|\",\"清肺排毒体验装一周期5盒|清肺排毒强效装买10盒送2盒|清肺排毒巩固装买15盒送3盒|\",\"清赘轻度体验装1盒|清赘重度修复装2盒|清赘重度巩固装3盒|\",\"火辣诱人小蛮腰：298/1疗程（4盒）|重塑迷人S曲线：498/2疗程(8盒）|魔鬼身材不反弹：698/3疗程(16盒装）|\",\"炫酷黄|炫酷银|买2个（炫酷黄）送1个（炫酷银）共3个|2个（炫酷银）送1个（炫酷黄）共3个|买2个送1个（炫酷黄）共3个|买2个送1个（炫酷银）共3个|\",\"爱甲体验装1盒|爱甲调理装2盒|爱甲巩固装3盒|爱甲完美装4盒|\",\"男士咖啡尝鲜体验装|男士咖啡买2送1|男士咖啡买5送2|\",\"男士用一瓶装|女士用一瓶装|男士用买二送一|女士用买二送一|\",\"百草益渭砂体验装6盒送2盒|百草益渭砂调理装12盒送4盒|百草益渭砂巩固装18盒送6盒|\",\"的司法斯蒂芬|\",\"立体纤颜组合瘦脸体验组合1套装|立体纤颜组合巩固瘦脸组合2套装|立体纤颜组合长效瘦脸组合3套装|\",\"粉色M码1条|粉色L码1条|粉色M码2送1（换洗装）|粉色L码2送1（换洗装）|\",\"美唇净滑组合快速去唇毛1套|美唇净滑组合持久去唇毛2套|美唇净滑组合完美绝毛装3套|\",\"美国丽润爱1盒|美国丽润2盒送2支|美国丽润爱3盒送1盒|\",\"超值体验装1盒，可长高2-3厘米|疗程装3盒，可长高3-6厘米|完美锐变装6盒（两疗程），可长高5-8厘米|\",\"郑多燕晚餐显瘦体验装（2盒）|郑多燕晚餐纤体效果装（4盒）|郑多燕晚餐闪电强化装（6盒）|郑多燕晚餐抗反弹巩固装（8盒）|\",\"郑多燕木瓜葛根粉丰挺塑形装（3盒）|郑多燕木瓜葛根粉淑女丰满装（6盒）|郑多燕木瓜葛根粉强效丰挺装（10盒）|郑多燕木瓜葛根粉完美丰挺装（16盒）|\",\"酒渣鼻修复凝胶修复装2盒|酒渣鼻修复凝胶康复装3盒送1盒|酒渣鼻修复凝胶巩固装6盒送3盒|\",\"雪莲祛红养源组合速效退红装1盒|雪莲祛红养源组合强效修复装2盒|雪莲祛红养源组合根源退红装3盒|\",\"青核原色白斑遮盖液1盒体验装|青核原色白斑遮盖液2盒完美遮白斑装|青核原色白斑遮盖液3盒遮白养白装|青核原色白斑遮盖液4盒遮白养白加强装|青核原色白斑遮盖液5盒遮白养白稳固装|\"]', null, '798');
INSERT INTO `metabase_fieldvalues` VALUES ('406', '2017-06-22 10:51:26', '2017-06-25 14:19:33', '[0]', null, '799');
INSERT INTO `metabase_fieldvalues` VALUES ('407', '2017-06-22 10:51:26', '2017-06-25 14:19:33', '[\"\",\"74616491, 74616489\",\"74616711\",\"74616712\",\"74616714\",\"74616715\",\"74616717\",\"74616719\",\"74616720\",\"74616721\",\"74616722\",\"74616723\",\"74616724\",\"74616725\",\"74616726\",\"74616728\",\"74616729\",\"74616730\",\"74616731\",\"74616732\",\"74616733\",\"74616734\",\"74616735\",\"74616736\",\"74616737\",\"74616738\",\"74616739\",\"74616740\",\"74616741\",\"74616742\",\"74616743\",\"74616745\",\"74616753\"]', null, '800');
INSERT INTO `metabase_fieldvalues` VALUES ('408', '2017-06-22 10:51:26', '2017-06-25 14:19:33', '[1,2]', null, '801');
INSERT INTO `metabase_fieldvalues` VALUES ('409', '2017-06-22 10:51:27', '2017-06-25 14:19:33', '[\"\",\"1\",\"1, 2\",\"1, 2, 4\",\"1, 3\",\"1, 3, 4\",\"1, 4, 5\",\"1, 5\",\"2\",\"2, 4\",\"3\",\"3, 4\",\"5\"]', null, '802');
INSERT INTO `metabase_fieldvalues` VALUES ('410', '2017-06-22 10:51:28', '2017-06-25 14:19:33', '[0,1]', null, '803');
INSERT INTO `metabase_fieldvalues` VALUES ('411', '2017-06-22 10:51:28', '2017-06-25 14:19:33', '[\"01\",\"02\",\"03\",\"05\",\"06\",\"07\"]', null, '805');
INSERT INTO `metabase_fieldvalues` VALUES ('412', '2017-06-22 10:51:29', '2017-06-25 14:19:33', '[\"\"]', null, '806');
INSERT INTO `metabase_fieldvalues` VALUES ('414', '2017-06-22 10:51:33', '2017-06-25 14:19:34', '[\"\",\"/kindeditor/attached/image/20151204/20151204103036_514.gif\",\"9\"]', null, '810');
INSERT INTO `metabase_fieldvalues` VALUES ('415', '2017-06-22 10:51:34', '2017-06-25 14:19:34', '[\"...\",\"0\",\"2015年最新百搭情侣款，欧美范儿高街必备潮墨镜，闪亮问世，你准备好了么\",\"24K黄金眼霜 T部去黑眼圈去细纹去眼袋\",\"33\",\"3D数据建模瘦脸高颜值面罩\",\"45岁房产老板差点梦中丧命，妻子一夜惊魂！\",\"4个月长高8CM,让身高不再遗憾!赶快收藏吧!\",\"6666\",\"76%的女性对自己的性伴侣不满意?\",\"7分钟,获得TA的好感!得到TA的垂青!\",\"7天扫除痘印疤痕妊娠纹 100%纯天然祛痘除疤神器 正品货到付款\",\"888\",\"9\",\"99%男人不知道!女人是因为这个才爱上你!!\",\"99%男人不知道!女人红杏出墙的真正原因\",\"asdfasdfasdf\",\"asdfdasf\",\"CCTV报道： 打呼噜严重的， 夜间可能出现猝死！\",\"ffffffffffff\",\"GB男士劲能舒缓湿巾\",\"“丽润爱”液体避孕套\",\"“波波小姐”让你的胸不再尴尬,想要多大就有多大\",\"“貌美牙为先,齿白七分俏”,教你快速美白牙齿小妙招!\",\"★黄牙?黑牙?口气?恶心死……鬼才亲你呢?\",\"♨♨♨你从未见过的佛珠！！！！增长见识，值得珍藏！\",\"♨♨♨见过这样的佛珠吗？增长见识，值得珍藏！新年钜献！\",\"♨❤你想瘦几斤？25斤够不够！96%的胖子都会看这篇文章！\",\"❤绝对第一次见，太爽了！\",\"《奇闻》东方卫视报道：打鼾会饿死脑细胞！\",\"【✿】千颂伊同款 赫拉气垫BB霜 明星专宠\",\"【口述】产后，私处松弛了，老公搬到了客房睡。\",\"【口述】粗腰大肚子毁掉我的婚姻\",\"【多功能水光针】无法忽视肌肤变白变嫩的魔力!\",\"【天天联盟精品推荐】佛珠中的极品，印度\\\"帝王木\\\"小叶紫檀佛珠，货到付款，全国包邮！\",\"【奇闻】女子当众扒光小三 只因老公嫌弃私处松\",\"【婚姻】那儿“松”了三年 我差点离婚......\",\"【小知识】解决黄牙和口气的妙招！\",\"【年末巨惠】戒烟神器 100%仿真烟口味  使用7天戒烟无效全额退款\",\"【开启\\\"G\\\"奶诱惑】30天，从A-G的飞跃，你的内衣又变小了！你若波涛汹涌，他便激情四射！\",\"【揭秘】75%的女人假装高潮！\",\"【真相】女人私处变老,男人易出轨?\",\"【胖妞】魔茶贴贴瘦到货啦!分享我一个月减到97斤的减肥秘籍 !!\",\"【超实用】感觉脸没洗干净?是你没用对东西!\",\"【韩国DK双眼皮定型美目霜】微信朋友圈，微博粉丝资源主9张推广图文\",\"㊙99%男人不知道！女人红杏出墙的真正原因！\",\"㊙男人口袋必备！方便隐秘，关键时刻让你“行”！\",\"㊙老公一晚11次，让我尖叫不止，隔壁闺蜜都受不了......\",\"㊣ 古法养肾茶:不喝酒,男人如何壮阳?答案就在这里!\",\"一个只对朋友分享的故事\",\"一个月搞掉大肚子的秘诀,男女通杀!!!\",\"一块香皂竟有如此神奇的功能,看完后,我惊呆了!!!\",\"一夜七次郎,古法养肾茶\",\"七天扫除脸上的痘印疤痕!\",\"三观尽毁！天使的面孔,大象的腿!\",\"不一样的卷发，不一样的自信\",\"不做男人一手掌握的女人!!\",\"不做疤美人,7天扫除痘印疤痕妊娠纹！\",\"不想让别人睡你的老婆 打你的娃 就早点戒烟吧!!!\",\"不脱妆的撕拉式唇彩让你激情永不褪色\",\"世界上生殖器最大男子找不到女友, 可怜呀 ...\",\"为什么大牌明星们都好这口??\",\"为什么抽烟要用沉香烟丝？最健康的抽烟方式，既然戒不了，至少抽的健康点！\",\"为什么现在沉香这么流行?沉香救命!!!烟民必看\",\"为啥美国人的牙齿比脸面还重要？\",\"今天你微笑了吗?\",\"今年最火去黑头神器！告诉你去黑头，不用反反复复！\",\"从小改变自己,让优秀变成一种习惯\",\"从此不再是神话!娱乐圈只用不说的秘密...\",\"从笔迹看性格——字如其人，超准！\",\"任性！喝茶也可以提高性·福感!\",\"佛洛蒙香水,让TA一见钟情\",\"佛珠中的极品,印度＂帝王木＂小叶紫檀佛珠,李连杰、杨幂、成龙同款!\",\"你性福吗？揭开女人臀部的秘密，完美翘臀睡出来！\",\"你若波涛汹涌,他便激情四射!\",\"你还在为选理发店而烦恼吗？\",\"佩戴佛像一生聚财聚运，快来看一看您命中的守护神吧！\",\"保持性感身材——PR90果贝纤火龙果酵素，张馨予力荐！\",\"全世界最火爆的瘦肚子方法,包管用!\",\"全效美白牙贴\",\"全智贤同款撕拉式魔法唇彩风靡韩国\",\"全球第一“裸肤面霜”,教你一分钟轻松搞定妆容!!\",\"冬天穿这个,性感!\",\"冬日小S巧瘦腿 不穿秋裤赶走问题身材~~不怕冷不担心胖的冬天...\",\"别再拿着自拍杆傲娇了！据说这个镜头，连你家的老爷机都能华丽变身单反，酷毙了！\",\"十四岁开始腋下出现阵阵轻微的臭味\",\"千万别再戴金链子,看看土豪们的新标配!\",\"印度\\\"帝王木\\\"小叶紫檀佛珠\",\"印度小叶紫檀男女经典款手链,送礼佳品,货到付款\",\"口述:老公夜里把我当小三示爱\",\"古法养肾茶\",\"台湾正品红朱砂情侣手链在线抢购，货到付款\",\"台湾洁克神奇洁牙粉\",\"台湾神奇魔皂\",\"台湾神奇魔皂,一块搞定痘痘,黑头,粉刺......统统拿下\",\"台湾神奇魔皂，一块搞定痘痘，黑头，粉刺，美白淡斑。男女老少通用 原装正品包邮\",\"台湾魔力远红外溶脂瘦腿袜\",\"同样的年龄，为什么你看起来比她老？\",\"告别鸡皮肤,还你光滑靓丽美腿,羡煞各种闺蜜\",\"哪些名贵木材可以用来制作佛珠\",\"国米i6超八核5.5寸智能手机\",\"在女人眼中，你到底行不行？\",\"培养女神气质-------从这里开始！\",\"复古蚂蚁眼镜\",\"外貌协会:长相影响收入的七种表现\",\"多功能水光针\",\"夜间睡眠专用塑身整体骨盆矫正美臀短裤\",\"大波深沟你也可以！隐形文胸，让你的胸想多大有多大~\",\"太可怕.一个大肚子,对健康的巨大影响!!\",\"女人,就是要风情万种!!\",\"女人一生命运的转折点-【千颂伊】同款裸妆防晒第一神器!!\",\"女人必须拥有一套撕拉式魔法唇彩,我已经爱上它了!\",\"女人的美丽翘臀，三条骨盆矫正裤就搞定\",\"女人都在偷偷给老公买的神奇内裤！\",\"女的必看,一分钟见效神器!!!\",\"好字通练字套装\",\"好男人,爱她,就要满足她!!!\",\"如何治疗狐臭最有效？\",\"如何让暗恋已久的“ta”对你情不自禁？\",\"嫌我胸小,老公竟然找小三…\",\"学女神完美妆容 放倒一切男人\",\"完美翘臀睡出来,爱美的女生一定要看!\",\"小S坐月子的方法,难怪她身材那么好\",\"小三都有培训班了,你还没有危机感吗?\",\"小世界大精彩，玩转大世界\",\"小绝招告别鸡皮肤！还你干净美腿~\",\"小编教你如何告别腿上的鸡皮肤\",\"就怕土豪有文化，看看现在腕儿们都在戴什么\",\"年前不减肥，年后徒伤悲，抖一抖，甩一甩，三十斤肥肉就拜拜！\",\"张爱玲：男人通往女人灵魂的路是阴··道！\",\"征服女人,有很多种方式,而这是你最享受的!\",\"快速还原你的少女本色,勾起老公的心跳回忆!\",\"悄悄话| 电影《女人不坏》中的丑女周迅是如何打败美女张雨绮的？\",\"情人节你还是一个人过吗？脱单神器！女神让你啪啪啪；男神为你买买买！\",\"惊!比容颜衰老更可怕的是女人私处的衰老!\",\"惊!私处不保养 美女惨变黄脸婆\",\"惊呆~秃头男人彻底征服百名女人\",\"惊爆!国家发明专利,让你过了25岁依然能长高!\",\"惊爆！比Iphone7更先进，绝对震撼人心！全球最伟大的创造！\",\"惊！1个月告别水桶腰，居然是靠这个！\",\"想臀部更翘？看完这个你就知道了······\",\"想要成为万人迷吗？佛洛蒙香水，100回头率，让TA一见钟情！佛洛蒙香水男女必备的香水神器！\",\"懒人专用急救面霜\",\"懒人专用急救面霜,出门约会不怕迟到!上班不用早起化妆!\",\"成都猛女闹市区强推过路男至今逍遥法外\",\"我们常常说打呼噜是睡得香，事实真是如此吗\",\"戒烟神器 100%仿.真烟口味 热销欧美二代电子烟 全.国.货.到.付.款!!!\",\"戴佛珠才是土豪? 小叶紫檀佛珠,杨幂、成龙同款!\",\"才高八斗抵不过身高7尺!!身高决定命运!!\",\"抽烟的最高境界,达不到的就把烟戒了吧!!!\",\"拿什么拯救你,我们的汉字?天天敲键盘,你该练练字了!\",\"捷度去黑头三件套\",\"揭秘:是什么让他50岁时却拥有20岁男人的雄风\",\"撕拉式魔法唇彩\",\"教你一分钟,搞定痘痘,黑头,粉刺!别再相信美容院了\",\"教你一招,让你的胸想多大有多大~\",\"日本黑豹延时喷剂\",\"明星引领时尚潮流——印度“帝王木”小叶紫檀\",\"明星御用美白防晒BB霜,你值得拥有!\",\"春.心荡漾:揭秘史上最完美的男.欢女.爱,情侣床.戏花样多!\",\"是什么可以让一个男人一夜可以服侍多位女人!\",\"是什么可以让一个男人强大信心百倍!\",\"是什么可以让一个男人征服多位女人??\",\"最热门的自动卷发器，《女人我最大》力荐，5分钟打造卷发女王，百变造型show出来！！！\",\"未成年勿进,揭秘史上最完美的男欢女爱,情侣床戏花样多!\",\"朱砂情侣手链，货到付款哟\",\"来自宝岛台湾的神器魔皂!!\",\"武媚娘热播后,老公竟拒绝与我同房.....\",\"每当接吻,看到我的牙时,她就没了性欲...\",\"波波小姐隐形浮力内衣\",\"泰国樱花嫩红素，泰国原装正品、全国货到付款！\",\"测试编辑器文案\",\"深度揭晓PR90果贝纤火龙酵素的神奇效果\",\"湖南卫视《我是大美人》倾情推荐，正品台货，七天美白牙齿！\",\"火车上的艳.遇,我们竟然..内附视频\",\"爆料：富人圈子那些不为人知的秘密！\",\"爱肤宜黄金丰胸膜贴\",\"爽死了,你懂得!不止男人需要,女人也需要!\",\"牙齿变白了，口气也清新了，男友抱我亲不停！\",\"牙齿真的会影响一个人形象！不信？请看这~~~\",\"甩脂腰带\",\"男人,穿错内裤的严重后果~~~~~\",\"男人为什么会嫌弃女人！说的太现实了！\",\"男人为什么喜欢前凸后翘的女人\",\"男人厌倦女人身体的全过程，简直惊呆了！\",\"男人女人的最爱,你别不承认!!不信你看...\",\"男人床上不行,老婆等于判.刑!\",\"男人必看,神奇的内裤,你懂的……\",\"男人有福了，美国发明液体避·孕·套,从此不再穿雨衣······\",\"男人穿错内裤的后果,笑不出声来了!\",\"男人，别只吃伟哥，吃这个才能让你的肾更厉害\",\"男士咖啡，激情冲撞，让爱持久，风靡夜场的高端功能饮品。\",\"男女相爱,男人真正能够完全彻底征服女人的是xing！\",\"男戴观音女戴佛？错了！ta才是你一生的守护佛！\",\"百分之八十的女生在床上都这样痛过!!!\",\"看脸的世界令人绝望? 高颜值就是这么任性!\",\"研究发现：翘臀的女人更xing福！！!\",\"祛痘精油\",\"私处粉嫩神物，只需1瓶，终身管用，泰国原装正品、全国货到付款！\",\"私处紧致水润,老公无法自拔!女性必看!\",\"穿丝袜打底裤,何不穿一双能溶脂瘦身的魔力瘦腿袜?\",\"第三代波波小姐【隐形浮力内衣】,让你的胸想多大有多大~\",\"第四代智能三合一手机镜头\",\"简单一招，黑木耳变粉木耳！\",\"粗腰大肚子,一招就轻松搞掂！\",\"红朱砂情侣手链\",\"练字神器 | 老家的熊孩子变成了“王羲之”，21天练就一手好字，比我还好看！！\",\"终于知道为何90%的明星都戴这副墨镜！戴上后，才对得起爸妈.....\",\"经验贴 抓住男人的心,你还在一哭二闹三上吊?\",\"给眼部24小时360度的全面呵护\",\"给老公最有品味的爱：沉香烟丝，让抽烟变得健康起来！\",\"给自己换条瘦腿袜吧!女人美不美,男人先看腿!\",\"美丽的牙齿——您的魅力名片\",\"美国男人不戴套,新玩法亮瞎狗眼!\",\"美国男人不戴套，干爽中国妞，新玩法亮瞎狗眼！\",\"老公一晚.八次都不够,床都受不了了...内附视频!\",\"老公找小三的原因竟然是……\",\"老公越来越坚挺，让我更滋润！\",\"老爸，为了这个家，你不能再抽烟了！【感恩父母最好的方式】\",\"能量树玛卡咖啡\",\"腰围原来可以这么简单的瘦下来,太实用了先收藏\",\"良好的沟通避免家长的一个决定,影响孩子一辈子。\",\"艾老师一碗泄油瘦身汤，绿色健康减肥，月瘦15斤!\",\"艾老师一碗瘦身汤，安全有效不反弹的减肥法！\",\"艾老师一碗瘦身汤，瘦身女王，卫视主推\",\"英国卫裤第七代 | 男人，你内裤穿对了吗？你考虑过”它“的感受吗？\",\"英国卫裤第七代 | 男人，你内裤穿对了吗？？？你考虑过”它“的感受吗？\",\"英国第七代卫裤,捍卫男人的尊严！\",\"蕾珂美Renkomay懒人霜专用急救面霜！\",\"蕾珂美多功能懒人急救面霜，一瓶搞掂一切脸部肌肤问题！\",\"装逼神器--沉香烟丝悄然流行于上流社会！\",\"裤带越长,寿命越短,腰围决定了你生命的质量!\",\"讨厌的黑头总是在这个季节往外冒,真的特别恶心\",\"让“瘦身”在夜晚偷偷进行吧~(2015最受追捧的瘦身产品）\",\"谁说身高不是距离,长的矮也是有痛点(转疯了~~)\",\"调查显示:九成离婚的罪魁祸首居然是“快枪手”\",\"赫拉气垫bb霜\",\"软咖啡,成就硬男人,激情冲撞,让爱持久!\",\"辣妈瘦到90斤，前夫甩闺蜜求复合！！！\",\"过年吃多了吧，长膘了吧，一根甩脂腰带就能把他们甩光光哦！\",\"还在丰胸那么麻烦？【隐形内衣】让你的胸想多大有多大~\",\"这个冬天你还在穿秋裤?太OUT了!赶快脱掉吧!!\",\"这么神奇?就这样没了........\",\"这是个看脸的世界!7个表现告诉你长得好看的人收入更高\",\"这绝对火,有沟必火你知道吧!?\",\"送健康、增感情、保平安,印度小叶紫檀佛珠风靡明星大咖！\",\"避邪化煞、祛病镇宅、旺财运、旺事业、旺桃花,……\",\"那一夜,情人脱了我的内裤后……\",\"防火防盗防小三! 看穿小三的致命秘密\",\"阴道松驰,女人心上的一把刀!\",\"阿斯顿发送到反复\",\"陈冠希搞✴定的五十个女星都自愿拍照原来是因为...\",\"韩国DK双眼皮定型美目霜\",\"韩国MYMI大肚贴\",\"韩国正品 赫拉气垫BB霜 明星专宠 货到付款！\",\"顶级沉香烟丝\",\"风靡全亚洲的瘦腰神贴，引无数妹纸尽瘦腰，想怎么瘦就怎么瘦，躺着也掉肉！\",\"风靡全球的最新时尚美牙方式\",\"风靡韩国——睡觉也能减肥的魔茶贴贴瘦\",\"骨盆矫正裤，让女人翘起来！\",\"高科技时代，减肥，只需一根甩脂腰带！\",\"高颜值| 小心撞脸angelababy，黄晓明看后泪奔\",\"魔力净味水 一秒去狐臭异味 一个疗程永久根除 保密配送 全国货到付款\",\"魔力远红外溶脂瘦腿袜!一穿立瘦!越穿越瘦!\",\"魔茶贴贴瘦\",\"鸡皮肤怎么消除？轻松搞定鸡皮肤，28天还你光滑肌肤！\",\"黄牙？黑牙？口气？……这里有最有效的美牙方案\",\"黑曜石本命佛\"]', null, '811');
INSERT INTO `metabase_fieldvalues` VALUES ('416', '2017-06-22 10:51:34', '2017-06-25 14:19:34', '[\"62414540\",\"93946803\"]', null, '812');
INSERT INTO `metabase_fieldvalues` VALUES ('417', '2017-06-22 10:51:34', '2017-06-25 14:19:34', '[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,55,66,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,999,8888]', null, '813');
INSERT INTO `metabase_fieldvalues` VALUES ('418', '2017-06-22 10:51:35', '2017-06-25 14:19:34', '[0,1,2]', null, '814');
INSERT INTO `metabase_fieldvalues` VALUES ('419', '2017-06-22 10:51:37', '2017-06-25 14:19:35', '[\"00846265\",\"05920140\",\"06896116\",\"06900756\",\"14840772\",\"15556136\",\"17147076\",\"21809608\",\"23527424\",\"23807148\",\"25639055\",\"25815460\",\"27634352\",\"29057565\",\"30506601\",\"30811218\",\"53712157\",\"58719423\",\"60695539\",\"62073339\",\"63444719\",\"65371359\",\"68497872\",\"70321428\",\"71596015\",\"72555478\",\"73569868\",\"73586750\",\"82721893\",\"84349917\",\"90756400\",\"91931635\",\"92717498\",\"94138058\",\"97378526\",\"98640952\",\"99540648\"]', null, '815');
INSERT INTO `metabase_fieldvalues` VALUES ('420', '2017-06-22 10:51:37', '2017-06-25 14:19:35', '[0,1,2,3,4]', null, '816');
INSERT INTO `metabase_fieldvalues` VALUES ('421', '2017-06-22 10:51:37', '2017-06-25 14:19:35', '[\"0.01\",\"0.1\",\"1\",\"2\",\"4\",\"5\",\"6\",\"7\",\"8\"]', null, '817');
INSERT INTO `metabase_fieldvalues` VALUES ('422', '2017-06-22 10:51:38', '2017-06-25 14:19:35', '[\"0.01\",\"0.1\",\"100\",\"104\",\"108\",\"12\",\"120\",\"126\",\"128\",\"138\",\"140\",\"144\",\"160\",\"180\",\"192\",\"2\",\"210\",\"22\",\"234\",\"24\",\"25\",\"256\",\"280\",\"30\",\"300\",\"32\",\"320\",\"35\",\"36\",\"4\",\"40\",\"42\",\"45\",\"46\",\"48\",\"480\",\"5\",\"50\",\"52\",\"6\",\"64\",\"7\",\"70\",\"72\",\"73\",\"75\",\"8\",\"80\",\"84\",\"90\",\"92\",\"96\"]', null, '818');
INSERT INTO `metabase_fieldvalues` VALUES ('423', '2017-06-22 10:51:38', '2017-06-25 14:19:35', '[\"1\",\"2\",\"4\",\"5\",\"6\",\"7\",\"8\",\"EGO-T电子烟体验一支装带3瓶烟油\",\"EGO-T电子烟至尊双支装带20瓶烟油\",\"EGO-T电子烟豪华双支装带5瓶烟油\",\"三清茶清新口气养生装（18盒）\",\"三清茶清新口气巩固装（12盒）\",\"三清茶清新口气效果装（6盒）\",\"丰挺美丰胸1盒体验装\",\"丰挺美完美4盒全效装\",\"丰挺美强效3盒丰挺装\",\"丰挺美熟女2盒丰满装\",\"五芷黑元茶12盒（60天量）送4盒\",\"五芷黑元茶18盒（90天量）送6盒\",\"五芷黑元茶24盒（120天量）送8盒\",\"五芷黑元茶6盒（30天量）送2盒\",\"享瘦10-15斤轻度肥胖套装\",\"享瘦15-20斤中度肥胖套装\",\"享瘦20-40斤重度肥胖套装\",\"享瘦5-10斤纤体体验套装\",\"发根活の素轻度脱发修复装（1瓶）\",\"发根活の素防脱生发修复装（3瓶）\",\"发根活の素防脱生发加强装（5瓶）\",\"商品套餐1\",\"桃之韵嫩红素完美女人装（12支）\",\"桃之韵嫩红素粉嫩基础装（6支）\",\"桃之韵嫩红素美白初试装（3支）\",\"桃之韵嫩红素诱惑熟女装（9支）\",\"活漾晶体完美脱变装(6瓶送2瓶)\",\"活漾晶体强效修复装(4瓶送1瓶)\",\"活漾晶体快速祛纹装(2瓶)\",\"活漾晶体快速祛纹装(3瓶)\",\"清肺排毒体验装一周期5盒\",\"清肺排毒巩固装买15盒送3盒\",\"清肺排毒强效装买10盒送2盒\",\"清赘轻度体验装1盒\",\"清赘重度修复装2盒\",\"清赘重度巩固装3盒\",\"爱甲体验装1盒\",\"爱甲完美装4盒\",\"爱甲巩固装3盒\",\"爱甲调理装2盒\",\"百草益渭砂体验装6盒送2盒\",\"百草益渭砂巩固装18盒送6盒\",\"百草益渭砂调理装12盒送4盒\",\"的司法斯蒂芬\",\"立体纤颜组合巩固瘦脸组合2套装\",\"立体纤颜组合瘦脸体验组合1套装\",\"立体纤颜组合长效瘦脸组合3套装\",\"美唇净滑组合完美绝毛装3套\",\"美唇净滑组合快速去唇毛1套\",\"美唇净滑组合持久去唇毛2套\",\"郑多燕晚餐抗反弹巩固装（8盒）\",\"郑多燕晚餐显瘦体验装（2盒）\",\"郑多燕晚餐纤体效果装（4盒）\",\"郑多燕晚餐闪电强化装（6盒）\",\"郑多燕木瓜葛根粉丰挺塑形装（3盒）\",\"郑多燕木瓜葛根粉完美丰挺装（16盒）\",\"郑多燕木瓜葛根粉强效丰挺装（10盒）\",\"郑多燕木瓜葛根粉淑女丰满装（6盒）\",\"酒渣鼻修复凝胶修复装2盒\",\"酒渣鼻修复凝胶巩固装6盒送3盒\",\"酒渣鼻修复凝胶康复装3盒送1盒\",\"雪莲祛红养源组合强效修复装2盒\",\"雪莲祛红养源组合根源退红装3盒\",\"雪莲祛红养源组合速效退红装1盒\",\"青核原色白斑遮盖液1盒体验装\",\"青核原色白斑遮盖液2盒完美遮白斑装\",\"青核原色白斑遮盖液3盒遮白养白装\",\"青核原色白斑遮盖液4盒遮白养白加强装\",\"青核原色白斑遮盖液5盒遮白养白稳固装\"]', null, '820');
INSERT INTO `metabase_fieldvalues` VALUES ('424', '2017-06-22 10:51:39', '2017-06-25 14:19:35', '[\"0.01\",\"0.1\",\"140\",\"145\",\"150\",\"170\",\"180\",\"190\",\"2\",\"200\",\"240\",\"250\",\"270\",\"280\",\"290\",\"330\",\"340\",\"350\",\"380\",\"390\",\"4\",\"400\",\"420\",\"430\",\"450\",\"480\",\"490\",\"5\",\"500\",\"520\",\"530\",\"540\",\"550\",\"560\",\"590\",\"6\",\"600\",\"640\",\"7\",\"700\",\"720\",\"790\",\"8\",\"850\"]', null, '821');
INSERT INTO `metabase_fieldvalues` VALUES ('425', '2017-06-22 10:51:39', '2017-06-25 14:19:35', '[\"0.01\",\"0.02\",\"0.03\",\"0.1\",\"1040\",\"1058\",\"1062\",\"1080\",\"1098\",\"1120\",\"1180\",\"1197\",\"1280\",\"1398\",\"1440\",\"1580\",\"1698\",\"2\",\"268\",\"296\",\"298\",\"336\",\"348\",\"354\",\"358\",\"368\",\"396\",\"398\",\"4\",\"498\",\"5\",\"504\",\"550\",\"560\",\"568\",\"579\",\"6\",\"658\",\"680\",\"698\",\"7\",\"708\",\"760\",\"768\",\"780\",\"798\",\"8\",\"828\",\"849\",\"858\",\"898\",\"960\",\"980\",\"998\"]', null, '822');
INSERT INTO `metabase_fieldvalues` VALUES ('426', '2017-06-22 10:51:41', '2017-06-25 14:19:35', '[\"\"]', null, '823');
INSERT INTO `metabase_fieldvalues` VALUES ('427', '2017-06-22 10:51:41', '2017-06-25 14:19:36', '[1,2,3,4,5,10]', null, '824');
INSERT INTO `metabase_fieldvalues` VALUES ('428', '2017-06-22 10:51:41', '2017-06-25 14:19:36', '[\"\"]', null, '825');
INSERT INTO `metabase_fieldvalues` VALUES ('429', '2017-06-22 10:51:42', '2017-06-25 14:19:36', '[\"保健品\",\"减肥产品\",\"床上用品\",\"护肤品\",\"生活用品\",\"饰品\"]', null, '827');
INSERT INTO `metabase_fieldvalues` VALUES ('430', '2017-06-22 10:51:42', '2017-06-25 14:19:36', '[\"\"]', null, '828');
INSERT INTO `metabase_fieldvalues` VALUES ('431', '2017-06-22 10:51:43', '2017-06-25 14:19:36', '[0,1]', null, '829');
INSERT INTO `metabase_fieldvalues` VALUES ('432', '2017-06-22 10:51:44', '2017-06-25 14:19:36', '[0,1,2]', null, '830');
INSERT INTO `metabase_fieldvalues` VALUES ('433', '2017-06-22 10:51:44', '2017-06-25 14:19:36', '[\"112.96.100.95\",\"113.99.45.138\",\"116.22.16.119\",\"119.129.209.154\",\"119.35.253.51\",\"121.33.175.160\",\"121.33.175.18\",\"121.33.175.185\",\"127.0.0.1\",\"192.168.0.104\",\"192.168.0.106\",\"192.168.0.108\",\"192.168.1.106\",\"192.168.31.245\",\"192.168.31.49\",\"192.168.31.61\",\"192.168.4.132\",\"223.73.60.249\",\"59.41.50.4\"]', null, '832');
INSERT INTO `metabase_fieldvalues` VALUES ('434', '2017-06-22 10:51:44', '2017-06-25 14:19:36', '[\"00496560\",\"01662769\",\"04187198\",\"06778441\",\"07355530\",\"08877520\",\"09276852\",\"11664040\",\"13084914\",\"16805144\",\"20168352\",\"22295890\",\"23569849\",\"23946449\",\"28486868\",\"29943294\",\"30690950\",\"30999876\",\"35338561\",\"42331933\",\"47222076\",\"49586903\",\"51230085\",\"52335272\",\"53736728\",\"53991358\",\"57180163\",\"64016422\",\"64204083\",\"65267581\",\"66286007\",\"68948619\",\"71504603\",\"71688553\",\"73129799\",\"76821697\",\"81645531\",\"81944840\",\"84309255\",\"91534332\",\"92355120\",\"92476576\",\"94506620\",\"97488510\",\"99214697\",\"99338236\",\"99633853\",\"99896464\"]', null, '834');
INSERT INTO `metabase_fieldvalues` VALUES ('435', '2017-06-22 10:51:46', '2017-06-25 14:19:37', '[\"000000\",\"admind\",\"admindd\",\"adsfasddfa\",\"adsfasdfafda\",\"afdsafasdf\",\"eeeeee\",\"ffffff\",\"gggggg\",\"jack1111\",\"jack444\",\"jack5200011\",\"jack520003\",\"jack520006\",\"jack520007\",\"jack520008\",\"jack520009\",\"jack5555\",\"jack654321\",\"jack6666\",\"jack7777\",\"jack888\",\"jack999\",\"lucy520\",\"scc\",\"tom22\",\"tomson65\",\"tttttt\",\"yiy0729\",\"yyyyyy\"]', null, '835');
INSERT INTO `metabase_fieldvalues` VALUES ('436', '2017-06-22 10:51:47', '2017-06-25 14:19:37', '[0,1]', null, '836');
INSERT INTO `metabase_fieldvalues` VALUES ('437', '2017-06-22 10:51:47', '2017-06-25 14:19:37', '[\"1055586866@qq.com\",\"1055587866@qq.com\",\"1055587966@qq.com\",\"10@q.com\",\"594364820@qq.com\",\"594364827@qq.com\",\"723462346qqcom\",\"7867577@qq.com\",\"834534853@qq.com\",\"834734853@qq.com\",\"83475345@qq.com\",\"84587453@qq.com\",\"86848534@qq.com\",\"87564332@qq.com\",\"88858454@qq.com\",\"88884574@qq.com\",\"943985495@qq.com\",\"948456456@qq.com\",\"94848453@qq.com\",\"9845645@qq.com\",\"a@f.com\",\"a@q.com\",\"a@qe.com\",\"aa@f.com\",\"aad@e.com\",\"aada@qq.com\",\"ae@e.com\",\"inter520008@163.com\",\"sa@qq.com\"]', null, '837');
INSERT INTO `metabase_fieldvalues` VALUES ('438', '2017-06-22 10:51:48', '2017-06-25 14:19:37', '[\"0ob1\",\"37h1\",\"4y2m\",\"75a9\",\"78yw\",\"959z\",\"9g05\",\"9z3r\",\"al18\",\"fm8h\",\"gryj\",\"i70j\",\"isv5\",\"k1nc\",\"k2zu\",\"ks10\",\"n32d\",\"pthq\",\"pthq|6keu\",\"pthq|cdfl\",\"pthq|g2s8\",\"pthq|g2s8|a5iz\",\"pthq|n3nu\",\"pthq|wptk\",\"qyja\",\"t6mr\",\"u9k0\",\"v2pn\",\"vtrx\",\"yqa3\"]', null, '838');
INSERT INTO `metabase_fieldvalues` VALUES ('439', '2017-06-22 10:51:48', '2017-06-25 14:19:38', '[\"06778441\",\"08877520\",\"09398564\",\"12904567\",\"14213277\",\"17607397\",\"20116389\",\"20168352\",\"22167172\",\"26605538\",\"30144179\",\"35332667\",\"40156159\",\"43871998\",\"47460120\",\"52541030\",\"60789455\",\"64326444\",\"65267581\",\"65627722\",\"68173610\",\"69603421\",\"70141022\",\"76783550\",\"78843728\",\"83694608\",\"84309255\",\"89349664\",\"94506620\",\"99633853\"]', null, '839');
INSERT INTO `metabase_fieldvalues` VALUES ('440', '2017-06-22 10:51:48', '2017-06-25 14:19:38', '[\"\",\"廖总\",\"李明\",\"王桂平\"]', null, '841');
INSERT INTO `metabase_fieldvalues` VALUES ('441', '2017-06-22 10:51:49', '2017-06-25 14:19:38', '[\"9ifJj1RKeSc=\",\"auhoepvxIEQ=\",\"jqumw5LRV7o=\",\"MoKM2eflo/Y=\",\"qw78k1bh9LM=\",\"RaFutWeh0ww=\",\"v2TqeJZ9Q7s=\",\"Vjri+/tNa7s=\",\"xCh5+oFgAb4=\",\"Z8B2X8X71V8=\"]', null, '842');
INSERT INTO `metabase_fieldvalues` VALUES ('442', '2017-06-22 10:51:49', '2017-06-25 14:19:38', '[\"\",\"13787047372\",\"13787047375\",\"13787160029\"]', null, '843');
INSERT INTO `metabase_fieldvalues` VALUES ('443', '2017-06-22 10:51:50', '2017-06-25 14:19:38', '[\"13060823518\",\"13430987654\",\"13432323232\",\"13433212213\",\"13433322222\",\"13433322227\",\"13465656565\",\"13465988761\",\"13565437658\",\"13576546543\",\"13676548345\",\"13787032435\",\"13787047309\",\"13787047354\",\"13787047370\",\"13787047371\",\"13787047372\",\"13787047374\",\"13787047375\",\"13787047376\",\"13787047387\",\"13787047398\",\"13787057574\",\"13787067542\",\"13787098765\",\"13966666666\",\"13966666667\",\"13966666767\",\"15844563215\"]', null, '844');
INSERT INTO `metabase_fieldvalues` VALUES ('444', '2017-06-22 10:51:51', '2017-06-25 14:19:38', '[\"1055586866\",\"1111133309\",\"1123322122\",\"12122222\",\"1233333333\",\"1233333337\",\"26461314\",\"4545454545\",\"46464645\",\"46464646\",\"4646464646\",\"594364820\",\"594364826\",\"594364827\",\"594364829\",\"7867577\",\"834534853\",\"8347347242\",\"834734853\",\"83475345\",\"84587453\",\"86848534\",\"87564332\",\"88858454\",\"88884574\",\"943985495\",\"948456456\",\"94848453\",\"9845645\"]', null, '845');
INSERT INTO `metabase_fieldvalues` VALUES ('445', '2017-06-22 10:51:51', '2017-06-25 14:19:38', '[\"\",\"g2s8\",\"pthq\"]', null, '846');
INSERT INTO `metabase_fieldvalues` VALUES ('446', '2017-06-22 10:51:52', '2017-06-25 14:19:38', '[0,1]', null, '849');
INSERT INTO `metabase_fieldvalues` VALUES ('447', '2017-06-22 10:51:53', '2017-06-25 14:19:38', '[\"0ob1\",\"37h1\",\"4y2m\",\"6keu\",\"75a9\",\"78yw\",\"959z\",\"9g05\",\"9z3r\",\"a5iz\",\"al18\",\"cdfl\",\"fm8h\",\"g2s8\",\"gryj\",\"i70j\",\"isv5\",\"k1nc\",\"k2zu\",\"ks10\",\"n32d\",\"n3nu\",\"pthq\",\"qyja\",\"t6mr\",\"u9k0\",\"v2pn\",\"vtrx\",\"wptk\",\"yqa3\"]', null, '850');
INSERT INTO `metabase_fieldvalues` VALUES ('448', '2017-06-22 10:51:54', '2017-06-25 14:19:42', '[0]', null, '851');
INSERT INTO `metabase_fieldvalues` VALUES ('450', '2017-06-22 10:51:56', '2017-06-25 14:19:42', '[\"0\"]', null, '855');
INSERT INTO `metabase_fieldvalues` VALUES ('451', '2017-06-22 10:51:57', '2017-06-25 14:19:42', '[\"5月大礼包来了。肾六，十国游应有尽有.也可折现哦.\",\"关于发货和返款时间\",\"关于春节放假期间返款的相关说明!\",\"如何在我们平台如何赚钱。\"]', null, '856');
INSERT INTO `metabase_fieldvalues` VALUES ('452', '2017-06-22 10:51:59', '2017-06-25 14:19:42', '[1,2,3,4]', null, '857');
INSERT INTO `metabase_fieldvalues` VALUES ('453', '2017-06-22 10:51:59', '2017-06-25 14:19:42', '[\"1\"]', null, '858');
INSERT INTO `metabase_fieldvalues` VALUES ('454', '2017-06-22 10:52:02', '2017-06-25 14:19:42', '[\"111\",\"adfadf\",\"adfasdf\",\"adfasdfasdfadf\",\"adfsa\",\"adsfasdf\",\"asdf\",\"asdfadf\",\"asdfasd\",\"asdfasdf\",\"asdfasdfasdfa\",\"asdfasdfasdfasdf\",\"asdfasdfasdfasdfasfasdfasdf\",\"asdfasdfasdfasfasadsf\",\"asdfasdfasdfasfasasdfasd\",\"asdfsad\",\"asfasdfa\",\"asfdasdf\",\"dfasdfasdfasdfasdfasdf\",\"dfsfsdfsf\",\"fasdasd\",\"FASDFADSF\",\"ffffff额呵呵\",\"fgsdfgdfsg\",\"hehehehehe\",\"sadfasdfasdf\",\"sdafasd\",\"sdfasdf\",\"会或多或少\",\"发生大声道\",\"司法发\",\"大丰收的\",\"大事发生地方\",\"撒大大\",\"是的发送到\",\"测试\",\"湖南长沙\",\"阿斯顿发\",\"阿斯顿发斯蒂芬\"]', null, '859');
INSERT INTO `metabase_fieldvalues` VALUES ('455', '2017-06-22 10:52:03', '2017-06-25 14:19:42', '[\"东城区\",\"乌鲁木齐县\",\"南川市\",\"古冶区\",\"和平区\",\"墨竹工卡县\",\"奉贤区\",\"宝坻区\",\"宽甸满族自治县\",\"岳麓区\",\"崇州市\",\"市辖区\",\"开福区\",\"彭水苗族土家族自治县\",\"榆中县\",\"武昌区\",\"永川市\",\"海南区\",\"清镇市\",\"湟源县\",\"矿区\",\"科尔沁左翼后旗\",\"襄垣县\",\"西乡塘区\",\"路北区\",\"鄂城区\",\"钟楼区\",\"长沙县\",\"静海县\",\"鲤城区\",\"黄浦区\"]', null, '862');
INSERT INTO `metabase_fieldvalues` VALUES ('456', '2017-06-22 10:52:03', '2017-06-25 14:19:42', '[1]', null, '863');
INSERT INTO `metabase_fieldvalues` VALUES ('457', '2017-06-22 10:52:04', '2017-06-25 14:19:43', '[\"aaa\",\"aaaa\",\"AAAAAAAAA\",\"adfadfa\",\"adfads\",\"adfasd\",\"adfasdf\",\"adsfasd\",\"adsfasdf\",\"adsfsafa\",\"asdf\",\"asdfadf\",\"asdfasd\",\"asdfasdf\",\"asdfasdfd\",\"asdfasdfd1\",\"asdfasf\",\"asdfsadf\",\"asdfsaf\",\"asdfsf\",\"asfdasdf\",\"cvbxcvbxc\",\"dfgdfsg\",\"dsfasdf\",\"eeeeeeeeeeeeeeeeeeee\",\"FFFFFFFFFFFFF\",\"jackie\",\"vzxcv\",\"V字形从\",\"啊啊啊啊\",\"大事发生地方\",\"大事发生的\",\"张三\",\"打死打发\",\"李四\",\"测试\",\"老四\",\"老李\",\"老王\",\"阿双方丹丹\",\"阿斯顿发斯蒂芬\",\"阿斯顿发送到\",\"阿的说法\"]', null, '864');
INSERT INTO `metabase_fieldvalues` VALUES ('458', '2017-06-22 10:52:05', '2017-06-25 14:19:43', '[\"13060823518\",\"13411111111\",\"13422222222\",\"13430251119\",\"13430252115\",\"13430252119\",\"13430253115\",\"13433333333\",\"13455555555\",\"13466666666\",\"13787047370\",\"13787160029\",\"15815897652\",\"15877777777\",\"15888888888\",\"15888888899\",\"15899999999\"]', null, '865');
INSERT INTO `metabase_fieldvalues` VALUES ('459', '2017-06-22 10:52:05', '2017-06-25 14:19:43', '[\"\",\"111\",\"adfad\",\"adfadf\",\"adfaf\",\"adfasdf\",\"ADFASDFA\",\"adsfasdf\",\"adsfasdfasd\",\"adsfasf\",\"afdasdf\",\"asdf\",\"asdf f\",\"asdfasdf\",\"asdfasdfa\",\"asdfasdfasdf\",\"asdfasfds\",\"asdfsa\",\"asdfsd\",\"asdfsdf\",\"asfda\",\"asfdasd\",\"asfdasdfasdf\",\"fasdfasdf\",\"fasdfasdfasfasdfasdfasdf\",\"henhao\",\"sdfgsdfgg\",\"wwwww\",\"上的说法是电风扇\",\"大号\",\"是打发斯蒂芬\",\"测试\",\"测试测试\",\"短发\",\"阿斯顿发\",\"阿斯顿发斯蒂芬\",\"阿斯顿发生\",\"阿的说法\"]', null, '866');
INSERT INTO `metabase_fieldvalues` VALUES ('460', '2017-06-22 10:52:06', '2017-06-25 14:19:43', '[\"\",\"21\"]', null, '867');
INSERT INTO `metabase_fieldvalues` VALUES ('461', '2017-06-22 10:52:06', '2017-06-25 14:19:43', '[\"丹东市\",\"乌海市\",\"乌鲁木齐市\",\"兰州市\",\"南宁市\",\"县\",\"唐山市\",\"市\",\"市辖区\",\"常州市\",\"成都市\",\"拉萨市\",\"昆明市\",\"武汉市\",\"泉州市\",\"西宁市\",\"贵阳市\",\"通辽市\",\"鄂州市\",\"长沙市\",\"长治市\",\"阳泉市\"]', null, '869');
INSERT INTO `metabase_fieldvalues` VALUES ('462', '2017-06-22 10:52:06', '2017-06-25 14:19:43', '[\"73528293231\",\"73528293232\",\"73528293233\",\"880350384879600241\",\"938382348232\"]', null, '870');
INSERT INTO `metabase_fieldvalues` VALUES ('463', '2017-06-22 10:52:07', '2017-06-25 14:19:43', '[\"01133499\",\"06896116\",\"14840772\",\"18562244\",\"25329136\",\"30811218\",\"53712157\"]', null, '871');
INSERT INTO `metabase_fieldvalues` VALUES ('464', '2017-06-22 10:52:07', '2017-06-25 14:19:43', '[\"28486868\",\"84769616\"]', null, '873');
INSERT INTO `metabase_fieldvalues` VALUES ('465', '2017-06-22 10:52:08', '2017-06-25 14:19:43', '[\"01749944\",\"03037559\",\"04651301\",\"08713298\",\"08966437\",\"0d823l41\",\"10617315\",\"11216024\",\"16583367\",\"17898579\",\"19069375\",\"19694113\",\"20380826\",\"20873012\",\"21163113\",\"23284384\",\"25075110\",\"26223133\",\"26270410\",\"30128183\",\"32606909\",\"34139406\",\"34708118\",\"36854632\",\"37811862\",\"38122810\",\"38277832\",\"38615859\",\"39218651\",\"39450164\",\"43373035\",\"44827493\",\"47679439\",\"49124347\",\"50793675\",\"51310699\",\"52122917\",\"54298982\",\"55067347\",\"56281594\",\"58145564\",\"59129176\",\"59630735\",\"59924999\",\"5xn9041a\",\"61606615\",\"62042226\",\"63557441\",\"64929778\",\"69372653\",\"71003416\",\"72129586\",\"76748719\",\"77200754\",\"79937785\",\"7l8rmm0w\",\"80326596\",\"83150078\",\"84635929\",\"85034178\",\"88794465\",\"92513653\",\"92765537\",\"99518867\",\"fas85vtm\",\"glpq2xbt\",\"k22436ks\",\"l523oxfp\",\"p13tpsfd\",\"rv4zt6vx\",\"t636g8g8\",\"tqc5uigz\",\"vmq4whbp\"]', null, '874');
INSERT INTO `metabase_fieldvalues` VALUES ('466', '2017-06-22 10:52:08', '2017-06-25 14:19:43', '[\"0:0:0:0:0:0:0:1\"]', null, '875');
INSERT INTO `metabase_fieldvalues` VALUES ('467', '2017-06-22 10:52:09', '2017-06-25 14:19:43', '[\"发货\",\"发货了\",\"用户已经签收\",\"用户签收\",\"短信审核订单\",\"签收\"]', null, '876');
INSERT INTO `metabase_fieldvalues` VALUES ('468', '2017-06-22 10:52:09', '2017-06-25 14:19:43', '[0,1,2]', null, '878');
INSERT INTO `metabase_fieldvalues` VALUES ('469', '2017-06-22 10:52:10', '2017-06-25 14:19:43', '[1,2,10]', null, '879');
INSERT INTO `metabase_fieldvalues` VALUES ('470', '2017-06-22 10:52:10', '2017-06-25 14:19:43', '[\"上海\",\"云南\",\"内蒙古\",\"北京\",\"四川\",\"天津\",\"山西省\",\"广西壮族自治区\",\"新疆维吾尔自治区\",\"江苏省\",\"河北省\",\"湖北\",\"湖南\",\"甘肃\",\"福建省\",\"西藏自治区\",\"贵州\",\"辽宁省\",\"重庆\",\"青海\"]', null, '880');
INSERT INTO `metabase_fieldvalues` VALUES ('471', '2017-06-22 10:52:11', '2017-06-25 14:19:44', '[\"shunfeng\",\"yuantong\",\"zhongtong\"]', null, '881');
INSERT INTO `metabase_fieldvalues` VALUES ('472', '2017-06-22 10:52:11', '2017-06-25 14:19:44', '[\"02671335\",\"02924355\",\"08661885\",\"10529881\",\"20288057\",\"26836731\",\"27361512\",\"27744330\",\"48067822\",\"66079628\",\"80424728\",\"84996863\",\"88965219\",\"93114724\",\"94914610\"]', null, '882');
INSERT INTO `metabase_fieldvalues` VALUES ('473', '2017-06-22 10:52:12', '2017-06-25 14:19:44', '[1,2,4,7]', null, '883');
INSERT INTO `metabase_fieldvalues` VALUES ('474', '2017-06-22 10:52:13', '2017-06-25 14:19:44', '[\"06778441\",\"08877520\",\"20168352\",\"35841532\",\"65267581\",\"69603421\",\"99633853\"]', null, '885');
INSERT INTO `metabase_fieldvalues` VALUES ('475', '2017-06-22 10:52:14', '2017-06-25 14:19:44', '[\"0d823l41\",\"59129176\",\"59630735\"]', null, '889');
INSERT INTO `metabase_fieldvalues` VALUES ('476', '2017-06-22 10:52:14', '2017-06-25 14:19:44', '[198.0,396.0]', null, '890');
INSERT INTO `metabase_fieldvalues` VALUES ('477', '2017-06-22 10:52:15', '2017-06-25 14:19:44', '[100.0,200.0]', null, '891');
INSERT INTO `metabase_fieldvalues` VALUES ('478', '2017-06-22 10:52:15', '2017-06-25 14:19:44', '[\"2015-05-31 21:20:22结算分成返款金额【100.0】\",\"2015-05-31 21:33:25结算分成返款金额【200.0】\",\"2015-09-20 22:47:58结算分成返款金额【100.0】\"]', null, '892');
INSERT INTO `metabase_fieldvalues` VALUES ('479', '2017-06-22 10:52:16', '2017-06-25 14:19:44', '[3]', null, '893');
INSERT INTO `metabase_fieldvalues` VALUES ('480', '2017-06-22 10:52:17', '2017-06-25 14:19:45', '[\"代客下单\",\"客户成功下单\",\"已发货、待签收 (发货)\",\"已发货、待签收 (发货了)\",\"已发货、待签收 (发货了中通)\",\"已发货、待签收 (发货圆通 880350384879600241)\",\"已取消\",\"已审核、待发货\",\"已审核、待发货 (可以发货了)\",\"已审核、待发货 (审核有效 发货吧)\",\"已审核、待发货 (审核有效可以发货)\",\"已审核、待发货 (有效)\",\"已支付、已结清\",\"已签收、待结算 (用户已经签收)\",\"已签收、待结算 (用户签收)\",\"已签收、待结算 (签收)\",\"已结算返款、待支付\",\"正常下单\"]', null, '896');
INSERT INTO `metabase_fieldvalues` VALUES ('481', '2017-06-22 10:52:18', '2017-06-25 14:19:45', '[\"01749944\",\"04651301\",\"08713298\",\"08966437\",\"0d823l41\",\"110\",\"11216024\",\"114\",\"16583367\",\"17898579\",\"19069375\",\"19694113\",\"20380826\",\"23284384\",\"26270410\",\"34139406\",\"34708118\",\"36854632\",\"37811862\",\"38122810\",\"44827493\",\"47679439\",\"51310699\",\"54298982\",\"55067347\",\"59129176\",\"59630735\",\"5xn9041a\",\"61606615\",\"62042226\",\"63557441\",\"64929778\",\"72129586\",\"76748719\",\"79937785\",\"7l8rmm0w\",\"80326596\",\"83150078\",\"84635929\",\"88794465\",\"92513653\",\"92765537\",\"99518867\",\"fas85vtm\",\"glpq2xbt\",\"k22436ks\",\"l523oxfp\",\"p13tpsfd\",\"rv4zt6vx\",\"t636g8g8\",\"tqc5uigz\",\"vmq4whbp\"]', null, '897');
INSERT INTO `metabase_fieldvalues` VALUES ('482', '2017-06-22 10:52:20', '2017-06-25 14:19:45', '[\"王桂平\"]', null, '898');
INSERT INTO `metabase_fieldvalues` VALUES ('483', '2017-06-22 10:52:20', '2017-06-25 14:19:45', '[\"201502349231823111\"]', null, '899');
INSERT INTO `metabase_fieldvalues` VALUES ('484', '2017-06-22 10:52:21', '2017-06-25 14:19:45', '[\"张三\"]', null, '902');
INSERT INTO `metabase_fieldvalues` VALUES ('485', '2017-06-22 10:52:21', '2017-06-25 14:19:46', '[\"13787047375\"]', null, '903');
INSERT INTO `metabase_fieldvalues` VALUES ('486', '2017-06-22 10:52:22', '2017-06-25 14:19:46', '[119.0]', null, '905');
INSERT INTO `metabase_fieldvalues` VALUES ('487', '2017-06-22 10:52:22', '2017-06-25 14:19:46', '[\"支付\"]', null, '907');
INSERT INTO `metabase_fieldvalues` VALUES ('488', '2017-06-22 10:52:23', '2017-06-25 14:19:46', '[\"81,79,78\"]', null, '908');
INSERT INTO `metabase_fieldvalues` VALUES ('489', '2017-06-22 10:52:25', '2017-06-25 14:19:46', '[\"0d823l41\",\"59129176\",\"59630735\"]', null, '910');
INSERT INTO `metabase_fieldvalues` VALUES ('490', '2017-06-22 10:52:25', '2017-06-25 14:19:46', '[198.0,396.0]', null, '911');
INSERT INTO `metabase_fieldvalues` VALUES ('491', '2017-06-22 10:52:26', '2017-06-25 14:19:46', '[\"2015-05-31 21:20:22结算客服分成返款金额【5.0】\",\"2015-05-31 21:33:25结算客服分成返款金额【6.0】\",\"2015-09-20 22:47:58结算客服分成返款金额【5.0】\"]', null, '912');
INSERT INTO `metabase_fieldvalues` VALUES ('492', '2017-06-22 10:52:27', '2017-06-25 14:19:47', '[5.0,6.0]', null, '914');
INSERT INTO `metabase_fieldvalues` VALUES ('493', '2017-06-22 10:52:27', '2017-06-25 14:19:47', '[1]', null, '915');
INSERT INTO `metabase_fieldvalues` VALUES ('494', '2017-06-22 10:52:31', '2017-06-25 14:19:48', '[\"12412786\",\"41330140\",\"71261747\"]', null, '940');
INSERT INTO `metabase_fieldvalues` VALUES ('495', '2017-06-22 10:52:32', '2017-06-25 14:19:48', '[0.0,100.0,200.0]', null, '941');
INSERT INTO `metabase_fieldvalues` VALUES ('496', '2017-06-22 10:52:32', '2017-06-25 14:19:48', '[3.0,5.0,16.0,100.0,200.0]', null, '942');
INSERT INTO `metabase_fieldvalues` VALUES ('497', '2017-06-22 10:52:32', '2017-06-25 14:19:48', '[0,1]', null, '943');
INSERT INTO `metabase_fieldvalues` VALUES ('498', '2017-06-22 10:52:33', '2017-06-25 14:19:48', '[\"06778441\",\"08877520\",\"20168352\"]', null, '945');
INSERT INTO `metabase_fieldvalues` VALUES ('499', '2017-06-22 10:52:33', '2017-06-25 14:19:48', '[0.0,3.0,5.0,16.0]', null, '946');
INSERT INTO `metabase_fieldvalues` VALUES ('500', '2017-06-22 10:52:34', '2017-06-25 14:19:49', '[21,37]', null, '947');
INSERT INTO `metabase_fieldvalues` VALUES ('501', '2017-06-22 10:52:34', '2017-06-25 14:19:49', '[\"01133499\",\"06896116\",\"14840772\",\"18562244\",\"20894760\",\"25329136\",\"30811218\",\"39321171\",\"53712157\",\"89005249\"]', null, '948');
INSERT INTO `metabase_fieldvalues` VALUES ('502', '2017-06-22 10:52:34', '2017-06-25 14:19:49', '[\"01749944\",\"04651301\",\"08713298\",\"08966437\",\"0d823l41\",\"11216024\",\"16583367\",\"17898579\",\"19069375\",\"19694113\",\"20380826\",\"23284384\",\"26270410\",\"34139406\",\"34708118\",\"36854632\",\"37811862\",\"38122810\",\"44827493\",\"47679439\",\"51310699\",\"54298982\",\"55067347\",\"59129176\",\"59630735\",\"5xn9041a\",\"61606615\",\"62042226\",\"63557441\",\"64929778\",\"72129586\",\"76748719\",\"79937785\",\"7l8rmm0w\",\"80326596\",\"83150078\",\"84635929\",\"88794465\",\"92513653\",\"92765537\",\"96158969\",\"99518867\",\"fas85vtm\",\"glpq2xbt\",\"k22436ks\",\"l523oxfp\",\"p13tpsfd\",\"rv4zt6vx\",\"t636g8g8\",\"tqc5uigz\",\"vmq4whbp\"]', null, '950');
INSERT INTO `metabase_fieldvalues` VALUES ('503', '2017-06-22 10:52:35', '2017-06-25 14:19:49', '[\"06778441\",\"08877520\",\"20168352\",\"35841532\",\"65267581\",\"99633853\"]', null, '951');
INSERT INTO `metabase_fieldvalues` VALUES ('504', '2017-06-22 10:52:36', '2017-06-25 14:19:49', '[\"0:0:0:0:0:0:0:1\",\"127.0.0.1\",\"192.168.0.108\",\"192.168.1.106\"]', null, '952');
INSERT INTO `metabase_fieldvalues` VALUES ('505', '2017-06-22 10:52:36', '2017-06-25 14:19:49', '[1]', null, '953');
INSERT INTO `metabase_fieldvalues` VALUES ('507', '2017-06-22 10:52:37', '2017-06-25 14:19:49', '[\"1134544444444\"]', null, '956');
INSERT INTO `metabase_fieldvalues` VALUES ('508', '2017-06-22 10:52:38', '2017-06-25 14:19:49', '[\"wxbdbdd09eed6423bf\"]', null, '957');
INSERT INTO `metabase_fieldvalues` VALUES ('509', '2017-06-22 10:52:38', '2017-06-25 14:19:49', '[\"一起赚联盟\"]', null, '958');
INSERT INTO `metabase_fieldvalues` VALUES ('510', '2017-06-22 10:52:38', '2017-06-25 14:19:49', '[\"c9cf10028b425f341f19638136482ebc\"]', null, '959');
INSERT INTO `metabase_fieldvalues` VALUES ('511', '2017-06-22 10:52:40', '2017-06-25 14:19:50', '[\"1\",\"1000\",\"2\",\"3\",\"300\",\"388\",\"550\",\"555\",\"588\",\"598\",\"688\",\"698\",\"8\"]', null, '961');
INSERT INTO `metabase_fieldvalues` VALUES ('512', '2017-06-22 10:52:40', '2017-06-25 14:19:50', '[\"1478016785539\",\"1478074492630\",\"1478233594185\",\"1478233599718\",\"1478404100690\",\"1478404169648\",\"1478614772947\",\"1479041692038\",\"1479041736263\",\"1479094841394\",\"1479094848278\",\"1479527290679\",\"1479740424656\",\"1479740432682\",\"1479740463317\",\"1479740469750\",\"1480003753028\",\"1480003756060\",\"1480669471713\",\"1483176352203\",\"1483176374070\",\"1483176980660\"]', null, '962');
INSERT INTO `metabase_fieldvalues` VALUES ('513', '2017-06-22 10:52:40', '2017-06-25 14:19:50', '[\"0\",\"356\"]', null, '964');
INSERT INTO `metabase_fieldvalues` VALUES ('514', '2017-06-22 10:52:40', '2017-06-25 14:19:50', '[\"10\",\"11\",\"12\",\"18\",\"2\",\"4\",\"5\",\"6\",\"7\",\"9\"]', null, '965');
INSERT INTO `metabase_fieldvalues` VALUES ('515', '2017-06-22 10:52:41', '2017-06-25 14:19:50', '[\"52335272\",\"71504603\",\"91534332\",\"92815211\",\"99338236\"]', null, '966');
INSERT INTO `metabase_fieldvalues` VALUES ('516', '2017-06-22 10:52:41', '2017-06-25 14:19:50', '[\"dsfa\",\"gcd666b\",\"gcd666h\",\"gcd777h\",\"gcd777z\",\"wxh1\",\"wxh2\",\"wxh3\"]', null, '967');
INSERT INTO `metabase_fieldvalues` VALUES ('517', '2017-06-22 10:52:41', '2017-06-25 14:19:50', '[\"1\",\"10\",\"15\",\"2\",\"20\",\"3\",\"30\",\"5\",\"55\",\"6\",\"8\"]', null, '968');
INSERT INTO `metabase_fieldvalues` VALUES ('518', '2017-06-22 10:52:43', '2017-06-25 14:19:50', '[\"1478016548281\",\"1478074256971\",\"1478233558026\",\"1478233586168\",\"1478404157345\",\"1479041692038\",\"1479094833915\",\"1479528296683\",\"1479740415488\",\"1479740451464\",\"1480003747912\",\"1480669455822\",\"1483176332296\"]', null, '969');
INSERT INTO `metabase_fieldvalues` VALUES ('519', '2017-06-22 10:52:43', '2017-06-25 14:19:50', '[\"0\",\"355\"]', null, '971');
INSERT INTO `metabase_fieldvalues` VALUES ('520', '2017-06-22 10:52:44', '2017-06-25 14:19:51', '[\"1\",\"10\",\"11\",\"12\",\"18\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"9\"]', null, '972');
INSERT INTO `metabase_fieldvalues` VALUES ('521', '2017-06-22 10:52:44', '2017-06-25 14:19:51', '[\"52335272\",\"71504603\",\"91534332\",\"92815211\",\"99338236\"]', null, '973');
INSERT INTO `metabase_fieldvalues` VALUES ('522', '2017-06-22 10:52:45', '2017-06-25 14:19:51', '[\"dfasdfasdf\",\"gcd666b\",\"gcd666h\",\"gcd777h\",\"gcd777z\",\"wxh1\"]', null, '974');
INSERT INTO `metabase_fieldvalues` VALUES ('523', '2017-06-22 10:52:45', '2017-06-25 14:19:51', '[\"100\",\"20\",\"200\",\"30\",\"4\",\"50\",\"55\",\"60\"]', null, '975');
INSERT INTO `metabase_fieldvalues` VALUES ('524', '2017-06-22 10:59:38', '2017-06-22 10:59:38', '[12.02,12.65,12.98,13.0,13.45,14.4,14.43,14.54,14.8,15.22,15.97,16.67,16.88,17.19,17.54,17.96,17.97,18.1,18.12,18.58,18.61,18.990000000000002,19.57,21.11,21.240000000000002,23.61,23.71,25.78,26.21,27.33,27.73,28.41,28.69,29.26,29.29,29.78,29.85,29.88,29.94,29.96,30.36,31.03,32.82,33.03,34.3,34.71,35.010000000000005,36.6,36.65,37.57,38.09,38.11,38.83,38.879999999999995,39.18,39.760000000000005,40.4,41.120000000000005,42.36,42.9,43.730000000000004,43.980000000000004,45.31,45.41,45.59,45.73,46.25,46.36,46.54,46.62,47.0,47.05,47.9,47.96,48.06,49.32,49.91,50.93,51.29,51.88,53.46,53.92,54.54,54.8,54.96,55.02,55.13,55.17,55.29,55.66,56.17,56.58,57.73,57.91,58.25,58.6,59.54,59.63,60.25,60.71,60.82,60.97,61.35,61.91,62.49,62.54,62.61,62.8,63.11,63.29,63.5,64.03999999999999,64.2,64.4,65.0,65.44,65.81,67.19,67.21000000000001,68.18,68.64,68.69,69.3,69.43,71.03,71.05,72.31,72.69,72.85,73.22999999999999,73.58,73.75,74.22999999999999,74.31,75.11,75.47,76.24,77.02,77.96,78.39,78.47,79.34,79.97,80.0,80.12,80.64,80.86,81.18,81.48,81.65,82.08,82.46,83.16,83.68,85.34,85.7,86.52,86.93,86.96,87.1,87.27,87.54,88.06,88.42,88.79,88.95,89.27,89.62,89.75,90.99,91.19,91.24,91.33,92.01,92.18,92.19,92.76,93.03,93.25,93.41,93.64,93.68,93.74,93.94,94.35,94.44,94.74,95.25,95.44,95.66,95.76,95.77,95.87,96.36,97.69,98.61,98.8,98.87,99.37]', null, '1661');
INSERT INTO `metabase_fieldvalues` VALUES ('525', '2017-06-22 10:59:39', '2017-06-22 10:59:39', '[\"Affiliate\",\"Facebook\",\"Google\",\"Organic\",\"Twitter\"]', null, '1675');
INSERT INTO `metabase_fieldvalues` VALUES ('526', '2017-06-22 10:59:39', '2017-06-22 10:59:39', '[\"AA\",\"AE\",\"AK\",\"AL\",\"AP\",\"AR\",\"AS\",\"AZ\",\"CA\",\"CO\",\"CT\",\"DC\",\"DE\",\"FL\",\"FM\",\"GA\",\"GU\",\"HI\",\"IA\",\"ID\",\"IL\",\"IN\",\"KS\",\"KY\",\"LA\",\"MA\",\"MD\",\"ME\",\"MH\",\"MI\",\"MN\",\"MO\",\"MP\",\"MS\",\"MT\",\"NC\",\"ND\",\"NE\",\"NH\",\"NJ\",\"NM\",\"NV\",\"NY\",\"OH\",\"OK\",\"OR\",\"PA\",\"PR\",\"PW\",\"RI\",\"SC\",\"SD\",\"TN\",\"TX\",\"UT\",\"VA\",\"VI\",\"VT\",\"WA\",\"WI\",\"WV\",\"WY\"]', null, '1676');
INSERT INTO `metabase_fieldvalues` VALUES ('527', '2017-06-22 10:59:40', '2017-06-22 10:59:40', '[\"Doohickey\",\"Gadget\",\"Gizmo\",\"Widget\"]', null, '1678');
INSERT INTO `metabase_fieldvalues` VALUES ('528', '2017-06-22 10:59:40', '2017-06-22 10:59:40', '[\"0081263418030\",\"0150683335231\",\"0185239502034\",\"0201347937275\",\"0208207181403\",\"0261974470934\",\"0450593824499\",\"0462846675833\",\"0527261609570\",\"0599883657895\",\"0613296792285\",\"0733287944865\",\"0743987954842\",\"0819745416164\",\"0876255689785\",\"0913720145312\",\"0914229448829\",\"1003173925643\",\"1019598007222\",\"1027777413634\",\"1108567994349\",\"1130947253647\",\"1244736031993\",\"1283395751521\",\"1390366619206\",\"1430186044113\",\"1432802681733\",\"1440735016973\",\"1476104734285\",\"1587142162937\",\"1606740630591\",\"1625425260151\",\"1633218970514\",\"1724284499464\",\"1726795662825\",\"1801026003964\",\"1858184158340\",\"1926887866333\",\"2046664571119\",\"2057424007489\",\"2077282258748\",\"2078106782913\",\"2094363929205\",\"2149381484639\",\"2240077906975\",\"2244826857204\",\"2353853855005\",\"2498152357239\",\"2514922888960\",\"2515274618588\",\"2560332097560\",\"2572094119954\",\"2589747445674\",\"2624945894432\",\"2722019668757\",\"2762672356424\",\"2803335755588\",\"2913743729092\",\"2935247201768\",\"2938033762689\",\"2989936456588\",\"3059222939183\",\"3080781792902\",\"3089929364803\",\"3118334524745\",\"3200135109389\",\"3226678873266\",\"3235479371581\",\"3261385634984\",\"3334764533373\",\"3343127930445\",\"3358070674483\",\"3411407056403\",\"3454624707208\",\"3534388962058\",\"3542819341242\",\"3648864003163\",\"3689142177381\",\"3689672959099\",\"3701504839383\",\"3714557062974\",\"3728047817418\",\"3780136305084\",\"3829311382424\",\"3879742526744\",\"3933689939163\",\"3934004122079\",\"3939437705387\",\"3971521899824\",\"3985833737323\",\"4015556386184\",\"4068318015259\",\"4131152317015\",\"4193289449342\",\"4221553469045\",\"4228217525154\",\"4656703199495\",\"4703222961314\",\"4748913930057\",\"4891613299983\",\"4898647510879\",\"4899493515094\",\"4909109126467\",\"4950171429048\",\"5205082703671\",\"5258491206899\",\"5267238529757\",\"5284917631228\",\"5318562718130\",\"5351002838395\",\"5426687059523\",\"5477175520780\",\"5523940493770\",\"5615006385836\",\"5686832827784\",\"5741186110910\",\"5771112616247\",\"5772852431015\",\"5988420267898\",\"6009160326535\",\"6073632260665\",\"6120458312488\",\"6171497601507\",\"6173170156274\",\"6180054790554\",\"6196503111474\",\"6197636796361\",\"6199259041538\",\"6227613464966\",\"6403110696998\",\"6413207051487\",\"6416824409785\",\"6453078636222\",\"6456767967256\",\"6705506344002\",\"6880216006874\",\"7139294454916\",\"7287446823025\",\"7452422313108\",\"7482157209087\",\"7542360044001\",\"7639801548881\",\"7895844498426\",\"7922730966865\",\"7924545660075\",\"7944141819189\",\"8083383752461\",\"8151634708342\",\"8183558709174\",\"8187466015068\",\"8271546277054\",\"8277895988566\",\"8284816768404\",\"8288794103141\",\"8356442660435\",\"8437963733140\",\"8515444130906\",\"8520696853923\",\"8522018181233\",\"8535456864408\",\"8546422079474\",\"8633897297219\",\"8636387954272\",\"8648285961313\",\"8789307982104\",\"8839114765732\",\"8852364185334\",\"8873422508094\",\"9042170508406\",\"9085480422239\",\"9097818301512\",\"9140419880815\",\"9162000550143\",\"9169266143164\",\"9181839646919\",\"9213325070110\",\"9228871749700\",\"9238743606192\",\"9300114400941\",\"9346173882120\",\"9364786294048\",\"9390500817217\",\"9425958763660\",\"9543175947875\",\"9549614545398\",\"9584501019200\",\"9589254266420\",\"9620256814131\",\"9622708968997\",\"9623793944125\",\"9681148795440\",\"9779352889014\",\"9796200542563\",\"9872987974978\",\"9889273603689\",\"9927952606641\",\"9965384839763\",\"9978918957338\",\"9991430183467\",\"9999986852738\"]', null, '1680');
INSERT INTO `metabase_fieldvalues` VALUES ('529', '2017-06-22 10:59:40', '2017-06-22 10:59:40', '[12.02,12.65,12.98,13.0,13.45,14.4,14.43,14.54,14.8,15.22,15.97,16.67,16.88,17.19,17.54,17.96,17.97,18.1,18.12,18.58,18.61,18.990000000000002,19.57,21.11,21.240000000000002,23.61,23.71,25.78,26.21,27.33,27.73,28.41,28.69,29.26,29.29,29.78,29.85,29.88,29.94,29.96,30.36,31.03,32.82,33.03,34.3,34.71,35.010000000000005,36.6,36.65,37.57,38.09,38.11,38.83,38.879999999999995,39.18,39.760000000000005,40.4,41.120000000000005,42.36,42.9,43.730000000000004,43.980000000000004,45.31,45.41,45.59,45.73,46.25,46.36,46.54,46.62,47.0,47.05,47.9,47.96,48.06,49.32,49.91,50.93,51.29,51.88,53.46,53.92,54.54,54.8,54.96,55.02,55.13,55.17,55.29,55.66,56.17,56.58,57.73,57.91,58.25,58.6,59.54,59.63,60.25,60.71,60.82,60.97,61.35,61.91,62.49,62.54,62.61,62.8,63.11,63.29,63.5,64.03999999999999,64.2,64.4,65.0,65.44,65.81,67.19,67.21000000000001,68.18,68.64,68.69,69.3,69.43,71.03,71.05,72.31,72.69,72.85,73.22999999999999,73.58,73.75,74.22999999999999,74.31,75.11,75.47,76.24,77.02,77.96,78.39,78.47,79.34,79.97,80.0,80.12,80.64,80.86,81.18,81.48,81.65,82.08,82.46,83.16,83.68,85.34,85.7,86.52,86.93,86.96,87.1,87.27,87.54,88.06,88.42,88.79,88.95,89.27,89.62,89.75,90.99,91.19,91.24,91.33,92.01,92.18,92.19,92.76,93.03,93.25,93.41,93.64,93.68,93.74,93.94,94.35,94.44,94.74,95.25,95.44,95.66,95.76,95.77,95.87,96.36,97.69,98.61,98.8,98.87,99.37]', null, '1682');
INSERT INTO `metabase_fieldvalues` VALUES ('530', '2017-06-22 10:59:40', '2017-06-22 10:59:40', '[0.0,1.0,1.6,2.2,2.7,2.8,3.0,3.1,3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4.0,4.1,4.2,4.3,4.4,4.5,4.6,4.7,5.0]', null, '1683');
INSERT INTO `metabase_fieldvalues` VALUES ('531', '2017-06-22 10:59:41', '2017-06-22 10:59:41', '[\"Aerodynamic Concrete Bag\",\"Aerodynamic Copper Coat\",\"Aerodynamic Copper Hat\",\"Aerodynamic Copper Knife\",\"Aerodynamic Cotton Shoes\",\"Aerodynamic Marble Bottle\",\"Aerodynamic Paper Keyboard\",\"Aerodynamic Paper Wallet\",\"Aerodynamic Plastic Clock\",\"Aerodynamic Plastic Coat\",\"Awesome Concrete Coat\",\"Awesome Concrete Keyboard\",\"Awesome Concrete Shirt\",\"Awesome Copper Keyboard\",\"Awesome Granite Coat\",\"Awesome Granite Watch\",\"Awesome Leather Computer\",\"Awesome Marble Shoes\",\"Awesome Marble Wallet\",\"Awesome Paper Chair\",\"Awesome Paper Clock\",\"Awesome Paper Computer\",\"Awesome Plastic Table\",\"Awesome Rubber Bench\",\"Awesome Silk Chair\",\"Awesome Silk Coat\",\"Awesome Steel Bottle\",\"Awesome Wooden Shirt\",\"Durable Linen Car\",\"Durable Marble Computer\",\"Durable Marble Pants\",\"Durable Paper Keyboard\",\"Durable Silk Car\",\"Durable Wooden Car\",\"Durable Wooden Lamp\",\"Durable Wool Bottle\",\"Durable Wool Chair\",\"Enormous Bronze Toucan\",\"Enormous Copper Plate\",\"Enormous Iron Hat\",\"Enormous Marble Shoes\",\"Enormous Paper Car\",\"Enormous Paper Knife\",\"Enormous Paper Pants\",\"Enormous Paper Shirt\",\"Enormous Rubber Toucan\",\"Enormous Steel Hat\",\"Enormous Wooden Clock\",\"Ergonomic Bronze Chair\",\"Ergonomic Cotton Chair\",\"Ergonomic Leather Pants\",\"Ergonomic Marble Shirt\",\"Ergonomic Plastic Bottle\",\"Ergonomic Silk Watch\",\"Ergonomic Steel Hat\",\"Ergonomic Steel Table\",\"Ergonomic Wool Lamp\",\"Fantastic Bronze Lamp\",\"Fantastic Concrete Lamp\",\"Fantastic Concrete Table\",\"Fantastic Copper Coat\",\"Fantastic Cotton Keyboard\",\"Fantastic Granite Coat\",\"Fantastic Leather Table\",\"Fantastic Marble Clock\",\"Fantastic Marble Watch\",\"Fantastic Plastic Bag\",\"Fantastic Plastic Hat\",\"Fantastic Plastic Shirt\",\"Fantastic Silk Computer\",\"Fantastic Steel Chair\",\"Fantastic Wooden Gloves\",\"Fantastic Wool Coat\",\"Fantastic Wool Pants\",\"Gorgeous Granite Keyboard\",\"Gorgeous Granite Shoes\",\"Gorgeous Rubber Hat\",\"Gorgeous Wool Clock\",\"Heavy-Duty Aluminum Knife\",\"Heavy-Duty Aluminum Pants\",\"Heavy-Duty Bronze Coat\",\"Heavy-Duty Concrete Coat\",\"Heavy-Duty Concrete Pants\",\"Heavy-Duty Concrete Plate\",\"Heavy-Duty Cotton Gloves\",\"Heavy-Duty Iron Computer\",\"Heavy-Duty Linen Pants\",\"Heavy-Duty Plastic Bench\",\"Heavy-Duty Plastic Gloves\",\"Heavy-Duty Plastic Lamp\",\"Heavy-Duty Wooden Chair\",\"Heavy-Duty Wool Chair\",\"Incredible Copper Bag\",\"Incredible Copper Shirt\",\"Incredible Copper Toucan\",\"Incredible Cotton Gloves\",\"Incredible Cotton Hat\",\"Incredible Leather Coat\",\"Incredible Marble Chair\",\"Incredible Paper Computer\",\"Incredible Paper Shirt\",\"Incredible Rubber Table\",\"Incredible Silk Lamp\",\"Intelligent Aluminum Hat\",\"Intelligent Aluminum Keyboard\",\"Intelligent Copper Coat\",\"Intelligent Cotton Bottle\",\"Intelligent Cotton Shirt\",\"Intelligent Linen Bottle\",\"Intelligent Linen Coat\",\"Intelligent Linen Pants\",\"Intelligent Marble Car\",\"Intelligent Steel Watch\",\"Intelligent Wooden Lamp\",\"Intelligent Wool Bench\",\"Lightweight Bronze Knife\",\"Lightweight Concrete Gloves\",\"Lightweight Concrete Pants\",\"Lightweight Copper Lamp\",\"Lightweight Cotton Toucan\",\"Lightweight Cotton Watch\",\"Lightweight Linen Bench\",\"Lightweight Marble Plate\",\"Lightweight Rubber Toucan\",\"Lightweight Steel Shoes\",\"Mediocre Aluminum Car\",\"Mediocre Bronze Bag\",\"Mediocre Concrete Coat\",\"Mediocre Concrete Keyboard\",\"Mediocre Copper Clock\",\"Mediocre Cotton Toucan\",\"Mediocre Granite Shirt\",\"Mediocre Iron Computer\",\"Mediocre Iron Pants\",\"Mediocre Marble Gloves\",\"Mediocre Paper Keyboard\",\"Mediocre Paper Knife\",\"Mediocre Rubber Keyboard\",\"Mediocre Steel Plate\",\"Mediocre Wooden Bench\",\"Practical Bronze Bottle\",\"Practical Concrete Chair\",\"Practical Concrete Coat\",\"Practical Cotton Pants\",\"Practical Linen Pants\",\"Practical Marble Wallet\",\"Practical Paper Bag\",\"Practical Paper Coat\",\"Practical Plastic Bottle\",\"Practical Steel Bench\",\"Practical Wooden Hat\",\"Rustic Aluminum Bag\",\"Rustic Aluminum Chair\",\"Rustic Concrete Wallet\",\"Rustic Concrete Watch\",\"Rustic Copper Toucan\",\"Rustic Granite Car\",\"Rustic Iron Shoes\",\"Rustic Paper Shirt\",\"Rustic Silk Car\",\"Rustic Steel Car\",\"Rustic Wool Chair\",\"Sleek Aluminum Gloves\",\"Sleek Concrete Wallet\",\"Sleek Iron Watch\",\"Sleek Marble Table\",\"Sleek Paper Bag\",\"Sleek Plastic Coat\",\"Sleek Rubber Hat\",\"Sleek Rubber Wallet\",\"Sleek Silk Hat\",\"Sleek Steel Shirt\",\"Sleek Wooden Shoes\",\"Small Aluminum Clock\",\"Small Concrete Pants\",\"Small Copper Keyboard\",\"Small Cotton Car\",\"Small Leather Gloves\",\"Small Leather Hat\",\"Small Plastic Chair\",\"Small Silk Clock\",\"Synergistic Aluminum Coat\",\"Synergistic Concrete Bottle\",\"Synergistic Copper Bag\",\"Synergistic Copper Computer\",\"Synergistic Copper Knife\",\"Synergistic Cotton Shoes\",\"Synergistic Iron Computer\",\"Synergistic Iron Plate\",\"Synergistic Iron Table\",\"Synergistic Leather Clock\",\"Synergistic Leather Pants\",\"Synergistic Leather Wallet\",\"Synergistic Linen Gloves\",\"Synergistic Marble Hat\",\"Synergistic Marble Shoes\",\"Synergistic Silk Coat\",\"Synergistic Steel Computer\",\"Synergistic Steel Keyboard\",\"Synergistic Wooden Lamp\"]', null, '1684');
INSERT INTO `metabase_fieldvalues` VALUES ('532', '2017-06-22 10:59:41', '2017-06-22 10:59:41', '[\"Abbott, Kunde and McClure\",\"Abernathy-Franecki\",\"Abshire-McCullough\",\"Adams-O\'Keefe\",\"Adrienne Moen Inc\",\"Agustin Quitzon Inc\",\"Aida Morar and Sons\",\"Alexis Haley and Sons\",\"Alfonzo Ritchie and Sons\",\"Altenwerth, Rodriguez and Hermann\",\"Annabell Ledner and Sons\",\"Athena Ankunding and Sons\",\"Aufderhar-Dietrich\",\"Bahringer-Lubowitz\",\"Bartell, Windler and Bernier\",\"Bartell-Kuphal\",\"Bayer, Halvorson and Brown\",\"Bayer-Rosenbaum\",\"Beahan, Daugherty and Kihn\",\"Beatty, Bahringer and Gleichner\",\"Beatty, Barrows and Spencer\",\"Bechtelar, DuBuque and Jaskolski\",\"Berge, Turcotte and Brown\",\"Berneice Cole and Sons\",\"Billie Collins Group\",\"Blaze Mertz and Sons\",\"Bode-Mueller\",\"Bonnie Hettinger Inc\",\"Boyle, Sporer and Reilly\",\"Bridie Little DVM and Sons\",\"Brown, Leffler and Lang\",\"Buckridge, Barrows and Conroy\",\"Buckridge, Turner and Jenkins\",\"Carter, Kub and Bins\",\"Carter, Schmidt and Batz\",\"Casper Leannon DDS and Sons\",\"Christiansen-Feil\",\"Collier, O\'Reilly and Mayert\",\"Conn-Fisher\",\"Conroy, Bergnaum and Steuber\",\"Cordell Harris Group\",\"Cristian Lockman Group\",\"Cydney Will Group\",\"Dach, Predovic and Towne\",\"Daniel, Sawayn and Koepp\",\"Davis-Mraz\",\"Dickens, Gulgowski and Braun\",\"Dickens-Ortiz\",\"Dietrich-Upton\",\"Dr. Carmel Willms Group\",\"Einar Hoeger Group\",\"Eldridge Rodriguez Inc\",\"Ernser-Haley\",\"Eugene Vandervort IV LLC\",\"Fadel-Friesen\",\"Fadel-Veum\",\"Fahey-Williamson\",\"Feeney, Bogan and Mann\",\"Feeney-Wolf\",\"Flavie Christiansen Group\",\"Friesen, Glover and Morissette\",\"Goldner-West\",\"Gottlieb-Kunde\",\"Grady-Heller\",\"Grady-O\'Conner\",\"Griffin Shanahan and Sons\",\"Hackett-Bahringer\",\"Haley-Feest\",\"Heaney, Kemmer and Wolf\",\"Herbert Boehm Inc\",\"Hermann, Roob and Cole\",\"Hermiston, Steuber and Schulist\",\"Hickle, Schiller and Hodkiewicz\",\"Hilda Gulgowski LLC\",\"Homenick, Macejkovic and Kessler\",\"Homenick-Kshlerin\",\"Howell, Christiansen and Beatty\",\"Huels-Powlowski\",\"Hyatt-Schaefer\",\"Jacques Ullrich and Sons\",\"Jaime Pollich and Sons\",\"Jarod Auer LLC\",\"Jarvis Tremblay Inc\",\"Joan Bartoletti Group\",\"Joana Osinski and Sons\",\"Joey Collier LLC\",\"Johnston, Bashirian and Bartell\",\"Judd Gutmann III and Sons\",\"June Quitzon Group\",\"June Renner Inc\",\"Kaleb Pagac Group\",\"Kassulke-Toy\",\"Kaylah Grimes Inc\",\"Keegan Dach Group\",\"Keeling, Rau and Osinski\",\"Keith Dickinson Inc\",\"Kemmer, Spencer and Kautzer\",\"Kenyon Cummings LLC\",\"Kihn, Kerluke and Carroll\",\"Koch-Turcotte\",\"Koepp, Mraz and Gibson\",\"Koepp-Hamill\",\"Koss-Willms\",\"Kris-Ritchie\",\"Kuhn-Kuvalis\",\"Kunde-Sanford\",\"Kutch-Tromp\",\"Kuvalis-Renner\",\"Lang, Murazik and Paucek\",\"Lavada Kessler Group\",\"Leannon-Kuphal\",\"Lemke-Schaden\",\"Lina Hodkiewicz and Sons\",\"Littel, Fay and Reinger\",\"Lorenzo Mante Inc\",\"Lowe, Marks and Gleichner\",\"Macejkovic, Crooks and Hagenes\",\"Maddison Corkery and Sons\",\"Madilyn Ratke LLC\",\"Mallie Funk Group\",\"Marc Beier Group\",\"Marquardt-Schultz\",\"Matilda Breitenberg LLC\",\"Mayer, Stark and Langworth\",\"Mayert, Schaden and Stokes\",\"McClure, Williamson and Rosenbaum\",\"McKenzie-Rodriguez\",\"McLaughlin-Bruen\",\"Mekhi Bosco LLC\",\"Miss Charles Lemke LLC\",\"Mitchell, Kuphal and Russel\",\"Mohammad Altenwerth Group\",\"Moore, Hessel and Ziemann\",\"Ms. Bennie Schuppe LLC\",\"Ms. Jaime Wyman LLC\",\"Ms. Monroe Crooks LLC\",\"Muriel Halvorson Inc\",\"Nicolas-Reinger\",\"Nitzsche, Hermiston and Raynor\",\"Nitzsche-Schaden\",\"Nolan, Bahringer and Pacocha\",\"Nolan, Heller and Miller\",\"O\'Hara-Ferry\",\"O\'Kon, Kautzer and Goyette\",\"Oberbrunner-Labadie\",\"Okuneva, Legros and Schmeler\",\"Osinski, Marquardt and Roberts\",\"Osinski-Mueller\",\"Pacocha, Lynch and Bosco\",\"Pauline Rath LLC\",\"Prince Leffler Group\",\"Prosacco-Lemke\",\"Quinten Koepp and Sons\",\"Randal Gerlach Group\",\"Rau-Armstrong\",\"Robel, Friesen and Blick\",\"Roberts, Morissette and Price\",\"Rocio Gusikowski and Sons\",\"Rohan-Rogahn\",\"Romaguera-Corkery\",\"Runolfsson-Gutmann\",\"Runte-Douglas\",\"Ruth Osinski LLC\",\"Rutherford-Langworth\",\"Ryan, Douglas and Denesik\",\"Schiller, Cartwright and Klocko\",\"Schiller-Lemke\",\"Senger, Konopelski and Jones\",\"Sipes-Sanford\",\"Stan Bradtke LLC\",\"Stehr, Mayert and Wiza\",\"Stoltenberg-Schroeder\",\"Stroman, Abernathy and Pfannerstill\",\"Strosin-Bartoletti\",\"Swift-Streich\",\"Sydni Smitham PhD Inc\",\"Tatum West LLC\",\"Tina Emard Group\",\"Tommie Runte LLC\",\"Toni Gerlach Group\",\"Torp, Kub and Hessel\",\"Torp-Collier\",\"Torphy-Mayer\",\"Tremblay-Price\",\"Vella Wiegand and Sons\",\"Vicenta Kuhn Group\",\"Virgil Stehr and Sons\",\"Walter, Kerluke and Ullrich\",\"Ward Kihn Group\",\"Weissnat-Swaniawski\",\"White, Nolan and Lockman\",\"Wilber Will Group\",\"Windler-Hansen\",\"Winston Nienow LLC\",\"Wuckert-Gerlach\",\"Xzavier Windler Group\",\"Yadira Leffler LLC\",\"Zachariah Krajcik Group\",\"Ziemann, Schaden and Marvin\",\"Zula Heathcote and Sons\"]', null, '1685');
INSERT INTO `metabase_fieldvalues` VALUES ('533', '2017-06-22 10:59:41', '2017-06-22 10:59:41', '[1,2,3,4,5]', null, '1690');
INSERT INTO `metabase_fieldvalues` VALUES ('534', '2017-06-25 14:19:53', '2017-06-25 14:19:53', '[\"2017-01-01\"]', null, '1719');
INSERT INTO `metabase_fieldvalues` VALUES ('535', '2017-06-25 14:19:53', '2017-06-25 14:19:53', '[\"50\"]', null, '1720');
INSERT INTO `metabase_fieldvalues` VALUES ('536', '2017-06-25 14:19:53', '2017-06-25 14:19:53', '[\"媒体平台\"]', null, '1721');
INSERT INTO `metabase_fieldvalues` VALUES ('537', '2017-06-25 14:19:54', '2017-06-25 14:19:54', '[\"媒体编码\"]', null, '1722');
INSERT INTO `metabase_fieldvalues` VALUES ('538', '2017-06-25 14:19:54', '2017-06-25 14:19:54', '[\"1000\"]', null, '1724');
INSERT INTO `metabase_fieldvalues` VALUES ('539', '2017-06-25 14:19:54', '2017-06-25 14:19:54', '[\"1000\"]', null, '1725');
INSERT INTO `metabase_fieldvalues` VALUES ('540', '2017-06-25 14:19:54', '2017-06-25 14:19:54', '[\"300\"]', null, '1726');
INSERT INTO `metabase_fieldvalues` VALUES ('541', '2017-06-25 14:19:54', '2017-06-25 14:19:54', '[\"2017-01-02\"]', null, '1727');
INSERT INTO `metabase_fieldvalues` VALUES ('542', '2017-06-25 14:19:54', '2017-06-25 14:19:54', '[\"10\"]', null, '1728');
INSERT INTO `metabase_fieldvalues` VALUES ('543', '2017-06-25 14:19:54', '2017-06-25 14:19:54', '[\"推广员\"]', null, '1729');
INSERT INTO `metabase_fieldvalues` VALUES ('544', '2017-06-25 14:19:55', '2017-06-25 14:19:55', '[\"1\"]', null, '1730');
INSERT INTO `metabase_fieldvalues` VALUES ('545', '2017-06-25 14:19:55', '2017-06-25 14:19:55', '[\"2017-01-01\"]', null, '1731');
INSERT INTO `metabase_fieldvalues` VALUES ('546', '2017-06-25 14:19:55', '2017-06-25 14:19:55', '[\"文案内容目的\"]', null, '1732');
INSERT INTO `metabase_fieldvalues` VALUES ('547', '2017-06-25 14:19:55', '2017-06-25 14:19:55', '[\"文案负责人\"]', null, '1733');
INSERT INTO `metabase_fieldvalues` VALUES ('548', '2017-06-25 14:19:55', '2017-06-25 14:19:55', '[\"500\"]', null, '1734');
INSERT INTO `metabase_fieldvalues` VALUES ('549', '2017-06-25 14:19:55', '2017-06-25 14:19:55', '[\"10\"]', null, '1735');
INSERT INTO `metabase_fieldvalues` VALUES ('550', '2017-06-25 14:19:56', '2017-06-25 14:19:56', '[\"销售员\"]', null, '1736');

-- ----------------------------
-- Table structure for `metabase_table`
-- ----------------------------
DROP TABLE IF EXISTS `metabase_table`;
CREATE TABLE `metabase_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `rows` bigint(20) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `entity_name` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_type` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` bit(1) NOT NULL,
  `db_id` int(11) NOT NULL,
  `display_name` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility_type` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schema` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `raw_table_id` int(11) DEFAULT NULL,
  `points_of_interest` text COLLATE utf8_unicode_ci,
  `caveats` text COLLATE utf8_unicode_ci,
  `show_in_getting_started` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `idx_table_db_id` (`db_id`),
  KEY `idx_metabase_table_show_in_getting_started` (`show_in_getting_started`),
  KEY `idx_metabase_table_db_id_schema` (`schema`),
  CONSTRAINT `fk_table_ref_database_id` FOREIGN KEY (`db_id`) REFERENCES `metabase_database` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of metabase_table
-- ----------------------------
INSERT INTO `metabase_table` VALUES ('5', '2017-06-22 10:46:23', '2017-06-25 14:18:24', 'assignment', '0', null, null, null, '', '3', 'Assignment', null, null, '100', null, null, '');
INSERT INTO `metabase_table` VALUES ('6', '2017-06-22 10:46:24', '2017-06-25 14:18:24', 'book_article', '9', null, null, null, '', '3', 'Book Article', null, null, '9', null, null, '');
INSERT INTO `metabase_table` VALUES ('7', '2017-06-22 10:46:25', '2017-06-25 14:18:25', 'book_article_dis', '3', null, null, null, '', '3', 'Book Article Dis', null, null, '39', null, null, '');
INSERT INTO `metabase_table` VALUES ('8', '2017-06-22 10:46:26', '2017-06-25 14:18:26', 'book_article_private', '18', null, null, null, '', '3', 'Book Article Private', null, null, '112', null, null, '');
INSERT INTO `metabase_table` VALUES ('9', '2017-06-22 10:46:27', '2017-06-25 14:18:27', 'book_catalog', '104', null, null, null, '', '3', 'Book Catalog', null, null, '71', null, null, '');
INSERT INTO `metabase_table` VALUES ('10', '2017-06-22 10:46:27', '2017-06-25 14:18:28', 'book_catalog_pirvate', '6', null, null, null, '', '3', 'Book Catalog Pir Va Te', null, null, '67', null, null, '');
INSERT INTO `metabase_table` VALUES ('11', '2017-06-22 10:46:28', '2017-06-25 14:18:29', 'checkpass', '0', null, null, null, '', '3', 'Check Pass', null, null, '113', null, null, '');
INSERT INTO `metabase_table` VALUES ('12', '2017-06-22 10:46:28', '2017-06-25 14:18:29', 'city', '345', null, null, null, '', '3', 'City', null, null, '93', null, null, '');
INSERT INTO `metabase_table` VALUES ('13', '2017-06-22 10:46:29', '2017-06-25 14:18:30', 'client_msql_log', '122', null, null, null, '', '3', 'Client Ms Ql Log', null, null, '38', null, null, '');
INSERT INTO `metabase_table` VALUES ('14', '2017-06-22 10:46:30', '2017-06-25 14:18:30', 'dependency', '376', null, null, null, '', '3', 'Dependency', null, null, '103', null, null, '');
INSERT INTO `metabase_table` VALUES ('15', '2017-06-22 10:46:31', '2017-06-25 14:18:31', 'deptment', '5', null, null, null, '', '3', 'Dept Ment', null, null, '74', null, null, '');
INSERT INTO `metabase_table` VALUES ('16', '2017-06-22 10:46:31', '2017-06-25 14:18:32', 'dp_edit_wa', '3', null, null, null, '', '3', 'Dp Edit Wa', null, null, '57', null, null, '');
INSERT INTO `metabase_table` VALUES ('17', '2017-06-22 10:46:32', '2017-06-25 14:18:33', 'dp_edit_watype', '3', null, null, null, '', '3', 'Dp Edit Wa Type', null, null, '49', null, null, '');
INSERT INTO `metabase_table` VALUES ('18', '2017-06-22 10:46:33', '2017-06-25 14:18:33', 'dp_tuiguang_daydata', '0', null, null, null, '', '3', 'Dp Tui Guang Day Data', null, null, '105', null, null, '');
INSERT INTO `metabase_table` VALUES ('19', '2017-06-22 10:46:33', '2017-06-25 14:18:33', 'dp_tuiguang_mtbm', '0', null, null, null, '', '3', 'Dp Tui Guang Mt Bm', null, null, '77', null, null, '');
INSERT INTO `metabase_table` VALUES ('20', '2017-06-22 10:46:33', '2017-06-25 14:18:34', 'dp_tuiguang_plan', '0', null, null, null, '', '3', 'Dp Tui Guang Plan', null, null, '111', null, null, '');
INSERT INTO `metabase_table` VALUES ('21', '2017-06-22 10:46:34', '2017-06-25 14:18:34', 'dp_xiaoshou_daydata', '0', null, null, null, '', '3', 'Dp Xiao Shou Day Data', null, null, '36', null, null, '');
INSERT INTO `metabase_table` VALUES ('22', '2017-06-22 10:46:35', '2017-06-25 14:18:34', 'dp_xiaoshou_fssj', '0', null, null, null, '', '3', 'Dp Xiao Shou Fs Sj', null, null, '20', null, null, '');
INSERT INTO `metabase_table` VALUES ('23', '2017-06-22 10:46:36', '2017-06-25 14:18:35', 'dp_xiaoshou_jscj', '0', null, null, null, '', '3', 'Dp Xiao Shou Js Cj', null, null, '131', null, null, '');
INSERT INTO `metabase_table` VALUES ('24', '2017-06-22 10:46:37', '2017-06-25 14:18:35', 'dp_xiaoshou_khllsj', '0', null, null, null, '', '3', 'Dp Xiao Shou Kh Ll Sj', null, null, '42', null, null, '');
INSERT INTO `metabase_table` VALUES ('25', '2017-06-22 10:46:37', '2017-06-25 14:18:35', 'dp_xiaoshou_xssj', '0', null, null, null, '', '3', 'Dp Xiao Shou Xs Sj', null, null, '81', null, null, '');
INSERT INTO `metabase_table` VALUES ('26', '2017-06-22 10:46:38', '2017-06-25 14:18:35', 'dp_xiaoshou_zhanghao', '0', null, null, null, '', '3', 'Dp Xiao Shou Zhang Hao', null, null, '7', null, null, '');
INSERT INTO `metabase_table` VALUES ('27', '2017-06-22 10:46:38', '2017-06-25 14:18:35', 'dp_xiezuo_maindata', '0', null, null, null, '', '3', 'Dp Xie Zu O Main Data', null, null, '122', null, null, '');
INSERT INTO `metabase_table` VALUES ('28', '2017-06-22 10:46:39', '2017-06-25 14:18:36', 'fj', '46', null, null, null, '', '3', 'Fj', null, null, '59', null, null, '');
INSERT INTO `metabase_table` VALUES ('29', '2017-06-22 10:46:40', '2017-06-25 14:18:36', 'lita_reportdesigner_\n_datasource', '0', null, null, null, '', '3', 'Lita Report Designer Data Source', null, null, '87', null, null, '');
INSERT INTO `metabase_table` VALUES ('30', '2017-06-22 10:46:41', '2017-06-25 14:18:36', 'lita_reportdesigner_tabledependent', '35', null, null, null, '', '3', 'Lita Report Designer Table Dependent', null, null, '28', null, null, '');
INSERT INTO `metabase_table` VALUES ('31', '2017-06-22 10:46:41', '2017-06-25 14:18:37', 'loginandlogout', '0', null, null, null, '', '3', 'Login And Log Out', null, null, '48', null, null, '');
INSERT INTO `metabase_table` VALUES ('32', '2017-06-22 10:46:42', '2017-06-25 14:18:37', 'mtbm', '13', null, null, null, '', '3', 'Mt Bm', null, null, '91', null, null, '');
INSERT INTO `metabase_table` VALUES ('33', '2017-06-22 10:46:42', '2017-06-25 14:18:38', 'mtzh', '12', null, null, null, '', '3', 'Mt Zh', null, null, '37', null, null, '');
INSERT INTO `metabase_table` VALUES ('34', '2017-06-22 10:46:42', '2017-06-25 14:18:38', 'ofextcomponentconf', '0', null, null, null, '', '3', 'Of Ext Component Conf', null, null, '121', null, null, '');
INSERT INTO `metabase_table` VALUES ('35', '2017-06-22 10:46:43', '2017-06-25 14:18:39', 'offwork', '8', null, null, null, '', '3', 'Off Work', null, null, '40', null, null, '');
INSERT INTO `metabase_table` VALUES ('36', '2017-06-22 10:46:43', '2017-06-25 14:18:39', 'ofgroup', '0', null, null, null, '', '3', 'Of Group', null, null, '16', null, null, '');
INSERT INTO `metabase_table` VALUES ('37', '2017-06-22 10:46:44', '2017-06-25 14:18:40', 'ofgroupprop', '0', null, null, null, '', '3', 'Of Group Prop', null, null, '119', null, null, '');
INSERT INTO `metabase_table` VALUES ('38', '2017-06-22 10:46:44', '2017-06-25 14:18:40', 'ofgroupuser', '0', null, null, null, '', '3', 'Of Group User', null, null, '6', null, null, '');
INSERT INTO `metabase_table` VALUES ('39', '2017-06-22 10:46:44', '2017-06-25 14:18:40', 'ofid', '5', null, null, null, '', '3', 'Of ID', null, null, '66', null, null, '');
INSERT INTO `metabase_table` VALUES ('40', '2017-06-22 10:46:45', '2017-06-25 14:18:40', 'ofmucaffiliation', '0', null, null, null, '', '3', 'Of Muc Affiliation', null, null, '132', null, null, '');
INSERT INTO `metabase_table` VALUES ('41', '2017-06-22 10:46:45', '2017-06-25 14:18:40', 'ofmucconversationlog', '0', null, null, null, '', '3', 'Of Muc Conversation Log', null, null, '102', null, null, '');
INSERT INTO `metabase_table` VALUES ('42', '2017-06-22 10:46:46', '2017-06-25 14:18:41', 'ofmucmember', '0', null, null, null, '', '3', 'Of Muc Member', null, null, '65', null, null, '');
INSERT INTO `metabase_table` VALUES ('43', '2017-06-22 10:46:46', '2017-06-25 14:18:41', 'ofmucroom', '0', null, null, null, '', '3', 'Of Muc Room', null, null, '126', null, null, '');
INSERT INTO `metabase_table` VALUES ('44', '2017-06-22 10:46:49', '2017-06-25 14:18:42', 'ofmucroomprop', '0', null, null, null, '', '3', 'Of Muc Room Prop', null, null, '127', null, null, '');
INSERT INTO `metabase_table` VALUES ('45', '2017-06-22 10:46:49', '2017-06-25 14:18:42', 'ofmucservice', '1', null, null, null, '', '3', 'Of Muc Service', null, null, '11', null, null, '');
INSERT INTO `metabase_table` VALUES ('46', '2017-06-22 10:46:49', '2017-06-25 14:18:43', 'ofmucserviceprop', '0', null, null, null, '', '3', 'Of Muc Service Prop', null, null, '33', null, null, '');
INSERT INTO `metabase_table` VALUES ('47', '2017-06-22 10:46:50', '2017-06-25 14:18:43', 'ofoffline', '0', null, null, null, '', '3', 'Of Offline', null, null, '55', null, null, '');
INSERT INTO `metabase_table` VALUES ('48', '2017-06-22 10:46:50', '2017-06-25 14:18:43', 'ofpresence', '0', null, null, null, '', '3', 'Of Presence', null, null, '97', null, null, '');
INSERT INTO `metabase_table` VALUES ('49', '2017-06-22 10:46:50', '2017-06-25 14:18:43', 'ofprivacylist', '0', null, null, null, '', '3', 'Of Privacy List', null, null, '96', null, null, '');
INSERT INTO `metabase_table` VALUES ('50', '2017-06-22 10:46:51', '2017-06-25 14:18:43', 'ofprivate', '0', null, null, null, '', '3', 'Of Private', null, null, '14', null, null, '');
INSERT INTO `metabase_table` VALUES ('51', '2017-06-22 10:46:52', '2017-06-25 14:18:44', 'ofproperty', '31', null, null, null, '', '3', 'Of Property', null, null, '31', null, null, '');
INSERT INTO `metabase_table` VALUES ('52', '2017-06-22 10:46:52', '2017-06-25 14:18:44', 'ofpubsubaffiliation', '1', null, null, null, '', '3', 'Of Pub Sub Affiliation', null, null, '10', null, null, '');
INSERT INTO `metabase_table` VALUES ('53', '2017-06-22 10:46:52', '2017-06-25 14:18:45', 'ofpubsubdefaultconf', '2', null, null, null, '', '3', 'Of Pub Sub Default Conf', null, null, '68', null, null, '');
INSERT INTO `metabase_table` VALUES ('54', '2017-06-22 10:46:53', '2017-06-25 14:18:47', 'ofpubsubitem', '0', null, null, null, '', '3', 'Of Pub Sub Item', null, null, '110', null, null, '');
INSERT INTO `metabase_table` VALUES ('55', '2017-06-22 10:46:54', '2017-06-25 14:18:47', 'ofpubsubnode', '1', null, null, null, '', '3', 'Of Pub Sub Node', null, null, '34', null, null, '');
INSERT INTO `metabase_table` VALUES ('56', '2017-06-22 10:46:56', '2017-06-25 14:18:50', 'ofpubsubnodegroups', '0', null, null, null, '', '3', 'Of Pub Sub Node Groups', null, null, '44', null, null, '');
INSERT INTO `metabase_table` VALUES ('57', '2017-06-22 10:46:57', '2017-06-25 14:18:50', 'ofpubsubnodejids', '0', null, null, null, '', '3', 'Of Pub Sub Node Ji Ds', null, null, '69', null, null, '');
INSERT INTO `metabase_table` VALUES ('58', '2017-06-22 10:46:57', '2017-06-25 14:18:51', 'ofpubsubsubscription', '0', null, null, null, '', '3', 'Of Pub Sub Subscription', null, null, '19', null, null, '');
INSERT INTO `metabase_table` VALUES ('59', '2017-06-22 10:46:59', '2017-06-25 14:18:51', 'ofremoteserverconf', '0', null, null, null, '', '3', 'Of Remote Server Conf', null, null, '76', null, null, '');
INSERT INTO `metabase_table` VALUES ('60', '2017-06-22 10:46:59', '2017-06-25 14:18:51', 'ofroster', '0', null, null, null, '', '3', 'Of Roster', null, null, '70', null, null, '');
INSERT INTO `metabase_table` VALUES ('61', '2017-06-22 10:46:59', '2017-06-25 14:18:51', 'ofrostergroups', '0', null, null, null, '', '3', 'Of Roster Groups', null, null, '61', null, null, '');
INSERT INTO `metabase_table` VALUES ('62', '2017-06-22 10:47:00', '2017-06-25 14:18:51', 'ofsaslauthorized', '0', null, null, null, '', '3', 'Ofs Asl Authorized', null, null, '52', null, null, '');
INSERT INTO `metabase_table` VALUES ('63', '2017-06-22 10:47:00', '2017-06-25 14:18:52', 'ofsecurityauditlog', '1', null, null, null, '', '3', 'Of Security Audit Log', null, null, '104', null, null, '');
INSERT INTO `metabase_table` VALUES ('64', '2017-06-22 10:47:01', '2017-06-25 14:18:52', 'ofuser', '4', null, null, null, '', '3', 'Of User', null, null, '13', null, null, '');
INSERT INTO `metabase_table` VALUES ('65', '2017-06-22 10:47:01', '2017-06-25 14:18:53', 'ofuserflag', '0', null, null, null, '', '3', 'Of User Flag', null, null, '43', null, null, '');
INSERT INTO `metabase_table` VALUES ('66', '2017-06-22 10:47:02', '2017-06-25 14:18:53', 'ofuserprop', '0', null, null, null, '', '3', 'Of User Prop', null, null, '137', null, null, '');
INSERT INTO `metabase_table` VALUES ('67', '2017-06-22 10:47:02', '2017-06-25 14:18:54', 'ofvcard', '0', null, null, null, '', '3', 'Of Vcard', null, null, '95', null, null, '');
INSERT INTO `metabase_table` VALUES ('68', '2017-06-22 10:47:03', '2017-06-25 14:18:54', 'ofversion', '1', null, null, null, '', '3', 'Of Version', null, null, '94', null, null, '');
INSERT INTO `metabase_table` VALUES ('69', '2017-06-22 10:47:03', '2017-06-25 14:18:54', 'pizhu', '276', null, null, null, '', '3', 'Pi Zhu', null, null, '118', null, null, '');
INSERT INTO `metabase_table` VALUES ('70', '2017-06-22 10:47:03', '2017-06-25 14:18:55', 'proj_group', '37', null, null, null, '', '3', 'Pr Oj Group', null, null, '108', null, null, '');
INSERT INTO `metabase_table` VALUES ('71', '2017-06-22 10:47:04', '2017-06-25 14:18:57', 'project_filefolder', '34', null, null, null, '', '3', 'Project Filefolder', null, null, '101', null, null, '');
INSERT INTO `metabase_table` VALUES ('72', '2017-06-22 10:47:04', '2017-06-25 14:18:58', 'project_files', '55', null, null, null, '', '3', 'Project Files', null, null, '47', null, null, '');
INSERT INTO `metabase_table` VALUES ('73', '2017-06-22 10:47:05', '2017-06-25 14:18:59', 'projects', '40', null, null, null, '', '3', 'Projects', null, null, '78', null, null, '');
INSERT INTO `metabase_table` VALUES ('74', '2017-06-22 10:47:06', '2017-06-25 14:19:00', 'projgroup', '8', null, null, null, '', '3', 'Pr Oj Group', null, null, '25', null, null, '');
INSERT INTO `metabase_table` VALUES ('75', '2017-06-22 10:47:06', '2017-06-25 14:19:00', 'province', '34', null, null, null, '', '3', 'Province', null, null, '22', null, null, '');
INSERT INTO `metabase_table` VALUES ('76', '2017-06-22 10:47:07', '2017-06-25 14:19:00', 'region', '3144', null, null, null, '', '3', 'Region', null, null, '84', null, null, '');
INSERT INTO `metabase_table` VALUES ('77', '2017-06-22 10:47:07', '2017-06-25 14:19:01', 'resources', '0', null, null, null, '', '3', 'Resources', null, null, '128', null, null, '');
INSERT INTO `metabase_table` VALUES ('78', '2017-06-22 10:47:07', '2017-06-25 14:19:01', 'sys_code', '1', null, null, null, '', '3', 'Sys Code', null, null, '88', null, null, '');
INSERT INTO `metabase_table` VALUES ('79', '2017-06-22 10:47:08', '2017-06-25 14:19:02', 'sys_mempoint', '28', null, null, null, '', '3', 'Sys Mem Point', null, null, '116', null, null, '');
INSERT INTO `metabase_table` VALUES ('80', '2017-06-22 10:47:09', '2017-06-25 14:19:03', 'sys_module', '13', null, null, null, '', '3', 'Sys Module', null, null, '62', null, null, '');
INSERT INTO `metabase_table` VALUES ('81', '2017-06-22 10:47:10', '2017-06-25 14:19:04', 'sys_notify', '182', null, null, null, '', '3', 'Sys Notify', null, null, '120', null, null, '');
INSERT INTO `metabase_table` VALUES ('82', '2017-06-22 10:47:11', '2017-06-25 14:19:05', 'sys_param', '18', null, null, null, '', '3', 'Sys Param', null, null, '123', null, null, '');
INSERT INTO `metabase_table` VALUES ('83', '2017-06-22 10:47:11', '2017-06-25 14:19:06', 'sys_pointgift', '6', null, null, null, '', '3', 'Sys Point Gift', null, null, '72', null, null, '');
INSERT INTO `metabase_table` VALUES ('84', '2017-06-22 10:47:12', '2017-06-25 14:19:07', 'sys_pointlog', '53', null, null, null, '', '3', 'Sys Point Log', null, null, '29', null, null, '');
INSERT INTO `metabase_table` VALUES ('85', '2017-06-22 10:47:12', '2017-06-25 14:19:08', 'sys_role', '6', null, null, null, '', '3', 'Sys Role', null, null, '53', null, null, '');
INSERT INTO `metabase_table` VALUES ('86', '2017-06-22 10:47:13', '2017-06-25 14:19:08', 'sys_role_fun', '106', null, null, null, '', '3', 'Sys Role Fun', null, null, '115', null, null, '');
INSERT INTO `metabase_table` VALUES ('87', '2017-06-22 10:47:13', '2017-06-25 14:19:09', 'sys_sequence', '4', null, null, null, '', '3', 'Sys Sequence', null, null, '109', null, null, '');
INSERT INTO `metabase_table` VALUES ('88', '2017-06-22 10:47:14', '2017-06-25 14:19:09', 'sys_task_expinfo', '0', null, null, null, '', '3', 'Sys Task Exp Info', null, null, '83', null, null, '');
INSERT INTO `metabase_table` VALUES ('89', '2017-06-22 10:47:14', '2017-06-25 14:19:09', 'sys_user_gift_log', '3', null, null, null, '', '3', 'Sys User Gift Log', null, null, '99', null, null, '');
INSERT INTO `metabase_table` VALUES ('90', '2017-06-22 10:47:15', '2017-06-25 14:19:10', 'sys_user_role', '0', null, null, null, '', '3', 'Sys User Role', null, null, '86', null, null, '');
INSERT INTO `metabase_table` VALUES ('91', '2017-06-22 10:47:15', '2017-06-25 14:19:10', 'task', '468', null, null, null, '', '3', 'Task', null, null, '130', null, null, '');
INSERT INTO `metabase_table` VALUES ('92', '2017-06-22 10:47:18', '2017-06-25 14:19:13', 'task_biaoqian', '935', null, null, null, '', '3', 'Task Bia O Qian', null, null, '30', null, null, '');
INSERT INTO `metabase_table` VALUES ('93', '2017-06-22 10:47:19', '2017-06-25 14:19:14', 'task_copy', '439', null, null, null, '', '3', 'Task Copy', null, null, '8', null, null, '');
INSERT INTO `metabase_table` VALUES ('94', '2017-06-22 10:47:23', '2017-06-25 14:19:16', 'task_ispass', '187', null, null, null, '', '3', 'Task Is Pass', null, null, '12', null, null, '');
INSERT INTO `metabase_table` VALUES ('95', '2017-06-22 10:47:23', '2017-06-25 14:19:17', 'task_loop', '48', null, null, null, '', '3', 'Task Loop', null, null, '129', null, null, '');
INSERT INTO `metabase_table` VALUES ('96', '2017-06-22 10:47:24', '2017-06-25 14:19:18', 'tg_ggf', '19', null, null, null, '', '3', 'Tg Ggf', null, null, '58', null, null, '');
INSERT INTO `metabase_table` VALUES ('97', '2017-06-22 10:47:25', '2017-06-25 14:19:19', 'tg_proj', '7', null, null, null, '', '3', 'Tg Pr Oj', null, null, '98', null, null, '');
INSERT INTO `metabase_table` VALUES ('98', '2017-06-22 10:47:25', '2017-06-25 14:19:19', 'tgjihua', '19', null, null, null, '', '3', 'Tg Ji Hua', null, null, '75', null, null, '');
INSERT INTO `metabase_table` VALUES ('99', '2017-06-22 10:47:26', '2017-06-25 14:19:20', 'user_exp_info', '50', null, null, null, '', '3', 'User Exp Info', null, null, '125', null, null, '');
INSERT INTO `metabase_table` VALUES ('100', '2017-06-22 10:47:27', '2017-06-25 14:19:22', 'user_focus', '0', null, null, null, '', '3', 'User Focus', null, null, '117', null, null, '');
INSERT INTO `metabase_table` VALUES ('101', '2017-06-22 10:47:28', '2017-06-25 14:19:22', 'user_info', '52', null, null, null, '', '3', 'User Info', null, null, '21', null, null, '');
INSERT INTO `metabase_table` VALUES ('102', '2017-06-22 10:47:29', '2017-06-25 14:19:23', 'user_reply_info', '0', null, null, null, '', '3', 'User Reply Info', null, null, '50', null, null, '');
INSERT INTO `metabase_table` VALUES ('103', '2017-06-22 10:47:29', '2017-06-25 14:19:23', 'user_service_ceshiceshi', '0', null, null, null, '', '3', 'User Service Ce Sh Ice Shi', null, null, '56', null, null, '');
INSERT INTO `metabase_table` VALUES ('104', '2017-06-22 10:47:30', '2017-06-25 14:19:23', 'user_service_测试啊啊啊', '3', null, null, null, '', '3', 'User Service 测试啊啊啊', null, null, '79', null, null, '');
INSERT INTO `metabase_table` VALUES ('105', '2017-06-22 10:47:31', '2017-06-25 14:19:24', 'user_service_销售业绩', '1', null, null, null, '', '3', 'User Service 销售业绩', null, null, '106', null, null, '');
INSERT INTO `metabase_table` VALUES ('106', '2017-06-22 10:47:32', '2017-06-25 14:19:25', 'user_star_task', '1', null, null, null, '', '3', 'User Star Task', null, null, '15', null, null, '');
INSERT INTO `metabase_table` VALUES ('107', '2017-06-22 10:47:32', '2017-06-25 14:19:25', 'userfocus', '18', null, null, null, '', '3', 'User Focus', null, null, '124', null, null, '');
INSERT INTO `metabase_table` VALUES ('108', '2017-06-22 10:47:33', '2017-06-25 14:19:26', 'userservice', '4', null, null, null, '', '3', 'User Service', null, null, '135', null, null, '');
INSERT INTO `metabase_table` VALUES ('109', '2017-06-22 10:47:34', '2017-06-25 14:19:27', 'visit', '0', null, null, null, '', '3', 'Visit', null, null, '26', null, null, '');
INSERT INTO `metabase_table` VALUES ('110', '2017-06-22 10:47:34', '2017-06-25 14:19:27', 'visit_t', '1', null, null, null, '', '3', 'Visit T', null, null, '27', null, null, '');
INSERT INTO `metabase_table` VALUES ('111', '2017-06-22 10:47:34', '2017-06-25 14:19:28', 'wenan_list', '17', null, null, null, '', '3', 'Wen An List', null, null, '85', null, null, '');
INSERT INTO `metabase_table` VALUES ('112', '2017-06-22 10:47:35', '2017-06-25 14:19:28', 'wxb_channel', '12', null, null, null, '', '3', 'Wxb Channel', null, null, '41', null, null, '');
INSERT INTO `metabase_table` VALUES ('113', '2017-06-22 10:47:36', '2017-06-25 14:19:30', 'wxb_charge_log', '0', null, null, null, '', '3', 'Wxb Charge Log', null, null, '60', null, null, '');
INSERT INTO `metabase_table` VALUES ('114', '2017-06-22 10:47:36', '2017-06-25 14:19:30', 'wxb_customer', '3', null, null, null, '', '3', 'Wxb Customer', null, null, '51', null, null, '');
INSERT INTO `metabase_table` VALUES ('115', '2017-06-22 10:47:37', '2017-06-25 14:19:31', 'wxb_good', '62', null, null, null, '', '3', 'Wxb Good', null, null, '54', null, null, '');
INSERT INTO `metabase_table` VALUES ('116', '2017-06-22 10:47:40', '2017-06-25 14:19:34', 'wxb_good_copy', '270', null, null, null, '', '3', 'Wxb Good Copy', null, null, '82', null, null, '');
INSERT INTO `metabase_table` VALUES ('117', '2017-06-22 10:47:41', '2017-06-25 14:19:35', 'wxb_good_sku', '87', null, null, null, '', '3', 'Wxb Good Sk U', null, null, '45', null, null, '');
INSERT INTO `metabase_table` VALUES ('118', '2017-06-22 10:47:42', '2017-06-25 14:19:35', 'wxb_good_type', '6', null, null, null, '', '3', 'Wxb Good Type', null, null, '24', null, null, '');
INSERT INTO `metabase_table` VALUES ('119', '2017-06-22 10:47:42', '2017-06-25 14:19:36', 'wxb_login_log', '2517', null, null, null, '', '3', 'Wxb Login Log', null, null, '63', null, null, '');
INSERT INTO `metabase_table` VALUES ('120', '2017-06-22 10:47:43', '2017-06-25 14:19:37', 'wxb_memeber', '30', null, null, null, '', '3', 'Wxb Meme Ber', null, null, '92', null, null, '');
INSERT INTO `metabase_table` VALUES ('121', '2017-06-22 10:47:44', '2017-06-25 14:19:41', 'wxb_news', '4', null, null, null, '', '3', 'Wxb News', null, null, '35', null, null, '');
INSERT INTO `metabase_table` VALUES ('122', '2017-06-22 10:47:45', '2017-06-25 14:19:42', 'wxb_order', '73', null, null, null, '', '3', 'Wxb Order', null, null, '133', null, null, '');
INSERT INTO `metabase_table` VALUES ('123', '2017-06-22 10:47:48', '2017-06-25 14:19:44', 'wxb_order_count', '3', null, null, null, '', '3', 'Wxb Order Count', null, null, '89', null, null, '');
INSERT INTO `metabase_table` VALUES ('124', '2017-06-22 10:47:48', '2017-06-25 14:19:45', 'wxb_order_log', '80', null, null, null, '', '3', 'Wxb Order Log', null, null, '107', null, null, '');
INSERT INTO `metabase_table` VALUES ('125', '2017-06-22 10:47:49', '2017-06-25 14:19:45', 'wxb_pay_log', '1', null, null, null, '', '3', 'Wxb Pay Log', null, null, '80', null, null, '');
INSERT INTO `metabase_table` VALUES ('126', '2017-06-22 10:47:50', '2017-06-25 14:19:46', 'wxb_server_count', '3', null, null, null, '', '3', 'Wxb Server Count', null, null, '46', null, null, '');
INSERT INTO `metabase_table` VALUES ('127', '2017-06-22 10:47:51', '2017-06-25 14:19:47', 'wxb_server_log', '0', null, null, null, '', '3', 'Wxb Server Log', null, null, '114', null, null, '');
INSERT INTO `metabase_table` VALUES ('128', '2017-06-22 10:47:52', '2017-06-25 14:19:47', 'wxb_server_money', '0', null, null, null, '', '3', 'Wxb Server Money', null, null, '134', null, null, '');
INSERT INTO `metabase_table` VALUES ('129', '2017-06-22 10:47:53', '2017-06-25 14:19:47', 'wxb_spay_log', '0', null, null, null, '', '3', 'Wxb Spay Log', null, null, '17', null, null, '');
INSERT INTO `metabase_table` VALUES ('130', '2017-06-22 10:47:54', '2017-06-25 14:19:48', 'wxb_user_money', '6', null, null, null, '', '3', 'Wxb User Money', null, null, '90', null, null, '');
INSERT INTO `metabase_table` VALUES ('131', '2017-06-22 10:47:55', '2017-06-25 14:19:49', 'wxb_visit_log', '523', null, null, null, '', '3', 'Wxb Visit Log', null, null, '73', null, null, '');
INSERT INTO `metabase_table` VALUES ('132', '2017-06-22 10:47:55', '2017-06-25 14:19:49', 'wxb_wxdata', '1', null, null, null, '', '3', 'Wxb Wxdata', null, null, '18', null, null, '');
INSERT INTO `metabase_table` VALUES ('133', '2017-06-22 10:47:56', '2017-06-25 14:19:50', 'xiaoshou_cjsj', '22', null, null, null, '', '3', 'Xiao Shou Cj Sj', null, null, '136', null, null, '');
INSERT INTO `metabase_table` VALUES ('134', '2017-06-22 10:47:58', '2017-06-25 14:19:50', 'xiaoshou_xzfs', '13', null, null, null, '', '3', 'Xiao Shou X Zfs', null, null, '64', null, null, '');
INSERT INTO `metabase_table` VALUES ('135', '2017-06-22 10:47:58', '2017-06-25 14:19:51', 'zipcode', '3144', null, null, null, '', '3', 'Zip Code', null, null, '32', null, null, '');
INSERT INTO `metabase_table` VALUES ('136', '2017-06-22 10:47:59', '2017-06-25 14:19:51', 'zxbz', '0', null, null, null, '', '3', 'Zx Bz', null, null, '23', null, null, '');
INSERT INTO `metabase_table` VALUES ('224', '2017-06-22 10:59:31', '2017-06-22 10:59:38', 'ORDERS', '17624', 'This is a confirmed order for a product from a user.', null, null, '', '4', 'Orders', null, 'PUBLIC', '271', null, null, '');
INSERT INTO `metabase_table` VALUES ('225', '2017-06-22 10:59:31', '2017-06-22 10:59:39', 'PEOPLE', '2500', 'This is a user account. Note that employees and customer support staff will have accounts.', null, null, '', '4', 'People', null, 'PUBLIC', '272', null, null, '');
INSERT INTO `metabase_table` VALUES ('226', '2017-06-22 10:59:33', '2017-06-22 10:59:40', 'PRODUCTS', '200', 'This is our product catalog. It includes all products ever sold by the Sample Company.', null, null, '', '4', 'Products', null, 'PUBLIC', '270', null, null, '');
INSERT INTO `metabase_table` VALUES ('227', '2017-06-22 10:59:33', '2017-06-22 10:59:41', 'REVIEWS', '1078', 'These are reviews our customers have left on products. Note that these are not tied to orders so it is possible people have reviewed products they did not purchase from us.', null, null, '', '4', 'Reviews', null, 'PUBLIC', '274', null, null, '');
INSERT INTO `metabase_table` VALUES ('228', '2017-06-22 17:50:42', '2017-06-25 14:19:52', 'user_service_添加文案', '0', null, null, null, '', '3', 'User Service 添加文案', null, null, '275', null, null, '');
INSERT INTO `metabase_table` VALUES ('229', '2017-06-25 14:12:38', '2017-06-25 14:12:38', 'sys_service_test', null, null, null, null, '', '3', 'Sys Service Test', null, null, '276', null, null, '');
INSERT INTO `metabase_table` VALUES ('230', '2017-06-25 14:18:21', '2017-06-25 14:19:53', '宽表测试', '3', null, null, null, '', '3', '宽表测试', null, null, '277', null, null, '');
INSERT INTO `metabase_table` VALUES ('231', '2017-06-29 21:50:57', '2017-06-29 21:50:57', 'user_service_加客量', null, null, null, null, '', '3', 'User Service 加客量', null, null, '278', null, null, '');
INSERT INTO `metabase_table` VALUES ('232', '2017-06-29 21:50:57', '2017-06-29 21:50:57', 'user_service_当天咨询客户量', null, null, null, null, '', '3', 'User Service 当天咨询客户量', null, null, '280', null, null, '');
INSERT INTO `metabase_table` VALUES ('233', '2017-06-29 21:50:58', '2017-06-29 21:50:58', 'user_service_推广计划效果表', null, null, null, null, '', '3', 'User Service 推广计划效果表', null, null, '279', null, null, '');
INSERT INTO `metabase_table` VALUES ('234', '2017-06-29 21:50:59', '2017-06-29 21:50:59', 'user_service_推广计划表', null, null, null, null, '', '3', 'User Service 推广计划表', null, null, '281', null, null, '');
INSERT INTO `metabase_table` VALUES ('235', '2017-06-29 21:51:00', '2017-06-29 21:51:00', 'user_service_销售量', null, null, null, null, '', '3', 'User Service 销售量', null, null, '282', null, null, '');

-- ----------------------------
-- Table structure for `metric`
-- ----------------------------
DROP TABLE IF EXISTS `metric`;
CREATE TABLE `metric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `definition` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `points_of_interest` text COLLATE utf8_unicode_ci,
  `caveats` text COLLATE utf8_unicode_ci,
  `how_is_this_calculated` text COLLATE utf8_unicode_ci,
  `show_in_getting_started` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `idx_metric_creator_id` (`creator_id`),
  KEY `idx_metric_table_id` (`table_id`),
  KEY `idx_metric_show_in_getting_started` (`show_in_getting_started`),
  CONSTRAINT `fk_metric_ref_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `fk_metric_ref_table_id` FOREIGN KEY (`table_id`) REFERENCES `metabase_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of metric
-- ----------------------------

-- ----------------------------
-- Table structure for `metric_important_field`
-- ----------------------------
DROP TABLE IF EXISTS `metric_important_field`;
CREATE TABLE `metric_important_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metric_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_metric_important_field_metric_id_field_id` (`metric_id`,`field_id`),
  KEY `idx_metric_important_field_metric_id` (`metric_id`),
  KEY `idx_metric_important_field_field_id` (`field_id`),
  CONSTRAINT `fk_metric_important_field_metabase_field_id` FOREIGN KEY (`field_id`) REFERENCES `metabase_field` (`id`),
  CONSTRAINT `fk_metric_important_field_metric_id` FOREIGN KEY (`metric_id`) REFERENCES `metric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of metric_important_field
-- ----------------------------

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`object`),
  KEY `idx_permissions_group_id` (`group_id`),
  KEY `idx_permissions_object` (`object`),
  KEY `idx_permissions_group_id_object` (`object`),
  CONSTRAINT `fk_permissions_group_id` FOREIGN KEY (`group_id`) REFERENCES `permissions_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '/', '2');
INSERT INTO `permissions` VALUES ('7', '/db/3/', '3');
INSERT INTO `permissions` VALUES ('9', '/db/4/', '3');
INSERT INTO `permissions` VALUES ('10', '/db/3/schema//table/105/', '4');

-- ----------------------------
-- Table structure for `permissions_group`
-- ----------------------------
DROP TABLE IF EXISTS `permissions_group`;
CREATE TABLE `permissions_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_permissions_group_name` (`name`),
  KEY `idx_permissions_group_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions_group
-- ----------------------------
INSERT INTO `permissions_group` VALUES ('2', 'Administrators');
INSERT INTO `permissions_group` VALUES ('1', 'All Users');
INSERT INTO `permissions_group` VALUES ('3', 'MetaBot');
INSERT INTO `permissions_group` VALUES ('5', '文案');
INSERT INTO `permissions_group` VALUES ('4', '销售');

-- ----------------------------
-- Table structure for `permissions_group_membership`
-- ----------------------------
DROP TABLE IF EXISTS `permissions_group_membership`;
CREATE TABLE `permissions_group_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_permissions_group_membership_user_id_group_id` (`user_id`,`group_id`),
  KEY `idx_permissions_group_membership_group_id` (`group_id`),
  KEY `idx_permissions_group_membership_user_id` (`user_id`),
  KEY `idx_permissions_group_membership_group_id_user_id` (`user_id`),
  CONSTRAINT `fk_permissions_group_group_id` FOREIGN KEY (`group_id`) REFERENCES `permissions_group` (`id`),
  CONSTRAINT `fk_permissions_group_membership_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions_group_membership
-- ----------------------------
INSERT INTO `permissions_group_membership` VALUES ('1', '1', '1');
INSERT INTO `permissions_group_membership` VALUES ('2', '1', '2');
INSERT INTO `permissions_group_membership` VALUES ('3', '2', '1');
INSERT INTO `permissions_group_membership` VALUES ('4', '2', '4');

-- ----------------------------
-- Table structure for `permissions_revision`
-- ----------------------------
DROP TABLE IF EXISTS `permissions_revision`;
CREATE TABLE `permissions_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `before` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Serialized JSON of the permissions before the changes.',
  `after` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Serialized JSON of the permissions after the changes.',
  `user_id` int(11) NOT NULL COMMENT 'The ID of the admin who made this set of changes.',
  `created_at` datetime NOT NULL COMMENT 'The timestamp of when these changes were made.',
  `remark` text COLLATE utf8_unicode_ci COMMENT 'Optional remarks explaining why these changes were made.',
  PRIMARY KEY (`id`),
  KEY `fk_permissions_revision_user_id` (`user_id`),
  CONSTRAINT `fk_permissions_revision_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used to keep track of changes made to permissions.';

-- ----------------------------
-- Records of permissions_revision
-- ----------------------------
INSERT INTO `permissions_revision` VALUES ('1', '{\"4\":{\"3\":{\"schemas\":\"none\"}}}', '{\"4\":{\"3\":{\"schemas\":{\"\":{\"121\":\"none\",\"65\":\"none\",\"70\":\"none\",\"62\":\"none\",\"74\":\"none\",\"110\":\"none\",\"130\":\"none\",\"128\":\"none\",\"7\":\"none\",\"59\":\"none\",\"86\":\"none\",\"20\":\"none\",\"72\":\"none\",\"58\":\"none\",\"60\":\"none\",\"27\":\"none\",\"69\":\"none\",\"101\":\"none\",\"24\":\"none\",\"102\":\"none\",\"135\":\"none\",\"55\":\"none\",\"85\":\"none\",\"39\":\"none\",\"88\":\"none\",\"46\":\"none\",\"77\":\"none\",\"106\":\"none\",\"119\":\"none\",\"95\":\"none\",\"54\":\"none\",\"92\":\"none\",\"104\":\"none\",\"15\":\"none\",\"48\":\"none\",\"50\":\"none\",\"116\":\"none\",\"75\":\"none\",\"99\":\"none\",\"21\":\"none\",\"31\":\"none\",\"113\":\"none\",\"32\":\"none\",\"136\":\"none\",\"40\":\"none\",\"129\":\"none\",\"91\":\"none\",\"117\":\"none\",\"108\":\"none\",\"56\":\"none\",\"33\":\"none\",\"13\":\"none\",\"22\":\"none\",\"90\":\"none\",\"109\":\"none\",\"36\":\"none\",\"41\":\"none\",\"118\":\"none\",\"89\":\"none\",\"100\":\"none\",\"131\":\"none\",\"122\":\"none\",\"43\":\"none\",\"61\":\"none\",\"29\":\"none\",\"44\":\"none\",\"93\":\"none\",\"6\":\"none\",\"111\":\"none\",\"28\":\"none\",\"134\":\"none\",\"64\":\"none\",\"103\":\"none\",\"51\":\"none\",\"25\":\"none\",\"34\":\"none\",\"125\":\"none\",\"17\":\"none\",\"12\":\"none\",\"66\":\"none\",\"107\":\"none\",\"23\":\"none\",\"47\":\"none\",\"35\":\"none\",\"127\":\"none\",\"82\":\"none\",\"76\":\"none\",\"97\":\"none\",\"19\":\"none\",\"57\":\"none\",\"68\":\"none\",\"11\":\"none\",\"115\":\"none\",\"9\":\"none\",\"5\":\"none\",\"112\":\"none\",\"83\":\"none\",\"14\":\"none\",\"45\":\"none\",\"53\":\"none\",\"78\":\"none\",\"132\":\"none\",\"26\":\"none\",\"123\":\"none\",\"16\":\"none\",\"133\":\"none\",\"81\":\"none\",\"120\":\"none\",\"79\":\"none\",\"38\":\"none\",\"126\":\"none\",\"98\":\"none\",\"124\":\"none\",\"87\":\"none\",\"30\":\"none\",\"73\":\"none\",\"96\":\"none\",\"10\":\"none\",\"18\":\"none\",\"105\":\"all\",\"52\":\"none\",\"114\":\"none\",\"67\":\"none\",\"71\":\"none\",\"42\":\"none\",\"80\":\"none\",\"37\":\"none\",\"63\":\"none\",\"94\":\"none\",\"8\":\"none\",\"49\":\"none\",\"84\":\"none\"}}}}}', '1', '2017-06-22 11:17:44', null);
INSERT INTO `permissions_revision` VALUES ('2', '{\"1\":{\"4\":{\"schemas\":\"all\",\"native\":\"write\"},\"3\":{\"schemas\":\"all\",\"native\":\"write\"}}}', '{\"1\":{\"4\":{\"schemas\":\"none\",\"native\":\"none\"},\"3\":{\"schemas\":\"none\",\"native\":\"none\"}}}', '1', '2017-06-22 11:28:13', null);

-- ----------------------------
-- Table structure for `pulse`
-- ----------------------------
DROP TABLE IF EXISTS `pulse`;
CREATE TABLE `pulse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `skip_if_empty` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Skip a scheduled Pulse if none of its questions have any results',
  PRIMARY KEY (`id`),
  KEY `idx_pulse_creator_id` (`creator_id`),
  CONSTRAINT `fk_pulse_ref_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pulse
-- ----------------------------

-- ----------------------------
-- Table structure for `pulse_card`
-- ----------------------------
DROP TABLE IF EXISTS `pulse_card`;
CREATE TABLE `pulse_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pulse_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pulse_card_pulse_id` (`pulse_id`),
  KEY `idx_pulse_card_card_id` (`card_id`),
  CONSTRAINT `fk_pulse_card_ref_card_id` FOREIGN KEY (`card_id`) REFERENCES `report_card` (`id`),
  CONSTRAINT `fk_pulse_card_ref_pulse_id` FOREIGN KEY (`pulse_id`) REFERENCES `pulse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pulse_card
-- ----------------------------

-- ----------------------------
-- Table structure for `pulse_channel`
-- ----------------------------
DROP TABLE IF EXISTS `pulse_channel`;
CREATE TABLE `pulse_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pulse_id` int(11) NOT NULL,
  `channel_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `schedule_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `schedule_hour` int(11) DEFAULT NULL,
  `schedule_day` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `schedule_frame` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `idx_pulse_channel_pulse_id` (`pulse_id`),
  KEY `idx_pulse_channel_schedule_type` (`schedule_type`),
  CONSTRAINT `fk_pulse_channel_ref_pulse_id` FOREIGN KEY (`pulse_id`) REFERENCES `pulse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pulse_channel
-- ----------------------------

-- ----------------------------
-- Table structure for `pulse_channel_recipient`
-- ----------------------------
DROP TABLE IF EXISTS `pulse_channel_recipient`;
CREATE TABLE `pulse_channel_recipient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pulse_channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pulse_channel_recipient_ref_user_id` (`user_id`),
  KEY `fk_pulse_channel_recipient_ref_pulse_channel_id` (`pulse_channel_id`),
  CONSTRAINT `fk_pulse_channel_recipient_ref_pulse_channel_id` FOREIGN KEY (`pulse_channel_id`) REFERENCES `pulse_channel` (`id`),
  CONSTRAINT `fk_pulse_channel_recipient_ref_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pulse_channel_recipient
-- ----------------------------

-- ----------------------------
-- Table structure for `query`
-- ----------------------------
DROP TABLE IF EXISTS `query`;
CREATE TABLE `query` (
  `query_hash` binary(32) NOT NULL,
  `average_execution_time` int(11) NOT NULL COMMENT 'Average execution time for the query, round to nearest number of milliseconds. This is updated as a rolling average.',
  PRIMARY KEY (`query_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information (such as average execution time) for different queries that have been previously ran.';

-- ----------------------------
-- Records of query
-- ----------------------------
INSERT INTO `query` VALUES (0x0B173182517786BCA2CD1FA79555BB39469443F477E0E11C8BFA8A31BBCF037A, '51');
INSERT INTO `query` VALUES (0x0C358374F48C6BE5F1D773180BA95008B870C51E2A7BF31F58DF1FF797BE0C38, '188');
INSERT INTO `query` VALUES (0x0DED70665CBE365724347A234B02E6AFF0A1A02524182C4199409B9F68420C87, '45');
INSERT INTO `query` VALUES (0x10E0CB3E68ACB8A811C47A9D6B641D1CA8B216E06C59267D7B576F0A62A8D832, '104');
INSERT INTO `query` VALUES (0x1952EEB9CFFEB4F6FA80E763F00B376D93655F00AFFF8A78550A2C550984247D, '503');
INSERT INTO `query` VALUES (0x19B6D8CE37B156823AC60C03FA0A59363C30E6D89C7F4548FCF5732F49320F63, '190');
INSERT INTO `query` VALUES (0x1D0EB7F8AE901CD4D71B500A9AA886B9C6B01D3F911BE52E1A7CCE43DAE89236, '84');
INSERT INTO `query` VALUES (0x2656C31EF93C00D2B4ECBE3DE4AC29F839C83E368C427AA8F6F5BFDA67AD9A13, '335');
INSERT INTO `query` VALUES (0x2A138AA200EAC984272A4DBC6ECBFBEB2DA8B67BCAAB498941D60FCBE976F44E, '179');
INSERT INTO `query` VALUES (0x2E7DB76525E5AC7C840DAB93E803D1E29777EB2C29AC43280BC3D05B70676ECB, '87');
INSERT INTO `query` VALUES (0x3068C5D926E7AA0D9B2C61F63AA20B1A2387695858A6D0AA9BC7617C8DFE4612, '86');
INSERT INTO `query` VALUES (0x35E340EADBFE778D4E9C8C3023674EABFF6F7B1072C1BA00870CFB086EF489F5, '63');
INSERT INTO `query` VALUES (0x35E891CC709F28DAFD36658ABBE2F2DB06D09F9CEA613F7B9246A75BB7E9D137, '51');
INSERT INTO `query` VALUES (0x474D826C96A093FF4F7FDC5BCC617659A46CC86B947B8FAA8C0478DEC6C0A1FE, '82');
INSERT INTO `query` VALUES (0x53F16FD491ED7CA76D36B8BDD153F27439DBA15AB4B99C03909DD59ED4D89C27, '53');
INSERT INTO `query` VALUES (0x669103E83ACE7DD59FA6E24E02E6D6C0AAA9BA0CD40C95E12254877793AE78A4, '80');
INSERT INTO `query` VALUES (0x6A2409FBB466387F6FD1CB750DBF6E2D6E16841284DDD88C9363DD448B6F51DE, '284');
INSERT INTO `query` VALUES (0x6C394C6935D1DB67507844A093978A2FE60C47199FEF908917817786B946CF0E, '357');
INSERT INTO `query` VALUES (0x72CD2BB8A43F96B6375A5D947389AB399DDD98EB3E4284F9F27E108EEBE07DC8, '56');
INSERT INTO `query` VALUES (0x77D9D91DCB1944C1C13E81C7C7DEFE3C9829F935659779101E781384F12FEDE0, '70');
INSERT INTO `query` VALUES (0x7876F4F817AFAC8AF9377638D7B7FBBABC34EFB7B72620DF2B57E2178EC04738, '75');
INSERT INTO `query` VALUES (0x7DA64515CB9376C733092EB082D9D806890DF932E0A1523739E0DA71BA8FE5E9, '29');
INSERT INTO `query` VALUES (0x8110AA82A6BDD38446AC3EEAC9DA3EF078E1471A16263A82BC561A901272153B, '203');
INSERT INTO `query` VALUES (0x81C8872B9DF7E7CE842BFF972C2AD480DEF3AF3D38C527589DF3F70D34FEA037, '29');
INSERT INTO `query` VALUES (0x83E7A9DD382B0220EC198D18407813B4F94E9C2A5B01F55A090E6069B5EA0C27, '43');
INSERT INTO `query` VALUES (0x8910C02FF5795D72BC624ABAFB0AE4DD80E3083CFE79018DC237D2BD0A24AE14, '190');
INSERT INTO `query` VALUES (0x8A6026B13D787F2B8AAD5309A460D6287CEF436DA862D61B60CF5AE99F7FE69A, '60');
INSERT INTO `query` VALUES (0x942673AEAF08B8CC9E52CBE8D77BA21437A7ADE96E4C4433D54A0A07FF3CA86C, '63');
INSERT INTO `query` VALUES (0x995F86269056F90F65D88DF74118D83D3049E3F0EDA942D2BA2D5D84ECB9F502, '73');
INSERT INTO `query` VALUES (0x9C28A0F74FE660195514C423BC44DB6BB446C27E03861D866A8024C7AA9FFA4B, '61');
INSERT INTO `query` VALUES (0x9C4554EAA90FBDE5D5734673C52D95AF5A49E61577F78165C49D235EA0303CEA, '27');
INSERT INTO `query` VALUES (0x9E88528DCFC848073A410828E7F0F76222926D26B87C8DD8F0D4C61B966C77C4, '171');
INSERT INTO `query` VALUES (0xA0164BE0B8FE62E8FAA8EF222090DEB0FF6F02D7D769B1F58BE20017E28A5B4E, '259');
INSERT INTO `query` VALUES (0xA0C38B67433F97C0B94BDB42B5314DF90751B762BB16A35DECE41472C09BAFAC, '57');
INSERT INTO `query` VALUES (0xB19FFF4F8049057E0C9B75A3C4E2CA9E4D55865F42345788080A2795AC037573, '213');
INSERT INTO `query` VALUES (0xB49062BB0DA58803DF523EEE0E0AC06BBAFDCE4C8C3C54F04BF323A7D91E29E2, '219');
INSERT INTO `query` VALUES (0xB6D904FAA9D7C01C68F4D8369C44B6CA26B4741B87E10E3523E4C442B9608EB2, '240');
INSERT INTO `query` VALUES (0xB73B00DF1EC96ADFB219086E226EB9130B78677416D035D80FF564956089FD60, '37');
INSERT INTO `query` VALUES (0xB81A492FB74616E22254909E8126562CE4BCD7A2F9F310A96D1ED4EAFF552F07, '1038');
INSERT INTO `query` VALUES (0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '138');
INSERT INTO `query` VALUES (0xBF0741EB182D378B24E1F9B1EADD5B85A3709461C223C652F5502E6C9DC08A75, '58');
INSERT INTO `query` VALUES (0xBF1A1224C6DACC197713672EC52ADCE037041DA3E72FFD31281DB60B4FEED1A4, '215');
INSERT INTO `query` VALUES (0xC33DB594771B2FACC2D0E4D170FFDA2515737FDFEB0B869CF5A9F86A80E7A88B, '137');
INSERT INTO `query` VALUES (0xCCDEBDECA9F97EF0B5F5DC49B143FAB15524F2D8636C7974C5F3FE715123E4EE, '98');
INSERT INTO `query` VALUES (0xD02353ABD3AE99F911DE6D89CE08B6AF95F2EA33CB4F52E9616A29A27391F85E, '739');
INSERT INTO `query` VALUES (0xD07AEFD9692FE6A064F34AFCA234B1BDFDC7AA140076B1853B51BB81A9018901, '51');
INSERT INTO `query` VALUES (0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '322');
INSERT INTO `query` VALUES (0xD3B3C733FEB998C08807B446A5FCDE4DD315E61F3A68C86CA49434F6EABD48B7, '209');
INSERT INTO `query` VALUES (0xD66174E6657BD196024F8FB72E40FC2AFFE26793CABE24B7D5E98AAB3257E38A, '35');
INSERT INTO `query` VALUES (0xE25B04836BDE5B77AEB1ABB50203BBE39D90C7BD29BDE8C30B2EA95AB629E895, '200');
INSERT INTO `query` VALUES (0xE833F5F045F3B3EA5FE4A5B92A2E79D78C7BB0D583E4D2FF7B6656B2AA5A641E, '98');
INSERT INTO `query` VALUES (0xF11591F04FA60DE43FF2199AE97E3CB2D172413CFF701E9FB8F640BEB4B0B75C, '161');
INSERT INTO `query` VALUES (0xF407588ED2E2F2E6761972B7995F53AE979C030CFBAB9A770FB9F29E99BB4353, '38');
INSERT INTO `query` VALUES (0xF77A4F61743F3A7153E956BEEA8E599C2C6F6C9C2BE6945FD62FD0C8B15B2FD6, '189');
INSERT INTO `query` VALUES (0xF7E395ED5952A8D1192B8F8C5F038B74F8342961EA3DF8EFC948ACE8DC5A0E3F, '152');

-- ----------------------------
-- Table structure for `query_cache`
-- ----------------------------
DROP TABLE IF EXISTS `query_cache`;
CREATE TABLE `query_cache` (
  `query_hash` binary(32) NOT NULL,
  `updated_at` datetime NOT NULL COMMENT 'The timestamp of when these query results were last refreshed.',
  `results` blob NOT NULL COMMENT 'Cached, compressed results of running the query with the given hash.',
  PRIMARY KEY (`query_hash`),
  KEY `idx_query_cache_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cached results of queries are stored here when using the DB-based query cache.';

-- ----------------------------
-- Records of query_cache
-- ----------------------------

-- ----------------------------
-- Table structure for `query_execution`
-- ----------------------------
DROP TABLE IF EXISTS `query_execution`;
CREATE TABLE `query_execution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` binary(32) NOT NULL COMMENT 'The hash of the query dictionary. This is a 256-bit SHA3 hash of the query.',
  `started_at` datetime NOT NULL COMMENT 'Timestamp of when this query started running.',
  `running_time` int(11) NOT NULL COMMENT 'The time, in milliseconds, this query took to complete.',
  `result_rows` int(11) NOT NULL COMMENT 'Number of rows in the query results.',
  `native` bit(1) NOT NULL COMMENT 'Whether the query was a native query, as opposed to an MBQL one (e.g., created with the GUI).',
  `context` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Short string specifying how this query was executed, e.g. in a Dashboard or Pulse.',
  `error` text COLLATE utf8_unicode_ci COMMENT 'Error message returned by failed query, if any.',
  `executor_id` int(11) DEFAULT NULL COMMENT 'The ID of the User who triggered this query execution, if any.',
  `card_id` int(11) DEFAULT NULL COMMENT 'The ID of the Card (Question) associated with this query execution, if any.',
  `dashboard_id` int(11) DEFAULT NULL COMMENT 'The ID of the Dashboard associated with this query execution, if any.',
  `pulse_id` int(11) DEFAULT NULL COMMENT 'The ID of the Pulse associated with this query execution, if any.',
  PRIMARY KEY (`id`),
  KEY `idx_query_execution_started_at` (`started_at`),
  KEY `idx_query_execution_query_hash_started_at` (`started_at`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A log of executed queries, used for calculating historic execution times, auditing, and other purposes.';

-- ----------------------------
-- Records of query_execution
-- ----------------------------
INSERT INTO `query_execution` VALUES ('1', 0x1952EEB9CFFEB4F6FA80E763F00B376D93655F00AFFF8A78550A2C550984247D, '2017-06-22 00:18:17', '503', '0', '', 'ad-hoc', 'No implementation of method: :formatted of protocol: #\'metabase.driver.generic-sql.query-processor/IGenericSQLFormattable found for class: metabase.query_processor.interface.Field', '1', null, null, null);
INSERT INTO `query_execution` VALUES ('2', 0x6A2409FBB466387F6FD1CB750DBF6E2D6E16841284DDD88C9363DD448B6F51DE, '2017-06-22 00:26:56', '284', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('3', 0x6C394C6935D1DB67507844A093978A2FE60C47199FEF908917817786B946CF0E, '2017-06-22 11:00:31', '383', '2000', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('4', 0x6C394C6935D1DB67507844A093978A2FE60C47199FEF908917817786B946CF0E, '2017-06-22 11:00:39', '125', '2000', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('5', 0xF11591F04FA60DE43FF2199AE97E3CB2D172413CFF701E9FB8F640BEB4B0B75C, '2017-06-22 11:01:33', '161', '200', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('6', 0x2E7DB76525E5AC7C840DAB93E803D1E29777EB2C29AC43280BC3D05B70676ECB, '2017-06-22 11:01:59', '89', '345', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('7', 0xF77A4F61743F3A7153E956BEEA8E599C2C6F6C9C2BE6945FD62FD0C8B15B2FD6, '2017-06-22 11:26:56', '189', '9', '', 'ad-hoc', null, '2', null, null, null);
INSERT INTO `query_execution` VALUES ('8', 0x2656C31EF93C00D2B4ECBE3DE4AC29F839C83E368C427AA8F6F5BFDA67AD9A13, '2017-06-22 11:27:32', '350', '0', '', 'ad-hoc', null, '2', null, null, null);
INSERT INTO `query_execution` VALUES ('9', 0x2E7DB76525E5AC7C840DAB93E803D1E29777EB2C29AC43280BC3D05B70676ECB, '2017-06-22 11:27:38', '66', '345', '', 'ad-hoc', null, '2', null, null, null);
INSERT INTO `query_execution` VALUES ('10', 0xE833F5F045F3B3EA5FE4A5B92A2E79D78C7BB0D583E4D2FF7B6656B2AA5A641E, '2017-06-22 11:27:45', '98', '0', '', 'ad-hoc', null, '2', null, null, null);
INSERT INTO `query_execution` VALUES ('11', 0x9E88528DCFC848073A410828E7F0F76222926D26B87C8DD8F0D4C61B966C77C4, '2017-06-22 11:27:51', '166', '4', '', 'ad-hoc', null, '2', null, null, null);
INSERT INTO `query_execution` VALUES ('12', 0x2656C31EF93C00D2B4ECBE3DE4AC29F839C83E368C427AA8F6F5BFDA67AD9A13, '2017-06-22 11:28:41', '199', '0', '', 'ad-hoc', 'You do not have permissions to run queries referencing table \'assignment\'.', '2', null, null, null);
INSERT INTO `query_execution` VALUES ('13', 0x9E88528DCFC848073A410828E7F0F76222926D26B87C8DD8F0D4C61B966C77C4, '2017-06-22 11:28:49', '219', '0', '', 'ad-hoc', 'You do not have permissions to run queries referencing table \'ofuser\'.', '2', null, null, null);
INSERT INTO `query_execution` VALUES ('14', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:37:50', '586', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('15', 0xCCDEBDECA9F97EF0B5F5DC49B143FAB15524F2D8636C7974C5F3FE715123E4EE, '2017-06-22 11:43:03', '98', '1', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('16', 0x83E7A9DD382B0220EC198D18407813B4F94E9C2A5B01F55A090E6069B5EA0C27, '2017-06-22 11:43:19', '43', '1', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('17', 0x995F86269056F90F65D88DF74118D83D3049E3F0EDA942D2BA2D5D84ECB9F502, '2017-06-22 11:43:24', '73', '1', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('18', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:43:53', '197', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('19', 0xA0C38B67433F97C0B94BDB42B5314DF90751B762BB16A35DECE41472C09BAFAC, '2017-06-22 11:44:10', '57', '30', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('20', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:44:13', '203', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('21', 0x10E0CB3E68ACB8A811C47A9D6B641D1CA8B216E06C59267D7B576F0A62A8D832, '2017-06-22 11:44:18', '107', '2', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('22', 0x10E0CB3E68ACB8A811C47A9D6B641D1CA8B216E06C59267D7B576F0A62A8D832, '2017-06-22 11:44:24', '81', '2', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('23', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:44:28', '213', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('24', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:46:55', '246', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('25', 0x72CD2BB8A43F96B6375A5D947389AB399DDD98EB3E4284F9F27E108EEBE07DC8, '2017-06-22 11:49:57', '56', '13', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('26', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:50:19', '1218', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('27', 0xC33DB594771B2FACC2D0E4D170FFDA2515737FDFEB0B869CF5A9F86A80E7A88B, '2017-06-22 11:50:29', '164', '9', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('28', 0xB81A492FB74616E22254909E8126562CE4BCD7A2F9F310A96D1ED4EAFF552F07, '2017-06-22 11:50:42', '1038', '269', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('29', 0xC33DB594771B2FACC2D0E4D170FFDA2515737FDFEB0B869CF5A9F86A80E7A88B, '2017-06-22 11:50:47', '60', '9', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('30', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:50:49', '253', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('31', 0x53F16FD491ED7CA76D36B8BDD153F27439DBA15AB4B99C03909DD59ED4D89C27, '2017-06-22 11:50:55', '53', '1', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('32', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:50:57', '201', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('33', 0x0DED70665CBE365724347A234B02E6AFF0A1A02524182C4199409B9F68420C87, '2017-06-22 11:51:00', '45', '1', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('34', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:51:02', '236', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('35', 0x35E340EADBFE778D4E9C8C3023674EABFF6F7B1072C1BA00870CFB086EF489F5, '2017-06-22 11:51:07', '63', '2', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('36', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:51:09', '230', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('37', 0x35E891CC709F28DAFD36658ABBE2F2DB06D09F9CEA613F7B9246A75BB7E9D137, '2017-06-22 11:51:23', '51', '160', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('38', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:51:32', '235', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('39', 0xC33DB594771B2FACC2D0E4D170FFDA2515737FDFEB0B869CF5A9F86A80E7A88B, '2017-06-22 11:51:37', '61', '9', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('40', 0x474D826C96A093FF4F7FDC5BCC617659A46CC86B947B8FAA8C0478DEC6C0A1FE, '2017-06-22 11:51:59', '82', '84', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('41', 0xC33DB594771B2FACC2D0E4D170FFDA2515737FDFEB0B869CF5A9F86A80E7A88B, '2017-06-22 11:52:05', '61', '9', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('42', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:52:06', '266', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('43', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:52:07', '199', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('44', 0x8A6026B13D787F2B8AAD5309A460D6287CEF436DA862D61B60CF5AE99F7FE69A, '2017-06-22 11:52:18', '60', '9', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('45', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:52:33', '273', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('46', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:52:34', '257', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('47', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:52:35', '196', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('48', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 11:53:33', '256', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('49', 0xA0164BE0B8FE62E8FAA8EF222090DEB0FF6F02D7D769B1F58BE20017E28A5B4E, '2017-06-22 11:54:31', '259', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('50', 0xD3B3C733FEB998C08807B446A5FCDE4DD315E61F3A68C86CA49434F6EABD48B7, '2017-06-22 11:55:37', '209', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('51', 0xB49062BB0DA58803DF523EEE0E0AC06BBAFDCE4C8C3C54F04BF323A7D91E29E2, '2017-06-22 11:59:12', '219', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('52', 0xBF1A1224C6DACC197713672EC52ADCE037041DA3E72FFD31281DB60B4FEED1A4, '2017-06-22 11:59:56', '212', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('53', 0xE25B04836BDE5B77AEB1ABB50203BBE39D90C7BD29BDE8C30B2EA95AB629E895, '2017-06-22 12:02:52', '200', '18', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('54', 0xBF1A1224C6DACC197713672EC52ADCE037041DA3E72FFD31281DB60B4FEED1A4, '2017-06-22 12:03:03', '238', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('55', 0x8110AA82A6BDD38446AC3EEAC9DA3EF078E1471A16263A82BC561A901272153B, '2017-06-22 12:03:44', '203', '7', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('56', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 12:04:18', '190', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('57', 0x0C358374F48C6BE5F1D773180BA95008B870C51E2A7BF31F58DF1FF797BE0C38, '2017-06-22 12:04:26', '188', '1', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('58', 0x19B6D8CE37B156823AC60C03FA0A59363C30E6D89C7F4548FCF5732F49320F63, '2017-06-22 12:04:32', '190', '10', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('59', 0x8910C02FF5795D72BC624ABAFB0AE4DD80E3083CFE79018DC237D2BD0A24AE14, '2017-06-22 12:05:34', '190', '10', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('60', 0xB6D904FAA9D7C01C68F4D8369C44B6CA26B4741B87E10E3523E4C442B9608EB2, '2017-06-22 12:06:57', '240', '0', '', 'ad-hoc', 'You have an error in your SQL syntax', '1', null, null, null);
INSERT INTO `query_execution` VALUES ('61', 0x669103E83ACE7DD59FA6E24E02E6D6C0AAA9BA0CD40C95E12254877793AE78A4, '2017-06-22 12:07:24', '80', '1', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('62', 0xF7E395ED5952A8D1192B8F8C5F038B74F8342961EA3DF8EFC948ACE8DC5A0E3F, '2017-06-22 12:08:32', '153', '0', '', 'ad-hoc', '\'name\' is a required param.', '1', null, null, null);
INSERT INTO `query_execution` VALUES ('63', 0xF7E395ED5952A8D1192B8F8C5F038B74F8342961EA3DF8EFC948ACE8DC5A0E3F, '2017-06-22 12:08:51', '146', '0', '', 'ad-hoc', '\'name\' is a required param.', '1', null, null, null);
INSERT INTO `query_execution` VALUES ('64', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 12:27:06', '212', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('65', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 12:27:26', '198', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('66', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 12:27:50', '288', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('67', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 12:28:19', '230', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('68', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 12:37:13', '216', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('69', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 12:37:27', '211', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('70', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 13:35:54', '259', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('71', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 14:52:28', '168', '39', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('72', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 14:52:39', '360', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('73', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 14:52:40', '101', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('74', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 14:52:52', '102', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('75', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 14:52:52', '218', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('76', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 16:30:50', '231', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('77', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:30:50', '336', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('78', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:31:13', '279', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('79', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:31:31', '253', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('80', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 16:31:31', '137', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('81', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:31:31', '205', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('82', 0xB19FFF4F8049057E0C9B75A3C4E2CA9E4D55865F42345788080A2795AC037573, '2017-06-22 16:37:17', '213', '2', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('83', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:37:20', '211', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('84', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 16:37:20', '91', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('85', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:37:20', '213', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('86', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 16:55:12', '153', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('87', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:55:12', '285', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('88', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:55:12', '244', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('89', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:56:14', '257', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('90', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 16:56:14', '109', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('91', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:56:14', '266', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('92', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 16:57:14', '89', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('93', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:57:14', '224', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('94', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:57:14', '224', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('95', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 16:58:14', '87', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('96', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:58:14', '226', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('97', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:58:14', '206', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('98', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 16:59:24', '141', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('99', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:59:24', '299', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('100', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 16:59:24', '307', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('101', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 17:15:49', '116', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('102', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 17:15:49', '272', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('103', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 17:15:49', '281', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('104', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 17:36:49', '111', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('105', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 17:36:49', '204', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('106', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 17:36:49', '242', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('107', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-22 17:58:07', '132', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('108', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 17:58:07', '237', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('109', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 17:58:07', '242', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('110', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-22 18:06:31', '194', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('111', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-24 00:19:06', '553', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('112', 0x3068C5D926E7AA0D9B2C61F63AA20B1A2387695858A6D0AA9BC7617C8DFE4612, '2017-06-24 17:16:17', '86', '26', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('113', 0x77D9D91DCB1944C1C13E81C7C7DEFE3C9829F935659779101E781384F12FEDE0, '2017-06-24 17:17:38', '70', '468', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('114', 0xB73B00DF1EC96ADFB219086E226EB9130B78677416D035D80FF564956089FD60, '2017-06-24 17:35:18', '37', '26', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('115', 0xD07AEFD9692FE6A064F34AFCA234B1BDFDC7AA140076B1853B51BB81A9018901, '2017-06-24 17:35:33', '34', '26', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('116', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-24 17:38:10', '152', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('117', 0xD07AEFD9692FE6A064F34AFCA234B1BDFDC7AA140076B1853B51BB81A9018901, '2017-06-24 17:38:10', '51', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('118', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-24 17:38:10', '311', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('119', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-24 17:38:10', '381', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('120', 0xD07AEFD9692FE6A064F34AFCA234B1BDFDC7AA140076B1853B51BB81A9018901, '2017-06-24 17:40:51', '41', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('121', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-24 17:40:51', '271', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('122', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-24 17:40:52', '121', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('123', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-24 17:40:52', '275', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('124', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-24 17:42:23', '251', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('125', 0xD07AEFD9692FE6A064F34AFCA234B1BDFDC7AA140076B1853B51BB81A9018901, '2017-06-24 17:42:43', '47', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('126', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-24 17:42:43', '255', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('127', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-24 17:42:43', '116', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('128', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-24 17:42:43', '247', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('129', 0xD07AEFD9692FE6A064F34AFCA234B1BDFDC7AA140076B1853B51BB81A9018901, '2017-06-24 17:43:28', '30', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('130', 0xD07AEFD9692FE6A064F34AFCA234B1BDFDC7AA140076B1853B51BB81A9018901, '2017-06-24 17:44:10', '39', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('131', 0xD07AEFD9692FE6A064F34AFCA234B1BDFDC7AA140076B1853B51BB81A9018901, '2017-06-24 17:44:37', '212', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('132', 0xBE8E77A37581001B98A6355A59B8E7C98F88D7D52D1609841316D5E4E61E80AB, '2017-06-24 17:44:37', '196', '39', '', 'question', null, '1', '2', null, null);
INSERT INTO `query_execution` VALUES ('133', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-24 17:44:37', '423', '468', '', 'question', null, '1', '3', null, null);
INSERT INTO `query_execution` VALUES ('134', 0xD080BC1513ED8AE2C0C2585B266534CB3A7A8F70D2F49EA96E459CBC8A94739B, '2017-06-24 17:44:37', '589', '468', '', 'question', null, '1', '1', null, null);
INSERT INTO `query_execution` VALUES ('135', 0xD07AEFD9692FE6A064F34AFCA234B1BDFDC7AA140076B1853B51BB81A9018901, '2017-06-24 17:44:51', '33', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('136', 0xD07AEFD9692FE6A064F34AFCA234B1BDFDC7AA140076B1853B51BB81A9018901, '2017-06-24 17:47:11', '33', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('137', 0x7DA64515CB9376C733092EB082D9D806890DF932E0A1523739E0DA71BA8FE5E9, '2017-06-24 17:47:50', '29', '26', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('138', 0x9C4554EAA90FBDE5D5734673C52D95AF5A49E61577F78165C49D235EA0303CEA, '2017-06-24 17:48:04', '27', '26', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('139', 0x9C4554EAA90FBDE5D5734673C52D95AF5A49E61577F78165C49D235EA0303CEA, '2017-06-24 17:48:18', '30', '26', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('140', 0x81C8872B9DF7E7CE842BFF972C2AD480DEF3AF3D38C527589DF3F70D34FEA037, '2017-06-24 17:48:46', '28', '26', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('141', 0x81C8872B9DF7E7CE842BFF972C2AD480DEF3AF3D38C527589DF3F70D34FEA037, '2017-06-24 17:48:54', '33', '26', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('142', 0x7876F4F817AFAC8AF9377638D7B7FBBABC34EFB7B72620DF2B57E2178EC04738, '2017-06-24 17:49:17', '28', '26', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('143', 0x7876F4F817AFAC8AF9377638D7B7FBBABC34EFB7B72620DF2B57E2178EC04738, '2017-06-24 17:49:49', '37', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('144', 0x7876F4F817AFAC8AF9377638D7B7FBBABC34EFB7B72620DF2B57E2178EC04738, '2017-06-24 17:49:55', '33', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('145', 0x7876F4F817AFAC8AF9377638D7B7FBBABC34EFB7B72620DF2B57E2178EC04738, '2017-06-24 17:50:10', '513', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('146', 0x7876F4F817AFAC8AF9377638D7B7FBBABC34EFB7B72620DF2B57E2178EC04738, '2017-06-24 17:51:55', '55', '26', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('147', 0xD66174E6657BD196024F8FB72E40FC2AFFE26793CABE24B7D5E98AAB3257E38A, '2017-06-24 17:52:52', '34', '19', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('148', 0xD66174E6657BD196024F8FB72E40FC2AFFE26793CABE24B7D5E98AAB3257E38A, '2017-06-24 17:53:01', '46', '19', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('149', 0xD66174E6657BD196024F8FB72E40FC2AFFE26793CABE24B7D5E98AAB3257E38A, '2017-06-24 17:54:05', '30', '19', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('150', 0xD66174E6657BD196024F8FB72E40FC2AFFE26793CABE24B7D5E98AAB3257E38A, '2017-06-24 17:54:09', '37', '19', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('151', 0xF407588ED2E2F2E6761972B7995F53AE979C030CFBAB9A770FB9F29E99BB4353, '2017-06-24 17:54:34', '39', '7', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('152', 0xF407588ED2E2F2E6761972B7995F53AE979C030CFBAB9A770FB9F29E99BB4353, '2017-06-24 17:54:42', '39', '7', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('153', 0xF407588ED2E2F2E6761972B7995F53AE979C030CFBAB9A770FB9F29E99BB4353, '2017-06-24 17:56:08', '28', '7', '', 'question', null, '1', '4', null, null);
INSERT INTO `query_execution` VALUES ('154', 0x2A138AA200EAC984272A4DBC6ECBFBEB2DA8B67BCAAB498941D60FCBE976F44E, '2017-06-25 14:20:41', '230', '3', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('155', 0x2A138AA200EAC984272A4DBC6ECBFBEB2DA8B67BCAAB498941D60FCBE976F44E, '2017-06-25 14:22:42', '132', '3', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('156', 0x1D0EB7F8AE901CD4D71B500A9AA886B9C6B01D3F911BE52E1A7CCE43DAE89236, '2017-06-25 14:22:52', '84', '0', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('157', 0x2A138AA200EAC984272A4DBC6ECBFBEB2DA8B67BCAAB498941D60FCBE976F44E, '2017-06-25 14:23:08', '120', '3', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('158', 0x9C28A0F74FE660195514C423BC44DB6BB446C27E03861D866A8024C7AA9FFA4B, '2017-06-25 14:26:10', '61', '1', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('159', 0x2A138AA200EAC984272A4DBC6ECBFBEB2DA8B67BCAAB498941D60FCBE976F44E, '2017-06-25 14:26:15', '123', '3', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('160', 0x0B173182517786BCA2CD1FA79555BB39469443F477E0E11C8BFA8A31BBCF037A, '2017-06-25 14:42:52', '51', '1', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('161', 0x942673AEAF08B8CC9E52CBE8D77BA21437A7ADE96E4C4433D54A0A07FF3CA86C, '2017-06-25 14:43:00', '63', '1', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('162', 0x2A138AA200EAC984272A4DBC6ECBFBEB2DA8B67BCAAB498941D60FCBE976F44E, '2017-06-25 14:45:34', '120', '3', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('163', 0xBF0741EB182D378B24E1F9B1EADD5B85A3709461C223C652F5502E6C9DC08A75, '2017-06-25 14:45:58', '52', '2', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('164', 0xBF0741EB182D378B24E1F9B1EADD5B85A3709461C223C652F5502E6C9DC08A75, '2017-06-25 14:46:05', '47', '2', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('165', 0x2A138AA200EAC984272A4DBC6ECBFBEB2DA8B67BCAAB498941D60FCBE976F44E, '2017-06-25 14:47:00', '118', '3', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('166', 0xBF0741EB182D378B24E1F9B1EADD5B85A3709461C223C652F5502E6C9DC08A75, '2017-06-25 15:10:56', '111', '2', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('167', 0x2A138AA200EAC984272A4DBC6ECBFBEB2DA8B67BCAAB498941D60FCBE976F44E, '2017-06-25 15:11:11', '120', '3', '', 'ad-hoc', null, '1', null, null, null);
INSERT INTO `query_execution` VALUES ('168', 0xD02353ABD3AE99F911DE6D89CE08B6AF95F2EA33CB4F52E9616A29A27391F85E, '2017-07-02 10:14:13', '739', '1', '', 'ad-hoc', null, '1', null, null, null);

-- ----------------------------
-- Table structure for `raw_column`
-- ----------------------------
DROP TABLE IF EXISTS `raw_column`;
CREATE TABLE `raw_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_table_id` int(11) NOT NULL,
  `active` bit(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_type` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_pk` bit(1) NOT NULL,
  `fk_target_column_id` int(11) DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_raw_column_table_name` (`raw_table_id`,`name`),
  KEY `fk_rawcolumn_fktarget_ref_rawcolumn` (`fk_target_column_id`),
  KEY `idx_rawcolumn_raw_table_id` (`raw_table_id`),
  CONSTRAINT `fk_rawcolumn_fktarget_ref_rawcolumn` FOREIGN KEY (`fk_target_column_id`) REFERENCES `raw_column` (`id`),
  CONSTRAINT `fk_rawcolumn_tableid_ref_rawtable` FOREIGN KEY (`raw_table_id`) REFERENCES `raw_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2059 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of raw_column
-- ----------------------------
INSERT INTO `raw_column` VALUES ('37', '6', '', 'administrator', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:40', '2017-06-29 21:50:00');
INSERT INTO `raw_column` VALUES ('38', '6', '', 'groupName', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:40', '2017-06-29 21:50:00');
INSERT INTO `raw_column` VALUES ('39', '6', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:40', '2017-06-29 21:50:00');
INSERT INTO `raw_column` VALUES ('40', '7', '', 'cp', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:00');
INSERT INTO `raw_column` VALUES ('41', '7', '', 'fsl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:00');
INSERT INTO `raw_column` VALUES ('42', '7', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:00');
INSERT INTO `raw_column` VALUES ('43', '7', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:00');
INSERT INTO `raw_column` VALUES ('44', '7', '', 'zh', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:00');
INSERT INTO `raw_column` VALUES ('45', '8', '', 'baseline_end_date', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('46', '8', '', 'baseline_start_date', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('47', '8', '', 'checkpass', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('48', '8', '', 'color', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('49', '8', '', 'copyFrom', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('50', '8', '', 'duration', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('51', '8', '', 'duration_unit', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('52', '8', '', 'end_date', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('53', '8', '', 'formType', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('54', '8', '', 'guidang', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('55', '8', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('56', '8', '', 'index', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('57', '8', '', 'loopd', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('58', '8', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('59', '8', '', 'note', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('60', '8', '', 'other_field', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('61', '8', '', 'parent_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('62', '8', '', 'percent_done', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('63', '8', '', 'pid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('64', '8', '', 'pizhu', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('65', '8', '', 'priority', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('66', '8', '', 'shy', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('67', '8', '', 'start_date', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('68', '8', '', 'taskmember', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('69', '8', '', 'wxhs', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('70', '8', '', 'yqyy', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('71', '8', '', 'zxbz', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('72', '9', '', 'addbyuser', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('73', '9', '', 'addtime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('74', '9', '', 'content', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('75', '9', '', 'edittime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('76', '9', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('77', '9', '', 'pid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('78', '9', '', 'smtitle', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('79', '9', '', 'title', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('80', '10', '', 'affiliation', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('81', '10', '', 'jid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('82', '10', '', 'nodeID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('83', '10', '', 'serviceID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('84', '11', '', 'description', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('85', '11', '', 'isHidden', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('86', '11', '', 'serviceID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('87', '11', '', 'subdomain', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('88', '12', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('89', '12', '', 'ispass', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('90', '12', '', 'rollback', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('91', '12', '', 'shyid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('92', '12', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_column` VALUES ('93', '13', '', 'creationDate', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('94', '13', '', 'email', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('95', '13', '', 'encryptedPassword', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('96', '13', '', 'iterations', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('97', '13', '', 'modificationDate', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('98', '13', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('99', '13', '', 'plainPassword', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('100', '13', '', 'salt', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('101', '13', '', 'serverKey', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('102', '13', '', 'storedKey', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('103', '13', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('104', '14', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('105', '14', '', 'namespace', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('106', '14', '', 'privateData', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('107', '14', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('108', '15', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('109', '15', '', 'taskname', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('110', '15', '', 'tid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('111', '15', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('112', '16', '', 'description', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('113', '16', '', 'groupName', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('114', '17', '', 'account_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_column` VALUES ('115', '17', '', 'alipay_code', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_column` VALUES ('116', '17', '', 'createtime', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_column` VALUES ('117', '17', '', 'operater', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_column` VALUES ('118', '17', '', 'pay_account', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_column` VALUES ('119', '17', '', 'pay_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_column` VALUES ('120', '17', '', 'pay_money', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_column` VALUES ('121', '17', '', 'pay_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_column` VALUES ('122', '17', '', 'pay_type', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_column` VALUES ('123', '17', '', 'remark', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_column` VALUES ('124', '17', '', 'sm_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_column` VALUES ('125', '18', '', 'AppID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('126', '18', '', 'AppName', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('127', '18', '', 'AppSecret', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('128', '18', '', 'access_token', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('129', '18', '', 'access_token_time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('130', '18', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('131', '19', '', 'deliver', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('132', '19', '', 'digest', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('133', '19', '', 'digest_frequency', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('134', '19', '', 'expire', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('135', '19', '', 'id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('136', '19', '', 'includeBody', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('137', '19', '', 'jid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('138', '19', '', 'keyword', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('139', '19', '', 'nodeID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('140', '19', '', 'owner', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('141', '19', '', 'serviceID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('142', '19', '', 'showValues', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('143', '19', '', 'state', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('144', '19', '', 'subscriptionDepth', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('145', '19', '', 'subscriptionType', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_column` VALUES ('146', '20', '', 'dfl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:43', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('147', '20', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('148', '20', '', 'mtbm', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('149', '20', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('150', '20', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('151', '20', '', 'waid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('152', '20', '', 'xzfs', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('153', '20', '', 'zh', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('154', '21', '', 'account', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('155', '21', '', 'device_uuid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('156', '21', '', 'enabled', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('157', '21', '', 'imgurl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('158', '21', '', 'login_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('159', '21', '', 'macaddr', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('160', '21', '', 'password', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('161', '21', '', 'remark', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('162', '21', '', 'role_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('163', '21', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('164', '21', '', 'user_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('165', '21', '', 'user_type', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('166', '22', '', 'province_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('167', '22', '', 'province_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('168', '23', '', 'content', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('169', '23', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('170', '23', '', 'tid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('171', '23', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('172', '24', '', 'alisa_code', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('173', '24', '', 'order_no', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('174', '24', '', 'parent_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('175', '24', '', 'type_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('176', '24', '', 'type_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('177', '24', '', 'type_tag', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('178', '25', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('179', '25', '', 'members_back', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('180', '25', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:06');
INSERT INTO `raw_column` VALUES ('181', '26', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('182', '26', '', 'openid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('183', '26', '', 'visitlink', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('184', '27', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('185', '27', '', 'openID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('186', '27', '', 'parentCode', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('187', '27', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('188', '28', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('189', '28', '', 'linkToField', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('190', '28', '', 'linkToFieldData', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('191', '28', '', 'linkToFieldId', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('192', '28', '', 'linkToTable', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('193', '28', '', 'nowData', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('194', '28', '', 'nowField', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('195', '28', '', 'nowTable', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('196', '29', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('197', '29', '', 'isdel', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('198', '29', '', 'opeuid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('199', '29', '', 'pointdesc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('200', '29', '', 'pointid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('201', '29', '', 'pointnum', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('202', '29', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('203', '29', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('204', '30', '', 'con', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('205', '30', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('206', '30', '', 'taskid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:45', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('207', '30', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('208', '30', '', 'tp', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('209', '30', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('210', '31', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('211', '31', '', 'propValue', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('212', '32', '', 'code', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('213', '32', '', 'region_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('214', '32', '', 'zip_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('215', '32', '', 'zip_number', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('216', '33', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('217', '33', '', 'propValue', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('218', '33', '', 'serviceID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('219', '34', '', 'accessModel', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('220', '34', '', 'associationPolicy', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('221', '34', '', 'bodyXSLT', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('222', '34', '', 'configSubscription', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('223', '34', '', 'creationDate', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('224', '34', '', 'creator', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('225', '34', '', 'dataformXSLT', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('226', '34', '', 'deliverPayloads', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('227', '34', '', 'description', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('228', '34', '', 'language', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('229', '34', '', 'leaf', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('230', '34', '', 'maxItems', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('231', '34', '', 'maxLeafNodes', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('232', '34', '', 'maxPayloadSize', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('233', '34', '', 'modificationDate', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('234', '34', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('235', '34', '', 'nodeID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('236', '34', '', 'notifyConfigChanges', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('237', '34', '', 'notifyDelete', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('238', '34', '', 'notifyRetract', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('239', '34', '', 'parent', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('240', '34', '', 'payloadType', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('241', '34', '', 'persistItems', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('242', '34', '', 'presenceBased', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('243', '34', '', 'publisherModel', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('244', '34', '', 'replyPolicy', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('245', '34', '', 'sendItemSubscribe', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('246', '34', '', 'serviceID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('247', '34', '', 'subscriptionEnabled', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('248', '35', '', 'click_num', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('249', '35', '', 'create_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('250', '35', '', 'news_content', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('251', '35', '', 'news_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('252', '35', '', 'news_state', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('253', '35', '', 'news_title', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('254', '35', '', 'order_no', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('255', '35', '', 'show_top', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:08');
INSERT INTO `raw_column` VALUES ('256', '36', '', 'dfl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('257', '36', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('258', '36', '', 'pll', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('259', '36', '', 'rq', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('260', '36', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('261', '36', '', 'xzfsl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('262', '36', '', 'zxl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('263', '37', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('264', '37', '', 'isdel', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('265', '37', '', 'ispause', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('266', '37', '', 'mtbmid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('267', '37', '', 'mtzh', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('268', '38', '', 'cid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('269', '38', '', 'createtime', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('270', '38', '', 'msql_text', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('271', '38', '', 'otype', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('272', '38', '', 'state', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('273', '39', '', 'artid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('274', '39', '', 'content', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('275', '39', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('276', '39', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('277', '39', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_column` VALUES ('278', '40', '', 'con', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:10');
INSERT INTO `raw_column` VALUES ('279', '40', '', 'end', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:10');
INSERT INTO `raw_column` VALUES ('280', '40', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:10');
INSERT INTO `raw_column` VALUES ('281', '40', '', 'start', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:47', '2017-06-29 21:50:10');
INSERT INTO `raw_column` VALUES ('282', '40', '', 'status', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:10');
INSERT INTO `raw_column` VALUES ('283', '40', '', 'type', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:10');
INSERT INTO `raw_column` VALUES ('284', '40', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:10');
INSERT INTO `raw_column` VALUES ('285', '41', '', 'channel_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:10');
INSERT INTO `raw_column` VALUES ('286', '41', '', 'channel_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:10');
INSERT INTO `raw_column` VALUES ('287', '41', '', 'channel_txt', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:10');
INSERT INTO `raw_column` VALUES ('288', '41', '', 'channel_uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:10');
INSERT INTO `raw_column` VALUES ('289', '42', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('290', '42', '', 'nrs', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('291', '42', '', 'pll', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('292', '42', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('293', '42', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('294', '42', '', 'waid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('295', '42', '', 'zxl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('296', '43', '', 'endTime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('297', '43', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('298', '43', '', 'startTime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('299', '43', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('300', '44', '', 'nodeID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('301', '44', '', 'rosterGroup', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('302', '44', '', 'serviceID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('303', '45', '', 'good_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('304', '45', '', 'order_no', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('305', '45', '', 'service_money', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('306', '45', '', 'sku_cost', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('307', '45', '', 'sku_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('308', '45', '', 'sku_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('309', '45', '', 'sku_pmoney', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('310', '45', '', 'sku_price', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('311', '46', '', 'createtime', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('312', '46', '', 'order_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('313', '46', '', 'order_money', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('314', '46', '', 'remark', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('315', '46', '', 'scid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('316', '46', '', 'server_pmoney', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('317', '46', '', 'state_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('318', '47', '', 'deltime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('319', '47', '', 'file_size', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('320', '47', '', 'filename', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('321', '47', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('322', '47', '', 'istrash', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('323', '47', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('324', '47', '', 'pid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('325', '47', '', 'projid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('326', '47', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('327', '47', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('328', '47', '', 'url', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_column` VALUES ('329', '48', '', 'distance', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('330', '48', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('331', '48', '', 'location', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('332', '48', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('333', '48', '', 'type', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('334', '48', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('335', '49', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('336', '49', '', 'watime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('337', '49', '', 'watype', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('338', '50', '', 'order_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('339', '50', '', 'reply_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('340', '50', '', 'reply_num', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('341', '50', '', 'reply_text', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('342', '50', '', 'reply_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('343', '50', '', 'state_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_column` VALUES ('344', '51', '', 'QQ', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('345', '51', '', 'acc_balance', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('346', '51', '', 'createtime', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('347', '51', '', 'customer_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('348', '51', '', 'customer_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('349', '51', '', 'level', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('350', '51', '', 'login_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('351', '51', '', 'login_pwd', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('352', '51', '', 'phone', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('353', '51', '', 'state', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('354', '51', '', 'update_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('355', '51', '', 'wxh', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('356', '52', '', 'principal', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('357', '52', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('358', '53', '', 'role_code', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('359', '53', '', 'role_desc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('360', '53', '', 'role_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('361', '53', '', 'role_order', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('362', '53', '', 'role_type', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('363', '54', '', 'copy_desc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('364', '54', '', 'copy_ids', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('365', '54', '', 'courier_money', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('366', '54', '', 'create_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('367', '54', '', 'customer_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('368', '54', '', 'forward_link', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('369', '54', '', 'good_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('370', '54', '', 'good_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('371', '54', '', 'good_pic', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('372', '54', '', 'good_pic1', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('373', '54', '', 'good_pic2', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('374', '54', '', 'good_value', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('375', '54', '', 'isgiven', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('376', '54', '', 'order_no', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('377', '54', '', 'promote_desc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('378', '54', '', 'recomed', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('379', '54', '', 'recomed_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('380', '54', '', 'sell_num', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('381', '54', '', 'sku_cost', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('382', '54', '', 'sku_pmoney', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('383', '54', '', 'sku_price', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('384', '54', '', 'sku_title', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('385', '54', '', 'sms_check', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('386', '54', '', 'spc_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('387', '54', '', 'state', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('388', '54', '', 'tags', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('389', '54', '', 'toped', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('390', '54', '', 'toped_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('391', '54', '', 'type_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('392', '54', '', 'zon_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_column` VALUES ('393', '55', '', 'creationDate', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('394', '55', '', 'messageID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('395', '55', '', 'messageSize', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('396', '55', '', 'stanza', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('397', '55', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:50', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('398', '56', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('399', '56', '', 'projid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('400', '56', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('401', '56', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('402', '56', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('403', '56', '', '字段1', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('404', '56', '', '字段2', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('405', '56', '', '字段3', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('406', '56', '', '字段4', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('407', '56', '', '字段5', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('408', '57', '', 'fbsl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('409', '57', '', 'fzr', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('410', '57', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('411', '57', '', 'mtbm', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('412', '57', '', 'nextSteptIsStart', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('413', '57', '', 'nrmd', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('414', '57', '', 'nrsd', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('415', '57', '', 'proj', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('416', '57', '', 'qzsl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('417', '57', '', 'wanx', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_column` VALUES ('418', '58', '', 'addtime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('419', '58', '', 'djl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('420', '58', '', 'ggf', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('421', '58', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('422', '58', '', 'pid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('423', '58', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('424', '58', '', 'tgid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('425', '58', '', 'tid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('426', '58', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('427', '58', '', 'zsl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('428', '59', '', 'dp', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('429', '59', '', 'file_size', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('430', '59', '', 'filename', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('431', '59', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('432', '59', '', 'istrash', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('433', '59', '', 'savetodoc', null, '', null, '{\"base-type\":\"type/*\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('434', '59', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('435', '59', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('436', '59', '', 'url', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('437', '59', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('438', '60', '', 'charge_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('439', '60', '', 'charge_money', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('440', '60', '', 'charge_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('441', '60', '', 'customer_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('442', '60', '', 'state', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('443', '61', '', 'groupName', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('444', '61', '', 'rank', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('445', '61', '', 'rosterID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:15');
INSERT INTO `raw_column` VALUES ('446', '62', '', 'expanded', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('447', '62', '', 'leaf', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('448', '62', '', 'link_url', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('449', '62', '', 'module_code', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('450', '62', '', 'module_desc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('451', '62', '', 'module_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('452', '62', '', 'module_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('453', '62', '', 'module_order', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('454', '62', '', 'parent_module', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('455', '63', '', 'ismobile', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('456', '63', '', 'log_type', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('457', '63', '', 'login_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('458', '63', '', 'login_ip', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('459', '63', '', 'login_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('460', '63', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('461', '64', '', 'addtime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('462', '64', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('463', '64', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('464', '64', '', 'tgjxid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('465', '64', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('466', '64', '', 'wxh', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('467', '64', '', 'xzfs', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_column` VALUES ('468', '65', '', 'email', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('469', '65', '', 'faqentry', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:52', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('470', '65', '', 'firstName', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('471', '65', '', 'jid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('472', '65', '', 'lastName', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('473', '65', '', 'nickname', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('474', '65', '', 'roomID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('475', '65', '', 'url', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('476', '66', '', 'id', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('477', '66', '', 'idType', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('478', '67', '', 'desc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('479', '67', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('480', '67', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('481', '67', '', 'pid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('482', '67', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('483', '67', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('484', '68', '', 'accessModel', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('485', '68', '', 'associationPolicy', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('486', '68', '', 'deliverPayloads', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('487', '68', '', 'language', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('488', '68', '', 'leaf', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('489', '68', '', 'maxItems', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('490', '68', '', 'maxLeafNodes', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('491', '68', '', 'maxPayloadSize', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('492', '68', '', 'notifyConfigChanges', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('493', '68', '', 'notifyDelete', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('494', '68', '', 'notifyRetract', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('495', '68', '', 'persistItems', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('496', '68', '', 'presenceBased', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('497', '68', '', 'publisherModel', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('498', '68', '', 'replyPolicy', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('499', '68', '', 'sendItemSubscribe', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('500', '68', '', 'serviceID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('501', '68', '', 'subscriptionEnabled', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('502', '69', '', 'associationType', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('503', '69', '', 'jid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('504', '69', '', 'nodeID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('505', '69', '', 'serviceID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('506', '70', '', 'ask', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('507', '70', '', 'jid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('508', '70', '', 'nick', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('509', '70', '', 'recv', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('510', '70', '', 'rosterID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('511', '70', '', 'sub', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('512', '70', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('513', '71', '', 'desc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('514', '71', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('515', '71', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('516', '71', '', 'pid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('517', '71', '', 'sort_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('518', '71', '', 'subcount', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('519', '71', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('520', '71', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_column` VALUES ('521', '72', '', 'changepoint', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('522', '72', '', 'desc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('523', '72', '', 'giftnum', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('524', '72', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('525', '72', '', 'imgurl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('526', '72', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('527', '72', '', 'sjsj', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('528', '72', '', 'state', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('529', '73', '', 'channel_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('530', '73', '', 'good_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('531', '73', '', 'log_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('532', '73', '', 'order_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('533', '73', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('534', '73', '', 'visit_ip', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('535', '73', '', 'visit_num', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('536', '73', '', 'visit_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('537', '74', '', 'book', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('538', '74', '', 'desc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('539', '74', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('540', '74', '', 'leader', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('541', '74', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('542', '74', '', 'role', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:19');
INSERT INTO `raw_column` VALUES ('543', '75', '', 'addtime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('544', '75', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('545', '75', '', 'mtbm', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('546', '75', '', 'mtzh', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('547', '75', '', 'projid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('548', '75', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('549', '75', '', 'tgproj', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('550', '75', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('551', '75', '', 'waid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('552', '76', '', 'permission', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('553', '76', '', 'remotePort', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('554', '76', '', 'xmppDomain', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('555', '77', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('556', '77', '', 'mtbm', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('557', '77', '', 'mtpt', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('558', '78', '', 'boss', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('559', '78', '', 'content', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('560', '78', '', 'dp', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('561', '78', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('562', '78', '', 'isclose', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('563', '78', '', 'isdel', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('564', '78', '', 'istemplate', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('565', '78', '', 'member', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('566', '78', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('567', '78', '', 'shy', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('568', '78', '', 'wxhs', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_column` VALUES ('569', '79', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:56', '2017-06-26 19:05:44');
INSERT INTO `raw_column` VALUES ('570', '79', '', 'projid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-26 19:05:44');
INSERT INTO `raw_column` VALUES ('571', '79', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-26 19:05:44');
INSERT INTO `raw_column` VALUES ('572', '79', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-26 19:05:44');
INSERT INTO `raw_column` VALUES ('573', '79', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-26 19:05:44');
INSERT INTO `raw_column` VALUES ('574', '79', '', '字段1', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-26 19:05:44');
INSERT INTO `raw_column` VALUES ('575', '79', '', '字段2', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-26 19:05:44');
INSERT INTO `raw_column` VALUES ('576', '80', '', 'account_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('577', '80', '', 'alipay_code', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('578', '80', '', 'createtime', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('579', '80', '', 'customer_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('580', '80', '', 'operater', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('581', '80', '', 'pay_account', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('582', '80', '', 'pay_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('583', '80', '', 'pay_money', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('584', '80', '', 'pay_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('585', '80', '', 'remark', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('586', '80', '', 'um_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('587', '81', '', 'cdl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('588', '81', '', 'cjdj', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('589', '81', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('590', '81', '', 'mtbm', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('591', '81', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('592', '81', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('593', '81', '', 'waid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('594', '81', '', 'zh', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('595', '81', '', 'zhzq', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('596', '82', '', 'copy_content', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('597', '82', '', 'copy_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('598', '82', '', 'copy_link', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('599', '82', '', 'copy_thumb', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('600', '82', '', 'copy_title', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('601', '82', '', 'customer_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('602', '82', '', 'order_no', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('603', '82', '', 'type_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('604', '83', '', 'glfa', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('605', '83', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('606', '83', '', 'loopd', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('607', '83', '', 'tid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('608', '83', '', 'xsjy', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('609', '83', '', 'yycd', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('610', '83', '', 'zxbz', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:21');
INSERT INTO `raw_column` VALUES ('611', '84', '', 'city_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('612', '84', '', 'region_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('613', '84', '', 'region_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('614', '85', '', 'addtime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('615', '85', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('616', '85', '', 'nrmd', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('617', '85', '', 'proj', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('618', '85', '', 'projid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('619', '85', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('620', '85', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('621', '85', '', 'watime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('622', '85', '', 'watype', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('623', '86', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('624', '86', '', 'role_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('625', '86', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_column` VALUES ('626', '87', '', 'dataSource', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:23');
INSERT INTO `raw_column` VALUES ('627', '87', '', 'datatyp', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:23');
INSERT INTO `raw_column` VALUES ('628', '87', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:23');
INSERT INTO `raw_column` VALUES ('629', '88', '', 'code_desc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('630', '88', '', 'code_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('631', '88', '', 'code_value', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('632', '88', '', 'edit_mode', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('633', '88', '', 'enabled', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('634', '88', '', 'field_code', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('635', '88', '', 'field_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('636', '88', '', 'remark', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('637', '88', '', 'sort_no', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:57', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('638', '89', '', 'createtime', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('639', '89', '', 'exp_pay_date', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('640', '89', '', 'ocid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('641', '89', '', 'order_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('642', '89', '', 'order_money', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('643', '89', '', 'order_pmoney', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('644', '89', '', 'remark', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('645', '89', '', 'state_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('646', '90', '', 'createtime', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('647', '90', '', 'ocid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('648', '90', '', 'order_money', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('649', '90', '', 'own_money', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('650', '90', '', 'state', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('651', '90', '', 'um_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('652', '90', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('653', '90', '', 'visit_money', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('654', '91', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('655', '91', '', 'isdel', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('656', '91', '', 'ispause', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('657', '91', '', 'mtbm', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_column` VALUES ('658', '92', '', 'account', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('659', '92', '', 'band_modile', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('660', '92', '', 'email', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('661', '92', '', 'level_code', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('662', '92', '', 'memeber_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('663', '92', '', 'mid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('664', '92', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('665', '92', '', 'password', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('666', '92', '', 'pay_account', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('667', '92', '', 'phone', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('668', '92', '', 'qq_num', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('669', '92', '', 'recom_user', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('670', '92', '', 'register_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('671', '92', '', 'update_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('672', '92', '', 'use_recom', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('673', '92', '', 'visit_code', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('674', '93', '', 'city_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('675', '93', '', 'city_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('676', '93', '', 'first_letter', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('677', '93', '', 'is_hot', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('678', '93', '', 'province_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('679', '93', '', 'state', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('680', '94', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('681', '94', '', 'version', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('682', '95', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('683', '95', '', 'vcard', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:25');
INSERT INTO `raw_column` VALUES ('684', '96', '', 'isDefault', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('685', '96', '', 'list', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('686', '96', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('687', '96', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('688', '97', '', 'offlineDate', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('689', '97', '', 'offlinePresence', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('690', '97', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('691', '98', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('692', '98', '', 'projname', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('693', '99', '', 'giftid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('694', '99', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('695', '99', '', 'stat', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('696', '99', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('697', '99', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_column` VALUES ('698', '100', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('699', '100', '', 'resourceId', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('700', '100', '', 'resource_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('701', '100', '', 'task_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('702', '100', '', 'unitsVal', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('703', '100', '', 'units_val', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:45:59', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('704', '101', '', 'deltime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('705', '101', '', 'folderpid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('706', '101', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('707', '101', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('708', '101', '', 'pid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('709', '101', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('710', '102', '', 'body', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('711', '102', '', 'logTime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('712', '102', '', 'messageID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('713', '102', '', 'nickname', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('714', '102', '', 'roomID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('715', '102', '', 'sender', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('716', '102', '', 'stanza', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('717', '102', '', 'subject', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_column` VALUES ('718', '103', '', 'from_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_column` VALUES ('719', '103', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_column` VALUES ('720', '103', '', 'pid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_column` VALUES ('721', '103', '', 'to_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_column` VALUES ('722', '103', '', 'type', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_column` VALUES ('723', '104', '', 'details', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_column` VALUES ('724', '104', '', 'entryStamp', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_column` VALUES ('725', '104', '', 'msgID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_column` VALUES ('726', '104', '', 'node', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_column` VALUES ('727', '104', '', 'summary', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_column` VALUES ('728', '104', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_column` VALUES ('729', '105', '', 'fwl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:00', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('730', '105', '', 'ggf', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('731', '105', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('732', '105', '', 'planid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('733', '105', '', 'rq', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('734', '106', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('735', '106', '', 'projid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('736', '106', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('737', '106', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('738', '106', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('739', '106', '', '微信号', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('740', '106', '', '成交额', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('741', '106', '', '转化周期', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('742', '107', '', 'createtime', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('743', '107', '', 'log_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('744', '107', '', 'log_txt', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('745', '107', '', 'order_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('746', '108', '', 'gid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('747', '108', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('748', '108', '', 'uid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('749', '109', '', 'FIELDNAME', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('750', '109', '', 'IDTYPE', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('751', '109', '', 'MAXID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('752', '109', '', 'PATTERN', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('753', '109', '', 'REMARK', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('754', '109', '', 'SEQUENCEID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('755', '110', '', 'creationDate', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('756', '110', '', 'id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('757', '110', '', 'jid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('758', '110', '', 'nodeID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('759', '110', '', 'payload', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('760', '110', '', 'serviceID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_column` VALUES ('761', '111', '', 'dfj', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('762', '111', '', 'fsl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('763', '111', '', 'fwl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('764', '111', '', 'fzr', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('765', '111', '', 'ggf', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('766', '111', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('767', '111', '', 'jfl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('768', '111', '', 'kfzh', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('769', '111', '', 'mtbm', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('770', '111', '', 'mtpt', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('771', '111', '', 'mtzh', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('772', '111', '', 'tcbl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('773', '111', '', 'waid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('774', '112', '', 'addbyuser', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:31');
INSERT INTO `raw_column` VALUES ('775', '112', '', 'addtime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:31');
INSERT INTO `raw_column` VALUES ('776', '112', '', 'content', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:31');
INSERT INTO `raw_column` VALUES ('777', '112', '', 'edittime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:31');
INSERT INTO `raw_column` VALUES ('778', '112', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:31');
INSERT INTO `raw_column` VALUES ('779', '112', '', 'pid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:31');
INSERT INTO `raw_column` VALUES ('780', '112', '', 'smtitle', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:31');
INSERT INTO `raw_column` VALUES ('781', '112', '', 'title', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:31');
INSERT INTO `raw_column` VALUES ('782', '113', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_column` VALUES ('783', '113', '', 'tid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_column` VALUES ('784', '113', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_column` VALUES ('785', '114', '', 'createtime', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_column` VALUES ('786', '114', '', 'log_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_column` VALUES ('787', '114', '', 'log_txt', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_column` VALUES ('788', '114', '', 'order_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_column` VALUES ('789', '114', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_column` VALUES ('790', '115', '', 'fun_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_column` VALUES ('791', '115', '', 'module_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_column` VALUES ('792', '115', '', 'role_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_column` VALUES ('793', '116', '', 'aim', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('794', '116', '', 'calcData', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('795', '116', '', 'deptid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('796', '116', '', 'deptname', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('797', '116', '', 'desc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('798', '116', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('799', '116', '', 'isdel', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('800', '116', '', 'looptype', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('801', '116', '', 'reduce', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('802', '116', '', 'teamid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('803', '116', '', 'tp', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('804', '117', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('805', '117', '', 'tid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('806', '117', '', 'tp', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('807', '117', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('808', '118', '', 'content', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('809', '118', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('810', '118', '', 'isignore', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('811', '118', '', 'istodoc', null, '', null, '{\"base-type\":\"type/*\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('812', '118', '', 'taskid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('813', '118', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('814', '118', '', 'type', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('815', '118', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('816', '119', '', 'groupName', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('817', '119', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('818', '119', '', 'propValue', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_column` VALUES ('819', '120', '', 'attime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('820', '120', '', 'desc', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('821', '120', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('822', '120', '', 'notifytp', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('823', '120', '', 'senduid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('824', '120', '', 'stat', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('825', '120', '', 'tid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('826', '120', '', 'title', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('827', '120', '', 'touid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('828', '120', '', 'url', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('829', '121', '', 'permission', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('830', '121', '', 'secret', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('831', '121', '', 'subdomain', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('832', '121', '', 'wildcard', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_column` VALUES ('833', '122', '', 'fktws', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:35');
INSERT INTO `raw_column` VALUES ('834', '122', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:35');
INSERT INTO `raw_column` VALUES ('835', '122', '', 'jygxs', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:35');
INSERT INTO `raw_column` VALUES ('836', '122', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:35');
INSERT INTO `raw_column` VALUES ('837', '123', '', 'param_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:35');
INSERT INTO `raw_column` VALUES ('838', '123', '', 'param_key', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:35');
INSERT INTO `raw_column` VALUES ('839', '123', '', 'param_value', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:35');
INSERT INTO `raw_column` VALUES ('840', '123', '', 'remark', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:35');
INSERT INTO `raw_column` VALUES ('841', '123', '', 'stat', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:35');
INSERT INTO `raw_column` VALUES ('842', '124', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('843', '124', '', 'pid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('844', '124', '', 'tid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('845', '124', '', 'tp', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('846', '124', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('847', '125', '', 'email', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('848', '125', '', 'fsl', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('849', '125', '', 'imgurl', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('850', '125', '', 'jid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('851', '125', '', 'kfzh', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('852', '125', '', 'login_num', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('853', '125', '', 'nick_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('854', '125', '', 'point', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('855', '125', '', 'qq_num', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('856', '125', '', 'sex', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('857', '125', '', 'telephone', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('858', '125', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('859', '126', '', 'allowpm', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('860', '126', '', 'canChangeNick', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('861', '126', '', 'canChangeSubject', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('862', '126', '', 'canDiscoverJID', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('863', '126', '', 'canInvite', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('864', '126', '', 'canRegister', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('865', '126', '', 'creationDate', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('866', '126', '', 'description', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('867', '126', '', 'emptyDate', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('868', '126', '', 'lockedDate', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('869', '126', '', 'logEnabled', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('870', '126', '', 'maxUsers', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('871', '126', '', 'membersOnly', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('872', '126', '', 'moderated', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('873', '126', '', 'modificationDate', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('874', '126', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('875', '126', '', 'naturalName', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('876', '126', '', 'publicRoom', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('877', '126', '', 'rolesToBroadcast', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('878', '126', '', 'roomID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('879', '126', '', 'roomPassword', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('880', '126', '', 'serviceID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('881', '126', '', 'subject', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('882', '126', '', 'useReservedNick', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('883', '127', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('884', '127', '', 'propValue', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('885', '127', '', 'roomID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_column` VALUES ('886', '128', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('887', '128', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('888', '129', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('889', '129', '', 'isclose', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('890', '129', '', 'loopd', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('891', '129', '', 'pid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('892', '129', '', 'taskid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('893', '129', '', 'taskmember', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:05', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('894', '130', '', 'baseline_end_date', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('895', '130', '', 'baseline_start_date', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('896', '130', '', 'checkpass', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('897', '130', '', 'color', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('898', '130', '', 'copyFrom', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('899', '130', '', 'duration', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('900', '130', '', 'duration_unit', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('901', '130', '', 'end_date', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('902', '130', '', 'formType', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('903', '130', '', 'glfanum', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('904', '130', '', 'guidang', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('905', '130', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('906', '130', '', 'index', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('907', '130', '', 'loopd', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('908', '130', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('909', '130', '', 'note', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('910', '130', '', 'other_field', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('911', '130', '', 'parent_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('912', '130', '', 'percent_done', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('913', '130', '', 'pid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('914', '130', '', 'pizhu', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('915', '130', '', 'priority', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('916', '130', '', 'shy', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('917', '130', '', 'start_date', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('918', '130', '', 'taskmember', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('919', '130', '', 'wxhs', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('920', '130', '', 'xsjynum', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('921', '130', '', 'yqyy', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('922', '130', '', 'yyzj', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('923', '130', '', 'zxbz', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('924', '130', '', 'zxbznum', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:37');
INSERT INTO `raw_column` VALUES ('925', '131', '', 'cjdj', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:38');
INSERT INTO `raw_column` VALUES ('926', '131', '', 'cjds', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:38');
INSERT INTO `raw_column` VALUES ('927', '131', '', 'cpm', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:38');
INSERT INTO `raw_column` VALUES ('928', '131', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:38');
INSERT INTO `raw_column` VALUES ('929', '131', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:38');
INSERT INTO `raw_column` VALUES ('930', '131', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:38');
INSERT INTO `raw_column` VALUES ('931', '132', '', 'affiliation', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:38');
INSERT INTO `raw_column` VALUES ('932', '132', '', 'jid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:38');
INSERT INTO `raw_column` VALUES ('933', '132', '', 'roomID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:46:06', '2017-06-29 21:50:38');
INSERT INTO `raw_column` VALUES ('934', '133', '', 'address', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('935', '133', '', 'admin_remark', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('936', '133', '', 'alipay_state', null, '', null, '{\"base-type\":\"type/*\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('937', '133', '', 'area', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('938', '133', '', 'buy_num', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('939', '133', '', 'buyer_name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('940', '133', '', 'buyer_phone', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('941', '133', '', 'buyer_reamrk', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('942', '133', '', 'channel_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('943', '133', '', 'check_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('944', '133', '', 'city', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('945', '133', '', 'courier_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('946', '133', '', 'good_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('947', '133', '', 'oid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('948', '133', '', 'operator', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('949', '133', '', 'order_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('950', '133', '', 'order_ip', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('951', '133', '', 'order_remark', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('952', '133', '', 'order_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('953', '133', '', 'order_type', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('954', '133', '', 'pay_type', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('955', '133', '', 'province', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('956', '133', '', 'sender_type', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('957', '133', '', 'sku_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('958', '133', '', 'state', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('959', '133', '', 'update_time', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('960', '133', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('961', '134', '', 'createtime', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('962', '134', '', 'own_money', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('963', '134', '', 'scid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('964', '134', '', 'server_money', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('965', '134', '', 'sm_id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('966', '134', '', 'state', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('967', '134', '', 'user_id', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_column` VALUES ('968', '135', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('969', '135', '', 'stat', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('970', '135', '', 'tb', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('971', '135', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('972', '135', '', 'tn', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('973', '135', '', 'uname', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('974', '135', '', 'zs', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:07', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('975', '136', '', 'cjje', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:08', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('976', '136', '', 'cjtime', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:08', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('977', '136', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:46:08', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('978', '136', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:08', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('979', '136', '', 'tgjx', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:08', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('980', '136', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:08', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('981', '136', '', 'wxh', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:08', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('982', '136', '', 'zhzq', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:08', '2017-06-29 21:50:40');
INSERT INTO `raw_column` VALUES ('983', '137', '', 'name', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:08', '2017-06-29 21:50:41');
INSERT INTO `raw_column` VALUES ('984', '137', '', 'propValue', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:08', '2017-06-29 21:50:41');
INSERT INTO `raw_column` VALUES ('985', '137', '', 'username', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:46:08', '2017-06-29 21:50:41');
INSERT INTO `raw_column` VALUES ('1935', '270', '', 'CATEGORY', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1936', '270', '', 'CREATED_AT', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1937', '270', '', 'EAN', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1938', '270', '', 'ID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1939', '270', '', 'PRICE', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1940', '270', '', 'RATING', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1941', '270', '', 'TITLE', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1942', '270', '', 'VENDOR', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1943', '271', '', 'CREATED_AT', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1944', '271', '', 'ID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1945', '271', '', 'PRODUCT_ID', null, '', '1938', '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1946', '271', '', 'SUBTOTAL', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1947', '271', '', 'TAX', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1948', '271', '', 'TOTAL', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_column` VALUES ('1949', '271', '', 'USER_ID', null, '', '1955', '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:59:29', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1950', '272', '', 'ADDRESS', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1951', '272', '', 'BIRTH_DATE', null, '', null, '{\"base-type\":\"type/Date\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1952', '272', '', 'CITY', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1953', '272', '', 'CREATED_AT', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1954', '272', '', 'EMAIL', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1955', '272', '', 'ID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1956', '272', '', 'LATITUDE', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1957', '272', '', 'LONGITUDE', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1958', '272', '', 'NAME', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1959', '272', '', 'PASSWORD', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1960', '272', '', 'SOURCE', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1961', '272', '', 'STATE', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1962', '272', '', 'ZIP', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1963', '273', '', 'KEYPATH', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1964', '273', '', 'VALUE', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1965', '274', '', 'BODY', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1966', '274', '', 'CREATED_AT', null, '', null, '{\"base-type\":\"type/DateTime\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1967', '274', '', 'ID', null, '', null, '{\"base-type\":\"type/BigInteger\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1968', '274', '', 'PRODUCT_ID', null, '', '1938', '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1969', '274', '', 'RATING', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1970', '274', '', 'REVIEWER', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_column` VALUES ('1971', '275', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 17:50:02', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('1972', '275', '', 'projid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 17:50:02', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('1973', '275', '', 'taskid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 17:50:02', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('1974', '275', '', 'time', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 17:50:02', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('1975', '275', '', 'uid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-22 17:50:02', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('1976', '275', '', '内容时', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 17:50:02', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('1977', '275', '', '内容目的', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-22 17:50:02', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('1978', '276', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1979', '276', '', '加客时间', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1980', '276', '', '加客量', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1981', '276', '', '媒体平台', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1982', '276', '', '媒体编码', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1983', '276', '', '客单价', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1984', '276', '', '展示量', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1985', '276', '', '广告费', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1986', '276', '', '成交单价', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1987', '276', '', '成单时间', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1988', '276', '', '成单量', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1989', '276', '', '推广员', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1990', '276', '', '推广计划ID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1991', '276', '', '文案内容时间', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1992', '276', '', '文案内容目的', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1993', '276', '', '文案负责人', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1994', '276', '', '点击量', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1995', '276', '', '转化周期', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1996', '276', '', '销售员', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:12:13', '2017-06-25 14:12:13');
INSERT INTO `raw_column` VALUES ('1997', '277', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('1998', '277', '', '加客时间', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('1999', '277', '', '加客量', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2000', '277', '', '媒体平台', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2001', '277', '', '媒体编码', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2002', '277', '', '客单价', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2003', '277', '', '展示量', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2004', '277', '', '广告费', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2005', '277', '', '成交单价', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2006', '277', '', '成单时间', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2007', '277', '', '成单量', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2008', '277', '', '推广员', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2009', '277', '', '推广计划ID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2010', '277', '', '文案内容时间', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2011', '277', '', '文案内容目的', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2012', '277', '', '文案负责人', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2013', '277', '', '点击量', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2014', '277', '', '转化周期', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2015', '277', '', '销售员', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_column` VALUES ('2016', '275', '', '文案内容时', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:02', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('2017', '275', '', '文案内容目的', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:02', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('2018', '275', '', '文案类型', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:02', '2017-06-29 21:50:02');
INSERT INTO `raw_column` VALUES ('2019', '278', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:05', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('2020', '278', '', 'projid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:05', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('2021', '278', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:05', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('2022', '278', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:05', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('2023', '278', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:05', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('2024', '278', '', '加客量', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:05', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('2025', '278', '', '推广计划ID', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:05', '2017-06-29 21:50:05');
INSERT INTO `raw_column` VALUES ('2026', '279', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:07', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('2027', '279', '', 'projid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:07', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('2028', '279', '', 'taskid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:07', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('2029', '279', '', 'time', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:07', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('2030', '279', '', 'uid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:07', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('2031', '279', '', '展示量', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:07', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('2032', '279', '', '广告费', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-29 21:50:07', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('2033', '279', '', '推广计划ID', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:07', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('2034', '279', '', '点击量', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:07', '2017-06-29 21:50:07');
INSERT INTO `raw_column` VALUES ('2035', '280', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:17', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('2036', '280', '', 'projid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:17', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('2037', '280', '', 'taskid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:17', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('2038', '280', '', 'time', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:17', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('2039', '280', '', 'uid', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:17', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('2040', '280', '', '咨询量', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:17', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('2041', '280', '', '成交量', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:17', '2017-06-29 21:50:17');
INSERT INTO `raw_column` VALUES ('2042', '281', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:30', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('2043', '281', '', 'projid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:30', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('2044', '281', '', 'taskid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:30', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('2045', '281', '', 'time', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:30', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('2046', '281', '', 'uid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:30', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('2047', '281', '', '媒体编码', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:30', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('2048', '281', '', '媒体账号', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:30', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('2049', '281', '', '文案ID', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:30', '2017-06-29 21:50:30');
INSERT INTO `raw_column` VALUES ('2050', '282', '', 'id', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:41', '2017-06-29 21:50:41');
INSERT INTO `raw_column` VALUES ('2051', '282', '', 'projid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:41', '2017-06-29 21:50:41');
INSERT INTO `raw_column` VALUES ('2052', '282', '', 'taskid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:41', '2017-06-29 21:50:41');
INSERT INTO `raw_column` VALUES ('2053', '282', '', 'time', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:41', '2017-06-29 21:50:41');
INSERT INTO `raw_column` VALUES ('2054', '282', '', 'uid', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:41', '2017-06-29 21:50:41');
INSERT INTO `raw_column` VALUES ('2055', '282', '', '微信号', null, '', null, '{\"base-type\":\"type/Text\"}', '2017-06-29 21:50:41', '2017-06-29 21:50:41');
INSERT INTO `raw_column` VALUES ('2056', '282', '', '推广计划ID', null, '', null, '{\"base-type\":\"type/Integer\"}', '2017-06-29 21:50:41', '2017-06-29 21:50:41');
INSERT INTO `raw_column` VALUES ('2057', '282', '', '转化周期', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-29 21:50:41', '2017-06-29 21:50:41');
INSERT INTO `raw_column` VALUES ('2058', '282', '', '销售单价', null, '', null, '{\"base-type\":\"type/Float\"}', '2017-06-29 21:50:41', '2017-06-29 21:50:41');

-- ----------------------------
-- Table structure for `raw_table`
-- ----------------------------
DROP TABLE IF EXISTS `raw_table`;
CREATE TABLE `raw_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `database_id` int(11) NOT NULL,
  `active` bit(1) NOT NULL,
  `schema` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_raw_table_db_schema_name` (`database_id`,`schema`,`name`),
  KEY `idx_rawtable_database_id` (`database_id`),
  CONSTRAINT `fk_rawtable_ref_database` FOREIGN KEY (`database_id`) REFERENCES `metabase_database` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of raw_table
-- ----------------------------
INSERT INTO `raw_table` VALUES ('6', '3', '', null, 'ofgroupuser', '{}', '2017-06-22 10:45:40', '2017-06-29 21:50:00');
INSERT INTO `raw_table` VALUES ('7', '3', '', null, 'dp_xiaoshou_zhanghao', '{}', '2017-06-22 10:45:41', '2017-06-29 21:50:00');
INSERT INTO `raw_table` VALUES ('8', '3', '', null, 'task_copy', '{}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_table` VALUES ('9', '3', '', null, 'book_article', '{}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_table` VALUES ('10', '3', '', null, 'ofpubsubaffiliation', '{}', '2017-06-22 10:45:41', '2017-06-29 21:50:01');
INSERT INTO `raw_table` VALUES ('11', '3', '', null, 'ofmucservice', '{}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_table` VALUES ('12', '3', '', null, 'task_ispass', '{}', '2017-06-22 10:45:42', '2017-06-29 21:50:01');
INSERT INTO `raw_table` VALUES ('13', '3', '', null, 'ofuser', '{}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_table` VALUES ('14', '3', '', null, 'ofprivate', '{}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_table` VALUES ('15', '3', '', null, 'user_star_task', '{}', '2017-06-22 10:45:42', '2017-06-29 21:50:02');
INSERT INTO `raw_table` VALUES ('16', '3', '', null, 'ofgroup', '{}', '2017-06-22 10:45:43', '2017-06-29 21:50:02');
INSERT INTO `raw_table` VALUES ('17', '3', '', null, 'wxb_spay_log', '{}', '2017-06-22 10:45:43', '2017-06-29 21:50:03');
INSERT INTO `raw_table` VALUES ('18', '3', '', null, 'wxb_wxdata', '{}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_table` VALUES ('19', '3', '', null, 'ofpubsubsubscription', '{}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_table` VALUES ('20', '3', '', null, 'dp_xiaoshou_fssj', '{}', '2017-06-22 10:45:43', '2017-06-29 21:50:04');
INSERT INTO `raw_table` VALUES ('21', '3', '', null, 'user_info', '{}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_table` VALUES ('22', '3', '', null, 'province', '{}', '2017-06-22 10:45:44', '2017-06-29 21:50:05');
INSERT INTO `raw_table` VALUES ('23', '3', '', null, 'zxbz', '{}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_table` VALUES ('24', '3', '', null, 'wxb_good_type', '{}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_table` VALUES ('25', '3', '', null, 'projgroup', '{}', '2017-06-22 10:45:44', '2017-06-29 21:50:06');
INSERT INTO `raw_table` VALUES ('26', '3', '', null, 'visit', '{}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_table` VALUES ('27', '3', '', null, 'visit_t', '{}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_table` VALUES ('28', '3', '', null, 'lita_reportdesigner_tabledependent', '{}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_table` VALUES ('29', '3', '', null, 'sys_pointlog', '{}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_table` VALUES ('30', '3', '', null, 'task_biaoqian', '{}', '2017-06-22 10:45:45', '2017-06-29 21:50:07');
INSERT INTO `raw_table` VALUES ('31', '3', '', null, 'ofproperty', '{}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_table` VALUES ('32', '3', '', null, 'zipcode', '{}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_table` VALUES ('33', '3', '', null, 'ofmucserviceprop', '{}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_table` VALUES ('34', '3', '', null, 'ofpubsubnode', '{}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_table` VALUES ('35', '3', '', null, 'wxb_news', '{}', '2017-06-22 10:45:46', '2017-06-29 21:50:08');
INSERT INTO `raw_table` VALUES ('36', '3', '', null, 'dp_xiaoshou_daydata', '{}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_table` VALUES ('37', '3', '', null, 'mtzh', '{}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_table` VALUES ('38', '3', '', null, 'client_msql_log', '{}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_table` VALUES ('39', '3', '', null, 'book_article_dis', '{}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_table` VALUES ('40', '3', '', null, 'offwork', '{}', '2017-06-22 10:45:47', '2017-06-29 21:50:09');
INSERT INTO `raw_table` VALUES ('41', '3', '', null, 'wxb_channel', '{}', '2017-06-22 10:45:48', '2017-06-29 21:50:10');
INSERT INTO `raw_table` VALUES ('42', '3', '', null, 'dp_xiaoshou_khllsj', '{}', '2017-06-22 10:45:48', '2017-06-29 21:50:10');
INSERT INTO `raw_table` VALUES ('43', '3', '', null, 'ofuserflag', '{}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_table` VALUES ('44', '3', '', null, 'ofpubsubnodegroups', '{}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_table` VALUES ('45', '3', '', null, 'wxb_good_sku', '{}', '2017-06-22 10:45:48', '2017-06-29 21:50:11');
INSERT INTO `raw_table` VALUES ('46', '3', '', null, 'wxb_server_count', '{}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_table` VALUES ('47', '3', '', null, 'project_files', '{}', '2017-06-22 10:45:49', '2017-06-29 21:50:11');
INSERT INTO `raw_table` VALUES ('48', '3', '', null, 'loginandlogout', '{}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_table` VALUES ('49', '3', '', null, 'dp_edit_watype', '{}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_table` VALUES ('50', '3', '', null, 'user_reply_info', '{}', '2017-06-22 10:45:49', '2017-06-29 21:50:12');
INSERT INTO `raw_table` VALUES ('51', '3', '', null, 'wxb_customer', '{}', '2017-06-22 10:45:50', '2017-06-29 21:50:12');
INSERT INTO `raw_table` VALUES ('52', '3', '', null, 'ofsaslauthorized', '{}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_table` VALUES ('53', '3', '', null, 'sys_role', '{}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_table` VALUES ('54', '3', '', null, 'wxb_good', '{}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_table` VALUES ('55', '3', '', null, 'ofoffline', '{}', '2017-06-22 10:45:50', '2017-06-29 21:50:13');
INSERT INTO `raw_table` VALUES ('56', '3', '', null, 'user_service_ceshiceshi', '{}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_table` VALUES ('57', '3', '', null, 'dp_edit_wa', '{}', '2017-06-22 10:45:51', '2017-06-29 21:50:14');
INSERT INTO `raw_table` VALUES ('58', '3', '', null, 'tg_ggf', '{}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_table` VALUES ('59', '3', '', null, 'fj', '{}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_table` VALUES ('60', '3', '', null, 'wxb_charge_log', '{}', '2017-06-22 10:45:51', '2017-06-29 21:50:15');
INSERT INTO `raw_table` VALUES ('61', '3', '', null, 'ofrostergroups', '{}', '2017-06-22 10:45:52', '2017-06-29 21:50:15');
INSERT INTO `raw_table` VALUES ('62', '3', '', null, 'sys_module', '{}', '2017-06-22 10:45:52', '2017-06-29 21:50:15');
INSERT INTO `raw_table` VALUES ('63', '3', '', null, 'wxb_login_log', '{}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_table` VALUES ('64', '3', '', null, 'xiaoshou_xzfs', '{}', '2017-06-22 10:45:52', '2017-06-29 21:50:16');
INSERT INTO `raw_table` VALUES ('65', '3', '', null, 'ofmucmember', '{}', '2017-06-22 10:45:52', '2017-06-29 21:50:17');
INSERT INTO `raw_table` VALUES ('66', '3', '', null, 'ofid', '{}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_table` VALUES ('67', '3', '', null, 'book_catalog_pirvate', '{}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_table` VALUES ('68', '3', '', null, 'ofpubsubdefaultconf', '{}', '2017-06-22 10:45:53', '2017-06-29 21:50:17');
INSERT INTO `raw_table` VALUES ('69', '3', '', null, 'ofpubsubnodejids', '{}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_table` VALUES ('70', '3', '', null, 'ofroster', '{}', '2017-06-22 10:45:53', '2017-06-29 21:50:18');
INSERT INTO `raw_table` VALUES ('71', '3', '', null, 'book_catalog', '{}', '2017-06-22 10:45:54', '2017-06-29 21:50:18');
INSERT INTO `raw_table` VALUES ('72', '3', '', null, 'sys_pointgift', '{}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_table` VALUES ('73', '3', '', null, 'wxb_visit_log', '{}', '2017-06-22 10:45:54', '2017-06-29 21:50:19');
INSERT INTO `raw_table` VALUES ('74', '3', '', null, 'deptment', '{}', '2017-06-22 10:45:55', '2017-06-29 21:50:19');
INSERT INTO `raw_table` VALUES ('75', '3', '', null, 'tgjihua', '{}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_table` VALUES ('76', '3', '', null, 'ofremoteserverconf', '{}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_table` VALUES ('77', '3', '', null, 'dp_tuiguang_mtbm', '{}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_table` VALUES ('78', '3', '', null, 'projects', '{}', '2017-06-22 10:45:55', '2017-06-29 21:50:20');
INSERT INTO `raw_table` VALUES ('79', '3', '', null, 'user_service_测试啊啊啊', '{}', '2017-06-22 10:45:56', '2017-06-26 19:05:44');
INSERT INTO `raw_table` VALUES ('80', '3', '', null, 'wxb_pay_log', '{}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_table` VALUES ('81', '3', '', null, 'dp_xiaoshou_xssj', '{}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_table` VALUES ('82', '3', '', null, 'wxb_good_copy', '{}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_table` VALUES ('83', '3', '', null, 'sys_task_expinfo', '{}', '2017-06-22 10:45:56', '2017-06-29 21:50:21');
INSERT INTO `raw_table` VALUES ('84', '3', '', null, 'region', '{}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_table` VALUES ('85', '3', '', null, 'wenan_list', '{}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_table` VALUES ('86', '3', '', null, 'sys_user_role', '{}', '2017-06-22 10:45:57', '2017-06-29 21:50:22');
INSERT INTO `raw_table` VALUES ('87', '3', '', null, 'lita_reportdesigner_\n_datasource', '{}', '2017-06-22 10:45:57', '2017-06-29 21:50:23');
INSERT INTO `raw_table` VALUES ('88', '3', '', null, 'sys_code', '{}', '2017-06-22 10:45:57', '2017-06-29 21:50:23');
INSERT INTO `raw_table` VALUES ('89', '3', '', null, 'wxb_order_count', '{}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_table` VALUES ('90', '3', '', null, 'wxb_user_money', '{}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_table` VALUES ('91', '3', '', null, 'mtbm', '{}', '2017-06-22 10:45:58', '2017-06-29 21:50:24');
INSERT INTO `raw_table` VALUES ('92', '3', '', null, 'wxb_memeber', '{}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_table` VALUES ('93', '3', '', null, 'city', '{}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_table` VALUES ('94', '3', '', null, 'ofversion', '{}', '2017-06-22 10:45:58', '2017-06-29 21:50:25');
INSERT INTO `raw_table` VALUES ('95', '3', '', null, 'ofvcard', '{}', '2017-06-22 10:45:59', '2017-06-29 21:50:25');
INSERT INTO `raw_table` VALUES ('96', '3', '', null, 'ofprivacylist', '{}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_table` VALUES ('97', '3', '', null, 'ofpresence', '{}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_table` VALUES ('98', '3', '', null, 'tg_proj', '{}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_table` VALUES ('99', '3', '', null, 'sys_user_gift_log', '{}', '2017-06-22 10:45:59', '2017-06-29 21:50:26');
INSERT INTO `raw_table` VALUES ('100', '3', '', null, 'assignment', '{}', '2017-06-22 10:45:59', '2017-06-29 21:50:27');
INSERT INTO `raw_table` VALUES ('101', '3', '', null, 'project_filefolder', '{}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_table` VALUES ('102', '3', '', null, 'ofmucconversationlog', '{}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_table` VALUES ('103', '3', '', null, 'dependency', '{}', '2017-06-22 10:46:00', '2017-06-29 21:50:27');
INSERT INTO `raw_table` VALUES ('104', '3', '', null, 'ofsecurityauditlog', '{}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_table` VALUES ('105', '3', '', null, 'dp_tuiguang_daydata', '{}', '2017-06-22 10:46:00', '2017-06-29 21:50:28');
INSERT INTO `raw_table` VALUES ('106', '3', '', null, 'user_service_销售业绩', '{}', '2017-06-22 10:46:01', '2017-06-26 19:05:50');
INSERT INTO `raw_table` VALUES ('107', '3', '', null, 'wxb_order_log', '{}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_table` VALUES ('108', '3', '', null, 'proj_group', '{}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_table` VALUES ('109', '3', '', null, 'sys_sequence', '{}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_table` VALUES ('110', '3', '', null, 'ofpubsubitem', '{}', '2017-06-22 10:46:01', '2017-06-29 21:50:29');
INSERT INTO `raw_table` VALUES ('111', '3', '', null, 'dp_tuiguang_plan', '{}', '2017-06-22 10:46:02', '2017-06-29 21:50:30');
INSERT INTO `raw_table` VALUES ('112', '3', '', null, 'book_article_private', '{}', '2017-06-22 10:46:02', '2017-06-29 21:50:31');
INSERT INTO `raw_table` VALUES ('113', '3', '', null, 'checkpass', '{}', '2017-06-22 10:46:02', '2017-06-29 21:50:31');
INSERT INTO `raw_table` VALUES ('114', '3', '', null, 'wxb_server_log', '{}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_table` VALUES ('115', '3', '', null, 'sys_role_fun', '{}', '2017-06-22 10:46:02', '2017-06-29 21:50:32');
INSERT INTO `raw_table` VALUES ('116', '3', '', null, 'sys_mempoint', '{}', '2017-06-22 10:46:03', '2017-06-29 21:50:32');
INSERT INTO `raw_table` VALUES ('117', '3', '', null, 'user_focus', '{}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_table` VALUES ('118', '3', '', null, 'pizhu', '{}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_table` VALUES ('119', '3', '', null, 'ofgroupprop', '{}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_table` VALUES ('120', '3', '', null, 'sys_notify', '{}', '2017-06-22 10:46:03', '2017-06-29 21:50:33');
INSERT INTO `raw_table` VALUES ('121', '3', '', null, 'ofextcomponentconf', '{}', '2017-06-22 10:46:04', '2017-06-29 21:50:34');
INSERT INTO `raw_table` VALUES ('122', '3', '', null, 'dp_xiezuo_maindata', '{}', '2017-06-22 10:46:04', '2017-06-29 21:50:35');
INSERT INTO `raw_table` VALUES ('123', '3', '', null, 'sys_param', '{}', '2017-06-22 10:46:04', '2017-06-29 21:50:35');
INSERT INTO `raw_table` VALUES ('124', '3', '', null, 'userfocus', '{}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_table` VALUES ('125', '3', '', null, 'user_exp_info', '{}', '2017-06-22 10:46:04', '2017-06-29 21:50:36');
INSERT INTO `raw_table` VALUES ('126', '3', '', null, 'ofmucroom', '{}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_table` VALUES ('127', '3', '', null, 'ofmucroomprop', '{}', '2017-06-22 10:46:05', '2017-06-29 21:50:36');
INSERT INTO `raw_table` VALUES ('128', '3', '', null, 'resources', '{}', '2017-06-22 10:46:05', '2017-06-29 21:50:37');
INSERT INTO `raw_table` VALUES ('129', '3', '', null, 'task_loop', '{}', '2017-06-22 10:46:05', '2017-06-29 21:50:37');
INSERT INTO `raw_table` VALUES ('130', '3', '', null, 'task', '{}', '2017-06-22 10:46:05', '2017-06-29 21:50:37');
INSERT INTO `raw_table` VALUES ('131', '3', '', null, 'dp_xiaoshou_jscj', '{}', '2017-06-22 10:46:06', '2017-06-29 21:50:38');
INSERT INTO `raw_table` VALUES ('132', '3', '', null, 'ofmucaffiliation', '{}', '2017-06-22 10:46:06', '2017-06-29 21:50:38');
INSERT INTO `raw_table` VALUES ('133', '3', '', null, 'wxb_order', '{}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_table` VALUES ('134', '3', '', null, 'wxb_server_money', '{}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_table` VALUES ('135', '3', '', null, 'userservice', '{}', '2017-06-22 10:46:07', '2017-06-29 21:50:39');
INSERT INTO `raw_table` VALUES ('136', '3', '', null, 'xiaoshou_cjsj', '{}', '2017-06-22 10:46:07', '2017-06-29 21:50:40');
INSERT INTO `raw_table` VALUES ('137', '3', '', null, 'ofuserprop', '{}', '2017-06-22 10:46:08', '2017-06-29 21:50:41');
INSERT INTO `raw_table` VALUES ('270', '4', '', 'PUBLIC', 'PRODUCTS', '{}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_table` VALUES ('271', '4', '', 'PUBLIC', 'ORDERS', '{}', '2017-06-22 10:59:29', '2017-06-22 10:59:29');
INSERT INTO `raw_table` VALUES ('272', '4', '', 'PUBLIC', 'PEOPLE', '{}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_table` VALUES ('273', '4', '', 'PUBLIC', '_METABASE_METADATA', '{}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_table` VALUES ('274', '4', '', 'PUBLIC', 'REVIEWS', '{}', '2017-06-22 10:59:30', '2017-06-22 10:59:30');
INSERT INTO `raw_table` VALUES ('275', '3', '', null, 'user_service_添加文案', '{}', '2017-06-22 17:50:02', '2017-06-29 21:50:02');
INSERT INTO `raw_table` VALUES ('276', '3', '', null, 'sys_service_test', '{}', '2017-06-25 14:12:12', '2017-06-25 14:12:12');
INSERT INTO `raw_table` VALUES ('277', '3', '', null, '宽表测试', '{}', '2017-06-25 14:18:01', '2017-06-26 19:05:50');
INSERT INTO `raw_table` VALUES ('278', '3', '', null, 'user_service_加客量', '{}', '2017-06-29 21:50:05', '2017-06-29 21:50:05');
INSERT INTO `raw_table` VALUES ('279', '3', '', null, 'user_service_推广计划效果表', '{}', '2017-06-29 21:50:07', '2017-06-29 21:50:07');
INSERT INTO `raw_table` VALUES ('280', '3', '', null, 'user_service_当天咨询客户量', '{}', '2017-06-29 21:50:17', '2017-06-29 21:50:17');
INSERT INTO `raw_table` VALUES ('281', '3', '', null, 'user_service_推广计划表', '{}', '2017-06-29 21:50:30', '2017-06-29 21:50:30');
INSERT INTO `raw_table` VALUES ('282', '3', '', null, 'user_service_销售量', '{}', '2017-06-29 21:50:40', '2017-06-29 21:50:40');

-- ----------------------------
-- Table structure for `report_card`
-- ----------------------------
DROP TABLE IF EXISTS `report_card`;
CREATE TABLE `report_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `display` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `dataset_query` text COLLATE utf8_unicode_ci NOT NULL,
  `visualization_settings` text COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` int(11) NOT NULL,
  `database_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `query_type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archived` bit(1) NOT NULL DEFAULT b'0',
  `collection_id` int(11) DEFAULT NULL COMMENT 'Optional ID of Collection this Card belongs to.',
  `public_uuid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Unique UUID used to in publically-accessible links to this Card.',
  `made_public_by_id` int(11) DEFAULT NULL COMMENT 'The ID of the User who first publically shared this Card.',
  `enable_embedding` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Is this Card allowed to be embedded in different websites (using a signed JWT)?',
  `embedding_params` text COLLATE utf8_unicode_ci COMMENT 'Serialized JSON containing information about required parameters that must be supplied when embedding this Card.',
  `cache_ttl` int(11) DEFAULT NULL COMMENT 'The maximum time, in seconds, to return cached results for this Card rather than running a new query.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `public_uuid` (`public_uuid`),
  KEY `idx_card_creator_id` (`creator_id`),
  KEY `fk_report_card_ref_database_id` (`database_id`),
  KEY `fk_report_card_ref_table_id` (`table_id`),
  KEY `idx_card_collection_id` (`collection_id`),
  KEY `fk_card_made_public_by_id` (`made_public_by_id`),
  KEY `idx_card_public_uuid` (`public_uuid`),
  CONSTRAINT `fk_card_collection_id` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`),
  CONSTRAINT `fk_card_made_public_by_id` FOREIGN KEY (`made_public_by_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `fk_card_ref_user_id` FOREIGN KEY (`creator_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `fk_report_card_ref_database_id` FOREIGN KEY (`database_id`) REFERENCES `metabase_database` (`id`),
  CONSTRAINT `fk_report_card_ref_table_id` FOREIGN KEY (`table_id`) REFERENCES `metabase_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of report_card
-- ----------------------------
INSERT INTO `report_card` VALUES ('1', '2017-06-22 12:27:18', '2017-06-24 17:44:47', 'Tasks', null, 'table', '{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":91}}', '{}', '1', '3', '91', 'query', '', null, null, null, '', null, null);
INSERT INTO `report_card` VALUES ('2', '2017-06-22 14:52:32', '2017-06-24 17:44:46', 'Projects', null, 'table', '{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":73}}', '{}', '1', '3', '73', 'query', '', null, null, null, '', null, null);
INSERT INTO `report_card` VALUES ('3', '2017-06-22 16:31:27', '2017-06-24 17:44:47', 'Tasks', null, 'line', '{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":91}}', '{\"graph.dimensions\":[\"id\"],\"graph.metrics\":[\"percent_done\"]}', '1', '3', '91', 'query', '', null, null, null, '', null, null);
INSERT INTO `report_card` VALUES ('4', '2017-06-24 17:38:05', '2017-06-24 17:54:40', '项目进度', null, 'bar', '{\"database\":3,\"type\":\"native\",\"native\":{\"query\":\"SELECT SUM(percent_done)/(count(`name`)*100)*100 as \'项目进度\',tmp.pname as \'项目名\'   from (\\r\\nSELECT task.name,task.percent_done,projects.name as pname from task\\r\\n LEFT JOIN projects\\r\\nON task.pid = projects.id\\r\\nWHERE projects.isclose=0 AND projects.isdel=0\\r\\n)as tmp\\r\\nGROUP BY tmp.pname\"}}', '{\"graph.dimensions\":[\"项目名\"],\"graph.metrics\":[\"项目进度\"]}', '1', null, null, 'native', '', null, null, null, '', null, null);

-- ----------------------------
-- Table structure for `report_cardfavorite`
-- ----------------------------
DROP TABLE IF EXISTS `report_cardfavorite`;
CREATE TABLE `report_cardfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `card_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_cardfavorite_card_id_owner_id` (`card_id`,`owner_id`),
  KEY `idx_cardfavorite_card_id` (`card_id`),
  KEY `idx_cardfavorite_owner_id` (`owner_id`),
  CONSTRAINT `fk_cardfavorite_ref_card_id` FOREIGN KEY (`card_id`) REFERENCES `report_card` (`id`),
  CONSTRAINT `fk_cardfavorite_ref_user_id` FOREIGN KEY (`owner_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of report_cardfavorite
-- ----------------------------

-- ----------------------------
-- Table structure for `report_dashboard`
-- ----------------------------
DROP TABLE IF EXISTS `report_dashboard`;
CREATE TABLE `report_dashboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `creator_id` int(11) NOT NULL,
  `parameters` text COLLATE utf8_unicode_ci NOT NULL,
  `points_of_interest` text COLLATE utf8_unicode_ci,
  `caveats` text COLLATE utf8_unicode_ci,
  `show_in_getting_started` bit(1) NOT NULL DEFAULT b'0',
  `public_uuid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Unique UUID used to in publically-accessible links to this Dashboard.',
  `made_public_by_id` int(11) DEFAULT NULL COMMENT 'The ID of the User who first publically shared this Dashboard.',
  `enable_embedding` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Is this Dashboard allowed to be embedded in different websites (using a signed JWT)?',
  `embedding_params` text COLLATE utf8_unicode_ci COMMENT 'Serialized JSON containing information about required parameters that must be supplied when embedding this Dashboard.',
  `archived` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Is this Dashboard archived (effectively treated as deleted?)',
  `position` int(11) DEFAULT NULL COMMENT 'The position this Dashboard should appear in the Dashboards list, lower-numbered positions appearing before higher numbered ones.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `public_uuid` (`public_uuid`),
  KEY `idx_dashboard_creator_id` (`creator_id`),
  KEY `idx_report_dashboard_show_in_getting_started` (`show_in_getting_started`),
  KEY `fk_dashboard_made_public_by_id` (`made_public_by_id`),
  KEY `idx_dashboard_public_uuid` (`public_uuid`),
  CONSTRAINT `fk_dashboard_made_public_by_id` FOREIGN KEY (`made_public_by_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `fk_dashboard_ref_user_id` FOREIGN KEY (`creator_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of report_dashboard
-- ----------------------------
INSERT INTO `report_dashboard` VALUES ('1', '2017-06-22 00:22:57', '2017-06-24 17:45:03', 'sasfd', null, '1', '[]', null, null, '', null, null, '', null, '', null);

-- ----------------------------
-- Table structure for `report_dashboardcard`
-- ----------------------------
DROP TABLE IF EXISTS `report_dashboardcard`;
CREATE TABLE `report_dashboardcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sizeX` int(11) NOT NULL,
  `sizeY` int(11) NOT NULL,
  `row` int(11) NOT NULL DEFAULT '0',
  `col` int(11) NOT NULL DEFAULT '0',
  `card_id` int(11) NOT NULL,
  `dashboard_id` int(11) NOT NULL,
  `parameter_mappings` text COLLATE utf8_unicode_ci NOT NULL,
  `visualization_settings` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dashboardcard_card_id` (`card_id`),
  KEY `idx_dashboardcard_dashboard_id` (`dashboard_id`),
  CONSTRAINT `fk_dashboardcard_ref_card_id` FOREIGN KEY (`card_id`) REFERENCES `report_card` (`id`),
  CONSTRAINT `fk_dashboardcard_ref_dashboard_id` FOREIGN KEY (`dashboard_id`) REFERENCES `report_dashboard` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of report_dashboardcard
-- ----------------------------
INSERT INTO `report_dashboardcard` VALUES ('4', '2017-06-24 17:38:56', '2017-06-24 17:45:03', '18', '5', '0', '0', '4', '1', '[]', '{}');

-- ----------------------------
-- Table structure for `revision`
-- ----------------------------
DROP TABLE IF EXISTS `revision`;
CREATE TABLE `revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `object` text COLLATE utf8_unicode_ci NOT NULL,
  `is_reversion` bit(1) NOT NULL DEFAULT b'0',
  `is_creation` bit(1) NOT NULL DEFAULT b'0',
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_revision_ref_user_id` (`user_id`),
  KEY `idx_revision_model_model_id` (`model_id`),
  CONSTRAINT `fk_revision_ref_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of revision
-- ----------------------------
INSERT INTO `revision` VALUES ('1', 'Card', '1', '1', '2017-06-22 12:27:18', '{\"description\":null,\"archived\":false,\"table_id\":91,\"database_id\":3,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"query\",\"name\":\"Tasks\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":91}},\"id\":1,\"display\":\"table\",\"visualization_settings\":{},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('3', 'Dashboard', '1', '1', '2017-06-22 12:27:41', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":0,\"id\":1,\"card_id\":1,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('4', 'Dashboard', '1', '1', '2017-06-22 12:27:41', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":0,\"id\":1,\"card_id\":1,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('5', 'Card', '2', '1', '2017-06-22 14:52:33', '{\"description\":null,\"archived\":false,\"table_id\":73,\"database_id\":3,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"query\",\"name\":\"Projects\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":73}},\"id\":2,\"display\":\"table\",\"visualization_settings\":{},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('6', 'Dashboard', '1', '1', '2017-06-22 14:52:48', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":0,\"id\":1,\"card_id\":1,\"series\":[]},{\"sizeX\":2,\"sizeY\":2,\"row\":0,\"col\":0,\"id\":2,\"card_id\":2,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('7', 'Dashboard', '1', '1', '2017-06-22 14:52:48', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":0,\"id\":1,\"card_id\":1,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":6,\"id\":2,\"card_id\":2,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('8', 'Dashboard', '1', '1', '2017-06-22 14:52:48', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":0,\"id\":1,\"card_id\":1,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":6,\"id\":2,\"card_id\":2,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('9', 'Card', '2', '1', '2017-06-22 14:53:50', '{\"description\":null,\"archived\":false,\"table_id\":73,\"database_id\":3,\"enable_embedding\":false,\"collection_id\":1,\"query_type\":\"query\",\"name\":\"Projects\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":73}},\"id\":2,\"display\":\"table\",\"visualization_settings\":{},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('10', 'Card', '1', '1', '2017-06-22 14:53:50', '{\"description\":null,\"archived\":false,\"table_id\":91,\"database_id\":3,\"enable_embedding\":false,\"collection_id\":1,\"query_type\":\"query\",\"name\":\"Tasks\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":91}},\"id\":1,\"display\":\"table\",\"visualization_settings\":{},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('11', 'Card', '3', '1', '2017-06-22 16:31:27', '{\"description\":null,\"archived\":false,\"table_id\":91,\"database_id\":3,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"query\",\"name\":\"Tasks\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":91}},\"id\":3,\"display\":\"line\",\"visualization_settings\":{\"graph.dimensions\":[\"id\"],\"graph.metrics\":[\"percent_done\"]},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('12', 'Dashboard', '1', '1', '2017-06-22 16:31:46', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":0,\"id\":1,\"card_id\":1,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":6,\"id\":2,\"card_id\":2,\"series\":[]},{\"sizeX\":2,\"sizeY\":2,\"row\":0,\"col\":0,\"id\":3,\"card_id\":3,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('13', 'Dashboard', '1', '1', '2017-06-22 16:31:46', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":0,\"id\":1,\"card_id\":1,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":6,\"id\":2,\"card_id\":2,\"series\":[]},{\"sizeX\":18,\"sizeY\":4,\"row\":4,\"col\":0,\"id\":3,\"card_id\":3,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('14', 'Dashboard', '1', '1', '2017-06-22 16:31:46', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":0,\"id\":1,\"card_id\":1,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":6,\"id\":2,\"card_id\":2,\"series\":[]},{\"sizeX\":18,\"sizeY\":4,\"row\":4,\"col\":0,\"id\":3,\"card_id\":3,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('15', 'Card', '4', '1', '2017-06-24 17:38:06', '{\"description\":null,\"archived\":false,\"table_id\":null,\"database_id\":null,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"native\",\"name\":\"项目进度\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"native\",\"native\":{\"query\":\"SELECT SUM(percent_done)/(count(`name`)*100)*100 as projectsPercentdone,tmp.pname  from (\\r\\nSELECT task.name,task.percent_done,projects.name as pname from task\\r\\n LEFT JOIN projects\\r\\nON task.pid = projects.id\\r\\n\\r\\n)as tmp\\r\\nGROUP BY tmp.pname\"}},\"id\":4,\"display\":\"bar\",\"visualization_settings\":{\"graph.dimensions\":[\"pname\"],\"graph.metrics\":[\"projectsPercentdone\"]},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('16', 'Dashboard', '1', '1', '2017-06-24 17:38:56', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":0,\"id\":1,\"card_id\":1,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":6,\"id\":2,\"card_id\":2,\"series\":[]},{\"sizeX\":18,\"sizeY\":4,\"row\":4,\"col\":0,\"id\":3,\"card_id\":3,\"series\":[]},{\"sizeX\":2,\"sizeY\":2,\"row\":0,\"col\":0,\"id\":4,\"card_id\":4,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('17', 'Dashboard', '1', '1', '2017-06-24 17:38:57', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":5,\"col\":11,\"id\":1,\"card_id\":1,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":6,\"col\":2,\"id\":2,\"card_id\":2,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":12,\"id\":3,\"card_id\":3,\"series\":[]},{\"sizeX\":10,\"sizeY\":6,\"row\":0,\"col\":1,\"id\":4,\"card_id\":4,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('18', 'Dashboard', '1', '1', '2017-06-24 17:38:57', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":5,\"col\":11,\"id\":1,\"card_id\":1,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":6,\"col\":2,\"id\":2,\"card_id\":2,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":12,\"id\":3,\"card_id\":3,\"series\":[]},{\"sizeX\":10,\"sizeY\":6,\"row\":0,\"col\":1,\"id\":4,\"card_id\":4,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('19', 'Dashboard', '1', '1', '2017-06-24 17:39:59', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":5,\"col\":11,\"id\":1,\"card_id\":1,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":6,\"col\":2,\"id\":2,\"card_id\":2,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":12,\"id\":3,\"card_id\":3,\"series\":[]},{\"sizeX\":10,\"sizeY\":6,\"row\":0,\"col\":1,\"id\":4,\"card_id\":4,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('20', 'Dashboard', '1', '1', '2017-06-24 17:40:14', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":6,\"sizeY\":4,\"row\":5,\"col\":11,\"id\":1,\"card_id\":1,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":6,\"col\":2,\"id\":2,\"card_id\":2,\"series\":[]},{\"sizeX\":6,\"sizeY\":4,\"row\":0,\"col\":12,\"id\":3,\"card_id\":3,\"series\":[]},{\"sizeX\":10,\"sizeY\":6,\"row\":0,\"col\":1,\"id\":4,\"card_id\":4,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('21', 'Card', '3', '1', '2017-06-24 17:44:23', '{\"description\":null,\"archived\":false,\"table_id\":91,\"database_id\":3,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"query\",\"name\":\"Tasks\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":91}},\"id\":3,\"display\":\"line\",\"visualization_settings\":{\"graph.dimensions\":[\"id\"],\"graph.metrics\":[\"percent_done\"]},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('22', 'Card', '2', '1', '2017-06-24 17:44:34', '{\"description\":null,\"archived\":false,\"table_id\":73,\"database_id\":3,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"query\",\"name\":\"Projects\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":73}},\"id\":2,\"display\":\"table\",\"visualization_settings\":{},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('23', 'Card', '1', '1', '2017-06-24 17:44:35', '{\"description\":null,\"archived\":false,\"table_id\":91,\"database_id\":3,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"query\",\"name\":\"Tasks\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":91}},\"id\":1,\"display\":\"table\",\"visualization_settings\":{},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('24', 'Card', '2', '1', '2017-06-24 17:44:47', '{\"description\":null,\"archived\":true,\"table_id\":73,\"database_id\":3,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"query\",\"name\":\"Projects\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":73}},\"id\":2,\"display\":\"table\",\"visualization_settings\":{},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('25', 'Card', '3', '1', '2017-06-24 17:44:47', '{\"description\":null,\"archived\":true,\"table_id\":91,\"database_id\":3,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"query\",\"name\":\"Tasks\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":91}},\"id\":3,\"display\":\"line\",\"visualization_settings\":{\"graph.dimensions\":[\"id\"],\"graph.metrics\":[\"percent_done\"]},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('26', 'Card', '1', '1', '2017-06-24 17:44:47', '{\"description\":null,\"archived\":true,\"table_id\":91,\"database_id\":3,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"query\",\"name\":\"Tasks\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"query\",\"query\":{\"source_table\":91}},\"id\":1,\"display\":\"table\",\"visualization_settings\":{},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('27', 'Dashboard', '1', '1', '2017-06-24 17:45:03', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":18,\"sizeY\":5,\"row\":0,\"col\":0,\"id\":4,\"card_id\":4,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('28', 'Dashboard', '1', '1', '2017-06-24 17:45:03', '{\"description\":null,\"name\":\"sasfd\",\"cards\":[{\"sizeX\":18,\"sizeY\":5,\"row\":0,\"col\":0,\"id\":4,\"card_id\":4,\"series\":[]}]}', '', '', null);
INSERT INTO `revision` VALUES ('29', 'Card', '4', '1', '2017-06-24 17:49:46', '{\"description\":null,\"archived\":false,\"table_id\":null,\"database_id\":null,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"native\",\"name\":\"项目进度\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"native\",\"native\":{\"query\":\"SELECT SUM(percent_done)/(count(`name`)*100)*100 as \'项目进度\',tmp.pname as \'项目名\'   from (\\r\\nSELECT task.name,task.percent_done,projects.name as pname from task\\r\\n LEFT JOIN projects\\r\\nON task.pid = projects.id\\r\\n\\r\\n)as tmp\\r\\nGROUP BY tmp.pname\"}},\"id\":4,\"display\":\"bar\",\"visualization_settings\":{\"graph.dimensions\":[\"项目名\"],\"graph.metrics\":[\"项目进度\"]},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('30', 'Card', '4', '1', '2017-06-24 17:52:57', '{\"description\":null,\"archived\":false,\"table_id\":null,\"database_id\":null,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"native\",\"name\":\"项目进度\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"native\",\"native\":{\"query\":\"SELECT SUM(percent_done)/(count(`name`)*100)*100 as \'项目进度\',tmp.pname as \'项目名\'   from (\\r\\nSELECT task.name,task.percent_done,projects.name as pname from task\\r\\n LEFT JOIN projects\\r\\nON task.pid = projects.id\\r\\nWHERE projects.isclose!=1 AND projects.isclose!=1\\r\\n)as tmp\\r\\nGROUP BY tmp.pname\"}},\"id\":4,\"display\":\"bar\",\"visualization_settings\":{\"graph.dimensions\":[\"项目名\"],\"graph.metrics\":[\"项目进度\"]},\"public_uuid\":null}', '', '', null);
INSERT INTO `revision` VALUES ('31', 'Card', '4', '1', '2017-06-24 17:54:40', '{\"description\":null,\"archived\":false,\"table_id\":null,\"database_id\":null,\"enable_embedding\":false,\"collection_id\":null,\"query_type\":\"native\",\"name\":\"项目进度\",\"creator_id\":1,\"made_public_by_id\":null,\"embedding_params\":null,\"cache_ttl\":null,\"dataset_query\":{\"database\":3,\"type\":\"native\",\"native\":{\"query\":\"SELECT SUM(percent_done)/(count(`name`)*100)*100 as \'项目进度\',tmp.pname as \'项目名\'   from (\\r\\nSELECT task.name,task.percent_done,projects.name as pname from task\\r\\n LEFT JOIN projects\\r\\nON task.pid = projects.id\\r\\nWHERE projects.isclose=0 AND projects.isdel=0\\r\\n)as tmp\\r\\nGROUP BY tmp.pname\"}},\"id\":4,\"display\":\"bar\",\"visualization_settings\":{\"graph.dimensions\":[\"项目名\"],\"graph.metrics\":[\"项目进度\"]},\"public_uuid\":null}', '', '', null);

-- ----------------------------
-- Table structure for `segment`
-- ----------------------------
DROP TABLE IF EXISTS `segment`;
CREATE TABLE `segment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `definition` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `points_of_interest` text COLLATE utf8_unicode_ci,
  `caveats` text COLLATE utf8_unicode_ci,
  `show_in_getting_started` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `idx_segment_creator_id` (`creator_id`),
  KEY `idx_segment_table_id` (`table_id`),
  KEY `idx_segment_show_in_getting_started` (`show_in_getting_started`),
  CONSTRAINT `fk_segment_ref_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `fk_segment_ref_table_id` FOREIGN KEY (`table_id`) REFERENCES `metabase_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of segment
-- ----------------------------

-- ----------------------------
-- Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `key` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('admin-email', 'scc@scc.com');
INSERT INTO `setting` VALUES ('anon-tracking-enabled', 'true');
INSERT INTO `setting` VALUES ('site-name', 'scc');
INSERT INTO `setting` VALUES ('site-url', 'http://localhost:3000');
INSERT INTO `setting` VALUES ('version-info', '{\"latest\":{\"version\":\"v0.24.2\",\"released\":\"2017-06-01T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"Misc Bug fixes\"]},\"older\":[{\"version\":\"v0.24.1\",\"released\":\"2017-05-10T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"Fix upgrades with MySQL/Mariadb\"]},{\"version\":\"v0.24.0\",\"released\":\"2017-05-10T11:09:36.358Z\",\"patch\":false,\"highlights\":[\"Drill-through + Actions\",\"Result Caching\",\"Presto Driver\"]},{\"version\":\"v0.23.1\",\"released\":\"2017-03-30T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"Filter widgets for SQL Template Variables\",\"Fix spurious startup error\",\"Java 7 startup bug fixed\"]},{\"version\":\"v0.23.0\",\"released\":\"2017-03-21T11:09:36.358Z\",\"patch\":false,\"highlights\":[\"Public links for cards + dashboards\",\"Embedding cards + dashboards in other applications\",\"Encryption of database credentials\"]},{\"version\":\"v0.22.2\",\"released\":\"2017-01-10T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"Fix startup on OpenJDK 7\"]},{\"version\":\"v0.22.1\",\"released\":\"2017-01-10T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"IMPORTANT: Closed a Collections Permissions security hole\",\"Improved startup performance\",\"Bug fixes\"]},{\"version\":\"v0.22.0\",\"released\":\"2017-01-10T11:09:36.358Z\",\"patch\":false,\"highlights\":[\"Collections + Collections Permissions\",\"Multiple Aggregations\",\"Custom Expressions\"]},{\"version\":\"v0.21.1\",\"released\":\"2016-12-08T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"BigQuery bug fixes\",\"Charting bug fixes\"]},{\"version\":\"v0.21.0\",\"released\":\"2016-12-08T11:09:36.358Z\",\"patch\":false,\"highlights\":[\"Google Analytics Driver\",\"Vertica Driver\",\"Better Time + Date Filters\"]},{\"version\":\"v0.20.3\",\"released\":\"2016-10-26T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"Fix H2->MySQL/PostgreSQL migrations, part 2\"]},{\"version\":\"v0.20.2\",\"released\":\"2016-10-25T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"Support Oracle 10+11\",\"Fix H2->MySQL/PostgreSQL migrations\",\"Revision timestamp fix\"]},{\"version\":\"v0.20.1\",\"released\":\"2016-10-18T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"Lots of bug fixes\"]},{\"version\":\"v0.20.0\",\"released\":\"2016-10-11T11:09:36.358Z\",\"patch\":false,\"highlights\":[\"Data access permissions\",\"Oracle Driver\",\"Charting improvements\"]},{\"version\":\"v0.19.3\",\"released\":\"2016-08-12T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"fix Dashboard editing header\"]},{\"version\":\"v0.19.2\",\"released\":\"2016-08-10T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"fix Dashboard chart titles\",\"fix pin map saving\"]},{\"version\":\"v0.19.1\",\"released\":\"2016-08-04T11:09:36.358Z\",\"patch\":true,\"highlights\":[\"fix Dashboard Filter Editing\",\"fix CSV Download of SQL Templates\",\"fix Metabot enabled toggle\"]},{\"version\":\"v0.19.0\",\"released\":\"2016-08-01T21:09:36.358Z\",\"patch\":false,\"highlights\":[\"SSO via Google Accounts\",\"SQL Templates\",\"Better charting controls\"]},{\"version\":\"v0.18.1\",\"released\":\"2016-06-29T21:09:36.358Z\",\"patch\":true,\"highlights\":[\"Fix for Hour of day sorting bug\",\"Fix for Column ordering bug in BigQuery\",\"Fix for Mongo charting bug\"]},{\"version\":\"v0.18.0\",\"released\":\"2016-06-022T21:09:36.358Z\",\"patch\":false,\"highlights\":[\"Dashboard Filters\",\"Crate.IO Support\",\"Checklist for Metabase Admins\",\"Converting Metabase Questions -> SQL\"]},{\"version\":\"v0.17.1\",\"released\":\"2016-05-04T21:09:36.358Z\",\"patch\":true,\"highlights\":[\"Fix for Line chart ordering bug\",\"Fix for Time granularity bugs\"]},{\"version\":\"v0.17.0\",\"released\":\"2016-05-04T21:09:36.358Z\",\"patch\":false,\"highlights\":[\"Tags + Search for Saved Questions\",\"Calculated columns\",\"Faster Syncing of Metadata\",\"Lots of database driver improvements and bug fixes\"]},{\"version\":\"v0.16.1\",\"released\":\"2016-05-04T21:09:36.358Z\",\"patch\":true,\"highlights\":[\"Fixes for several time alignment issues (timezones)\",\"Resolved problem with SQL Server db connections\"]},{\"version\":\"v0.16.0\",\"released\":\"2016-05-04T21:09:36.358Z\",\"patch\":false,\"highlights\":[\"Fullscreen (and fabulous) Dashboards\",\"Say hello to Metabot in Slack\"]}]}');

-- ----------------------------
-- Table structure for `view_log`
-- ----------------------------
DROP TABLE IF EXISTS `view_log`;
CREATE TABLE `view_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `model` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_view_log_user_id` (`user_id`),
  KEY `idx_view_log_timestamp` (`model_id`),
  CONSTRAINT `fk_view_log_ref_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of view_log
-- ----------------------------
INSERT INTO `view_log` VALUES ('1', '2', 'dashboard', '1', '2017-06-22 11:37:18');
INSERT INTO `view_log` VALUES ('2', '1', 'card', '1', '2017-06-22 12:27:18');
INSERT INTO `view_log` VALUES ('3', '1', 'dashboard', '1', '2017-06-22 12:27:25');
INSERT INTO `view_log` VALUES ('4', '1', 'dashboard', '1', '2017-06-22 12:27:41');
INSERT INTO `view_log` VALUES ('5', '1', 'dashboard', '1', '2017-06-22 12:27:50');
INSERT INTO `view_log` VALUES ('6', '1', 'dashboard', '1', '2017-06-22 12:28:18');
INSERT INTO `view_log` VALUES ('7', '1', 'dashboard', '1', '2017-06-22 12:37:13');
INSERT INTO `view_log` VALUES ('8', '1', 'dashboard', '1', '2017-06-22 12:37:27');
INSERT INTO `view_log` VALUES ('9', '1', 'card', '2', '2017-06-22 14:52:33');
INSERT INTO `view_log` VALUES ('10', '1', 'dashboard', '1', '2017-06-22 14:52:39');
INSERT INTO `view_log` VALUES ('11', '1', 'dashboard', '1', '2017-06-22 14:52:48');
INSERT INTO `view_log` VALUES ('12', '1', 'dashboard', '1', '2017-06-22 14:52:52');
INSERT INTO `view_log` VALUES ('13', '1', 'dashboard', '1', '2017-06-22 16:30:50');
INSERT INTO `view_log` VALUES ('14', '1', 'card', '3', '2017-06-22 16:31:27');
INSERT INTO `view_log` VALUES ('15', '1', 'dashboard', '1', '2017-06-22 16:31:31');
INSERT INTO `view_log` VALUES ('16', '1', 'dashboard', '1', '2017-06-22 16:31:46');
INSERT INTO `view_log` VALUES ('17', '1', 'card', '1', '2017-06-22 16:37:17');
INSERT INTO `view_log` VALUES ('18', '1', 'dashboard', '1', '2017-06-22 16:37:20');
INSERT INTO `view_log` VALUES ('19', '1', 'dashboard', '1', '2017-06-22 16:55:12');
INSERT INTO `view_log` VALUES ('20', '1', 'dashboard', '1', '2017-06-22 16:56:13');
INSERT INTO `view_log` VALUES ('21', '1', 'dashboard', '1', '2017-06-22 16:57:13');
INSERT INTO `view_log` VALUES ('22', '1', 'dashboard', '1', '2017-06-22 16:58:13');
INSERT INTO `view_log` VALUES ('23', '1', 'dashboard', '1', '2017-06-22 16:59:23');
INSERT INTO `view_log` VALUES ('24', '1', 'dashboard', '1', '2017-06-22 17:15:48');
INSERT INTO `view_log` VALUES ('25', '1', 'dashboard', '1', '2017-06-22 17:36:48');
INSERT INTO `view_log` VALUES ('26', '1', 'dashboard', '1', '2017-06-22 17:58:07');
INSERT INTO `view_log` VALUES ('27', '1', 'card', '4', '2017-06-24 17:38:06');
INSERT INTO `view_log` VALUES ('28', '1', 'dashboard', '1', '2017-06-24 17:38:09');
INSERT INTO `view_log` VALUES ('29', '1', 'dashboard', '1', '2017-06-24 17:38:57');
INSERT INTO `view_log` VALUES ('30', '1', 'dashboard', '1', '2017-06-24 17:39:59');
INSERT INTO `view_log` VALUES ('31', '1', 'dashboard', '1', '2017-06-24 17:40:14');
INSERT INTO `view_log` VALUES ('32', '1', 'dashboard', '1', '2017-06-24 17:40:46');
INSERT INTO `view_log` VALUES ('33', '1', 'dashboard', '1', '2017-06-24 17:40:51');
INSERT INTO `view_log` VALUES ('34', '1', 'card', '1', '2017-06-24 17:42:23');
INSERT INTO `view_log` VALUES ('35', '1', 'dashboard', '1', '2017-06-24 17:42:43');
INSERT INTO `view_log` VALUES ('36', '1', 'dashboard', '1', '2017-06-24 17:43:08');
INSERT INTO `view_log` VALUES ('37', '1', 'card', '4', '2017-06-24 17:43:28');
INSERT INTO `view_log` VALUES ('38', '1', 'dashboard', '1', '2017-06-24 17:44:37');
INSERT INTO `view_log` VALUES ('39', '1', 'dashboard', '1', '2017-06-24 17:44:51');
INSERT INTO `view_log` VALUES ('40', '1', 'dashboard', '1', '2017-06-24 17:45:03');
INSERT INTO `view_log` VALUES ('41', '1', 'card', '4', '2017-06-24 17:47:11');
INSERT INTO `view_log` VALUES ('42', '1', 'dashboard', '1', '2017-06-24 17:49:49');
INSERT INTO `view_log` VALUES ('43', '1', 'dashboard', '1', '2017-06-24 17:49:55');
INSERT INTO `view_log` VALUES ('44', '1', 'dashboard', '1', '2017-06-24 17:50:10');
INSERT INTO `view_log` VALUES ('45', '1', 'card', '4', '2017-06-24 17:51:55');
INSERT INTO `view_log` VALUES ('46', '1', 'dashboard', '1', '2017-06-24 17:53:01');
INSERT INTO `view_log` VALUES ('47', '1', 'dashboard', '1', '2017-06-24 17:54:05');
INSERT INTO `view_log` VALUES ('48', '1', 'card', '4', '2017-06-24 17:54:08');
INSERT INTO `view_log` VALUES ('49', '1', 'dashboard', '1', '2017-06-24 17:54:42');
INSERT INTO `view_log` VALUES ('50', '1', 'dashboard', '1', '2017-06-24 17:56:08');
