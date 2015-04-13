/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# mail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mail`;

CREATE TABLE `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `mail_body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender` tinytext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `recipient` tinytext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `reply_to` tinytext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `subject` longtext COLLATE utf8_unicode_ci,
  `content_type` longtext COLLATE utf8_unicode_ci,
  `send_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Rental
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Rental`;

CREATE TABLE `Rental` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` bigint(20) DEFAULT NULL,
  `proxy_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `visible_on_front` tinyint(1) NOT NULL,
  `shortDescription` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `surface` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `emission_of_greenhouse` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_11B5C74BDB26A4E` (`proxy_id`),
  KEY `IDX_11B5C74B16DB4F89` (`picture`),
  KEY `IDX_11B5C74B4250F9D` (`emission_of_greenhouse`),
  CONSTRAINT `FK_11B5C74B16DB4F89` FOREIGN KEY (`picture`) REFERENCES `vic_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_11B5C74B4250F9D` FOREIGN KEY (`emission_of_greenhouse`) REFERENCES `vic_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_11B5C74BDB26A4E` FOREIGN KEY (`proxy_id`) REFERENCES `vic_entity_proxy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `Rental` WRITE;
/*!40000 ALTER TABLE `Rental` DISABLE KEYS */;

INSERT INTO `Rental` (`id`, `picture`, `proxy_id`, `title`, `slug`, `visible_on_front`, `shortDescription`, `description`, `surface`, `emission_of_greenhouse`, `created_at`, `updated_at`)
VALUES
  (1,458,NULL,'Appartement A','appartement-1',1,'Appartement 1 ed hendrerit efficitur ipsum, vitae egestas','Morbi condimentum mollis elit sit amet consectetur. Nulla faucibus ultricies ornare. Sed varius porttitor lacus, a iaculis erat convallis eget. Duis nec nisi tincidunt, consequat elit in, mattis quam. Nunc ultricies sem neque, sed placerat eros fringilla','60',465,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (2,457,NULL,'Appartement 2','appartement-2',1,'Ed hendrerit efficitur ipsum, vitae egestas mauris aliquet sagittis.','Morbi condimentum mollis elit sit amet consectetur. Nulla faucibus ultricies ornare. Sed varius porttitor lacus, a iaculis erat convallis eget. Duis nec nisi tincidunt, consequat elit in, mattis quam. Nunc ultricies sem neque, sed placerat eros fringilla','28',465,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `Rental` ENABLE KEYS */;
UNLOCK TABLES;


# vic_analytics_browse_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_analytics_browse_event`;

CREATE TABLE `vic_analytics_browse_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `ip` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `viewReferenceId` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `referer` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_212FC756F675F31B` (`author_id`),
  CONSTRAINT `FK_212FC756F675F31B` FOREIGN KEY (`author_id`) REFERENCES `vic_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_article`;

CREATE TABLE `vic_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `pattern_id` int(11) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `proxy_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publishedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `visible_on_front` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_265C8BF5DB26A4E` (`proxy_id`),
  KEY `IDX_265C8BF512469DE2` (`category_id`),
  KEY `IDX_265C8BF5DAE07E97` (`blog_id`),
  KEY `IDX_265C8BF5F734A20F` (`pattern_id`),
  KEY `IDX_265C8BF53DA5256D` (`image_id`),
  CONSTRAINT `FK_265C8BF512469DE2` FOREIGN KEY (`category_id`) REFERENCES `vic_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_265C8BF53DA5256D` FOREIGN KEY (`image_id`) REFERENCES `vic_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_265C8BF5DAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_265C8BF5DB26A4E` FOREIGN KEY (`proxy_id`) REFERENCES `vic_entity_proxy` (`id`),
  CONSTRAINT `FK_265C8BF5F734A20F` FOREIGN KEY (`pattern_id`) REFERENCES `vic_view` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_article` WRITE;
/*!40000 ALTER TABLE `vic_article` DISABLE KEYS */;

