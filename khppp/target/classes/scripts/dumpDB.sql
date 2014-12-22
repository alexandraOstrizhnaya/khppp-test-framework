-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.25 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for khppp
DROP DATABASE `khppp`;
CREATE DATABASE IF NOT EXISTS `khppp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `khppp`;

-- Dumping structure for table khppp.activity_journal
CREATE TABLE IF NOT EXISTS `activity_journal` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL,
  `role` varchar(50) NOT NULL,
  `type` enum('PROJECT','INTERVIEW') NOT NULL,
  `contact_person` varchar(50) NOT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  `id_user` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_user_activity_journal` (`id_user`),
  CONSTRAINT `fk_user_activity_journal` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.activity_journal: ~0 rows (approximately)
DELETE FROM `activity_journal`;
/*!40000 ALTER TABLE `activity_journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_journal` ENABLE KEYS */;


-- Dumping structure for table khppp.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_question` bigint(20) unsigned NOT NULL,
  `text_answer` varchar(256) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_answer_question_idx` (`id_question`),
  CONSTRAINT `fk_answer_question` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.answers: ~118 rows (approximately)
DELETE FROM `answers`;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` (`id`, `id_question`, `text_answer`, `is_correct`) VALUES
	(1, 1, 'The program compiles properly but at runtime it will give вЂњMain method not public.вЂќ message.', 1),
	(2, 1, 'The program will compile without error and will work', 0),
	(3, 2, 'toString()', 0),
	(4, 2, 'clone()', 0),
	(6, 2, 'hashCode()', 1),
	(7, 3, 'It can extend exactly one class and implement exactly one interface.', 0),
	(8, 3, 'It can extend exactly one class and can implement multiple interfaces.', 0),
	(9, 3, 'It can extend exactly one class or implement exactly one interface.', 1),
	(10, 3, 'It can implement multiple interfaces regardless of whether it also extends a class.', 0),
	(11, 4, 'Р”Р°.', 1),
	(12, 4, 'РќРµС‚.', 0),
	(13, 5, '0', 0),
	(14, 5, '1', 1),
	(15, 5, '2', 0),
	(16, 5, '3', 0),
	(17, 6, 'РєРѕРЅС‚РµР№РЅРµСЂРµ СЃРµСЂРІР»РµС‚РѕРІ (Servlet container)', 0),
	(18, 6, 'РєРѕРЅС‚РµРєСЃС‚Рµ СЃРµСЂРІР»РµС‚Р° (Servlet context)', 1),
	(19, 6, 'РІ request-heap СЃРµСЂРІР»РµС‚Р°', 0),
	(20, 6, 'РІ response-heap СЃРµСЂРІР»РµС‚Р°', 0),
	(21, 7, 'equals', 1),
	(22, 8, 'СЃРєСЂРёРїС‚', 1),
	(23, 8, 'С‚РµРі', 0),
	(24, 8, 'Р°РїРїР»РµС‚', 0),
	(25, 8, 'РєРѕРґ', 0),
	(26, 9, 'Boolean', 0),
	(27, 9, 'String', 1),
	(28, 9, 'Integer', 0),
	(29, 9, 'Float', 0),
	(30, 10, 'Netscape Communications', 1),
	(31, 10, 'Apple', 1),
	(32, 10, 'Microsoft', 1),
	(33, 10, 'IBM', 1),
	(34, 11, 'РІ С„РёРіСѓСЂРЅС‹Рµ СЃРєРѕР±РєРё {}', 1),
	(35, 11, 'РІ РѕР±С‹С‡РЅС‹Рµ СЃРєРѕР±РєРё ()', 1),
	(36, 11, 'РІ РєРІР°РґСЂР°С‚РЅС‹Рµ СЃРєРѕР±РєРё []', 1),
	(37, 11, 'РІ РєР°РІС‹С‡РєРё ""', 1),
	(38, 12, 'alert() ', 1),
	(39, 12, 'confirm()', 1),
	(40, 12, 'prompt()', 1),
	(41, 12, 'pow() ""', 1),
	(42, 13, 'Date ', 1),
	(43, 13, 'Math', 1),
	(44, 13, 'Open', 1),
	(45, 13, 'Array', 1),
	(46, 14, '<Script language="Java Script">... </Script>  ', 1),
	(47, 14, '<Script language=Script>... </Script> ', 1),
	(48, 14, '<Script>... </Script> ', 1),
	(49, 14, '<Java Script>... </Java Script> ', 1),
	(50, 15, 'document.write(СЃС‚СЂРѕРєР°) ', 1),
	(51, 15, 'parseFloat(СЃС‚СЂРѕРєР°)', 1),
	(52, 15, 'Date.parse(СЃС‚СЂРѕРєР°)', 1),
	(53, 15, 'parseInt(СЃС‚СЂРѕРєР°)', 1),
	(54, 16, '/=', 1),
	(55, 16, '&&', 1),
	(56, 16, '||', 1),
	(57, 16, '%=', 1),
	(58, 17, '30', 1),
	(59, 18, 'СЏРЅРІР°СЂСЊ', 1),
	(60, 19, '{ ... } ', 1),
	(61, 19, '<!--... //-->  ', 1),
	(62, 19, '//... ', 1),
	(63, 19, '/* ... */ ', 1),
	(64, 20, 'sub() ', 1),
	(65, 20, 'sup()  ', 1),
	(66, 20, 'toLowerCase()', 1),
	(67, 20, 'toUpperCase()', 1),
	(68, 21, 'РЅРѕРІРѕРµ РѕРєРЅРѕ ', 1),
	(69, 21, 'HTML СЏРєРѕСЂСЊ  ', 1),
	(70, 21, 'СЃС‚СЂРѕРєСѓ, РѕС‚РѕР±СЂР°Р¶Р°РµРјСѓСЋ РєСѓСЂСЃРёРІРѕРј', 1),
	(71, 21, 'РіРёРїРµСЂС‚РµРєСЃС‚РѕРІСѓСЋ СЃСЃС‹Р»РєСѓ HTML', 1),
	(72, 22, 'РѕРєСЂСѓРіР»РµРЅРёРµ СЃ РёР·Р±С‹С‚РєРѕРј ', 1),
	(73, 22, 'РѕРєСЂСѓРіР»РµРЅРёРµ СЃ РЅРµРґРѕСЃС‚Р°С‚РєРѕРј', 1),
	(74, 22, 'РѕРєСЂСѓРіР»РµРЅРёРµ', 1),
	(75, 22, 'РІРѕР·РІСЂР°С‰Р°РµС‚ СЃР»СѓС‡Р°Р№РЅРѕРµ С‡РёСЃР»Рѕ', 1),
	(76, 23, 'padding 5px 10px 10px', 0),
	(77, 23, 'margin: 10px 5px 5px 10px', 1),
	(78, 23, 'padding: 10px 5px', 0),
	(79, 23, 'margin: 5px 10px', 0),
	(80, 23, 'padding: 5px 10px', 0),
	(81, 24, ' z-index: normal', 0),
	(82, 24, ' z-index: 1', 1),
	(83, 24, ' z-index: inherit', 0),
	(84, 24, ' z-index: none', 0),
	(85, 24, ' z-index: auto', 0),
	(86, 25, ' position: vertical repeat', 0),
	(87, 25, ' РЎСЂРµРґСЃС‚РІР° CSS РЅРµ РїРѕР·РІРѕР»СЏСЋС‚ РґРѕР±РёС‚СЊСЃСЏ С‚СЂРµР±СѓРµРјРѕРіРѕ СЌС„С„РµРєС‚Р°', 0),
	(88, 25, ' background-attachment: repeat-y', 0),
	(89, 25, ' background-repeat: repeat-y', 1),
	(90, 25, ' background-image-position: repeat-y', 0),
	(91, 26, ' РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚', 0),
	(92, 26, ' РћС‚ 1 РґРѕ 3 С€СЂРёС„С‚РѕРІ', 0),
	(93, 26, ' Р”Рѕ 8 С€СЂРёС„С‚РѕРІ', 0),
	(94, 26, ' РћС‚ 4 РґРѕ 6 С€СЂРёС„С‚РѕРІ', 0),
	(95, 26, ' РўРѕР»СЊРєРѕ 4 С€СЂРёС„С‚Р°, РЅРµ СЃС‡РёС‚Р°СЏ СЃРёСЃС‚РµРјРЅС‹С…', 1),
	(96, 27, ' РџСЂРё РїРѕРјРѕС‰Рё РѕРїРµСЂР°С‚РѕСЂР° new, РїРµСЂРµРґР°РІ РµРјСѓ СЂР°Р·РјРµСЂ С„СЂР°РіРјРµРЅС‚Р° РІ Р±Р°Р№С‚Р°С…', 1),
	(97, 27, ' РџСЂРё РїРѕРјРѕС‰Рё РјРµС‚РѕРґР° Runtime.getSystemMemory(int size)', 0),
	(98, 27, ' РџСЂРё РїРѕРјРѕС‰Рё РјРµС‚РѕРґР° System.getMemory(int size)', 0),
	(99, 27, ' РџР°РјСЏС‚СЊ РІС‹РґРµР»СЏРµС‚СЃСЏ Р°РІС‚РѕРјР°С‚РёС‡РµСЃРєРё РїСЂРё СЃРѕР·РґР°РЅРёРё РѕР±СЉРµРєС‚Р°', 0),
	(100, 27, ' РџСЂРё РїРѕРјРѕС‰Рё РѕРїРµСЂР°С‚РѕСЂР° malloc', 0),
	(101, 28, ' clear: none', 0),
	(102, 28, ' clear: both', 1),
	(103, 28, ' clear: all', 0),
	(104, 28, ' clear: both; float: right', 0),
	(105, 28, ' clear: left right', 0),
	(106, 29, '  import res.*;', 0),
	(107, 29, '  import my.util.res;', 0),
	(108, 29, ' import .res;', 0),
	(109, 29, ' import my.util.res.*;', 0),
	(110, 29, ' import res;', 1),
	(111, 30, ' A:hover', 0),
	(112, 30, ' A:active', 0),
	(113, 30, ' A:visited', 1),
	(114, 30, ' A:href', 0),
	(115, 30, ' A:link', 0),
	(116, 31, 'hujgjuuuuuuuuuuuuuuuuuu', 0),
	(117, 31, 'jhgu', 0),
	(118, 31, 'jghj', 1),
	(119, 31, 'jhg', 0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;


-- Dumping structure for table khppp.assigned_tasks
CREATE TABLE IF NOT EXISTS `assigned_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_lab_manager` bigint(20) unsigned NOT NULL,
  `id_task` bigint(20) unsigned NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finish_date` timestamp NULL DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `is_mark_required` tinyint(1) DEFAULT '0',
  `is_comment_required` tinyint(1) DEFAULT NULL,
  `is_feedback_required` tinyint(1) DEFAULT '0',
  `is_penalti_required` tinyint(1) DEFAULT '0',
  `mark_description` varchar(30) DEFAULT NULL,
  `penalti` varchar(20) DEFAULT NULL,
  `sent_start_date` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sent_finish_date` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `id_task` (`id_task`),
  KEY `FK_assigned_tasks_users` (`id_lab_manager`),
  CONSTRAINT `FK_assigned_tasks_users` FOREIGN KEY (`id_lab_manager`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_task_id` FOREIGN KEY (`id_task`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;


-- Dumping structure for table khppp.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.departments: ~4 rows (approximately)
DELETE FROM `departments`;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`id`, `name`) VALUES
	(1, 'Java'),
	(2, 'QA'),
	(3, 'MANUAL TESTING'),
	(4, 'C#');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;


