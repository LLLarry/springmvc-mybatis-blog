/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50513
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2021-03-09 09:42:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `content` text COMMENT '文章内容',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` tinyint(4) NOT NULL DEFAULT '1' COMMENT '评论是否开启',
  `type` int(11) NOT NULL COMMENT '标签 / 类型',
  `user_id` int(11) NOT NULL COMMENT '所属用户的id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `s` (`type`),
  KEY `文章所属用户` (`user_id`),
  CONSTRAINT `s` FOREIGN KEY (`type`) REFERENCES `article_type` (`id`),
  CONSTRAINT `文章所属用户` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('2', 'css', '内容', '0', '2', '1', '2', '2021-03-06 09:01:15');
INSERT INTO `article` VALUES ('3', 'js', 'js入门', '0', '1', '3', '3', '2021-03-06 09:01:16');
INSERT INTO `article` VALUES ('4', 'js1', 'js入门', '0', '1', '3', '2', '2021-03-06 09:01:17');
INSERT INTO `article` VALUES ('5', 'js2', 'js入门', '0', '1', '3', '3', '2021-03-06 09:01:18');
INSERT INTO `article` VALUES ('6', 'js3', 'js入门', '0', '1', '3', '2', '2021-03-06 09:01:19');
INSERT INTO `article` VALUES ('7', 'js4', 'js入门', '0', '1', '3', '3', '2021-03-06 09:01:24');
INSERT INTO `article` VALUES ('8', 'js5', 'js入门', '0', '1', '3', '1', '2021-03-04 10:37:22');
INSERT INTO `article` VALUES ('9', 'js6', 'js入门', '0', '1', '3', '1', '2021-03-04 10:37:25');
INSERT INTO `article` VALUES ('12', 'js9', 'js入门', '0', '1', '3', '1', '2021-03-04 10:37:34');
INSERT INTO `article` VALUES ('13', 'js10', 'js入门', '0', '1', '3', '1', '2021-03-04 10:37:37');
INSERT INTO `article` VALUES ('14', 'js11', 'js入门', '0', '1', '3', '1', '2021-03-04 10:37:40');
INSERT INTO `article` VALUES ('15', 'java', 'java入门2', '0', '1', '3', '1', '2021-03-05 12:00:37');
INSERT INTO `article` VALUES ('21', 'java', 'java入门', '1', '1', '3', '1', '2021-03-04 17:44:52');
INSERT INTO `article` VALUES ('25', null, null, '0', '1', '3', '1', '2021-03-05 08:43:58');
INSERT INTO `article` VALUES ('26', null, null, '0', '1', '3', '1', '2021-03-05 08:50:28');
INSERT INTO `article` VALUES ('27', 'javac', 'llss', '0', '2', '3', '1', '2021-03-05 09:00:36');
INSERT INTO `article` VALUES ('38', 'java', 'java入门', '0', '1', '3', '1', '2021-03-05 11:49:17');
INSERT INTO `article` VALUES ('39', 'java', 'java入门', '0', '1', '3', '1', '2021-03-05 11:49:18');
INSERT INTO `article` VALUES ('40', 'java', 'java入门', '0', '1', '3', '1', '2021-03-05 11:49:18');
INSERT INTO `article` VALUES ('41', '春节放假通知', '', '0', '1', '1', '1', '2021-03-05 12:51:09');
INSERT INTO `article` VALUES ('42', '', '', '0', '1', '1', '1', '2021-03-05 12:53:12');
INSERT INTO `article` VALUES ('43', '', '', '0', '1', '1', '1', '2021-03-05 12:54:59');
INSERT INTO `article` VALUES ('44', '', '', '0', '1', '1', '1', '2021-03-05 12:56:43');
INSERT INTO `article` VALUES ('45', '', '## blog\n```js\nvar ig = \'123456\'\n```\n> ss\n\n> kl\n', '0', '1', '1', '1', '2021-03-05 12:59:50');
INSERT INTO `article` VALUES ('46', '', '', '0', '2', '1', '1', '2021-03-05 13:28:53');
INSERT INTO `article` VALUES ('47', '', '', '0', '1', '1', '1', '2021-03-08 13:33:48');
INSERT INTO `article` VALUES ('48', '', '', '0', '1', '1', '1', '2021-03-08 13:33:48');
INSERT INTO `article` VALUES ('49', '', '', '0', '1', '1', '1', '2021-03-08 13:33:48');

-- ----------------------------
-- Table structure for `article_type`
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签类型',
  `type_text_id` int(11) NOT NULL COMMENT '文章类型对应的文字id',
  PRIMARY KEY (`id`),
  KEY `type_text_id` (`type_text_id`),
  CONSTRAINT `article_type_ibfk_1` FOREIGN KEY (`type_text_id`) REFERENCES `article_type_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES ('1', '1');
INSERT INTO `article_type` VALUES ('2', '2');
INSERT INTO `article_type` VALUES ('3', '3');

-- ----------------------------
-- Table structure for `article_type_name`
-- ----------------------------
DROP TABLE IF EXISTS `article_type_name`;
CREATE TABLE `article_type_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_type_name
-- ----------------------------
INSERT INTO `article_type_name` VALUES ('1', '天文');
INSERT INTO `article_type_name` VALUES ('2', '地理');
INSERT INTO `article_type_name` VALUES ('3', '文学');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(20) NOT NULL COMMENT '用户名称',
  `password` varchar(32) NOT NULL COMMENT '用户密码',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'larry', '123456', '/upload/feng1.png', null, '2021-03-02 10:11:05');
INSERT INTO `user` VALUES ('2', 'kimi', '999999', '/upload/feng1.png', null, '2021-03-06 08:50:35');
INSERT INTO `user` VALUES ('3', 'tom', '888888', '/upload/美女.jpg', null, '2021-03-06 08:50:21');