INSERT INTO `vic_article` (`id`, `category_id`, `blog_id`, `pattern_id`, `image_id`, `proxy_id`, `name`, `slug`, `description`, `status`, `publishedAt`, `deletedAt`, `visible_on_front`, `created_at`, `updated_at`)
VALUES
  (1,NULL,420,419,466,NULL,'Titre de l’article','titre-de-l-article','Suspendisse in lectus cursus, viverra lectus dignissim, mollis odio. Vestibulum eu pretium nisl. Sed eu vehicula mauris. Quisque tempus lorem nec arcu molestie, in fringilla augue euismod. Morbi scelerisque velit non vulputate molestie. Quisque a lobortis enim. Vestibulum id vulputate sapien. Nam et massa diam. Quisque nisl nulla, egestas id facilisis quis, luctus venenatis nisi. Aliquam malesuada tortor vel consectetur hendrerit. Vestibulum pharetra vel dui a mattis. Donec sodales felis id vulputate cursus. Curabitur id varius elit.','published',NULL,NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (2,NULL,420,419,420,NULL,'Un autre article','un-autre-article','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur debitis asperiores culpa fuga accusantium aliquid dolorum ad a adipisci, quas, velit molestiae sed eveniet magnam minus rerum quam labore corrupti itaque eius amet dolores. Quisquam suscipit laudantium voluptas expedita, iste eveniet consectetur dolorem, incidunt rerum, fugit iure maxime reprehenderit eligendi reiciendis, similique quas laboriosam commodi perspiciatis nulla beatae distinctio explicabo deleniti aut! Suscipit alias cum hic soluta, distinctio repellendus architecto molestias vel minus recusandae, nostrum similique consequuntur fugiat sunt dolor dolorem quasi, ducimus commodi, necessitatibus sequi. Excepturi perferendis voluptas, odit iusto ratione soluta a vitae at placeat pariatur, debitis atque eius quia ipsum dolorem ex molestias expedita sint! Animi quae molestiae ratione libero placeat ad aperiam et inventore cupiditate rem tempore ex, doloremque magni! Perspiciatis minus beatae quis magni nihil, cumque facere, consectetur','published','2015-04-03 17:25:00',NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (3,NULL,420,419,421,NULL,'Troisième article','troisieme-article','Lorem ipsum slkdfjlsdkjfsdlkhgjsdl kg','published',NULL,NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `vic_article` ENABLE KEYS */;
UNLOCK TABLES;


# vic_article_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_article_tags`;

CREATE TABLE `vic_article_tags` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`),
  KEY `IDX_2E6D5EDA7294869C` (`article_id`),
  KEY `IDX_2E6D5EDABAD26311` (`tag_id`),
  CONSTRAINT `FK_2E6D5EDA7294869C` FOREIGN KEY (`article_id`) REFERENCES `vic_article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2E6D5EDABAD26311` FOREIGN KEY (`tag_id`) REFERENCES `vic_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_article_tags` WRITE;
/*!40000 ALTER TABLE `vic_article_tags` DISABLE KEYS */;

INSERT INTO `vic_article_tags` (`article_id`, `tag_id`)
VALUES
  (1,1),
  (2,2),
  (3,3);

/*!40000 ALTER TABLE `vic_article_tags` ENABLE KEYS */;
UNLOCK TABLES;


# vic_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_category`;

CREATE TABLE `vic_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6F6EBDBADAE07E97` (`blog_id`),
  KEY `IDX_6F6EBDBA727ACA70` (`parent_id`),
  CONSTRAINT `FK_6F6EBDBA727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `vic_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6F6EBDBADAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_entity_proxy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_entity_proxy`;

CREATE TABLE `vic_entity_proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `rental_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2E15B1BA7294869C` (`article_id`),
  KEY `IDX_2E15B1BAA7CF2329` (`rental_id`),
  CONSTRAINT `FK_2E15B1BA7294869C` FOREIGN KEY (`article_id`) REFERENCES `vic_article` (`id`),
  CONSTRAINT `FK_2E15B1BAA7CF2329` FOREIGN KEY (`rental_id`) REFERENCES `Rental` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_entity_proxy` WRITE;
/*!40000 ALTER TABLE `vic_entity_proxy` DISABLE KEYS */;

INSERT INTO `vic_entity_proxy` (`id`, `article_id`, `rental_id`)
VALUES
  (1,1,NULL),
  (2,2,NULL),
  (3,3,NULL);

/*!40000 ALTER TABLE `vic_entity_proxy` ENABLE KEYS */;
UNLOCK TABLES;


# vic_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_link`;

CREATE TABLE `vic_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attached_page_id` int(11) DEFAULT NULL,
  `attached_widget_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_parameters` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `link_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `analytics_track_code` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_32F82D4B49A25CE0` (`attached_page_id`),
  KEY `IDX_32F82D4B29E2283F` (`attached_widget_id`),
  CONSTRAINT `FK_32F82D4B29E2283F` FOREIGN KEY (`attached_widget_id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_32F82D4B49A25CE0` FOREIGN KEY (`attached_page_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_link` WRITE;
/*!40000 ALTER TABLE `vic_link` DISABLE KEYS */;

INSERT INTO `vic_link` (`id`, `attached_page_id`, `attached_widget_id`, `url`, `target`, `route`, `route_parameters`, `link_type`, `analytics_track_code`, `created_at`, `updated_at`)
VALUES
  (1,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:19','2015-04-13 02:16:19'),
  (2,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:19','2015-04-13 02:16:19'),
  (3,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:19','2015-04-13 02:16:19'),
  (4,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:19','2015-04-13 02:16:19'),
  (5,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:19','2015-04-13 02:16:19'),
  (6,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:19','2015-04-13 02:16:19'),
  (7,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:19','2015-04-13 02:16:19'),
  (8,NULL,NULL,NULL,NULL,NULL,'a:0:{}',NULL,NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (9,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (10,NULL,NULL,NULL,NULL,NULL,'a:0:{}',NULL,NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (11,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (12,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (13,NULL,NULL,NULL,NULL,NULL,'a:0:{}',NULL,NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (14,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (15,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (16,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (17,115,NULL,NULL,'_parent',NULL,'a:0:{}','page',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (18,NULL,NULL,'http://appventus.com/victoire','_blank',NULL,'a:0:{}','url',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (19,NULL,NULL,NULL,'_parent',NULL,'N;','none',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (20,420,NULL,NULL,'_parent',NULL,'N;','page',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (21,115,NULL,NULL,'_parent',NULL,'N;','page',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (22,418,NULL,NULL,'_parent',NULL,'N;','page',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (23,115,NULL,NULL,'_parent',NULL,'N;','page',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (24,418,NULL,NULL,'_parent',NULL,'N;','page',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (25,420,NULL,NULL,'_parent',NULL,'N;','page',NULL,'2015-04-13 02:16:20','2015-04-13 02:16:20'),
  (26,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:24:53','2015-04-13 02:24:53'),
  (27,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:26:47','2015-04-13 02:26:47'),
  (28,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:26:47','2015-04-13 02:26:47'),
  (29,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:26:47','2015-04-13 02:26:47'),
  (30,NULL,NULL,NULL,'_parent',NULL,'a:0:{}','none',NULL,'2015-04-13 02:26:47','2015-04-13 02:26:47');

/*!40000 ALTER TABLE `vic_link` ENABLE KEYS */;
UNLOCK TABLES;


# vic_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_media`;

CREATE TABLE `vic_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `folder_id` bigint(20) DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `metadata` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `filesize` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_419CAF2AD17F50A6` (`uuid`),
  KEY `IDX_419CAF2A162CB942` (`folder_id`),
  CONSTRAINT `vic_media_ibfk_1` FOREIGN KEY (`folder_id`) REFERENCES `vic_media_folders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_media` WRITE;
/*!40000 ALTER TABLE `vic_media` DISABLE KEYS */;

INSERT INTO `vic_media` (`id`, `folder_id`, `uuid`, `name`, `location`, `content_type`, `metadata`, `created_at`, `updated_at`, `filesize`, `url`, `deleted`)
VALUES
  (420,1,'54f463f410ca1','Basket@2x.png','local','image/png','a:0:{}','2015-03-02 14:21:56','2015-04-07 12:42:44',653881,'/uploads/media/54f463f410ca1.png',1),
  (421,1,'54f464090dc6c','Football-Masculin@2x.png','local','image/png','a:0:{}','2015-03-02 14:22:16','2015-04-07 12:42:53',601354,'/uploads/media/54f464090dc6c.png',1),
  (451,1,'551d0def48454','home cover background.jpg','local','image/jpeg','a:0:{}','2015-04-02 11:37:51','2015-04-02 11:37:51',201822,'/uploads/media/551d0def48454.jpeg',0),
  (452,1,'551d32cf4770b','logo appventus.png','local','image/png','a:0:{}','2015-04-02 14:15:11','2015-04-02 14:15:11',9304,'/uploads/media/551d32cf4770b.png',0),
  (453,1,'551d32f4c7193','logo victoire.png','local','image/png','a:0:{}','2015-04-02 14:15:48','2015-04-02 14:15:48',16732,'/uploads/media/551d32f4c7193.png',0),
  (454,1,'551d330a87ef0','logo victoire.png','local','image/png','a:0:{}','2015-04-02 14:16:10','2015-04-02 14:16:10',16732,'/uploads/media/551d330a87ef0.png',0),
  (455,1,'551d3315729f8','logo victoire.png','local','image/png','a:0:{}','2015-04-02 14:16:21','2015-04-02 14:16:21',16732,'/uploads/media/551d3315729f8.png',0),
  (456,1,'551d5943ec8c5','appartement-1.jpg','local','image/jpeg','a:0:{}','2015-04-02 16:59:15','2015-04-02 16:59:15',486290,'/uploads/media/551d5943ec8c5.jpeg',0),
  (457,1,'551d595200363','appartement-2.jpg','local','image/jpeg','a:0:{}','2015-04-02 16:59:29','2015-04-02 16:59:29',444871,'/uploads/media/551d595200363.jpeg',0),
  (458,1,'551d5987c70aa','appartement-4.jpg','local','image/jpeg','a:0:{}','2015-04-02 17:00:23','2015-04-02 17:00:23',612323,'/uploads/media/551d5987c70aa.jpeg',0),
  (459,1,'551d59aa1acf8','appartement-3.jpg','local','image/jpeg','a:0:{}','2015-04-02 17:00:58','2015-04-02 17:00:58',672205,'/uploads/media/551d59aa1acf8.jpeg',0),
  (460,1,'551d59df387d8','appartement-5.JPG','local','image/jpeg','a:0:{}','2015-04-02 17:01:51','2015-04-02 17:01:51',208817,'/uploads/media/551d59df387d8.jpeg',0),
  (461,1,'551d59ef7c8df','appartement-6.jpg','local','image/jpeg','a:0:{}','2015-04-02 17:02:07','2015-04-02 17:02:07',120122,'/uploads/media/551d59ef7c8df.jpeg',0),
  (462,1,'551d59fcc2827','appartement-7.jpg','local','image/jpeg','a:0:{}','2015-04-02 17:02:20','2015-04-02 17:02:20',829464,'/uploads/media/551d59fcc2827.jpeg',0),
  (463,1,'551d5a0b13c2b','appartement-8.jpg','local','image/jpeg','a:0:{}','2015-04-02 17:02:35','2015-04-02 17:02:35',645396,'/uploads/media/551d5a0b13c2b.jpeg',0),
  (464,1,'551d5a17382a3','appartement-9.jpg','local','image/jpeg','a:0:{}','2015-04-02 17:02:47','2015-04-02 17:02:47',636808,'/uploads/media/551d5a17382a3.jpeg',0),
  (465,1,'551d5a427e070','bilan energetique.png','local','image/png','a:0:{}','2015-04-02 17:03:30','2015-04-02 17:03:30',32265,'/uploads/media/551d5a427e070.png',0),
  (466,1,'551e9d07c52d5','view.jpg','local','image/jpeg','a:0:{}','2015-04-03 16:00:39','2015-04-03 16:00:39',157306,'/uploads/media/551e9d07c52d5.jpeg',0),
  (467,1,'551eaf5bb93e0','blog-cover.jpg','local','image/jpeg','a:0:{}','2015-04-03 17:18:51','2015-04-03 17:18:51',204087,'/uploads/media/551eaf5bb93e0.jpeg',0),
  (468,1,'55238ff6072ee','sample blog image 1.jpg','local','image/jpeg','a:0:{}','2015-04-07 10:06:13','2015-04-07 10:06:13',5313,'/uploads/media/55238ff6072ee.jpeg',0),
  (469,1,'55239119bef01','sample blog image 2.jpg','local','image/jpeg','a:0:{}','2015-04-07 10:11:05','2015-04-07 10:11:05',9387,'/uploads/media/55239119bef01.jpeg',0),
  (470,1,'5523bb304aa89','logo.png','local','image/png','a:0:{}','2015-04-07 13:10:40','2015-04-07 13:10:40',2868,'/uploads/media/5523bb304aa89.png',0),
  (471,31,'5523bb628524c','logo.png','local','image/png','a:0:{}','2015-04-07 13:11:30','2015-04-07 13:11:30',2868,'/uploads/media/5523bb628524c.png',0),
  (472,31,'5523c57018ee6','victoire_logo_footer.png','local','image/png','a:0:{}','2015-04-07 13:54:24','2015-04-07 13:54:24',11983,'/uploads/media/5523c57018ee6.png',0);

/*!40000 ALTER TABLE `vic_media` ENABLE KEYS */;
UNLOCK TABLES;


# vic_media_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_media_folders`;

CREATE TABLE `vic_media_folders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `rel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internal_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5C1D48AA727ACA70` (`parent_id`),
  CONSTRAINT `FK_5C1D48AA727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `vic_media_folders` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_media_folders` WRITE;
/*!40000 ALTER TABLE `vic_media_folders` DISABLE KEYS */;

INSERT INTO `vic_media_folders` (`id`, `parent_id`, `name`, `created_at`, `updated_at`, `rel`, `internal_name`, `deleted`)
VALUES
  (1,NULL,'/','1991-01-29 11:02:13','2008-03-23 01:37:58',NULL,NULL,0),
  (30,1,'Appartements','2015-04-07 12:06:19','2015-04-07 12:06:19','media',NULL,0),
  (31,1,'Logo','2015-04-07 13:11:13','2015-04-07 13:11:13','media',NULL,0);

/*!40000 ALTER TABLE `vic_media_folders` ENABLE KEYS */;
UNLOCK TABLES;


# vic_page_seo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_page_seo`;

CREATE TABLE `vic_page_seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci,
  `rel_author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rel_publisher` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ogTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ogType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ogUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ogDescription` longtext COLLATE utf8_unicode_ci,
  `fbAdmins` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitterCard` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitterUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitterTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitterDescription` longtext COLLATE utf8_unicode_ci,
  `schemaPageType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schemaName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schemaDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_robots_index` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_robots_follow` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_robots_advanced` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sitemap_indexed` tinyint(1) DEFAULT '1',
  `sitemap_priority` double DEFAULT '0.8',
  `rel_canonical` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect_to` int(11) DEFAULT NULL,
  `sitemap_changeFreq` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'monthly',
  `ogImage_id` bigint(20) DEFAULT NULL,
  `twitterImage_id` bigint(20) DEFAULT NULL,
  `schemaImage_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C9EC40DADC9332D9` (`redirect_to`),
  KEY `IDX_C9EC40DA5A9543B4` (`ogImage_id`),
  KEY `IDX_C9EC40DA7CEA52D4` (`twitterImage_id`),
  KEY `IDX_C9EC40DA35A1FB30` (`schemaImage_id`),
  CONSTRAINT `FK_C9EC40DA35A1FB30` FOREIGN KEY (`schemaImage_id`) REFERENCES `vic_media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C9EC40DA5A9543B4` FOREIGN KEY (`ogImage_id`) REFERENCES `vic_media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C9EC40DA7CEA52D4` FOREIGN KEY (`twitterImage_id`) REFERENCES `vic_media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C9EC40DADC9332D9` FOREIGN KEY (`redirect_to`) REFERENCES `vic_view` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_page_seo` WRITE;
/*!40000 ALTER TABLE `vic_page_seo` DISABLE KEYS */;

INSERT INTO `vic_page_seo` (`id`, `meta_title`, `meta_description`, `rel_author`, `rel_publisher`, `ogTitle`, `ogType`, `ogUrl`, `ogDescription`, `fbAdmins`, `twitterCard`, `twitterUrl`, `twitterTitle`, `twitterDescription`, `schemaPageType`, `schemaName`, `schemaDescription`, `meta_robots_index`, `meta_robots_follow`, `meta_robots_advanced`, `sitemap_indexed`, `sitemap_priority`, `rel_canonical`, `keyword`, `redirect_to`, `sitemap_changeFreq`, `ogImage_id`, `twitterImage_id`, `schemaImage_id`, `created_at`, `updated_at`)
VALUES
  (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,'monthly',NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0.9,NULL,NULL,NULL,'monthly',NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0.8,NULL,NULL,NULL,'monthly',NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `vic_page_seo` ENABLE KEYS */;
UNLOCK TABLES;


# vic_route_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_route_history`;

CREATE TABLE `vic_route_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1C14303FC4663E4` (`page_id`),
  CONSTRAINT `vic_route_history_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_tag`;

CREATE TABLE `vic_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_tag` WRITE;
/*!40000 ALTER TABLE `vic_tag` DISABLE KEYS */;

INSERT INTO `vic_tag` (`id`, `title`, `slug`)
VALUES
  (1,'','Tag 1'),
  (2,'','Tag 2'),
  (3,'','Tag 3');

/*!40000 ALTER TABLE `vic_tag` ENABLE KEYS */;
UNLOCK TABLES;


# vic_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_user`;

CREATE TABLE `vic_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_89C762F392FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_89C762F3A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_user` WRITE;
/*!40000 ALTER TABLE `vic_user` DISABLE KEYS */;

INSERT INTO `vic_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `firstname`, `lastname`, `locale`, `created_at`, `updated_at`)
VALUES
  (20,'anakin@victoire.io','anakin@victoire.io','anakin@victoire.io','anakin@victoire.io',1,'6hmztsiwga04ocksg8gg8gk0sokw8kk','JOozgnmRIuqPF3wAs+gXKC3kLVt0HaPmO85dKVmJzZ6G76LffOshEM5IXQ/4PfmV5YjVCA5vtQqXF6KtD1Ksow==',NULL,0,0,NULL,NULL,NULL,'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:23:\"ROLE_VICTOIRE_DEVELOPER\";}',0,NULL,'Anakin','Skywalker','fr','1970-01-01 00:00:00','1970-01-01 00:00:00');

/*!40000 ALTER TABLE `vic_user` ENABLE KEYS */;
UNLOCK TABLES;


# vic_view
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_view`;

CREATE TABLE `vic_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bodyId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bodyClass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homepage` tinyint(1) DEFAULT NULL,
  `compute_url` tinyint(1) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishedAt` datetime DEFAULT NULL,
  `undeletable` tinyint(1) NOT NULL,
  `widget_map` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `entityProxy_id` int(11) DEFAULT NULL,
  `query` longtext COLLATE utf8_unicode_ci,
  `business_entity_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `i18n_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FAA91F3477153098` (`code`),
  KEY `IDX_FAA91F34727ACA70` (`parent_id`),
  KEY `IDX_FAA91F349FCC6D15` (`i18n_id`),
  KEY `IDX_FAA91F34F675F31B` (`author_id`),
  KEY `IDX_FAA91F341341DB46` (`entityProxy_id`),
  KEY `IDX_FAA91F3497E3DD86` (`seo_id`),
  KEY `IDX_FAA91F345DA0FB8` (`template_id`),
  CONSTRAINT `FK_FAA91F341341DB46` FOREIGN KEY (`entityProxy_id`) REFERENCES `vic_entity_proxy` (`id`),
  CONSTRAINT `FK_FAA91F345DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FAA91F34727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FAA91F3497E3DD86` FOREIGN KEY (`seo_id`) REFERENCES `vic_page_seo` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FAA91F349FCC6D15` FOREIGN KEY (`i18n_id`) REFERENCES `vic_view_i18n` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_view` WRITE;
/*!40000 ALTER TABLE `vic_view` DISABLE KEYS */;

INSERT INTO `vic_view` (`id`, `type`, `layout`, `seo_id`, `template_id`, `parent_id`, `author_id`, `name`, `bodyId`, `bodyClass`, `slug`, `url`, `homepage`, `compute_url`, `position`, `lft`, `lvl`, `rgt`, `root`, `status`, `publishedAt`, `undeletable`, `widget_map`, `entityProxy_id`, `query`, `business_entity_name`, `code`, `i18n_id`, `locale`, `created_at`, `updated_at`)
VALUES
  (113,'template','fullWidth',NULL,NULL,NULL,20,'Modèle de base',NULL,NULL,'base',NULL,NULL,NULL,0,1,0,2,113,NULL,NULL,1,'a:17:{s:11:\"header_logo\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:247;}}s:11:\"header_menu\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:18;}}s:10:\"header_btn\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:19;}}s:13:\"footer_layout\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:20;}}s:4:\"20_1\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:81;}}s:4:\"20_2\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:80;}}s:4:\"20_3\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:79;}}s:11:\"footer_text\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:24;}}s:10:\"footer_btn\";a:0:{}s:12:\"main_content\";a:0:{}s:4:\"20_4\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:78;}}s:6:\"footer\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:183;}}s:5:\"179_1\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:180;}}s:5:\"179_2\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:181;}}s:5:\"183_1\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:184;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:2;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:187;}}s:5:\"184_1\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:248;}}s:5:\"184_2\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:186;}}}',NULL,NULL,NULL,NULL,5,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (114,'template','home',NULL,113,NULL,20,'Modèle de page d\'accueil',NULL,NULL,'home',NULL,NULL,NULL,0,1,0,2,114,NULL,NULL,1,'a:0:{}',NULL,NULL,NULL,NULL,6,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (115,'page',NULL,1,113,NULL,20,'Page d\'accueil',NULL,NULL,'home','',1,1,0,1,0,2,115,'published','1979-03-27 17:20:00',1,'a:17:{s:12:\"main_content\";a:3:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:188;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:2;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:193;}i:2;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:3;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:196;}}s:29:\"carousel_content__middle_28_1\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:29;}}s:4:\"29_1\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:30;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:2;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:31;}}s:4:\"31_1\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:32;}}s:4:\"31_2\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:33;}}s:4:\"27_1\";a:6:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:34;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:2;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:35;}i:2;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:3;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:36;}i:3;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:4;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:37;}i:4;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:5;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:38;}i:5;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:6;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:39;}}s:4:\"39_2\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:40;}}s:4:\"39_3\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:41;}}s:10:\"header_btn\";a:0:{}s:8:\"cover188\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:189;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:2;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:190;}}s:5:\"190_2\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:191;}}s:5:\"190_1\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:192;}}s:5:\"193_1\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:194;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:2;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:195;}}s:5:\"196_1\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:197;}}s:5:\"196_2\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:198;}}s:5:\"242_2\";a:0:{}s:5:\"242_1\";a:0:{}}',NULL,NULL,NULL,NULL,7,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (116,'errorpage',NULL,NULL,113,NULL,20,'Mauvaise Requete',NULL,NULL,'mauvaise-requete',NULL,NULL,NULL,0,1,0,2,116,NULL,NULL,1,'a:0:{}',NULL,NULL,NULL,400,8,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (117,'errorpage',NULL,NULL,113,NULL,20,'Interdit',NULL,NULL,'erreur403',NULL,NULL,NULL,0,1,0,2,117,NULL,NULL,1,'a:0:{}',NULL,NULL,NULL,403,9,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (118,'errorpage',NULL,NULL,113,NULL,20,'Page introuvable',NULL,NULL,'erreur404',NULL,NULL,NULL,0,1,0,2,118,NULL,NULL,1,'a:0:{}',NULL,NULL,NULL,404,10,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (119,'errorpage',NULL,NULL,113,NULL,20,'Erreur serveur',NULL,NULL,'erreur500',NULL,NULL,NULL,0,1,0,2,119,NULL,NULL,1,'a:0:{}',NULL,NULL,NULL,500,11,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (120,'errorpage',NULL,NULL,113,NULL,20,'Service indisponible',NULL,NULL,'erreur503',NULL,NULL,NULL,0,1,0,2,120,NULL,NULL,1,'a:0:{}',NULL,NULL,NULL,503,12,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (153,'template','fullWidth',NULL,113,NULL,20,'Modèle de page Ariane',NULL,NULL,'modele-de-page-ariane',NULL,NULL,NULL,0,1,0,2,153,NULL,NULL,0,'a:2:{s:12:\"main_content\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:142;}}s:5:\"142_1\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:143;}}}',NULL,NULL,NULL,NULL,45,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (415,'businessentitypagepattern',NULL,NULL,113,115,20,'{{item.title}}',NULL,NULL,'item-title','appartement-{{item.slug}}',NULL,1,0,1,0,2,415,'published','2015-04-02 17:38:35',0,'a:6:{s:12:\"main_content\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:199;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:207;}}s:5:\"199_1\";a:3:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:200;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:2;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:201;}i:2;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:3;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:202;}}s:7:\"202_155\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:203;}}s:7:\"202_156\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:206;}}s:10:\"breadcrumb\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:208;}}s:8:\"cover208\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:209;}}}',NULL,NULL,'rental',NULL,49,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (418,'page',NULL,2,113,NULL,20,'Logements',NULL,NULL,'logements','logements',0,1,2,1,0,2,418,'published','2015-04-03 14:29:56',0,'a:2:{s:12:\"main_content\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:2;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:211;}}s:5:\"211_1\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:213;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:215;}}}',NULL,NULL,NULL,NULL,50,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (419,'businessentitypagepattern',NULL,NULL,113,NULL,20,'{{item.name}}',NULL,NULL,'item-name','article-{{item.slug}}',NULL,1,0,1,0,2,419,'published','2015-04-03 15:48:22',0,'a:5:{s:10:\"breadcrumb\";a:3:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:221;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:2;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:223;}i:2;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:3;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:224;}}s:8:\"cover221\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:222;}}s:5:\"224_1\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:225;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:226;}}s:6:\"footer\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:236;}}s:5:\"236_1\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:237;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:246;}}}',NULL,NULL,'article',NULL,51,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (420,'blog',NULL,3,113,NULL,20,'Actualité des appartements Nantais',NULL,NULL,'actualite-des-appartements-nantais','actualite-des-appartements-nantais',NULL,1,3,1,0,2,420,'published',NULL,0,'a:3:{s:12:\"main_content\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:217;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:219;}}s:5:\"217_1\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:218;}}s:8:\"cover219\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:220;}}}',NULL,NULL,NULL,NULL,52,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (421,'businessentitypage',NULL,NULL,419,NULL,20,'Titre de l’article',NULL,NULL,'titre-de-l-article','article-titre-de-l-article',NULL,1,0,1,0,2,421,'published','2015-04-03 15:48:22',0,'a:1:{s:11:\"header_menu\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"delete\";s:8:\"position\";N;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:18;}}}',1,NULL,NULL,NULL,53,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (422,'businessentitypage',NULL,NULL,419,NULL,20,'Un autre article',NULL,NULL,'un-autre-article','article-un-autre-article',NULL,1,0,1,0,2,422,'published','2015-04-03 15:48:22',0,'a:5:{s:5:\"224_1\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"delete\";s:8:\"position\";N;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:225;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";s:3:\"226\";s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:231;}}s:5:\"227_1\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:228;}}s:5:\"227_2\";a:1:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:229;}}s:5:\"231_1\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:232;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:2;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:233;}}s:5:\"231_2\";a:2:{i:0;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:1;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:234;}i:1;a:5:{s:6:\"action\";s:6:\"create\";s:8:\"position\";i:2;s:17:\"positionReference\";N;s:16:\"replacedWidgetId\";N;s:8:\"widgetId\";i:235;}}}',2,NULL,NULL,NULL,54,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (424,'businessentitypage',NULL,NULL,419,NULL,20,'Troisième article',NULL,NULL,'troisieme-article','article-troisieme-article',NULL,1,0,1,0,2,424,'published','2015-04-03 15:48:22',0,'a:0:{}',3,NULL,NULL,NULL,56,'fr','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `vic_view` ENABLE KEYS */;
UNLOCK TABLES;


# vic_view_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_view_i18n`;

CREATE TABLE `vic_view_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C6525EDA886601C5` (`fr_id`),
  CONSTRAINT `FK_C6525EDA886601C5` FOREIGN KEY (`fr_id`) REFERENCES `vic_view` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_view_i18n` WRITE;
/*!40000 ALTER TABLE `vic_view_i18n` DISABLE KEYS */;

INSERT INTO `vic_view_i18n` (`id`, `fr_id`)
VALUES
  (5,113),
  (6,114),
  (7,115),
  (8,116),
  (9,117),
  (10,118),
  (11,119),
  (12,120),
  (45,153),
  (49,415),
  (50,418),
  (51,419),
  (52,420),
  (53,421),
  (54,422),
  (56,424);

/*!40000 ALTER TABLE `vic_view_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget`;

CREATE TABLE `vic_widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fields` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `mode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci,
  `business_entity_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_id` int(11) DEFAULT NULL,
  `entityProxy_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `container_tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'div',
  `container_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_margin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_padding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_margin_xs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_padding_xs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_margin_sm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_padding_sm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_margin_md` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_padding_md` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_margin_lg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_padding_lg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_align` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_57DF2B231341DB46` (`entityProxy_id`),
  KEY `IDX_57DF2B2331518C7` (`view_id`),
  CONSTRAINT `FK_57DF2B231341DB46` FOREIGN KEY (`entityProxy_id`) REFERENCES `vic_entity_proxy` (`id`),
  CONSTRAINT `FK_57DF2B2331518C7` FOREIGN KEY (`view_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget` WRITE;
/*!40000 ALTER TABLE `vic_widget` DISABLE KEYS */;

INSERT INTO `vic_widget` (`id`, `slot`, `theme`, `fields`, `mode`, `query`, `business_entity_name`, `view_id`, `entityProxy_id`, `type`, `container_tag`, `container_class`, `container_width`, `container_margin`, `container_padding`, `container_margin_xs`, `container_padding_xs`, `container_margin_sm`, `container_padding_sm`, `container_margin_md`, `container_padding_md`, `container_margin_lg`, `container_padding_lg`, `container_background`, `text_align`)
VALUES
  (18,'header_menu','Header','a:0:{}','static',NULL,NULL,113,NULL,'Menu','div','header-menu',NULL,'36px 0 0 88px',NULL,'0px',NULL,'0px',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (19,'header_btn',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Button','div',NULL,NULL,'24px auto 0',NULL,'0px',NULL,'0px',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (20,'footer_layout',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Layout','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (24,'footer_text',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'CKEditor','div',NULL,NULL,'20px auto 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (29,'carousel_content__middle_28_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Layout','div','container',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (30,'29_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'CKEditor','div',NULL,NULL,'200px auto 50px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (31,'29_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Layout','div',NULL,NULL,'0 auto 100px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (32,'31_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Button','div','text-xs-center text-md-right slider-btn',NULL,NULL,NULL,'25px 0 0',NULL,'25px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (33,'31_2',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Button','div','text-xs-center text-md-left slider-btn',NULL,NULL,NULL,'25px 0 0',NULL,'25px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (34,'27_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'CKEditor','div',NULL,NULL,'60px auto 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (35,'27_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Button','div','text-center',NULL,'40px auto',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (36,'27_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'CKEditor','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (37,'27_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Title','div',NULL,NULL,'100px auto 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (38,'27_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'CKEditor','div',NULL,NULL,'40px auto 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (39,'27_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Layout','div',NULL,NULL,'45px auto 100px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (40,'39_2',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Image','div','text-right',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (41,'39_3',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Image','div','text-left',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (78,'20_4',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Button','div','text-center',NULL,'20px auto 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (79,'20_3',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Image','div','text-center',NULL,'15px auto 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (80,'20_2',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Image','div','text-center',NULL,'20px auto 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (81,'20_1',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Image','div','text-center',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (142,'main_content',NULL,'a:0:{}','static',NULL,NULL,153,NULL,'Layout','div','container',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (143,'142_1',NULL,'a:0:{}','static',NULL,NULL,153,NULL,'Breadcrumb','div',NULL,NULL,'100px auto 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (180,'179_1',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Image','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'center'),
  (181,'179_2',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Button','div',NULL,NULL,'5px 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'center'),
  (183,'footer',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Layout','footer',NULL,NULL,NULL,'20px 0 36px',NULL,'20px 0',NULL,'20px 0',NULL,NULL,NULL,NULL,'#222534',NULL),
  (184,'183_1',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Layout','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (186,'184_2',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Button','div',NULL,NULL,'5px 0',NULL,'20px 0 30px',NULL,'20px 0 30px',NULL,NULL,NULL,NULL,NULL,NULL,'center'),
  (187,'183_1',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Menu','nav',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'center'),
  (188,'main_content',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Cover','div',NULL,NULL,'-90px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (189,'cover188',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Title','div','color-white',NULL,'220px 0 67px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (190,'cover188',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Layout','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (191,'190_2',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Button','div','text-xs-center text-md-left -homeBtn',NULL,NULL,NULL,'15px 0 0',NULL,'15px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (192,'190_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Button','div','text-xs-center text-md-right -homeBtn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (193,'main_content',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Layout','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (194,'193_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Title','div',NULL,NULL,'100px 0 30px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (195,'193_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'CKEditor','div',NULL,NULL,'0 0 50px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (196,'main_content',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Layout','div',NULL,NULL,'0 0 100px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (197,'196_1',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Image','div','text-xs-center text-md-right',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (198,'196_2',NULL,'a:0:{}','static',NULL,NULL,115,NULL,'Image','div','text-xs-center text-md-left',NULL,NULL,NULL,'30px 0 0',NULL,'30px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (199,'main_content',NULL,'a:0:{}','static',NULL,NULL,415,NULL,'Layout','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (200,'199_1',NULL,'a:1:{s:7:\"content\";s:16:\"shortDescription\";}','businessEntity',NULL,'rental',415,NULL,'Title','div',NULL,NULL,'50px 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (201,'199_1',NULL,'a:0:{}','static',NULL,NULL,415,NULL,'Button','div',NULL,NULL,'0 0 60px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'center'),
  (202,'199_1',NULL,'a:0:{}','static',NULL,NULL,415,NULL,'Tab','div',NULL,NULL,'0 0 300px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (203,'202_155',NULL,'a:1:{s:7:\"content\";s:11:\"description\";}','businessEntity',NULL,'rental',415,NULL,'Text','div',NULL,NULL,'50px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (206,'202_156',NULL,'a:4:{s:5:\"image\";s:20:\"emissionOfGreenhouse\";s:3:\"alt\";s:5:\"title\";s:6:\"legend\";s:16:\"shortDescription\";s:5:\"title\";s:5:\"title\";}','businessEntity',NULL,'rental',415,NULL,'Image','div',NULL,NULL,'50px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'center'),
  (207,'main_content',NULL,'a:0:{}','static',NULL,NULL,415,NULL,'Breadcrumb','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (208,'breadcrumb',NULL,'a:4:{s:5:\"image\";s:7:\"picture\";s:3:\"alt\";s:5:\"title\";s:6:\"legend\";s:5:\"title\";s:5:\"title\";s:5:\"title\";}','businessEntity',NULL,'rental',415,NULL,'Cover','div','rental-cover',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (209,'cover208',NULL,'a:1:{s:7:\"content\";s:5:\"title\";}','businessEntity',NULL,'rental',415,NULL,'Title','div','text-uppercase color-white',NULL,'172px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (211,'main_content',NULL,'a:0:{}','static',NULL,NULL,418,NULL,'Layout','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (213,'211_1','Rental','a:0:{}','query',NULL,'rental',418,NULL,'Listing','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (215,'211_1',NULL,'a:0:{}','static',NULL,NULL,418,NULL,'Title','div',NULL,NULL,'100px 0 50px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (216,'header_menu','Header','a:0:{}','static',NULL,NULL,421,NULL,'Menu','div','header-menu',NULL,'36px 0 0 88px',NULL,'0px',NULL,'0px',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (217,'main_content',NULL,'a:0:{}','static',NULL,NULL,420,NULL,'Layout','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#FCF9F9',NULL),
  (218,'217_1',NULL,'a:0:{}','query',NULL,'article',420,NULL,'ArticleList','div',NULL,NULL,'60px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (219,'main_content',NULL,'a:0:{}','static',NULL,NULL,420,NULL,'Cover','div',NULL,NULL,'-90px 0 0',NULL,'-70px 0 0',NULL,'-70px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (220,'cover219',NULL,'a:0:{}','static',NULL,NULL,420,NULL,'Title','div','color-white text-uppercase',NULL,'270px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (221,'breadcrumb',NULL,'a:4:{s:5:\"image\";s:5:\"image\";s:3:\"alt\";s:4:\"name\";s:6:\"legend\";s:4:\"name\";s:5:\"title\";s:4:\"name\";}','businessEntity',NULL,'article',419,NULL,'Cover','div','blog-cover',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (222,'cover221',NULL,'a:1:{s:7:\"content\";s:4:\"name\";}','businessEntity',NULL,'article',419,NULL,'Title','div','color-white text-uppercase',NULL,'170px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (223,'breadcrumb',NULL,'a:0:{}','static',NULL,NULL,419,NULL,'Breadcrumb','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (224,'breadcrumb',NULL,'a:0:{}','static',NULL,NULL,419,NULL,'Layout','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#FCF9F9',NULL),
  (225,'224_1',NULL,'a:0:{}','static',NULL,NULL,419,NULL,'Title','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (226,'224_1','Date','a:1:{s:7:\"content\";s:11:\"publishedAt\";}','businessEntity',NULL,'article',419,NULL,'Title','div','color-green',NULL,'105px 0 32px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (228,'227_1',NULL,'a:0:{}','static',NULL,NULL,422,NULL,'CKEditor','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (229,'227_2',NULL,'a:0:{}','static',NULL,NULL,422,NULL,'Image','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (231,'224_1',NULL,'a:0:{}','static',NULL,NULL,422,NULL,'Layout','div',NULL,NULL,'0 0 130px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (232,'231_1',NULL,'a:0:{}','static',NULL,NULL,422,NULL,'CKEditor','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (233,'231_1',NULL,'a:0:{}','static',NULL,NULL,422,NULL,'Image','div',NULL,NULL,'30px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (234,'231_2',NULL,'a:0:{}','static',NULL,NULL,422,NULL,'Image','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (235,'231_2',NULL,'a:0:{}','static',NULL,NULL,422,NULL,'CKEditor','div',NULL,NULL,'30px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (236,'footer',NULL,'a:0:{}','static',NULL,NULL,419,NULL,'Layout','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#FCF9F9',NULL),
  (237,'236_1',NULL,'a:0:{}','static',NULL,NULL,419,NULL,'Disqus','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (246,'236_1',NULL,'a:0:{}','static',NULL,NULL,419,NULL,'ShareThis','div',NULL,NULL,'0 0 50px',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'center'),
  (247,'header_logo',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Image','div',NULL,NULL,'25px 0 0',NULL,'14px 0 0',NULL,'14px 0 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (248,'184_1',NULL,'a:0:{}','static',NULL,NULL,113,NULL,'Image','div',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'center');

/*!40000 ALTER TABLE `vic_widget` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_articlelist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_articlelist`;

CREATE TABLE `vic_widget_articlelist` (
  `id` int(11) NOT NULL,
  `global_link_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `global_link_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `global_link_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maxResults` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_B73A8986BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_articlelist` WRITE;
/*!40000 ALTER TABLE `vic_widget_articlelist` DISABLE KEYS */;

INSERT INTO `vic_widget_articlelist` (`id`, `global_link_title`, `global_link_url`, `global_link_label`, `title`, `maxResults`)
VALUES
  (218,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `vic_widget_articlelist` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_breadcrumb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_breadcrumb`;

CREATE TABLE `vic_widget_breadcrumb` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_AFC6BCBBBF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_breadcrumb` WRITE;
/*!40000 ALTER TABLE `vic_widget_breadcrumb` DISABLE KEYS */;

INSERT INTO `vic_widget_breadcrumb` (`id`)
VALUES
  (143),
  (207),
  (223);

/*!40000 ALTER TABLE `vic_widget_breadcrumb` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_button
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_button`;

CREATE TABLE `vic_widget_button` (
  `id` int(11) NOT NULL,
  `attached_widget_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hoverTitle` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `style` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `is_block` tinyint(1) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_parameters` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `link_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attached_page_id` int(11) DEFAULT NULL,
  `is_callToAction` tinyint(1) NOT NULL,
  `analytics_track_code` longtext COLLATE utf8_unicode_ci,
  `link_id` int(11) DEFAULT NULL,
  `icon` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D7442D9ADA40271` (`link_id`),
  KEY `IDX_D7442D949A25CE0` (`attached_page_id`),
  KEY `IDX_D7442D929E2283F` (`attached_widget_id`),
  CONSTRAINT `FK_D7442D929E2283F` FOREIGN KEY (`attached_widget_id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D7442D949A25CE0` FOREIGN KEY (`attached_page_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D7442D9ADA40271` FOREIGN KEY (`link_id`) REFERENCES `vic_link` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_D7442D9BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_button` WRITE;
/*!40000 ALTER TABLE `vic_widget_button` DISABLE KEYS */;

INSERT INTO `vic_widget_button` (`id`, `attached_widget_id`, `title`, `hoverTitle`, `size`, `style`, `is_block`, `url`, `target`, `route`, `route_parameters`, `link_type`, `attached_page_id`, `is_callToAction`, `analytics_track_code`, `link_id`, `icon`)
VALUES
  (19,NULL,'test',NULL,'normal','primary',0,NULL,'_parent',NULL,'a:0:{}','none',NULL,0,NULL,26,NULL),
  (32,NULL,'test',NULL,'normal','primary',0,NULL,'_parent',NULL,'a:0:{}','none',NULL,0,NULL,27,NULL),
  (33,NULL,'test',NULL,'normal','primary',0,NULL,'_parent',NULL,'a:0:{}','none',NULL,0,NULL,28,NULL),
  (35,NULL,'test',NULL,'normal','primary',0,NULL,'_parent',NULL,'a:0:{}','none',NULL,0,NULL,29,NULL),
  (78,NULL,'test',NULL,'normal','primary',0,NULL,'_parent',NULL,'a:0:{}','none',NULL,0,NULL,30,NULL),
  (181,NULL,'Contact',NULL,'normal','success',0,NULL,'_parent',NULL,'a:0:{}','none',NULL,0,NULL,2,NULL),
  (186,NULL,'Contact',NULL,'normal','success',0,NULL,'_parent',NULL,'a:0:{}','none',NULL,0,NULL,3,NULL),
  (191,NULL,'Call to action','Call to action','large','success',0,NULL,'_parent',NULL,'a:0:{}','none',NULL,0,NULL,4,NULL),
  (192,NULL,'Défault','Défault','large','default',0,NULL,'_parent',NULL,'a:0:{}','none',NULL,1,NULL,5,NULL),
  (201,NULL,'Envoyer un message',NULL,'normal','success',0,NULL,'_parent',NULL,'a:0:{}','none',NULL,0,NULL,6,NULL);

/*!40000 ALTER TABLE `vic_widget_button` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_ckeditor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_ckeditor`;

CREATE TABLE `vic_widget_ckeditor` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_B264FED2BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_ckeditor` WRITE;
/*!40000 ALTER TABLE `vic_widget_ckeditor` DISABLE KEYS */;

INSERT INTO `vic_widget_ckeditor` (`id`)
VALUES
  (24),
  (30),
  (34),
  (36),
  (38),
  (195),
  (228),
  (232),
  (235);

/*!40000 ALTER TABLE `vic_widget_ckeditor` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_cover
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_cover`;

CREATE TABLE `vic_widget_cover` (
  `id` int(11) NOT NULL,
  `opacity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_27DD922EBF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_cover` WRITE;
/*!40000 ALTER TABLE `vic_widget_cover` DISABLE KEYS */;

INSERT INTO `vic_widget_cover` (`id`, `opacity`)
VALUES
  (188,NULL),
  (208,NULL),
  (219,NULL),
  (221,NULL);

/*!40000 ALTER TABLE `vic_widget_cover` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_disqus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_disqus`;

CREATE TABLE `vic_widget_disqus` (
  `id` int(11) NOT NULL,
  `disqus_shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_360AB717BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_disqus` WRITE;
/*!40000 ALTER TABLE `vic_widget_disqus` DISABLE KEYS */;

INSERT INTO `vic_widget_disqus` (`id`, `disqus_shortname`)
VALUES
  (237,'appventus');

/*!40000 ALTER TABLE `vic_widget_disqus` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_file`;

CREATE TABLE `vic_widget_file` (
  `id` int(11) NOT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `linkLabel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_53C7827E93CB796C` (`file_id`),
  CONSTRAINT `FK_53C7827E93CB796C` FOREIGN KEY (`file_id`) REFERENCES `vic_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_53C7827EBF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_widget_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_filter`;

CREATE TABLE `vic_widget_filter` (
  `id` int(11) NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `ajax` tinyint(1) NOT NULL,
  `filter` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `multiple` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_48B6B1F93DAE168B` (`list_id`),
  CONSTRAINT `FK_48B6B1F93DAE168B` FOREIGN KEY (`list_id`) REFERENCES `vic_widget_listing` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_48B6B1F9BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_widget_html
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_html`;

CREATE TABLE `vic_widget_html` (
  `id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_C7214C8BBF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_widget_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_image`;

CREATE TABLE `vic_widget_image` (
  `id` int(11) NOT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `related_page_id` int(11) DEFAULT NULL,
  `legend` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attached_page_id` int(11) DEFAULT NULL,
  `attached_widget_id` int(11) DEFAULT NULL,
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_parameters` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `analytics_track_code` longtext COLLATE utf8_unicode_ci,
  `link_id` int(11) DEFAULT NULL,
  `lazy_load` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6FE810B4ADA40271` (`link_id`),
  KEY `IDX_6FE810B43DA5256D` (`image_id`),
  KEY `IDX_6FE810B4335FA941` (`related_page_id`),
  KEY `IDX_6FE810B449A25CE0` (`attached_page_id`),
  KEY `IDX_6FE810B429E2283F` (`attached_widget_id`),
  CONSTRAINT `FK_6FE810B429E2283F` FOREIGN KEY (`attached_widget_id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6FE810B4335FA941` FOREIGN KEY (`related_page_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6FE810B43DA5256D` FOREIGN KEY (`image_id`) REFERENCES `vic_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6FE810B449A25CE0` FOREIGN KEY (`attached_page_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6FE810B4ADA40271` FOREIGN KEY (`link_id`) REFERENCES `vic_link` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_6FE810B4BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_image` WRITE;
/*!40000 ALTER TABLE `vic_widget_image` DISABLE KEYS */;

INSERT INTO `vic_widget_image` (`id`, `image_id`, `alt`, `title`, `link_type`, `width`, `height`, `url`, `related_page_id`, `legend`, `attached_page_id`, `attached_widget_id`, `target`, `route`, `route_parameters`, `analytics_track_code`, `link_id`, `lazy_load`)
VALUES
  (188,451,NULL,NULL,'none',NULL,'550px',NULL,NULL,NULL,NULL,NULL,'_parent',NULL,'a:0:{}',NULL,7,NULL),
  (197,452,NULL,NULL,'none',NULL,'106',NULL,NULL,NULL,NULL,NULL,'_parent',NULL,'a:0:{}',NULL,11,NULL),
  (198,453,NULL,NULL,'none',NULL,'106px',NULL,NULL,NULL,NULL,NULL,'_parent',NULL,'a:0:{}',NULL,12,NULL),
  (206,453,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a:0:{}',NULL,13,NULL),
  (208,453,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a:0:{}',NULL,8,NULL),
  (219,464,NULL,NULL,'none',NULL,'490px',NULL,NULL,NULL,NULL,NULL,'_parent',NULL,'a:0:{}',NULL,9,NULL),
  (221,453,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a:0:{}',NULL,10,NULL),
  (229,468,NULL,NULL,'none','100%',NULL,NULL,NULL,NULL,NULL,NULL,'_parent',NULL,'a:0:{}',NULL,14,NULL),
  (233,469,NULL,NULL,'none','100%',NULL,NULL,NULL,NULL,NULL,NULL,'_parent',NULL,'a:0:{}',NULL,15,NULL),
  (234,468,NULL,NULL,'none','100%',NULL,NULL,NULL,NULL,NULL,NULL,'_parent',NULL,'a:0:{}',NULL,16,NULL),
  (247,471,NULL,NULL,'page',NULL,'41px',NULL,NULL,NULL,115,NULL,'_parent',NULL,'a:0:{}',NULL,17,NULL),
  (248,472,NULL,NULL,'url',NULL,'50px','http://appventus.com/victoire',NULL,NULL,NULL,NULL,'_blank',NULL,'a:0:{}',NULL,18,NULL);

/*!40000 ALTER TABLE `vic_widget_image` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_layout`;

CREATE TABLE `vic_widget_layout` (
  `id` int(11) NOT NULL,
  `layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `has_container` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_D488506BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_layout` WRITE;
/*!40000 ALTER TABLE `vic_widget_layout` DISABLE KEYS */;

INSERT INTO `vic_widget_layout` (`id`, `layout`, `has_container`)
VALUES
  (20,'quarters',0),
  (29,'once',0),
  (31,'half',0),
  (39,'quarters',0),
  (142,'once',0),
  (183,'once',1),
  (184,'half',0),
  (190,'half',1),
  (193,'once',1),
  (196,'half',1),
  (199,'once',1),
  (211,'once',1),
  (217,'once',1),
  (224,'once',1),
  (231,'third21',0),
  (236,'once',1);

/*!40000 ALTER TABLE `vic_widget_layout` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_listing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_listing`;

CREATE TABLE `vic_widget_listing` (
  `id` int(11) NOT NULL,
  `targetPattern_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6C501C5BC14172EE` (`targetPattern_id`),
  CONSTRAINT `FK_6C501C5BBF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6C501C5BC14172EE` FOREIGN KEY (`targetPattern_id`) REFERENCES `vic_view` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_listing` WRITE;
/*!40000 ALTER TABLE `vic_widget_listing` DISABLE KEYS */;

INSERT INTO `vic_widget_listing` (`id`, `targetPattern_id`)
VALUES
  (202,NULL),
  (218,NULL),
  (213,415);

/*!40000 ALTER TABLE `vic_widget_listing` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_listing_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_listing_item`;

CREATE TABLE `vic_widget_listing_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B2C649E3D4619D1A` (`listing_id`),
  CONSTRAINT `FK_B2C649E3D4619D1A` FOREIGN KEY (`listing_id`) REFERENCES `vic_widget_listing` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_listing_item` WRITE;
/*!40000 ALTER TABLE `vic_widget_listing_item` DISABLE KEYS */;

INSERT INTO `vic_widget_listing_item` (`id`, `listing_id`, `title`, `position`, `type`)
VALUES
  (60,NULL,'FORMATION',0,'widgettabitem'),
  (61,NULL,'LOISIRS',0,'widgettabitem'),
  (62,NULL,'COMPÉTITIONS',0,'widgettabitem'),
  (63,NULL,'PHOTOS',0,'widgettabitem'),
  (64,NULL,'LIEUX',0,'widgettabitem'),
  (65,NULL,'ADHÉSION & TARIFS',0,'widgettabitem'),
  (66,NULL,'CONTACT',0,'widgettabitem'),
  (67,NULL,'AGENDA',0,'widgettabitem'),
  (114,NULL,'ACCUEIL',1,'menuitem'),
  (115,NULL,'SPORTS',2,'menuitem'),
  (116,NULL,'MANIFESTATIONS',3,'menuitem'),
  (117,NULL,'ASSOCIATION',4,'menuitem'),
  (118,NULL,'Se connecter',5,'menuitem'),
  (120,NULL,'Sports',2,'menuitem'),
  (140,NULL,'Manifestations',3,'menuitem'),
  (153,NULL,'Victoire Démo',0,'menuitem'),
  (154,NULL,'Mentions légales',0,'menuitem'),
  (155,NULL,'Description',0,'widgettabitem'),
  (156,NULL,'Bilan énergétique',0,'widgettabitem'),
  (159,NULL,'Blog',0,'menuitem'),
  (160,NULL,'Accueil',1,'menuitem'),
  (161,NULL,'Logements',2,'menuitem'),
  (162,NULL,'Accueil',0,'menuitem'),
  (163,NULL,'Logements',0,'menuitem'),
  (164,NULL,'Blog',0,'menuitem');

/*!40000 ALTER TABLE `vic_widget_listing_item` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_markdown
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_markdown`;

CREATE TABLE `vic_widget_markdown` (
  `id` int(11) NOT NULL,
  `markdown` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_EB1E4606BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_widget_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_menu`;

CREATE TABLE `vic_widget_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_A25D8EFDBF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_menu` WRITE;
/*!40000 ALTER TABLE `vic_widget_menu` DISABLE KEYS */;

INSERT INTO `vic_widget_menu` (`id`, `name`, `slug`)
VALUES
  (18,'Menu principal','menu-principal'),
  (187,'Footer nav','footer-nav'),
  (216,'Menu principal','menu-principal');

/*!40000 ALTER TABLE `vic_widget_menu` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_menu_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_menu_item`;

CREATE TABLE `vic_widget_menu_item` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `attached_widget_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  `menu_type` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_parameters` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `link_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `root_hierarchy_page` int(11) DEFAULT NULL,
  `attached_page_id` int(11) DEFAULT NULL,
  `analytics_track_code` longtext COLLATE utf8_unicode_ci,
  `link_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7496369ADA40271` (`link_id`),
  KEY `IDX_7496369CCD7E912` (`menu_id`),
  KEY `IDX_7496369727ACA70` (`parent_id`),
  KEY `IDX_749636926D74311` (`root_hierarchy_page`),
  KEY `IDX_749636949A25CE0` (`attached_page_id`),
  KEY `IDX_749636929E2283F` (`attached_widget_id`),
  CONSTRAINT `FK_749636926D74311` FOREIGN KEY (`root_hierarchy_page`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_749636929E2283F` FOREIGN KEY (`attached_widget_id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_749636949A25CE0` FOREIGN KEY (`attached_page_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7496369727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `vic_widget_menu_item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7496369ADA40271` FOREIGN KEY (`link_id`) REFERENCES `vic_link` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_7496369BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget_listing_item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7496369CCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `vic_widget_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_menu_item` WRITE;
/*!40000 ALTER TABLE `vic_widget_menu_item` DISABLE KEYS */;

INSERT INTO `vic_widget_menu_item` (`id`, `menu_id`, `parent_id`, `attached_widget_id`, `lft`, `lvl`, `rgt`, `root`, `menu_type`, `url`, `target`, `route`, `route_parameters`, `link_type`, `root_hierarchy_page`, `attached_page_id`, `analytics_track_code`, `link_id`)
VALUES
  (153,187,NULL,NULL,1,0,2,153,2,NULL,'_parent',NULL,'N;','none',NULL,NULL,NULL,19),
  (159,216,NULL,NULL,1,0,2,159,2,NULL,'_parent',NULL,'N;','page',NULL,420,NULL,20),
  (160,216,NULL,NULL,1,0,2,160,2,NULL,'_parent',NULL,'N;','page',NULL,115,NULL,21),
  (161,216,NULL,NULL,1,0,2,161,2,NULL,'_parent',NULL,'N;','page',NULL,418,NULL,22),
  (162,18,NULL,NULL,1,0,2,162,2,NULL,'_parent',NULL,'N;','page',NULL,115,NULL,23),
  (163,18,NULL,NULL,1,0,2,163,2,NULL,'_parent',NULL,'N;','page',NULL,418,NULL,24),
  (164,18,NULL,NULL,1,0,2,164,2,NULL,'_parent',NULL,'N;','page',NULL,420,NULL,25);

/*!40000 ALTER TABLE `vic_widget_menu_item` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_render
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_render`;

CREATE TABLE `vic_widget_render` (
  `id` int(11) NOT NULL,
  `related_widget_id` int(11) DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `kind` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A32E778E5329D9F9` (`related_widget_id`),
  CONSTRAINT `FK_A32E778E5329D9F9` FOREIGN KEY (`related_widget_id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A32E778EBF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_widget_sharethis
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_sharethis`;

CREATE TABLE `vic_widget_sharethis` (
  `id` int(11) NOT NULL,
  `facebookEnabled` tinyint(1) NOT NULL,
  `twitterEnabled` tinyint(1) NOT NULL,
  `googleplusEnabled` tinyint(1) NOT NULL,
  `linkedinEnabled` tinyint(1) NOT NULL,
  `viadeoEnabled` tinyint(1) NOT NULL,
  `emailEnabled` tinyint(1) NOT NULL,
  `pinterestEnabled` tinyint(1) NOT NULL,
  `bufferEnabled` tinyint(1) NOT NULL,
  `shareThisEnabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_1967A814BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_sharethis` WRITE;
/*!40000 ALTER TABLE `vic_widget_sharethis` DISABLE KEYS */;

INSERT INTO `vic_widget_sharethis` (`id`, `facebookEnabled`, `twitterEnabled`, `googleplusEnabled`, `linkedinEnabled`, `viadeoEnabled`, `emailEnabled`, `pinterestEnabled`, `bufferEnabled`, `shareThisEnabled`)
VALUES
  (246,1,1,0,0,0,0,0,0,0);

/*!40000 ALTER TABLE `vic_widget_sharethis` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_simplecontactform
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_simplecontactform`;

CREATE TABLE `vic_widget_simplecontactform` (
  `id` int(11) NOT NULL,
  `recipientName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recipientEmail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `replyToEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `senderEmail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_CD873B5BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_widget_simplecontactform_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_simplecontactform_message`;

CREATE TABLE `vic_widget_simplecontactform_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `widget_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BAFEB034FBE885E2` (`widget_id`),
  CONSTRAINT `FK_BAFEB034FBE885E2` FOREIGN KEY (`widget_id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_widget_sitemap
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_sitemap`;

CREATE TABLE `vic_widget_sitemap` (
  `id` int(11) NOT NULL,
  `root_page` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A4012D4253D70F17` (`root_page`),
  CONSTRAINT `FK_A4012D4253D70F17` FOREIGN KEY (`root_page`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A4012D42BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_widget_slider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_slider`;

CREATE TABLE `vic_widget_slider` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_F8B5FEE3BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_widget_slider_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_slider_item`;

CREATE TABLE `vic_widget_slider_item` (
  `id` int(11) NOT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `attached_widget_id` int(11) DEFAULT NULL,
  `link_label` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_parameters` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `link_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attached_page_id` int(11) DEFAULT NULL,
  `analytics_track_code` longtext COLLATE utf8_unicode_ci,
  `link_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5403DED0ADA40271` (`link_id`),
  KEY `IDX_5403DED03DA5256D` (`image_id`),
  KEY `IDX_5403DED0D4619D1A` (`listing_id`),
  KEY `IDX_5403DED049A25CE0` (`attached_page_id`),
  KEY `IDX_5403DED029E2283F` (`attached_widget_id`),
  CONSTRAINT `FK_5403DED029E2283F` FOREIGN KEY (`attached_widget_id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5403DED03DA5256D` FOREIGN KEY (`image_id`) REFERENCES `vic_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5403DED049A25CE0` FOREIGN KEY (`attached_page_id`) REFERENCES `vic_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5403DED0ADA40271` FOREIGN KEY (`link_id`) REFERENCES `vic_link` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_5403DED0BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget_listing_item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5403DED0D4619D1A` FOREIGN KEY (`listing_id`) REFERENCES `vic_widget_slider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# vic_widget_tab
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_tab`;

CREATE TABLE `vic_widget_tab` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_4BB8EEA0BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_tab` WRITE;
/*!40000 ALTER TABLE `vic_widget_tab` DISABLE KEYS */;

INSERT INTO `vic_widget_tab` (`id`)
VALUES
  (202);

/*!40000 ALTER TABLE `vic_widget_tab` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_tab_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_tab_item`;

CREATE TABLE `vic_widget_tab_item` (
  `id` int(11) NOT NULL,
  `listing_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DC79C5FED4619D1A` (`listing_id`),
  CONSTRAINT `FK_DC79C5FEBF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget_listing_item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DC79C5FED4619D1A` FOREIGN KEY (`listing_id`) REFERENCES `vic_widget_tab` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_tab_item` WRITE;
/*!40000 ALTER TABLE `vic_widget_tab_item` DISABLE KEYS */;

INSERT INTO `vic_widget_tab_item` (`id`, `listing_id`)
VALUES
  (155,202),
  (156,202);

/*!40000 ALTER TABLE `vic_widget_tab_item` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_text
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_text`;

CREATE TABLE `vic_widget_text` (
  `id` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_E4D313A9BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_text` WRITE;
/*!40000 ALTER TABLE `vic_widget_text` DISABLE KEYS */;

INSERT INTO `vic_widget_text` (`id`, `content`)
VALUES
  (24,'<p style=\"text-align:center\"><span style=\"font-size:12px\"><span style=\"color:#B7BABD\">Amicale Sportive et culturelle des agents des collectivit&eacute;s de la M&eacute;tropole Nantaise - <strong>Mentions l&eacute;gales</strong></span></span></p>'),
  (30,'<p style=\"text-align: center;\"><span style=\"font-size:36px\"><span style=\"color:#FFFFFF\">Deux nouvelles sections sportives !</span></span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:36px\"><span style=\"color:#FFFFFF\"><strong>Basket &amp; Volley</strong></span></span></p>'),
  (34,'<h1 style=\"text-align: center;\"><span style=\"color:#DB1500\"><span style=\"font-size:24px\"><strong>AMICALE SPORTIVE</strong></span><span style=\"font-size:18px\"><span style=\"font-size:24px\"><strong> </strong></span>ET CULTURELLE DES AGENTS DES COLLECTIVIT&Eacute;S DE LA<span style=\"font-size:24px\"> </span></span><span style=\"font-size:24px\"><strong>M&Eacute;TROPOLE NANTAISE</strong></span></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px\">L&rsquo;ASMN est une association loi 1901, subventionn&eacute;e par la Ville de Nantes et Nantes m&eacute;tropole, qui propose depuis 1953, des activit&eacute;s sportives et culturelles et participe &eacute;galement &agrave; l&rsquo;animation de rencontres sportives.&nbsp;</span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px\">Elle est aujourd&#39;hui compos&eacute;e de 17 sections sportives, dont 2 nouvelles : Basket et Volley.</span></p>'),
  (36,'<p style=\"text-align: center;\"><span style=\"font-size:16px\"><strong>L&#39;association est ouverte aux agents, retrait&eacute;s des institutions suivantes :</strong></span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px\">Ville de Nantes, &nbsp;Nantes m&eacute;tropole, &nbsp;Communes de l&#39;agglom&eacute;ration, Cr&eacute;dit Municipal, &nbsp;C.C.A.S, &nbsp;Nantes habitat,</span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px\">et autres structures : NMGE, TAN, SAMOA, NMA, LOD, Voyages &agrave; Nantes, Cit&eacute; internationale des Congr&egrave;s, AURAN, NMD,...</span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px\">ainsi qu&#39;&agrave; leur conjoint et mineurs &agrave; charge.</span></p>'),
  (37,'Nos partenaires'),
  (38,'<p style=\"text-align: center;\"><span style=\"font-size:14px\">L&#39;ASMN b&eacute;n&eacute;ficie du soutien de la Ville de Nantes et de Nantes m&eacute;tropole dans le cadre d&#39;une nouvelle Convention sign&eacute;e en 2011.&nbsp;</span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px\">Les collectivit&eacute;s partenaires apportent leur soutien aux activit&eacute;s d&rsquo;int&eacute;r&ecirc;t g&eacute;n&eacute;ral mises en &oelig;uvre par l&rsquo;ASMN au b&eacute;n&eacute;fice des agents des Collectivit&eacute;s nantaises et de leurs familles dans les domaines du sport (pratique de la comp&eacute;tition dans les championnats de sport d&rsquo;entreprise, pratique de l&rsquo;&eacute;ducation physique, promotions d&rsquo;animations sportives) et de la culture.&nbsp;</span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px\">La participation de membres agr&eacute;&eacute;s aux activit&eacute;s de l&rsquo;ASMN est prise en consid&eacute;ration, sous r&eacute;serve que les membres actifs soient majoritaires,&nbsp;notamment dans les organes d&eacute;cisionnels de l&rsquo;association.</span></p>'),
  (189,'H1. BASELINE HEADING'),
  (194,'H2. Heading'),
  (195,'<p style=\"text-align: center;\">Morbi condimentum mollis elit sit amet consectetur. Nulla faucibus ultricies ornare. Sed varius porttitor lacus, a iaculis erat convallis eget. Duis nec nisi tincidunt, consequat elit in, mattis quam. Nunc ultricies sem neque, sed placerat eros fringilla nec. Donec laoreet mi vel ex eleifend lacinia. In justo metus, dapibus ut dolor in, blandit fringilla lectus. Fusce hendrerit pretium hendrerit. Aliquam purus urna, bibendum at arcu ut, tincidunt rhoncus magna. Quisque rhoncus elit sed eleifend posuere. Fusce pretium, nibh vitae egestas venenatis, massa tellus suscipit lorem, non pretium enim nibh ut justo.</p>'),
  (200,NULL),
  (203,NULL),
  (209,NULL),
  (215,'H1. HEADING'),
  (220,'Awesome blog'),
  (222,NULL),
  (225,NULL),
  (226,NULL),
  (228,'<p>Suspendisse in lectus cursus, viverra lectus dignissim, mollis odio. Vestibulum eu pretium nisl. Sed eu vehicula mauris. Quisque tempus lorem nec arcu molestie, in fringilla augue euismod. Morbi scelerisque velit non vulputate molestie. Quisque a lobortis enim. Vestibulum id vulputate sapien. Nam et massa diam. Quisque nisl nulla, egestas id facilisis quis, luctus venenatis nisi. Aliquam malesuada tortor vel consectetur hendrerit. Vestibulum pharetra vel dui a mattis. Donec sodales felis id vulputate cursus. Curabitur id varius elit. Nam et massa diam. Quisque nisl nulla, egestas id facilisis quis, luctus venenatis nisi. Aliquam malesuada tortor vel consectetur hendrerit. Vestibulum pharetra vel dui a mattis. Donec sodales felis id vulputate cursus. Curabitur id varius elit. Nam et massa diam. Quisque nisl nulla, egestas id facilisis quis, luctus venenatis nisi. Aliquam malesuada tortor vel</p>'),
  (232,'<p>Suspendisse in lectus cursus, viverra lectus dignissim, mollis odio. Vestibulum eu pretium nisl. Sed eu vehicula mauris. Quisque tempus lorem nec arcu molestie, in fringilla augue euismod. Morbi scelerisque velit non vulputate molestie. Quisque a lobortis enim. Vestibulum id vulputate sapien. Nam et massa diam. Quisque nisl nulla, egestas id facilisis quis, luctus venenatis nisi. Aliquam malesuada tortor vel consectetur hendrerit. Vestibulum pharetra vel dui a mattis. Donec sodales felis id vulputate cursus. Curabitur id varius elit. Nam et massa diam. Quisque nisl nulla, egestas id facilisis quis, luctus venenatis nisi. Aliquam malesuada tortor vel consectetur hendrerit. Vestibulum pharetra vel dui a mattis. Donec sodales felis id vulputate cursus. Curabitur id varius elit. Nam et massa diam. Quisque nisl nulla, egestas id facilisis quis, luctus venenatis nisi. Aliquam malesuada tortor vel consectetur hendrerit. Vestibulum pharetra vel dui a mattis. Donec sodales felis id vulputate cursus. Curabitur id varius elit.</p>'),
  (235,'<p>Suspendisse in lectus cursus, viverra lectus dignissim, mollis odio. Vestibulum eu pretium nisl. Sed eu vehicula mauris. Quisque tempus lorem nec arcu molestie, in fringilla augue euismod. Morbi scelerisque velit non vulputate molestie. Quisque a lobortis enim. Vestibulum id vulputate sapien. Nam et massa diam. Quisque nisl nulla, egestas id facilisis quis, luctus venenatis nisi. Aliquam malesuada tortor vel consectetur hendrerit. Vestibulum pharetra vel dui a mattis. Donec sodales felis id vulputate cursus. Curabitur id varius elit. Nam et massa diam. Quisque nisl nulla, egestas id facilisis quis, luctus venenatis nisi. Aliquam malesuada tortor vel consectetur hendrerit. Vestibulum pharetra vel dui a mattis. Donec sodales felis id vulputate cursus. Curabitur id varius elit. Nam et massa diam. Quisque nisl nulla, egestas id facilisis quis, luctus venenatis nisi. Aliquam malesuada tortor vel consectetur hendrerit.&nbsp;</p>');

/*!40000 ALTER TABLE `vic_widget_text` ENABLE KEYS */;
UNLOCK TABLES;


# vic_widget_title
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vic_widget_title`;

CREATE TABLE `vic_widget_title` (
  `id` int(11) NOT NULL,
  `headingLevel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `headingStyle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `align` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_81E36C80BF396750` FOREIGN KEY (`id`) REFERENCES `vic_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `vic_widget_title` WRITE;
/*!40000 ALTER TABLE `vic_widget_title` DISABLE KEYS */;

INSERT INTO `vic_widget_title` (`id`, `headingLevel`, `headingStyle`, `align`)
VALUES
  (37,'h2','h2','center'),
  (189,'h1','h1','center'),
  (194,'h2','h2','center'),
  (200,'h2','h3','center'),
  (209,'h1','h1','center'),
  (215,'h1','h2','center'),
  (220,'h1','h1','center'),
  (222,'h1','h1','center'),
  (225,'h2','h3','left'),
  (226,'h3','h3','left');

/*!40000 ALTER TABLE `vic_widget_title` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