-- Dumping structure for table khppp.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `id_department` bigint(20) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `id_lab_manager` bigint(20) unsigned NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `group_name_UNIQUE` (`name`),
  KEY `fk_group_courses_idx` (`id_department`),
  KEY `FK_groups_users` (`id_lab_manager`),
  CONSTRAINT `FK_groups_courses` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_groups_users` FOREIGN KEY (`id_lab_manager`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- Dumping structure for table khppp.group_answers
CREATE TABLE IF NOT EXISTS `group_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_group_question` bigint(20) unsigned NOT NULL,
  `text_answer` varchar(256) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_groupAnswer_groupQuestion_idx` (`id_group_question`),
  CONSTRAINT `fk_groupAnswer_groupQuestion` FOREIGN KEY (`id_group_question`) REFERENCES `group_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.group_answers: ~115 rows (approximately)
DELETE FROM `group_answers`;
/*!40000 ALTER TABLE `group_answers` DISABLE KEYS */;
INSERT INTO `group_answers` (`id`, `id_group_question`, `text_answer`, `is_correct`) VALUES
	(1, 1, 'The program compiles properly but at runtime it will give вЂњMain method not public.вЂќ message.', 1),
	(2, 1, 'The program will compile without error and will work', 0),
	(3, 2, 'toString()', 0),
	(4, 2, 'clone()', 0),
	(5, 2, 'hashCode()', 1),
	(6, 2, 'hashCode()', 1),
	(7, 3, 'It can extend exactly one class and implement exactly one interface.', 0),
	(8, 3, 'It can extend exactly one class and can implement multiple interfaces.', 0),
	(9, 3, 'It can extend exactly one class or implement exactly one interface.', 1),
	(10, 3, 'It can implement multiple interfaces regardless of whether it also extends a class.', 0),
	(11, 4, 'Р”Р°.', 1),
	(12, 4, 'РќРµС‚.', 0),
	(13, 5, '0', 0),
	(14, 5, '1', 1),
	(15, 5, '2', 0),
	(16, 5, '3', 0),
	(17, 6, 'РєРѕРЅС‚РµР№РЅРµСЂРµ СЃРµСЂРІР»РµС‚РѕРІ (Servlet container)', 0),
	(18, 6, 'РєРѕРЅС‚РµРєСЃС‚Рµ СЃРµСЂРІР»РµС‚Р° (Servlet context)', 1),
	(19, 6, 'РІ request-heap СЃРµСЂРІР»РµС‚Р°', 0),
	(20, 6, 'РІ response-heap СЃРµСЂРІР»РµС‚Р°', 0),
	(21, 7, 'equals', 1),
	(22, 8, 'СЃРєСЂРёРїС‚', 1),
	(23, 8, 'С‚РµРі', 0),
	(24, 8, 'Р°РїРїР»РµС‚', 0),
	(25, 8, 'РєРѕРґ', 0),
	(26, 9, 'Boolean', 0),
	(27, 9, 'String', 1),
	(28, 9, 'Integer', 0),
	(29, 9, 'Float', 0),
	(30, 10, 'Netscape Communications', 1),
	(31, 10, 'Apple', 1),
	(32, 10, 'Microsoft', 1),
	(33, 10, 'IBM', 1),
	(34, 11, 'РІ С„РёРіСѓСЂРЅС‹Рµ СЃРєРѕР±РєРё {}', 1),
	(35, 11, 'РІ РѕР±С‹С‡РЅС‹Рµ СЃРєРѕР±РєРё ()', 1),
	(36, 11, 'РІ РєРІР°РґСЂР°С‚РЅС‹Рµ СЃРєРѕР±РєРё []', 1),
	(37, 11, 'РІ РєР°РІС‹С‡РєРё ""', 1),
	(38, 12, 'alert() ', 1),
	(39, 12, 'confirm()', 1),
	(40, 12, 'prompt()', 1),
	(41, 12, 'pow() ""', 1),
	(42, 13, 'Date ', 1),
	(43, 13, 'Math', 1),
	(44, 13, 'Open', 1),
	(45, 13, 'Array', 1),
	(46, 14, '<Script language="Java Script">... </Script>  ', 1),
	(47, 14, '<Script language=Script>... </Script> ', 1),
	(48, 14, '<Script>... </Script> ', 1),
	(49, 14, '<Java Script>... </Java Script> ', 1),
	(50, 15, 'document.write(СЃС‚СЂРѕРєР°) ', 1),
	(51, 15, 'parseFloat(СЃС‚СЂРѕРєР°)', 1),
	(52, 15, 'Date.parse(СЃС‚СЂРѕРєР°)', 1),
	(53, 15, 'parseInt(СЃС‚СЂРѕРєР°)', 1),
	(54, 16, '/=', 1),
	(55, 16, '&&', 1),
	(56, 16, '||', 1),
	(57, 16, '%=', 1),
	(58, 17, '30', 1),
	(59, 18, 'СЏРЅРІР°СЂСЊ', 1),
	(60, 19, '{ ... } ', 1),
	(61, 19, '<!--... //-->  ', 1),
	(62, 19, '//... ', 1),
	(63, 19, '/* ... */ ', 1),
	(64, 20, 'sub() ', 1),
	(65, 20, 'sup()  ', 1),
	(66, 20, 'toLowerCase()', 1),
	(67, 20, 'toUpperCase()', 1),
	(68, 21, 'РЅРѕРІРѕРµ РѕРєРЅРѕ ', 1),
	(69, 21, 'HTML СЏРєРѕСЂСЊ  ', 1),
	(70, 21, 'СЃС‚СЂРѕРєСѓ, РѕС‚РѕР±СЂР°Р¶Р°РµРјСѓСЋ РєСѓСЂСЃРёРІРѕРј', 1),
	(71, 21, 'РіРёРїРµСЂС‚РµРєСЃС‚РѕРІСѓСЋ СЃСЃС‹Р»РєСѓ HTML', 1),
	(72, 22, 'РѕРєСЂСѓРіР»РµРЅРёРµ СЃ РёР·Р±С‹С‚РєРѕРј ', 1),
	(73, 22, 'РѕРєСЂСѓРіР»РµРЅРёРµ СЃ РЅРµРґРѕСЃС‚Р°С‚РєРѕРј', 1),
	(74, 22, 'РѕРєСЂСѓРіР»РµРЅРёРµ', 1),
	(75, 22, 'РІРѕР·РІСЂР°С‰Р°РµС‚ СЃР»СѓС‡Р°Р№РЅРѕРµ С‡РёСЃР»Рѕ', 1),
	(76, 23, 'padding 5px 10px 10px', 0),
	(77, 23, 'margin: 10px 5px 5px 10px', 1),
	(78, 23, 'padding: 10px 5px', 0),
	(79, 23, 'margin: 5px 10px', 0),
	(80, 23, 'padding: 5px 10px', 0),
	(81, 24, ' z-index: normal', 0),
	(82, 24, ' z-index: 1', 1),
	(83, 24, ' z-index: inherit', 0),
	(84, 24, ' z-index: none', 0),
	(85, 24, ' z-index: auto', 0),
	(86, 25, ' position: vertical repeat', 0),
	(87, 25, ' РЎСЂРµРґСЃС‚РІР° CSS РЅРµ РїРѕР·РІРѕР»СЏСЋС‚ РґРѕР±РёС‚СЊСЃСЏ С‚СЂРµР±СѓРµРјРѕРіРѕ СЌС„С„РµРєС‚Р°', 0),
	(88, 25, ' background-attachment: repeat-y', 0),
	(89, 25, ' background-repeat: repeat-y', 1),
	(90, 25, ' background-image-position: repeat-y', 0),
	(91, 26, ' РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚', 0),
	(92, 26, ' РћС‚ 1 РґРѕ 3 С€СЂРёС„С‚РѕРІ', 0),
	(93, 26, ' Р”Рѕ 8 С€СЂРёС„С‚РѕРІ', 0),
	(94, 26, ' РћС‚ 4 РґРѕ 6 С€СЂРёС„С‚РѕРІ', 0),
	(95, 26, ' РўРѕР»СЊРєРѕ 4 С€СЂРёС„С‚Р°, РЅРµ СЃС‡РёС‚Р°СЏ СЃРёСЃС‚РµРјРЅС‹С…', 1),
	(96, 27, ' РџСЂРё РїРѕРјРѕС‰Рё РѕРїРµСЂР°С‚РѕСЂР° new, РїРµСЂРµРґР°РІ РµРјСѓ СЂР°Р·РјРµСЂ С„СЂР°РіРјРµРЅС‚Р° РІ Р±Р°Р№С‚Р°С…', 1),
	(97, 27, ' РџСЂРё РїРѕРјРѕС‰Рё РјРµС‚РѕРґР° Runtime.getSystemMemory(int size)', 0),
	(98, 27, ' РџСЂРё РїРѕРјРѕС‰Рё РјРµС‚РѕРґР° System.getMemory(int size)', 0),
	(99, 27, ' РџР°РјСЏС‚СЊ РІС‹РґРµР»СЏРµС‚СЃСЏ Р°РІС‚РѕРјР°С‚РёС‡РµСЃРєРё РїСЂРё СЃРѕР·РґР°РЅРёРё РѕР±СЉРµРєС‚Р°', 0),
	(100, 27, ' РџСЂРё РїРѕРјРѕС‰Рё РѕРїРµСЂР°С‚РѕСЂР° malloc', 0),
	(101, 28, ' clear: none', 0),
	(102, 28, ' clear: both', 1),
	(103, 28, ' clear: all', 0),
	(104, 28, ' clear: both; float: right', 0),
	(105, 28, ' clear: left right', 0),
	(106, 29, '  import res.*;', 0),
	(107, 29, '  import my.util.res;', 0),
	(108, 29, ' import .res;', 0),
	(109, 29, ' import my.util.res.*;', 0),
	(110, 29, ' import res;', 1),
	(111, 30, ' A:hover', 0),
	(112, 30, ' A:active', 0),
	(113, 30, ' A:visited', 1),
	(114, 30, ' A:href', 0),
	(115, 30, ' A:link', 0);


-- Dumping structure for table khppp.group_members
CREATE TABLE IF NOT EXISTS `group_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) unsigned NOT NULL,
  `id_group` bigint(20) unsigned NOT NULL,
  `id_subGroup` bigint(20) unsigned DEFAULT NULL,
  `user_role` enum('ADMIN','MENTOR','MENTEE') NOT NULL DEFAULT 'MENTEE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`,`id_user`),
  UNIQUE KEY `id_user` (`id_user`),
  KEY `fk_groupmembers_users_idx` (`id_user`),
  KEY `fk_groupmembers_groups_idx` (`id_group`),
  KEY `FK_group_members_subgroups` (`id_subGroup`),
  CONSTRAINT `fk_groupmembers_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_group_members_groups` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_group_members_subgroups` FOREIGN KEY (`id_subGroup`) REFERENCES `subgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1080 DEFAULT CHARSET=utf8;


