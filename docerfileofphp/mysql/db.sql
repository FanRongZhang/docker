-- 创建数据库
create database `docker_mysql` default character set utf8 collate utf8_general_ci;

use docker_mysql;

-- 建表
DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `message` CHAR(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 插入数据
INSERT INTO `message` (`message`) VALUES ('just a mysql db of the docker created,u can modify or delete it.');