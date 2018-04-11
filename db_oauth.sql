/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : db_oauth

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-06 11:56:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wzs_admin
-- ----------------------------
DROP TABLE IF EXISTS `wzs_admin`;
CREATE TABLE `wzs_admin` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `mobilephone` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_group` int(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wzs_admin
-- ----------------------------
INSERT INTO `wzs_admin` VALUES ('1', 'admin', '0192023a7bbd73250516f069df18b500', '15046113513', '1003418012@qq.com', '1', '');

-- ----------------------------
-- Table structure for wzs_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `wzs_admin_group`;
CREATE TABLE `wzs_admin_group` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `group_auth` varchar(255) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wzs_admin_group
-- ----------------------------
INSERT INTO `wzs_admin_group` VALUES ('1', '超级管理员', '');

-- ----------------------------
-- Table structure for wzs_oauth
-- ----------------------------
DROP TABLE IF EXISTS `wzs_oauth`;
CREATE TABLE `wzs_oauth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `app_key` varchar(50) NOT NULL DEFAULT '' COMMENT 'Key',
  `expires_in` int(11) NOT NULL COMMENT '有效期',
  `app_secret` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un-appkey` (`app_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wzs_oauth
-- ----------------------------