-- Dumping structure for table khppp.group_questions
CREATE TABLE IF NOT EXISTS `group_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_group_topic` bigint(20) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `text_question` text NOT NULL,
  `comment` varchar(256) DEFAULT NULL,
  `type` enum('OPEN','SEVERAL','SINGLE') NOT NULL DEFAULT 'OPEN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_groupQuestion_groupTopic_idx` (`id_group_topic`),
  CONSTRAINT `fk_groupQuestion_groupTopic` FOREIGN KEY (`id_group_topic`) REFERENCES `group_topics` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.group_questions: ~30 rows (approximately)
DELETE FROM `group_questions`;
/*!40000 ALTER TABLE `group_questions` DISABLE KEYS */;
INSERT INTO `group_questions` (`id`, `id_group_topic`, `name`, `text_question`, `comment`, `type`) VALUES
	(1, 1, 'Private method', 'What if the main method is declared as private?', NULL, 'SINGLE'),
	(2, 1, 'Equals', 'If youвЂ™re overriding the method equals() of an object, which other method you might also consider?', NULL, 'SEVERAL'),
	(3, 1, 'Inner class', 'Which is true about an anonymous inner class?', NULL, 'SEVERAL'),
	(4, 2, 'RequestDispatcher', 'Р•СЃР»Рё РїРѕР»СѓС‡РёС‚СЊ РѕР±СЉРµРєС‚ RequestDispatcher СЃР»РµРґСѓСЋС‰РёРј РѕР±СЂР°Р·РѕРј ServletContext.getRequestDispatcher(path) Рё РїРµСЂРµРјРµРЅРЅР°СЏ path РїСЂРё СЌС‚РѕРј РЅРµ СЃРѕРґРµСЂР¶РёС‚ СЃР»РµС€ ("/") РїРµСЂРІС‹Рј СЃРёРјРІРѕР»РѕРј С‚Рѕ РїСЂРѕРёР·РѕР№РґРµС‚ РёСЃРєР»СЋС‡РµРЅРёРµ РІСЂРµРјРµРЅРё РІС‹РїРѕР»РЅРµРЅРёСЏ.', NULL, 'SINGLE'),
	(5, 2, 'ServletContext', 'РЎРєРѕР»СЊРєРѕ РѕР±СЉРµРєС‚РѕРІ ServletContext Р±СѓРґРµС‚ СЃРѕР·РґР°РЅРѕ РґР»СЏ РѕРґРЅРѕРіРѕ РІРµР±-РїСЂРёР»РѕР¶РµРЅРёСЏ?', NULL, 'SINGLE'),
	(6, 2, 'РЎРµСЃСЃРёСЏ', 'РЎРµСЂРІР»РµС‚ С…СЂР°РЅРёС‚ СЃРµСЃСЃРёРё (session) РІ ... ', NULL, 'SINGLE'),
	(7, 1, 'Object', 'hashCode() and ...', NULL, 'OPEN'),
	(8, 3, 'HTML', 'РџСЂРёР»РѕР¶РµРЅРёРµ(С‡Р°СЃС‚СЊ HTML-СЃС‚СЂР°РЅРёС†С‹), РЅР°РїРёСЃР°РЅРЅРѕРµ РЅР° Java Script Рё РІС‹РїРѕР»РЅСЏРµРјРѕРµ РІРёСЂС‚СѓР°Р»СЊРЅРѕР№ РјР°С€РёРЅРѕР№ Р±СЂР°СѓР·РµСЂР°,РЅР°Р·С‹РІР°РµС‚СЃСЏ... .', NULL, 'SINGLE'),
	(9, 3, 'Java Script', 'РўРёРї, СЃРѕСЃС‚РѕСЏС‰РёР№ РёР· РІСЃРµС… РІРѕР·РјРѕР¶РЅС‹С… СЃС‚СЂРѕРєРѕРІС‹С… Р·РЅР°С‡РµРЅРёР№:', NULL, 'SINGLE'),
	(10, 3, 'РљРѕСЂРїРѕСЂР°С†РёСЏ', 'РЇР·С‹Рє Java Script Р±С‹Р» СЂР°Р·СЂР°Р±РѕС‚Р°РЅ РєРѕСЂРїРѕСЂР°С†РёРµР№... .', NULL, 'SINGLE'),
	(11, 3, 'Р¤СѓРЅРєС†РёСЏ', 'РўРµР»Рѕ С„СѓРЅРєС†РёРё Р·Р°РєР»СЋС‡Р°РµС‚СЃСЏ... .', NULL, 'SINGLE'),
	(12, 3, 'Р¤СѓРЅРєС†РёСЏ', 'Р¤СѓРЅРєС†РёСЏ, РѕС‚РѕР±СЂР°Р¶Р°СЋС‰Р°СЏ РІ РґРёР°Р»РѕРіРѕРІРѕРј РѕРєРЅРµ Р·Р°РїСЂРѕСЃ, С‚СЂРµР±СѓСЋС‰РёР№ РѕС‚РІРµС‚Р° "Р”Р°" РёР»Рё "РќРµС‚"- ... .', NULL, 'SINGLE'),
	(13, 3, 'РњР°С‚РµРјР°С‚РёС‡РµСЃРєРёРµ С„СѓРЅРєС†РёРё', 'РћР±СЉРµРєС‚ Java Script, РѕР±СЂР°Р±Р°С‚С‹РІР°СЋС‰РёР№ РјР°С‚РµРјР°С‚РёС‡РµСЃРєРёРµ С„СѓРЅРєС†РёРё... .', NULL, 'SINGLE'),
	(14, 3, 'РљРѕРЅС‚РµР№РЅРµСЂС‹ Java Script', 'РћРїРµСЂР°С‚РѕСЂС‹ Java Script Р·Р°РєР»СЋС‡Р°СЋС‚СЃСЏ РІ РєРѕРЅС‚РµР№РЅРµСЂС‹:', NULL, 'SEVERAL'),
	(15, 3, 'Parsing', 'Р¤СѓРЅРєС†РёСЏ, РїРµСЂРµРІРѕРґСЏС‰Р°СЏ СЃС‚СЂРѕРєРѕРІРѕРµ Р·РЅР°С‡РµРЅРёРµ РІ С†РµР»РѕРµ С‡РёСЃР»Рѕ... .', NULL, 'SINGLE'),
	(16, 3, 'Р”РёР·СЉСЋРЅРєС†РёСЏ', 'Р”РёР·СЉСЋРЅРєС†РёСЏ РІ Java Script РѕР±РѕР·РЅР°С‡Р°РµС‚СЃСЏ СЃРёРјРІРѕР»РѕРј (РєРѕРјР±РёРЅР°С†РёРµР№ СЃРёРјРІРѕР»РѕРІ)... .', NULL, 'SINGLE'),
	(17, 3, 'getDay', 'Р”РёР°РїР°Р·РѕРЅ Р·РЅР°С‡РµРЅРёР№ С„СѓРЅРєС†РёРё getDay РІ Java Script РѕС‚ 0 Рё РґРѕ...:', NULL, 'OPEN'),
	(18, 3, 'getMonth', ' Р¤СѓРЅРєС†РёСЏ getMonth РїРµСЂРµРІРѕРґРёС‚ С‡РёСЃР»Рѕ 5 РІ РјРµСЃСЏС†... . РќР°РїРёС€РёС‚Рµ РјРµСЃСЏС†..', NULL, 'OPEN'),
	(19, 3, 'РљРѕРјРјРµРЅС‚Р°СЂРёРё', 'РљРѕРјРјРµРЅС‚Р°СЂРёРё РІ Java Script Р·Р°РєР»СЋС‡Р°СЋС‚СЃСЏ РІ РѕРїРµСЂР°С‚РѕСЂРЅС‹Рµ СЃРєРѕР±РєРё... .', NULL, 'SEVERAL'),
	(20, 3, 'Р РµРіРёСЃС‚СЂ', 'Р¤СѓРЅРєС†РёСЏ, РїРµСЂРµРІРѕРґСЏС‰Р°СЏ С‚РµРєСЃС‚ РІ РЅРёР¶РЅРёР№ СЂРµРіРёСЃС‚СЂ... .', NULL, 'SINGLE'),
	(21, 3, 'link', 'РњРµС‚РѕРґ link РІ Java Script СЃРѕР·РґР°РµС‚... .', NULL, 'SINGLE'),
	(22, 3, 'ceil', 'РњРµС‚РѕРґ ceil(x) РІ Java Script РѕР·РЅР°С‡Р°РµС‚... .', NULL, 'SINGLE'),
	(23, 4, 'Р‘Р»РѕС‡РЅР°СЏ СЂР°Р·РјРµС‚РєР°', 'РќРµРѕР±С…РѕРґРёРјРѕ СЃРѕР·РґР°С‚СЊ Р±Р»РѕС‡РЅС‹Р№ СЌР»РµРјРµРЅС‚ СЃ РІРЅСѓС‚СЂРµРЅРЅРёРјРё РѕС‚СЃС‚СѓРїР°РјРё РѕРґРёРЅР°РєРѕРІС‹С… СЂР°Р·РјРµСЂРѕРІ СЃР»РµРІР° Рё СЃРїСЂР°РІР° (10px) Р° С‚Р°РєР¶Рµ СЃРІРµСЂС…Сѓ Рё СЃРЅРёР·Сѓ (5px)', NULL, 'SINGLE'),
	(24, 4, 'z-index', 'РљР°РєРёРµ Р·РЅР°С‡РµРЅРёСЏ СЃРІРѕР№СЃС‚РІР° z-index РёР· РїРµСЂРµС‡РёСЃР»РµРЅРЅС‹С… СѓРєР°Р·Р°РЅС‹ РІРµСЂРЅРѕ?', NULL, 'SINGLE'),
	(25, 4, 'Р¤РѕРЅРѕРІРѕРµ РёР·РѕР±СЂР°Р¶РµРЅРёРµ', 'РљР°РєРѕР№ С„СЂР°РіРјРµРЅС‚ РєРѕРґР° РЅРµРѕР±С…РѕРґРёРјРѕ РґРѕР±Р°РІРёС‚СЊ Рє С‚Р°Р±Р»РёС†Рµ СЃС‚РёР»РµР№, С‡С‚РѕР±С‹ С„РѕРЅРѕРІРѕРµ РёР·РѕР±СЂР°Р¶РµРЅРёРµ РїРѕРІС‚РѕСЂСЏР»РѕСЃСЊ С‚РѕР»СЊРєРѕ РїРѕ РІРµСЂС‚РёРєР°Р»Рё?', NULL, 'SINGLE'),
	(26, 4, 'РЎРµРјРµР№СЃС‚РІРѕ С€СЂРёС„С‚РѕРІ', 'РљР°РєРёРµ РѕРіСЂР°РЅРёС‡РµРЅРёСЏ РёРјРµРµС‚ СЃРІРѕР№СЃС‚РІРѕ font-family РЅР° РєРѕР»РёС‡РµСЃС‚РІРѕ СѓРєР°Р·Р°РЅРЅС‹С… С€СЂРёС„С‚РѕРІ?', NULL, 'SINGLE'),
	(27, 1, 'РџР°РјСЏС‚СЊ Java', 'РљР°РєРёРј РѕР±СЂР°Р·РѕРј РјРѕР¶РЅРѕ РІС‹РґРµР»РёС‚СЊ С„СЂР°РіРјРµРЅС‚ РїР°РјСЏС‚Рё РІ java?', NULL, 'SINGLE'),
	(28, 4, 'РћР±С‚РµРєР°РЅРёРµ Р±Р»РѕС‡РЅРѕРіРѕ СЌР»РµРјРµРЅС‚', 'РќРµРѕР±С…РѕРґРёРјРѕ Р·Р°РїСЂРµС‚РёС‚СЊ РѕР±С‚РµРєР°РЅРёРµ Р±Р»РѕС‡РЅРѕРіРѕ СЌР»РµРјРµРЅС‚Р° СЃ РґРІСѓС… СЃС‚РѕСЂРѕРЅ. РљР°РєРѕРµ РёР· РїРµСЂРµС‡РёСЃР»РµРЅРЅС‹С… РЅРёР¶Рµ СЃРІРѕР№СЃС‚РІ РїРѕР·РІРѕР»РёС‚ СЂРµС€РёС‚СЊ РїРѕСЃС‚Р°РІР»РµРЅРЅСѓСЋ Р·Р°РґР°С‡Сѓ?', NULL, 'SINGLE'),
	(29, 1, 'РРјРїРѕСЂС‚ Java', 'РќРµРѕР±С…РѕРґРёРјРѕ РёРјРїРѕСЂС‚РёСЂРѕРІР°С‚СЊ РІ РѕРґРёРЅ РёР· РєР»Р°СЃСЃРѕРІ РїР°РєРµС‚Р° my.util РїРѕРґРїР°РєРµС‚ my.util.res.РљР°РєРѕР№ РёР· РїСЂРёРІРµРґРµРЅРЅС‹С… С„СЂР°РіРјРµРЅС‚РѕРІ РєРѕРґР° РїРѕР·РІРѕР»РёС‚ СЂРµС€РёС‚СЊ РїРѕСЃС‚Р°РІР»РµРЅРЅСѓСЋ Р·Р°РґР°С‡Сѓ?', NULL, 'SINGLE'),
	(30, 4, 'РџСЃРµРІРґРѕРєР»Р°СЃСЃС‹', ' РќРµРѕР±С…РѕРґРёРјРѕ СѓРєР°Р·Р°С‚СЊ С†РІРµС‚ С„РѕРЅР° РґР»СЏ СЃСЃС‹Р»РєРё РїСЂРё РЅР°Р¶Р°С‚РёРё РЅР° РЅРµРµ.РљР°РєРѕР№ РїСЃРµРІРґРѕРєР»Р°СЃСЃ РїРѕР·РІРѕР»РёС‚ СЂРµС€РёС‚СЊ РїРѕСЃС‚Р°РІР»РµРЅРЅСѓСЋ Р·Р°РґР°С‡Сѓ?', NULL, 'SINGLE');
