/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : glpi

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-03-17 11:54:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `glpi_assetsmanges`
-- ----------------------------
DROP TABLE IF EXISTS `glpi_assetsmanges`;
CREATE TABLE `glpi_assetsmanges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(100) DEFAULT NULL COMMENT '资产名称',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `create_time` datetime NOT NULL COMMENT '加入时间',
  `update_now` datetime NOT NULL COMMENT '更新时间',
  `entities_id` int(11) NOT NULL COMMENT '资产ID',
  `is_deleted` tinyint(1) NOT NULL COMMENT '是否删除 0--未删除 1--',
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of glpi_assetsmanges
-- ----------------------------
INSERT INTO `glpi_assetsmanges` VALUES ('1', '电脑', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '0', '');
INSERT INTO `glpi_assetsmanges` VALUES ('2', '二二', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '12', '0', '');
INSERT INTO `glpi_assetsmanges` VALUES ('3', 'erer', '0', '2016-03-17 04:51:34', '2016-03-17 04:51:34', '0', '0', '日日日45');
INSERT INTO `glpi_assetsmanges` VALUES ('4', 'erer', '0', '2016-03-17 04:51:34', '2016-03-17 04:51:43', '0', '0', 'erere');
INSERT INTO `glpi_assetsmanges` VALUES ('10', 'erer', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '0', 'erere');