/*!40000 ALTER TABLE `group_questions` ENABLE KEYS */;


-- Dumping structure for table khppp.group_tests
CREATE TABLE IF NOT EXISTS `group_tests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` bigint(20) unsigned NOT NULL,
  `id_creator` bigint(20) unsigned NOT NULL,
  `id_test` bigint(20) unsigned NOT NULL,
  `id_department` bigint(20) unsigned NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time` time NOT NULL DEFAULT '00:00:00',
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_groupTest_group_idx` (`id_group`),
  KEY `fk_groupTest_creator_idx` (`id_creator`),
  KEY `fk_groupTest_test_idx` (`id_test`),
  KEY `fk_groupTest_department_idx` (`id_department`),
  CONSTRAINT `fk_groupTest_creator` FOREIGN KEY (`id_creator`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_groupTest_department` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_groupTest_group` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_groupTest_test` FOREIGN KEY (`id_test`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.group_tests: ~0 rows (approximately)
DELETE FROM `group_tests`;
/*!40000 ALTER TABLE `group_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_tests` ENABLE KEYS */;


-- Dumping structure for table khppp.group_test_questions
CREATE TABLE IF NOT EXISTS `group_test_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_group_test` bigint(20) unsigned NOT NULL,
  `id_group_question` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_qroupTestQuestion_groupTest_idx` (`id_group_test`),
  KEY `fk_groupTestQuestion_groupQuestion_idx` (`id_group_question`),
  CONSTRAINT `fk_groupTestQuestion_groupQuestion` FOREIGN KEY (`id_group_question`) REFERENCES `group_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qroupTestQuestion_groupTest` FOREIGN KEY (`id_group_test`) REFERENCES `group_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.group_test_questions: ~0 rows (approximately)
DELETE FROM `group_test_questions`;
/*!40000 ALTER TABLE `group_test_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_test_questions` ENABLE KEYS */;


-- Dumping structure for table khppp.group_topics
CREATE TABLE IF NOT EXISTS `group_topics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.group_topics: ~4 rows (approximately)
DELETE FROM `group_topics`;
/*!40000 ALTER TABLE `group_topics` DISABLE KEYS */;
INSERT INTO `group_topics` (`id`, `name`) VALUES
	(1, 'Java core'),
	(2, 'Servlets'),
	(3, 'JavaScript'),
	(4, 'CSS');
/*!40000 ALTER TABLE `group_topics` ENABLE KEYS */;


-- Dumping structure for table khppp.login_approve_details
CREATE TABLE IF NOT EXISTS `login_approve_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) unsigned NOT NULL,
  `hashed_key` varchar(64) NOT NULL,
  `expired_to` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  KEY `fk_loginDetails_user_idx` (`id_user`),
  CONSTRAINT `fk_loginDetails_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='Stores information related to the registration confirmation via email. \nhased_key field stores string, generated from user`s name and email. This string will be set as a part of url, \nthat confirms registration and enables user to change password';

-- Dumping data for table khppp.login_approve_details: ~9 rows (approximately)
DELETE FROM `login_approve_details`;
/*!40000 ALTER TABLE `login_approve_details` ENABLE KEYS */;


-- Dumping structure for table khppp.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(35) NOT NULL,
  `value` varchar(35) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table khppp.properties: ~2 rows (approximately)
DELETE FROM `properties`;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `key`, `value`, `description`) VALUES
	(1, 'interval_hour_dedline', '1', ''),
	(2, 'frequency_send_mail_in_hour', '1', '');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;


-- Dumping structure for table khppp.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_topic` bigint(20) unsigned NOT NULL,
  `id_user` bigint(20) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `text_question` text NOT NULL,
  `comment` varchar(256) DEFAULT NULL,
  `type` enum('OPEN','SEVERAL','SINGLE') NOT NULL DEFAULT 'OPEN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_question_topic_idx` (`id_topic`),
  KEY `fk_question_user_idx` (`id_user`),
  CONSTRAINT `fk_question_topic` FOREIGN KEY (`id_topic`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_question_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.questions: ~31 rows (approximately)
DELETE FROM `questions`;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`id`, `id_topic`, `id_user`, `name`, `text_question`, `comment`, `type`) VALUES
	(1, 1, 1, 'Private method', 'What if the main method is declared as private?', NULL, 'SINGLE'),
	(2, 1, 106, 'Equals', 'If youвЂ™re overriding the method equals() of an object, which other method you might also consider?', '', 'SEVERAL'),
	(3, 1, 1, 'Inner class', 'Which is true about an anonymous inner class?', NULL, 'SEVERAL'),
	(4, 2, 1, 'RequestDispatcher', 'Р•СЃР»Рё РїРѕР»СѓС‡РёС‚СЊ РѕР±СЉРµРєС‚ RequestDispatcher СЃР»РµРґСѓСЋС‰РёРј РѕР±СЂР°Р·РѕРј ServletContext.getRequestDispatcher(path) Рё РїРµСЂРµРјРµРЅРЅР°СЏ path РїСЂРё СЌС‚РѕРј РЅРµ СЃРѕРґРµСЂР¶РёС‚ СЃР»РµС€ ("/") РїРµСЂРІС‹Рј СЃРёРјРІРѕР»РѕРј С‚Рѕ РїСЂРѕРёР·РѕР№РґРµС‚ РёСЃРєР»СЋС‡РµРЅРёРµ РІСЂРµРјРµРЅРё РІС‹РїРѕР»РЅРµРЅРёСЏ.', NULL, 'SINGLE'),
	(5, 2, 1, 'ServletContext', 'РЎРєРѕР»СЊРєРѕ РѕР±СЉРµРєС‚РѕРІ ServletContext Р±СѓРґРµС‚ СЃРѕР·РґР°РЅРѕ РґР»СЏ РѕРґРЅРѕРіРѕ РІРµР±-РїСЂРёР»РѕР¶РµРЅРёСЏ?', NULL, 'SINGLE'),
	(6, 2, 1, 'РЎРµСЃСЃРёСЏ', 'РЎРµСЂРІР»РµС‚ С…СЂР°РЅРёС‚ СЃРµСЃСЃРёРё (session) РІ ... ', NULL, 'SINGLE'),
	(7, 1, 1, 'Object', 'hashCode() and ...', NULL, 'OPEN'),
	(8, 3, 1, 'HTML', 'РџСЂРёР»РѕР¶РµРЅРёРµ(С‡Р°СЃС‚СЊ HTML-СЃС‚СЂР°РЅРёС†С‹), РЅР°РїРёСЃР°РЅРЅРѕРµ РЅР° Java Script Рё РІС‹РїРѕР»РЅСЏРµРјРѕРµ РІРёСЂС‚СѓР°Р»СЊРЅРѕР№ РјР°С€РёРЅРѕР№ Р±СЂР°СѓР·РµСЂР°,РЅР°Р·С‹РІР°РµС‚СЃСЏ... .', NULL, 'SINGLE'),
	(9, 3, 1, 'Java Script', 'РўРёРї, СЃРѕСЃС‚РѕСЏС‰РёР№ РёР· РІСЃРµС… РІРѕР·РјРѕР¶РЅС‹С… СЃС‚СЂРѕРєРѕРІС‹С… Р·РЅР°С‡РµРЅРёР№:', NULL, 'SINGLE'),
	(10, 3, 1, 'РљРѕСЂРїРѕСЂР°С†РёСЏ', 'РЇР·С‹Рє Java Script Р±С‹Р» СЂР°Р·СЂР°Р±РѕС‚Р°РЅ РєРѕСЂРїРѕСЂР°С†РёРµР№... .', NULL, 'SINGLE'),
	(11, 3, 1, 'Р¤СѓРЅРєС†РёСЏ', 'РўРµР»Рѕ С„СѓРЅРєС†РёРё Р·Р°РєР»СЋС‡Р°РµС‚СЃСЏ... .', NULL, 'SINGLE'),
	(12, 3, 1, 'Р¤СѓРЅРєС†РёСЏ', 'Р¤СѓРЅРєС†РёСЏ, РѕС‚РѕР±СЂР°Р¶Р°СЋС‰Р°СЏ РІ РґРёР°Р»РѕРіРѕРІРѕРј РѕРєРЅРµ Р·Р°РїСЂРѕСЃ, С‚СЂРµР±СѓСЋС‰РёР№ РѕС‚РІРµС‚Р° "Р”Р°" РёР»Рё "РќРµС‚"- ... .', NULL, 'SINGLE'),
	(13, 3, 1, 'РњР°С‚РµРјР°С‚РёС‡РµСЃРєРёРµ С„СѓРЅРєС†РёРё', 'РћР±СЉРµРєС‚ Java Script, РѕР±СЂР°Р±Р°С‚С‹РІР°СЋС‰РёР№ РјР°С‚РµРјР°С‚РёС‡РµСЃРєРёРµ С„СѓРЅРєС†РёРё... .', NULL, 'SINGLE'),
	(14, 3, 1, 'РљРѕРЅС‚РµР№РЅРµСЂС‹ Java Script', 'РћРїРµСЂР°С‚РѕСЂС‹ Java Script Р·Р°РєР»СЋС‡Р°СЋС‚СЃСЏ РІ РєРѕРЅС‚РµР№РЅРµСЂС‹:', NULL, 'SEVERAL'),
	(15, 3, 1, 'Parsing', 'Р¤СѓРЅРєС†РёСЏ, РїРµСЂРµРІРѕРґСЏС‰Р°СЏ СЃС‚СЂРѕРєРѕРІРѕРµ Р·РЅР°С‡РµРЅРёРµ РІ С†РµР»РѕРµ С‡РёСЃР»Рѕ... .', NULL, 'SINGLE'),
	(16, 3, 1, 'Р”РёР·СЉСЋРЅРєС†РёСЏ', 'Р”РёР·СЉСЋРЅРєС†РёСЏ РІ Java Script РѕР±РѕР·РЅР°С‡Р°РµС‚СЃСЏ СЃРёРјРІРѕР»РѕРј (РєРѕРјР±РёРЅР°С†РёРµР№ СЃРёРјРІРѕР»РѕРІ)... .', NULL, 'SINGLE'),
	(17, 3, 1, 'getDay', 'Р”РёР°РїР°Р·РѕРЅ Р·РЅР°С‡РµРЅРёР№ С„СѓРЅРєС†РёРё getDay РІ Java Script РѕС‚ 0 Рё РґРѕ...:', NULL, 'OPEN'),
	(18, 3, 1, 'getMonth', ' Р¤СѓРЅРєС†РёСЏ getMonth РїРµСЂРµРІРѕРґРёС‚ С‡РёСЃР»Рѕ 5 РІ РјРµСЃСЏС†... . РќР°РїРёС€РёС‚Рµ РјРµСЃСЏС†..', NULL, 'OPEN'),
	(19, 3, 1, 'РљРѕРјРјРµРЅС‚Р°СЂРёРё', 'РљРѕРјРјРµРЅС‚Р°СЂРёРё РІ Java Script Р·Р°РєР»СЋС‡Р°СЋС‚СЃСЏ РІ РѕРїРµСЂР°С‚РѕСЂРЅС‹Рµ СЃРєРѕР±РєРё... .', NULL, 'SEVERAL'),
	(20, 3, 1, 'Р РµРіРёСЃС‚СЂ', 'Р¤СѓРЅРєС†РёСЏ, РїРµСЂРµРІРѕРґСЏС‰Р°СЏ С‚РµРєСЃС‚ РІ РЅРёР¶РЅРёР№ СЂРµРіРёСЃС‚СЂ... .', NULL, 'SINGLE'),
	(21, 3, 1, 'link', 'РњРµС‚РѕРґ link РІ Java Script СЃРѕР·РґР°РµС‚... .', NULL, 'SINGLE'),
	(22, 3, 1, 'ceil', 'РњРµС‚РѕРґ ceil(x) РІ Java Script РѕР·РЅР°С‡Р°РµС‚... .', NULL, 'SINGLE'),
	(23, 4, 1, 'Р‘Р»РѕС‡РЅР°СЏ СЂР°Р·РјРµС‚РєР°', 'РќРµРѕР±С…РѕРґРёРјРѕ СЃРѕР·РґР°С‚СЊ Р±Р»РѕС‡РЅС‹Р№ СЌР»РµРјРµРЅС‚ СЃ РІРЅСѓС‚СЂРµРЅРЅРёРјРё РѕС‚СЃС‚СѓРїР°РјРё РѕРґРёРЅР°РєРѕРІС‹С… СЂР°Р·РјРµСЂРѕРІ СЃР»РµРІР° Рё СЃРїСЂР°РІР° (10px) Р° С‚Р°РєР¶Рµ СЃРІРµСЂС…Сѓ Рё СЃРЅРёР·Сѓ (5px)', NULL, 'SINGLE'),
	(24, 4, 1, 'z-index', 'РљР°РєРёРµ Р·РЅР°С‡РµРЅРёСЏ СЃРІРѕР№СЃС‚РІР° z-index РёР· РїРµСЂРµС‡РёСЃР»РµРЅРЅС‹С… СѓРєР°Р·Р°РЅС‹ РІРµСЂРЅРѕ?', NULL, 'SINGLE'),
	(25, 4, 1, 'Р¤РѕРЅРѕРІРѕРµ РёР·РѕР±СЂР°Р¶РµРЅРёРµ', 'РљР°РєРѕР№ С„СЂР°РіРјРµРЅС‚ РєРѕРґР° РЅРµРѕР±С…РѕРґРёРјРѕ РґРѕР±Р°РІРёС‚СЊ Рє С‚Р°Р±Р»РёС†Рµ СЃС‚РёР»РµР№, С‡С‚РѕР±С‹ С„РѕРЅРѕРІРѕРµ РёР·РѕР±СЂР°Р¶РµРЅРёРµ РїРѕРІС‚РѕСЂСЏР»РѕСЃСЊ С‚РѕР»СЊРєРѕ РїРѕ РІРµСЂС‚РёРєР°Р»Рё?', NULL, 'SINGLE'),
	(26, 4, 1, 'РЎРµРјРµР№СЃС‚РІРѕ С€СЂРёС„С‚РѕРІ', 'РљР°РєРёРµ РѕРіСЂР°РЅРёС‡РµРЅРёСЏ РёРјРµРµС‚ СЃРІРѕР№СЃС‚РІРѕ font-family РЅР° РєРѕР»РёС‡РµСЃС‚РІРѕ СѓРєР°Р·Р°РЅРЅС‹С… С€СЂРёС„С‚РѕРІ?', NULL, 'SINGLE'),
	(27, 1, 1, 'РџР°РјСЏС‚СЊ Java', 'РљР°РєРёРј РѕР±СЂР°Р·РѕРј РјРѕР¶РЅРѕ РІС‹РґРµР»РёС‚СЊ С„СЂР°РіРјРµРЅС‚ РїР°РјСЏС‚Рё РІ java?', NULL, 'SINGLE'),
	(28, 4, 1, 'РћР±С‚РµРєР°РЅРёРµ Р±Р»РѕС‡РЅРѕРіРѕ СЌР»РµРјРµРЅС‚', 'РќРµРѕР±С…РѕРґРёРјРѕ Р·Р°РїСЂРµС‚РёС‚СЊ РѕР±С‚РµРєР°РЅРёРµ Р±Р»РѕС‡РЅРѕРіРѕ СЌР»РµРјРµРЅС‚Р° СЃ РґРІСѓС… СЃС‚РѕСЂРѕРЅ. РљР°РєРѕРµ РёР· РїРµСЂРµС‡РёСЃР»РµРЅРЅС‹С… РЅРёР¶Рµ СЃРІРѕР№СЃС‚РІ РїРѕР·РІРѕР»РёС‚ СЂРµС€РёС‚СЊ РїРѕСЃС‚Р°РІР»РµРЅРЅСѓСЋ Р·Р°РґР°С‡Сѓ?', NULL, 'SINGLE'),
	(29, 1, 1, 'РРјРїРѕСЂС‚ Java', 'РќРµРѕР±С…РѕРґРёРјРѕ РёРјРїРѕСЂС‚РёСЂРѕРІР°С‚СЊ РІ РѕРґРёРЅ РёР· РєР»Р°СЃСЃРѕРІ РїР°РєРµС‚Р° my.util РїРѕРґРїР°РєРµС‚ my.util.res.РљР°РєРѕР№ РёР· РїСЂРёРІРµРґРµРЅРЅС‹С… С„СЂР°РіРјРµРЅС‚РѕРІ РєРѕРґР° РїРѕР·РІРѕР»РёС‚ СЂРµС€РёС‚СЊ РїРѕСЃС‚Р°РІР»РµРЅРЅСѓСЋ Р·Р°РґР°С‡Сѓ?', NULL, 'SINGLE'),
	(30, 4, 1, 'РџСЃРµРІРґРѕРєР»Р°СЃСЃС‹', ' РќРµРѕР±С…РѕРґРёРјРѕ СѓРєР°Р·Р°С‚СЊ С†РІРµС‚ С„РѕРЅР° РґР»СЏ СЃСЃС‹Р»РєРё РїСЂРё РЅР°Р¶Р°С‚РёРё РЅР° РЅРµРµ.РљР°РєРѕР№ РїСЃРµРІРґРѕРєР»Р°СЃСЃ РїРѕР·РІРѕР»РёС‚ СЂРµС€РёС‚СЊ РїРѕСЃС‚Р°РІР»РµРЅРЅСѓСЋ Р·Р°РґР°С‡Сѓ?', NULL, 'SINGLE'),
	(31, 9, 106, 'first', 'ijijiiiuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu', '', 'SEVERAL');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;


-- Dumping structure for table khppp.subgroups
CREATE TABLE IF NOT EXISTS `subgroups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL,
  `id_group` bigint(20) unsigned NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FK_subgroups_groups` (`id_group`),
  CONSTRAINT `FK_subgroups_groups` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;


-- Dumping structure for table khppp.tasks
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_creator` bigint(20) unsigned NOT NULL,
  `id_department` bigint(20) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `task_type` enum('TASK','TEST','EXAMINATION') NOT NULL,
  `file` longblob,
  `file_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_id_department_idx` (`id_department`),
  CONSTRAINT `fk_id_department` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.tasks: ~8 rows (approximately)
DELETE FROM `tasks`;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` (`id`, `id_creator`, `id_department`, `name`, `description`, `created_date`, `task_type`, `file`, `file_name`) VALUES
	(1, 120, 1, 'Java Core', 'Task in java core for java web group', '2013-12-03 18:11:29', 'TASK', NULL, NULL),
	(2, 120, 1, 'Java Web', 'Task in java web for java web group', '2013-12-03 18:10:29', 'TASK', NULL, NULL),
	(3, 120, 1, 'Servlets', 'Task in servlets for java web group', '2013-12-03 18:08:29', 'TASK', NULL, NULL),
	(4, 120, 4, 'C# Core', 'Task in java core for java web group', '2013-12-03 16:11:29', 'TASK', NULL, NULL),
	(5, 120, 4, 'C# Web', 'Task in java web for java web group', '2013-12-03 16:10:29', 'EXAMINATION', NULL, NULL),
	(6, 120, 4, 'C# Servlets', 'Task in servlets for java web group', '2013-12-03 16:08:29', 'EXAMINATION', NULL, NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;


-- Dumping structure for table khppp.tests
CREATE TABLE IF NOT EXISTS `tests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) unsigned NOT NULL,
  `id_department` bigint(20) unsigned NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_test_user_idx` (`id_user`),
  KEY `fk_test_department_idx` (`id_department`),
  CONSTRAINT `fk_test_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.tests: ~1 rows (approximately)
DELETE FROM `tests`;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` (`id`, `id_user`, `id_department`, `comment`, `name`, `created_date`) VALUES
	(1, 1, 1, NULL, 'Perfomance test Do not touch', '2014-11-18 12:54:43');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;


-- Dumping structure for table khppp.test_questions
CREATE TABLE IF NOT EXISTS `test_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_test` bigint(20) unsigned NOT NULL,
  `id_question` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_testQuestion_test_idx` (`id_test`),
  KEY `fk_testQuestion_question_idx` (`id_question`),
  CONSTRAINT `fk_testQuestion_question` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_testQuestion_test` FOREIGN KEY (`id_test`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.test_questions: ~30 rows (approximately)
DELETE FROM `test_questions`;
/*!40000 ALTER TABLE `test_questions` DISABLE KEYS */;
INSERT INTO `test_questions` (`id`, `id_test`, `id_question`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6),
	(7, 1, 7),
	(8, 1, 8),
	(9, 1, 9),
	(10, 1, 10),
	(11, 1, 11),
	(12, 1, 12),
	(13, 1, 13),
	(14, 1, 14),
	(15, 1, 15),
	(16, 1, 16),
	(17, 1, 17),
	(18, 1, 18),
	(19, 1, 19),
	(20, 1, 20),
	(21, 1, 21),
	(22, 1, 22),
	(23, 1, 23),
	(24, 1, 24),
	(25, 1, 25),
	(26, 1, 26),
	(27, 1, 27),
	(28, 1, 28),
	(29, 1, 29),
	(30, 1, 30);
/*!40000 ALTER TABLE `test_questions` ENABLE KEYS */;


-- Dumping structure for table khppp.topics
CREATE TABLE IF NOT EXISTS `topics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.topics: ~6 rows (approximately)
DELETE FROM `topics`;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` (`id`, `name`) VALUES
	(1, 'Java core'),
	(2, 'Servlets'),
	(3, 'JavaScript'),
	(4, 'CSS'),
	(5, 'New Topic1'),
	(9, 'hhhh');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;


-- Dumping structure for table khppp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `role` enum('ADMIN','MENTOR','MENTEE','LAB_MANAGER','RESOURCE_MANAGER') NOT NULL DEFAULT 'MENTEE',
  `last_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.users: ~18 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `first_name`, `email`, `password`, `is_active`, `role`, `last_name`) VALUES
	(1, 'Admin', 'Admin_Admin@epam.com', '09d1d20bd495912ed5307a08510440d6', 1, 'ADMIN', 'Admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table khppp.user_answers
CREATE TABLE IF NOT EXISTS `user_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_group_question` bigint(20) unsigned NOT NULL,
  `id_group_answer` bigint(20) unsigned NOT NULL,
  `id_user_test` bigint(20) unsigned NOT NULL,
  `answer` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_userAnswer_groupQuestion_idx` (`id_group_question`),
  KEY `fk_userAnswer_groupAnswer_idx` (`id_group_answer`),
  KEY `fk_userAnswer_userTest_idx` (`id_user_test`),
  CONSTRAINT `fk_userAnswer_groupAnswer` FOREIGN KEY (`id_group_answer`) REFERENCES `group_answers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userAnswer_groupQuestion` FOREIGN KEY (`id_group_question`) REFERENCES `group_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userAnswer_userTest` FOREIGN KEY (`id_user_test`) REFERENCES `user_tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.user_answers: ~0 rows (approximately)
DELETE FROM `user_answers`;
/*!40000 ALTER TABLE `user_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_answers` ENABLE KEYS */;


-- Dumping structure for table khppp.user_tasks
CREATE TABLE IF NOT EXISTS `user_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_assigned_task` bigint(20) unsigned NOT NULL,
  `id_user` bigint(20) unsigned NOT NULL,
  `pass_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('IN_PROGRESS','RESOLVED','CLOSED') DEFAULT 'IN_PROGRESS',
  `penalty_value` double unsigned DEFAULT NULL,
  `quantity_mails` int(10) unsigned NOT NULL DEFAULT '0',
  `id_mentor` bigint(20) unsigned DEFAULT NULL COMMENT 'id of mentor who estimated task',
  `mark` double DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `estimation_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_id_user` (`id_user`),
  KEY `FK_id_assigned_task` (`id_assigned_task`),
  CONSTRAINT `FK_id_assigned_task` FOREIGN KEY (`id_assigned_task`) REFERENCES `assigned_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `user_tasks` ENABLE KEYS */;


-- Dumping structure for table khppp.user_task_comments
CREATE TABLE IF NOT EXISTS `user_task_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_task_id` bigint(20) NOT NULL,
  `mentee_id` bigint(20) NOT NULL,
  `mentor_id` bigint(20) NOT NULL,
  `comment_text` varchar(100) NOT NULL,
  `comment_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- Dumping structure for table khppp.user_tests
CREATE TABLE IF NOT EXISTS `user_tests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `id_group_test` bigint(20) unsigned DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finish_date` timestamp NULL DEFAULT NULL,
  `number_of_questions` int(10) unsigned DEFAULT NULL,
  `correct_answers` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_user_test_users` (`id_user`),
  KEY `FK_user_test_group_tests` (`id_group_test`),
  CONSTRAINT `FK_user_test_group_tests` FOREIGN KEY (`id_group_test`) REFERENCES `group_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_test_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table khppp.user_tests: ~0 rows (approximately)
DELETE FROM `user_tests`;

