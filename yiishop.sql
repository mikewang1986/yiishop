/*
Navicat MySQL Data Transfer

Source Server         : 444
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : yiishop

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-03-27 14:58:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `car_admin_group`;
CREATE TABLE `car_admin_group` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `group_name` varchar(50) NOT NULL COMMENT '组名称',
  `acl` text NOT NULL COMMENT '权限',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员组';

-- ----------------------------
-- Records of car_admin_group
-- ----------------------------

-- ----------------------------
-- Table structure for car_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `car_admin_users`;
CREATE TABLE `car_admin_users` (
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '后台用户ID',
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '启用',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `truename` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `config` longtext COMMENT '配置信息',
  `favorite` longtext COMMENT '爱好',
  `super` enum('0','1') NOT NULL DEFAULT '0' COMMENT '超级管理员',
  `lastip` varchar(20) DEFAULT NULL COMMENT '上次登录ip',
  `logincount` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `disabled` enum('true','false') NOT NULL DEFAULT 'false',
  `op_no` varchar(50) DEFAULT NULL COMMENT '操作员no',
  `password` varchar(128) DEFAULT NULL,
  `memo` text COMMENT '备注',
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_admin_users
-- ----------------------------
INSERT INTO `car_admin_users` VALUES ('1', '1', 'admin', '1416965007', null, null, null, '1', null, '323', 'false', null, '14e1b600b1fd579f47433b88e8d85291', null, '1');

-- ----------------------------
-- Table structure for car_b2c_brand
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_brand`;
CREATE TABLE `car_b2c_brand` (
  `brand_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `brand_name` varchar(50) NOT NULL COMMENT '品牌名称',
  `brand_url` varchar(255) DEFAULT NULL COMMENT '品牌网址',
  `brand_desc` longtext COMMENT '品牌介绍',
  `brand_logo` varchar(255) DEFAULT NULL COMMENT '品牌图片标识',
  `brand_keywords` longtext COMMENT '品牌别名',
  `brand_setting` enum('3','2','1') DEFAULT NULL COMMENT '品牌设置 1:首页底部推荐',
  `ordernum` mediumint(8) unsigned DEFAULT NULL COMMENT '排序',
  `last_modify` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `disabled` enum('true','false') DEFAULT 'false' COMMENT '失效',
  PRIMARY KEY (`brand_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_ordernum` (`ordernum`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_brand
-- ----------------------------
INSERT INTO `car_b2c_brand` VALUES ('1', '北田', '', '', '/images/brandlogo/1421390775911376404.jpg', '', '1', '1', '1427879205', 'false');
INSERT INTO `car_b2c_brand` VALUES ('2', '河马莉', null, null, '/images/brandlogo/1421390785407012855.jpg', null, '1', '2', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('3', 'edo', null, null, '/images/brandlogo/1421390764542283144.jpg', null, '1', '3', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('4', 'vfoods', null, null, '/images/brandlogo/1421390802893675759.jpg', null, null, '4', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('5', '好丽友', null, null, '/images/brandlogo/1421395686429282494.jpg', null, null, '5', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('6', '博恩', null, null, '/images/brandlogo/1421390830843797375.jpg', null, '1', '6', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('7', '啵乐乐', null, null, '/images/brandlogo/1421395676924627591.jpg', null, '1', '7', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('8', '7D', null, null, '/images/brandlogo/1421395698232338762.jpg', null, '1', '8', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('9', 'woogie', null, null, '/images/brandlogo/1421395711919013944.jpg', null, null, '9', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('10', '不二家', null, null, '/images/brandlogo/1421390842291118520.jpg', null, null, '10', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('11', '三叔公', null, null, '/images/brandlogo/1421395731859611569.jpg', null, null, '11', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('12', '雪之恋', null, null, '/images/brandlogo/1421390858085770937.jpg', null, null, '12', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('13', '布尔本', null, null, '/images/brandlogo/1421390874608220505.jpg', null, null, '13', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('14', '春日井', null, null, '/images/brandlogo/1421395745798956199.jpg', null, '1', '14', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('15', '贝尔', null, null, '/images/brandlogo/1423104329229463876.jpg', null, '1', '15', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('16', '甘栗', null, null, '/images/brandlogo/1419343672136837366.jpg', null, '1', '16', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('17', 'KJ', null, null, '/images/brandlogo/1423104351657228804.jpg', null, null, '17', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('18', 'lotus和情', null, null, '/images/brandlogo/1421395764527438655.jpg', null, null, '17', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('19', '松露', '', '', '/images/brandlogo/1423104368338398047.jpg', '', '1', '50', '1427951520', 'false');
INSERT INTO `car_b2c_brand` VALUES ('20', '可瑞安', null, null, '/images/brandlogo/1419581118113533293.jpg', null, '1', '18', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('21', '豆黄金', null, null, '/images/brandlogo/1421395780780426260.jpg', null, '1', '19', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('22', '特意浓', null, null, '/images/brandlogo/1421395794530632452.jpg', null, null, '20', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('23', '3:15', null, null, '/images/brandlogo/1421395807507323848.jpg', null, null, '21', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('24', '小奶花', null, null, '/images/brandlogo/1421395823580888347.jpg', null, '1', '22', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('25', '果子町', '', '', '/images/brandlogo/1423104392533222199.jpg', '', '1', '50', '1427951524', 'false');
INSERT INTO `car_b2c_brand` VALUES ('26', '海牌', null, null, '/images/brandlogo/1421395850989331324.jpg', null, '1', '23', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('27', 'IVY', null, null, '/images/brandlogo/1419581215478270541.jpg', null, null, '24', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('28', '海太', null, null, '/images/brandlogo/1423104411880687859.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('29', 'AJI', null, null, '/images/brandlogo/1421395863032161175.jpg', null, null, '25', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('30', '黄龙', null, null, '/images/brandlogo/1423104445881438232.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('31', '台湾一番', null, null, '/images/brandlogo/1421395874810580040.jpg', null, null, '26', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('32', '和情', null, null, '/images/brandlogo/1423104460963211835.jpg', null, null, '50', '1428644677', 'true');
INSERT INTO `car_b2c_brand` VALUES ('33', '榴的华', null, null, '/images/brandlogo/1423104471825120564.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('34', '鲜引力', null, null, '/images/brandlogo/1421395890394995803.jpg', null, null, '27', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('35', '大脚板', null, null, '/images/brandlogo/1423104483210608877.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('36', '锦大', null, null, '/images/brandlogo/1421395905588497399.jpg', null, null, '28', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('37', '九日', null, null, '/images/brandlogo/1423104519533965742.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('38', '可拉奥', null, null, '/images/brandlogo/1423104571312177376.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('39', '口口福', null, null, '/images/brandlogo/1421395920147407988.jpg', null, null, '29', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('40', '劳伦兹', null, null, '/images/brandlogo/1423104542893131834.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('41', '宾驰', null, null, '/images/brandlogo/1423104556007815030.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('42', '乐天', null, null, '/images/brandlogo/1423104598413049039.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('43', '元祖', null, null, '/images/brandlogo/1423104585305339633.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('44', 'BANH', null, null, '/images/brandlogo/1423104611522895660.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('45', '鸿茂', null, null, '/images/brandlogo/1423104624341088477.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('46', '露依', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('47', '伦敦卷', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('48', '金菲利', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('49', 'ocean spray', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('50', '新牧哥', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('51', '牧场之朝', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('52', '伊佰', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('53', '倍之味', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('54', '清之坊', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('55', '三立', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('56', 'JIM BEAM', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('57', 'MALIBU', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('58', 'REMY MARTIN VSOP', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('59', '艾槟', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('60', 'ANDIMAR', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('61', 'BACARDI', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('62', '百利', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('63', '百龄坛', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('64', '必得利', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('65', 'X-RATED', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('66', 'BOLS', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('67', '土气和', null, null, '/images/brandlogo/1423118990985557990.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('68', 'NAPOLEON', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('69', 'KAHLUA', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('70', '歌顿', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('71', '格兰威特', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('72', '豪帅', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('73', 'JACK DANIEI\'S', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('74', 'GIENMORANGIE', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('75', 'ABSOLUT', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('76', 'CONNALLY', null, null, '/images/brandlogo/1423104744066704027.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('77', 'KUPFERBERG', null, null, '/images/brandlogo/1423104755476442502.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('78', 'LUBUSKI', null, null, '/images/brandlogo/1423104770521047233.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('79', 'NOOKAMKA', null, null, '/images/brandlogo/1423104781296559811.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('80', 'MARTINI', null, null, '/images/brandlogo/1423104799687552116.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('81', 'BOMBAY', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('82', 'WINDSOR', null, null, '/images/brandlogo/1423104811700058295.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('83', 'CAVICCHIOLI', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('84', '真露', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('85', '芝华士', null, null, '/images/brandlogo/1423104824321826699.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('86', '尊尼获加', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('87', '皇家骑士', null, null, '/images/brandlogo/1423104854265914113.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('88', '1664', null, null, '/images/brandlogo/1423104841756255242.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('89', '凯撒', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('90', 'LEFFE', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('91', '艾丁格', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('92', '健力士', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('93', '爱士堡', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('94', '奥丁格', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('95', 'VEDETT', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('96', '百威', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('97', 'Duvel', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('98', '福佳', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('99', '智美', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('100', '教士', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('101', '科罗娜', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('102', 'LIEFMANS', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('103', '林德曼', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('104', '罗斯福', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('105', '企鹅', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('106', '马杜斯', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('107', '粉象', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('108', '维多利亚', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('109', '维森', null, null, '/images/brandlogo/1421151079079644367.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('110', '都统', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('111', '康斯', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('112', '拉菲蒙黛儿', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('113', '拉格德克', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('114', '劳伦杰特', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('115', '特拉', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('116', '天使之爱', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('117', '乡都', null, null, '/images/brandlogo/1421151517434501499.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('118', 'LEE南益', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('119', '香记', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('120', 'AIJ', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('121', '金世尊2', null, null, '/images/brandlogo/1423118599643188393.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('122', '金世尊3', null, null, '/images/brandlogo/1423118609642493760.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('123', '金世尊4', null, null, '/images/brandlogo/1423118617818885601.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('124', '金世尊5', null, null, '/images/brandlogo/1423118628236109100.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('125', '金世尊6', null, null, '/images/brandlogo/1423118644083949809.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('126', '金世尊7', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('127', '金世尊8', null, null, '/images/brandlogo/1423118654103916780.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('128', '金世尊9', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('129', '金世尊10', null, null, '/images/brandlogo/1423118665853330045.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('130', '金世尊', null, null, '/images/brandlogo/1423118676236123139.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('131', '金世尊1', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('132', '金世尊11', null, null, '/images/brandlogo/', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('133', '土气和1', null, null, '/images/brandlogo/1423118840539745019.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('134', '土气和2', null, null, '/images/brandlogo/1423118910622390248.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('135', '土气和3', null, null, '/images/brandlogo/1423118852361389704.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('136', '土气和4', null, null, '/images/brandlogo/1423118921760935047.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('137', '土气和09', null, null, '/images/brandlogo/1423118879935836624.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('138', '土气和6', null, null, '/images/brandlogo/1423118932063812737.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('139', '土气和7', null, null, '/images/brandlogo/1423118897367226084.jpg', null, null, '50', null, 'false');
INSERT INTO `car_b2c_brand` VALUES ('140', '土气和8', null, null, '/images/brandlogo/1423118943224544908.jpg', null, null, '50', null, 'false');

-- ----------------------------
-- Table structure for car_b2c_cart
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_cart`;
CREATE TABLE `car_b2c_cart` (
  `cart_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `member_ident` varchar(50) NOT NULL COMMENT '会员ident',
  `params` longtext NOT NULL COMMENT '购物车对象参数',
  PRIMARY KEY (`cart_id`,`member_ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_cart
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_cart_objects
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_cart_objects`;
CREATE TABLE `car_b2c_cart_objects` (
  `obj_ident` varchar(255) NOT NULL COMMENT '对象ident',
  `member_ident` varchar(50) NOT NULL COMMENT '会员ident,会员信息和serssion生成的唯一值',
  `member_id` int(8) NOT NULL DEFAULT '-1' COMMENT '会员 id',
  `obj_type` varchar(20) NOT NULL COMMENT '购物车对象类型',
  `params` longtext NOT NULL COMMENT '购物车对象参数',
  `quantity` float unsigned NOT NULL COMMENT '数量',
  `time` int(10) unsigned DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`obj_ident`,`member_ident`,`member_id`),
  KEY `ind_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_cart_objects
-- ----------------------------
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_10_16', '1ff1de774005f8da13f42943881c655f', '24', 'goods', 'a:4:{s:8:\"goods_id\";s:2:\"10\";s:10:\"product_id\";s:2:\"16\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1429065141');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_10_16', '3c59dc048e8850243be8079a5c74d079', '21', 'goods', 'a:4:{s:8:\"goods_id\";s:2:\"10\";s:10:\"product_id\";s:2:\"16\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1429001903');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_10_16', 'c20ad4d76fe97759aa27a0c99bff6710', '12', 'goods', 'a:4:{s:8:\"goods_id\";s:2:\"10\";s:10:\"product_id\";s:2:\"16\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1428911151');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_10_17', '4e732ced3463d06de0ca9a15b6153677', '26', 'goods', 'a:4:{s:8:\"goods_id\";s:2:\"10\";s:10:\"product_id\";s:2:\"17\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '0', '1429070969');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_4_10', 'aab3238922bcc25a6f606eb525ffdc56', '14', 'goods', 'a:4:{s:8:\"goods_id\";s:1:\"4\";s:10:\"product_id\";s:2:\"10\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1428978278');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_6_12', '70efdf2ec9b086079795c442636b55fb', '17', 'goods', 'a:4:{s:8:\"goods_id\";s:1:\"6\";s:10:\"product_id\";s:2:\"12\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1428983426');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_6_12', '98f13708210194c475687be6106a3b84', '20', 'goods', 'a:4:{s:8:\"goods_id\";s:1:\"6\";s:10:\"product_id\";s:2:\"12\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1429001670');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_8_14', 'aab3238922bcc25a6f606eb525ffdc56', '14', 'goods', 'a:4:{s:8:\"goods_id\";s:1:\"8\";s:10:\"product_id\";s:2:\"14\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1428978273');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_8_14', 'c20ad4d76fe97759aa27a0c99bff6710', '12', 'goods', 'a:4:{s:8:\"goods_id\";s:1:\"8\";s:10:\"product_id\";s:2:\"14\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1428911198');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_8_14', 'd3d9446802a44259755d38e6d163e820', '10', 'goods', 'a:4:{s:8:\"goods_id\";s:1:\"8\";s:10:\"product_id\";s:2:\"14\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1428886217');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_9_15', '6512bd43d9caa6e02c990b0a82652dca', '11', 'goods', 'a:4:{s:8:\"goods_id\";s:1:\"9\";s:10:\"product_id\";s:2:\"15\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '12', '1428900308');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_9_15', 'b6d767d2f8ed5d21a44b0e5886680cb9', '22', 'goods', 'a:4:{s:8:\"goods_id\";s:1:\"9\";s:10:\"product_id\";s:2:\"15\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1429012071');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_9_15', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'goods', 'a:4:{s:8:\"goods_id\";s:1:\"9\";s:10:\"product_id\";s:2:\"15\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1428851801');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_9_15', 'c74d97b01eae257e44aa9d5bade97baf', '16', 'goods', 'a:4:{s:8:\"goods_id\";s:1:\"9\";s:10:\"product_id\";s:2:\"15\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1428980299');
INSERT INTO `car_b2c_cart_objects` VALUES ('goods_9_15', 'c9f0f895fb98ab9159f51fd0297e236d', '8', 'goods', 'a:4:{s:8:\"goods_id\";s:1:\"9\";s:10:\"product_id\";s:2:\"15\";s:7:\"adjunct\";a:0:{}s:14:\"extends_params\";s:0:\"\";}', '1', '1428800602');

-- ----------------------------
-- Table structure for car_b2c_cms_article
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_cms_article`;
CREATE TABLE `car_b2c_cms_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `keywords` varchar(120) DEFAULT NULL,
  `description` text,
  `content` text,
  `copyfrom` varchar(100) DEFAULT NULL,
  `fromlink` varchar(200) DEFAULT NULL,
  `thumb` varchar(100) DEFAULT NULL,
  `color` char(7) DEFAULT NULL,
  `isbold` tinyint(1) unsigned DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL,
  `recommends` varchar(30) DEFAULT NULL COMMENT '1:置顶',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `realhits` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned DEFAULT '0',
  `updatetime` int(10) unsigned DEFAULT '0',
  `puttime` int(10) unsigned DEFAULT '0',
  `tpl` varchar(20) DEFAULT NULL,
  `listorder` int(10) unsigned DEFAULT '99',
  `disabled` enum('false','true') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `recommend` (`recommends`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_cms_article
-- ----------------------------
INSERT INTO `car_b2c_cms_article` VALUES ('1', '2', '对方是否', '0', null, 'fdsafd', 'fdsafsa', null, null, '/images/20150413/a51c896c9cb81ecb5a199d51ac9fc3c5_2015_04_13_172732.jpg', null, '0', null, null, '0', '0', '1428917272', '1428917984', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('2', '2', 'fdsa', '0', null, 'fsafd', 'fdsafdsa', null, null, '/images/20150413/fc79250f8c5b804390e8da280b4cf06e_2015_04_13_173136.jpg', null, '0', null, null, '0', '0', '1428917499', '1428918211', '0', null, '99', 'true');
INSERT INTO `car_b2c_cms_article` VALUES ('3', '0', '对方是否', '0', null, 'f\'d\'sa\'fa', '范德萨范德萨', null, null, '/images/20150413/86b48b560a92d18429bcfca2c70ee733_2015_04_13_174201.jpg', null, '0', null, null, '0', '0', '1428918127', '1428918207', '0', null, '99', 'true');
INSERT INTO `car_b2c_cms_article` VALUES ('4', '3', '343535', '0', null, '43553', '34535555', null, null, '/images/20150414/8cc0225cb9ed2421038a1325a46c562a_2015_04_14_114508.jpg', null, '0', null, null, '0', '0', '1428983124', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('5', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983152', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('6', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983152', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('7', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983152', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('8', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983152', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('9', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983153', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('10', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983153', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('11', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983153', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('12', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983153', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('13', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983153', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('14', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983153', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('15', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983154', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('16', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983154', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('17', '2', '4533', '0', null, '345', '                        35554                    ', null, null, null, null, '0', null, null, '0', '0', '1428983154', '1428999142', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('18', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983154', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('19', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983154', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('20', '2', '4533', '0', null, '345', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983155', '0', '0', null, '99', 'false');
INSERT INTO `car_b2c_cms_article` VALUES ('21', '2', '4533', '0', null, '345m', '35554', null, null, null, null, '0', null, null, '0', '0', '1428983155', '1429078296', '0', null, '99', 'false');

-- ----------------------------
-- Table structure for car_b2c_cms_category
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_cms_category`;
CREATE TABLE `car_b2c_cms_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `name` varchar(20) NOT NULL COMMENT '分类名',
  `title` varchar(100) DEFAULT NULL COMMENT '分类标题',
  `keywords` varchar(100) DEFAULT NULL COMMENT '分类关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `dir` varchar(100) DEFAULT NULL COMMENT '栏目目录',
  `model` varchar(20) NOT NULL COMMENT '模型',
  `thumb` varchar(100) DEFAULT NULL,
  `content` text,
  `pagesize` tinyint(4) unsigned NOT NULL DEFAULT '15',
  `listorder` tinyint(4) unsigned NOT NULL DEFAULT '99',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `disabled` enum('false','true') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`),
  KEY `lang` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_cms_category
-- ----------------------------
INSERT INTO `car_b2c_cms_category` VALUES ('1', '0', '测试栏目', null, null, null, 'test', 'article', null, '第三方', '15', '99', '1428901654', '1428916698', 'true');
INSERT INTO `car_b2c_cms_category` VALUES ('2', '0', '购物保障', null, null, null, 'gwbz', 'page', null, '<iframe src=\"http://shop.feipin0512.com/themes/ace/kindeditor-4.1.10/plugins/baidumap/index.html?center=121.487899%2C31.249162&zoom=11&width=558&height=360&markers=121.487899%2C31.249162&markerStyles=l%2CA\" frameborder=\"0\" style=\"width:560px;height:362px;\">\r\n</iframe>', '15', '99', '1428913338', '1429087231', 'true');
INSERT INTO `car_b2c_cms_category` VALUES ('3', '2', '购物指南', null, null, null, 'gwzn', 'page', null, '<div class=\"helpRightTitle\" style=\"color:#333333;font-size:18px;font-family:微软雅黑, 黑体;font-weight:bold;background-color:#F6F6F6;\">\r\n	购物指南\r\n</div>\r\n<div class=\"helpcontent\" style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<div class=\"newcontent\">\r\n		<span style=\"color:#808080;\"><span style=\"font-size:x-small;\">（1）“用户注册”——填写用户名、邮箱等个人详情，注册也可以在【查找商品】或【加入购物车】后进行。<br />\r\n（2）“查找商品”——直接在首页顶部搜索栏内输入商品关键字进行搜索，也可使用首页导航栏按分类进行搜索。<br />\r\n（3）“立即购买”“加入购物车”——在商品展示页面内点击加入购物车或将收藏夹内商品加入购物车，一次可添加多种商品，如有商品有赠品，也请一并放入购物车。<br />\r\n（4）“确认订单”——填写收货地址、收货人信息、确认付款，确认订单内商品、金额信息，确认总额。<br />\r\n（5）“提交订单”——保存确认订单内填写的每一项内容后点击【提交订单】，确认完毕后进入付款流程。<br />\r\n（6）“付款”——在线付款方式请使用网银、支付宝等方式支付。<br />\r\n（7）“售后服务”——商品咨询、问题联系、退换货、售后服务等请联系我司客服。客服专线：4000 517 988</span></span> \r\n	</div>\r\n</div>', '15', '99', '1428918437', '1429078242', 'true');
INSERT INTO `car_b2c_cms_category` VALUES ('4', '2', '退换货政策', null, null, null, 'thhzc', 'page', null, '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:x-small;\">退换货规则<br />\r\n1、为保障您的权益，请您收到货物后即与配送人员当面核对商品的种类、数量、规格、赠品、金额、保质期等是否正确，确认无误后再进行签收。在特殊情况下，您委托他人签收的行为视同于您本人已对商品进行签收。您对商品进&nbsp;&nbsp; 行签收后，百地小食将不再接受以上问题的投诉。如有任何问题，请致电：<span style=\"color:#FF0000;\">4000 517 988</span>，客服人员会及时为您处理。谢谢配合！<br />\r\n1) 如商品包装破损，请当面及时向配送人员提出，以便我们能尽快的为您处理。<br />\r\n2) 对于商品数量缺失的情况，我们只受理当场投诉，即货物配送到家后，客户当面清点货物数量并及时向配送员提出的投诉。一旦签收，我们将不受理此退换要求。<br />\r\n3) 图片及信息仅供参照，商品将以实物为准。因拍摄灯光及不同显示器色差等问题可能造成商品图片与实物有一定色差，不属质量问题。</span>\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:x-small;\">&nbsp;</span>\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:x-small;\">2、为保证食品安全，请顾客在签收此类商品时仔细查验，当场开箱验收。若商品存在外包装破损、缺少、变质等问题&nbsp;&nbsp; ，应在快递单据上注明，并立即与百地小食客服联系。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;食品类商品(除生鲜、易腐商品)，如不影响二次销售，支持自签收商品七日内无理由退货，并非百地小食原因或并非商品本身质量原因引发的退货，由此产生的运送服务费将由客户自行承担，百地小食退款时将扣除10元运送服务费成本。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经合法食品检验机构检验，确属于不符合食品安全标准的食品，予以退换货。&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对国家质量监督检验检疫总局公告的存在质量问题的食品，予以退货。</span>\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:x-small;\"><br />\r\n&nbsp;3、寄还地址<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：上海市浦东新区松林路111号<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 邮编：200122<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 收货人：百地小食</span>\r\n</p>', '15', '99', '1428920021', '1429078246', 'true');
INSERT INTO `car_b2c_cms_category` VALUES ('5', '2', 'aaaaaaa', null, null, null, 'aaa', 'article', null, '', '15', '99', '1428999080', '1429078252', 'false');

-- ----------------------------
-- Table structure for car_b2c_comment_goods_point
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_comment_goods_point`;
CREATE TABLE `car_b2c_comment_goods_point` (
  `point_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_point` decimal(2,1) DEFAULT NULL COMMENT '分数',
  `comment_id` mediumint(8) unsigned DEFAULT NULL COMMENT '评论ID',
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型',
  `member_id` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `display` enum('false','true') DEFAULT 'false' COMMENT '前台是否显示',
  `addon` longtext COMMENT '额外序列化信息',
  `disabled` enum('false','true') DEFAULT 'false',
  PRIMARY KEY (`point_id`),
  KEY `ind_point_avg` (`goods_id`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_comment_goods_point
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_comment_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_comment_goods_type`;
CREATE TABLE `car_b2c_comment_goods_type` (
  `type_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '评论类型名称',
  `addon` longtext COMMENT '序列化',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_comment_goods_type
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_delivery
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_delivery`;
CREATE TABLE `car_b2c_delivery` (
  `delivery_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '配送流水号',
  `order_id` varchar(100) DEFAULT NULL COMMENT '订单号',
  `delivery_bn` varchar(32) DEFAULT NULL COMMENT '配送流水号',
  `member_id` mediumint(8) unsigned DEFAULT NULL COMMENT '订货会员ID',
  `money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '配送费用',
  `is_protect` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '是否保价',
  `delivery` mediumint(8) unsigned DEFAULT NULL COMMENT '配送方式(货到付款、EMS...)',
  `logi_id` varchar(50) DEFAULT NULL COMMENT '物流公司ID',
  `logi_name` varchar(100) DEFAULT NULL COMMENT '物流公司名称',
  `logi_no` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `ship_name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `ship_area` varchar(255) DEFAULT NULL COMMENT '收货人地区',
  `ship_addr` text COMMENT '收货人地址',
  `ship_zip` varchar(20) DEFAULT NULL COMMENT '收货人邮编',
  `ship_tel` varchar(50) DEFAULT NULL COMMENT '收货人电话',
  `ship_mobile` varchar(50) DEFAULT NULL COMMENT '收货人手机',
  `ship_email` varchar(200) DEFAULT NULL COMMENT '收货人Email',
  `t_begin` int(10) unsigned DEFAULT NULL COMMENT '单据生成时间',
  `t_send` int(10) unsigned DEFAULT NULL COMMENT '单据结束时间',
  `t_confirm` int(10) unsigned DEFAULT NULL COMMENT '单据确认时间',
  `op_name` varchar(50) DEFAULT NULL COMMENT '操作者',
  `status` enum('succ','failed','cancel','lost','progress','timeout','ready') NOT NULL DEFAULT 'ready' COMMENT '状态',
  `memo` longtext COMMENT '备注',
  `disabled` enum('true','false') DEFAULT 'false' COMMENT '无效',
  PRIMARY KEY (`delivery_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_logi_no` (`logi_no`)
) ENGINE=InnoDB AUTO_INCREMENT=142906468510054485 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_delivery
-- ----------------------------
INSERT INTO `car_b2c_delivery` VALUES ('142876738456515055', '2015041148995452', null, '1', '10.000', 'false', '1', '3', '圆通速递', '123456789', '54354334', 'mainland:上海/上海市/卢湾区:24', '上海上海市卢湾区rwerew', '53543', '53543', '5323454343', null, '1428767384', '1428767384', '1428767384', 'admin', 'succ', '已发货，请检查状态', 'false');
INSERT INTO `car_b2c_delivery` VALUES ('142881657299535610', '2015041150991015', null, '1', '10.000', 'false', '1', '1', '中国邮政EMS', '123456789', '54354334', 'mainland:上海/上海市/卢湾区:24', '上海上海市卢湾区rwerew', '53543', '53543', '5323454343', null, '1428816572', '1428816572', '1428816572', 'admin', 'succ', null, 'false');
INSERT INTO `car_b2c_delivery` VALUES ('142883947450489957', '2015041250499948', null, '1', '10.000', 'false', '2', '34', '大田', '0000', '543', 'mainland:重庆/重庆市/江北区:68', '重庆重庆市渝中区53443', '53543', '53543', '34543543', null, '1428839474', '1428839474', '1428839474', 'admin', 'succ', null, 'false');
INSERT INTO `car_b2c_delivery` VALUES ('142891091652575253', '2015041298561005', null, '1', '10.000', 'false', '1', '1', '中国邮政EMS', '23234', '543', 'mainland:重庆/重庆市/渝中区:66', '重庆重庆市渝中区53443', '53543', '53543', '34543543', null, '1428910916', '1428910916', '1428910916', 'admin', 'succ', null, 'false');
INSERT INTO `car_b2c_delivery` VALUES ('142900310953555552', '2015041250519757', null, '1', '10.000', 'false', '1', '1', '中国邮政EMS', '2342342', '543', 'mainland:重庆/重庆市/渝中区:66', '重庆重庆市渝中区53443', '53543', '53543', '34543543', null, '1429003109', '1429003109', '1429003109', 'admin', 'succ', null, 'false');
INSERT INTO `car_b2c_delivery` VALUES ('142906468510054484', '2015041452985250', null, '13', '10.000', 'false', '1', '1', '中国邮政EMS', '13214', 'ert', 'mainland:北京/北京市/西城区:4', '北京北京市西城区ertert', 'ert', 'ert', 'ert', null, '1429064685', '1429064685', '1429064685', 'admin', 'succ', null, 'false');

-- ----------------------------
-- Table structure for car_b2c_delivery_items
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_delivery_items`;
CREATE TABLE `car_b2c_delivery_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `delivery_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发货单号',
  `order_item_id` mediumint(8) unsigned DEFAULT '0' COMMENT '发货明细订单号',
  `item_type` enum('goods','gift','pkg','adjunct') NOT NULL DEFAULT 'goods' COMMENT '商品类型',
  `product_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '货品ID',
  `product_bn` varchar(30) DEFAULT NULL COMMENT '货品号',
  `product_name` varchar(200) DEFAULT NULL COMMENT '货品名称',
  `number` float NOT NULL DEFAULT '0' COMMENT '发货数量',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_delivery_items
-- ----------------------------
INSERT INTO `car_b2c_delivery_items` VALUES ('1', '142876738456515055', '16777215', 'goods', '15', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '1');

-- ----------------------------
-- Table structure for car_b2c_dlycorp
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_dlycorp`;
CREATE TABLE `car_b2c_dlycorp` (
  `corp_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '物流公司ID',
  `type` varchar(6) DEFAULT NULL COMMENT '类型',
  `corp_code` varchar(200) DEFAULT NULL COMMENT '物流公司代码',
  `name` varchar(200) DEFAULT NULL COMMENT '物流公司',
  `disabled` enum('true','false') DEFAULT 'false' COMMENT '失效',
  `ordernum` smallint(4) unsigned DEFAULT NULL COMMENT '排序',
  `website` varchar(200) DEFAULT NULL COMMENT '物流公司网址',
  `request_url` varchar(200) DEFAULT NULL COMMENT '查询接口网址',
  PRIMARY KEY (`corp_id`),
  KEY `ind_type` (`type`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_ordernum` (`ordernum`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_dlycorp
-- ----------------------------
INSERT INTO `car_b2c_dlycorp` VALUES ('1', null, 'EMS', '中国邮政EMS', 'false', '1', 'http://www.ems.com.cn/', 'http://www.ems.com.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('2', null, 'STO', '申通快递', 'false', '2', 'http://www.sto.cn/', 'http://www.sto.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('3', null, 'YTO', '圆通速递', 'false', '3', 'http://www.yto.net.cn/', 'http://www.yto.net.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('4', null, 'SF', '顺丰速运', 'false', '4', 'http://www.sf-express.com/', 'http://www.sf-express.com/');
INSERT INTO `car_b2c_dlycorp` VALUES ('5', null, 'YUNDA', '韵达快递', 'false', '5', 'http://www.yundaex.com/', 'http://www.yundaex.com/');
INSERT INTO `car_b2c_dlycorp` VALUES ('14', null, 'ZTO', '中通速递', 'false', '6', 'http://www.zto.cn/', 'http://www.zto.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('15', null, 'ZJS', '宅急送', 'false', '7', 'http://www.zjs.com.cn/', 'http://www.zjs.com.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('16', null, 'TTKDEX', '天天快递', 'false', '8', 'http://www.ttkd.cn/', 'http://www.ttkd.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('18', null, 'LBEX', '龙邦快递', 'false', '9', 'http://www.lbex.com.cn/', 'http://www.lbex.com.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('19', null, 'APEX', '全一快递', 'false', '10', 'http://www.apex100.com/', 'http://www.apex100.com/');
INSERT INTO `car_b2c_dlycorp` VALUES ('20', null, 'HTKY', '汇通速递', 'false', '11', 'http://www.htky365.com/', 'http://www.htky365.com/');
INSERT INTO `car_b2c_dlycorp` VALUES ('21', null, 'CNMH', '民航快递', 'false', '12', 'http://www.cae.com.cn/', 'http://www.cae.com.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('22', null, 'AIRFEX', '亚风速递', 'false', '13', 'http://www.airfex.cn/', 'http://www.airfex.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('23', null, 'CNKJ', '快捷速递', 'false', '14', 'http://www.fastexpress.com.cn/', 'http://www.fastexpress.com.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('24', null, 'DDS', 'DDS快递', 'false', '15', 'http://www.qc-dds.net/', 'http://www.qc-dds.net/');
INSERT INTO `car_b2c_dlycorp` VALUES ('25', null, 'HOAU', '华宇物流', 'false', '16', 'http://www.hoau.net/', 'http://www.hoau.net/');
INSERT INTO `car_b2c_dlycorp` VALUES ('26', null, 'CRE', '中铁快运', 'false', '17', 'http://www.cre.cn/', 'http://www.cre.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('27', null, 'FedEx', 'FedEx', 'false', '17', 'http://www.fedex.com/cn/', 'http://www.fedex.com/cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('28', null, 'UPS', 'UPS', 'false', '18', 'http://www.ups.com/', 'http://www.ups.com/');
INSERT INTO `car_b2c_dlycorp` VALUES ('29', null, 'DHL', 'DHL', 'false', '20', 'http://www.cn.dhl.com/', 'http://www.cn.dhl.com/');
INSERT INTO `car_b2c_dlycorp` VALUES ('30', null, 'CYEXP', '长宇', 'false', '20', 'http://www.cyexp.com/', 'http://www.cyexp.com/');
INSERT INTO `car_b2c_dlycorp` VALUES ('31', null, 'DBL', '德邦物流', 'false', '20', 'http://www.deppon.com/', 'http://www.deppon.com/');
INSERT INTO `car_b2c_dlycorp` VALUES ('32', null, 'POST', 'POST', 'false', '20', 'http://www.183yf.cn/', 'http://www.183yf.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('33', null, 'CCES', 'CCES', 'false', '20', 'http://www.cces.com.cn/', 'http://www.cces.com.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('34', null, 'DTW', '大田', 'false', '20', 'http://www.dtw.com.cn/', 'http://www.dtw.com.cn/');
INSERT INTO `car_b2c_dlycorp` VALUES ('35', null, 'ANTO', '安得', 'false', '20', 'http://www.annto.com/', 'http://www.annto.com/');

-- ----------------------------
-- Table structure for car_b2c_dlytype
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_dlytype`;
CREATE TABLE `car_b2c_dlytype` (
  `dt_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '配送ID',
  `dt_name` varchar(50) DEFAULT NULL COMMENT '配送方式',
  `has_cod` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '货到付款',
  `firstunit` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '首重',
  `continueunit` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '续重',
  `is_threshold` enum('0','1') DEFAULT '0' COMMENT '临界值',
  `threshold` longtext COMMENT '临界值配置参数',
  `protect` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '物流保价',
  `protect_rate` float(6,3) DEFAULT NULL COMMENT '报价费率',
  `minprice` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '保价费最低值',
  `setting` enum('0','1') DEFAULT '1' COMMENT '地区费用类型',
  `def_area_fee` enum('true','false') DEFAULT 'false' COMMENT '按地区设置配送费用时,是否启用默认配送费用',
  `firstprice` float(10,2) DEFAULT '0.00' COMMENT '首重费用',
  `continueprice` float(10,2) DEFAULT '0.00' COMMENT '续重费用',
  `dt_discount` float(10,2) DEFAULT '0.00' COMMENT '折扣值',
  `dt_expressions` longtext COMMENT '配送费用计算表达式',
  `dt_useexp` enum('true','false') DEFAULT 'false' COMMENT '是否使用公式',
  `corp_id` mediumint(8) unsigned DEFAULT NULL COMMENT '物流公司ID',
  `dt_status` enum('0','1') DEFAULT '1' COMMENT '是否开启',
  `detail` longtext COMMENT '详细描述',
  `area_fee_conf` longtext COMMENT '指定地区配置的一系列参数',
  `ordernum` smallint(4) DEFAULT '0' COMMENT '排序',
  `disabled` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`dt_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_dlytype
-- ----------------------------
INSERT INTO `car_b2c_dlytype` VALUES ('1', '普通快递', 'false', '1000', '0', '0', '', 'false', null, '0.00', '0', 'false', '10.00', '0.00', '1.00', '', 'false', null, '', '', '', '50', 'false');
INSERT INTO `car_b2c_dlytype` VALUES ('2', '货到付款', 'true', '1000', '0', '0', null, 'false', null, '0.00', '1', 'false', '15.00', null, '1.00', '', 'false', null, '0', '', null, '50', 'false');

-- ----------------------------
-- Table structure for car_b2c_goods
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_goods`;
CREATE TABLE `car_b2c_goods` (
  `goods_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `bn` varchar(200) DEFAULT NULL COMMENT '商品编号',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `type_id` mediumint(8) unsigned DEFAULT NULL COMMENT '类型',
  `cat_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `brand_id` mediumint(8) unsigned DEFAULT NULL COMMENT '品牌',
  `store` mediumint(8) unsigned DEFAULT '0' COMMENT '库存',
  `price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '销售价',
  `cost` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '成本价',
  `mktprice` decimal(20,3) DEFAULT NULL COMMENT '市场价',
  `weight` decimal(20,3) DEFAULT NULL COMMENT '重量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `goods_type` enum('normal','bind','gift') NOT NULL DEFAULT 'normal' COMMENT '销售类型',
  `image_default_id` varchar(32) DEFAULT NULL COMMENT '默认图片',
  `brief` varchar(255) DEFAULT NULL COMMENT '商品简介',
  `intro` longtext COMMENT '详细介绍',
  `goods_setting` longtext COMMENT '商品设置',
  `is_spec` enum('false','true') DEFAULT 'false' COMMENT '是否存在规格',
  `is_props` enum('false','true') DEFAULT NULL COMMENT '是否存在扩展属性',
  `spec_desc` longtext COMMENT '货品规格序列化',
  `params` longtext COMMENT '商品规格序列化',
  `marketable` enum('true','false') NOT NULL DEFAULT 'true' COMMENT '上架',
  `p_order` mediumint(8) unsigned NOT NULL DEFAULT '30' COMMENT '排序',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '上架时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `disabled` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `uni_bn` (`bn`),
  KEY `ind_frontend` (`disabled`,`goods_type`,`marketable`),
  KEY `idx_goods_type` (`goods_type`),
  KEY `idx_goods_type_d_order` (`goods_type`),
  KEY `idx_marketable` (`marketable`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_goods
-- ----------------------------
INSERT INTO `car_b2c_goods` VALUES ('1', '20150402001', '德国进口牛奶 欧德堡全脂牛奶1L装', null, '9', '1', null, '25.000', '15.000', '28.000', '14.000', '瓶', 'normal', '61af9737273eec0a61966903ddf42333', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/1.jpg\" width=\"749\" height=\"458\" alt=\"\" />&nbsp;\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/3.jpg\" width=\"749\" height=\"382\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/2.jpg\" width=\"749\" height=\"498\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/4.jpg\" width=\"749\" height=\"439\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/6.jpg\" width=\"749\" height=\"549\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/5.jpg\" width=\"749\" height=\"477\" alt=\"\" />\r\n</p>', null, 'false', 'false', null, null, 'true', '30', null, '1427956720', 'false');
INSERT INTO `car_b2c_goods` VALUES ('2', '20150402002', 'yum earth棒棒糖', null, '4', '38', '300', '15.000', '10.000', '25.000', '15.000', '瓶', 'normal', 'd99cc9f16e879ba093b38b7151cdfb2e', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '', null, 'false', null, null, null, 'true', '30', null, '1427956899', 'false');
INSERT INTO `car_b2c_goods` VALUES ('3', '20150402003', '法国进口 皮埃尔虞埃 昂日地区半干型苹果酒750ml', null, '14', '1', '200', '129.000', '100.000', '140.000', '1350.000', '瓶', 'normal', '4a741c5ab9b43ab073d755918cf5c5ad', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/piaieryuaipingguojiu/1.jpg\" width=\"800\" height=\"800\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/piaieryuaipingguojiu/2.jpg\" width=\"750\" height=\"653\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/piaieryuaipingguojiu/3.jpg\" width=\"750\" height=\"125\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/piaieryuaipingguojiu/4.jpg\" width=\"750\" height=\"499\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/piaieryuaipingguojiu/5.jpg\" width=\"750\" height=\"502\" alt=\"\" />\r\n</p>', null, 'false', null, null, null, 'true', '30', null, '1427979015', 'false');
INSERT INTO `car_b2c_goods` VALUES ('4', '20150402004', '法国进口 科瑞萨干型苹果酒750ml', null, '14', '1', '200', '109.000', '90.000', '120.000', '1350.000', '瓶', 'normal', 'e2c39579d7451f2b83fd594e63a0b15b', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/7.jpg\" width=\"800\" height=\"800\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/1.jpg\" width=\"750\" height=\"653\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/2.jpg\" width=\"750\" height=\"125\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/3.jpg\" width=\"800\" height=\"800\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/4.jpg\" width=\"750\" height=\"499\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/5.jpg\" width=\"750\" height=\"499\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/6.jpg\" width=\"750\" height=\"499\" alt=\"\" />\r\n</p>', null, 'false', null, null, null, 'true', '30', null, '1427979153', 'false');
INSERT INTO `car_b2c_goods` VALUES ('5', '20150402005', '牙买加进口 摩根船长朗姆酒 700ml', null, '14', '1', '200', '150.000', '120.000', '180.000', '1200.000', '瓶', 'normal', '783f94af1c031ac26e3d8836ba19e397', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<img alt=\"\" width=\"790\" height=\"2500\" src=\"http://www.baidi77.com/images/upload/Image/CAPTAIN%20MORGAN/100.jpg\" />', null, 'false', null, null, null, 'true', '30', null, '1427979308', 'false');
INSERT INTO `car_b2c_goods` VALUES ('6', '20150402006', '土气和 绿色食品 五谷杂粮 莲子 280g', null, '16', '1', '1000', '20.000', '15.000', '25.000', '350.000', '袋', 'normal', '4e2711c1d6e2b3780e997587047926c6', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '', null, 'false', null, null, null, 'true', '30', null, '1427979414', 'false');
INSERT INTO `car_b2c_goods` VALUES ('7', '20150402007看', '进口柠檬5粒装进口柠檬5粒装进口柠檬5粒装', null, '22', '1', '200', '16.900', '12.000', '20.000', '400.000', '个', 'normal', '9b86c5197e97ca3020f74e979ac39792', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img alt=\"\" src=\"http://www.baidi77.com/images/upload/Image/ningmeng/2(1).jpg\" style=\"width:969px;height:597px;\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img width=\"970\" height=\"633\" alt=\"\" src=\"http://www.baidi77.com/images/upload/Image/ningmeng/1(1).jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img alt=\"\" src=\"http://www.baidi77.com/images/upload/Image/ningmeng/4.jpg\" style=\"width:968px;height:608px;\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img alt=\"\" src=\"http://www.baidi77.com/images/upload/Image/ningmeng/8821914_195210692117_2.jpg\" style=\"width:931px;height:565px;\" /> \r\n</p>', null, 'false', 'false', null, null, 'true', '30', null, '1428906229', 'false');
INSERT INTO `car_b2c_goods` VALUES ('8', '20150402008', '精品赣南橙子3粒装（单粒230g以上）', null, '22', '1', '200', '15.900', '20.000', '77878.000', '750.000', '克', 'normal', '3c4dbe88f59e9d6f3c8e049e63cb67fc', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<img alt=\"\" src=\"/images/20150412/2015041219571112536.png\" />', null, 'false', 'false', null, null, 'true', '30', null, '1429079377', 'false');
INSERT INTO `car_b2c_goods` VALUES ('9', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', null, '22', '5', '198', '147.000', '100.000', '180.000', '1500.000', '克', 'normal', '6e3f795c9a8edb93dc6ce383697f57b2', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img alt=\"\" width=\"772\" height=\"600\" src=\"http://www.baidi77.com/images/upload/Image/mihoutao/1.jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img alt=\"\" width=\"600\" height=\"829\" src=\"http://www.baidi77.com/images/upload/Image/mihoutao/4.jpg\" /> \r\n</p>', null, 'false', 'false', null, null, 'true', '30', null, '1429069492', 'false');
INSERT INTO `car_b2c_goods` VALUES ('10', '2015040201d0', '德国进口食品 劳仑兹薯片 清新咸味', '2', '18', null, '197', '16.600', '10.000', '18.000', '150.000', '袋', 'normal', 'ccaa2e67fe4c9dd2903424ca35018605', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>', null, 'true', 'true', null, null, 'true', '30', null, '1429081361', 'false');

-- ----------------------------
-- Table structure for car_b2c_goods_cat
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_goods_cat`;
CREATE TABLE `car_b2c_goods_cat` (
  `cat_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` mediumint(8) unsigned DEFAULT NULL COMMENT '分类ID',
  `cat_path` varchar(100) DEFAULT ',' COMMENT '分类路径(从根至本结点的路径,逗号分隔,首部有逗号)',
  `is_leaf` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '是否叶子结点（true：是；false：否）',
  `type_id` mediumint(9) DEFAULT NULL COMMENT '类型序号',
  `cat_name` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `gallery_setting` longtext COMMENT '商品分类设置',
  `disabled` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '是否屏蔽（true：是；false：否）',
  `p_order` mediumint(8) unsigned DEFAULT '0' COMMENT '排序',
  `goods_count` mediumint(8) unsigned DEFAULT NULL COMMENT '商品数',
  `tabs` longtext COMMENT '子视图',
  `finder` longtext COMMENT '渐进式筛选容器',
  `addon` longtext COMMENT '附加项',
  `child_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '子类别数量',
  `last_modify` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `img_url` varchar(256) DEFAULT NULL COMMENT '图片url',
  PRIMARY KEY (`cat_id`),
  KEY `ind_cat_path` (`cat_path`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_last_modify` (`last_modify`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_goods_cat
-- ----------------------------
INSERT INTO `car_b2c_goods_cat` VALUES ('1', '0', ',', 'false', null, '进口食品', null, 'false', '99', null, null, null, null, '0', '1428836808', null);
INSERT INTO `car_b2c_goods_cat` VALUES ('2', '2', ',1,8,2,', 'false', null, '饮料/水', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('3', '1', ',1,', 'false', null, '蜜饯果干', null, 'false', '99', null, null, null, null, '0', '1428717276', '');
INSERT INTO `car_b2c_goods_cat` VALUES ('4', '14', ',11,14,', 'false', null, '糖果/巧克力', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('5', '1', ',1,', 'false', null, '膨化食品', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('6', '1', ',1,', 'false', null, '肉类/豆干制品零食1', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('7', '1', ',1,', 'false', null, '糖果', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('8', '1', ',1,', 'false', null, ' 饼干糕点', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('9', '1', ',1,', 'false', null, '牛奶乳品', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('10', '1', ',1,', 'false', null, '冲调保健', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('11', '0', ',', 'false', null, '进口酒类', null, 'false', '99', null, null, null, null, '0', '1428936908', null);
INSERT INTO `car_b2c_goods_cat` VALUES ('12', '11', ',11,', 'false', null, ' 啤酒', null, 'false', '99', null, null, null, null, '0', '1428642007', null);
INSERT INTO `car_b2c_goods_cat` VALUES ('13', '11', ',11,', 'false', null, '红酒', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('14', '11', ',11,', 'false', null, '洋酒', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('15', '0', ',', 'false', null, '特色中国·生态', null, 'false', '99', null, null, null, null, '0', '1428936914', null);
INSERT INTO `car_b2c_goods_cat` VALUES ('16', '15', ',15,', 'false', null, '野生菌', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('17', '15', ',15,', 'false', null, '散养家禽', null, 'true', '99', null, null, null, null, '0', '1429064478', null);
INSERT INTO `car_b2c_goods_cat` VALUES ('18', '15', ',15,', 'false', null, '阳澄湖大闸蟹', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('19', '0', ',', 'false', null, '百地·时鲜', null, 'false', '99', null, null, null, null, '0', '1428681442', null);
INSERT INTO `car_b2c_goods_cat` VALUES ('20', '19', ',19,', 'false', null, '牛排礼盒', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('21', '19', ',19,', 'false', null, '海鲜礼盒', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('22', '19', ',19,', 'false', null, '时鲜水果', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('23', '11', ',11,', 'false', null, '牛奶', null, 'false', '99', null, null, null, null, '0', '1428483751', null);
INSERT INTO `car_b2c_goods_cat` VALUES ('24', '1', ',1,', 'false', null, '果干', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('25', '1', ',1,', 'false', null, '糕点', null, 'false', '99', null, null, null, null, '0', null, null);
INSERT INTO `car_b2c_goods_cat` VALUES ('26', '15', ',15,', 'false', null, '膨化食品', null, 'false', '99', null, null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for car_b2c_goods_keywords
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_goods_keywords`;
CREATE TABLE `car_b2c_goods_keywords` (
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `keyword` varchar(40) NOT NULL DEFAULT '' COMMENT '搜索关键字',
  `refer` varchar(255) DEFAULT '' COMMENT '来源',
  `res_type` enum('goods','article') NOT NULL DEFAULT 'goods' COMMENT '搜索结果类型',
  `last_modify` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`goods_id`,`keyword`,`res_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_goods_keywords
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_goods_lv_price
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_goods_lv_price`;
CREATE TABLE `car_b2c_goods_lv_price` (
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '货品ID',
  `level_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级ID',
  `price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '会员价',
  PRIMARY KEY (`goods_id`,`product_id`,`level_id`),
  KEY `index_goods_id` (`goods_id`),
  KEY `index_product_id` (`product_id`),
  KEY `index_level_id` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_goods_lv_price
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_goods_props_index
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_goods_props_index`;
CREATE TABLE `car_b2c_goods_props_index` (
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品类型ID',
  `props_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '扩展属性ID',
  `props_value_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '扩展属性值ID',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `last_modify` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`props_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_goods_props_index
-- ----------------------------
INSERT INTO `car_b2c_goods_props_index` VALUES ('2', '1', '1', '10', '1428982842');

-- ----------------------------
-- Table structure for car_b2c_goods_spec_index
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_goods_spec_index`;
CREATE TABLE `car_b2c_goods_spec_index` (
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品类型ID',
  `spec_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '规格ID',
  `spec_value_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '规格值ID',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '货品ID',
  `last_modify` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`spec_value_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_goods_spec_index
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_goods_type`;
CREATE TABLE `car_b2c_goods_type` (
  `type_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型序号',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '类型名称',
  `floatstore` enum('0','1') NOT NULL DEFAULT '0' COMMENT '小数型库存',
  `alias` longtext COMMENT '类型别名(|分隔,前后|)',
  `is_physical` enum('0','1') NOT NULL DEFAULT '1' COMMENT '实体商品',
  `schema_id` varchar(30) NOT NULL DEFAULT 'custom' COMMENT '供应商序号',
  `setting` longtext COMMENT '类型设置',
  `price` longtext COMMENT '设置价格区间，用于列表页搜索使用',
  `minfo` longtext COMMENT '用户购买时所需输入信息的字段定义序列化数组方式 array(字段名,字段含义,类型(input,select,radio))',
  `params` longtext COMMENT '参数表结构(序列化) array(参数组名=>array(参数名1=>别名1|别名2,参数名2=>别名1|别名2))',
  `tab` longtext COMMENT '商品详情页的自定义tab设置',
  `dly_func` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否包含发货函数',
  `ret_func` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否包含退货函数',
  `reship` enum('disabled','func','normal','mixed') NOT NULL DEFAULT 'normal' COMMENT '退货方式 disabled:不允许退货 func:函数式',
  `disabled` enum('true','false') DEFAULT 'false',
  `is_def` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '是否系统默认',
  `lastmodify` int(10) unsigned DEFAULT NULL COMMENT '上次修改时间',
  PRIMARY KEY (`type_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_goods_type
-- ----------------------------
INSERT INTO `car_b2c_goods_type` VALUES ('1', '', '0', '', '1', 'custom', null, null, null, null, null, '0', '0', 'normal', 'true', 'false', '1428909423');
INSERT INTO `car_b2c_goods_type` VALUES ('2', '444455', '0', '44', '1', 'custom', null, null, null, null, null, '0', '0', 'normal', 'true', 'false', '1429007167');
INSERT INTO `car_b2c_goods_type` VALUES ('3', 'fsfds', '0', '5443', '1', 'custom', null, null, null, null, null, '0', '0', 'normal', 'false', 'false', null);

-- ----------------------------
-- Table structure for car_b2c_goods_type_props
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_goods_type_props`;
CREATE TABLE `car_b2c_goods_type_props` (
  `props_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性序号',
  `type` varchar(20) NOT NULL COMMENT '展示类型',
  `search` varchar(20) NOT NULL DEFAULT 'select' COMMENT '搜索方式',
  `show` varchar(10) NOT NULL DEFAULT '' COMMENT '是否显示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '类型名称',
  `alias` longtext COMMENT '别名',
  `goods_p` smallint(6) DEFAULT NULL COMMENT '商品位置',
  `ordernum` int(10) DEFAULT '0' COMMENT '排序',
  `lastmodify` int(10) unsigned DEFAULT NULL COMMENT '供应商最后更新时间',
  PRIMARY KEY (`props_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_goods_type_props
-- ----------------------------
INSERT INTO `car_b2c_goods_type_props` VALUES ('1', 'select', 'nav', 'on', '尺寸', '', null, null, '1429062302');

-- ----------------------------
-- Table structure for car_b2c_goods_type_props_relation
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_goods_type_props_relation`;
CREATE TABLE `car_b2c_goods_type_props_relation` (
  `relation_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `type_id` mediumint(8) unsigned NOT NULL COMMENT '商品类型id',
  `props_id` mediumint(8) unsigned NOT NULL COMMENT '属性序号',
  `last_modified` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_goods_type_props_relation
-- ----------------------------
INSERT INTO `car_b2c_goods_type_props_relation` VALUES ('1', '1', '1', '1428840197');

-- ----------------------------
-- Table structure for car_b2c_goods_type_props_value
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_goods_type_props_value`;
CREATE TABLE `car_b2c_goods_type_props_value` (
  `props_value_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值序号',
  `props_id` mediumint(8) unsigned NOT NULL COMMENT '属性序号',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '类型名称',
  `order_by` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '别名',
  `lastmodify` int(10) unsigned DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`props_value_id`),
  KEY `ind_props_id` (`props_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_goods_type_props_value
-- ----------------------------
INSERT INTO `car_b2c_goods_type_props_value` VALUES ('1', '1', '34', '1', '34', '1429062302');
INSERT INTO `car_b2c_goods_type_props_value` VALUES ('2', '1', '35', '2', '35', '1429062302');

-- ----------------------------
-- Table structure for car_b2c_goods_type_spec
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_goods_type_spec`;
CREATE TABLE `car_b2c_goods_type_spec` (
  `spec_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '规格ID',
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '类型ID',
  `spec_style` enum('select','flat','disabled') NOT NULL DEFAULT 'flat' COMMENT '渐进式搜索时的样式',
  `ordernum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spec_id`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_goods_type_spec
-- ----------------------------
INSERT INTO `car_b2c_goods_type_spec` VALUES ('1', '1', 'flat', '1');
INSERT INTO `car_b2c_goods_type_spec` VALUES ('2', '1', 'flat', '1');
INSERT INTO `car_b2c_goods_type_spec` VALUES ('3', '1', 'flat', '1');

-- ----------------------------
-- Table structure for car_b2c_members
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_members`;
CREATE TABLE `car_b2c_members` (
  `member_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员用户名',
  `member_lv_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级',
  `crm_member_id` mediumint(8) unsigned DEFAULT '0' COMMENT '联通CRM，存储CRM的member_id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `point` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `lastname` varchar(50) DEFAULT NULL COMMENT '姓氏',
  `firstname` varchar(50) DEFAULT NULL COMMENT '名字',
  `area` varchar(255) DEFAULT NULL COMMENT '地区',
  `addr` varchar(255) DEFAULT NULL COMMENT '地址',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `tel` varchar(50) DEFAULT NULL COMMENT '固定电话',
  `email` varchar(200) DEFAULT '' COMMENT 'EMAIL',
  `zip` varchar(20) DEFAULT NULL COMMENT '邮编',
  `order_num` mediumint(8) unsigned DEFAULT '0' COMMENT '订单数',
  `refer_id` varchar(50) DEFAULT NULL COMMENT '来源ID',
  `refer_url` varchar(200) DEFAULT NULL COMMENT '推广来源URL',
  `b_year` smallint(5) unsigned DEFAULT NULL COMMENT '生年',
  `b_month` tinyint(3) unsigned DEFAULT NULL COMMENT '生月',
  `b_day` tinyint(3) unsigned DEFAULT NULL COMMENT '生日',
  `sex` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '性别',
  `addon` longtext COMMENT '会员额外序列化信息',
  `wedlock` enum('0','1') NOT NULL DEFAULT '0' COMMENT '婚姻状况',
  `education` varchar(30) DEFAULT NULL COMMENT '教育程度',
  `vocation` varchar(50) DEFAULT NULL COMMENT '职业',
  `interest` longtext COMMENT '扩展信息里的爱好',
  `advance` decimal(20,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '会员账户余额',
  `advance_freeze` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '会员预存款冻结金额',
  `point_freeze` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员当前冻结积分(暂时停用)',
  `point_history` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员历史总积分(暂时停用)',
  `score_rate` decimal(5,3) DEFAULT NULL COMMENT '积分折换率',
  `reg_ip` varchar(16) DEFAULT NULL COMMENT '注册时IP地址',
  `regtime` int(10) unsigned DEFAULT NULL COMMENT '注册时间',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员验证状态',
  `pay_time` mediumint(8) unsigned DEFAULT NULL COMMENT '上次结算时间',
  `biz_money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '上次结算后到现在的所有因商业合作(推广人,代理)而产生的可供结算的金额',
  `fav_tags` longtext COMMENT '会员感兴趣的tag',
  `custom` longtext COMMENT '用户可根据自己的需要定义额外的会员注册信息,这里存的是序列化后的信息目前系统序列化进去的有： industry:工作行业 company:工作单位 co_addr:公司地址 salary:月收入',
  `cur` varchar(20) DEFAULT NULL COMMENT '货币(偏爱货币)',
  `lang` varchar(20) DEFAULT NULL COMMENT '偏好语言',
  `unreadmsg` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '未读信息',
  `disabled` enum('true','false') DEFAULT 'false',
  `remark` text COMMENT '备注',
  `remark_type` varchar(2) NOT NULL DEFAULT 'b1' COMMENT '备注类型',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `experience` int(10) DEFAULT '0' COMMENT '经验值',
  `foreign_id` varchar(255) DEFAULT NULL COMMENT 'foreign_id(弃用',
  `resetpwd` varchar(255) DEFAULT NULL COMMENT '找回密码唯一标示',
  `resetpwdtime` int(10) unsigned DEFAULT NULL COMMENT '找回密码时间',
  `member_refer` varchar(50) DEFAULT 'local' COMMENT '会员来源(弃用)',
  `source` enum('pc','wap','weixin','api') DEFAULT 'pc' COMMENT '平台来源',
  PRIMARY KEY (`member_id`),
  KEY `ind_email` (`email`),
  KEY `ind_regtime` (`regtime`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_members
-- ----------------------------
INSERT INTO `car_b2c_members` VALUES ('1', '1', '0', 'chen', '0', null, null, null, null, null, 'chen', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428030759', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'wap');
INSERT INTO `car_b2c_members` VALUES ('2', '1', '0', 'bfoursix', '0', null, null, null, null, null, 'bfoursix', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428472963', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'wap');
INSERT INTO `car_b2c_members` VALUES ('3', '1', '0', null, '0', null, null, null, null, null, null, '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428541360', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'wap');
INSERT INTO `car_b2c_members` VALUES ('4', '1', '0', 'parishe', '0', null, null, null, null, null, 'parishe', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428591591', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'wap');
INSERT INTO `car_b2c_members` VALUES ('5', '1', '0', 'kenday', '0', null, null, null, null, null, 'kenday', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428637005', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'wap');
INSERT INTO `car_b2c_members` VALUES ('6', '1', '0', '1111', '0', null, null, null, null, null, '1111', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428657153', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'wap');
INSERT INTO `car_b2c_members` VALUES ('7', '1', '0', 'msln', '0', null, null, null, null, null, 'msln', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428729525', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'wap');
INSERT INTO `car_b2c_members` VALUES ('8', '1', '0', 'iecel1990', '0', null, null, null, null, null, 'iecel1990', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428800589', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'wap');
INSERT INTO `car_b2c_members` VALUES ('9', '1', '0', 'chen123', '0', null, null, null, null, null, 'chen123', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428812438', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'wap');
INSERT INTO `car_b2c_members` VALUES ('10', '1', '0', 'testadmin', '0', null, null, null, null, null, 'testadmin', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428886171', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('11', '1', '0', 'lamllack0813', '0', null, null, null, null, null, 'lamllack0813', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428900202', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('12', '1', '0', '5645', '0', null, null, null, null, null, '5645', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428911130', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('13', '1', '0', 'admin', '0', null, null, 'mainland:湖南/长沙市/长沙县:1443', null, null, 'admin', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428911782', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('14', '1', '0', 'cndong', '0', null, null, null, null, null, 'cndong', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428978230', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('15', '1', '0', 'chinkei', '0', null, null, null, null, null, 'chinkei', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428980109', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('16', '1', '0', 'sbfnxk201@126.com', '0', null, null, null, null, null, 'sbfnxk201@126.com', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428980237', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('17', '1', '0', 'davidwang', '0', null, null, null, null, null, 'davidwang', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428983392', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('18', '1', '0', 'skywalkerwei', '0', null, null, null, null, null, 'skywalkerwei', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428990005', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('19', '1', '0', 'admin1', '0', null, null, null, null, null, 'admin1', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1428992645', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('20', '1', '0', 'James Bonde', '0', null, null, null, null, null, 'James Bonde', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1429001666', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('21', '1', '0', 'lyh', '0', null, null, null, null, null, 'lyh', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1429001886', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('22', '1', '0', 'tyears', '0', null, null, null, null, null, 'tyears', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1429012043', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('23', '1', '0', 'listenan', '0', null, null, null, null, null, 'listenan', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1429018868', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('24', '1', '0', 'paul52430', '0', null, null, null, null, null, 'paul52430', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1429065119', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('25', '1', '0', 'lijiafei01', '0', null, null, null, null, null, 'lijiafei01', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1429065319', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('26', '1', '0', '123', '0', null, null, null, null, null, '123', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1429070898', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('27', '1', '0', 'test', '0', null, null, null, null, null, 'test', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1429074641', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');
INSERT INTO `car_b2c_members` VALUES ('28', '1', '0', '2', '0', null, null, null, null, null, '2', '', null, '0', null, null, null, null, null, '1', null, '0', null, null, null, '0.000', '0.000', '0', '0', null, null, '1429078395', '0', null, '0.000', null, null, 'CNY', null, '0', 'false', null, 'b1', '0', '0', null, null, null, 'local', 'pc');

-- ----------------------------
-- Table structure for car_b2c_member_addrs
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_member_addrs`;
CREATE TABLE `car_b2c_member_addrs` (
  `addr_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '会员地址ID',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `name` varchar(50) DEFAULT NULL COMMENT '会员地址名称',
  `lastname` varchar(50) DEFAULT NULL COMMENT '姓名',
  `firstname` varchar(50) DEFAULT NULL COMMENT '姓名',
  `area` varchar(255) DEFAULT NULL COMMENT '地区',
  `addr` varchar(255) DEFAULT NULL COMMENT '地址',
  `zip` varchar(20) DEFAULT NULL COMMENT '邮编',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `day` varchar(255) DEFAULT '任意日期' COMMENT '上门日期',
  `time` varchar(255) DEFAULT '任意时间段' COMMENT '上门时间',
  `def_addr` tinyint(1) DEFAULT '0' COMMENT '默认地址',
  PRIMARY KEY (`addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_member_addrs
-- ----------------------------
INSERT INTO `car_b2c_member_addrs` VALUES ('5', '1', 'ggggg', null, null, 'mainland:天津/天津市/河西区:46', '53543rwerewrw', '123456', null, '4353', '任意日期', '任意时间段', '0');
INSERT INTO `car_b2c_member_addrs` VALUES ('6', '1', '543', null, null, 'mainland:重庆/重庆市/渝中区:66', '53443', '53543', null, '34543543', '任意日期', '任意时间段', '0');
INSERT INTO `car_b2c_member_addrs` VALUES ('10', '13', 'ert', null, null, 'mainland:北京/北京市/西城区:4', 'ertert-00', 'ert', null, 'ert', '任意日期', '任意时间段', '0');

-- ----------------------------
-- Table structure for car_b2c_member_advance
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_member_advance`;
CREATE TABLE `car_b2c_member_advance` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '出入金额',
  `message` varchar(255) DEFAULT NULL COMMENT '管理备注',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '交易时间',
  `payment_id` varchar(20) DEFAULT NULL COMMENT '支付单号',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单号',
  `paymethod` varchar(100) DEFAULT NULL COMMENT '支付方式',
  `memo` varchar(100) DEFAULT NULL COMMENT '业务摘要',
  `import_money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '存入金额',
  `explode_money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '支出金额',
  `member_advance` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '当前余额',
  `shop_advance` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '商店余额',
  `disabled` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '失效',
  PRIMARY KEY (`log_id`),
  KEY `ind_mtime` (`mtime`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_member_advance
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_member_comments
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_member_comments`;
CREATE TABLE `car_b2c_member_comments` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `for_comment_id` mediumint(8) DEFAULT '0' COMMENT '对m的回复',
  `goods_id` bigint(20) unsigned DEFAULT NULL COMMENT '名称',
  `product_id` mediumint(8) unsigned DEFAULT '0' COMMENT '货品ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单编号',
  `object_type` enum('ask','discuss','buy','message','msg','order') NOT NULL DEFAULT 'ask' COMMENT '类型',
  `author_id` mediumint(8) DEFAULT '0' COMMENT '作者ID',
  `author` varchar(100) DEFAULT NULL COMMENT '发表人',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `time` int(10) unsigned DEFAULT NULL COMMENT '时间',
  `lastreply` int(10) unsigned DEFAULT NULL COMMENT '最后回复时间',
  `reply_name` varchar(100) DEFAULT NULL COMMENT '最后回复人',
  `inbox` enum('true','false') DEFAULT 'true' COMMENT '收件箱',
  `track` enum('true','false') DEFAULT 'true' COMMENT '发件箱',
  `has_sent` enum('true','false') DEFAULT 'true' COMMENT '是否发送',
  `to_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '目标会员序号ID',
  `to_uname` varchar(100) DEFAULT NULL COMMENT '目标会员姓名',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `comment` longtext COMMENT '内容',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip地址',
  `display` enum('true','false') DEFAULT 'true' COMMENT '前台是否显示',
  `disabled` enum('false','true') DEFAULT 'false',
  PRIMARY KEY (`comment_id`),
  KEY `index_for_comment_id` (`for_comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_member_comments
-- ----------------------------
INSERT INTO `car_b2c_member_comments` VALUES ('1', '0', '10', '16', null, 'ask', '0', 'fdsadf', 'fdsafs', '1428993051', null, null, 'true', 'true', 'true', '0', null, null, 'fdsafsa', null, 'false', 'false');
INSERT INTO `car_b2c_member_comments` VALUES ('2', '0', '10', '16', null, 'ask', '0', 'fdsafds', 'fdsafd', '1428993142', null, null, 'true', 'true', 'true', '0', null, null, 'safsdafdsafd', null, 'false', 'false');
INSERT INTO `car_b2c_member_comments` VALUES ('3', '0', '10', '16', null, 'ask', '0', 'fdsafdsaf', 'afdsafdsa', '1428993186', null, null, 'true', 'true', 'true', '0', null, null, 'fdsafafdaf', null, 'false', 'false');

-- ----------------------------
-- Table structure for car_b2c_member_coupon
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_member_coupon`;
CREATE TABLE `car_b2c_member_coupon` (
  `memc_code` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券code',
  `cpns_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员优惠券ID',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `memc_gen_orderid` varchar(15) DEFAULT NULL COMMENT '优惠券产生订单号',
  `memc_source` enum('a','b','c') NOT NULL DEFAULT 'a' COMMENT '优惠券来源(保留)',
  `memc_enabled` enum('true','false') NOT NULL DEFAULT 'true' COMMENT '留做后用, 可单独取消某些已发放出的优惠券',
  `memc_used_times` mediumint(9) DEFAULT '0' COMMENT '已使用次数',
  `memc_gen_time` int(10) unsigned DEFAULT NULL COMMENT '优惠券产生时间',
  `disabled` enum('true','false') DEFAULT 'false' COMMENT '无效',
  `memc_isvalid` enum('true','false') NOT NULL DEFAULT 'true' COMMENT '会员优惠券是否当前可用',
  PRIMARY KEY (`memc_code`,`member_id`),
  KEY `ind_memc_gen_orderid` (`memc_gen_orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_member_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_member_goods
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_member_goods`;
CREATE TABLE `car_b2c_member_goods` (
  `gnotify_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` bigint(20) unsigned NOT NULL COMMENT '商品ID',
  `member_id` mediumint(8) unsigned DEFAULT NULL COMMENT '会员用户名',
  `product_id` mediumint(8) unsigned DEFAULT NULL COMMENT '货品ID',
  `goods_name` varchar(200) DEFAULT '' COMMENT '商品名称',
  `goods_price` decimal(20,3) DEFAULT '0.000' COMMENT '销售价',
  `image_default_id` varchar(32) DEFAULT NULL COMMENT '默认图片',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `cellphone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `status` enum('ready','send','progress') NOT NULL COMMENT '状态',
  `send_time` int(10) unsigned DEFAULT NULL COMMENT '发送时间',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '申请时间',
  `disabled` enum('true','false') DEFAULT 'false',
  `remark` longtext COMMENT '备注',
  `type` enum('fav','sto') DEFAULT NULL COMMENT '类型, 收藏还是缺货',
  `object_type` varchar(100) DEFAULT 'goods' COMMENT '收藏的类型，goods',
  PRIMARY KEY (`gnotify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_member_goods
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_member_lv
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_member_lv`;
CREATE TABLE `car_b2c_member_lv` (
  `member_lv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '等级名称',
  `lv_logo` varchar(255) DEFAULT NULL COMMENT '会员等级LOGO',
  `dis_count` decimal(5,2) NOT NULL DEFAULT '1.00' COMMENT '会员折扣率',
  `pre_id` mediumint(9) DEFAULT NULL COMMENT '前一级别ID',
  `default_lv` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否默认',
  `deposit_freeze_time` int(11) DEFAULT '0' COMMENT '保证金冻结时间',
  `deposit` int(11) DEFAULT '0' COMMENT '所需保证金金额',
  `more_point` int(11) DEFAULT '1' COMMENT '会员等级积分倍率',
  `lv_type` enum('retail','wholesale','dealer') NOT NULL DEFAULT 'retail' COMMENT '等级类型',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所需积分',
  `disabled` enum('true','false') DEFAULT 'false',
  `show_other_price` enum('true','false') NOT NULL DEFAULT 'true' COMMENT '查阅其他会员等级价格',
  `order_limit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员每次下单限制. 0不限制 1遵守批发规则中的最小起批数量和混批规则中的最小起批数量/金额 2 此等级会员每次下单必须达到',
  `order_limit_price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '每次下单必须达到的金额',
  `lv_remark` text COMMENT '会员等级备注',
  `experience` int(10) NOT NULL DEFAULT '0' COMMENT '经验值',
  `expiretime` int(10) NOT NULL DEFAULT '0' COMMENT '积分过期时间',
  PRIMARY KEY (`member_lv_id`),
  UNIQUE KEY `ind_name` (`name`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_member_lv
-- ----------------------------
INSERT INTO `car_b2c_member_lv` VALUES ('1', '注册会员', null, '1.00', null, '0', '0', '0', '1', 'retail', '0', 'false', 'true', '0', '0.000', null, '0', '0');
INSERT INTO `car_b2c_member_lv` VALUES ('2', '铜牌会员', null, '1.00', null, '0', '0', '0', '1', 'retail', '0', 'false', 'true', '0', '0.000', null, '0', '0');
INSERT INTO `car_b2c_member_lv` VALUES ('3', '白银会员', null, '1.00', null, '0', '0', '0', '1', 'retail', '0', 'false', 'true', '0', '0.000', null, '0', '0');
INSERT INTO `car_b2c_member_lv` VALUES ('4', '金牌会员', null, '1.00', null, '0', '0', '0', '1', 'retail', '0', 'false', 'true', '0', '0.000', null, '0', '0');

-- ----------------------------
-- Table structure for car_b2c_member_msg
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_member_msg`;
CREATE TABLE `car_b2c_member_msg` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `for_id` int(11) DEFAULT '0' COMMENT '回复哪个信件',
  `from_id` mediumint(8) unsigned NOT NULL COMMENT '发起会员ID',
  `from_uname` varchar(100) DEFAULT NULL COMMENT '发信者',
  `from_type` int(11) DEFAULT '0' COMMENT '发信类型',
  `to_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '目标会员ID',
  `to_uname` varchar(100) DEFAULT NULL COMMENT '目标会员姓名',
  `subject` varchar(100) NOT NULL COMMENT '消息主题',
  `content` text NOT NULL COMMENT '内容',
  `order_id` bigint(20) DEFAULT '0' COMMENT '订单ID',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '发送时间',
  `to_time` int(10) unsigned DEFAULT NULL COMMENT '发送时间',
  `has_read` enum('true','false') DEFAULT 'false' COMMENT '是否已读',
  `keep_unread` enum('true','false') DEFAULT 'false' COMMENT '保持未读',
  `has_star` enum('true','false') DEFAULT 'false' COMMENT '是否打上星标',
  `has_sent` enum('true','false') DEFAULT 'true' COMMENT '是否发送',
  PRIMARY KEY (`msg_id`),
  KEY `ind_to_id` (`to_id`,`has_read`,`has_sent`),
  KEY `ind_from_id` (`from_id`,`has_read`,`has_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_member_msg
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_member_point
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_member_point`;
CREATE TABLE `car_b2c_member_point` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '积分日志ID',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `point` int(10) NOT NULL DEFAULT '0' COMMENT '积分阶段总结',
  `change_point` int(10) NOT NULL DEFAULT '0' COMMENT '改变积分',
  `consume_point` int(10) NOT NULL DEFAULT '0' COMMENT '单笔积分消耗的积分值',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `expiretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `reason` varchar(50) NOT NULL DEFAULT '' COMMENT '理由',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `related_id` bigint(20) unsigned DEFAULT NULL COMMENT '积分关联对象ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '操作类型',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_member_point
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_member_pwdlog
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_member_pwdlog`;
CREATE TABLE `car_b2c_member_pwdlog` (
  `pwdlog_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员ID',
  `secret` varchar(100) NOT NULL DEFAULT '' COMMENT '临时秘钥',
  `expiretime` int(10) unsigned DEFAULT NULL COMMENT '过期时间',
  `has_used` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '是否使用过, 如果使用过将失效',
  PRIMARY KEY (`pwdlog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_member_pwdlog
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_member_systmpl
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_member_systmpl`;
CREATE TABLE `car_b2c_member_systmpl` (
  `tmpl_name` varchar(100) NOT NULL COMMENT '模版名称',
  `content` longtext COMMENT '模板内容',
  `edittime` int(10) NOT NULL COMMENT '编辑时间',
  `active` enum('true','false') DEFAULT 'true' COMMENT '是否激活',
  PRIMARY KEY (`tmpl_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_member_systmpl
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_orders
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_orders`;
CREATE TABLE `car_b2c_orders` (
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单号',
  `total_amount` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '商品默认货币总值',
  `final_amount` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单货币总值, 包含支付价格,税等',
  `pay_status` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0' COMMENT '付款状态',
  `ship_status` enum('0','1','2','3','4') NOT NULL DEFAULT '0' COMMENT '发货状态',
  `is_delivery` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否需要发货',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '下单时间',
  `last_modified` int(10) unsigned DEFAULT NULL COMMENT '最后更新时间',
  `payment` varchar(100) DEFAULT NULL COMMENT '支付方式',
  `shipping_id` mediumint(8) unsigned DEFAULT NULL COMMENT '配送方式',
  `shipping` varchar(100) DEFAULT NULL COMMENT '配送方式',
  `member_id` mediumint(8) unsigned DEFAULT NULL COMMENT '会员用户名',
  `status` enum('active','dead','finish') NOT NULL DEFAULT 'active' COMMENT '订单状态',
  `confirm` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '确认状态',
  `ship_area` varchar(255) DEFAULT NULL COMMENT '收货地区',
  `ship_name` varchar(50) DEFAULT NULL COMMENT '收货人',
  `weight` decimal(20,3) DEFAULT NULL COMMENT '订单总重量',
  `tostr` longtext COMMENT '订单文字描述',
  `itemnum` mediumint(8) unsigned DEFAULT NULL COMMENT '订单子订单数量',
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP地址',
  `ship_addr` text COMMENT '收货地址',
  `ship_zip` varchar(20) DEFAULT NULL COMMENT '收货人邮编',
  `ship_tel` varchar(50) DEFAULT NULL COMMENT '收货电话',
  `ship_email` varchar(200) DEFAULT NULL COMMENT '收货人email',
  `ship_time` varchar(50) DEFAULT NULL COMMENT '配送时间',
  `ship_mobile` varchar(50) DEFAULT NULL COMMENT '收货人手机',
  `cost_item` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单商品总价格',
  `is_tax` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '是否要开发票',
  `tax_type` enum('false','personal','company') NOT NULL DEFAULT 'false' COMMENT '发票类型',
  `tax_content` varchar(255) DEFAULT NULL COMMENT '发票内容',
  `cost_tax` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单税率',
  `tax_company` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `is_protect` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '是否还有保价费',
  `cost_protect` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '保价费',
  `cost_payment` decimal(20,3) DEFAULT NULL COMMENT '支付费用',
  `currency` varchar(8) DEFAULT NULL COMMENT '订单支付货币',
  `cur_rate` decimal(10,4) DEFAULT '1.0000' COMMENT '订单支付货币汇率',
  `score_u` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单使用积分',
  `score_g` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单获得积分',
  `discount` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单减免',
  `pmt_goods` decimal(20,3) DEFAULT NULL COMMENT '商品促销优惠',
  `pmt_order` decimal(20,3) DEFAULT NULL COMMENT '订单促销优惠',
  `payed` decimal(20,3) DEFAULT '0.000' COMMENT '订单支付金额',
  `memo` longtext COMMENT '订单附言',
  `disabled` enum('true','false') DEFAULT 'false',
  `mark_type` varchar(2) NOT NULL DEFAULT 'b1' COMMENT '订单备注图标',
  `mark_text` longtext COMMENT '订单备注',
  `cost_freight` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '配送费用',
  `extend` varchar(255) DEFAULT 'false' COMMENT '订单扩展',
  `order_refer` varchar(20) NOT NULL DEFAULT 'local' COMMENT '订单来源',
  `addon` longtext COMMENT '订单附属信息(序列化)',
  `source` enum('pc','wap','app','weixin') DEFAULT 'pc' COMMENT '平台来源',
  PRIMARY KEY (`order_id`),
  KEY `ind_ship_status` (`ship_status`),
  KEY `ind_pay_status` (`pay_status`),
  KEY `ind_status` (`status`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_last_modified` (`last_modified`),
  KEY `ind_createtime` (`createtime`),
  KEY `idx_order_refer` (`order_refer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_orders
-- ----------------------------
INSERT INTO `car_b2c_orders` VALUES ('2015041148995452', '157.000', '157.000', '1', '4', 'Y', '1428765936', '1428765936', 'alipay', '1', '快递', '1', 'active', 'N', 'mainland:上海/上海市/卢湾区:24', '54354334', null, '新西兰进口猕猴桃30/33/36（单果80g以上）  147.00*1', '1', '211.161.247.97', '上海上海市卢湾区rwerew', '53543', '32534243', null, '任意日期,任意时间段', '5323454343', '147.000', 'false', 'false', null, '0.000', null, 'false', '0.000', null, 'CNY', '1.0000', '0.000', '157.000', '0.000', null, null, '157.000', null, 'false', 'b1', null, '10.000', 'false', 'local', null, 'pc');
INSERT INTO `car_b2c_orders` VALUES ('2015041150991015', '157.000', '157.000', '1', '4', 'Y', '1428765426', '1428765426', 'alipay', '1', '快递', '1', 'active', 'N', 'mainland:上海/上海市/卢湾区:24', '54354334', null, '新西兰进口猕猴桃30/33/36（单果80g以上）  147.00*1', '1', '127.0.0.1', '上海上海市卢湾区rwerew', '53543', '', null, '任意日期,任意时间段', '5323454343', '147.000', 'false', 'false', null, '0.000', null, 'false', '0.000', null, 'CNY', '1.0000', '0.000', '157.000', '0.000', null, null, '157.000', null, 'false', 'b1', null, '10.000', 'false', 'local', null, 'pc');
INSERT INTO `car_b2c_orders` VALUES ('2015041153101991', '58.200', '58.200', '0', '0', 'Y', '1428747189', '1428747189', 'alipay', '1', '普通快递', '1', 'active', 'N', 'mainland:上海/上海市/卢湾区:24', '54354334', null, '德国进口食品 劳仑兹薯片 清新咸味  16.60*2||yum earth棒棒糖  15.00*1', '3', '127.0.0.1', '上海上海市卢湾区rwerew', '53543', null, null, '任意日期,任意时间段', '5323454343', '48.200', 'false', 'false', null, '0.000', null, 'false', '0.000', null, 'CNY', '1.0000', '0.000', '0.000', '0.000', null, null, '0.000', null, 'false', 'b1', null, '10.000', 'false', 'local', null, 'pc');
INSERT INTO `car_b2c_orders` VALUES ('2015041153535410', '173.900', '173.900', '0', '0', 'Y', '1428764485', '1428764485', 'alipay', '1', '普通快递', '1', 'active', 'N', 'mainland:上海/上海市/卢湾区:24', '54354334', null, '进口柠檬5粒装  16.90*1||新西兰进口猕猴桃30/33/36（单果80g以上）  147.00*1', '2', '127.0.0.1', '上海上海市卢湾区rwerew', '53543', null, null, '任意日期,任意时间段', '5323454343', '163.900', 'false', 'false', null, '0.000', null, 'false', '0.000', null, 'CNY', '1.0000', '0.000', '0.000', '0.000', null, null, '0.000', null, 'false', 'b1', null, '10.000', 'false', 'local', null, 'pc');
INSERT INTO `car_b2c_orders` VALUES ('2015041250499948', '1039.000', '1039.000', '5', '1', 'Y', '1428814818', '1428814818', 'alipay', '2', '货到付款', '1', 'active', 'N', 'mainland:重庆/重庆市/江北区:68', '543', null, '新西兰进口猕猴桃30/33/36（单果80g以上）  147.00*7', '7', '127.0.0.1', '重庆重庆市渝中区53443', '53543', '', null, '任意日期,任意时间段', '34543543', '1029.000', 'false', 'false', null, '0.000', null, 'false', '0.000', null, 'CNY', '1.0000', '0.000', '0.000', '0.000', null, null, '0.000', null, 'false', 'b1', null, '10.000', 'false', 'local', null, 'pc');
INSERT INTO `car_b2c_orders` VALUES ('2015041250519757', '613.900', '613.900', '0', '1', 'Y', '1428851762', '1428851762', 'alipay', '1', '快递', '1', 'active', 'N', 'mainland:重庆/重庆市/渝中区:66', '543', null, '精品赣南橙子3粒装（单粒230g以上）  15.90*1||新西兰进口猕猴桃30/33/36（单果80g以上）  147.00*4', '5', '49.221.235.5', '重庆重庆市渝中区53443', '53543', '', null, '任意日期,任意时间段', '34543543', '603.900', 'false', 'false', null, '0.000', null, 'false', '0.000', null, 'CNY', '1.0000', '0.000', '0.000', '0.000', null, null, '0.000', null, 'false', 'b1', null, '10.000', 'false', 'local', null, 'pc');
INSERT INTO `car_b2c_orders` VALUES ('2015041298561005', '26.600', '26.600', '1', '1', 'Y', '1428808907', '1428808907', 'alipay', '1', '快递', '1', 'active', 'N', 'mainland:重庆/重庆市/渝中区:66', '543', null, '德国进口食品 劳仑兹薯片 清新咸味  16.60*1', '1', '49.221.235.5', '重庆重庆市渝中区53443', '53543', '', null, '任意日期,任意时间段', '34543543', '16.600', 'false', 'false', null, '0.000', null, 'false', '0.000', null, 'CNY', '1.0000', '0.000', '27.000', '0.000', null, null, '26.600', null, 'false', 'b1', null, '10.000', 'false', 'local', null, 'pc');
INSERT INTO `car_b2c_orders` VALUES ('2015041452985250', '43.200', '43.200', '1', '4', 'Y', '1428979012', '1428979012', 'alipay', '1', '快递', '13', 'active', 'N', 'mainland:北京/北京市/西城区:4', 'ert', null, '德国进口食品 劳仑兹薯片 清新咸味  16.60*2', '2', '221.226.154.106', '北京北京市西城区ertert', 'ert', '', null, '任意日期,任意时间段', 'ert', '33.200', 'false', 'false', null, '0.000', null, 'false', '0.000', null, 'CNY', '1.0000', '0.000', '44.000', '0.000', null, null, '43.200', null, 'false', 'b1', null, '10.000', 'false', 'local', null, 'pc');
INSERT INTO `car_b2c_orders` VALUES ('2015041555505648', '157.000', '157.000', '0', '0', 'Y', '1429076423', '1429076423', 'alipay', '1', '普通快递', '13', 'active', 'N', 'mainland:北京/北京市/西城区:4', 'ert', null, '新西兰进口猕猴桃30/33/36（单果80g以上）  147.00*1', '1', '222.79.222.136', '北京北京市西城区ertert-00', 'ert', null, null, '任意日期,任意时间段', 'ert', '147.000', 'false', 'false', null, '0.000', null, 'false', '0.000', null, 'CNY', '1.0000', '0.000', '0.000', '0.000', null, null, '0.000', null, 'false', 'b1', null, '10.000', 'false', 'local', null, 'pc');

-- ----------------------------
-- Table structure for car_b2c_order_cancel_reason
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_order_cancel_reason`;
CREATE TABLE `car_b2c_order_cancel_reason` (
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `reason_type` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0' COMMENT '取消原因类型',
  `reason_desc` varchar(150) DEFAULT NULL COMMENT '其他原因',
  `cancel_time` int(10) unsigned DEFAULT NULL COMMENT '取消时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_order_cancel_reason
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_order_coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_order_coupon_user`;
CREATE TABLE `car_b2c_order_coupon_user` (
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '应用订单号',
  `cpns_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券方案ID',
  `cpns_name` varchar(255) DEFAULT NULL COMMENT '优惠券方案名称',
  `usetime` int(10) unsigned DEFAULT NULL COMMENT '使用时间',
  `memc_code` varchar(255) DEFAULT NULL COMMENT '使用的优惠券号码',
  `cpns_type` enum('0','1','2') DEFAULT NULL COMMENT '优惠券类型0全局 1用户 2外部优惠券',
  PRIMARY KEY (`order_id`,`cpns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_order_coupon_user
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_order_delivery
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_order_delivery`;
CREATE TABLE `car_b2c_order_delivery` (
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `dlytype` enum('delivery','reship') NOT NULL DEFAULT 'delivery' COMMENT '单据类型',
  `dly_id` varchar(20) NOT NULL COMMENT '关联单号',
  `items` text COMMENT '货品明细',
  PRIMARY KEY (`order_id`,`dly_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_order_delivery
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_order_items
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_order_items`;
CREATE TABLE `car_b2c_order_items` (
  `item_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单明细ID',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `obj_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单明细对应的商品对象ID, 对应到sdb_b2c_order_objects表',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '货品ID',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `type_id` mediumint(8) unsigned DEFAULT NULL COMMENT '商品类型ID',
  `bn` varchar(40) DEFAULT NULL COMMENT '明细商品的品牌名',
  `name` varchar(200) DEFAULT NULL COMMENT '明细商品的名称',
  `cost` decimal(20,3) DEFAULT NULL COMMENT '明细商品的成本',
  `price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '明细商品的销售价(购入价)',
  `g_price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '明细商品的会员价原价',
  `amount` decimal(20,3) DEFAULT NULL COMMENT '明细商品总额',
  `score` mediumint(8) unsigned DEFAULT NULL COMMENT '明细商品积分',
  `weight` mediumint(8) unsigned DEFAULT NULL COMMENT '明细商品重量',
  `nums` float NOT NULL DEFAULT '1' COMMENT '明细商品购买数量',
  `sendnum` float NOT NULL DEFAULT '0' COMMENT '明细商品发货数量',
  `addon` longtext COMMENT '明细商品的规格属性',
  `item_type` enum('product','pkg','gift','adjunct') NOT NULL DEFAULT 'product' COMMENT '明细商品类型',
  PRIMARY KEY (`item_id`),
  KEY `ind_item_bn` (`bn`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_order_items
-- ----------------------------
INSERT INTO `car_b2c_order_items` VALUES ('7', '2015041153101991', '7', '16', '10', null, '20150402010', '德国进口食品 劳仑兹薯片 清新咸味', '10.000', '16.600', '16.600', '33.200', null, null, '2', '0', null, 'product');
INSERT INTO `car_b2c_order_items` VALUES ('8', '2015041153101991', '8', '8', '2', null, '20150402002', 'yum earth棒棒糖', '10.000', '15.000', '15.000', '15.000', null, null, '1', '0', null, 'product');
INSERT INTO `car_b2c_order_items` VALUES ('9', '2015041153535410', '9', '13', '7', null, '20150402007', '进口柠檬5粒装', '12.000', '16.900', '16.900', '16.900', null, null, '1', '0', null, 'product');
INSERT INTO `car_b2c_order_items` VALUES ('10', '2015041153535410', '10', '15', '9', null, '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '100.000', '147.000', '147.000', '147.000', null, null, '1', '0', null, 'product');
INSERT INTO `car_b2c_order_items` VALUES ('11', '2015041150991015', '11', '15', '9', null, '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '100.000', '147.000', '147.000', '147.000', null, null, '1', '0', null, 'product');
INSERT INTO `car_b2c_order_items` VALUES ('12', '2015041148995452', '12', '15', '9', null, '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '100.000', '147.000', '147.000', '147.000', null, null, '1', '0', null, 'product');
INSERT INTO `car_b2c_order_items` VALUES ('13', '2015041298561005', '13', '16', '10', null, '20150402010', '德国进口食品 劳仑兹薯片 清新咸味', '10.000', '16.600', '16.600', '16.600', null, null, '1', '0', null, 'product');
INSERT INTO `car_b2c_order_items` VALUES ('14', '2015041250499948', '14', '15', '9', null, '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '100.000', '147.000', '147.000', '1029.000', null, null, '7', '0', null, 'product');
INSERT INTO `car_b2c_order_items` VALUES ('15', '2015041250519757', '15', '14', '8', null, '20150402008', '精品赣南橙子3粒装（单粒230g以上）', '20.000', '15.900', '15.900', '15.900', null, null, '1', '0', null, 'product');
INSERT INTO `car_b2c_order_items` VALUES ('16', '2015041250519757', '16', '15', '9', null, '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '100.000', '147.000', '147.000', '588.000', null, null, '4', '0', null, 'product');
INSERT INTO `car_b2c_order_items` VALUES ('17', '2015041452985250', '17', '16', '10', '2', '20150402010', '德国进口食品 劳仑兹薯片 清新咸味', '10.000', '16.600', '16.600', '33.200', null, null, '2', '0', null, 'product');
INSERT INTO `car_b2c_order_items` VALUES ('18', '2015041555505648', '18', '15', '9', null, '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '100.000', '147.000', '147.000', '147.000', null, null, '1', '0', null, 'product');

-- ----------------------------
-- Table structure for car_b2c_order_log
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_order_log`;
CREATE TABLE `car_b2c_order_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单日志ID',
  `rel_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对象ID',
  `op_id` mediumint(8) unsigned DEFAULT NULL COMMENT '操作员ID',
  `op_name` varchar(100) DEFAULT NULL COMMENT '操作人名称',
  `alttime` int(10) unsigned DEFAULT NULL COMMENT '操作时间',
  `bill_type` enum('order','recharge','joinfee','prepaid_recharge') NOT NULL DEFAULT 'order' COMMENT '操作人员姓名',
  `behavior` enum('creates','updates','payments','refunds','delivery','reship','finish','cancel') NOT NULL DEFAULT 'payments' COMMENT '日志记录操作的行为',
  `result` enum('SUCCESS','FAILURE') NOT NULL COMMENT '日志结果',
  `log_text` longtext COMMENT '操作内容',
  `addon` longtext COMMENT '序列化数据',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_order_log
-- ----------------------------
INSERT INTO `car_b2c_order_log` VALUES ('4', '2015041153101991', '1', '54354334', '1428747189', 'order', 'creates', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:21:\"订单创建成功！\";s:4:\"data\";a:0:{}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('5', '2015041153535410', '1', '54354334', '1428764485', 'order', 'creates', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:21:\"订单创建成功！\";s:4:\"data\";a:0:{}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('6', '2015041150991015', '1', '54354334', '1428765426', 'order', 'creates', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:21:\"订单创建成功！\";s:4:\"data\";a:0:{}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('7', '2015041148995452', '1', '54354334', '1428765936', 'order', 'creates', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:21:\"订单创建成功！\";s:4:\"data\";a:0:{}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('8', '2015041148995452', '1', 'chen', '1428765829', 'order', 'payments', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:59:\"订单已付款，订单号2015041148995452付款157.000元\";s:4:\"data\";a:2:{i:0;s:16:\"2015041148995452\";i:1;s:7:\"157.000\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('9', '2015041150991015', '1', 'chen', '1428767346', 'order', 'payments', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:59:\"订单已付款，订单号2015041150991015付款157.000元\";s:4:\"data\";a:2:{i:0;s:16:\"2015041150991015\";i:1;s:7:\"157.000\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('10', '2015041148995452', '1', 'admin', '1428767384', 'order', 'delivery', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:67:\"订单已发货，物流公司：圆通速递,物流号：123456789\";s:4:\"data\";a:3:{i:0;s:16:\"2015041148995452\";i:1;s:12:\"圆通速递\";i:2;s:9:\"123456789\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('11', '2015041298561005', '1', '543', '1428808907', 'order', 'creates', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:21:\"订单创建成功！\";s:4:\"data\";a:0:{}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('12', '2015041250499948', '1', '543', '1428814818', 'order', 'creates', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:21:\"订单创建成功！\";s:4:\"data\";a:0:{}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('13', '2015041250499948', '1', 'chen', '1428815385', 'order', 'payments', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:60:\"订单已付款，订单号2015041250499948付款1039.000元\";s:4:\"data\";a:2:{i:0;s:16:\"2015041250499948\";i:1;s:8:\"1039.000\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('14', '2015041250499948', '1', 'admin', '1428815470', 'order', 'refunds', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:60:\"订单已退款，订单号2015041250499948退款1039.000元\";s:4:\"data\";a:2:{i:0;s:16:\"2015041250499948\";i:1;s:8:\"1039.000\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('15', '2015041148995452', '1', 'admin', '1428816525', 'order', 'delivery', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:69:\"订单已退货，物流公司：中国邮政EMS,物流号：12345678\";s:4:\"data\";a:3:{i:0;s:16:\"2015041148995452\";i:1;s:15:\"中国邮政EMS\";i:2;s:8:\"12345678\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('16', '2015041150991015', '1', 'admin', '1428816572', 'order', 'delivery', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:70:\"订单已发货，物流公司：中国邮政EMS,物流号：123456789\";s:4:\"data\";a:3:{i:0;s:16:\"2015041150991015\";i:1;s:15:\"中国邮政EMS\";i:2;s:9:\"123456789\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('17', '2015041150991015', '1', 'admin', '1428816606', 'order', 'delivery', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:70:\"订单已退货，物流公司：中国邮政EMS,物流号：123456789\";s:4:\"data\";a:3:{i:0;s:16:\"2015041150991015\";i:1;s:15:\"中国邮政EMS\";i:2;s:9:\"123456789\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('18', '2015041298561005', '1', 'chen', '1428816645', 'order', 'payments', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:58:\"订单已付款，订单号2015041298561005付款26.600元\";s:4:\"data\";a:2:{i:0;s:16:\"2015041298561005\";i:1;s:6:\"26.600\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('19', '2015041250499948', '1', 'admin', '1428839474', 'order', 'delivery', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:56:\"订单已发货，物流公司：大田,物流号：0000\";s:4:\"data\";a:3:{i:0;s:16:\"2015041250499948\";i:1;s:6:\"大田\";i:2;s:4:\"0000\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('20', '2015041250519757', '1', '543', '1428851762', 'order', 'creates', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:21:\"订单创建成功！\";s:4:\"data\";a:0:{}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('21', '2015041298561005', '1', 'admin', '1428910916', 'order', 'delivery', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:66:\"订单已发货，物流公司：中国邮政EMS,物流号：23234\";s:4:\"data\";a:3:{i:0;s:16:\"2015041298561005\";i:1;s:15:\"中国邮政EMS\";i:2;s:5:\"23234\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('22', '2015041452985250', '13', 'ert', '1428979012', 'order', 'creates', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:21:\"订单创建成功！\";s:4:\"data\";a:0:{}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('23', '2015041452985250', '13', 'admin', '1428992539', 'order', 'payments', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:58:\"订单已付款，订单号2015041452985250付款43.200元\";s:4:\"data\";a:2:{i:0;s:16:\"2015041452985250\";i:1;s:6:\"43.200\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('24', '2015041250519757', '1', 'admin', '1429003109', 'order', 'delivery', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:68:\"订单已发货，物流公司：中国邮政EMS,物流号：2342342\";s:4:\"data\";a:3:{i:0;s:16:\"2015041250519757\";i:1;s:15:\"中国邮政EMS\";i:2;s:7:\"2342342\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('25', '2015041452985250', '1', 'admin', '1429064685', 'order', 'delivery', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:66:\"订单已发货，物流公司：中国邮政EMS,物流号：13214\";s:4:\"data\";a:3:{i:0;s:16:\"2015041452985250\";i:1;s:15:\"中国邮政EMS\";i:2;s:5:\"13214\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('26', '2015041452985250', '1', 'admin', '1429065389', 'order', 'delivery', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:61:\"订单已退货，物流公司：中国邮政EMS,物流号：\";s:4:\"data\";a:3:{i:0;s:16:\"2015041452985250\";i:1;s:15:\"中国邮政EMS\";i:2;s:0:\"\";}}}', null);
INSERT INTO `car_b2c_order_log` VALUES ('27', '2015041555505648', '13', 'ert', '1429076423', 'order', 'creates', 'SUCCESS', 'a:1:{i:0;a:2:{s:7:\"txt_key\";s:21:\"订单创建成功！\";s:4:\"data\";a:0:{}}}', null);

-- ----------------------------
-- Table structure for car_b2c_order_objects
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_order_objects`;
CREATE TABLE `car_b2c_order_objects` (
  `obj_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单商品对象ID',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `obj_type` varchar(50) NOT NULL DEFAULT '' COMMENT '对象类型',
  `obj_alias` varchar(100) NOT NULL DEFAULT '' COMMENT '对象别名',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `bn` varchar(40) DEFAULT NULL COMMENT '品牌名',
  `name` varchar(200) DEFAULT NULL COMMENT '商品对象名字',
  `price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '商品对象单价',
  `amount` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '商品对象总金额',
  `quantity` float NOT NULL DEFAULT '1' COMMENT '商品对象购买量',
  `weight` mediumint(8) unsigned DEFAULT NULL COMMENT '总重量',
  `score` mediumint(8) unsigned DEFAULT NULL COMMENT '获得积分',
  PRIMARY KEY (`obj_id`),
  KEY `ind_obj_bn` (`bn`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_order_objects
-- ----------------------------
INSERT INTO `car_b2c_order_objects` VALUES ('7', '2015041153101991', 'goods', '商品区块', '10', '20150402010', '德国进口食品 劳仑兹薯片 清新咸味', '16.600', '0.000', '2', null, null);
INSERT INTO `car_b2c_order_objects` VALUES ('8', '2015041153101991', 'goods', '商品区块', '2', '20150402002', 'yum earth棒棒糖', '15.000', '0.000', '1', null, null);
INSERT INTO `car_b2c_order_objects` VALUES ('9', '2015041153535410', 'goods', '商品区块', '7', '20150402007', '进口柠檬5粒装', '16.900', '0.000', '1', null, null);
INSERT INTO `car_b2c_order_objects` VALUES ('10', '2015041153535410', 'goods', '商品区块', '9', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '147.000', '0.000', '1', null, null);
INSERT INTO `car_b2c_order_objects` VALUES ('11', '2015041150991015', 'goods', '商品区块', '9', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '147.000', '0.000', '1', null, null);
INSERT INTO `car_b2c_order_objects` VALUES ('12', '2015041148995452', 'goods', '商品区块', '9', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '147.000', '0.000', '1', null, null);
INSERT INTO `car_b2c_order_objects` VALUES ('13', '2015041298561005', 'goods', '商品区块', '10', '20150402010', '德国进口食品 劳仑兹薯片 清新咸味', '16.600', '0.000', '1', null, null);
INSERT INTO `car_b2c_order_objects` VALUES ('14', '2015041250499948', 'goods', '商品区块', '9', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '147.000', '0.000', '7', null, null);
INSERT INTO `car_b2c_order_objects` VALUES ('15', '2015041250519757', 'goods', '商品区块', '8', '20150402008', '精品赣南橙子3粒装（单粒230g以上）', '15.900', '0.000', '1', null, null);
INSERT INTO `car_b2c_order_objects` VALUES ('16', '2015041250519757', 'goods', '商品区块', '9', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '147.000', '0.000', '4', null, null);
INSERT INTO `car_b2c_order_objects` VALUES ('17', '2015041452985250', 'goods', '商品区块', '10', '20150402010', '德国进口食品 劳仑兹薯片 清新咸味', '16.600', '0.000', '2', null, null);
INSERT INTO `car_b2c_order_objects` VALUES ('18', '2015041555505648', 'goods', '商品区块', '9', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '147.000', '0.000', '1', null, null);

-- ----------------------------
-- Table structure for car_b2c_order_pmt
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_order_pmt`;
CREATE TABLE `car_b2c_order_pmt` (
  `pmt_id` int(8) NOT NULL COMMENT '促销规则id',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单id',
  `product_id` mediumint(8) unsigned DEFAULT NULL COMMENT '商品ID',
  `pmt_type` enum('order','goods','coupon') NOT NULL DEFAULT 'goods' COMMENT '优惠规则类型',
  `pmt_amount` decimal(20,3) NOT NULL DEFAULT '0.000',
  `pmt_tag` longtext,
  `pmt_memo` longtext,
  `pmt_describe` longtext,
  PRIMARY KEY (`pmt_id`,`order_id`,`pmt_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_order_pmt
-- ----------------------------

-- ----------------------------
-- Table structure for car_b2c_products
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_products`;
CREATE TABLE `car_b2c_products` (
  `product_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '货品ID',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `barcode` varchar(128) DEFAULT NULL COMMENT '条码',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `bn` varchar(30) DEFAULT NULL COMMENT '货号',
  `price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '销售价格',
  `cost` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '成本价',
  `mktprice` decimal(20,3) DEFAULT NULL COMMENT '市场价',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '货品名称',
  `weight` decimal(20,3) DEFAULT NULL COMMENT '单位重量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `store` mediumint(8) unsigned DEFAULT '0' COMMENT '库存',
  `store_place` varchar(255) DEFAULT NULL COMMENT '库位',
  `freez` mediumint(8) unsigned DEFAULT NULL COMMENT '冻结库存',
  `goods_type` enum('normal','bind','gift') NOT NULL DEFAULT 'normal' COMMENT '销售类型',
  `spec_info` varchar(30) DEFAULT NULL COMMENT '规格名称',
  `spec_desc` varchar(30) DEFAULT NULL COMMENT '规格值,序列化',
  `is_default` enum('true','false') NOT NULL DEFAULT 'false',
  `qrcode_image_id` varchar(32) DEFAULT NULL COMMENT '二维码图片ID',
  `uptime` int(10) unsigned DEFAULT NULL COMMENT '录入时间',
  `last_modify` int(10) unsigned DEFAULT NULL COMMENT '最后修改时间',
  `disabled` enum('true','false') DEFAULT 'false',
  `marketable` enum('true','false') NOT NULL DEFAULT 'true' COMMENT '上架',
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `ind_bn` (`bn`),
  KEY `ind_goods_id` (`goods_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_barcode` (`barcode`),
  KEY `idx_goods_type` (`goods_type`),
  KEY `idx_store` (`store`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_products
-- ----------------------------
INSERT INTO `car_b2c_products` VALUES ('7', '1', null, null, '20150402001', '25.000', '15.000', '28.000', '德国进口牛奶 欧德堡全脂牛奶1L装', '14.000', '瓶', null, null, '0', 'normal', null, null, 'true', null, '1427956676', null, 'false', 'true');
INSERT INTO `car_b2c_products` VALUES ('8', '2', null, null, '20150402002', '15.000', '10.000', '25.000', 'yum earth棒棒糖', '15.000', '瓶', '300', null, '1', 'normal', null, null, 'true', null, '1427956900', null, 'false', 'true');
INSERT INTO `car_b2c_products` VALUES ('9', '3', null, null, '20150402003', '129.000', '100.000', '140.000', '法国进口 皮埃尔虞埃 昂日地区半干型苹果酒750ml', '1350.000', '瓶', '200', null, '0', 'normal', null, null, 'true', null, '1427979015', null, 'false', 'true');
INSERT INTO `car_b2c_products` VALUES ('10', '4', null, null, '20150402004', '109.000', '90.000', '120.000', '法国进口 科瑞萨干型苹果酒750ml', '1350.000', '瓶', '200', null, '0', 'normal', null, null, 'true', null, '1427979153', null, 'false', 'true');
INSERT INTO `car_b2c_products` VALUES ('11', '5', null, null, '20150402005', '150.000', '120.000', '180.000', '牙买加进口 摩根船长朗姆酒 700ml', '1200.000', '瓶', '200', null, '0', 'normal', null, null, 'true', null, '1427979308', null, 'false', 'true');
INSERT INTO `car_b2c_products` VALUES ('12', '6', null, null, '20150402006', '20.000', '15.000', '25.000', '土气和 绿色食品 五谷杂粮 莲子 280g', '350.000', '袋', '1000', null, '0', 'normal', null, null, 'true', null, '1427979414', null, 'false', 'true');
INSERT INTO `car_b2c_products` VALUES ('13', '7', null, null, '20150402007', '16.900', '12.000', '20.000', '进口柠檬5粒装', '400.000', '个', '200', null, '1', 'normal', null, null, 'true', null, '1427979623', null, 'false', 'true');
INSERT INTO `car_b2c_products` VALUES ('14', '8', null, null, '20150402008', '15.900', '20.000', '25.000', '精品赣南橙子3粒装（单粒230g以上）', '750.000', '克', '200', null, '0', 'normal', null, null, 'true', null, '1427979714', null, 'false', 'true');
INSERT INTO `car_b2c_products` VALUES ('15', '9', null, null, '20150402009', '147.000', '100.000', '180.000', '新西兰进口猕猴桃30/33/36（单果80g以上）', '1500.000', '克', '198', null, '2', 'normal', null, null, 'true', null, '1427979795', null, 'false', 'true');
INSERT INTO `car_b2c_products` VALUES ('16', '10', null, null, '20150402010', '16.600', '10.000', '18.000', '德国进口食品 劳仑兹薯片 清新咸味', '150.000', '袋', '197', null, '3', 'normal', null, null, 'true', null, '1427979873', '1429061862', 'true', 'true');
INSERT INTO `car_b2c_products` VALUES ('17', '10', null, null, '2015040201d0', '16.600', '10.000', '18.000', '德国进口食品 劳仑兹薯片 清新咸味', '150.000', '袋', '0', null, '0', 'normal', 'fsdafdsaf:fdsa', '1,1', 'true', null, '1428976629', '1429061862', 'false', 'true');

-- ----------------------------
-- Table structure for car_b2c_reship
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_reship`;
CREATE TABLE `car_b2c_reship` (
  `reship_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '配送流水号',
  `order_id` varchar(100) DEFAULT NULL COMMENT '订单号',
  `reship_bn` varchar(32) DEFAULT NULL COMMENT '退货流水号',
  `member_id` mediumint(8) unsigned DEFAULT NULL COMMENT '订货会员ID',
  `money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '配送费用',
  `is_protect` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '是否保价',
  `delivery` varchar(20) DEFAULT NULL COMMENT '配送方式(货到付款、EMS...)',
  `logi_id` varchar(50) DEFAULT NULL COMMENT '物流公司ID',
  `logi_name` varchar(100) DEFAULT NULL COMMENT '物流公司名称',
  `logi_no` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `ship_name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `ship_area` varchar(255) DEFAULT NULL COMMENT '收货人地区',
  `ship_addr` text COMMENT '收货人地址',
  `ship_zip` varchar(20) DEFAULT NULL COMMENT '收货人邮编',
  `ship_tel` varchar(50) DEFAULT NULL COMMENT '收货人电话',
  `ship_mobile` varchar(50) DEFAULT NULL COMMENT '收货人手机',
  `ship_email` varchar(200) DEFAULT NULL COMMENT '收货人Email',
  `t_begin` int(10) unsigned DEFAULT NULL COMMENT '单据生成时间',
  `t_send` int(10) unsigned DEFAULT NULL COMMENT '单据结束时间',
  `t_confirm` int(10) unsigned DEFAULT NULL COMMENT '确认时间',
  `op_name` varchar(50) DEFAULT NULL COMMENT '操作者',
  `status` enum('succ','failed','cancel','lost','progress','timeout','ready') NOT NULL DEFAULT 'ready' COMMENT '状态',
  `memo` longtext COMMENT '备注',
  `disabled` enum('true','false') DEFAULT 'false' COMMENT '无效',
  PRIMARY KEY (`reship_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_logi_no` (`logi_no`)
) ENGINE=InnoDB AUTO_INCREMENT=142906538910098566 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_reship
-- ----------------------------
INSERT INTO `car_b2c_reship` VALUES ('142881660610148100', '2015041150991015', null, '1', '0.000', 'false', '1', '1', '中国邮政EMS', '123456789', '54354334', 'mainland:上海/上海市/卢湾区:24', '上海上海市卢湾区rwerew', '53543', '53543', '5323454343', null, '1428816606', '1428816606', '1428816606', 'admin', 'succ', null, 'false');
INSERT INTO `car_b2c_reship` VALUES ('142906538910098565', '2015041452985250', null, '13', '0.000', 'false', '1', '1', '中国邮政EMS', null, 'ert', 'mainland:北京/北京市/西城区:4', '北京北京市西城区ertert', 'ert', 'ert', 'ert', null, '1429065389', '1429065389', '1429065389', 'admin', 'succ', null, 'false');

-- ----------------------------
-- Table structure for car_b2c_reship_items
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_reship_items`;
CREATE TABLE `car_b2c_reship_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '发/退货单明细ID',
  `reship_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发/退货单ID',
  `order_item_id` mediumint(8) unsigned DEFAULT '0' COMMENT '订单明细ID',
  `item_type` enum('goods','gift','pkg','adjunct') NOT NULL DEFAULT 'goods' COMMENT '退/换货商品类型',
  `product_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '货品ID',
  `product_bn` varchar(30) DEFAULT NULL COMMENT '货品品牌名',
  `product_name` varchar(200) DEFAULT NULL COMMENT '货品名',
  `number` float NOT NULL DEFAULT '0' COMMENT '退/换货数量',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_reship_items
-- ----------------------------
INSERT INTO `car_b2c_reship_items` VALUES ('4', '142881652510099535', '16777215', 'goods', '15', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '1');
INSERT INTO `car_b2c_reship_items` VALUES ('5', '142881657299535610', '16777215', 'goods', '15', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '1');
INSERT INTO `car_b2c_reship_items` VALUES ('6', '142881660610148100', '16777215', 'goods', '15', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '1');
INSERT INTO `car_b2c_reship_items` VALUES ('7', '142883947450489957', '16777215', 'goods', '15', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '7');
INSERT INTO `car_b2c_reship_items` VALUES ('8', '142891091652575253', '16777215', 'goods', '16', '20150402010', '德国进口食品 劳仑兹薯片 清新咸味', '1');
INSERT INTO `car_b2c_reship_items` VALUES ('9', '142900310953555552', '16777215', 'goods', '14', '20150402008', '精品赣南橙子3粒装（单粒230g以上）', '1');
INSERT INTO `car_b2c_reship_items` VALUES ('10', '142900310953555552', '16777215', 'goods', '15', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', '4');
INSERT INTO `car_b2c_reship_items` VALUES ('11', '142906468510054484', '16777215', 'goods', '16', '20150402010', '德国进口食品 劳仑兹薯片 清新咸味', '2');
INSERT INTO `car_b2c_reship_items` VALUES ('12', '142906538910098565', '16777215', 'goods', '16', '20150402010', '德国进口食品 劳仑兹薯片 清新咸味', '2');

-- ----------------------------
-- Table structure for car_b2c_specification
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_specification`;
CREATE TABLE `car_b2c_specification` (
  `spec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `spec_name` varchar(50) NOT NULL DEFAULT '' COMMENT '规格名称',
  `spec_show_type` enum('select','flat') NOT NULL DEFAULT 'flat' COMMENT '显示方式',
  `spec_type` enum('text','image') NOT NULL DEFAULT 'text' COMMENT '类型',
  `spec_memo` varchar(50) NOT NULL DEFAULT '' COMMENT '规格备注',
  `p_order` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `disabled` enum('true','false') NOT NULL DEFAULT 'false',
  `alias` varchar(255) DEFAULT '' COMMENT '规格别名',
  PRIMARY KEY (`spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_specification
-- ----------------------------
INSERT INTO `car_b2c_specification` VALUES ('1', 'fsdafdsaf', 'select', 'text', 'dafdas', '0', 'false', 'fad');
INSERT INTO `car_b2c_specification` VALUES ('2', 'T1', 'flat', 'text', 'T1', '0', 'false', 'T1');
INSERT INTO `car_b2c_specification` VALUES ('3', '11', 'flat', 'image', '1', '0', 'false', '1');

-- ----------------------------
-- Table structure for car_b2c_spec_values
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_spec_values`;
CREATE TABLE `car_b2c_spec_values` (
  `spec_value_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格值ID',
  `spec_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '规格ID',
  `spec_value` varchar(100) NOT NULL DEFAULT '' COMMENT '规格值',
  `alias` varchar(255) DEFAULT '' COMMENT '规格别名',
  `spec_image` char(32) DEFAULT '' COMMENT '规格图片',
  `p_order` mediumint(8) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`spec_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_spec_values
-- ----------------------------
INSERT INTO `car_b2c_spec_values` VALUES ('1', '1', 'fdsa', 'fdaf', '', '1');
INSERT INTO `car_b2c_spec_values` VALUES ('2', '2', 'T1-1', 'T1-1', '', '1');
INSERT INTO `car_b2c_spec_values` VALUES ('3', '2', 'T1-2', 'T1-2', '', '2');
INSERT INTO `car_b2c_spec_values` VALUES ('4', '3', '1', '1', '', '1');

-- ----------------------------
-- Table structure for car_b2c_type_brand
-- ----------------------------
DROP TABLE IF EXISTS `car_b2c_type_brand`;
CREATE TABLE `car_b2c_type_brand` (
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品类型ID',
  `brand_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `brand_order` mediumint(8) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`type_id`,`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_b2c_type_brand
-- ----------------------------
INSERT INTO `car_b2c_type_brand` VALUES ('3', '1', null);
INSERT INTO `car_b2c_type_brand` VALUES ('3', '2', null);
INSERT INTO `car_b2c_type_brand` VALUES ('3', '3', null);

-- ----------------------------
-- Table structure for car_ectools_order_bills
-- ----------------------------
DROP TABLE IF EXISTS `car_ectools_order_bills`;
CREATE TABLE `car_ectools_order_bills` (
  `rel_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bill_type` enum('payments','refunds') NOT NULL DEFAULT 'payments' COMMENT '单据类型',
  `pay_object` enum('order','recharge','joinfee','prepaid_recharge') NOT NULL DEFAULT 'order' COMMENT '支付类型',
  `bill_id` varchar(20) NOT NULL COMMENT '关联退款/付款单号',
  `money` decimal(20,3) DEFAULT NULL COMMENT '金额',
  PRIMARY KEY (`rel_id`,`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_ectools_order_bills
-- ----------------------------
INSERT INTO `car_ectools_order_bills` VALUES ('2015041148995452', 'payments', 'order', '142876582953511019', '157.000');
INSERT INTO `car_ectools_order_bills` VALUES ('2015041150991015', 'payments', 'order', '142876734650505749', '157.000');
INSERT INTO `car_ectools_order_bills` VALUES ('2015041250499948', 'payments', 'order', '142881538557975550', '1039.000');
INSERT INTO `car_ectools_order_bills` VALUES ('2015041250499948', 'refunds', 'order', '142881547010152100', '1039.000');
INSERT INTO `car_ectools_order_bills` VALUES ('2015041298561005', 'payments', 'order', '142881664553535548', '26.600');
INSERT INTO `car_ectools_order_bills` VALUES ('2015041452985250', 'payments', 'order', '142899253998531015', '43.200');

-- ----------------------------
-- Table structure for car_ectools_payments
-- ----------------------------
DROP TABLE IF EXISTS `car_ectools_payments`;
CREATE TABLE `car_ectools_payments` (
  `payment_id` varchar(20) NOT NULL DEFAULT '' COMMENT '支付单号',
  `money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '支付金额',
  `cur_money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '支付货币金额',
  `member_id` varchar(100) DEFAULT NULL COMMENT '会员用户名',
  `status` enum('succ','failed','cancel','error','invalid','progress','timeout','ready') NOT NULL DEFAULT 'ready' COMMENT '支付状态',
  `pay_name` varchar(100) DEFAULT NULL,
  `pay_type` enum('online','offline','deposit') NOT NULL DEFAULT 'online' COMMENT '支付类型',
  `t_payed` int(10) unsigned DEFAULT NULL COMMENT '支付完成时间',
  `op_id` mediumint(8) unsigned DEFAULT NULL COMMENT '操作员',
  `payment_bn` varchar(32) DEFAULT '' COMMENT '支付单唯一编号',
  `account` varchar(50) DEFAULT NULL COMMENT '收款账号',
  `bank` varchar(50) DEFAULT NULL COMMENT '收款银行',
  `pay_account` varchar(50) DEFAULT NULL COMMENT '支付账户',
  `currency` varchar(10) DEFAULT NULL COMMENT '货币',
  `paycost` decimal(20,3) DEFAULT NULL COMMENT '支付网关费用',
  `pay_app_id` varchar(100) NOT NULL DEFAULT '0' COMMENT '支付方式名称',
  `pay_ver` varchar(50) DEFAULT NULL COMMENT '支付版本号',
  `ip` varchar(20) DEFAULT NULL COMMENT '支付IP',
  `t_begin` int(10) unsigned DEFAULT NULL COMMENT '支付开始时间',
  `t_confirm` int(10) unsigned DEFAULT NULL COMMENT '支付确认时间',
  `memo` longtext COMMENT '支付注释',
  `return_url` varchar(100) DEFAULT NULL COMMENT '支付返回地址',
  `disabled` enum('true','false') DEFAULT 'false' COMMENT '支付单状态',
  `trade_no` varchar(30) DEFAULT NULL COMMENT '支付单交易编号',
  `thirdparty_account` varchar(50) DEFAULT '' COMMENT '第三方支付账户',
  PRIMARY KEY (`payment_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_ectools_payments
-- ----------------------------
INSERT INTO `car_ectools_payments` VALUES ('142876582953511019', '157.000', '157.000', '1', 'succ', '支付宝', 'online', '1428765829', '1', '142876582953535055', '123456789', 'yiishop支付宝', '测试', 'CNY', null, '1', null, null, '1428765829', '1428765829', '请财务尽快查收', null, 'false', '2015041148995452', '');
INSERT INTO `car_ectools_payments` VALUES ('142876734650505749', '157.000', '157.000', '1', 'succ', '支付宝', 'online', '1428767346', '1', '142876734650515257', '123456789', 'yiishop支付宝', '测试', 'CNY', null, '1', null, null, '1428767346', '1428767346', '请尽快发货', null, 'false', '2015041150991015', '');
INSERT INTO `car_ectools_payments` VALUES ('142881538557975550', '1039.000', '1039.000', '1', 'succ', '支付宝', 'online', '1428815385', '1', '142881538557975555', '123456', 'yiishop支付宝', '测试', 'CNY', null, '1', null, null, '1428815385', '1428815385', '尽快发货', null, 'false', '2015041250499948', '');
INSERT INTO `car_ectools_payments` VALUES ('142881664553535548', '26.600', '26.600', '1', 'succ', '支付宝', 'online', '1428816645', '1', '142881664553545510', '123456', 'yiishop支付宝', 'fdsa ', 'CNY', null, '1', null, null, '1428816645', '1428816645', '发的萨菲', null, 'false', '2015041298561005', '');
INSERT INTO `car_ectools_payments` VALUES ('142899253998531015', '43.200', '43.200', '13', 'succ', '支付宝', 'online', '1428992539', '1', '142899253998531015', '1111111', '1111111', '1111', 'CNY', null, '1', null, null, '1428992539', '1428992539', null, null, 'false', '2015041452985250', '');

-- ----------------------------
-- Table structure for car_ectools_refunds
-- ----------------------------
DROP TABLE IF EXISTS `car_ectools_refunds`;
CREATE TABLE `car_ectools_refunds` (
  `refund_id` varchar(20) NOT NULL DEFAULT '' COMMENT '退款单号',
  `money` decimal(20,3) NOT NULL DEFAULT '0.000',
  `cur_money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '支付金额',
  `member_id` varchar(100) DEFAULT NULL COMMENT '会员用户名',
  `account` varchar(50) DEFAULT NULL COMMENT '收款账号',
  `bank` varchar(50) DEFAULT NULL COMMENT '收款银行',
  `pay_account` varchar(50) DEFAULT NULL COMMENT '支付账户',
  `currency` varchar(10) DEFAULT NULL COMMENT '货币',
  `paycost` decimal(20,3) DEFAULT NULL COMMENT '支付网关费用',
  `pay_type` enum('online','offline','deposit') NOT NULL DEFAULT 'online' COMMENT '支付类型',
  `status` enum('succ','failed','cancel','error','invalid','progress','timeout','ready') NOT NULL DEFAULT 'ready' COMMENT '支付状态',
  `pay_name` varchar(100) DEFAULT NULL,
  `pay_ver` varchar(50) DEFAULT NULL COMMENT '支付版本号',
  `op_id` mediumint(8) unsigned DEFAULT NULL COMMENT '操作员',
  `refund_bn` varchar(32) DEFAULT '' COMMENT '退款唯一单号',
  `pay_app_id` varchar(100) NOT NULL DEFAULT '0' COMMENT '支付方式',
  `t_begin` int(10) unsigned DEFAULT NULL COMMENT '支付开始时间',
  `t_payed` int(10) unsigned DEFAULT NULL COMMENT '支付完成时间',
  `t_confirm` int(10) unsigned DEFAULT NULL COMMENT '支付确认时间',
  `memo` longtext COMMENT '备注',
  `disabled` enum('true','false') DEFAULT 'false',
  `trade_no` varchar(30) DEFAULT NULL COMMENT '退款单交易编号',
  PRIMARY KEY (`refund_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_ectools_refunds
-- ----------------------------
INSERT INTO `car_ectools_refunds` VALUES ('142881547010152100', '1039.000', '1039.000', '1', '1234567', '客户支付宝', 'yiishop商城', 'CNY', null, 'online', 'succ', '支付宝', '1.0', '1', '', '1', '1428815470', '1428815470', '1428815470', '退款', 'false', '2015041250499948');

-- ----------------------------
-- Table structure for car_ectools_regions
-- ----------------------------
DROP TABLE IF EXISTS `car_ectools_regions`;
CREATE TABLE `car_ectools_regions` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '区域序号',
  `local_name` varchar(50) NOT NULL DEFAULT '' COMMENT '地区名称',
  `package` varchar(20) NOT NULL DEFAULT '' COMMENT '地区包的类别, 中国/外国等. 中国大陆的编号目前为mainland',
  `p_region_id` int(10) unsigned DEFAULT NULL COMMENT '上一级地区的序号',
  `region_path` varchar(255) DEFAULT NULL COMMENT '序号层级排列结构',
  `region_grade` mediumint(8) unsigned DEFAULT NULL COMMENT '地区层级',
  `p_1` varchar(50) DEFAULT NULL COMMENT '额外参数1',
  `p_2` varchar(50) DEFAULT NULL COMMENT '额外参数2',
  `ordernum` mediumint(8) unsigned DEFAULT NULL COMMENT '排序',
  `disabled` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `ind_p_regions_id` (`p_region_id`,`region_grade`,`local_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3267 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_ectools_regions
-- ----------------------------
INSERT INTO `car_ectools_regions` VALUES ('1', '北京', 'mainland', null, ',1,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('2', '北京市', 'mainland', '1', ',1,2,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3', '东城区', 'mainland', '2', ',1,2,3,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('4', '西城区', 'mainland', '2', ',1,2,4,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('5', '崇文区', 'mainland', '2', ',1,2,5,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('6', '宣武区', 'mainland', '2', ',1,2,6,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('7', '朝阳区', 'mainland', '2', ',1,2,7,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('8', '丰台区', 'mainland', '2', ',1,2,8,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('9', '石景山区', 'mainland', '2', ',1,2,9,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('10', '海淀区', 'mainland', '2', ',1,2,10,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('11', '门头沟区', 'mainland', '2', ',1,2,11,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('12', '房山区', 'mainland', '2', ',1,2,12,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('13', '通州区', 'mainland', '2', ',1,2,13,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('14', '顺义区', 'mainland', '2', ',1,2,14,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('15', '昌平区', 'mainland', '2', ',1,2,15,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('16', '大兴区', 'mainland', '2', ',1,2,16,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('17', '怀柔区', 'mainland', '2', ',1,2,17,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('18', '平谷区', 'mainland', '2', ',1,2,18,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('19', '密云县', 'mainland', '2', ',1,2,19,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('20', '延庆县', 'mainland', '2', ',1,2,20,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('21', '上海', 'mainland', null, ',21,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('22', '上海市', 'mainland', '21', ',21,22,', '2', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('23', '黄浦区', 'mainland', '22', ',21,22,23,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('24', '卢湾区', 'mainland', '22', ',21,22,24,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('25', '徐汇区', 'mainland', '22', ',21,22,25,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('26', '长宁区', 'mainland', '22', ',21,22,26,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('27', '静安区', 'mainland', '22', ',21,22,27,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('28', '普陀区', 'mainland', '22', ',21,22,28,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('29', '闸北区', 'mainland', '22', ',21,22,29,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('30', '虹口区', 'mainland', '22', ',21,22,30,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('31', '杨浦区', 'mainland', '22', ',21,22,31,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('32', '闵行区', 'mainland', '22', ',21,22,32,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('33', '宝山区', 'mainland', '22', ',21,22,33,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('34', '嘉定区', 'mainland', '22', ',21,22,34,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('35', '浦东新区', 'mainland', '22', ',21,22,35,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('36', '金山区', 'mainland', '22', ',21,22,36,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('37', '松江区', 'mainland', '22', ',21,22,37,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('38', '青浦区', 'mainland', '22', ',21,22,38,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('39', '南汇区', 'mainland', '22', ',21,22,39,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('40', '奉贤区', 'mainland', '22', ',21,22,40,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('41', '崇明县', 'mainland', '22', ',21,22,41,', '3', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('42', '天津', 'mainland', null, ',42,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('43', '天津市', 'mainland', '42', ',42,43,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('44', '和平区', 'mainland', '43', ',42,43,44,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('45', '河东区', 'mainland', '43', ',42,43,45,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('46', '河西区', 'mainland', '43', ',42,43,46,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('47', '南开区', 'mainland', '43', ',42,43,47,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('48', '河北区', 'mainland', '43', ',42,43,48,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('49', '红桥区', 'mainland', '43', ',42,43,49,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('50', '塘沽区', 'mainland', '43', ',42,43,50,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('51', '汉沽区', 'mainland', '43', ',42,43,51,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('52', '大港区', 'mainland', '43', ',42,43,52,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('53', '东丽区', 'mainland', '43', ',42,43,53,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('54', '西青区', 'mainland', '43', ',42,43,54,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('55', '津南区', 'mainland', '43', ',42,43,55,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('56', '北辰区', 'mainland', '43', ',42,43,56,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('57', '武清区', 'mainland', '43', ',42,43,57,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('58', '宝坻区', 'mainland', '43', ',42,43,58,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('59', '宁河县', 'mainland', '43', ',42,43,59,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('60', '静海县', 'mainland', '43', ',42,43,60,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('61', '蓟县', 'mainland', '43', ',42,43,61,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('62', '重庆', 'mainland', null, ',62,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('63', '重庆市', 'mainland', '62', ',62,63,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('64', '万州区', 'mainland', '63', ',62,63,64,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('65', '涪陵区', 'mainland', '63', ',62,63,65,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('66', '渝中区', 'mainland', '63', ',62,63,66,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('67', '大渡口区', 'mainland', '63', ',62,63,67,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('68', '江北区', 'mainland', '63', ',62,63,68,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('69', '沙坪坝区', 'mainland', '63', ',62,63,69,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('70', '九龙坡区', 'mainland', '63', ',62,63,70,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('71', '南岸区', 'mainland', '63', ',62,63,71,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('72', '北碚区', 'mainland', '63', ',62,63,72,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('73', '万盛区', 'mainland', '63', ',62,63,73,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('74', '双桥区', 'mainland', '63', ',62,63,74,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('75', '渝北区', 'mainland', '63', ',62,63,75,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('76', '巴南区', 'mainland', '63', ',62,63,76,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('77', '黔江区', 'mainland', '63', ',62,63,77,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('78', '长寿区', 'mainland', '63', ',62,63,78,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('79', '綦江县', 'mainland', '63', ',62,63,79,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('80', '潼南县', 'mainland', '63', ',62,63,80,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('81', '铜梁县', 'mainland', '63', ',62,63,81,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('82', '大足县', 'mainland', '63', ',62,63,82,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('83', '荣昌县', 'mainland', '63', ',62,63,83,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('84', '璧山县', 'mainland', '63', ',62,63,84,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('85', '梁平县', 'mainland', '63', ',62,63,85,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('86', '城口县', 'mainland', '63', ',62,63,86,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('87', '丰都县', 'mainland', '63', ',62,63,87,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('88', '垫江县', 'mainland', '63', ',62,63,88,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('89', '武隆县', 'mainland', '63', ',62,63,89,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('90', '忠县', 'mainland', '63', ',62,63,90,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('91', '开县', 'mainland', '63', ',62,63,91,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('92', '云阳县', 'mainland', '63', ',62,63,92,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('93', '奉节县', 'mainland', '63', ',62,63,93,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('94', '巫山县', 'mainland', '63', ',62,63,94,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('95', '巫溪县', 'mainland', '63', ',62,63,95,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('96', '石柱土家族自治县', 'mainland', '63', ',62,63,96,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('97', '秀山土家族苗族自治县', 'mainland', '63', ',62,63,97,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('98', '酉阳土家族苗族自治县', 'mainland', '63', ',62,63,98,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('99', '彭水苗族土家族自治县', 'mainland', '63', ',62,63,99,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('100', '江津市', 'mainland', '63', ',62,63,100,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('101', '合川市', 'mainland', '63', ',62,63,101,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('102', '永川市', 'mainland', '63', ',62,63,102,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('103', '南川市', 'mainland', '63', ',62,63,103,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('104', '安徽', 'mainland', null, ',104,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('105', '合肥市', 'mainland', '104', ',104,105,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('106', '瑶海区', 'mainland', '105', ',104,105,106,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('107', '庐阳区', 'mainland', '105', ',104,105,107,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('108', '蜀山区', 'mainland', '105', ',104,105,108,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('109', '包河区', 'mainland', '105', ',104,105,109,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('110', '长丰县', 'mainland', '105', ',104,105,110,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('111', '肥东县', 'mainland', '105', ',104,105,111,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('112', '肥西县', 'mainland', '105', ',104,105,112,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('113', '安庆市', 'mainland', '104', ',104,113,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('114', '迎江区', 'mainland', '113', ',104,113,114,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('115', '大观区', 'mainland', '113', ',104,113,115,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('116', '郊区', 'mainland', '113', ',104,113,116,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('117', '怀宁县', 'mainland', '113', ',104,113,117,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('118', '枞阳县', 'mainland', '113', ',104,113,118,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('119', '潜山县', 'mainland', '113', ',104,113,119,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('120', '太湖县', 'mainland', '113', ',104,113,120,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('121', '宿松县', 'mainland', '113', ',104,113,121,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('122', '望江县', 'mainland', '113', ',104,113,122,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('123', '岳西县', 'mainland', '113', ',104,113,123,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('124', '桐城市', 'mainland', '113', ',104,113,124,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('125', '蚌埠市', 'mainland', '104', ',104,125,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('126', '龙子湖区', 'mainland', '125', ',104,125,126,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('127', '蚌山区', 'mainland', '125', ',104,125,127,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('128', '禹会区', 'mainland', '125', ',104,125,128,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('129', '淮上区', 'mainland', '125', ',104,125,129,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('130', '怀远县', 'mainland', '125', ',104,125,130,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('131', '五河县', 'mainland', '125', ',104,125,131,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('132', '固镇县', 'mainland', '125', ',104,125,132,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('133', '亳州市', 'mainland', '104', ',104,133,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('134', '谯城区', 'mainland', '133', ',104,133,134,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('135', '涡阳县', 'mainland', '133', ',104,133,135,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('136', '蒙城县', 'mainland', '133', ',104,133,136,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('137', '利辛县', 'mainland', '133', ',104,133,137,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('138', '巢湖市', 'mainland', '104', ',104,138,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('139', '居巢区', 'mainland', '138', ',104,138,139,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('140', '庐江县', 'mainland', '138', ',104,138,140,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('141', '无为县', 'mainland', '138', ',104,138,141,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('142', '含山县', 'mainland', '138', ',104,138,142,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('143', '和县', 'mainland', '138', ',104,138,143,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('144', '池州市', 'mainland', '104', ',104,144,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('145', '贵池区', 'mainland', '144', ',104,144,145,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('146', '东至县', 'mainland', '144', ',104,144,146,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('147', '石台县', 'mainland', '144', ',104,144,147,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('148', '青阳县', 'mainland', '144', ',104,144,148,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('149', '滁州市', 'mainland', '104', ',104,149,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('150', '琅琊区', 'mainland', '149', ',104,149,150,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('151', '南谯区', 'mainland', '149', ',104,149,151,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('152', '来安县', 'mainland', '149', ',104,149,152,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('153', '全椒县', 'mainland', '149', ',104,149,153,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('154', '定远县', 'mainland', '149', ',104,149,154,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('155', '凤阳县', 'mainland', '149', ',104,149,155,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('156', '天长市', 'mainland', '149', ',104,149,156,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('157', '明光市', 'mainland', '149', ',104,149,157,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('158', '阜阳市', 'mainland', '104', ',104,158,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('159', '颍州区', 'mainland', '158', ',104,158,159,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('160', '颍东区', 'mainland', '158', ',104,158,160,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('161', '颍泉区', 'mainland', '158', ',104,158,161,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('162', '临泉县', 'mainland', '158', ',104,158,162,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('163', '太和县', 'mainland', '158', ',104,158,163,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('164', '阜南县', 'mainland', '158', ',104,158,164,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('165', '颍上县', 'mainland', '158', ',104,158,165,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('166', '界首市', 'mainland', '158', ',104,158,166,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('167', '淮北市', 'mainland', '104', ',104,167,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('168', '杜集区', 'mainland', '167', ',104,167,168,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('169', '相山区', 'mainland', '167', ',104,167,169,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('170', '烈山区', 'mainland', '167', ',104,167,170,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('171', '濉溪县', 'mainland', '167', ',104,167,171,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('172', '淮南市', 'mainland', '104', ',104,172,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('173', '大通区', 'mainland', '172', ',104,172,173,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('174', '田家庵区', 'mainland', '172', ',104,172,174,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('175', '谢家集区', 'mainland', '172', ',104,172,175,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('176', '八公山区', 'mainland', '172', ',104,172,176,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('177', '潘集区', 'mainland', '172', ',104,172,177,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('178', '凤台县', 'mainland', '172', ',104,172,178,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('179', '黄山市', 'mainland', '104', ',104,179,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('180', '屯溪区', 'mainland', '179', ',104,179,180,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('181', '黄山区', 'mainland', '179', ',104,179,181,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('182', '徽州区', 'mainland', '179', ',104,179,182,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('183', '歙县', 'mainland', '179', ',104,179,183,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('184', '休宁县', 'mainland', '179', ',104,179,184,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('185', '黟县', 'mainland', '179', ',104,179,185,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('186', '祁门县', 'mainland', '179', ',104,179,186,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('187', '六安市', 'mainland', '104', ',104,187,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('188', '金安区', 'mainland', '187', ',104,187,188,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('189', '裕安区', 'mainland', '187', ',104,187,189,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('190', '寿县', 'mainland', '187', ',104,187,190,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('191', '霍邱县', 'mainland', '187', ',104,187,191,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('192', '舒城县', 'mainland', '187', ',104,187,192,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('193', '金寨县', 'mainland', '187', ',104,187,193,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('194', '霍山县', 'mainland', '187', ',104,187,194,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('195', '马鞍山市', 'mainland', '104', ',104,195,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('196', '金家庄区', 'mainland', '195', ',104,195,196,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('197', '花山区', 'mainland', '195', ',104,195,197,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('198', '雨山区', 'mainland', '195', ',104,195,198,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('199', '当涂县', 'mainland', '195', ',104,195,199,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('200', '宿州市', 'mainland', '104', ',104,200,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('201', '墉桥区', 'mainland', '200', ',104,200,201,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('202', '砀山县', 'mainland', '200', ',104,200,202,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('203', '萧县', 'mainland', '200', ',104,200,203,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('204', '灵璧县', 'mainland', '200', ',104,200,204,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('205', '泗县', 'mainland', '200', ',104,200,205,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('206', '铜陵市', 'mainland', '104', ',104,206,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('207', '铜官山区', 'mainland', '206', ',104,206,207,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('208', '狮子山区', 'mainland', '206', ',104,206,208,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('209', '郊区', 'mainland', '206', ',104,206,209,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('210', '铜陵县', 'mainland', '206', ',104,206,210,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('211', '芜湖市', 'mainland', '104', ',104,211,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('212', '镜湖区', 'mainland', '211', ',104,211,212,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('213', '马塘区', 'mainland', '211', ',104,211,213,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('214', '新芜区', 'mainland', '211', ',104,211,214,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('215', '鸠江区', 'mainland', '211', ',104,211,215,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('216', '芜湖县', 'mainland', '211', ',104,211,216,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('217', '繁昌县', 'mainland', '211', ',104,211,217,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('218', '南陵县', 'mainland', '211', ',104,211,218,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('219', '宣城市', 'mainland', '104', ',104,219,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('220', '宣州区', 'mainland', '219', ',104,219,220,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('221', '郎溪县', 'mainland', '219', ',104,219,221,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('222', '广德县', 'mainland', '219', ',104,219,222,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('223', '泾县', 'mainland', '219', ',104,219,223,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('224', '绩溪县', 'mainland', '219', ',104,219,224,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('225', '旌德县', 'mainland', '219', ',104,219,225,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('226', '宁国市', 'mainland', '219', ',104,219,226,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('227', '福建', 'mainland', null, ',227,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('228', '福州市', 'mainland', '227', ',227,228,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('229', '鼓楼区', 'mainland', '228', ',227,228,229,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('230', '台江区', 'mainland', '228', ',227,228,230,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('231', '仓山区', 'mainland', '228', ',227,228,231,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('232', '马尾区', 'mainland', '228', ',227,228,232,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('233', '晋安区', 'mainland', '228', ',227,228,233,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('234', '闽侯县', 'mainland', '228', ',227,228,234,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('235', '连江县', 'mainland', '228', ',227,228,235,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('236', '罗源县', 'mainland', '228', ',227,228,236,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('237', '闽清县', 'mainland', '228', ',227,228,237,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('238', '永泰县', 'mainland', '228', ',227,228,238,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('239', '平潭县', 'mainland', '228', ',227,228,239,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('240', '福清市', 'mainland', '228', ',227,228,240,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('241', '长乐市', 'mainland', '228', ',227,228,241,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('242', '龙岩市', 'mainland', '227', ',227,242,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('243', '新罗区', 'mainland', '242', ',227,242,243,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('244', '长汀县', 'mainland', '242', ',227,242,244,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('245', '永定县', 'mainland', '242', ',227,242,245,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('246', '上杭县', 'mainland', '242', ',227,242,246,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('247', '武平县', 'mainland', '242', ',227,242,247,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('248', '连城县', 'mainland', '242', ',227,242,248,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('249', '漳平市', 'mainland', '242', ',227,242,249,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('250', '南平市', 'mainland', '227', ',227,250,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('251', '延平区', 'mainland', '250', ',227,250,251,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('252', '顺昌县', 'mainland', '250', ',227,250,252,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('253', '浦城县', 'mainland', '250', ',227,250,253,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('254', '光泽县', 'mainland', '250', ',227,250,254,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('255', '松溪县', 'mainland', '250', ',227,250,255,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('256', '政和县', 'mainland', '250', ',227,250,256,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('257', '邵武市', 'mainland', '250', ',227,250,257,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('258', '武夷山市', 'mainland', '250', ',227,250,258,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('259', '建瓯市', 'mainland', '250', ',227,250,259,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('260', '建阳市', 'mainland', '250', ',227,250,260,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('261', '宁德市', 'mainland', '227', ',227,261,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('262', '蕉城区', 'mainland', '261', ',227,261,262,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('263', '霞浦县', 'mainland', '261', ',227,261,263,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('264', '古田县', 'mainland', '261', ',227,261,264,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('265', '屏南县', 'mainland', '261', ',227,261,265,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('266', '寿宁县', 'mainland', '261', ',227,261,266,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('267', '周宁县', 'mainland', '261', ',227,261,267,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('268', '柘荣县', 'mainland', '261', ',227,261,268,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('269', '福安市', 'mainland', '261', ',227,261,269,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('270', '福鼎市', 'mainland', '261', ',227,261,270,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('271', '莆田市', 'mainland', '227', ',227,271,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('272', '城厢区', 'mainland', '271', ',227,271,272,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('273', '涵江区', 'mainland', '271', ',227,271,273,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('274', '荔城区', 'mainland', '271', ',227,271,274,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('275', '秀屿区', 'mainland', '271', ',227,271,275,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('276', '仙游县', 'mainland', '271', ',227,271,276,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('277', '泉州市', 'mainland', '227', ',227,277,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('278', '鲤城区', 'mainland', '277', ',227,277,278,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('279', '丰泽区', 'mainland', '277', ',227,277,279,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('280', '洛江区', 'mainland', '277', ',227,277,280,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('281', '泉港区', 'mainland', '277', ',227,277,281,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('282', '惠安县', 'mainland', '277', ',227,277,282,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('283', '安溪县', 'mainland', '277', ',227,277,283,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('284', '永春县', 'mainland', '277', ',227,277,284,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('285', '德化县', 'mainland', '277', ',227,277,285,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('286', '金门县', 'mainland', '277', ',227,277,286,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('287', '石狮市', 'mainland', '277', ',227,277,287,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('288', '晋江市', 'mainland', '277', ',227,277,288,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('289', '南安市', 'mainland', '277', ',227,277,289,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('290', '三明市', 'mainland', '227', ',227,290,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('291', '梅列区', 'mainland', '290', ',227,290,291,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('292', '三元区', 'mainland', '290', ',227,290,292,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('293', '明溪县', 'mainland', '290', ',227,290,293,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('294', '清流县', 'mainland', '290', ',227,290,294,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('295', '宁化县', 'mainland', '290', ',227,290,295,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('296', '大田县', 'mainland', '290', ',227,290,296,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('297', '尤溪县', 'mainland', '290', ',227,290,297,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('298', '沙县', 'mainland', '290', ',227,290,298,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('299', '将乐县', 'mainland', '290', ',227,290,299,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('300', '泰宁县', 'mainland', '290', ',227,290,300,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('301', '建宁县', 'mainland', '290', ',227,290,301,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('302', '永安市', 'mainland', '290', ',227,290,302,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('303', '厦门市', 'mainland', '227', ',227,303,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('304', '思明区', 'mainland', '303', ',227,303,304,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('305', '海沧区', 'mainland', '303', ',227,303,305,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('306', '湖里区', 'mainland', '303', ',227,303,306,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('307', '集美区', 'mainland', '303', ',227,303,307,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('308', '同安区', 'mainland', '303', ',227,303,308,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('309', '翔安区', 'mainland', '303', ',227,303,309,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('310', '漳州市', 'mainland', '227', ',227,310,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('311', '芗城区', 'mainland', '310', ',227,310,311,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('312', '龙文区', 'mainland', '310', ',227,310,312,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('313', '云霄县', 'mainland', '310', ',227,310,313,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('314', '漳浦县', 'mainland', '310', ',227,310,314,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('315', '诏安县', 'mainland', '310', ',227,310,315,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('316', '长泰县', 'mainland', '310', ',227,310,316,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('317', '东山县', 'mainland', '310', ',227,310,317,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('318', '南靖县', 'mainland', '310', ',227,310,318,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('319', '平和县', 'mainland', '310', ',227,310,319,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('320', '华安县', 'mainland', '310', ',227,310,320,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('321', '龙海市', 'mainland', '310', ',227,310,321,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('322', '甘肃', 'mainland', null, ',322,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('323', '兰州市', 'mainland', '322', ',322,323,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('324', '城关区', 'mainland', '323', ',322,323,324,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('325', '七里河区', 'mainland', '323', ',322,323,325,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('326', '西固区', 'mainland', '323', ',322,323,326,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('327', '安宁区', 'mainland', '323', ',322,323,327,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('328', '红古区', 'mainland', '323', ',322,323,328,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('329', '永登县', 'mainland', '323', ',322,323,329,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('330', '皋兰县', 'mainland', '323', ',322,323,330,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('331', '榆中县', 'mainland', '323', ',322,323,331,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('332', '白银市', 'mainland', '322', ',322,332,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('333', '白银区', 'mainland', '332', ',322,332,333,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('334', '平川区', 'mainland', '332', ',322,332,334,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('335', '靖远县', 'mainland', '332', ',322,332,335,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('336', '会宁县', 'mainland', '332', ',322,332,336,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('337', '景泰县', 'mainland', '332', ',322,332,337,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('338', '定西市', 'mainland', '322', ',322,338,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('339', '安定区', 'mainland', '338', ',322,338,339,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('340', '通渭县', 'mainland', '338', ',322,338,340,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('341', '陇西县', 'mainland', '338', ',322,338,341,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('342', '渭源县', 'mainland', '338', ',322,338,342,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('343', '临洮县', 'mainland', '338', ',322,338,343,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('344', '漳县', 'mainland', '338', ',322,338,344,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('345', '岷县', 'mainland', '338', ',322,338,345,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('346', '甘南藏族自治州', 'mainland', '322', ',322,346,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('347', '合作市', 'mainland', '346', ',322,346,347,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('348', '临潭县', 'mainland', '346', ',322,346,348,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('349', '卓尼县', 'mainland', '346', ',322,346,349,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('350', '舟曲县', 'mainland', '346', ',322,346,350,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('351', '迭部县', 'mainland', '346', ',322,346,351,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('352', '玛曲县', 'mainland', '346', ',322,346,352,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('353', '碌曲县', 'mainland', '346', ',322,346,353,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('354', '夏河县', 'mainland', '346', ',322,346,354,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('355', '嘉峪关市', 'mainland', '322', ',322,355,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('356', '金昌市', 'mainland', '322', ',322,356,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('357', '金川区', 'mainland', '356', ',322,356,357,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('358', '永昌县', 'mainland', '356', ',322,356,358,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('359', '酒泉市', 'mainland', '322', ',322,359,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('360', '肃州区', 'mainland', '359', ',322,359,360,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('361', '金塔县', 'mainland', '359', ',322,359,361,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('362', '安西县', 'mainland', '359', ',322,359,362,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('363', '肃北蒙古族自治县', 'mainland', '359', ',322,359,363,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('364', '阿克塞哈萨克族自治县', 'mainland', '359', ',322,359,364,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('365', '玉门市', 'mainland', '359', ',322,359,365,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('366', '敦煌市', 'mainland', '359', ',322,359,366,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('367', '临夏回族自治州', 'mainland', '322', ',322,367,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('368', '临夏市', 'mainland', '367', ',322,367,368,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('369', '临夏县', 'mainland', '367', ',322,367,369,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('370', '康乐县', 'mainland', '367', ',322,367,370,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('371', '永靖县', 'mainland', '367', ',322,367,371,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('372', '广河县', 'mainland', '367', ',322,367,372,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('373', '和政县', 'mainland', '367', ',322,367,373,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('374', '东乡族自治县', 'mainland', '367', ',322,367,374,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('375', '积石山保安族东乡族撒拉族自治县', 'mainland', '367', ',322,367,375,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('376', '陇南市', 'mainland', '322', ',322,376,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('377', '武都区', 'mainland', '376', ',322,376,377,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('378', '成县', 'mainland', '376', ',322,376,378,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('379', '文县', 'mainland', '376', ',322,376,379,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('380', '宕昌县', 'mainland', '376', ',322,376,380,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('381', '康县', 'mainland', '376', ',322,376,381,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('382', '西和县', 'mainland', '376', ',322,376,382,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('383', '礼县', 'mainland', '376', ',322,376,383,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('384', '徽县', 'mainland', '376', ',322,376,384,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('385', '两当县', 'mainland', '376', ',322,376,385,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('386', '平凉市', 'mainland', '322', ',322,386,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('387', '崆峒区', 'mainland', '386', ',322,386,387,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('388', '泾川县', 'mainland', '386', ',322,386,388,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('389', '灵台县', 'mainland', '386', ',322,386,389,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('390', '崇信县', 'mainland', '386', ',322,386,390,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('391', '华亭县', 'mainland', '386', ',322,386,391,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('392', '庄浪县', 'mainland', '386', ',322,386,392,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('393', '静宁县', 'mainland', '386', ',322,386,393,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('394', '庆阳市', 'mainland', '322', ',322,394,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('395', '西峰区', 'mainland', '394', ',322,394,395,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('396', '庆城县', 'mainland', '394', ',322,394,396,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('397', '环县', 'mainland', '394', ',322,394,397,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('398', '华池县', 'mainland', '394', ',322,394,398,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('399', '合水县', 'mainland', '394', ',322,394,399,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('400', '正宁县', 'mainland', '394', ',322,394,400,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('401', '宁县', 'mainland', '394', ',322,394,401,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('402', '镇原县', 'mainland', '394', ',322,394,402,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('403', '天水市', 'mainland', '322', ',322,403,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('404', '秦城区', 'mainland', '403', ',322,403,404,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('405', '北道区', 'mainland', '403', ',322,403,405,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('406', '清水县', 'mainland', '403', ',322,403,406,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('407', '秦安县', 'mainland', '403', ',322,403,407,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('408', '甘谷县', 'mainland', '403', ',322,403,408,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('409', '武山县', 'mainland', '403', ',322,403,409,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('410', '张家川回族自治县', 'mainland', '403', ',322,403,410,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('411', '武威市', 'mainland', '322', ',322,411,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('412', '凉州区', 'mainland', '411', ',322,411,412,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('413', '民勤县', 'mainland', '411', ',322,411,413,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('414', '古浪县', 'mainland', '411', ',322,411,414,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('415', '天祝藏族自治县', 'mainland', '411', ',322,411,415,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('416', '张掖市', 'mainland', '322', ',322,416,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('417', '甘州区', 'mainland', '416', ',322,416,417,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('418', '肃南裕固族自治县', 'mainland', '416', ',322,416,418,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('419', '民乐县', 'mainland', '416', ',322,416,419,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('420', '临泽县', 'mainland', '416', ',322,416,420,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('421', '高台县', 'mainland', '416', ',322,416,421,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('422', '山丹县', 'mainland', '416', ',322,416,422,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('423', '广东', 'mainland', null, ',423,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('424', '广州市', 'mainland', '423', ',423,424,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('425', '东山区', 'mainland', '424', ',423,424,425,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('426', '荔湾区', 'mainland', '424', ',423,424,426,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('427', '越秀区', 'mainland', '424', ',423,424,427,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('428', '海珠区', 'mainland', '424', ',423,424,428,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('429', '天河区', 'mainland', '424', ',423,424,429,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('430', '芳村区', 'mainland', '424', ',423,424,430,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('431', '白云区', 'mainland', '424', ',423,424,431,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('432', '黄埔区', 'mainland', '424', ',423,424,432,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('433', '番禺区', 'mainland', '424', ',423,424,433,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('434', '花都区', 'mainland', '424', ',423,424,434,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('435', '增城市', 'mainland', '424', ',423,424,435,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('436', '从化市', 'mainland', '424', ',423,424,436,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('437', '潮州市', 'mainland', '423', ',423,437,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('438', '湘桥区', 'mainland', '437', ',423,437,438,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('439', '潮安县', 'mainland', '437', ',423,437,439,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('440', '饶平县', 'mainland', '437', ',423,437,440,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('441', '东莞市', 'mainland', '423', ',423,441,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('442', '佛山市', 'mainland', '423', ',423,442,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('443', '禅城区', 'mainland', '442', ',423,442,443,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('444', '南海区', 'mainland', '442', ',423,442,444,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('445', '顺德区', 'mainland', '442', ',423,442,445,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('446', '三水区', 'mainland', '442', ',423,442,446,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('447', '高明区', 'mainland', '442', ',423,442,447,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('448', '河源市', 'mainland', '423', ',423,448,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('449', '源城区', 'mainland', '448', ',423,448,449,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('450', '紫金县', 'mainland', '448', ',423,448,450,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('451', '龙川县', 'mainland', '448', ',423,448,451,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('452', '连平县', 'mainland', '448', ',423,448,452,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('453', '和平县', 'mainland', '448', ',423,448,453,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('454', '东源县', 'mainland', '448', ',423,448,454,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('455', '惠州市', 'mainland', '423', ',423,455,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('456', '惠城区', 'mainland', '455', ',423,455,456,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('457', '惠阳区', 'mainland', '455', ',423,455,457,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('458', '博罗县', 'mainland', '455', ',423,455,458,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('459', '惠东县', 'mainland', '455', ',423,455,459,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('460', '龙门县', 'mainland', '455', ',423,455,460,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('461', '江门市', 'mainland', '423', ',423,461,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('462', '蓬江区', 'mainland', '461', ',423,461,462,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('463', '江海区', 'mainland', '461', ',423,461,463,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('464', '新会区', 'mainland', '461', ',423,461,464,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('465', '台山市', 'mainland', '461', ',423,461,465,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('466', '开平市', 'mainland', '461', ',423,461,466,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('467', '鹤山市', 'mainland', '461', ',423,461,467,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('468', '恩平市', 'mainland', '461', ',423,461,468,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('469', '揭阳市', 'mainland', '423', ',423,469,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('470', '榕城区', 'mainland', '469', ',423,469,470,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('471', '揭东县', 'mainland', '469', ',423,469,471,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('472', '揭西县', 'mainland', '469', ',423,469,472,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('473', '惠来县', 'mainland', '469', ',423,469,473,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('474', '普宁市', 'mainland', '469', ',423,469,474,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('475', '茂名市', 'mainland', '423', ',423,475,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('476', '茂南区', 'mainland', '475', ',423,475,476,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('477', '茂港区', 'mainland', '475', ',423,475,477,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('478', '电白县', 'mainland', '475', ',423,475,478,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('479', '高州市', 'mainland', '475', ',423,475,479,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('480', '化州市', 'mainland', '475', ',423,475,480,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('481', '信宜市', 'mainland', '475', ',423,475,481,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('482', '梅江区', 'mainland', '423', ',423,482,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('483', '梅州市', 'mainland', '423', ',423,483,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('484', '梅县', 'mainland', '483', ',423,483,484,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('485', '大埔县', 'mainland', '483', ',423,483,485,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('486', '丰顺县', 'mainland', '483', ',423,483,486,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('487', '五华县', 'mainland', '483', ',423,483,487,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('488', '平远县', 'mainland', '483', ',423,483,488,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('489', '蕉岭县', 'mainland', '483', ',423,483,489,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('490', '兴宁市', 'mainland', '483', ',423,483,490,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('491', '清远市', 'mainland', '423', ',423,491,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('492', '清城区', 'mainland', '491', ',423,491,492,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('493', '佛冈县', 'mainland', '491', ',423,491,493,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('494', '阳山县', 'mainland', '491', ',423,491,494,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('495', '连山壮族瑶族自治县', 'mainland', '491', ',423,491,495,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('496', '连南瑶族自治县', 'mainland', '491', ',423,491,496,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('497', '清新县', 'mainland', '491', ',423,491,497,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('498', '英德市', 'mainland', '491', ',423,491,498,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('499', '连州市', 'mainland', '491', ',423,491,499,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('500', '汕头市', 'mainland', '423', ',423,500,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('501', '龙湖区', 'mainland', '500', ',423,500,501,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('502', '金平区', 'mainland', '500', ',423,500,502,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('503', '濠江区', 'mainland', '500', ',423,500,503,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('504', '潮阳区', 'mainland', '500', ',423,500,504,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('505', '潮南区', 'mainland', '500', ',423,500,505,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('506', '澄海区', 'mainland', '500', ',423,500,506,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('507', '南澳县', 'mainland', '500', ',423,500,507,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('508', '汕尾市', 'mainland', '423', ',423,508,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('509', '城区', 'mainland', '508', ',423,508,509,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('510', '海丰县', 'mainland', '508', ',423,508,510,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('511', '陆河县', 'mainland', '508', ',423,508,511,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('512', '陆丰市', 'mainland', '508', ',423,508,512,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('513', '韶关市', 'mainland', '423', ',423,513,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('514', '武江区', 'mainland', '513', ',423,513,514,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('515', '浈江区', 'mainland', '513', ',423,513,515,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('516', '曲江区', 'mainland', '513', ',423,513,516,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('517', '始兴县', 'mainland', '513', ',423,513,517,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('518', '仁化县', 'mainland', '513', ',423,513,518,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('519', '翁源县', 'mainland', '513', ',423,513,519,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('520', '乳源瑶族自治县', 'mainland', '513', ',423,513,520,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('521', '新丰县', 'mainland', '513', ',423,513,521,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('522', '乐昌市', 'mainland', '513', ',423,513,522,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('523', '南雄市', 'mainland', '513', ',423,513,523,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('524', '深圳市', 'mainland', '423', ',423,524,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('525', '罗湖区', 'mainland', '524', ',423,524,525,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('526', '福田区', 'mainland', '524', ',423,524,526,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('527', '南山区', 'mainland', '524', ',423,524,527,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('528', '宝安区', 'mainland', '524', ',423,524,528,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('529', '龙岗区', 'mainland', '524', ',423,524,529,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('530', '盐田区', 'mainland', '524', ',423,524,530,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('531', '阳江市', 'mainland', '423', ',423,531,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('532', '江城区', 'mainland', '531', ',423,531,532,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('533', '阳西县', 'mainland', '531', ',423,531,533,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('534', '阳东县', 'mainland', '531', ',423,531,534,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('535', '阳春市', 'mainland', '531', ',423,531,535,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('536', '云浮市', 'mainland', '423', ',423,536,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('537', '云城区', 'mainland', '536', ',423,536,537,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('538', '新兴县', 'mainland', '536', ',423,536,538,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('539', '郁南县', 'mainland', '536', ',423,536,539,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('540', '云安县', 'mainland', '536', ',423,536,540,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('541', '罗定市', 'mainland', '536', ',423,536,541,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('542', '湛江市', 'mainland', '423', ',423,542,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('543', '赤坎区', 'mainland', '542', ',423,542,543,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('544', '霞山区', 'mainland', '542', ',423,542,544,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('545', '坡头区', 'mainland', '542', ',423,542,545,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('546', '麻章区', 'mainland', '542', ',423,542,546,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('547', '遂溪县', 'mainland', '542', ',423,542,547,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('548', '徐闻县', 'mainland', '542', ',423,542,548,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('549', '廉江市', 'mainland', '542', ',423,542,549,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('550', '雷州市', 'mainland', '542', ',423,542,550,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('551', '吴川市', 'mainland', '542', ',423,542,551,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('552', '肇庆市', 'mainland', '423', ',423,552,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('553', '端州区', 'mainland', '552', ',423,552,553,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('554', '鼎湖区', 'mainland', '552', ',423,552,554,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('555', '广宁县', 'mainland', '552', ',423,552,555,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('556', '怀集县', 'mainland', '552', ',423,552,556,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('557', '封开县', 'mainland', '552', ',423,552,557,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('558', '德庆县', 'mainland', '552', ',423,552,558,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('559', '高要市', 'mainland', '552', ',423,552,559,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('560', '四会市', 'mainland', '552', ',423,552,560,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('561', '中山市', 'mainland', '423', ',423,561,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('562', '珠海市', 'mainland', '423', ',423,562,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('563', '香洲区', 'mainland', '562', ',423,562,563,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('564', '斗门区', 'mainland', '562', ',423,562,564,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('565', '金湾区', 'mainland', '562', ',423,562,565,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('566', '广西', 'mainland', null, ',566,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('567', '南宁市', 'mainland', '566', ',566,567,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('568', '兴宁区', 'mainland', '567', ',566,567,568,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('569', '青秀区', 'mainland', '567', ',566,567,569,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('570', '江南区', 'mainland', '567', ',566,567,570,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('571', '西乡塘区', 'mainland', '567', ',566,567,571,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('572', '良庆区', 'mainland', '567', ',566,567,572,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('573', '邕宁区', 'mainland', '567', ',566,567,573,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('574', '武鸣县', 'mainland', '567', ',566,567,574,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('575', '隆安县', 'mainland', '567', ',566,567,575,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('576', '马山县', 'mainland', '567', ',566,567,576,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('577', '上林县', 'mainland', '567', ',566,567,577,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('578', '宾阳县', 'mainland', '567', ',566,567,578,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('579', '横县', 'mainland', '567', ',566,567,579,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('580', '百色市', 'mainland', '566', ',566,580,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('581', '右江区', 'mainland', '580', ',566,580,581,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('582', '田阳县', 'mainland', '580', ',566,580,582,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('583', '田东县', 'mainland', '580', ',566,580,583,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('584', '平果县', 'mainland', '580', ',566,580,584,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('585', '德保县', 'mainland', '580', ',566,580,585,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('586', '靖西县', 'mainland', '580', ',566,580,586,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('587', '那坡县', 'mainland', '580', ',566,580,587,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('588', '凌云县', 'mainland', '580', ',566,580,588,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('589', '乐业县', 'mainland', '580', ',566,580,589,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('590', '田林县', 'mainland', '580', ',566,580,590,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('591', '西林县', 'mainland', '580', ',566,580,591,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('592', '隆林各族自治县', 'mainland', '580', ',566,580,592,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('593', '北海市', 'mainland', '566', ',566,593,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('594', '海城区', 'mainland', '593', ',566,593,594,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('595', '银海区', 'mainland', '593', ',566,593,595,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('596', '铁山港区', 'mainland', '593', ',566,593,596,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('597', '合浦县', 'mainland', '593', ',566,593,597,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('598', '崇左市', 'mainland', '566', ',566,598,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('599', '江洲区', 'mainland', '598', ',566,598,599,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('600', '扶绥县', 'mainland', '598', ',566,598,600,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('601', '宁明县', 'mainland', '598', ',566,598,601,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('602', '龙州县', 'mainland', '598', ',566,598,602,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('603', '大新县', 'mainland', '598', ',566,598,603,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('604', '天等县', 'mainland', '598', ',566,598,604,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('605', '凭祥市', 'mainland', '598', ',566,598,605,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('606', '防城港市', 'mainland', '566', ',566,606,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('607', '港口区', 'mainland', '606', ',566,606,607,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('608', '防城区', 'mainland', '606', ',566,606,608,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('609', '上思县', 'mainland', '606', ',566,606,609,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('610', '东兴市', 'mainland', '606', ',566,606,610,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('611', '贵港市', 'mainland', '566', ',566,611,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('612', '港北区', 'mainland', '611', ',566,611,612,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('613', '港南区', 'mainland', '611', ',566,611,613,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('614', '覃塘区', 'mainland', '611', ',566,611,614,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('615', '平南县', 'mainland', '611', ',566,611,615,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('616', '桂平市', 'mainland', '611', ',566,611,616,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('617', '桂林市', 'mainland', '566', ',566,617,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('618', '秀峰区', 'mainland', '617', ',566,617,618,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('619', '叠彩区', 'mainland', '617', ',566,617,619,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('620', '象山区', 'mainland', '617', ',566,617,620,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('621', '七星区', 'mainland', '617', ',566,617,621,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('622', '雁山区', 'mainland', '617', ',566,617,622,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('623', '阳朔县', 'mainland', '617', ',566,617,623,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('624', '临桂县', 'mainland', '617', ',566,617,624,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('625', '灵川县', 'mainland', '617', ',566,617,625,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('626', '全州县', 'mainland', '617', ',566,617,626,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('627', '兴安县', 'mainland', '617', ',566,617,627,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('628', '永福县', 'mainland', '617', ',566,617,628,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('629', '灌阳县', 'mainland', '617', ',566,617,629,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('630', '龙胜各族自治县', 'mainland', '617', ',566,617,630,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('631', '资源县', 'mainland', '617', ',566,617,631,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('632', '平乐县', 'mainland', '617', ',566,617,632,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('633', '荔蒲县', 'mainland', '617', ',566,617,633,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('634', '恭城瑶族自治县', 'mainland', '617', ',566,617,634,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('635', '河池市', 'mainland', '566', ',566,635,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('636', '金城江区', 'mainland', '635', ',566,635,636,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('637', '南丹县', 'mainland', '635', ',566,635,637,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('638', '天峨县', 'mainland', '635', ',566,635,638,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('639', '凤山县', 'mainland', '635', ',566,635,639,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('640', '东兰县', 'mainland', '635', ',566,635,640,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('641', '罗城仫佬族自治县', 'mainland', '635', ',566,635,641,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('642', '环江毛南族自治县', 'mainland', '635', ',566,635,642,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('643', '巴马瑶族自治县', 'mainland', '635', ',566,635,643,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('644', '都安瑶族自治县', 'mainland', '635', ',566,635,644,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('645', '大化瑶族自治县', 'mainland', '635', ',566,635,645,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('646', '宜州市', 'mainland', '635', ',566,635,646,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('647', '贺州市', 'mainland', '566', ',566,647,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('648', '八步区', 'mainland', '647', ',566,647,648,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('649', '昭平县', 'mainland', '647', ',566,647,649,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('650', '钟山县', 'mainland', '647', ',566,647,650,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('651', '富川瑶族自治县', 'mainland', '647', ',566,647,651,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('652', '来宾市', 'mainland', '566', ',566,652,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('653', '兴宾区', 'mainland', '652', ',566,652,653,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('654', '忻城县', 'mainland', '652', ',566,652,654,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('655', '象州县', 'mainland', '652', ',566,652,655,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('656', '武宣县', 'mainland', '652', ',566,652,656,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('657', '金秀瑶族自治县', 'mainland', '652', ',566,652,657,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('658', '合山市', 'mainland', '652', ',566,652,658,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('659', '柳州市', 'mainland', '566', ',566,659,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('660', '城中区', 'mainland', '659', ',566,659,660,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('661', '鱼峰区', 'mainland', '659', ',566,659,661,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('662', '柳南区', 'mainland', '659', ',566,659,662,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('663', '柳北区', 'mainland', '659', ',566,659,663,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('664', '柳江县', 'mainland', '659', ',566,659,664,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('665', '柳城县', 'mainland', '659', ',566,659,665,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('666', '鹿寨县', 'mainland', '659', ',566,659,666,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('667', '融安县', 'mainland', '659', ',566,659,667,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('668', '融水苗族自治县', 'mainland', '659', ',566,659,668,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('669', '三江侗族自治县', 'mainland', '659', ',566,659,669,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('670', '钦州市', 'mainland', '566', ',566,670,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('671', '钦南区', 'mainland', '670', ',566,670,671,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('672', '钦北区', 'mainland', '670', ',566,670,672,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('673', '灵山县', 'mainland', '670', ',566,670,673,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('674', '浦北县', 'mainland', '670', ',566,670,674,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('675', '梧州市', 'mainland', '566', ',566,675,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('676', '万秀区', 'mainland', '675', ',566,675,676,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('677', '蝶山区', 'mainland', '675', ',566,675,677,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('678', '长洲区', 'mainland', '675', ',566,675,678,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('679', '苍梧县', 'mainland', '675', ',566,675,679,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('680', '藤县', 'mainland', '675', ',566,675,680,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('681', '蒙山县', 'mainland', '675', ',566,675,681,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('682', '岑溪市', 'mainland', '675', ',566,675,682,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('683', '玉林市', 'mainland', '566', ',566,683,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('684', '玉州区', 'mainland', '683', ',566,683,684,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('685', '容县', 'mainland', '683', ',566,683,685,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('686', '陆川县', 'mainland', '683', ',566,683,686,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('687', '博白县', 'mainland', '683', ',566,683,687,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('688', '兴业县', 'mainland', '683', ',566,683,688,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('689', '北流市', 'mainland', '683', ',566,683,689,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('690', '贵州', 'mainland', null, ',690,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('691', '贵阳市', 'mainland', '690', ',690,691,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('692', '南明区', 'mainland', '691', ',690,691,692,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('693', '云岩区', 'mainland', '691', ',690,691,693,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('694', '花溪区', 'mainland', '691', ',690,691,694,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('695', '乌当区', 'mainland', '691', ',690,691,695,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('696', '白云区', 'mainland', '691', ',690,691,696,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('697', '小河区', 'mainland', '691', ',690,691,697,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('698', '开阳县', 'mainland', '691', ',690,691,698,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('699', '息烽县', 'mainland', '691', ',690,691,699,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('700', '修文县', 'mainland', '691', ',690,691,700,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('701', '清镇市', 'mainland', '691', ',690,691,701,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('702', '安顺市', 'mainland', '690', ',690,702,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('703', '西秀区', 'mainland', '702', ',690,702,703,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('704', '平坝县', 'mainland', '702', ',690,702,704,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('705', '普定县', 'mainland', '702', ',690,702,705,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('706', '镇宁布依族苗族自治县', 'mainland', '702', ',690,702,706,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('707', '关岭布依族苗族自治县', 'mainland', '702', ',690,702,707,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('708', '紫云苗族布依族自治县', 'mainland', '702', ',690,702,708,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('709', '毕节地区', 'mainland', '690', ',690,709,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('710', '毕节市', 'mainland', '709', ',690,709,710,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('711', '大方县', 'mainland', '709', ',690,709,711,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('712', '黔西县', 'mainland', '709', ',690,709,712,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('713', '金沙县', 'mainland', '709', ',690,709,713,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('714', '织金县', 'mainland', '709', ',690,709,714,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('715', '纳雍县', 'mainland', '709', ',690,709,715,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('716', '威宁彝族回族苗族自治县', 'mainland', '709', ',690,709,716,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('717', '赫章县', 'mainland', '709', ',690,709,717,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('718', '六盘水市', 'mainland', '690', ',690,718,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('719', '钟山区', 'mainland', '718', ',690,718,719,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('720', '六枝特区', 'mainland', '718', ',690,718,720,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('721', '水城县', 'mainland', '718', ',690,718,721,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('722', '盘县', 'mainland', '718', ',690,718,722,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('723', '黔东南苗族侗族自治州', 'mainland', '690', ',690,723,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('724', '凯里市', 'mainland', '723', ',690,723,724,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('725', '黄平县', 'mainland', '723', ',690,723,725,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('726', '施秉县', 'mainland', '723', ',690,723,726,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('727', '三穗县', 'mainland', '723', ',690,723,727,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('728', '镇远县', 'mainland', '723', ',690,723,728,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('729', '岑巩县', 'mainland', '723', ',690,723,729,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('730', '天柱县', 'mainland', '723', ',690,723,730,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('731', '锦屏县', 'mainland', '723', ',690,723,731,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('732', '剑河县', 'mainland', '723', ',690,723,732,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('733', '台江县', 'mainland', '723', ',690,723,733,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('734', '黎平县', 'mainland', '723', ',690,723,734,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('735', '榕江县', 'mainland', '723', ',690,723,735,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('736', '从江县', 'mainland', '723', ',690,723,736,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('737', '雷山县', 'mainland', '723', ',690,723,737,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('738', '麻江县', 'mainland', '723', ',690,723,738,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('739', '丹寨县', 'mainland', '723', ',690,723,739,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('740', '黔南布依族苗族自治州', 'mainland', '690', ',690,740,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('741', '都匀市', 'mainland', '740', ',690,740,741,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('742', '福泉市', 'mainland', '740', ',690,740,742,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('743', '荔波县', 'mainland', '740', ',690,740,743,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('744', '贵定县', 'mainland', '740', ',690,740,744,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('745', '瓮安县', 'mainland', '740', ',690,740,745,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('746', '独山县', 'mainland', '740', ',690,740,746,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('747', '平塘县', 'mainland', '740', ',690,740,747,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('748', '罗甸县', 'mainland', '740', ',690,740,748,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('749', '长顺县', 'mainland', '740', ',690,740,749,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('750', '龙里县', 'mainland', '740', ',690,740,750,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('751', '惠水县', 'mainland', '740', ',690,740,751,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('752', '三都水族自治县', 'mainland', '740', ',690,740,752,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('753', '黔西南布依族苗族自治州', 'mainland', '690', ',690,753,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('754', '兴义市', 'mainland', '753', ',690,753,754,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('755', '兴仁县', 'mainland', '753', ',690,753,755,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('756', '普安县', 'mainland', '753', ',690,753,756,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('757', '晴隆县', 'mainland', '753', ',690,753,757,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('758', '贞丰县', 'mainland', '753', ',690,753,758,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('759', '望谟县', 'mainland', '753', ',690,753,759,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('760', '册亨县', 'mainland', '753', ',690,753,760,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('761', '安龙县', 'mainland', '753', ',690,753,761,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('762', '铜仁地区', 'mainland', '690', ',690,762,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('763', '铜仁市', 'mainland', '762', ',690,762,763,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('764', '江口县', 'mainland', '762', ',690,762,764,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('765', '玉屏侗族自治县', 'mainland', '762', ',690,762,765,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('766', '石阡县', 'mainland', '762', ',690,762,766,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('767', '思南县', 'mainland', '762', ',690,762,767,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('768', '印江土家族苗族自治县', 'mainland', '762', ',690,762,768,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('769', '德江县', 'mainland', '762', ',690,762,769,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('770', '沿河土家族自治县', 'mainland', '762', ',690,762,770,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('771', '松桃苗族自治县', 'mainland', '762', ',690,762,771,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('772', '万山特区', 'mainland', '762', ',690,762,772,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('773', '遵义市', 'mainland', '690', ',690,773,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('774', '红花岗区', 'mainland', '773', ',690,773,774,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('775', '汇川区', 'mainland', '773', ',690,773,775,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('776', '遵义县', 'mainland', '773', ',690,773,776,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('777', '桐梓县', 'mainland', '773', ',690,773,777,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('778', '绥阳县', 'mainland', '773', ',690,773,778,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('779', '正安县', 'mainland', '773', ',690,773,779,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('780', '道真仡佬族苗族自治县', 'mainland', '773', ',690,773,780,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('781', '务川仡佬族苗族自治县', 'mainland', '773', ',690,773,781,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('782', '凤冈县', 'mainland', '773', ',690,773,782,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('783', '湄潭县', 'mainland', '773', ',690,773,783,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('784', '余庆县', 'mainland', '773', ',690,773,784,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('785', '习水县', 'mainland', '773', ',690,773,785,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('786', '赤水市', 'mainland', '773', ',690,773,786,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('787', '仁怀市', 'mainland', '773', ',690,773,787,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('788', '海南', 'mainland', null, ',788,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('789', '海口市', 'mainland', '788', ',788,789,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('790', '秀英区', 'mainland', '789', ',788,789,790,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('791', '龙华区', 'mainland', '789', ',788,789,791,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('792', '琼山区', 'mainland', '789', ',788,789,792,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('793', '美兰区', 'mainland', '789', ',788,789,793,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('794', '白沙黎族自治县', 'mainland', '788', ',788,794,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('795', '保亭黎族苗族自治县', 'mainland', '788', ',788,795,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('796', '昌江黎族自治县', 'mainland', '788', ',788,796,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('797', '澄迈县', 'mainland', '788', ',788,797,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('798', '儋州市', 'mainland', '788', ',788,798,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('799', '定安县', 'mainland', '788', ',788,799,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('800', '东方市', 'mainland', '788', ',788,800,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('801', '乐东黎族自治县', 'mainland', '788', ',788,801,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('802', '临高县', 'mainland', '788', ',788,802,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('803', '陵水黎族自治县', 'mainland', '788', ',788,803,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('804', '南沙群岛', 'mainland', '788', ',788,804,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('805', '琼海市', 'mainland', '788', ',788,805,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('806', '琼中黎族苗族自治县', 'mainland', '788', ',788,806,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('807', '三亚市', 'mainland', '788', ',788,807,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('808', '屯昌县', 'mainland', '788', ',788,808,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('809', '万宁市', 'mainland', '788', ',788,809,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('810', '文昌市', 'mainland', '788', ',788,810,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('811', '五指山市', 'mainland', '788', ',788,811,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('812', '西沙群岛', 'mainland', '788', ',788,812,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('813', '中沙群岛的岛礁及其海域', 'mainland', '788', ',788,813,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('814', '河北', 'mainland', null, ',814,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('815', '石家庄市', 'mainland', '814', ',814,815,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('816', '长安区', 'mainland', '815', ',814,815,816,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('817', '桥东区', 'mainland', '815', ',814,815,817,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('818', '桥西区', 'mainland', '815', ',814,815,818,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('819', '新华区', 'mainland', '815', ',814,815,819,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('820', '井陉矿区', 'mainland', '815', ',814,815,820,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('821', '裕华区', 'mainland', '815', ',814,815,821,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('822', '井陉县', 'mainland', '815', ',814,815,822,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('823', '正定县', 'mainland', '815', ',814,815,823,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('824', '栾城县', 'mainland', '815', ',814,815,824,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('825', '行唐县', 'mainland', '815', ',814,815,825,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('826', '灵寿县', 'mainland', '815', ',814,815,826,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('827', '高邑县', 'mainland', '815', ',814,815,827,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('828', '深泽县', 'mainland', '815', ',814,815,828,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('829', '赞皇县', 'mainland', '815', ',814,815,829,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('830', '无极县', 'mainland', '815', ',814,815,830,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('831', '平山县', 'mainland', '815', ',814,815,831,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('832', '元氏县', 'mainland', '815', ',814,815,832,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('833', '赵县', 'mainland', '815', ',814,815,833,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('834', '辛集市', 'mainland', '815', ',814,815,834,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('835', '藁城市', 'mainland', '815', ',814,815,835,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('836', '晋州市', 'mainland', '815', ',814,815,836,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('837', '新乐市', 'mainland', '815', ',814,815,837,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('838', '鹿泉市', 'mainland', '815', ',814,815,838,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('839', '保定市', 'mainland', '814', ',814,839,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('840', '新市区', 'mainland', '839', ',814,839,840,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('841', '北市区', 'mainland', '839', ',814,839,841,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('842', '南市区', 'mainland', '839', ',814,839,842,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('843', '满城县', 'mainland', '839', ',814,839,843,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('844', '清苑县', 'mainland', '839', ',814,839,844,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('845', '涞水县', 'mainland', '839', ',814,839,845,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('846', '阜平县', 'mainland', '839', ',814,839,846,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('847', '徐水县', 'mainland', '839', ',814,839,847,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('848', '定兴县', 'mainland', '839', ',814,839,848,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('849', '唐县', 'mainland', '839', ',814,839,849,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('850', '高阳县', 'mainland', '839', ',814,839,850,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('851', '容城县', 'mainland', '839', ',814,839,851,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('852', '涞源县', 'mainland', '839', ',814,839,852,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('853', '望都县', 'mainland', '839', ',814,839,853,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('854', '安新县', 'mainland', '839', ',814,839,854,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('855', '易县', 'mainland', '839', ',814,839,855,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('856', '曲阳县', 'mainland', '839', ',814,839,856,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('857', '蠡县', 'mainland', '839', ',814,839,857,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('858', '顺平县', 'mainland', '839', ',814,839,858,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('859', '博野县', 'mainland', '839', ',814,839,859,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('860', '雄县', 'mainland', '839', ',814,839,860,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('861', '涿州市', 'mainland', '839', ',814,839,861,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('862', '定州市', 'mainland', '839', ',814,839,862,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('863', '安国市', 'mainland', '839', ',814,839,863,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('864', '高碑店市', 'mainland', '839', ',814,839,864,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('865', '沧州市', 'mainland', '814', ',814,865,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('866', '新华区', 'mainland', '865', ',814,865,866,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('867', '运河区', 'mainland', '865', ',814,865,867,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('868', '沧县', 'mainland', '865', ',814,865,868,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('869', '青县', 'mainland', '865', ',814,865,869,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('870', '东光县', 'mainland', '865', ',814,865,870,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('871', '海兴县', 'mainland', '865', ',814,865,871,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('872', '盐山县', 'mainland', '865', ',814,865,872,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('873', '肃宁县', 'mainland', '865', ',814,865,873,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('874', '南皮县', 'mainland', '865', ',814,865,874,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('875', '吴桥县', 'mainland', '865', ',814,865,875,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('876', '献县', 'mainland', '865', ',814,865,876,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('877', '孟村回族自治县', 'mainland', '865', ',814,865,877,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('878', '泊头市', 'mainland', '865', ',814,865,878,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('879', '任丘市', 'mainland', '865', ',814,865,879,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('880', '黄骅市', 'mainland', '865', ',814,865,880,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('881', '河间市', 'mainland', '865', ',814,865,881,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('882', '承德市', 'mainland', '814', ',814,882,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('883', '双桥区', 'mainland', '882', ',814,882,883,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('884', '双滦区', 'mainland', '882', ',814,882,884,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('885', '鹰手营子矿区', 'mainland', '882', ',814,882,885,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('886', '承德县', 'mainland', '882', ',814,882,886,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('887', '兴隆县', 'mainland', '882', ',814,882,887,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('888', '平泉县', 'mainland', '882', ',814,882,888,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('889', '滦平县', 'mainland', '882', ',814,882,889,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('890', '隆化县', 'mainland', '882', ',814,882,890,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('891', '丰宁满族自治县', 'mainland', '882', ',814,882,891,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('892', '宽城满族自治县', 'mainland', '882', ',814,882,892,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('893', '围场满族蒙古族自治县', 'mainland', '882', ',814,882,893,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('894', '邯郸市', 'mainland', '814', ',814,894,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('895', '邯山区', 'mainland', '894', ',814,894,895,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('896', '丛台区', 'mainland', '894', ',814,894,896,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('897', '复兴区', 'mainland', '894', ',814,894,897,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('898', '峰峰矿区', 'mainland', '894', ',814,894,898,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('899', '邯郸县', 'mainland', '894', ',814,894,899,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('900', '临漳县', 'mainland', '894', ',814,894,900,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('901', '成安县', 'mainland', '894', ',814,894,901,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('902', '大名县', 'mainland', '894', ',814,894,902,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('903', '涉县', 'mainland', '894', ',814,894,903,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('904', '磁县', 'mainland', '894', ',814,894,904,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('905', '肥乡县', 'mainland', '894', ',814,894,905,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('906', '永年县', 'mainland', '894', ',814,894,906,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('907', '邱县', 'mainland', '894', ',814,894,907,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('908', '鸡泽县', 'mainland', '894', ',814,894,908,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('909', '广平县', 'mainland', '894', ',814,894,909,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('910', '馆陶县', 'mainland', '894', ',814,894,910,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('911', '魏县', 'mainland', '894', ',814,894,911,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('912', '曲周县', 'mainland', '894', ',814,894,912,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('913', '武安市', 'mainland', '894', ',814,894,913,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('914', '衡水市', 'mainland', '814', ',814,914,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('915', '桃城区', 'mainland', '914', ',814,914,915,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('916', '枣强县', 'mainland', '914', ',814,914,916,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('917', '武邑县', 'mainland', '914', ',814,914,917,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('918', '武强县', 'mainland', '914', ',814,914,918,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('919', '饶阳县', 'mainland', '914', ',814,914,919,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('920', '安平县', 'mainland', '914', ',814,914,920,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('921', '故城县', 'mainland', '914', ',814,914,921,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('922', '景县', 'mainland', '914', ',814,914,922,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('923', '阜城县', 'mainland', '914', ',814,914,923,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('924', '冀州市', 'mainland', '914', ',814,914,924,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('925', '深州市', 'mainland', '914', ',814,914,925,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('926', '廊坊市', 'mainland', '814', ',814,926,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('927', '安次区', 'mainland', '926', ',814,926,927,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('928', '广阳区', 'mainland', '926', ',814,926,928,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('929', '固安县', 'mainland', '926', ',814,926,929,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('930', '永清县', 'mainland', '926', ',814,926,930,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('931', '香河县', 'mainland', '926', ',814,926,931,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('932', '大城县', 'mainland', '926', ',814,926,932,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('933', '文安县', 'mainland', '926', ',814,926,933,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('934', '大厂回族自治县', 'mainland', '926', ',814,926,934,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('935', '霸州市', 'mainland', '926', ',814,926,935,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('936', '三河市', 'mainland', '926', ',814,926,936,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('937', '秦皇岛市', 'mainland', '814', ',814,937,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('938', '海港区', 'mainland', '937', ',814,937,938,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('939', '山海关区', 'mainland', '937', ',814,937,939,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('940', '北戴河区', 'mainland', '937', ',814,937,940,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('941', '青龙满族自治县', 'mainland', '937', ',814,937,941,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('942', '昌黎县', 'mainland', '937', ',814,937,942,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('943', '抚宁县', 'mainland', '937', ',814,937,943,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('944', '卢龙县', 'mainland', '937', ',814,937,944,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('945', '唐山市', 'mainland', '814', ',814,945,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('946', '路南区', 'mainland', '945', ',814,945,946,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('947', '路北区', 'mainland', '945', ',814,945,947,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('948', '古冶区', 'mainland', '945', ',814,945,948,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('949', '开平区', 'mainland', '945', ',814,945,949,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('950', '丰南区', 'mainland', '945', ',814,945,950,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('951', '丰润区', 'mainland', '945', ',814,945,951,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('952', '滦县', 'mainland', '945', ',814,945,952,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('953', '滦南县', 'mainland', '945', ',814,945,953,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('954', '乐亭县', 'mainland', '945', ',814,945,954,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('955', '迁西县', 'mainland', '945', ',814,945,955,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('956', '玉田县', 'mainland', '945', ',814,945,956,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('957', '唐海县', 'mainland', '945', ',814,945,957,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('958', '遵化市', 'mainland', '945', ',814,945,958,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('959', '迁安市', 'mainland', '945', ',814,945,959,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('960', '邢台市', 'mainland', '814', ',814,960,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('961', '桥东区', 'mainland', '960', ',814,960,961,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('962', '桥西区', 'mainland', '960', ',814,960,962,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('963', '邢台县', 'mainland', '960', ',814,960,963,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('964', '临城县', 'mainland', '960', ',814,960,964,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('965', '内丘县', 'mainland', '960', ',814,960,965,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('966', '柏乡县', 'mainland', '960', ',814,960,966,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('967', '隆尧县', 'mainland', '960', ',814,960,967,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('968', '任县', 'mainland', '960', ',814,960,968,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('969', '南和县', 'mainland', '960', ',814,960,969,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('970', '宁晋县', 'mainland', '960', ',814,960,970,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('971', '巨鹿县', 'mainland', '960', ',814,960,971,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('972', '新河县', 'mainland', '960', ',814,960,972,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('973', '广宗县', 'mainland', '960', ',814,960,973,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('974', '平乡县', 'mainland', '960', ',814,960,974,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('975', '威县', 'mainland', '960', ',814,960,975,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('976', '清河县', 'mainland', '960', ',814,960,976,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('977', '临西县', 'mainland', '960', ',814,960,977,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('978', '南宫市', 'mainland', '960', ',814,960,978,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('979', '沙河市', 'mainland', '960', ',814,960,979,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('980', '张家口市', 'mainland', '814', ',814,980,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('981', '桥东区', 'mainland', '980', ',814,980,981,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('982', '桥西区', 'mainland', '980', ',814,980,982,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('983', '宣化区', 'mainland', '980', ',814,980,983,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('984', '下花园区', 'mainland', '980', ',814,980,984,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('985', '宣化县', 'mainland', '980', ',814,980,985,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('986', '张北县', 'mainland', '980', ',814,980,986,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('987', '康保县', 'mainland', '980', ',814,980,987,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('988', '沽源县', 'mainland', '980', ',814,980,988,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('989', '尚义县', 'mainland', '980', ',814,980,989,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('990', '蔚县', 'mainland', '980', ',814,980,990,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('991', '阳原县', 'mainland', '980', ',814,980,991,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('992', '怀安县', 'mainland', '980', ',814,980,992,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('993', '万全县', 'mainland', '980', ',814,980,993,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('994', '怀来县', 'mainland', '980', ',814,980,994,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('995', '涿鹿县', 'mainland', '980', ',814,980,995,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('996', '赤城县', 'mainland', '980', ',814,980,996,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('997', '崇礼县', 'mainland', '980', ',814,980,997,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('998', '河南', 'mainland', null, ',998,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('999', '郑州市', 'mainland', '998', ',998,999,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1000', '中原区', 'mainland', '999', ',998,999,1000,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1001', '二七区', 'mainland', '999', ',998,999,1001,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1002', '管城回族区', 'mainland', '999', ',998,999,1002,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1003', '金水区', 'mainland', '999', ',998,999,1003,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1004', '上街区', 'mainland', '999', ',998,999,1004,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1005', '邙山区', 'mainland', '999', ',998,999,1005,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1006', '中牟县', 'mainland', '999', ',998,999,1006,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1007', '巩义市', 'mainland', '999', ',998,999,1007,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1008', '荥阳市', 'mainland', '999', ',998,999,1008,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1009', '新密市', 'mainland', '999', ',998,999,1009,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1010', '新郑市', 'mainland', '999', ',998,999,1010,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1011', '登封市', 'mainland', '999', ',998,999,1011,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1012', '安阳市', 'mainland', '998', ',998,1012,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1013', '文峰区', 'mainland', '1012', ',998,1012,1013,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1014', '北关区', 'mainland', '1012', ',998,1012,1014,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1015', '殷都区', 'mainland', '1012', ',998,1012,1015,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1016', '龙安区', 'mainland', '1012', ',998,1012,1016,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1017', '安阳县', 'mainland', '1012', ',998,1012,1017,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1018', '汤阴县', 'mainland', '1012', ',998,1012,1018,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1019', '滑县', 'mainland', '1012', ',998,1012,1019,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1020', '内黄县', 'mainland', '1012', ',998,1012,1020,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1021', '林州市', 'mainland', '1012', ',998,1012,1021,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1022', '鹤壁市', 'mainland', '998', ',998,1022,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1023', '鹤山区', 'mainland', '1022', ',998,1022,1023,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1024', '山城区', 'mainland', '1022', ',998,1022,1024,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1025', '淇滨区', 'mainland', '1022', ',998,1022,1025,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1026', '浚县', 'mainland', '1022', ',998,1022,1026,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1027', '淇县', 'mainland', '1022', ',998,1022,1027,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1028', '济源市', 'mainland', '998', ',998,1028,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1029', '焦作市', 'mainland', '998', ',998,1029,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1030', '解放区', 'mainland', '1029', ',998,1029,1030,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1031', '中站区', 'mainland', '1029', ',998,1029,1031,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1032', '马村区', 'mainland', '1029', ',998,1029,1032,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1033', '山阳区', 'mainland', '1029', ',998,1029,1033,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1034', '修武县', 'mainland', '1029', ',998,1029,1034,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1035', '博爱县', 'mainland', '1029', ',998,1029,1035,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1036', '武陟县', 'mainland', '1029', ',998,1029,1036,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1037', '温县', 'mainland', '1029', ',998,1029,1037,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1038', '济源市', 'mainland', '1029', ',998,1029,1038,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1039', '沁阳市', 'mainland', '1029', ',998,1029,1039,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1040', '孟州市', 'mainland', '1029', ',998,1029,1040,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1041', '开封市', 'mainland', '998', ',998,1041,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1042', '龙亭区', 'mainland', '1041', ',998,1041,1042,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1043', '顺河回族区', 'mainland', '1041', ',998,1041,1043,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1044', '鼓楼区', 'mainland', '1041', ',998,1041,1044,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1045', '南关区', 'mainland', '1041', ',998,1041,1045,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1046', '郊区', 'mainland', '1041', ',998,1041,1046,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1047', '杞县', 'mainland', '1041', ',998,1041,1047,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1048', '通许县', 'mainland', '1041', ',998,1041,1048,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1049', '尉氏县', 'mainland', '1041', ',998,1041,1049,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1050', '开封县', 'mainland', '1041', ',998,1041,1050,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1051', '兰考县', 'mainland', '1041', ',998,1041,1051,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1052', '洛阳市', 'mainland', '998', ',998,1052,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1053', '老城区', 'mainland', '1052', ',998,1052,1053,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1054', '西工区', 'mainland', '1052', ',998,1052,1054,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1055', '廛河回族区', 'mainland', '1052', ',998,1052,1055,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1056', '涧西区', 'mainland', '1052', ',998,1052,1056,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1057', '吉利区', 'mainland', '1052', ',998,1052,1057,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1058', '洛龙区', 'mainland', '1052', ',998,1052,1058,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1059', '孟津县', 'mainland', '1052', ',998,1052,1059,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1060', '新安县', 'mainland', '1052', ',998,1052,1060,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1061', '栾川县', 'mainland', '1052', ',998,1052,1061,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1062', '嵩县', 'mainland', '1052', ',998,1052,1062,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1063', '汝阳县', 'mainland', '1052', ',998,1052,1063,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1064', '宜阳县', 'mainland', '1052', ',998,1052,1064,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1065', '洛宁县', 'mainland', '1052', ',998,1052,1065,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1066', '伊川县', 'mainland', '1052', ',998,1052,1066,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1067', '偃师市', 'mainland', '1052', ',998,1052,1067,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1068', '漯河市', 'mainland', '998', ',998,1068,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1069', '源汇区', 'mainland', '1068', ',998,1068,1069,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1070', '郾城区', 'mainland', '1068', ',998,1068,1070,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1071', '召陵区', 'mainland', '1068', ',998,1068,1071,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1072', '舞阳县', 'mainland', '1068', ',998,1068,1072,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1073', '临颍县', 'mainland', '1068', ',998,1068,1073,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1074', '南阳市', 'mainland', '998', ',998,1074,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1075', '宛城区', 'mainland', '1074', ',998,1074,1075,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1076', '卧龙区', 'mainland', '1074', ',998,1074,1076,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1077', '南召县', 'mainland', '1074', ',998,1074,1077,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1078', '方城县', 'mainland', '1074', ',998,1074,1078,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1079', '西峡县', 'mainland', '1074', ',998,1074,1079,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1080', '镇平县', 'mainland', '1074', ',998,1074,1080,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1081', '内乡县', 'mainland', '1074', ',998,1074,1081,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1082', '淅川县', 'mainland', '1074', ',998,1074,1082,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1083', '社旗县', 'mainland', '1074', ',998,1074,1083,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1084', '唐河县', 'mainland', '1074', ',998,1074,1084,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1085', '新野县', 'mainland', '1074', ',998,1074,1085,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1086', '桐柏县', 'mainland', '1074', ',998,1074,1086,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1087', '邓州市', 'mainland', '1074', ',998,1074,1087,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1088', '平顶山市', 'mainland', '998', ',998,1088,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1089', '新华区', 'mainland', '1088', ',998,1088,1089,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1090', '卫东区', 'mainland', '1088', ',998,1088,1090,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1091', '石龙区', 'mainland', '1088', ',998,1088,1091,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1092', '湛河区', 'mainland', '1088', ',998,1088,1092,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1093', '宝丰县', 'mainland', '1088', ',998,1088,1093,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1094', '叶县', 'mainland', '1088', ',998,1088,1094,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1095', '鲁山县', 'mainland', '1088', ',998,1088,1095,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1096', '郏县', 'mainland', '1088', ',998,1088,1096,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1097', '舞钢市', 'mainland', '1088', ',998,1088,1097,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1098', '汝州市', 'mainland', '1088', ',998,1088,1098,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1099', '濮阳市', 'mainland', '998', ',998,1099,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1100', '华龙区', 'mainland', '1099', ',998,1099,1100,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1101', '清丰县', 'mainland', '1099', ',998,1099,1101,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1102', '南乐县', 'mainland', '1099', ',998,1099,1102,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1103', '范县', 'mainland', '1099', ',998,1099,1103,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1104', '台前县', 'mainland', '1099', ',998,1099,1104,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1105', '濮阳县', 'mainland', '1099', ',998,1099,1105,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1106', '三门峡市', 'mainland', '998', ',998,1106,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1107', '湖滨区', 'mainland', '1106', ',998,1106,1107,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1108', '渑池县', 'mainland', '1106', ',998,1106,1108,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1109', '陕县', 'mainland', '1106', ',998,1106,1109,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1110', '卢氏县', 'mainland', '1106', ',998,1106,1110,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1111', '义马市', 'mainland', '1106', ',998,1106,1111,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1112', '灵宝市', 'mainland', '1106', ',998,1106,1112,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1113', '商丘市', 'mainland', '998', ',998,1113,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1114', '梁园区', 'mainland', '1113', ',998,1113,1114,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1115', '睢阳区', 'mainland', '1113', ',998,1113,1115,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1116', '民权县', 'mainland', '1113', ',998,1113,1116,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1117', '睢县', 'mainland', '1113', ',998,1113,1117,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1118', '宁陵县', 'mainland', '1113', ',998,1113,1118,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1119', '柘城县', 'mainland', '1113', ',998,1113,1119,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1120', '虞城县', 'mainland', '1113', ',998,1113,1120,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1121', '夏邑县', 'mainland', '1113', ',998,1113,1121,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1122', '永城市', 'mainland', '1113', ',998,1113,1122,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1123', '新乡市', 'mainland', '998', ',998,1123,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1124', '红旗区', 'mainland', '1123', ',998,1123,1124,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1125', '卫滨区', 'mainland', '1123', ',998,1123,1125,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1126', '凤泉区', 'mainland', '1123', ',998,1123,1126,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1127', '牧野区', 'mainland', '1123', ',998,1123,1127,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1128', '新乡县', 'mainland', '1123', ',998,1123,1128,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1129', '获嘉县', 'mainland', '1123', ',998,1123,1129,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1130', '原阳县', 'mainland', '1123', ',998,1123,1130,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1131', '延津县', 'mainland', '1123', ',998,1123,1131,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1132', '封丘县', 'mainland', '1123', ',998,1123,1132,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1133', '长垣县', 'mainland', '1123', ',998,1123,1133,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1134', '卫辉市', 'mainland', '1123', ',998,1123,1134,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1135', '辉县市', 'mainland', '1123', ',998,1123,1135,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1136', '信阳市', 'mainland', '998', ',998,1136,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1137', '师河区', 'mainland', '1136', ',998,1136,1137,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1138', '平桥区', 'mainland', '1136', ',998,1136,1138,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1139', '罗山县', 'mainland', '1136', ',998,1136,1139,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1140', '光山县', 'mainland', '1136', ',998,1136,1140,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1141', '新县', 'mainland', '1136', ',998,1136,1141,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1142', '商城县', 'mainland', '1136', ',998,1136,1142,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1143', '固始县', 'mainland', '1136', ',998,1136,1143,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1144', '潢川县', 'mainland', '1136', ',998,1136,1144,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1145', '淮滨县', 'mainland', '1136', ',998,1136,1145,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1146', '息县', 'mainland', '1136', ',998,1136,1146,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1147', '许昌市', 'mainland', '998', ',998,1147,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1148', '魏都区', 'mainland', '1147', ',998,1147,1148,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1149', '许昌县', 'mainland', '1147', ',998,1147,1149,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1150', '鄢陵县', 'mainland', '1147', ',998,1147,1150,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1151', '襄城县', 'mainland', '1147', ',998,1147,1151,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1152', '禹州市', 'mainland', '1147', ',998,1147,1152,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1153', '长葛市', 'mainland', '1147', ',998,1147,1153,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1154', '周口市', 'mainland', '998', ',998,1154,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1155', '川汇区', 'mainland', '1154', ',998,1154,1155,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1156', '扶沟县', 'mainland', '1154', ',998,1154,1156,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1157', '西华县', 'mainland', '1154', ',998,1154,1157,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1158', '商水县', 'mainland', '1154', ',998,1154,1158,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1159', '沈丘县', 'mainland', '1154', ',998,1154,1159,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1160', '郸城县', 'mainland', '1154', ',998,1154,1160,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1161', '淮阳县', 'mainland', '1154', ',998,1154,1161,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1162', '太康县', 'mainland', '1154', ',998,1154,1162,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1163', '鹿邑县', 'mainland', '1154', ',998,1154,1163,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1164', '项城市', 'mainland', '1154', ',998,1154,1164,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1165', '驻马店市', 'mainland', '998', ',998,1165,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1166', '驿城区', 'mainland', '1165', ',998,1165,1166,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1167', '西平县', 'mainland', '1165', ',998,1165,1167,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1168', '上蔡县', 'mainland', '1165', ',998,1165,1168,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1169', '平舆县', 'mainland', '1165', ',998,1165,1169,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1170', '正阳县', 'mainland', '1165', ',998,1165,1170,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1171', '确山县', 'mainland', '1165', ',998,1165,1171,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1172', '泌阳县', 'mainland', '1165', ',998,1165,1172,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1173', '汝南县', 'mainland', '1165', ',998,1165,1173,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1174', '遂平县', 'mainland', '1165', ',998,1165,1174,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1175', '新蔡县', 'mainland', '1165', ',998,1165,1175,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1176', '黑龙江', 'mainland', null, ',1176,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('1177', '哈尔滨市', 'mainland', '1176', ',1176,1177,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1178', '道里区', 'mainland', '1177', ',1176,1177,1178,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1179', '南岗区', 'mainland', '1177', ',1176,1177,1179,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1180', '道外区', 'mainland', '1177', ',1176,1177,1180,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1181', '香坊区', 'mainland', '1177', ',1176,1177,1181,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1182', '动力区', 'mainland', '1177', ',1176,1177,1182,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1183', '平房区', 'mainland', '1177', ',1176,1177,1183,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1184', '松北区', 'mainland', '1177', ',1176,1177,1184,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1185', '呼兰区', 'mainland', '1177', ',1176,1177,1185,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1186', '依兰县', 'mainland', '1177', ',1176,1177,1186,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1187', '方正县', 'mainland', '1177', ',1176,1177,1187,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1188', '宾县', 'mainland', '1177', ',1176,1177,1188,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1189', '巴彦县', 'mainland', '1177', ',1176,1177,1189,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1190', '木兰县', 'mainland', '1177', ',1176,1177,1190,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1191', '通河县', 'mainland', '1177', ',1176,1177,1191,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1192', '延寿县', 'mainland', '1177', ',1176,1177,1192,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1193', '阿城市', 'mainland', '1177', ',1176,1177,1193,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1194', '双城市', 'mainland', '1177', ',1176,1177,1194,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1195', '尚志市', 'mainland', '1177', ',1176,1177,1195,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1196', '五常市', 'mainland', '1177', ',1176,1177,1196,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1197', '大庆市', 'mainland', '1176', ',1176,1197,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1198', '萨尔图区', 'mainland', '1197', ',1176,1197,1198,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1199', '龙凤区', 'mainland', '1197', ',1176,1197,1199,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1200', '让胡路区', 'mainland', '1197', ',1176,1197,1200,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1201', '红岗区', 'mainland', '1197', ',1176,1197,1201,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1202', '大同区', 'mainland', '1197', ',1176,1197,1202,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1203', '肇州县', 'mainland', '1197', ',1176,1197,1203,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1204', '肇源县', 'mainland', '1197', ',1176,1197,1204,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1205', '林甸县', 'mainland', '1197', ',1176,1197,1205,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1206', '杜尔伯特蒙古族自治县', 'mainland', '1197', ',1176,1197,1206,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1207', '大兴安岭地区', 'mainland', '1176', ',1176,1207,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1208', '呼玛县', 'mainland', '1207', ',1176,1207,1208,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1209', '塔河县', 'mainland', '1207', ',1176,1207,1209,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1210', '漠河县', 'mainland', '1207', ',1176,1207,1210,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1211', '鹤岗市', 'mainland', '1176', ',1176,1211,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1212', '向阳区', 'mainland', '1211', ',1176,1211,1212,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1213', '工农区', 'mainland', '1211', ',1176,1211,1213,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1214', '南山区', 'mainland', '1211', ',1176,1211,1214,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1215', '兴安区', 'mainland', '1211', ',1176,1211,1215,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1216', '东山区', 'mainland', '1211', ',1176,1211,1216,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1217', '兴山区', 'mainland', '1211', ',1176,1211,1217,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1218', '萝北县', 'mainland', '1211', ',1176,1211,1218,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1219', '绥滨县', 'mainland', '1211', ',1176,1211,1219,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1220', '黑河市', 'mainland', '1176', ',1176,1220,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1221', '爱辉区', 'mainland', '1220', ',1176,1220,1221,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1222', '嫩江县', 'mainland', '1220', ',1176,1220,1222,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1223', '逊克县', 'mainland', '1220', ',1176,1220,1223,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1224', '孙吴县', 'mainland', '1220', ',1176,1220,1224,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1225', '北安市', 'mainland', '1220', ',1176,1220,1225,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1226', '五大连池市', 'mainland', '1220', ',1176,1220,1226,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1227', '鸡西市', 'mainland', '1176', ',1176,1227,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1228', '鸡冠区', 'mainland', '1227', ',1176,1227,1228,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1229', '恒山区', 'mainland', '1227', ',1176,1227,1229,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1230', '滴道区', 'mainland', '1227', ',1176,1227,1230,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1231', '梨树区', 'mainland', '1227', ',1176,1227,1231,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1232', '城子河区', 'mainland', '1227', ',1176,1227,1232,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1233', '麻山区', 'mainland', '1227', ',1176,1227,1233,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1234', '鸡东县', 'mainland', '1227', ',1176,1227,1234,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1235', '虎林市', 'mainland', '1227', ',1176,1227,1235,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1236', '密山市', 'mainland', '1227', ',1176,1227,1236,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1237', '佳木斯市', 'mainland', '1176', ',1176,1237,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1238', '永红区', 'mainland', '1237', ',1176,1237,1238,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1239', '向阳区', 'mainland', '1237', ',1176,1237,1239,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1240', '前进区', 'mainland', '1237', ',1176,1237,1240,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1241', '东风区', 'mainland', '1237', ',1176,1237,1241,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1242', '郊区', 'mainland', '1237', ',1176,1237,1242,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1243', '桦南县', 'mainland', '1237', ',1176,1237,1243,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1244', '桦川县', 'mainland', '1237', ',1176,1237,1244,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1245', '汤原县', 'mainland', '1237', ',1176,1237,1245,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1246', '抚远县', 'mainland', '1237', ',1176,1237,1246,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1247', '同江市', 'mainland', '1237', ',1176,1237,1247,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1248', '富锦市', 'mainland', '1237', ',1176,1237,1248,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1249', '牡丹江市', 'mainland', '1176', ',1176,1249,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1250', '东安区', 'mainland', '1249', ',1176,1249,1250,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1251', '阳明区', 'mainland', '1249', ',1176,1249,1251,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1252', '爱民区', 'mainland', '1249', ',1176,1249,1252,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1253', '西安区', 'mainland', '1249', ',1176,1249,1253,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1254', '东宁县', 'mainland', '1249', ',1176,1249,1254,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1255', '林口县', 'mainland', '1249', ',1176,1249,1255,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1256', '绥芬河市', 'mainland', '1249', ',1176,1249,1256,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1257', '海林市', 'mainland', '1249', ',1176,1249,1257,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1258', '宁安市', 'mainland', '1249', ',1176,1249,1258,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1259', '穆棱市', 'mainland', '1249', ',1176,1249,1259,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1260', '七台河市', 'mainland', '1176', ',1176,1260,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1261', '新兴区', 'mainland', '1260', ',1176,1260,1261,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1262', '桃山区', 'mainland', '1260', ',1176,1260,1262,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1263', '茄子河区', 'mainland', '1260', ',1176,1260,1263,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1264', '勃利县', 'mainland', '1260', ',1176,1260,1264,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1265', '齐齐哈尔市', 'mainland', '1176', ',1176,1265,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1266', '龙沙区', 'mainland', '1265', ',1176,1265,1266,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1267', '建华区', 'mainland', '1265', ',1176,1265,1267,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1268', '铁锋区', 'mainland', '1265', ',1176,1265,1268,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1269', '昂昂溪区', 'mainland', '1265', ',1176,1265,1269,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1270', '富拉尔基区', 'mainland', '1265', ',1176,1265,1270,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1271', '碾子山区', 'mainland', '1265', ',1176,1265,1271,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1272', '梅里斯达斡尔族区', 'mainland', '1265', ',1176,1265,1272,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1273', '龙江县', 'mainland', '1265', ',1176,1265,1273,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1274', '依安县', 'mainland', '1265', ',1176,1265,1274,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1275', '泰来县', 'mainland', '1265', ',1176,1265,1275,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1276', '甘南县', 'mainland', '1265', ',1176,1265,1276,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1277', '富裕县', 'mainland', '1265', ',1176,1265,1277,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1278', '克山县', 'mainland', '1265', ',1176,1265,1278,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1279', '克东县', 'mainland', '1265', ',1176,1265,1279,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1280', '拜泉县', 'mainland', '1265', ',1176,1265,1280,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1281', '讷河市', 'mainland', '1265', ',1176,1265,1281,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1282', '双鸭山市', 'mainland', '1176', ',1176,1282,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1283', '尖山区', 'mainland', '1282', ',1176,1282,1283,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1284', '岭东区', 'mainland', '1282', ',1176,1282,1284,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1285', '四方台区', 'mainland', '1282', ',1176,1282,1285,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1286', '宝山区', 'mainland', '1282', ',1176,1282,1286,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1287', '集贤县', 'mainland', '1282', ',1176,1282,1287,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1288', '友谊县', 'mainland', '1282', ',1176,1282,1288,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1289', '宝清县', 'mainland', '1282', ',1176,1282,1289,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1290', '饶河县', 'mainland', '1282', ',1176,1282,1290,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1291', '绥化市', 'mainland', '1176', ',1176,1291,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1292', '北林区', 'mainland', '1291', ',1176,1291,1292,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1293', '望奎县', 'mainland', '1291', ',1176,1291,1293,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1294', '兰西县', 'mainland', '1291', ',1176,1291,1294,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1295', '青冈县', 'mainland', '1291', ',1176,1291,1295,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1296', '庆安县', 'mainland', '1291', ',1176,1291,1296,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1297', '明水县', 'mainland', '1291', ',1176,1291,1297,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1298', '绥棱县', 'mainland', '1291', ',1176,1291,1298,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1299', '安达市', 'mainland', '1291', ',1176,1291,1299,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1300', '肇东市', 'mainland', '1291', ',1176,1291,1300,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1301', '海伦市', 'mainland', '1291', ',1176,1291,1301,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1302', '伊春市', 'mainland', '1176', ',1176,1302,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1303', '伊春区', 'mainland', '1302', ',1176,1302,1303,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1304', '南岔区', 'mainland', '1302', ',1176,1302,1304,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1305', '友好区', 'mainland', '1302', ',1176,1302,1305,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1306', '西林区', 'mainland', '1302', ',1176,1302,1306,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1307', '翠峦区', 'mainland', '1302', ',1176,1302,1307,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1308', '新青区', 'mainland', '1302', ',1176,1302,1308,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1309', '美溪区', 'mainland', '1302', ',1176,1302,1309,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1310', '金山屯区', 'mainland', '1302', ',1176,1302,1310,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1311', '五营区', 'mainland', '1302', ',1176,1302,1311,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1312', '乌马河区', 'mainland', '1302', ',1176,1302,1312,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1313', '汤旺河区', 'mainland', '1302', ',1176,1302,1313,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1314', '带岭区', 'mainland', '1302', ',1176,1302,1314,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1315', '乌伊岭区', 'mainland', '1302', ',1176,1302,1315,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1316', '红星区', 'mainland', '1302', ',1176,1302,1316,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1317', '上甘岭区', 'mainland', '1302', ',1176,1302,1317,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1318', '嘉荫县', 'mainland', '1302', ',1176,1302,1318,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1319', '铁力市', 'mainland', '1302', ',1176,1302,1319,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1320', '湖北', 'mainland', null, ',1320,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('1321', '武汉市', 'mainland', '1320', ',1320,1321,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1322', '江岸区', 'mainland', '1321', ',1320,1321,1322,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1323', '江汉区', 'mainland', '1321', ',1320,1321,1323,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1324', '乔口区', 'mainland', '1321', ',1320,1321,1324,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1325', '汉阳区', 'mainland', '1321', ',1320,1321,1325,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1326', '武昌区', 'mainland', '1321', ',1320,1321,1326,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1327', '青山区', 'mainland', '1321', ',1320,1321,1327,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1328', '洪山区', 'mainland', '1321', ',1320,1321,1328,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1329', '东西湖区', 'mainland', '1321', ',1320,1321,1329,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1330', '汉南区', 'mainland', '1321', ',1320,1321,1330,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1331', '蔡甸区', 'mainland', '1321', ',1320,1321,1331,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1332', '江夏区', 'mainland', '1321', ',1320,1321,1332,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1333', '黄陂区', 'mainland', '1321', ',1320,1321,1333,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1334', '新洲区', 'mainland', '1321', ',1320,1321,1334,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1335', '鄂州市', 'mainland', '1320', ',1320,1335,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1336', '梁子湖区', 'mainland', '1335', ',1320,1335,1336,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1337', '华容区', 'mainland', '1335', ',1320,1335,1337,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1338', '鄂城区', 'mainland', '1335', ',1320,1335,1338,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1339', '恩施土家族苗族自治州', 'mainland', '1320', ',1320,1339,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1340', '恩施市', 'mainland', '1339', ',1320,1339,1340,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1341', '利川市', 'mainland', '1339', ',1320,1339,1341,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1342', '建始县', 'mainland', '1339', ',1320,1339,1342,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1343', '巴东县', 'mainland', '1339', ',1320,1339,1343,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1344', '宣恩县', 'mainland', '1339', ',1320,1339,1344,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1345', '咸丰县', 'mainland', '1339', ',1320,1339,1345,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1346', '来凤县', 'mainland', '1339', ',1320,1339,1346,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1347', '鹤峰县', 'mainland', '1339', ',1320,1339,1347,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1348', '黄冈市', 'mainland', '1320', ',1320,1348,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1349', '黄州区', 'mainland', '1348', ',1320,1348,1349,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1350', '团风县', 'mainland', '1348', ',1320,1348,1350,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1351', '红安县', 'mainland', '1348', ',1320,1348,1351,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1352', '罗田县', 'mainland', '1348', ',1320,1348,1352,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1353', '英山县', 'mainland', '1348', ',1320,1348,1353,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1354', '浠水县', 'mainland', '1348', ',1320,1348,1354,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1355', '蕲春县', 'mainland', '1348', ',1320,1348,1355,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1356', '黄梅县', 'mainland', '1348', ',1320,1348,1356,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1357', '麻城市', 'mainland', '1348', ',1320,1348,1357,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1358', '武穴市', 'mainland', '1348', ',1320,1348,1358,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1359', '黄石市', 'mainland', '1320', ',1320,1359,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1360', '黄石港区', 'mainland', '1359', ',1320,1359,1360,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1361', '西塞山区', 'mainland', '1359', ',1320,1359,1361,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1362', '下陆区', 'mainland', '1359', ',1320,1359,1362,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1363', '铁山区', 'mainland', '1359', ',1320,1359,1363,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1364', '阳新县', 'mainland', '1359', ',1320,1359,1364,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1365', '大冶市', 'mainland', '1359', ',1320,1359,1365,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1366', '荆门市', 'mainland', '1320', ',1320,1366,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1367', '东宝区', 'mainland', '1366', ',1320,1366,1367,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1368', '掇刀区', 'mainland', '1366', ',1320,1366,1368,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1369', '京山县', 'mainland', '1366', ',1320,1366,1369,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1370', '沙洋县', 'mainland', '1366', ',1320,1366,1370,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1371', '钟祥市', 'mainland', '1366', ',1320,1366,1371,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1372', '荆州市', 'mainland', '1320', ',1320,1372,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1373', '沙市区', 'mainland', '1372', ',1320,1372,1373,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1374', '荆州区', 'mainland', '1372', ',1320,1372,1374,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1375', '公安县', 'mainland', '1372', ',1320,1372,1375,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1376', '监利县', 'mainland', '1372', ',1320,1372,1376,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1377', '江陵县', 'mainland', '1372', ',1320,1372,1377,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1378', '石首市', 'mainland', '1372', ',1320,1372,1378,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1379', '洪湖市', 'mainland', '1372', ',1320,1372,1379,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1380', '松滋市', 'mainland', '1372', ',1320,1372,1380,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1381', '潜江市', 'mainland', '1320', ',1320,1381,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1382', '神农架林区', 'mainland', '1320', ',1320,1382,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1383', '十堰市', 'mainland', '1320', ',1320,1383,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1384', '茅箭区', 'mainland', '1383', ',1320,1383,1384,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1385', '张湾区', 'mainland', '1383', ',1320,1383,1385,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1386', '郧县', 'mainland', '1383', ',1320,1383,1386,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1387', '郧西县', 'mainland', '1383', ',1320,1383,1387,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1388', '竹山县', 'mainland', '1383', ',1320,1383,1388,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1389', '竹溪县', 'mainland', '1383', ',1320,1383,1389,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1390', '房县', 'mainland', '1383', ',1320,1383,1390,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1391', '丹江口市', 'mainland', '1383', ',1320,1383,1391,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1392', '随州市', 'mainland', '1320', ',1320,1392,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1393', '曾都区', 'mainland', '1392', ',1320,1392,1393,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1394', '广水市', 'mainland', '1392', ',1320,1392,1394,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1395', '天门市', 'mainland', '1320', ',1320,1395,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1396', '仙桃市', 'mainland', '1320', ',1320,1396,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1397', '咸宁市', 'mainland', '1320', ',1320,1397,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1398', '咸安区', 'mainland', '1397', ',1320,1397,1398,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1399', '嘉鱼县', 'mainland', '1397', ',1320,1397,1399,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1400', '通城县', 'mainland', '1397', ',1320,1397,1400,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1401', '崇阳县', 'mainland', '1397', ',1320,1397,1401,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1402', '通山县', 'mainland', '1397', ',1320,1397,1402,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1403', '赤壁市', 'mainland', '1397', ',1320,1397,1403,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1404', '襄樊市', 'mainland', '1320', ',1320,1404,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1405', '襄城区', 'mainland', '1404', ',1320,1404,1405,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1406', '樊城区', 'mainland', '1404', ',1320,1404,1406,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1407', '襄阳区', 'mainland', '1404', ',1320,1404,1407,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1408', '南漳县', 'mainland', '1404', ',1320,1404,1408,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1409', '谷城县', 'mainland', '1404', ',1320,1404,1409,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1410', '保康县', 'mainland', '1404', ',1320,1404,1410,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1411', '老河口市', 'mainland', '1404', ',1320,1404,1411,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1412', '枣阳市', 'mainland', '1404', ',1320,1404,1412,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1413', '宜城市', 'mainland', '1404', ',1320,1404,1413,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1414', '孝感市', 'mainland', '1320', ',1320,1414,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1415', '孝南区', 'mainland', '1414', ',1320,1414,1415,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1416', '孝昌县', 'mainland', '1414', ',1320,1414,1416,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1417', '大悟县', 'mainland', '1414', ',1320,1414,1417,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1418', '云梦县', 'mainland', '1414', ',1320,1414,1418,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1419', '应城市', 'mainland', '1414', ',1320,1414,1419,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1420', '安陆市', 'mainland', '1414', ',1320,1414,1420,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1421', '汉川市', 'mainland', '1414', ',1320,1414,1421,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1422', '宜昌市', 'mainland', '1320', ',1320,1422,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1423', '西陵区', 'mainland', '1422', ',1320,1422,1423,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1424', '伍家岗区', 'mainland', '1422', ',1320,1422,1424,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1425', '点军区', 'mainland', '1422', ',1320,1422,1425,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1426', '猇亭区', 'mainland', '1422', ',1320,1422,1426,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1427', '夷陵区', 'mainland', '1422', ',1320,1422,1427,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1428', '远安县', 'mainland', '1422', ',1320,1422,1428,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1429', '兴山县', 'mainland', '1422', ',1320,1422,1429,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1430', '秭归县', 'mainland', '1422', ',1320,1422,1430,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1431', '长阳土家族自治县', 'mainland', '1422', ',1320,1422,1431,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1432', '五峰土家族自治县', 'mainland', '1422', ',1320,1422,1432,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1433', '宜都市', 'mainland', '1422', ',1320,1422,1433,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1434', '当阳市', 'mainland', '1422', ',1320,1422,1434,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1435', '枝江市', 'mainland', '1422', ',1320,1422,1435,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1436', '湖南', 'mainland', null, ',1436,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('1437', '长沙市', 'mainland', '1436', ',1436,1437,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1438', '芙蓉区', 'mainland', '1437', ',1436,1437,1438,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1439', '天心区', 'mainland', '1437', ',1436,1437,1439,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1440', '岳麓区', 'mainland', '1437', ',1436,1437,1440,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1441', '开福区', 'mainland', '1437', ',1436,1437,1441,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1442', '雨花区', 'mainland', '1437', ',1436,1437,1442,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1443', '长沙县', 'mainland', '1437', ',1436,1437,1443,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1444', '望城县', 'mainland', '1437', ',1436,1437,1444,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1445', '宁乡县', 'mainland', '1437', ',1436,1437,1445,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1446', '浏阳市', 'mainland', '1437', ',1436,1437,1446,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1447', '常德市', 'mainland', '1436', ',1436,1447,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1448', '武陵区', 'mainland', '1447', ',1436,1447,1448,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1449', '鼎城区', 'mainland', '1447', ',1436,1447,1449,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1450', '安乡县', 'mainland', '1447', ',1436,1447,1450,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1451', '汉寿县', 'mainland', '1447', ',1436,1447,1451,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1452', '澧县', 'mainland', '1447', ',1436,1447,1452,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1453', '临澧县', 'mainland', '1447', ',1436,1447,1453,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1454', '桃源县', 'mainland', '1447', ',1436,1447,1454,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1455', '石门县', 'mainland', '1447', ',1436,1447,1455,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1456', '津市市', 'mainland', '1447', ',1436,1447,1456,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1457', '郴州市', 'mainland', '1436', ',1436,1457,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1458', '北湖区', 'mainland', '1457', ',1436,1457,1458,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1459', '苏仙区', 'mainland', '1457', ',1436,1457,1459,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1460', '桂阳县', 'mainland', '1457', ',1436,1457,1460,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1461', '宜章县', 'mainland', '1457', ',1436,1457,1461,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1462', '永兴县', 'mainland', '1457', ',1436,1457,1462,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1463', '嘉禾县', 'mainland', '1457', ',1436,1457,1463,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1464', '临武县', 'mainland', '1457', ',1436,1457,1464,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1465', '汝城县', 'mainland', '1457', ',1436,1457,1465,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1466', '桂东县', 'mainland', '1457', ',1436,1457,1466,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1467', '安仁县', 'mainland', '1457', ',1436,1457,1467,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1468', '资兴市', 'mainland', '1457', ',1436,1457,1468,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1469', '衡阳市', 'mainland', '1436', ',1436,1469,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1470', '珠晖区', 'mainland', '1469', ',1436,1469,1470,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1471', '雁峰区', 'mainland', '1469', ',1436,1469,1471,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1472', '石鼓区', 'mainland', '1469', ',1436,1469,1472,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1473', '蒸湘区', 'mainland', '1469', ',1436,1469,1473,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1474', '南岳区', 'mainland', '1469', ',1436,1469,1474,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1475', '衡阳县', 'mainland', '1469', ',1436,1469,1475,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1476', '衡南县', 'mainland', '1469', ',1436,1469,1476,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1477', '衡山县', 'mainland', '1469', ',1436,1469,1477,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1478', '衡东县', 'mainland', '1469', ',1436,1469,1478,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1479', '祁东县', 'mainland', '1469', ',1436,1469,1479,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1480', '耒阳市', 'mainland', '1469', ',1436,1469,1480,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1481', '常宁市', 'mainland', '1469', ',1436,1469,1481,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1482', '怀化市', 'mainland', '1436', ',1436,1482,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1483', '鹤城区', 'mainland', '1482', ',1436,1482,1483,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1484', '中方县', 'mainland', '1482', ',1436,1482,1484,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1485', '沅陵县', 'mainland', '1482', ',1436,1482,1485,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1486', '辰溪县', 'mainland', '1482', ',1436,1482,1486,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1487', '溆浦县', 'mainland', '1482', ',1436,1482,1487,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1488', '会同县', 'mainland', '1482', ',1436,1482,1488,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1489', '麻阳苗族自治县', 'mainland', '1482', ',1436,1482,1489,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1490', '新晃侗族自治县', 'mainland', '1482', ',1436,1482,1490,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1491', '芷江侗族自治县', 'mainland', '1482', ',1436,1482,1491,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1492', '靖州苗族侗族自治县', 'mainland', '1482', ',1436,1482,1492,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1493', '通道侗族自治县', 'mainland', '1482', ',1436,1482,1493,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1494', '洪江市', 'mainland', '1482', ',1436,1482,1494,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1495', '娄底市', 'mainland', '1436', ',1436,1495,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1496', '娄星区', 'mainland', '1495', ',1436,1495,1496,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1497', '双峰县', 'mainland', '1495', ',1436,1495,1497,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1498', '新化县', 'mainland', '1495', ',1436,1495,1498,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1499', '冷水江市', 'mainland', '1495', ',1436,1495,1499,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1500', '涟源市', 'mainland', '1495', ',1436,1495,1500,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1501', '邵阳市', 'mainland', '1436', ',1436,1501,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1502', '双清区', 'mainland', '1501', ',1436,1501,1502,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1503', '大祥区', 'mainland', '1501', ',1436,1501,1503,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1504', '北塔区', 'mainland', '1501', ',1436,1501,1504,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1505', '邵东县', 'mainland', '1501', ',1436,1501,1505,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1506', '新邵县', 'mainland', '1501', ',1436,1501,1506,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1507', '邵阳县', 'mainland', '1501', ',1436,1501,1507,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1508', '隆回县', 'mainland', '1501', ',1436,1501,1508,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1509', '洞口县', 'mainland', '1501', ',1436,1501,1509,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1510', '绥宁县', 'mainland', '1501', ',1436,1501,1510,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1511', '新宁县', 'mainland', '1501', ',1436,1501,1511,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1512', '城步苗族自治县', 'mainland', '1501', ',1436,1501,1512,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1513', '武冈市', 'mainland', '1501', ',1436,1501,1513,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1514', '湘潭市', 'mainland', '1436', ',1436,1514,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1515', '雨湖区', 'mainland', '1514', ',1436,1514,1515,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1516', '岳塘区', 'mainland', '1514', ',1436,1514,1516,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1517', '湘潭县', 'mainland', '1514', ',1436,1514,1517,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1518', '湘乡市', 'mainland', '1514', ',1436,1514,1518,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1519', '韶山市', 'mainland', '1514', ',1436,1514,1519,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1520', '湘西土家族苗族自治州', 'mainland', '1436', ',1436,1520,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1521', '吉首市', 'mainland', '1520', ',1436,1520,1521,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1522', '泸溪县', 'mainland', '1520', ',1436,1520,1522,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1523', '凤凰县', 'mainland', '1520', ',1436,1520,1523,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1524', '花垣县', 'mainland', '1520', ',1436,1520,1524,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1525', '保靖县', 'mainland', '1520', ',1436,1520,1525,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1526', '古丈县', 'mainland', '1520', ',1436,1520,1526,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1527', '永顺县', 'mainland', '1520', ',1436,1520,1527,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1528', '龙山县', 'mainland', '1520', ',1436,1520,1528,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1529', '益阳市', 'mainland', '1436', ',1436,1529,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1530', '资阳区', 'mainland', '1529', ',1436,1529,1530,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1531', '赫山区', 'mainland', '1529', ',1436,1529,1531,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1532', '南县', 'mainland', '1529', ',1436,1529,1532,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1533', '桃江县', 'mainland', '1529', ',1436,1529,1533,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1534', '安化县', 'mainland', '1529', ',1436,1529,1534,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1535', '沅江市', 'mainland', '1529', ',1436,1529,1535,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1536', '永州市', 'mainland', '1436', ',1436,1536,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1537', '芝山区', 'mainland', '1536', ',1436,1536,1537,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1538', '冷水滩区', 'mainland', '1536', ',1436,1536,1538,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1539', '祁阳县', 'mainland', '1536', ',1436,1536,1539,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1540', '东安县', 'mainland', '1536', ',1436,1536,1540,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1541', '双牌县', 'mainland', '1536', ',1436,1536,1541,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1542', '道县', 'mainland', '1536', ',1436,1536,1542,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1543', '江永县', 'mainland', '1536', ',1436,1536,1543,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1544', '宁远县', 'mainland', '1536', ',1436,1536,1544,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1545', '蓝山县', 'mainland', '1536', ',1436,1536,1545,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1546', '新田县', 'mainland', '1536', ',1436,1536,1546,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1547', '江华瑶族自治县', 'mainland', '1536', ',1436,1536,1547,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1548', '岳阳市', 'mainland', '1436', ',1436,1548,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1549', '岳阳楼区', 'mainland', '1548', ',1436,1548,1549,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1550', '云溪区', 'mainland', '1548', ',1436,1548,1550,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1551', '君山区', 'mainland', '1548', ',1436,1548,1551,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1552', '岳阳县', 'mainland', '1548', ',1436,1548,1552,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1553', '华容县', 'mainland', '1548', ',1436,1548,1553,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1554', '湘阴县', 'mainland', '1548', ',1436,1548,1554,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1555', '平江县', 'mainland', '1548', ',1436,1548,1555,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1556', '汨罗市', 'mainland', '1548', ',1436,1548,1556,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1557', '临湘市', 'mainland', '1548', ',1436,1548,1557,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1558', '张家界市', 'mainland', '1436', ',1436,1558,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1559', '永定区', 'mainland', '1558', ',1436,1558,1559,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1560', '武陵源区', 'mainland', '1558', ',1436,1558,1560,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1561', '慈利县', 'mainland', '1558', ',1436,1558,1561,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1562', '桑植县', 'mainland', '1558', ',1436,1558,1562,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1563', '株洲市', 'mainland', '1436', ',1436,1563,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1564', '荷塘区', 'mainland', '1563', ',1436,1563,1564,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1565', '芦淞区', 'mainland', '1563', ',1436,1563,1565,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1566', '石峰区', 'mainland', '1563', ',1436,1563,1566,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1567', '天元区', 'mainland', '1563', ',1436,1563,1567,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1568', '株洲县', 'mainland', '1563', ',1436,1563,1568,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1569', '攸县', 'mainland', '1563', ',1436,1563,1569,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1570', '茶陵县', 'mainland', '1563', ',1436,1563,1570,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1571', '炎陵县', 'mainland', '1563', ',1436,1563,1571,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1572', '醴陵市', 'mainland', '1563', ',1436,1563,1572,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1573', '吉林', 'mainland', null, ',1573,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('1574', '长春市', 'mainland', '1573', ',1573,1574,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1575', '南关区', 'mainland', '1574', ',1573,1574,1575,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1576', '宽城区', 'mainland', '1574', ',1573,1574,1576,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1577', '朝阳区', 'mainland', '1574', ',1573,1574,1577,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1578', '二道区', 'mainland', '1574', ',1573,1574,1578,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1579', '绿园区', 'mainland', '1574', ',1573,1574,1579,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1580', '双阳区', 'mainland', '1574', ',1573,1574,1580,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1581', '农安县', 'mainland', '1574', ',1573,1574,1581,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1582', '九台市', 'mainland', '1574', ',1573,1574,1582,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1583', '榆树市', 'mainland', '1574', ',1573,1574,1583,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1584', '德惠市', 'mainland', '1574', ',1573,1574,1584,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1585', '白城市', 'mainland', '1573', ',1573,1585,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1586', '洮北区', 'mainland', '1585', ',1573,1585,1586,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1587', '镇赉县', 'mainland', '1585', ',1573,1585,1587,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1588', '通榆县', 'mainland', '1585', ',1573,1585,1588,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1589', '洮南市', 'mainland', '1585', ',1573,1585,1589,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1590', '大安市', 'mainland', '1585', ',1573,1585,1590,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1591', '白山市', 'mainland', '1573', ',1573,1591,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1592', '八道江区', 'mainland', '1591', ',1573,1591,1592,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1593', '抚松县', 'mainland', '1591', ',1573,1591,1593,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1594', '靖宇县', 'mainland', '1591', ',1573,1591,1594,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1595', '长白朝鲜族自治县', 'mainland', '1591', ',1573,1591,1595,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1596', '江源县', 'mainland', '1591', ',1573,1591,1596,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1597', '临江市', 'mainland', '1591', ',1573,1591,1597,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1598', '吉林市', 'mainland', '1573', ',1573,1598,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1599', '昌邑区', 'mainland', '1598', ',1573,1598,1599,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1600', '龙潭区', 'mainland', '1598', ',1573,1598,1600,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1601', '船营区', 'mainland', '1598', ',1573,1598,1601,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1602', '丰满区', 'mainland', '1598', ',1573,1598,1602,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1603', '永吉县', 'mainland', '1598', ',1573,1598,1603,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1604', '蛟河市', 'mainland', '1598', ',1573,1598,1604,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1605', '桦甸市', 'mainland', '1598', ',1573,1598,1605,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1606', '舒兰市', 'mainland', '1598', ',1573,1598,1606,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1607', '磐石市', 'mainland', '1598', ',1573,1598,1607,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1608', '辽源市', 'mainland', '1573', ',1573,1608,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1609', '龙山区', 'mainland', '1608', ',1573,1608,1609,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1610', '西安区', 'mainland', '1608', ',1573,1608,1610,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1611', '东丰县', 'mainland', '1608', ',1573,1608,1611,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1612', '东辽县', 'mainland', '1608', ',1573,1608,1612,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1613', '四平市', 'mainland', '1573', ',1573,1613,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1614', '铁西区', 'mainland', '1613', ',1573,1613,1614,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1615', '铁东区', 'mainland', '1613', ',1573,1613,1615,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1616', '梨树县', 'mainland', '1613', ',1573,1613,1616,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1617', '伊通满族自治县', 'mainland', '1613', ',1573,1613,1617,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1618', '公主岭市', 'mainland', '1613', ',1573,1613,1618,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1619', '双辽市', 'mainland', '1613', ',1573,1613,1619,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1620', '松原市', 'mainland', '1573', ',1573,1620,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1621', '宁江区', 'mainland', '1620', ',1573,1620,1621,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1622', '前郭尔罗斯蒙古族自治县', 'mainland', '1620', ',1573,1620,1622,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1623', '长岭县', 'mainland', '1620', ',1573,1620,1623,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1624', '乾安县', 'mainland', '1620', ',1573,1620,1624,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1625', '扶余县', 'mainland', '1620', ',1573,1620,1625,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1626', '通化市', 'mainland', '1573', ',1573,1626,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1627', '东昌区', 'mainland', '1626', ',1573,1626,1627,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1628', '二道江区', 'mainland', '1626', ',1573,1626,1628,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1629', '通化县', 'mainland', '1626', ',1573,1626,1629,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1630', '辉南县', 'mainland', '1626', ',1573,1626,1630,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1631', '柳河县', 'mainland', '1626', ',1573,1626,1631,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1632', '梅河口市', 'mainland', '1626', ',1573,1626,1632,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1633', '集安市', 'mainland', '1626', ',1573,1626,1633,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1634', '延边朝鲜族自治州', 'mainland', '1573', ',1573,1634,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1635', '延吉市', 'mainland', '1634', ',1573,1634,1635,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1636', '图们市', 'mainland', '1634', ',1573,1634,1636,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1637', '敦化市', 'mainland', '1634', ',1573,1634,1637,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1638', '珲春市', 'mainland', '1634', ',1573,1634,1638,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1639', '龙井市', 'mainland', '1634', ',1573,1634,1639,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1640', '和龙市', 'mainland', '1634', ',1573,1634,1640,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1641', '汪清县', 'mainland', '1634', ',1573,1634,1641,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1642', '安图县', 'mainland', '1634', ',1573,1634,1642,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1643', '江苏', 'mainland', null, ',1643,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('1644', '南京市', 'mainland', '1643', ',1643,1644,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1645', '玄武区', 'mainland', '1644', ',1643,1644,1645,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1646', '白下区', 'mainland', '1644', ',1643,1644,1646,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1647', '秦淮区', 'mainland', '1644', ',1643,1644,1647,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1648', '建邺区', 'mainland', '1644', ',1643,1644,1648,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1649', '鼓楼区', 'mainland', '1644', ',1643,1644,1649,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1650', '下关区', 'mainland', '1644', ',1643,1644,1650,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1651', '浦口区', 'mainland', '1644', ',1643,1644,1651,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1652', '栖霞区', 'mainland', '1644', ',1643,1644,1652,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1653', '雨花台区', 'mainland', '1644', ',1643,1644,1653,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1654', '江宁区', 'mainland', '1644', ',1643,1644,1654,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1655', '六合区', 'mainland', '1644', ',1643,1644,1655,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1656', '溧水县', 'mainland', '1644', ',1643,1644,1656,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1657', '高淳县', 'mainland', '1644', ',1643,1644,1657,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1658', '常州市', 'mainland', '1643', ',1643,1658,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1659', '天宁区', 'mainland', '1658', ',1643,1658,1659,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1660', '钟楼区', 'mainland', '1658', ',1643,1658,1660,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1661', '戚墅堰区', 'mainland', '1658', ',1643,1658,1661,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1662', '新北区', 'mainland', '1658', ',1643,1658,1662,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1663', '武进区', 'mainland', '1658', ',1643,1658,1663,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1664', '溧阳市', 'mainland', '1658', ',1643,1658,1664,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1665', '金坛市', 'mainland', '1658', ',1643,1658,1665,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1666', '淮安市', 'mainland', '1643', ',1643,1666,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1667', '清河区', 'mainland', '1666', ',1643,1666,1667,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1668', '楚州区', 'mainland', '1666', ',1643,1666,1668,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1669', '淮阴区', 'mainland', '1666', ',1643,1666,1669,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1670', '清浦区', 'mainland', '1666', ',1643,1666,1670,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1671', '涟水县', 'mainland', '1666', ',1643,1666,1671,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1672', '洪泽县', 'mainland', '1666', ',1643,1666,1672,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1673', '盱眙县', 'mainland', '1666', ',1643,1666,1673,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1674', '金湖县', 'mainland', '1666', ',1643,1666,1674,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1675', '连云港市', 'mainland', '1643', ',1643,1675,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1676', '连云区', 'mainland', '1675', ',1643,1675,1676,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1677', '新浦区', 'mainland', '1675', ',1643,1675,1677,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1678', '海州区', 'mainland', '1675', ',1643,1675,1678,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1679', '赣榆县', 'mainland', '1675', ',1643,1675,1679,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1680', '东海县', 'mainland', '1675', ',1643,1675,1680,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1681', '灌云县', 'mainland', '1675', ',1643,1675,1681,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1682', '灌南县', 'mainland', '1675', ',1643,1675,1682,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1683', '南通市', 'mainland', '1643', ',1643,1683,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1684', '崇川区', 'mainland', '1683', ',1643,1683,1684,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1685', '港闸区', 'mainland', '1683', ',1643,1683,1685,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1686', '海安县', 'mainland', '1683', ',1643,1683,1686,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1687', '如东县', 'mainland', '1683', ',1643,1683,1687,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1688', '启东市', 'mainland', '1683', ',1643,1683,1688,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1689', '如皋市', 'mainland', '1683', ',1643,1683,1689,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1690', '通州市', 'mainland', '1683', ',1643,1683,1690,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1691', '海门市', 'mainland', '1683', ',1643,1683,1691,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1692', '苏州市', 'mainland', '1643', ',1643,1692,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1693', '沧浪区', 'mainland', '1692', ',1643,1692,1693,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1694', '平江区', 'mainland', '1692', ',1643,1692,1694,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1695', '金阊区', 'mainland', '1692', ',1643,1692,1695,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1696', '虎丘区', 'mainland', '1692', ',1643,1692,1696,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1697', '吴中区', 'mainland', '1692', ',1643,1692,1697,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1698', '相城区', 'mainland', '1692', ',1643,1692,1698,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1699', '常熟市', 'mainland', '1692', ',1643,1692,1699,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1700', '张家港市', 'mainland', '1692', ',1643,1692,1700,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1701', '昆山市', 'mainland', '1692', ',1643,1692,1701,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1702', '吴江市', 'mainland', '1692', ',1643,1692,1702,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1703', '太仓市', 'mainland', '1692', ',1643,1692,1703,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1704', '宿迁市', 'mainland', '1643', ',1643,1704,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1705', '宿城区', 'mainland', '1704', ',1643,1704,1705,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1706', '宿豫区', 'mainland', '1704', ',1643,1704,1706,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1707', '沭阳县', 'mainland', '1704', ',1643,1704,1707,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1708', '泗阳县', 'mainland', '1704', ',1643,1704,1708,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1709', '泗洪县', 'mainland', '1704', ',1643,1704,1709,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1710', '泰州市', 'mainland', '1643', ',1643,1710,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1711', '海陵区', 'mainland', '1710', ',1643,1710,1711,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1712', '高港区', 'mainland', '1710', ',1643,1710,1712,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1713', '兴化市', 'mainland', '1710', ',1643,1710,1713,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1714', '靖江市', 'mainland', '1710', ',1643,1710,1714,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1715', '泰兴市', 'mainland', '1710', ',1643,1710,1715,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1716', '姜堰市', 'mainland', '1710', ',1643,1710,1716,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1717', '无锡市', 'mainland', '1643', ',1643,1717,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1718', '崇安区', 'mainland', '1717', ',1643,1717,1718,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1719', '南长区', 'mainland', '1717', ',1643,1717,1719,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1720', '北塘区', 'mainland', '1717', ',1643,1717,1720,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1721', '锡山区', 'mainland', '1717', ',1643,1717,1721,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1722', '惠山区', 'mainland', '1717', ',1643,1717,1722,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1723', '滨湖区', 'mainland', '1717', ',1643,1717,1723,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1724', '江阴市', 'mainland', '1717', ',1643,1717,1724,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1725', '宜兴市', 'mainland', '1717', ',1643,1717,1725,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1726', '徐州市', 'mainland', '1643', ',1643,1726,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1727', '鼓楼区', 'mainland', '1726', ',1643,1726,1727,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1728', '云龙区', 'mainland', '1726', ',1643,1726,1728,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1729', '九里区', 'mainland', '1726', ',1643,1726,1729,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1730', '贾汪区', 'mainland', '1726', ',1643,1726,1730,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1731', '泉山区', 'mainland', '1726', ',1643,1726,1731,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1732', '丰县', 'mainland', '1726', ',1643,1726,1732,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1733', '沛县', 'mainland', '1726', ',1643,1726,1733,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1734', '铜山县', 'mainland', '1726', ',1643,1726,1734,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1735', '睢宁县', 'mainland', '1726', ',1643,1726,1735,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1736', '新沂市', 'mainland', '1726', ',1643,1726,1736,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1737', '邳州市', 'mainland', '1726', ',1643,1726,1737,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1738', '盐城市', 'mainland', '1643', ',1643,1738,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1739', '亭湖区', 'mainland', '1738', ',1643,1738,1739,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1740', '盐都区', 'mainland', '1738', ',1643,1738,1740,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1741', '响水县', 'mainland', '1738', ',1643,1738,1741,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1742', '滨海县', 'mainland', '1738', ',1643,1738,1742,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1743', '阜宁县', 'mainland', '1738', ',1643,1738,1743,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1744', '射阳县', 'mainland', '1738', ',1643,1738,1744,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1745', '建湖县', 'mainland', '1738', ',1643,1738,1745,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1746', '东台市', 'mainland', '1738', ',1643,1738,1746,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1747', '大丰市', 'mainland', '1738', ',1643,1738,1747,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1748', '扬州市', 'mainland', '1643', ',1643,1748,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1749', '广陵区', 'mainland', '1748', ',1643,1748,1749,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1750', '邗江区', 'mainland', '1748', ',1643,1748,1750,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1751', '郊区', 'mainland', '1748', ',1643,1748,1751,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1752', '宝应县', 'mainland', '1748', ',1643,1748,1752,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1753', '仪征市', 'mainland', '1748', ',1643,1748,1753,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1754', '高邮市', 'mainland', '1748', ',1643,1748,1754,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1755', '江都市', 'mainland', '1748', ',1643,1748,1755,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1756', '镇江市', 'mainland', '1643', ',1643,1756,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1757', '京口区', 'mainland', '1756', ',1643,1756,1757,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1758', '润州区', 'mainland', '1756', ',1643,1756,1758,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1759', '丹徒区', 'mainland', '1756', ',1643,1756,1759,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1760', '丹阳市', 'mainland', '1756', ',1643,1756,1760,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1761', '扬中市', 'mainland', '1756', ',1643,1756,1761,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1762', '句容市', 'mainland', '1756', ',1643,1756,1762,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1763', '江西', 'mainland', null, ',1763,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('1764', '南昌市', 'mainland', '1763', ',1763,1764,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1765', '东湖区', 'mainland', '1764', ',1763,1764,1765,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1766', '西湖区', 'mainland', '1764', ',1763,1764,1766,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1767', '青云谱区', 'mainland', '1764', ',1763,1764,1767,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1768', '湾里区', 'mainland', '1764', ',1763,1764,1768,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1769', '青山湖区', 'mainland', '1764', ',1763,1764,1769,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1770', '南昌县', 'mainland', '1764', ',1763,1764,1770,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1771', '新建县', 'mainland', '1764', ',1763,1764,1771,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1772', '安义县', 'mainland', '1764', ',1763,1764,1772,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1773', '进贤县', 'mainland', '1764', ',1763,1764,1773,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1774', '抚州市', 'mainland', '1763', ',1763,1774,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1775', '临川区', 'mainland', '1774', ',1763,1774,1775,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1776', '南城县', 'mainland', '1774', ',1763,1774,1776,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1777', '黎川县', 'mainland', '1774', ',1763,1774,1777,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1778', '南丰县', 'mainland', '1774', ',1763,1774,1778,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1779', '崇仁县', 'mainland', '1774', ',1763,1774,1779,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1780', '乐安县', 'mainland', '1774', ',1763,1774,1780,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1781', '宜黄县', 'mainland', '1774', ',1763,1774,1781,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1782', '金溪县', 'mainland', '1774', ',1763,1774,1782,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1783', '资溪县', 'mainland', '1774', ',1763,1774,1783,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1784', '东乡县', 'mainland', '1774', ',1763,1774,1784,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1785', '广昌县', 'mainland', '1774', ',1763,1774,1785,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1786', '赣州市', 'mainland', '1763', ',1763,1786,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1787', '章贡区', 'mainland', '1786', ',1763,1786,1787,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1788', '赣县', 'mainland', '1786', ',1763,1786,1788,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1789', '信丰县', 'mainland', '1786', ',1763,1786,1789,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1790', '大余县', 'mainland', '1786', ',1763,1786,1790,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1791', '上犹县', 'mainland', '1786', ',1763,1786,1791,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1792', '崇义县', 'mainland', '1786', ',1763,1786,1792,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1793', '安远县', 'mainland', '1786', ',1763,1786,1793,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1794', '龙南县', 'mainland', '1786', ',1763,1786,1794,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1795', '定南县', 'mainland', '1786', ',1763,1786,1795,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1796', '全南县', 'mainland', '1786', ',1763,1786,1796,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1797', '宁都县', 'mainland', '1786', ',1763,1786,1797,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1798', '于都县', 'mainland', '1786', ',1763,1786,1798,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1799', '兴国县', 'mainland', '1786', ',1763,1786,1799,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1800', '会昌县', 'mainland', '1786', ',1763,1786,1800,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1801', '寻乌县', 'mainland', '1786', ',1763,1786,1801,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1802', '石城县', 'mainland', '1786', ',1763,1786,1802,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1803', '瑞金市', 'mainland', '1786', ',1763,1786,1803,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1804', '南康市', 'mainland', '1786', ',1763,1786,1804,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1805', '吉安市', 'mainland', '1763', ',1763,1805,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1806', '吉州区', 'mainland', '1805', ',1763,1805,1806,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1807', '青原区', 'mainland', '1805', ',1763,1805,1807,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1808', '吉安县', 'mainland', '1805', ',1763,1805,1808,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1809', '吉水县', 'mainland', '1805', ',1763,1805,1809,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1810', '峡江县', 'mainland', '1805', ',1763,1805,1810,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1811', '新干县', 'mainland', '1805', ',1763,1805,1811,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1812', '永丰县', 'mainland', '1805', ',1763,1805,1812,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1813', '泰和县', 'mainland', '1805', ',1763,1805,1813,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1814', '遂川县', 'mainland', '1805', ',1763,1805,1814,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1815', '万安县', 'mainland', '1805', ',1763,1805,1815,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1816', '安福县', 'mainland', '1805', ',1763,1805,1816,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1817', '永新县', 'mainland', '1805', ',1763,1805,1817,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1818', '井冈山市', 'mainland', '1805', ',1763,1805,1818,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1819', '景德镇市', 'mainland', '1763', ',1763,1819,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1820', '昌江区', 'mainland', '1819', ',1763,1819,1820,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1821', '珠山区', 'mainland', '1819', ',1763,1819,1821,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1822', '浮梁县', 'mainland', '1819', ',1763,1819,1822,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1823', '乐平市', 'mainland', '1819', ',1763,1819,1823,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1824', '九江市', 'mainland', '1763', ',1763,1824,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1825', '庐山区', 'mainland', '1824', ',1763,1824,1825,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1826', '浔阳区', 'mainland', '1824', ',1763,1824,1826,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1827', '九江县', 'mainland', '1824', ',1763,1824,1827,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1828', '武宁县', 'mainland', '1824', ',1763,1824,1828,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1829', '修水县', 'mainland', '1824', ',1763,1824,1829,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1830', '永修县', 'mainland', '1824', ',1763,1824,1830,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1831', '德安县', 'mainland', '1824', ',1763,1824,1831,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1832', '星子县', 'mainland', '1824', ',1763,1824,1832,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1833', '都昌县', 'mainland', '1824', ',1763,1824,1833,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1834', '湖口县', 'mainland', '1824', ',1763,1824,1834,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1835', '彭泽县', 'mainland', '1824', ',1763,1824,1835,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1836', '瑞昌市', 'mainland', '1824', ',1763,1824,1836,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1837', '萍乡市', 'mainland', '1763', ',1763,1837,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1838', '安源区', 'mainland', '1837', ',1763,1837,1838,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1839', '湘东区', 'mainland', '1837', ',1763,1837,1839,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1840', '莲花县', 'mainland', '1837', ',1763,1837,1840,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1841', '上栗县', 'mainland', '1837', ',1763,1837,1841,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1842', '芦溪县', 'mainland', '1837', ',1763,1837,1842,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1843', '上饶市', 'mainland', '1763', ',1763,1843,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1844', '信州区', 'mainland', '1843', ',1763,1843,1844,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1845', '上饶县', 'mainland', '1843', ',1763,1843,1845,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1846', '广丰县', 'mainland', '1843', ',1763,1843,1846,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1847', '玉山县', 'mainland', '1843', ',1763,1843,1847,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1848', '铅山县', 'mainland', '1843', ',1763,1843,1848,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1849', '横峰县', 'mainland', '1843', ',1763,1843,1849,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1850', '弋阳县', 'mainland', '1843', ',1763,1843,1850,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1851', '余干县', 'mainland', '1843', ',1763,1843,1851,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1852', '鄱阳县', 'mainland', '1843', ',1763,1843,1852,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1853', '万年县', 'mainland', '1843', ',1763,1843,1853,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1854', '婺源县', 'mainland', '1843', ',1763,1843,1854,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1855', '德兴市', 'mainland', '1843', ',1763,1843,1855,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1856', '新余市', 'mainland', '1763', ',1763,1856,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1857', '渝水区', 'mainland', '1856', ',1763,1856,1857,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1858', '分宜县', 'mainland', '1856', ',1763,1856,1858,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1859', '宜春市', 'mainland', '1763', ',1763,1859,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1860', '袁州区', 'mainland', '1859', ',1763,1859,1860,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1861', '奉新县', 'mainland', '1859', ',1763,1859,1861,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1862', '万载县', 'mainland', '1859', ',1763,1859,1862,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1863', '上高县', 'mainland', '1859', ',1763,1859,1863,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1864', '宜丰县', 'mainland', '1859', ',1763,1859,1864,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1865', '靖安县', 'mainland', '1859', ',1763,1859,1865,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1866', '铜鼓县', 'mainland', '1859', ',1763,1859,1866,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1867', '丰城市', 'mainland', '1859', ',1763,1859,1867,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1868', '樟树市', 'mainland', '1859', ',1763,1859,1868,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1869', '高安市', 'mainland', '1859', ',1763,1859,1869,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1870', '鹰潭市', 'mainland', '1763', ',1763,1870,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1871', '月湖区', 'mainland', '1870', ',1763,1870,1871,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1872', '余江县', 'mainland', '1870', ',1763,1870,1872,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1873', '贵溪市', 'mainland', '1870', ',1763,1870,1873,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1874', '辽宁', 'mainland', null, ',1874,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('1875', '沈阳市', 'mainland', '1874', ',1874,1875,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1876', '和平区', 'mainland', '1875', ',1874,1875,1876,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1877', '沈河区', 'mainland', '1875', ',1874,1875,1877,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1878', '大东区', 'mainland', '1875', ',1874,1875,1878,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1879', '皇姑区', 'mainland', '1875', ',1874,1875,1879,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1880', '铁西区', 'mainland', '1875', ',1874,1875,1880,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1881', '苏家屯区', 'mainland', '1875', ',1874,1875,1881,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1882', '东陵区', 'mainland', '1875', ',1874,1875,1882,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1883', '新城子区', 'mainland', '1875', ',1874,1875,1883,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1884', '于洪区', 'mainland', '1875', ',1874,1875,1884,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1885', '辽中县', 'mainland', '1875', ',1874,1875,1885,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1886', '康平县', 'mainland', '1875', ',1874,1875,1886,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1887', '法库县', 'mainland', '1875', ',1874,1875,1887,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1888', '新民市', 'mainland', '1875', ',1874,1875,1888,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1889', '鞍山市', 'mainland', '1874', ',1874,1889,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1890', '铁东区', 'mainland', '1889', ',1874,1889,1890,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1891', '铁西区', 'mainland', '1889', ',1874,1889,1891,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1892', '立山区', 'mainland', '1889', ',1874,1889,1892,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1893', '千山区', 'mainland', '1889', ',1874,1889,1893,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1894', '台安县', 'mainland', '1889', ',1874,1889,1894,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1895', '岫岩满族自治县', 'mainland', '1889', ',1874,1889,1895,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1896', '海城市', 'mainland', '1889', ',1874,1889,1896,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1897', '本溪市', 'mainland', '1874', ',1874,1897,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1898', '平山区', 'mainland', '1897', ',1874,1897,1898,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1899', '溪湖区', 'mainland', '1897', ',1874,1897,1899,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1900', '明山区', 'mainland', '1897', ',1874,1897,1900,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1901', '南芬区', 'mainland', '1897', ',1874,1897,1901,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1902', '本溪满族自治县', 'mainland', '1897', ',1874,1897,1902,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1903', '桓仁满族自治县', 'mainland', '1897', ',1874,1897,1903,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1904', '朝阳市', 'mainland', '1874', ',1874,1904,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1905', '双塔区', 'mainland', '1904', ',1874,1904,1905,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1906', '龙城区', 'mainland', '1904', ',1874,1904,1906,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1907', '朝阳县', 'mainland', '1904', ',1874,1904,1907,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1908', '建平县', 'mainland', '1904', ',1874,1904,1908,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1909', '喀喇沁左翼蒙古族自治县', 'mainland', '1904', ',1874,1904,1909,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1910', '北票市', 'mainland', '1904', ',1874,1904,1910,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1911', '凌源市', 'mainland', '1904', ',1874,1904,1911,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1912', '大连市', 'mainland', '1874', ',1874,1912,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1913', '中山区', 'mainland', '1912', ',1874,1912,1913,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1914', '西岗区', 'mainland', '1912', ',1874,1912,1914,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1915', '沙河口区', 'mainland', '1912', ',1874,1912,1915,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1916', '甘井子区', 'mainland', '1912', ',1874,1912,1916,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1917', '旅顺口区', 'mainland', '1912', ',1874,1912,1917,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1918', '金州区', 'mainland', '1912', ',1874,1912,1918,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1919', '长海县', 'mainland', '1912', ',1874,1912,1919,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1920', '瓦房店市', 'mainland', '1912', ',1874,1912,1920,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1921', '普兰店市', 'mainland', '1912', ',1874,1912,1921,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1922', '庄河市', 'mainland', '1912', ',1874,1912,1922,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1923', '丹东市', 'mainland', '1874', ',1874,1923,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1924', '元宝区', 'mainland', '1923', ',1874,1923,1924,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1925', '振兴区', 'mainland', '1923', ',1874,1923,1925,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1926', '振安区', 'mainland', '1923', ',1874,1923,1926,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1927', '宽甸满族自治县', 'mainland', '1923', ',1874,1923,1927,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1928', '东港市', 'mainland', '1923', ',1874,1923,1928,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1929', '凤城市', 'mainland', '1923', ',1874,1923,1929,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1930', '抚顺市', 'mainland', '1874', ',1874,1930,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1931', '新抚区', 'mainland', '1930', ',1874,1930,1931,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1932', '东洲区', 'mainland', '1930', ',1874,1930,1932,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1933', '望花区', 'mainland', '1930', ',1874,1930,1933,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1934', '顺城区', 'mainland', '1930', ',1874,1930,1934,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1935', '抚顺县', 'mainland', '1930', ',1874,1930,1935,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1936', '新宾满族自治县', 'mainland', '1930', ',1874,1930,1936,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1937', '清原满族自治县', 'mainland', '1930', ',1874,1930,1937,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1938', '阜新市', 'mainland', '1874', ',1874,1938,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1939', '海州区', 'mainland', '1938', ',1874,1938,1939,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1940', '新邱区', 'mainland', '1938', ',1874,1938,1940,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1941', '太平区', 'mainland', '1938', ',1874,1938,1941,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1942', '清河门区', 'mainland', '1938', ',1874,1938,1942,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1943', '细河区', 'mainland', '1938', ',1874,1938,1943,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1944', '阜新蒙古族自治县', 'mainland', '1938', ',1874,1938,1944,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1945', '彰武县', 'mainland', '1938', ',1874,1938,1945,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1946', '葫芦岛市', 'mainland', '1874', ',1874,1946,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1947', '连山区', 'mainland', '1946', ',1874,1946,1947,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1948', '龙港区', 'mainland', '1946', ',1874,1946,1948,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1949', '南票区', 'mainland', '1946', ',1874,1946,1949,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1950', '绥中县', 'mainland', '1946', ',1874,1946,1950,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1951', '建昌县', 'mainland', '1946', ',1874,1946,1951,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1952', '兴城市', 'mainland', '1946', ',1874,1946,1952,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1953', '锦州市', 'mainland', '1874', ',1874,1953,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1954', '古塔区', 'mainland', '1953', ',1874,1953,1954,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1955', '凌河区', 'mainland', '1953', ',1874,1953,1955,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1956', '太和区', 'mainland', '1953', ',1874,1953,1956,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1957', '黑山县', 'mainland', '1953', ',1874,1953,1957,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1958', '义县', 'mainland', '1953', ',1874,1953,1958,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1959', '凌海市', 'mainland', '1953', ',1874,1953,1959,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1960', '北宁市', 'mainland', '1953', ',1874,1953,1960,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1961', '辽阳市', 'mainland', '1874', ',1874,1961,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1962', '白塔区', 'mainland', '1961', ',1874,1961,1962,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1963', '文圣区', 'mainland', '1961', ',1874,1961,1963,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1964', '宏伟区', 'mainland', '1961', ',1874,1961,1964,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1965', '弓长岭区', 'mainland', '1961', ',1874,1961,1965,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1966', '太子河区', 'mainland', '1961', ',1874,1961,1966,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1967', '辽阳县', 'mainland', '1961', ',1874,1961,1967,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1968', '灯塔市', 'mainland', '1961', ',1874,1961,1968,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1969', '盘锦市', 'mainland', '1874', ',1874,1969,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1970', '双台子区', 'mainland', '1969', ',1874,1969,1970,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1971', '兴隆台区', 'mainland', '1969', ',1874,1969,1971,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1972', '大洼县', 'mainland', '1969', ',1874,1969,1972,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1973', '盘山县', 'mainland', '1969', ',1874,1969,1973,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1974', '铁岭市', 'mainland', '1874', ',1874,1974,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1975', '银州区', 'mainland', '1974', ',1874,1974,1975,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1976', '清河区', 'mainland', '1974', ',1874,1974,1976,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1977', '铁岭县', 'mainland', '1974', ',1874,1974,1977,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1978', '西丰县', 'mainland', '1974', ',1874,1974,1978,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1979', '昌图县', 'mainland', '1974', ',1874,1974,1979,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1980', '调兵山市', 'mainland', '1974', ',1874,1974,1980,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1981', '开原市', 'mainland', '1974', ',1874,1974,1981,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1982', '营口市', 'mainland', '1874', ',1874,1982,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1983', '站前区', 'mainland', '1982', ',1874,1982,1983,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1984', '西市区', 'mainland', '1982', ',1874,1982,1984,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1985', '鲅鱼圈区', 'mainland', '1982', ',1874,1982,1985,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1986', '老边区', 'mainland', '1982', ',1874,1982,1986,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1987', '盖州市', 'mainland', '1982', ',1874,1982,1987,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1988', '大石桥市', 'mainland', '1982', ',1874,1982,1988,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1989', '内蒙古', 'mainland', null, ',1989,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('1990', '呼和浩特市', 'mainland', '1989', ',1989,1990,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1991', '新城区', 'mainland', '1990', ',1989,1990,1991,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1992', '回民区', 'mainland', '1990', ',1989,1990,1992,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1993', '玉泉区', 'mainland', '1990', ',1989,1990,1993,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1994', '赛罕区', 'mainland', '1990', ',1989,1990,1994,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1995', '土默特左旗', 'mainland', '1990', ',1989,1990,1995,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1996', '托克托县', 'mainland', '1990', ',1989,1990,1996,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1997', '和林格尔县', 'mainland', '1990', ',1989,1990,1997,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1998', '清水河县', 'mainland', '1990', ',1989,1990,1998,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('1999', '武川县', 'mainland', '1990', ',1989,1990,1999,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2000', '阿拉善盟', 'mainland', '1989', ',1989,2000,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2001', '阿拉善左旗', 'mainland', '2000', ',1989,2000,2001,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2002', '阿拉善右旗', 'mainland', '2000', ',1989,2000,2002,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2003', '额济纳旗', 'mainland', '2000', ',1989,2000,2003,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2004', '巴彦淖尔市', 'mainland', '1989', ',1989,2004,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2005', '临河区', 'mainland', '2004', ',1989,2004,2005,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2006', '五原县', 'mainland', '2004', ',1989,2004,2006,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2007', '磴口县', 'mainland', '2004', ',1989,2004,2007,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2008', '乌拉特前旗', 'mainland', '2004', ',1989,2004,2008,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2009', '乌拉特中旗', 'mainland', '2004', ',1989,2004,2009,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2010', '乌拉特后旗', 'mainland', '2004', ',1989,2004,2010,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2011', '杭锦后旗', 'mainland', '2004', ',1989,2004,2011,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2012', '包头市', 'mainland', '1989', ',1989,2012,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2013', '东河区', 'mainland', '2012', ',1989,2012,2013,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2014', '昆都仑区', 'mainland', '2012', ',1989,2012,2014,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2015', '青山区', 'mainland', '2012', ',1989,2012,2015,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2016', '石拐区', 'mainland', '2012', ',1989,2012,2016,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2017', '白云矿区', 'mainland', '2012', ',1989,2012,2017,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2018', '九原区', 'mainland', '2012', ',1989,2012,2018,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2019', '土默特右旗', 'mainland', '2012', ',1989,2012,2019,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2020', '固阳县', 'mainland', '2012', ',1989,2012,2020,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2021', '达尔罕茂明安联合旗', 'mainland', '2012', ',1989,2012,2021,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2022', '赤峰市', 'mainland', '1989', ',1989,2022,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2023', '红山区', 'mainland', '2022', ',1989,2022,2023,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2024', '元宝山区', 'mainland', '2022', ',1989,2022,2024,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2025', '松山区', 'mainland', '2022', ',1989,2022,2025,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2026', '阿鲁科尔沁旗', 'mainland', '2022', ',1989,2022,2026,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2027', '巴林左旗', 'mainland', '2022', ',1989,2022,2027,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2028', '巴林右旗', 'mainland', '2022', ',1989,2022,2028,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2029', '林西县', 'mainland', '2022', ',1989,2022,2029,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2030', '克什克腾旗', 'mainland', '2022', ',1989,2022,2030,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2031', '翁牛特旗', 'mainland', '2022', ',1989,2022,2031,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2032', '喀喇沁旗', 'mainland', '2022', ',1989,2022,2032,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2033', '宁城县', 'mainland', '2022', ',1989,2022,2033,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2034', '敖汉旗', 'mainland', '2022', ',1989,2022,2034,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2035', '鄂尔多斯市', 'mainland', '1989', ',1989,2035,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2036', '东胜区', 'mainland', '2035', ',1989,2035,2036,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2037', '达拉特旗', 'mainland', '2035', ',1989,2035,2037,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2038', '准格尔旗', 'mainland', '2035', ',1989,2035,2038,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2039', '鄂托克前旗', 'mainland', '2035', ',1989,2035,2039,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2040', '鄂托克旗', 'mainland', '2035', ',1989,2035,2040,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2041', '杭锦旗', 'mainland', '2035', ',1989,2035,2041,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2042', '乌审旗', 'mainland', '2035', ',1989,2035,2042,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2043', '伊金霍洛旗', 'mainland', '2035', ',1989,2035,2043,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2044', '呼伦贝尔市', 'mainland', '1989', ',1989,2044,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2045', '海拉尔区', 'mainland', '2044', ',1989,2044,2045,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2046', '阿荣旗', 'mainland', '2044', ',1989,2044,2046,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2047', '莫力达瓦达斡尔族自治旗', 'mainland', '2044', ',1989,2044,2047,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2048', '鄂伦春自治旗', 'mainland', '2044', ',1989,2044,2048,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2049', '鄂温克族自治旗', 'mainland', '2044', ',1989,2044,2049,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2050', '陈巴尔虎旗', 'mainland', '2044', ',1989,2044,2050,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2051', '新巴尔虎左旗', 'mainland', '2044', ',1989,2044,2051,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2052', '新巴尔虎右旗', 'mainland', '2044', ',1989,2044,2052,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2053', '满洲里市', 'mainland', '2044', ',1989,2044,2053,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2054', '牙克石市', 'mainland', '2044', ',1989,2044,2054,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2055', '扎兰屯市', 'mainland', '2044', ',1989,2044,2055,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2056', '额尔古纳市', 'mainland', '2044', ',1989,2044,2056,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2057', '根河市', 'mainland', '2044', ',1989,2044,2057,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2058', '通辽市', 'mainland', '1989', ',1989,2058,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2059', '科尔沁区', 'mainland', '2058', ',1989,2058,2059,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2060', '科尔沁左翼中旗', 'mainland', '2058', ',1989,2058,2060,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2061', '科尔沁左翼后旗', 'mainland', '2058', ',1989,2058,2061,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2062', '开鲁县', 'mainland', '2058', ',1989,2058,2062,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2063', '库伦旗', 'mainland', '2058', ',1989,2058,2063,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2064', '奈曼旗', 'mainland', '2058', ',1989,2058,2064,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2065', '扎鲁特旗', 'mainland', '2058', ',1989,2058,2065,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2066', '霍林郭勒市', 'mainland', '2058', ',1989,2058,2066,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2067', '乌海市', 'mainland', '1989', ',1989,2067,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2068', '海勃湾区', 'mainland', '2067', ',1989,2067,2068,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2069', '海南区', 'mainland', '2067', ',1989,2067,2069,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2070', '乌达区', 'mainland', '2067', ',1989,2067,2070,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2071', '乌兰察布市', 'mainland', '1989', ',1989,2071,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2072', '集宁区', 'mainland', '2071', ',1989,2071,2072,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2073', '卓资县', 'mainland', '2071', ',1989,2071,2073,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2074', '化德县', 'mainland', '2071', ',1989,2071,2074,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2075', '商都县', 'mainland', '2071', ',1989,2071,2075,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2076', '兴和县', 'mainland', '2071', ',1989,2071,2076,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2077', '凉城县', 'mainland', '2071', ',1989,2071,2077,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2078', '察哈尔右翼前旗', 'mainland', '2071', ',1989,2071,2078,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2079', '察哈尔右翼中旗', 'mainland', '2071', ',1989,2071,2079,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2080', '察哈尔右翼后旗', 'mainland', '2071', ',1989,2071,2080,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2081', '四子王旗', 'mainland', '2071', ',1989,2071,2081,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2082', '丰镇市', 'mainland', '2071', ',1989,2071,2082,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2083', '锡林郭勒盟', 'mainland', '1989', ',1989,2083,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2084', '二连浩特市', 'mainland', '2083', ',1989,2083,2084,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2085', '锡林浩特市', 'mainland', '2083', ',1989,2083,2085,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2086', '阿巴嘎旗', 'mainland', '2083', ',1989,2083,2086,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2087', '苏尼特左旗', 'mainland', '2083', ',1989,2083,2087,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2088', '苏尼特右旗', 'mainland', '2083', ',1989,2083,2088,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2089', '东乌珠穆沁旗', 'mainland', '2083', ',1989,2083,2089,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2090', '西乌珠穆沁旗', 'mainland', '2083', ',1989,2083,2090,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2091', '太仆寺旗', 'mainland', '2083', ',1989,2083,2091,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2092', '镶黄旗', 'mainland', '2083', ',1989,2083,2092,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2093', '正镶白旗', 'mainland', '2083', ',1989,2083,2093,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2094', '正蓝旗', 'mainland', '2083', ',1989,2083,2094,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2095', '多伦县', 'mainland', '2083', ',1989,2083,2095,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2096', '兴安盟', 'mainland', '1989', ',1989,2096,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2097', '乌兰浩特市', 'mainland', '2096', ',1989,2096,2097,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2098', '阿尔山市', 'mainland', '2096', ',1989,2096,2098,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2099', '科尔沁右翼前旗', 'mainland', '2096', ',1989,2096,2099,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2100', '科尔沁右翼中旗', 'mainland', '2096', ',1989,2096,2100,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2101', '扎赉特旗', 'mainland', '2096', ',1989,2096,2101,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2102', '突泉县', 'mainland', '2096', ',1989,2096,2102,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2103', '宁夏', 'mainland', null, ',2103,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('2104', '银川市', 'mainland', '2103', ',2103,2104,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2105', '兴庆区', 'mainland', '2104', ',2103,2104,2105,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2106', '西夏区', 'mainland', '2104', ',2103,2104,2106,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2107', '金凤区', 'mainland', '2104', ',2103,2104,2107,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2108', '永宁县', 'mainland', '2104', ',2103,2104,2108,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2109', '贺兰县', 'mainland', '2104', ',2103,2104,2109,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2110', '灵武市', 'mainland', '2104', ',2103,2104,2110,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2111', '固原市', 'mainland', '2103', ',2103,2111,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2112', '原州区', 'mainland', '2111', ',2103,2111,2112,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2113', '西吉县', 'mainland', '2111', ',2103,2111,2113,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2114', '隆德县', 'mainland', '2111', ',2103,2111,2114,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2115', '泾源县', 'mainland', '2111', ',2103,2111,2115,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2116', '彭阳县', 'mainland', '2111', ',2103,2111,2116,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2117', '石嘴山市', 'mainland', '2103', ',2103,2117,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2118', '大武口区', 'mainland', '2117', ',2103,2117,2118,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2119', '惠农区', 'mainland', '2117', ',2103,2117,2119,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2120', '平罗县', 'mainland', '2117', ',2103,2117,2120,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2121', '吴忠市', 'mainland', '2103', ',2103,2121,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2122', '利通区', 'mainland', '2121', ',2103,2121,2122,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2123', '盐池县', 'mainland', '2121', ',2103,2121,2123,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2124', '同心县', 'mainland', '2121', ',2103,2121,2124,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2125', '青铜峡市', 'mainland', '2121', ',2103,2121,2125,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2126', '中卫市', 'mainland', '2103', ',2103,2126,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2127', '沙坡头区', 'mainland', '2126', ',2103,2126,2127,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2128', '中宁县', 'mainland', '2126', ',2103,2126,2128,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2129', '海原县', 'mainland', '2126', ',2103,2126,2129,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2130', '青海', 'mainland', null, ',2130,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('2131', '西宁市', 'mainland', '2130', ',2130,2131,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2132', '城东区', 'mainland', '2131', ',2130,2131,2132,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2133', '城中区', 'mainland', '2131', ',2130,2131,2133,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2134', '城西区', 'mainland', '2131', ',2130,2131,2134,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2135', '城北区', 'mainland', '2131', ',2130,2131,2135,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2136', '大通回族土族自治县', 'mainland', '2131', ',2130,2131,2136,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2137', '湟中县', 'mainland', '2131', ',2130,2131,2137,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2138', '湟源县', 'mainland', '2131', ',2130,2131,2138,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2139', '果洛藏族自治州', 'mainland', '2130', ',2130,2139,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2140', '玛沁县', 'mainland', '2139', ',2130,2139,2140,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2141', '班玛县', 'mainland', '2139', ',2130,2139,2141,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2142', '甘德县', 'mainland', '2139', ',2130,2139,2142,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2143', '达日县', 'mainland', '2139', ',2130,2139,2143,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2144', '久治县', 'mainland', '2139', ',2130,2139,2144,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2145', '玛多县', 'mainland', '2139', ',2130,2139,2145,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2146', '海北藏族自治州', 'mainland', '2130', ',2130,2146,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2147', '门源回族自治县', 'mainland', '2146', ',2130,2146,2147,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2148', '祁连县', 'mainland', '2146', ',2130,2146,2148,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2149', '海晏县', 'mainland', '2146', ',2130,2146,2149,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2150', '刚察县', 'mainland', '2146', ',2130,2146,2150,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2151', '海东地区', 'mainland', '2130', ',2130,2151,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2152', '平安县', 'mainland', '2151', ',2130,2151,2152,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2153', '民和回族土族自治县', 'mainland', '2151', ',2130,2151,2153,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2154', '乐都县', 'mainland', '2151', ',2130,2151,2154,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2155', '互助土族自治县', 'mainland', '2151', ',2130,2151,2155,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2156', '化隆回族自治县', 'mainland', '2151', ',2130,2151,2156,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2157', '循化撒拉族自治县', 'mainland', '2151', ',2130,2151,2157,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2158', '海南藏族自治州', 'mainland', '2130', ',2130,2158,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2159', '共和县', 'mainland', '2158', ',2130,2158,2159,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2160', '同德县', 'mainland', '2158', ',2130,2158,2160,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2161', '贵德县', 'mainland', '2158', ',2130,2158,2161,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2162', '兴海县', 'mainland', '2158', ',2130,2158,2162,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2163', '贵南县', 'mainland', '2158', ',2130,2158,2163,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2164', '海西蒙古族藏族自治州', 'mainland', '2130', ',2130,2164,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2165', '格尔木市', 'mainland', '2164', ',2130,2164,2165,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2166', '德令哈市', 'mainland', '2164', ',2130,2164,2166,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2167', '乌兰县', 'mainland', '2164', ',2130,2164,2167,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2168', '都兰县', 'mainland', '2164', ',2130,2164,2168,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2169', '天峻县', 'mainland', '2164', ',2130,2164,2169,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2170', '黄南藏族自治州', 'mainland', '2130', ',2130,2170,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2171', '同仁县', 'mainland', '2170', ',2130,2170,2171,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2172', '尖扎县', 'mainland', '2170', ',2130,2170,2172,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2173', '泽库县', 'mainland', '2170', ',2130,2170,2173,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2174', '河南蒙古族自治县', 'mainland', '2170', ',2130,2170,2174,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2175', '玉树藏族自治州', 'mainland', '2130', ',2130,2175,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2176', '玉树县', 'mainland', '2175', ',2130,2175,2176,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2177', '杂多县', 'mainland', '2175', ',2130,2175,2177,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2178', '称多县', 'mainland', '2175', ',2130,2175,2178,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2179', '治多县', 'mainland', '2175', ',2130,2175,2179,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2180', '囊谦县', 'mainland', '2175', ',2130,2175,2180,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2181', '曲麻莱县', 'mainland', '2175', ',2130,2175,2181,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2182', '山东', 'mainland', null, ',2182,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('2183', '济南市', 'mainland', '2182', ',2182,2183,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2184', '历下区', 'mainland', '2183', ',2182,2183,2184,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2185', '市中区', 'mainland', '2183', ',2182,2183,2185,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2186', '槐荫区', 'mainland', '2183', ',2182,2183,2186,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2187', '天桥区', 'mainland', '2183', ',2182,2183,2187,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2188', '历城区', 'mainland', '2183', ',2182,2183,2188,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2189', '长清区', 'mainland', '2183', ',2182,2183,2189,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2190', '平阴县', 'mainland', '2183', ',2182,2183,2190,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2191', '济阳县', 'mainland', '2183', ',2182,2183,2191,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2192', '商河县', 'mainland', '2183', ',2182,2183,2192,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2193', '章丘市', 'mainland', '2183', ',2182,2183,2193,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2194', '滨州市', 'mainland', '2182', ',2182,2194,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2195', '滨城区', 'mainland', '2194', ',2182,2194,2195,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2196', '惠民县', 'mainland', '2194', ',2182,2194,2196,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2197', '阳信县', 'mainland', '2194', ',2182,2194,2197,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2198', '无棣县', 'mainland', '2194', ',2182,2194,2198,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2199', '沾化县', 'mainland', '2194', ',2182,2194,2199,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2200', '博兴县', 'mainland', '2194', ',2182,2194,2200,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2201', '邹平县', 'mainland', '2194', ',2182,2194,2201,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2202', '德州市', 'mainland', '2182', ',2182,2202,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2203', '德城区', 'mainland', '2202', ',2182,2202,2203,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2204', '陵县', 'mainland', '2202', ',2182,2202,2204,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2205', '宁津县', 'mainland', '2202', ',2182,2202,2205,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2206', '庆云县', 'mainland', '2202', ',2182,2202,2206,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2207', '临邑县', 'mainland', '2202', ',2182,2202,2207,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2208', '齐河县', 'mainland', '2202', ',2182,2202,2208,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2209', '平原县', 'mainland', '2202', ',2182,2202,2209,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2210', '夏津县', 'mainland', '2202', ',2182,2202,2210,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2211', '武城县', 'mainland', '2202', ',2182,2202,2211,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2212', '乐陵市', 'mainland', '2202', ',2182,2202,2212,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2213', '禹城市', 'mainland', '2202', ',2182,2202,2213,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2214', '东营市', 'mainland', '2182', ',2182,2214,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2215', '东营区', 'mainland', '2214', ',2182,2214,2215,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2216', '河口区', 'mainland', '2214', ',2182,2214,2216,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2217', '垦利县', 'mainland', '2214', ',2182,2214,2217,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2218', '利津县', 'mainland', '2214', ',2182,2214,2218,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2219', '广饶县', 'mainland', '2214', ',2182,2214,2219,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2220', '菏泽市', 'mainland', '2182', ',2182,2220,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2221', '牡丹区', 'mainland', '2220', ',2182,2220,2221,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2222', '曹县', 'mainland', '2220', ',2182,2220,2222,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2223', '单县', 'mainland', '2220', ',2182,2220,2223,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2224', '成武县', 'mainland', '2220', ',2182,2220,2224,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2225', '巨野县', 'mainland', '2220', ',2182,2220,2225,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2226', '郓城县', 'mainland', '2220', ',2182,2220,2226,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2227', '鄄城县', 'mainland', '2220', ',2182,2220,2227,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2228', '定陶县', 'mainland', '2220', ',2182,2220,2228,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2229', '东明县', 'mainland', '2220', ',2182,2220,2229,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2230', '济宁市', 'mainland', '2182', ',2182,2230,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2231', '市中区', 'mainland', '2230', ',2182,2230,2231,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2232', '任城区', 'mainland', '2230', ',2182,2230,2232,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2233', '微山县', 'mainland', '2230', ',2182,2230,2233,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2234', '鱼台县', 'mainland', '2230', ',2182,2230,2234,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2235', '金乡县', 'mainland', '2230', ',2182,2230,2235,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2236', '嘉祥县', 'mainland', '2230', ',2182,2230,2236,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2237', '汶上县', 'mainland', '2230', ',2182,2230,2237,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2238', '泗水县', 'mainland', '2230', ',2182,2230,2238,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2239', '梁山县', 'mainland', '2230', ',2182,2230,2239,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2240', '曲阜市', 'mainland', '2230', ',2182,2230,2240,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2241', '兖州市', 'mainland', '2230', ',2182,2230,2241,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2242', '邹城市', 'mainland', '2230', ',2182,2230,2242,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2243', '莱芜市', 'mainland', '2182', ',2182,2243,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2244', '莱城区', 'mainland', '2243', ',2182,2243,2244,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2245', '钢城区', 'mainland', '2243', ',2182,2243,2245,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2246', '聊城市', 'mainland', '2182', ',2182,2246,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2247', '东昌府区', 'mainland', '2246', ',2182,2246,2247,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2248', '阳谷县', 'mainland', '2246', ',2182,2246,2248,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2249', '莘县', 'mainland', '2246', ',2182,2246,2249,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2250', '茌平县', 'mainland', '2246', ',2182,2246,2250,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2251', '东阿县', 'mainland', '2246', ',2182,2246,2251,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2252', '冠县', 'mainland', '2246', ',2182,2246,2252,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2253', '高唐县', 'mainland', '2246', ',2182,2246,2253,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2254', '临清市', 'mainland', '2246', ',2182,2246,2254,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2255', '临沂市', 'mainland', '2182', ',2182,2255,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2256', '兰山区', 'mainland', '2255', ',2182,2255,2256,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2257', '罗庄区', 'mainland', '2255', ',2182,2255,2257,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2258', '河东区', 'mainland', '2255', ',2182,2255,2258,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2259', '沂南县', 'mainland', '2255', ',2182,2255,2259,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2260', '郯城县', 'mainland', '2255', ',2182,2255,2260,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2261', '沂水县', 'mainland', '2255', ',2182,2255,2261,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2262', '苍山县', 'mainland', '2255', ',2182,2255,2262,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2263', '费县', 'mainland', '2255', ',2182,2255,2263,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2264', '平邑县', 'mainland', '2255', ',2182,2255,2264,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2265', '莒南县', 'mainland', '2255', ',2182,2255,2265,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2266', '蒙阴县', 'mainland', '2255', ',2182,2255,2266,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2267', '临沭县', 'mainland', '2255', ',2182,2255,2267,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2268', '青岛市', 'mainland', '2182', ',2182,2268,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2269', '市南区', 'mainland', '2268', ',2182,2268,2269,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2270', '市北区', 'mainland', '2268', ',2182,2268,2270,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2271', '四方区', 'mainland', '2268', ',2182,2268,2271,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2272', '黄岛区', 'mainland', '2268', ',2182,2268,2272,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2273', '崂山区', 'mainland', '2268', ',2182,2268,2273,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2274', '李沧区', 'mainland', '2268', ',2182,2268,2274,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2275', '城阳区', 'mainland', '2268', ',2182,2268,2275,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2276', '胶州市', 'mainland', '2268', ',2182,2268,2276,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2277', '即墨市', 'mainland', '2268', ',2182,2268,2277,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2278', '平度市', 'mainland', '2268', ',2182,2268,2278,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2279', '胶南市', 'mainland', '2268', ',2182,2268,2279,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2280', '莱西市', 'mainland', '2268', ',2182,2268,2280,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2281', '日照市', 'mainland', '2182', ',2182,2281,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2282', '东港区', 'mainland', '2281', ',2182,2281,2282,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2283', '岚山区', 'mainland', '2281', ',2182,2281,2283,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2284', '五莲县', 'mainland', '2281', ',2182,2281,2284,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2285', '莒县', 'mainland', '2281', ',2182,2281,2285,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2286', '泰安市', 'mainland', '2182', ',2182,2286,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2287', '泰山区', 'mainland', '2286', ',2182,2286,2287,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2288', '岱岳区', 'mainland', '2286', ',2182,2286,2288,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2289', '宁阳县', 'mainland', '2286', ',2182,2286,2289,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2290', '东平县', 'mainland', '2286', ',2182,2286,2290,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2291', '新泰市', 'mainland', '2286', ',2182,2286,2291,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2292', '肥城市', 'mainland', '2286', ',2182,2286,2292,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2293', '威海市', 'mainland', '2182', ',2182,2293,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2294', '环翠区', 'mainland', '2293', ',2182,2293,2294,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2295', '文登市', 'mainland', '2293', ',2182,2293,2295,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2296', '荣成市', 'mainland', '2293', ',2182,2293,2296,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2297', '乳山市', 'mainland', '2293', ',2182,2293,2297,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2298', '潍坊市', 'mainland', '2182', ',2182,2298,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2299', '潍城区', 'mainland', '2298', ',2182,2298,2299,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2300', '寒亭区', 'mainland', '2298', ',2182,2298,2300,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2301', '坊子区', 'mainland', '2298', ',2182,2298,2301,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2302', '奎文区', 'mainland', '2298', ',2182,2298,2302,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2303', '临朐县', 'mainland', '2298', ',2182,2298,2303,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2304', '昌乐县', 'mainland', '2298', ',2182,2298,2304,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2305', '青州市', 'mainland', '2298', ',2182,2298,2305,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2306', '诸城市', 'mainland', '2298', ',2182,2298,2306,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2307', '寿光市', 'mainland', '2298', ',2182,2298,2307,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2308', '安丘市', 'mainland', '2298', ',2182,2298,2308,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2309', '高密市', 'mainland', '2298', ',2182,2298,2309,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2310', '昌邑市', 'mainland', '2298', ',2182,2298,2310,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2311', '烟台市', 'mainland', '2182', ',2182,2311,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2312', '芝罘区', 'mainland', '2311', ',2182,2311,2312,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2313', '福山区', 'mainland', '2311', ',2182,2311,2313,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2314', '牟平区', 'mainland', '2311', ',2182,2311,2314,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2315', '莱山区', 'mainland', '2311', ',2182,2311,2315,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2316', '长岛县', 'mainland', '2311', ',2182,2311,2316,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2317', '龙口市', 'mainland', '2311', ',2182,2311,2317,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2318', '莱阳市', 'mainland', '2311', ',2182,2311,2318,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2319', '莱州市', 'mainland', '2311', ',2182,2311,2319,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2320', '蓬莱市', 'mainland', '2311', ',2182,2311,2320,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2321', '招远市', 'mainland', '2311', ',2182,2311,2321,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2322', '栖霞市', 'mainland', '2311', ',2182,2311,2322,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2323', '海阳市', 'mainland', '2311', ',2182,2311,2323,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2324', '枣庄市', 'mainland', '2182', ',2182,2324,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2325', '市中区', 'mainland', '2324', ',2182,2324,2325,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2326', '薛城区', 'mainland', '2324', ',2182,2324,2326,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2327', '峄城区', 'mainland', '2324', ',2182,2324,2327,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2328', '台儿庄区', 'mainland', '2324', ',2182,2324,2328,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2329', '山亭区', 'mainland', '2324', ',2182,2324,2329,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2330', '滕州市', 'mainland', '2324', ',2182,2324,2330,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2331', '淄博市', 'mainland', '2182', ',2182,2331,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2332', '淄川区', 'mainland', '2331', ',2182,2331,2332,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2333', '张店区', 'mainland', '2331', ',2182,2331,2333,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2334', '博山区', 'mainland', '2331', ',2182,2331,2334,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2335', '临淄区', 'mainland', '2331', ',2182,2331,2335,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2336', '周村区', 'mainland', '2331', ',2182,2331,2336,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2337', '桓台县', 'mainland', '2331', ',2182,2331,2337,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2338', '高青县', 'mainland', '2331', ',2182,2331,2338,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2339', '沂源县', 'mainland', '2331', ',2182,2331,2339,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2340', '山西', 'mainland', null, ',2340,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('2341', '太原市', 'mainland', '2340', ',2340,2341,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2342', '小店区', 'mainland', '2341', ',2340,2341,2342,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2343', '迎泽区', 'mainland', '2341', ',2340,2341,2343,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2344', '杏花岭区', 'mainland', '2341', ',2340,2341,2344,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2345', '尖草坪区', 'mainland', '2341', ',2340,2341,2345,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2346', '万柏林区', 'mainland', '2341', ',2340,2341,2346,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2347', '晋源区', 'mainland', '2341', ',2340,2341,2347,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2348', '清徐县', 'mainland', '2341', ',2340,2341,2348,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2349', '阳曲县', 'mainland', '2341', ',2340,2341,2349,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2350', '娄烦县', 'mainland', '2341', ',2340,2341,2350,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2351', '古交市', 'mainland', '2341', ',2340,2341,2351,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2352', '长治市', 'mainland', '2340', ',2340,2352,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2353', '城区', 'mainland', '2352', ',2340,2352,2353,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2354', '郊区', 'mainland', '2352', ',2340,2352,2354,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2355', '长治县', 'mainland', '2352', ',2340,2352,2355,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2356', '襄垣县', 'mainland', '2352', ',2340,2352,2356,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2357', '屯留县', 'mainland', '2352', ',2340,2352,2357,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2358', '平顺县', 'mainland', '2352', ',2340,2352,2358,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2359', '黎城县', 'mainland', '2352', ',2340,2352,2359,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2360', '壶关县', 'mainland', '2352', ',2340,2352,2360,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2361', '长子县', 'mainland', '2352', ',2340,2352,2361,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2362', '武乡县', 'mainland', '2352', ',2340,2352,2362,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2363', '沁县', 'mainland', '2352', ',2340,2352,2363,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2364', '沁源县', 'mainland', '2352', ',2340,2352,2364,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2365', '潞城市', 'mainland', '2352', ',2340,2352,2365,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2366', '大同市', 'mainland', '2340', ',2340,2366,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2367', '城区', 'mainland', '2366', ',2340,2366,2367,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2368', '矿区', 'mainland', '2366', ',2340,2366,2368,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2369', '南郊区', 'mainland', '2366', ',2340,2366,2369,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2370', '新荣区', 'mainland', '2366', ',2340,2366,2370,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2371', '阳高县', 'mainland', '2366', ',2340,2366,2371,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2372', '天镇县', 'mainland', '2366', ',2340,2366,2372,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2373', '广灵县', 'mainland', '2366', ',2340,2366,2373,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2374', '灵丘县', 'mainland', '2366', ',2340,2366,2374,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2375', '浑源县', 'mainland', '2366', ',2340,2366,2375,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2376', '左云县', 'mainland', '2366', ',2340,2366,2376,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2377', '大同县', 'mainland', '2366', ',2340,2366,2377,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2378', '晋城市', 'mainland', '2340', ',2340,2378,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2379', '城区', 'mainland', '2378', ',2340,2378,2379,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2380', '沁水县', 'mainland', '2378', ',2340,2378,2380,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2381', '阳城县', 'mainland', '2378', ',2340,2378,2381,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2382', '陵川县', 'mainland', '2378', ',2340,2378,2382,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2383', '泽州县', 'mainland', '2378', ',2340,2378,2383,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2384', '高平市', 'mainland', '2378', ',2340,2378,2384,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2385', '晋中市', 'mainland', '2340', ',2340,2385,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2386', '榆次区', 'mainland', '2385', ',2340,2385,2386,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2387', '榆社县', 'mainland', '2385', ',2340,2385,2387,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2388', '左权县', 'mainland', '2385', ',2340,2385,2388,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2389', '和顺县', 'mainland', '2385', ',2340,2385,2389,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2390', '昔阳县', 'mainland', '2385', ',2340,2385,2390,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2391', '寿阳县', 'mainland', '2385', ',2340,2385,2391,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2392', '太谷县', 'mainland', '2385', ',2340,2385,2392,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2393', '祁县', 'mainland', '2385', ',2340,2385,2393,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2394', '平遥县', 'mainland', '2385', ',2340,2385,2394,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2395', '灵石县', 'mainland', '2385', ',2340,2385,2395,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2396', '介休市', 'mainland', '2385', ',2340,2385,2396,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2397', '临汾市', 'mainland', '2340', ',2340,2397,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2398', '尧都区', 'mainland', '2397', ',2340,2397,2398,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2399', '曲沃县', 'mainland', '2397', ',2340,2397,2399,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2400', '翼城县', 'mainland', '2397', ',2340,2397,2400,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2401', '襄汾县', 'mainland', '2397', ',2340,2397,2401,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2402', '洪洞县', 'mainland', '2397', ',2340,2397,2402,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2403', '古县', 'mainland', '2397', ',2340,2397,2403,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2404', '安泽县', 'mainland', '2397', ',2340,2397,2404,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2405', '浮山县', 'mainland', '2397', ',2340,2397,2405,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2406', '吉县', 'mainland', '2397', ',2340,2397,2406,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2407', '乡宁县', 'mainland', '2397', ',2340,2397,2407,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2408', '大宁县', 'mainland', '2397', ',2340,2397,2408,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2409', '隰县', 'mainland', '2397', ',2340,2397,2409,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2410', '永和县', 'mainland', '2397', ',2340,2397,2410,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2411', '蒲县', 'mainland', '2397', ',2340,2397,2411,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2412', '汾西县', 'mainland', '2397', ',2340,2397,2412,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2413', '侯马市', 'mainland', '2397', ',2340,2397,2413,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2414', '霍州市', 'mainland', '2397', ',2340,2397,2414,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2415', '吕梁市', 'mainland', '2340', ',2340,2415,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2416', '离石区', 'mainland', '2415', ',2340,2415,2416,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2417', '文水县', 'mainland', '2415', ',2340,2415,2417,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2418', '交城县', 'mainland', '2415', ',2340,2415,2418,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2419', '兴县', 'mainland', '2415', ',2340,2415,2419,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2420', '临县', 'mainland', '2415', ',2340,2415,2420,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2421', '柳林县', 'mainland', '2415', ',2340,2415,2421,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2422', '石楼县', 'mainland', '2415', ',2340,2415,2422,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2423', '岚县', 'mainland', '2415', ',2340,2415,2423,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2424', '方山县', 'mainland', '2415', ',2340,2415,2424,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2425', '中阳县', 'mainland', '2415', ',2340,2415,2425,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2426', '交口县', 'mainland', '2415', ',2340,2415,2426,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2427', '孝义市', 'mainland', '2415', ',2340,2415,2427,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2428', '汾阳市', 'mainland', '2415', ',2340,2415,2428,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2429', '朔州市', 'mainland', '2340', ',2340,2429,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2430', '朔城区', 'mainland', '2429', ',2340,2429,2430,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2431', '平鲁区', 'mainland', '2429', ',2340,2429,2431,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2432', '山阴县', 'mainland', '2429', ',2340,2429,2432,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2433', '应县', 'mainland', '2429', ',2340,2429,2433,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2434', '右玉县', 'mainland', '2429', ',2340,2429,2434,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2435', '怀仁县', 'mainland', '2429', ',2340,2429,2435,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2436', '忻州市', 'mainland', '2340', ',2340,2436,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2437', '忻府区', 'mainland', '2436', ',2340,2436,2437,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2438', '定襄县', 'mainland', '2436', ',2340,2436,2438,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2439', '五台县', 'mainland', '2436', ',2340,2436,2439,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2440', '代县', 'mainland', '2436', ',2340,2436,2440,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2441', '繁峙县', 'mainland', '2436', ',2340,2436,2441,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2442', '宁武县', 'mainland', '2436', ',2340,2436,2442,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2443', '静乐县', 'mainland', '2436', ',2340,2436,2443,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2444', '神池县', 'mainland', '2436', ',2340,2436,2444,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2445', '五寨县', 'mainland', '2436', ',2340,2436,2445,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2446', '岢岚县', 'mainland', '2436', ',2340,2436,2446,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2447', '河曲县', 'mainland', '2436', ',2340,2436,2447,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2448', '保德县', 'mainland', '2436', ',2340,2436,2448,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2449', '偏关县', 'mainland', '2436', ',2340,2436,2449,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2450', '原平市', 'mainland', '2436', ',2340,2436,2450,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2451', '阳泉市', 'mainland', '2340', ',2340,2451,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2452', '城区', 'mainland', '2451', ',2340,2451,2452,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2453', '矿区', 'mainland', '2451', ',2340,2451,2453,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2454', '郊区', 'mainland', '2451', ',2340,2451,2454,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2455', '平定县', 'mainland', '2451', ',2340,2451,2455,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2456', '盂县', 'mainland', '2451', ',2340,2451,2456,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2457', '运城市', 'mainland', '2340', ',2340,2457,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2458', '盐湖区', 'mainland', '2457', ',2340,2457,2458,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2459', '临猗县', 'mainland', '2457', ',2340,2457,2459,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2460', '万荣县', 'mainland', '2457', ',2340,2457,2460,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2461', '闻喜县', 'mainland', '2457', ',2340,2457,2461,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2462', '稷山县', 'mainland', '2457', ',2340,2457,2462,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2463', '新绛县', 'mainland', '2457', ',2340,2457,2463,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2464', '绛县', 'mainland', '2457', ',2340,2457,2464,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2465', '垣曲县', 'mainland', '2457', ',2340,2457,2465,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2466', '夏县', 'mainland', '2457', ',2340,2457,2466,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2467', '平陆县', 'mainland', '2457', ',2340,2457,2467,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2468', '芮城县', 'mainland', '2457', ',2340,2457,2468,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2469', '永济市', 'mainland', '2457', ',2340,2457,2469,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2470', '河津市', 'mainland', '2457', ',2340,2457,2470,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2471', '陕西', 'mainland', null, ',2471,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('2472', '西安市', 'mainland', '2471', ',2471,2472,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2473', '新城区', 'mainland', '2472', ',2471,2472,2473,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2474', '碑林区', 'mainland', '2472', ',2471,2472,2474,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2475', '莲湖区', 'mainland', '2472', ',2471,2472,2475,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2476', '灞桥区', 'mainland', '2472', ',2471,2472,2476,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2477', '未央区', 'mainland', '2472', ',2471,2472,2477,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2478', '雁塔区', 'mainland', '2472', ',2471,2472,2478,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2479', '阎良区', 'mainland', '2472', ',2471,2472,2479,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2480', '临潼区', 'mainland', '2472', ',2471,2472,2480,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2481', '长安区', 'mainland', '2472', ',2471,2472,2481,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2482', '蓝田县', 'mainland', '2472', ',2471,2472,2482,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2483', '周至县', 'mainland', '2472', ',2471,2472,2483,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2484', '户县', 'mainland', '2472', ',2471,2472,2484,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2485', '高陵县', 'mainland', '2472', ',2471,2472,2485,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2486', '安康市', 'mainland', '2471', ',2471,2486,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2487', '汉滨区', 'mainland', '2486', ',2471,2486,2487,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2488', '汉阴县', 'mainland', '2486', ',2471,2486,2488,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2489', '石泉县', 'mainland', '2486', ',2471,2486,2489,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2490', '宁陕县', 'mainland', '2486', ',2471,2486,2490,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2491', '紫阳县', 'mainland', '2486', ',2471,2486,2491,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2492', '岚皋县', 'mainland', '2486', ',2471,2486,2492,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2493', '平利县', 'mainland', '2486', ',2471,2486,2493,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2494', '镇坪县', 'mainland', '2486', ',2471,2486,2494,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2495', '旬阳县', 'mainland', '2486', ',2471,2486,2495,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2496', '白河县', 'mainland', '2486', ',2471,2486,2496,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2497', '宝鸡市', 'mainland', '2471', ',2471,2497,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2498', '渭滨区', 'mainland', '2497', ',2471,2497,2498,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2499', '金台区', 'mainland', '2497', ',2471,2497,2499,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2500', '陈仓区', 'mainland', '2497', ',2471,2497,2500,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2501', '凤翔县', 'mainland', '2497', ',2471,2497,2501,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2502', '岐山县', 'mainland', '2497', ',2471,2497,2502,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2503', '扶风县', 'mainland', '2497', ',2471,2497,2503,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2504', '眉县', 'mainland', '2497', ',2471,2497,2504,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2505', '陇县', 'mainland', '2497', ',2471,2497,2505,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2506', '千阳县', 'mainland', '2497', ',2471,2497,2506,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2507', '麟游县', 'mainland', '2497', ',2471,2497,2507,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2508', '凤县', 'mainland', '2497', ',2471,2497,2508,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2509', '太白县', 'mainland', '2497', ',2471,2497,2509,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2510', '汉中市', 'mainland', '2471', ',2471,2510,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2511', '汉台区', 'mainland', '2510', ',2471,2510,2511,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2512', '南郑县', 'mainland', '2510', ',2471,2510,2512,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2513', '城固县', 'mainland', '2510', ',2471,2510,2513,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2514', '洋县', 'mainland', '2510', ',2471,2510,2514,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2515', '西乡县', 'mainland', '2510', ',2471,2510,2515,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2516', '勉县', 'mainland', '2510', ',2471,2510,2516,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2517', '宁强县', 'mainland', '2510', ',2471,2510,2517,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2518', '略阳县', 'mainland', '2510', ',2471,2510,2518,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2519', '镇巴县', 'mainland', '2510', ',2471,2510,2519,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2520', '留坝县', 'mainland', '2510', ',2471,2510,2520,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2521', '佛坪县', 'mainland', '2510', ',2471,2510,2521,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2522', '商洛市', 'mainland', '2471', ',2471,2522,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2523', '商州区', 'mainland', '2522', ',2471,2522,2523,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2524', '洛南县', 'mainland', '2522', ',2471,2522,2524,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2525', '丹凤县', 'mainland', '2522', ',2471,2522,2525,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2526', '商南县', 'mainland', '2522', ',2471,2522,2526,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2527', '山阳县', 'mainland', '2522', ',2471,2522,2527,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2528', '镇安县', 'mainland', '2522', ',2471,2522,2528,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2529', '柞水县', 'mainland', '2522', ',2471,2522,2529,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2530', '铜川市', 'mainland', '2471', ',2471,2530,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2531', '王益区', 'mainland', '2530', ',2471,2530,2531,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2532', '印台区', 'mainland', '2530', ',2471,2530,2532,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2533', '耀州区', 'mainland', '2530', ',2471,2530,2533,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2534', '宜君县', 'mainland', '2530', ',2471,2530,2534,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2535', '渭南市', 'mainland', '2471', ',2471,2535,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2536', '临渭区', 'mainland', '2535', ',2471,2535,2536,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2537', '华县', 'mainland', '2535', ',2471,2535,2537,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2538', '潼关县', 'mainland', '2535', ',2471,2535,2538,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2539', '大荔县', 'mainland', '2535', ',2471,2535,2539,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2540', '合阳县', 'mainland', '2535', ',2471,2535,2540,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2541', '澄城县', 'mainland', '2535', ',2471,2535,2541,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2542', '蒲城县', 'mainland', '2535', ',2471,2535,2542,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2543', '白水县', 'mainland', '2535', ',2471,2535,2543,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2544', '富平县', 'mainland', '2535', ',2471,2535,2544,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2545', '韩城市', 'mainland', '2535', ',2471,2535,2545,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2546', '华阴市', 'mainland', '2535', ',2471,2535,2546,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2547', '咸阳市', 'mainland', '2471', ',2471,2547,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2548', '秦都区', 'mainland', '2547', ',2471,2547,2548,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2549', '杨凌区', 'mainland', '2547', ',2471,2547,2549,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2550', '渭城区', 'mainland', '2547', ',2471,2547,2550,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2551', '三原县', 'mainland', '2547', ',2471,2547,2551,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2552', '泾阳县', 'mainland', '2547', ',2471,2547,2552,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2553', '乾县', 'mainland', '2547', ',2471,2547,2553,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2554', '礼泉县', 'mainland', '2547', ',2471,2547,2554,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2555', '永寿县', 'mainland', '2547', ',2471,2547,2555,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2556', '彬县', 'mainland', '2547', ',2471,2547,2556,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2557', '长武县', 'mainland', '2547', ',2471,2547,2557,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2558', '旬邑县', 'mainland', '2547', ',2471,2547,2558,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2559', '淳化县', 'mainland', '2547', ',2471,2547,2559,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2560', '武功县', 'mainland', '2547', ',2471,2547,2560,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2561', '兴平市', 'mainland', '2547', ',2471,2547,2561,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2562', '延安市', 'mainland', '2471', ',2471,2562,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2563', '宝塔区', 'mainland', '2562', ',2471,2562,2563,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2564', '延长县', 'mainland', '2562', ',2471,2562,2564,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2565', '延川县', 'mainland', '2562', ',2471,2562,2565,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2566', '子长县', 'mainland', '2562', ',2471,2562,2566,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2567', '安塞县', 'mainland', '2562', ',2471,2562,2567,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2568', '志丹县', 'mainland', '2562', ',2471,2562,2568,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2569', '吴旗县', 'mainland', '2562', ',2471,2562,2569,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2570', '甘泉县', 'mainland', '2562', ',2471,2562,2570,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2571', '富县', 'mainland', '2562', ',2471,2562,2571,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2572', '洛川县', 'mainland', '2562', ',2471,2562,2572,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2573', '宜川县', 'mainland', '2562', ',2471,2562,2573,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2574', '黄龙县', 'mainland', '2562', ',2471,2562,2574,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2575', '黄陵县', 'mainland', '2562', ',2471,2562,2575,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2576', '榆林市', 'mainland', '2471', ',2471,2576,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2577', '榆阳区', 'mainland', '2576', ',2471,2576,2577,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2578', '神木县', 'mainland', '2576', ',2471,2576,2578,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2579', '府谷县', 'mainland', '2576', ',2471,2576,2579,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2580', '横山县', 'mainland', '2576', ',2471,2576,2580,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2581', '靖边县', 'mainland', '2576', ',2471,2576,2581,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2582', '定边县', 'mainland', '2576', ',2471,2576,2582,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2583', '绥德县', 'mainland', '2576', ',2471,2576,2583,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2584', '米脂县', 'mainland', '2576', ',2471,2576,2584,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2585', '佳县', 'mainland', '2576', ',2471,2576,2585,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2586', '吴堡县', 'mainland', '2576', ',2471,2576,2586,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2587', '清涧县', 'mainland', '2576', ',2471,2576,2587,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2588', '子洲县', 'mainland', '2576', ',2471,2576,2588,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2589', '四川', 'mainland', null, ',2589,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('2590', '成都市', 'mainland', '2589', ',2589,2590,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2591', '锦江区', 'mainland', '2590', ',2589,2590,2591,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2592', '青羊区', 'mainland', '2590', ',2589,2590,2592,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2593', '金牛区', 'mainland', '2590', ',2589,2590,2593,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2594', '武侯区', 'mainland', '2590', ',2589,2590,2594,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2595', '成华区', 'mainland', '2590', ',2589,2590,2595,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2596', '龙泉驿区', 'mainland', '2590', ',2589,2590,2596,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2597', '青白江区', 'mainland', '2590', ',2589,2590,2597,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2598', '新都区', 'mainland', '2590', ',2589,2590,2598,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2599', '温江区', 'mainland', '2590', ',2589,2590,2599,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2600', '金堂县', 'mainland', '2590', ',2589,2590,2600,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2601', '双流县', 'mainland', '2590', ',2589,2590,2601,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2602', '郫县', 'mainland', '2590', ',2589,2590,2602,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2603', '大邑县', 'mainland', '2590', ',2589,2590,2603,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2604', '蒲江县', 'mainland', '2590', ',2589,2590,2604,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2605', '新津县', 'mainland', '2590', ',2589,2590,2605,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2606', '都江堰市', 'mainland', '2590', ',2589,2590,2606,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2607', '彭州市', 'mainland', '2590', ',2589,2590,2607,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2608', '邛崃市', 'mainland', '2590', ',2589,2590,2608,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2609', '崇州市', 'mainland', '2590', ',2589,2590,2609,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2610', '阿坝藏族羌族自治州', 'mainland', '2589', ',2589,2610,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2611', '汶川县', 'mainland', '2610', ',2589,2610,2611,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2612', '理县', 'mainland', '2610', ',2589,2610,2612,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2613', '茂县', 'mainland', '2610', ',2589,2610,2613,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2614', '松潘县', 'mainland', '2610', ',2589,2610,2614,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2615', '九寨沟县', 'mainland', '2610', ',2589,2610,2615,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2616', '金川县', 'mainland', '2610', ',2589,2610,2616,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2617', '小金县', 'mainland', '2610', ',2589,2610,2617,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2618', '黑水县', 'mainland', '2610', ',2589,2610,2618,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2619', '马尔康县', 'mainland', '2610', ',2589,2610,2619,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2620', '壤塘县', 'mainland', '2610', ',2589,2610,2620,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2621', '阿坝县', 'mainland', '2610', ',2589,2610,2621,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2622', '若尔盖县', 'mainland', '2610', ',2589,2610,2622,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2623', '红原县', 'mainland', '2610', ',2589,2610,2623,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2624', '巴中市', 'mainland', '2589', ',2589,2624,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2625', '巴州区', 'mainland', '2624', ',2589,2624,2625,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2626', '通江县', 'mainland', '2624', ',2589,2624,2626,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2627', '南江县', 'mainland', '2624', ',2589,2624,2627,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2628', '平昌县', 'mainland', '2624', ',2589,2624,2628,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2629', '达州市', 'mainland', '2589', ',2589,2629,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2630', '通川区', 'mainland', '2629', ',2589,2629,2630,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2631', '达县', 'mainland', '2629', ',2589,2629,2631,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2632', '宣汉县', 'mainland', '2629', ',2589,2629,2632,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2633', '开江县', 'mainland', '2629', ',2589,2629,2633,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2634', '大竹县', 'mainland', '2629', ',2589,2629,2634,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2635', '渠县', 'mainland', '2629', ',2589,2629,2635,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2636', '万源市', 'mainland', '2629', ',2589,2629,2636,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2637', '德阳市', 'mainland', '2589', ',2589,2637,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2638', '旌阳区', 'mainland', '2637', ',2589,2637,2638,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2639', '中江县', 'mainland', '2637', ',2589,2637,2639,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2640', '罗江县', 'mainland', '2637', ',2589,2637,2640,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2641', '广汉市', 'mainland', '2637', ',2589,2637,2641,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2642', '什邡市', 'mainland', '2637', ',2589,2637,2642,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2643', '绵竹市', 'mainland', '2637', ',2589,2637,2643,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2644', '甘孜藏族自治州', 'mainland', '2589', ',2589,2644,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2645', '康定县', 'mainland', '2644', ',2589,2644,2645,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2646', '泸定县', 'mainland', '2644', ',2589,2644,2646,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2647', '丹巴县', 'mainland', '2644', ',2589,2644,2647,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2648', '九龙县', 'mainland', '2644', ',2589,2644,2648,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2649', '雅江县', 'mainland', '2644', ',2589,2644,2649,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2650', '道孚县', 'mainland', '2644', ',2589,2644,2650,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2651', '炉霍县', 'mainland', '2644', ',2589,2644,2651,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2652', '甘孜县', 'mainland', '2644', ',2589,2644,2652,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2653', '新龙县', 'mainland', '2644', ',2589,2644,2653,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2654', '德格县', 'mainland', '2644', ',2589,2644,2654,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2655', '白玉县', 'mainland', '2644', ',2589,2644,2655,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2656', '石渠县', 'mainland', '2644', ',2589,2644,2656,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2657', '色达县', 'mainland', '2644', ',2589,2644,2657,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2658', '理塘县', 'mainland', '2644', ',2589,2644,2658,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2659', '巴塘县', 'mainland', '2644', ',2589,2644,2659,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2660', '乡城县', 'mainland', '2644', ',2589,2644,2660,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2661', '稻城县', 'mainland', '2644', ',2589,2644,2661,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2662', '得荣县', 'mainland', '2644', ',2589,2644,2662,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2663', '广安市', 'mainland', '2589', ',2589,2663,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2664', '广安区', 'mainland', '2663', ',2589,2663,2664,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2665', '岳池县', 'mainland', '2663', ',2589,2663,2665,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2666', '武胜县', 'mainland', '2663', ',2589,2663,2666,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2667', '邻水县', 'mainland', '2663', ',2589,2663,2667,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2668', '华莹市', 'mainland', '2663', ',2589,2663,2668,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2669', '广元市', 'mainland', '2589', ',2589,2669,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2670', '市中区', 'mainland', '2669', ',2589,2669,2670,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2671', '元坝区', 'mainland', '2669', ',2589,2669,2671,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2672', '朝天区', 'mainland', '2669', ',2589,2669,2672,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2673', '旺苍县', 'mainland', '2669', ',2589,2669,2673,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2674', '青川县', 'mainland', '2669', ',2589,2669,2674,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2675', '剑阁县', 'mainland', '2669', ',2589,2669,2675,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2676', '苍溪县', 'mainland', '2669', ',2589,2669,2676,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2677', '乐山市', 'mainland', '2589', ',2589,2677,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2678', '市中区', 'mainland', '2677', ',2589,2677,2678,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2679', '沙湾区', 'mainland', '2677', ',2589,2677,2679,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2680', '五通桥区', 'mainland', '2677', ',2589,2677,2680,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2681', '金口河区', 'mainland', '2677', ',2589,2677,2681,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2682', '犍为县', 'mainland', '2677', ',2589,2677,2682,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2683', '井研县', 'mainland', '2677', ',2589,2677,2683,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2684', '夹江县', 'mainland', '2677', ',2589,2677,2684,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2685', '沐川县', 'mainland', '2677', ',2589,2677,2685,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2686', '峨边彝族自治县', 'mainland', '2677', ',2589,2677,2686,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2687', '马边彝族自治县', 'mainland', '2677', ',2589,2677,2687,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2688', '峨眉山市', 'mainland', '2677', ',2589,2677,2688,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2689', '凉山彝族自治州', 'mainland', '2589', ',2589,2689,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2690', '西昌市', 'mainland', '2689', ',2589,2689,2690,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2691', '木里藏族自治县', 'mainland', '2689', ',2589,2689,2691,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2692', '盐源县', 'mainland', '2689', ',2589,2689,2692,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2693', '德昌县', 'mainland', '2689', ',2589,2689,2693,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2694', '会理县', 'mainland', '2689', ',2589,2689,2694,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2695', '会东县', 'mainland', '2689', ',2589,2689,2695,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2696', '宁南县', 'mainland', '2689', ',2589,2689,2696,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2697', '普格县', 'mainland', '2689', ',2589,2689,2697,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2698', '布拖县', 'mainland', '2689', ',2589,2689,2698,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2699', '金阳县', 'mainland', '2689', ',2589,2689,2699,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2700', '昭觉县', 'mainland', '2689', ',2589,2689,2700,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2701', '喜德县', 'mainland', '2689', ',2589,2689,2701,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2702', '冕宁县', 'mainland', '2689', ',2589,2689,2702,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2703', '越西县', 'mainland', '2689', ',2589,2689,2703,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2704', '甘洛县', 'mainland', '2689', ',2589,2689,2704,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2705', '美姑县', 'mainland', '2689', ',2589,2689,2705,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2706', '雷波县', 'mainland', '2689', ',2589,2689,2706,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2707', '泸州市', 'mainland', '2589', ',2589,2707,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2708', '江阳区', 'mainland', '2707', ',2589,2707,2708,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2709', '纳溪区', 'mainland', '2707', ',2589,2707,2709,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2710', '龙马潭区', 'mainland', '2707', ',2589,2707,2710,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2711', '泸县', 'mainland', '2707', ',2589,2707,2711,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2712', '合江县', 'mainland', '2707', ',2589,2707,2712,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2713', '叙永县', 'mainland', '2707', ',2589,2707,2713,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2714', '古蔺县', 'mainland', '2707', ',2589,2707,2714,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2715', '眉山市', 'mainland', '2589', ',2589,2715,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2716', '东坡区', 'mainland', '2715', ',2589,2715,2716,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2717', '仁寿县', 'mainland', '2715', ',2589,2715,2717,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2718', '彭山县', 'mainland', '2715', ',2589,2715,2718,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2719', '洪雅县', 'mainland', '2715', ',2589,2715,2719,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2720', '丹棱县', 'mainland', '2715', ',2589,2715,2720,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2721', '青神县', 'mainland', '2715', ',2589,2715,2721,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2722', '绵阳市', 'mainland', '2589', ',2589,2722,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2723', '涪城区', 'mainland', '2722', ',2589,2722,2723,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2724', '游仙区', 'mainland', '2722', ',2589,2722,2724,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2725', '三台县', 'mainland', '2722', ',2589,2722,2725,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2726', '盐亭县', 'mainland', '2722', ',2589,2722,2726,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2727', '安县', 'mainland', '2722', ',2589,2722,2727,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2728', '梓潼县', 'mainland', '2722', ',2589,2722,2728,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2729', '北川羌族自治县', 'mainland', '2722', ',2589,2722,2729,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2730', '平武县', 'mainland', '2722', ',2589,2722,2730,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2731', '江油市', 'mainland', '2722', ',2589,2722,2731,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2732', '内江市', 'mainland', '2589', ',2589,2732,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2733', '市中区', 'mainland', '2732', ',2589,2732,2733,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2734', '东兴区', 'mainland', '2732', ',2589,2732,2734,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2735', '威远县', 'mainland', '2732', ',2589,2732,2735,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2736', '资中县', 'mainland', '2732', ',2589,2732,2736,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2737', '隆昌县', 'mainland', '2732', ',2589,2732,2737,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2738', '南充市', 'mainland', '2589', ',2589,2738,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2739', '顺庆区', 'mainland', '2738', ',2589,2738,2739,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2740', '高坪区', 'mainland', '2738', ',2589,2738,2740,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2741', '嘉陵区', 'mainland', '2738', ',2589,2738,2741,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2742', '南部县', 'mainland', '2738', ',2589,2738,2742,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2743', '营山县', 'mainland', '2738', ',2589,2738,2743,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2744', '蓬安县', 'mainland', '2738', ',2589,2738,2744,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2745', '仪陇县', 'mainland', '2738', ',2589,2738,2745,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2746', '西充县', 'mainland', '2738', ',2589,2738,2746,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2747', '阆中市', 'mainland', '2738', ',2589,2738,2747,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2748', '攀枝花市', 'mainland', '2589', ',2589,2748,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2749', '东区', 'mainland', '2748', ',2589,2748,2749,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2750', '西区', 'mainland', '2748', ',2589,2748,2750,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2751', '仁和区', 'mainland', '2748', ',2589,2748,2751,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2752', '米易县', 'mainland', '2748', ',2589,2748,2752,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2753', '盐边县', 'mainland', '2748', ',2589,2748,2753,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2754', '遂宁市', 'mainland', '2589', ',2589,2754,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2755', '船山区', 'mainland', '2754', ',2589,2754,2755,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2756', '安居区', 'mainland', '2754', ',2589,2754,2756,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2757', '蓬溪县', 'mainland', '2754', ',2589,2754,2757,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2758', '射洪县', 'mainland', '2754', ',2589,2754,2758,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2759', '大英县', 'mainland', '2754', ',2589,2754,2759,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2760', '雅安市', 'mainland', '2589', ',2589,2760,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2761', '雨城区', 'mainland', '2760', ',2589,2760,2761,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2762', '名山县', 'mainland', '2760', ',2589,2760,2762,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2763', '荥经县', 'mainland', '2760', ',2589,2760,2763,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2764', '汉源县', 'mainland', '2760', ',2589,2760,2764,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2765', '石棉县', 'mainland', '2760', ',2589,2760,2765,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2766', '天全县', 'mainland', '2760', ',2589,2760,2766,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2767', '芦山县', 'mainland', '2760', ',2589,2760,2767,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2768', '宝兴县', 'mainland', '2760', ',2589,2760,2768,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2769', '宜宾市', 'mainland', '2589', ',2589,2769,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2770', '翠屏区', 'mainland', '2769', ',2589,2769,2770,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2771', '宜宾县', 'mainland', '2769', ',2589,2769,2771,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2772', '南溪县', 'mainland', '2769', ',2589,2769,2772,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2773', '江安县', 'mainland', '2769', ',2589,2769,2773,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2774', '长宁县', 'mainland', '2769', ',2589,2769,2774,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2775', '高县', 'mainland', '2769', ',2589,2769,2775,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2776', '珙县', 'mainland', '2769', ',2589,2769,2776,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2777', '筠连县', 'mainland', '2769', ',2589,2769,2777,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2778', '兴文县', 'mainland', '2769', ',2589,2769,2778,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2779', '屏山县', 'mainland', '2769', ',2589,2769,2779,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2780', '资阳市', 'mainland', '2589', ',2589,2780,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2781', '雁江区', 'mainland', '2780', ',2589,2780,2781,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2782', '安岳县', 'mainland', '2780', ',2589,2780,2782,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2783', '乐至县', 'mainland', '2780', ',2589,2780,2783,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2784', '简阳市', 'mainland', '2780', ',2589,2780,2784,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2785', '自贡市', 'mainland', '2589', ',2589,2785,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2786', '自流井区', 'mainland', '2785', ',2589,2785,2786,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2787', '贡井区', 'mainland', '2785', ',2589,2785,2787,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2788', '大安区', 'mainland', '2785', ',2589,2785,2788,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2789', '沿滩区', 'mainland', '2785', ',2589,2785,2789,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2790', '荣县', 'mainland', '2785', ',2589,2785,2790,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2791', '富顺县', 'mainland', '2785', ',2589,2785,2791,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2792', '西藏', 'mainland', null, ',2792,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('2793', '拉萨市', 'mainland', '2792', ',2792,2793,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2794', '城关区', 'mainland', '2793', ',2792,2793,2794,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2795', '林周县', 'mainland', '2793', ',2792,2793,2795,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2796', '当雄县', 'mainland', '2793', ',2792,2793,2796,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2797', '尼木县', 'mainland', '2793', ',2792,2793,2797,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2798', '曲水县', 'mainland', '2793', ',2792,2793,2798,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2799', '堆龙德庆县', 'mainland', '2793', ',2792,2793,2799,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2800', '达孜县', 'mainland', '2793', ',2792,2793,2800,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2801', '墨竹工卡县', 'mainland', '2793', ',2792,2793,2801,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2802', '阿里地区', 'mainland', '2792', ',2792,2802,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2803', '普兰县', 'mainland', '2802', ',2792,2802,2803,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2804', '札达县', 'mainland', '2802', ',2792,2802,2804,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2805', '噶尔县', 'mainland', '2802', ',2792,2802,2805,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2806', '日土县', 'mainland', '2802', ',2792,2802,2806,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2807', '革吉县', 'mainland', '2802', ',2792,2802,2807,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2808', '改则县', 'mainland', '2802', ',2792,2802,2808,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2809', '措勤县', 'mainland', '2802', ',2792,2802,2809,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2810', '昌都地区', 'mainland', '2792', ',2792,2810,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2811', '昌都县', 'mainland', '2810', ',2792,2810,2811,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2812', '江达县', 'mainland', '2810', ',2792,2810,2812,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2813', '贡觉县', 'mainland', '2810', ',2792,2810,2813,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2814', '类乌齐县', 'mainland', '2810', ',2792,2810,2814,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2815', '丁青县', 'mainland', '2810', ',2792,2810,2815,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2816', '察雅县', 'mainland', '2810', ',2792,2810,2816,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2817', '八宿县', 'mainland', '2810', ',2792,2810,2817,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2818', '左贡县', 'mainland', '2810', ',2792,2810,2818,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2819', '芒康县', 'mainland', '2810', ',2792,2810,2819,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2820', '洛隆县', 'mainland', '2810', ',2792,2810,2820,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2821', '边坝县', 'mainland', '2810', ',2792,2810,2821,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2822', '林芝地区', 'mainland', '2792', ',2792,2822,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2823', '林芝县', 'mainland', '2822', ',2792,2822,2823,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2824', '工布江达县', 'mainland', '2822', ',2792,2822,2824,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2825', '米林县', 'mainland', '2822', ',2792,2822,2825,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2826', '墨脱县', 'mainland', '2822', ',2792,2822,2826,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2827', '波密县', 'mainland', '2822', ',2792,2822,2827,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2828', '察隅县', 'mainland', '2822', ',2792,2822,2828,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2829', '朗县', 'mainland', '2822', ',2792,2822,2829,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2830', '那曲地区', 'mainland', '2792', ',2792,2830,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2831', '那曲县', 'mainland', '2830', ',2792,2830,2831,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2832', '嘉黎县', 'mainland', '2830', ',2792,2830,2832,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2833', '比如县', 'mainland', '2830', ',2792,2830,2833,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2834', '聂荣县', 'mainland', '2830', ',2792,2830,2834,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2835', '安多县', 'mainland', '2830', ',2792,2830,2835,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2836', '申扎县', 'mainland', '2830', ',2792,2830,2836,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2837', '索县', 'mainland', '2830', ',2792,2830,2837,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2838', '班戈县', 'mainland', '2830', ',2792,2830,2838,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2839', '巴青县', 'mainland', '2830', ',2792,2830,2839,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2840', '尼玛县', 'mainland', '2830', ',2792,2830,2840,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2841', '日喀则地区', 'mainland', '2792', ',2792,2841,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2842', '日喀则市', 'mainland', '2841', ',2792,2841,2842,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2843', '南木林县', 'mainland', '2841', ',2792,2841,2843,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2844', '江孜县', 'mainland', '2841', ',2792,2841,2844,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2845', '定日县', 'mainland', '2841', ',2792,2841,2845,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2846', '萨迦县', 'mainland', '2841', ',2792,2841,2846,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2847', '拉孜县', 'mainland', '2841', ',2792,2841,2847,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2848', '昂仁县', 'mainland', '2841', ',2792,2841,2848,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2849', '谢通门县', 'mainland', '2841', ',2792,2841,2849,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2850', '白朗县', 'mainland', '2841', ',2792,2841,2850,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2851', '仁布县', 'mainland', '2841', ',2792,2841,2851,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2852', '康马县', 'mainland', '2841', ',2792,2841,2852,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2853', '定结县', 'mainland', '2841', ',2792,2841,2853,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2854', '仲巴县', 'mainland', '2841', ',2792,2841,2854,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2855', '亚东县', 'mainland', '2841', ',2792,2841,2855,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2856', '吉隆县', 'mainland', '2841', ',2792,2841,2856,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2857', '聂拉木县', 'mainland', '2841', ',2792,2841,2857,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2858', '萨嘎县', 'mainland', '2841', ',2792,2841,2858,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2859', '岗巴县', 'mainland', '2841', ',2792,2841,2859,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2860', '山南地区', 'mainland', '2792', ',2792,2860,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2861', '乃东县', 'mainland', '2860', ',2792,2860,2861,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2862', '扎囊县', 'mainland', '2860', ',2792,2860,2862,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2863', '贡嘎县', 'mainland', '2860', ',2792,2860,2863,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2864', '桑日县', 'mainland', '2860', ',2792,2860,2864,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2865', '琼结县', 'mainland', '2860', ',2792,2860,2865,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2866', '曲松县', 'mainland', '2860', ',2792,2860,2866,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2867', '措美县', 'mainland', '2860', ',2792,2860,2867,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2868', '洛扎县', 'mainland', '2860', ',2792,2860,2868,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2869', '加查县', 'mainland', '2860', ',2792,2860,2869,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2870', '隆子县', 'mainland', '2860', ',2792,2860,2870,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2871', '错那县', 'mainland', '2860', ',2792,2860,2871,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2872', '浪卡子县', 'mainland', '2860', ',2792,2860,2872,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2873', '新疆', 'mainland', null, ',2873,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('2874', '乌鲁木齐市', 'mainland', '2873', ',2873,2874,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2875', '天山区', 'mainland', '2874', ',2873,2874,2875,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2876', '沙依巴克区', 'mainland', '2874', ',2873,2874,2876,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2877', '新市区', 'mainland', '2874', ',2873,2874,2877,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2878', '水磨沟区', 'mainland', '2874', ',2873,2874,2878,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2879', '头屯河区', 'mainland', '2874', ',2873,2874,2879,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2880', '达坂城区', 'mainland', '2874', ',2873,2874,2880,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2881', '东山区', 'mainland', '2874', ',2873,2874,2881,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2882', '乌鲁木齐县', 'mainland', '2874', ',2873,2874,2882,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2883', '阿克苏地区', 'mainland', '2873', ',2873,2883,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2884', '阿克苏市', 'mainland', '2883', ',2873,2883,2884,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2885', '温宿县', 'mainland', '2883', ',2873,2883,2885,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2886', '库车县', 'mainland', '2883', ',2873,2883,2886,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2887', '沙雅县', 'mainland', '2883', ',2873,2883,2887,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2888', '新和县', 'mainland', '2883', ',2873,2883,2888,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2889', '拜城县', 'mainland', '2883', ',2873,2883,2889,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2890', '乌什县', 'mainland', '2883', ',2873,2883,2890,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2891', '阿瓦提县', 'mainland', '2883', ',2873,2883,2891,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2892', '柯坪县', 'mainland', '2883', ',2873,2883,2892,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2893', '阿拉尔市', 'mainland', '2873', ',2873,2893,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2894', '阿勒泰地区', 'mainland', '2873', ',2873,2894,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2895', '阿勒泰市', 'mainland', '2894', ',2873,2894,2895,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2896', '布尔津县', 'mainland', '2894', ',2873,2894,2896,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2897', '富蕴县', 'mainland', '2894', ',2873,2894,2897,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2898', '福海县', 'mainland', '2894', ',2873,2894,2898,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2899', '哈巴河县', 'mainland', '2894', ',2873,2894,2899,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2900', '青河县', 'mainland', '2894', ',2873,2894,2900,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2901', '吉木乃县', 'mainland', '2894', ',2873,2894,2901,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2902', '巴音郭楞蒙古自治州', 'mainland', '2873', ',2873,2902,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2903', '库尔勒市', 'mainland', '2902', ',2873,2902,2903,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2904', '轮台县', 'mainland', '2902', ',2873,2902,2904,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2905', '尉犁县', 'mainland', '2902', ',2873,2902,2905,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2906', '若羌县', 'mainland', '2902', ',2873,2902,2906,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2907', '且末县', 'mainland', '2902', ',2873,2902,2907,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2908', '焉耆回族自治县', 'mainland', '2902', ',2873,2902,2908,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2909', '和静县', 'mainland', '2902', ',2873,2902,2909,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2910', '和硕县', 'mainland', '2902', ',2873,2902,2910,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2911', '博湖县', 'mainland', '2902', ',2873,2902,2911,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2912', '博尔塔拉蒙古自治州', 'mainland', '2873', ',2873,2912,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2913', '博乐市', 'mainland', '2912', ',2873,2912,2913,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2914', '精河县', 'mainland', '2912', ',2873,2912,2914,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2915', '温泉县', 'mainland', '2912', ',2873,2912,2915,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2916', '昌吉回族自治州', 'mainland', '2873', ',2873,2916,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2917', '昌吉市', 'mainland', '2916', ',2873,2916,2917,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2918', '阜康市', 'mainland', '2916', ',2873,2916,2918,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2919', '米泉市', 'mainland', '2916', ',2873,2916,2919,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2920', '呼图壁县', 'mainland', '2916', ',2873,2916,2920,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2921', '玛纳斯县', 'mainland', '2916', ',2873,2916,2921,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2922', '奇台县', 'mainland', '2916', ',2873,2916,2922,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2923', '吉木萨尔县', 'mainland', '2916', ',2873,2916,2923,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2924', '木垒哈萨克自治县', 'mainland', '2916', ',2873,2916,2924,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2925', '哈密地区', 'mainland', '2873', ',2873,2925,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2926', '哈密市', 'mainland', '2925', ',2873,2925,2926,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2927', '巴里坤哈萨克自治县', 'mainland', '2925', ',2873,2925,2927,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2928', '伊吾县', 'mainland', '2925', ',2873,2925,2928,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2929', '和田地区', 'mainland', '2873', ',2873,2929,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2930', '和田市', 'mainland', '2929', ',2873,2929,2930,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2931', '和田县', 'mainland', '2929', ',2873,2929,2931,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2932', '墨玉县', 'mainland', '2929', ',2873,2929,2932,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2933', '皮山县', 'mainland', '2929', ',2873,2929,2933,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2934', '洛浦县', 'mainland', '2929', ',2873,2929,2934,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2935', '策勒县', 'mainland', '2929', ',2873,2929,2935,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2936', '于田县', 'mainland', '2929', ',2873,2929,2936,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2937', '民丰县', 'mainland', '2929', ',2873,2929,2937,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2938', '喀什地区', 'mainland', '2873', ',2873,2938,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2939', '喀什市', 'mainland', '2938', ',2873,2938,2939,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2940', '疏附县', 'mainland', '2938', ',2873,2938,2940,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2941', '疏勒县', 'mainland', '2938', ',2873,2938,2941,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2942', '英吉沙县', 'mainland', '2938', ',2873,2938,2942,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2943', '泽普县', 'mainland', '2938', ',2873,2938,2943,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2944', '莎车县', 'mainland', '2938', ',2873,2938,2944,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2945', '叶城县', 'mainland', '2938', ',2873,2938,2945,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2946', '麦盖提县', 'mainland', '2938', ',2873,2938,2946,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2947', '岳普湖县', 'mainland', '2938', ',2873,2938,2947,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2948', '伽师县', 'mainland', '2938', ',2873,2938,2948,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2949', '巴楚县', 'mainland', '2938', ',2873,2938,2949,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2950', '塔什库尔干塔吉克自治县', 'mainland', '2938', ',2873,2938,2950,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2951', '克拉玛依市', 'mainland', '2873', ',2873,2951,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2952', '独山子区', 'mainland', '2951', ',2873,2951,2952,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2953', '克拉玛依区', 'mainland', '2951', ',2873,2951,2953,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2954', '白碱滩区', 'mainland', '2951', ',2873,2951,2954,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2955', '乌尔禾区', 'mainland', '2951', ',2873,2951,2955,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2956', '克孜勒苏柯尔克孜自治州', 'mainland', '2873', ',2873,2956,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2957', '阿图什市', 'mainland', '2956', ',2873,2956,2957,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2958', '阿克陶县', 'mainland', '2956', ',2873,2956,2958,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2959', '阿合奇县', 'mainland', '2956', ',2873,2956,2959,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2960', '乌恰县', 'mainland', '2956', ',2873,2956,2960,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2961', '石河子市', 'mainland', '2873', ',2873,2961,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2962', '塔城地区', 'mainland', '2873', ',2873,2962,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2963', '塔城市', 'mainland', '2962', ',2873,2962,2963,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2964', '乌苏市', 'mainland', '2962', ',2873,2962,2964,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2965', '额敏县', 'mainland', '2962', ',2873,2962,2965,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2966', '沙湾县', 'mainland', '2962', ',2873,2962,2966,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2967', '托里县', 'mainland', '2962', ',2873,2962,2967,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2968', '裕民县', 'mainland', '2962', ',2873,2962,2968,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2969', '和布克赛尔蒙古自治县', 'mainland', '2962', ',2873,2962,2969,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2970', '图木舒克市', 'mainland', '2873', ',2873,2970,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2971', '吐鲁番地区', 'mainland', '2873', ',2873,2971,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2972', '吐鲁番市', 'mainland', '2971', ',2873,2971,2972,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2973', '鄯善县', 'mainland', '2971', ',2873,2971,2973,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2974', '托克逊县', 'mainland', '2971', ',2873,2971,2974,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2975', '五家渠市', 'mainland', '2873', ',2873,2975,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2976', '伊犁哈萨克自治州', 'mainland', '2873', ',2873,2976,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2977', '伊宁市', 'mainland', '2976', ',2873,2976,2977,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2978', '奎屯市', 'mainland', '2976', ',2873,2976,2978,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2979', '伊宁县', 'mainland', '2976', ',2873,2976,2979,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2980', '察布查尔锡伯自治县', 'mainland', '2976', ',2873,2976,2980,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2981', '霍城县', 'mainland', '2976', ',2873,2976,2981,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2982', '巩留县', 'mainland', '2976', ',2873,2976,2982,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2983', '新源县', 'mainland', '2976', ',2873,2976,2983,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2984', '昭苏县', 'mainland', '2976', ',2873,2976,2984,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2985', '特克斯县', 'mainland', '2976', ',2873,2976,2985,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2986', '尼勒克县', 'mainland', '2976', ',2873,2976,2986,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2987', '云南', 'mainland', null, ',2987,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('2988', '昆明市', 'mainland', '2987', ',2987,2988,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2989', '五华区', 'mainland', '2988', ',2987,2988,2989,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2990', '盘龙区', 'mainland', '2988', ',2987,2988,2990,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2991', '官渡区', 'mainland', '2988', ',2987,2988,2991,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2992', '西山区', 'mainland', '2988', ',2987,2988,2992,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2993', '东川区', 'mainland', '2988', ',2987,2988,2993,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2994', '呈贡县', 'mainland', '2988', ',2987,2988,2994,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2995', '晋宁县', 'mainland', '2988', ',2987,2988,2995,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2996', '富民县', 'mainland', '2988', ',2987,2988,2996,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2997', '宜良县', 'mainland', '2988', ',2987,2988,2997,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2998', '石林彝族自治县', 'mainland', '2988', ',2987,2988,2998,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('2999', '嵩明县', 'mainland', '2988', ',2987,2988,2999,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3000', '禄劝彝族苗族自治县', 'mainland', '2988', ',2987,2988,3000,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3001', '寻甸回族彝族自治县', 'mainland', '2988', ',2987,2988,3001,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3002', '安宁市', 'mainland', '2988', ',2987,2988,3002,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3003', '保山市', 'mainland', '2987', ',2987,3003,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3004', '隆阳区', 'mainland', '3003', ',2987,3003,3004,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3005', '施甸县', 'mainland', '3003', ',2987,3003,3005,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3006', '腾冲县', 'mainland', '3003', ',2987,3003,3006,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3007', '龙陵县', 'mainland', '3003', ',2987,3003,3007,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3008', '昌宁县', 'mainland', '3003', ',2987,3003,3008,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3009', '楚雄彝族自治州', 'mainland', '2987', ',2987,3009,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3010', '楚雄市', 'mainland', '3009', ',2987,3009,3010,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3011', '双柏县', 'mainland', '3009', ',2987,3009,3011,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3012', '牟定县', 'mainland', '3009', ',2987,3009,3012,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3013', '南华县', 'mainland', '3009', ',2987,3009,3013,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3014', '姚安县', 'mainland', '3009', ',2987,3009,3014,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3015', '大姚县', 'mainland', '3009', ',2987,3009,3015,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3016', '永仁县', 'mainland', '3009', ',2987,3009,3016,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3017', '元谋县', 'mainland', '3009', ',2987,3009,3017,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3018', '武定县', 'mainland', '3009', ',2987,3009,3018,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3019', '禄丰县', 'mainland', '3009', ',2987,3009,3019,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3020', '大理白族自治州', 'mainland', '2987', ',2987,3020,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3021', '大理市', 'mainland', '3020', ',2987,3020,3021,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3022', '漾濞彝族自治县', 'mainland', '3020', ',2987,3020,3022,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3023', '祥云县', 'mainland', '3020', ',2987,3020,3023,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3024', '宾川县', 'mainland', '3020', ',2987,3020,3024,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3025', '弥渡县', 'mainland', '3020', ',2987,3020,3025,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3026', '南涧彝族自治县', 'mainland', '3020', ',2987,3020,3026,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3027', '巍山彝族回族自治县', 'mainland', '3020', ',2987,3020,3027,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3028', '永平县', 'mainland', '3020', ',2987,3020,3028,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3029', '云龙县', 'mainland', '3020', ',2987,3020,3029,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3030', '洱源县', 'mainland', '3020', ',2987,3020,3030,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3031', '剑川县', 'mainland', '3020', ',2987,3020,3031,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3032', '鹤庆县', 'mainland', '3020', ',2987,3020,3032,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3033', '德宏傣族景颇族自治州', 'mainland', '2987', ',2987,3033,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3034', '瑞丽市', 'mainland', '3033', ',2987,3033,3034,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3035', '潞西市', 'mainland', '3033', ',2987,3033,3035,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3036', '梁河县', 'mainland', '3033', ',2987,3033,3036,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3037', '盈江县', 'mainland', '3033', ',2987,3033,3037,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3038', '陇川县', 'mainland', '3033', ',2987,3033,3038,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3039', '迪庆藏族自治州', 'mainland', '2987', ',2987,3039,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3040', '香格里拉县', 'mainland', '3039', ',2987,3039,3040,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3041', '德钦县', 'mainland', '3039', ',2987,3039,3041,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3042', '维西傈僳族自治县', 'mainland', '3039', ',2987,3039,3042,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3043', '红河哈尼族彝族自治州', 'mainland', '2987', ',2987,3043,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3044', '个旧市', 'mainland', '3043', ',2987,3043,3044,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3045', '开远市', 'mainland', '3043', ',2987,3043,3045,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3046', '蒙自县', 'mainland', '3043', ',2987,3043,3046,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3047', '屏边苗族自治县', 'mainland', '3043', ',2987,3043,3047,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3048', '建水县', 'mainland', '3043', ',2987,3043,3048,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3049', '石屏县', 'mainland', '3043', ',2987,3043,3049,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3050', '弥勒县', 'mainland', '3043', ',2987,3043,3050,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3051', '泸西县', 'mainland', '3043', ',2987,3043,3051,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3052', '元阳县', 'mainland', '3043', ',2987,3043,3052,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3053', '红河县', 'mainland', '3043', ',2987,3043,3053,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3054', '金平苗族瑶族傣族自治县', 'mainland', '3043', ',2987,3043,3054,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3055', '绿春县', 'mainland', '3043', ',2987,3043,3055,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3056', '河口瑶族自治县', 'mainland', '3043', ',2987,3043,3056,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3057', '丽江市', 'mainland', '2987', ',2987,3057,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3058', '古城区', 'mainland', '3057', ',2987,3057,3058,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3059', '玉龙纳西族自治县', 'mainland', '3057', ',2987,3057,3059,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3060', '永胜县', 'mainland', '3057', ',2987,3057,3060,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3061', '华坪县', 'mainland', '3057', ',2987,3057,3061,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3062', '宁蒗彝族自治县', 'mainland', '3057', ',2987,3057,3062,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3063', '临沧市', 'mainland', '2987', ',2987,3063,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3064', '临翔区', 'mainland', '3063', ',2987,3063,3064,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3065', '凤庆县', 'mainland', '3063', ',2987,3063,3065,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3066', '云县', 'mainland', '3063', ',2987,3063,3066,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3067', '永德县', 'mainland', '3063', ',2987,3063,3067,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3068', '镇康县', 'mainland', '3063', ',2987,3063,3068,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3069', '双江拉祜族佤族布朗族傣族自治县', 'mainland', '3063', ',2987,3063,3069,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3070', '耿马傣族佤族自治县', 'mainland', '3063', ',2987,3063,3070,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3071', '沧源佤族自治县', 'mainland', '3063', ',2987,3063,3071,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3072', '怒江傈僳族自治州', 'mainland', '2987', ',2987,3072,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3073', '泸水县', 'mainland', '3072', ',2987,3072,3073,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3074', '福贡县', 'mainland', '3072', ',2987,3072,3074,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3075', '贡山独龙族怒族自治县', 'mainland', '3072', ',2987,3072,3075,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3076', '兰坪白族普米族自治县', 'mainland', '3072', ',2987,3072,3076,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3077', '曲靖市', 'mainland', '2987', ',2987,3077,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3078', '麒麟区', 'mainland', '3077', ',2987,3077,3078,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3079', '马龙县', 'mainland', '3077', ',2987,3077,3079,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3080', '陆良县', 'mainland', '3077', ',2987,3077,3080,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3081', '师宗县', 'mainland', '3077', ',2987,3077,3081,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3082', '罗平县', 'mainland', '3077', ',2987,3077,3082,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3083', '富源县', 'mainland', '3077', ',2987,3077,3083,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3084', '会泽县', 'mainland', '3077', ',2987,3077,3084,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3085', '沾益县', 'mainland', '3077', ',2987,3077,3085,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3086', '宣威市', 'mainland', '3077', ',2987,3077,3086,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3087', '思茅市', 'mainland', '2987', ',2987,3087,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3088', '翠云区', 'mainland', '3087', ',2987,3087,3088,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3089', '普洱哈尼族彝族自治县', 'mainland', '3087', ',2987,3087,3089,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3090', '墨江哈尼族自治县', 'mainland', '3087', ',2987,3087,3090,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3091', '景东彝族自治县', 'mainland', '3087', ',2987,3087,3091,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3092', '景谷傣族彝族自治县', 'mainland', '3087', ',2987,3087,3092,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3093', '镇沅彝族哈尼族拉祜族自治县', 'mainland', '3087', ',2987,3087,3093,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3094', '江城哈尼族彝族自治县', 'mainland', '3087', ',2987,3087,3094,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3095', '孟连傣族拉祜族佤族自治县', 'mainland', '3087', ',2987,3087,3095,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3096', '澜沧拉祜族自治县', 'mainland', '3087', ',2987,3087,3096,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3097', '西盟佤族自治县', 'mainland', '3087', ',2987,3087,3097,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3098', '文山壮族苗族自治州', 'mainland', '2987', ',2987,3098,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3099', '文山县', 'mainland', '3098', ',2987,3098,3099,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3100', '砚山县', 'mainland', '3098', ',2987,3098,3100,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3101', '西畴县', 'mainland', '3098', ',2987,3098,3101,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3102', '麻栗坡县', 'mainland', '3098', ',2987,3098,3102,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3103', '马关县', 'mainland', '3098', ',2987,3098,3103,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3104', '丘北县', 'mainland', '3098', ',2987,3098,3104,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3105', '广南县', 'mainland', '3098', ',2987,3098,3105,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3106', '富宁县', 'mainland', '3098', ',2987,3098,3106,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3107', '西双版纳傣族自治州', 'mainland', '2987', ',2987,3107,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3108', '景洪市', 'mainland', '3107', ',2987,3107,3108,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3109', '勐海县', 'mainland', '3107', ',2987,3107,3109,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3110', '勐腊县', 'mainland', '3107', ',2987,3107,3110,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3111', '玉溪市', 'mainland', '2987', ',2987,3111,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3112', '红塔区', 'mainland', '3111', ',2987,3111,3112,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3113', '江川县', 'mainland', '3111', ',2987,3111,3113,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3114', '澄江县', 'mainland', '3111', ',2987,3111,3114,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3115', '通海县', 'mainland', '3111', ',2987,3111,3115,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3116', '华宁县', 'mainland', '3111', ',2987,3111,3116,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3117', '易门县', 'mainland', '3111', ',2987,3111,3117,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3118', '峨山彝族自治县', 'mainland', '3111', ',2987,3111,3118,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3119', '新平彝族傣族自治县', 'mainland', '3111', ',2987,3111,3119,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3120', '元江哈尼族彝族傣族自治县', 'mainland', '3111', ',2987,3111,3120,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3121', '昭通市', 'mainland', '2987', ',2987,3121,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3122', '昭阳区', 'mainland', '3121', ',2987,3121,3122,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3123', '鲁甸县', 'mainland', '3121', ',2987,3121,3123,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3124', '巧家县', 'mainland', '3121', ',2987,3121,3124,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3125', '盐津县', 'mainland', '3121', ',2987,3121,3125,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3126', '大关县', 'mainland', '3121', ',2987,3121,3126,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3127', '永善县', 'mainland', '3121', ',2987,3121,3127,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3128', '绥江县', 'mainland', '3121', ',2987,3121,3128,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3129', '镇雄县', 'mainland', '3121', ',2987,3121,3129,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3130', '彝良县', 'mainland', '3121', ',2987,3121,3130,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3131', '威信县', 'mainland', '3121', ',2987,3121,3131,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3132', '水富县', 'mainland', '3121', ',2987,3121,3132,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3133', '浙江', 'mainland', null, ',3133,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('3134', '杭州市', 'mainland', '3133', ',3133,3134,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3135', '上城区', 'mainland', '3134', ',3133,3134,3135,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3136', '下城区', 'mainland', '3134', ',3133,3134,3136,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3137', '江干区', 'mainland', '3134', ',3133,3134,3137,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3138', '拱墅区', 'mainland', '3134', ',3133,3134,3138,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3139', '西湖区', 'mainland', '3134', ',3133,3134,3139,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3140', '滨江区', 'mainland', '3134', ',3133,3134,3140,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3141', '萧山区', 'mainland', '3134', ',3133,3134,3141,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3142', '余杭区', 'mainland', '3134', ',3133,3134,3142,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3143', '桐庐县', 'mainland', '3134', ',3133,3134,3143,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3144', '淳安县', 'mainland', '3134', ',3133,3134,3144,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3145', '建德市', 'mainland', '3134', ',3133,3134,3145,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3146', '富阳市', 'mainland', '3134', ',3133,3134,3146,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3147', '临安市', 'mainland', '3134', ',3133,3134,3147,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3148', '湖州市', 'mainland', '3133', ',3133,3148,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3149', '吴兴区', 'mainland', '3148', ',3133,3148,3149,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3150', '南浔区', 'mainland', '3148', ',3133,3148,3150,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3151', '德清县', 'mainland', '3148', ',3133,3148,3151,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3152', '长兴县', 'mainland', '3148', ',3133,3148,3152,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3153', '安吉县', 'mainland', '3148', ',3133,3148,3153,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3154', '嘉兴市', 'mainland', '3133', ',3133,3154,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3155', '秀城区', 'mainland', '3154', ',3133,3154,3155,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3156', '秀洲区', 'mainland', '3154', ',3133,3154,3156,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3157', '嘉善县', 'mainland', '3154', ',3133,3154,3157,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3158', '海盐县', 'mainland', '3154', ',3133,3154,3158,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3159', '海宁市', 'mainland', '3154', ',3133,3154,3159,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3160', '平湖市', 'mainland', '3154', ',3133,3154,3160,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3161', '桐乡市', 'mainland', '3154', ',3133,3154,3161,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3162', '金华市', 'mainland', '3133', ',3133,3162,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3163', '婺城区', 'mainland', '3162', ',3133,3162,3163,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3164', '金东区', 'mainland', '3162', ',3133,3162,3164,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3165', '武义县', 'mainland', '3162', ',3133,3162,3165,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3166', '浦江县', 'mainland', '3162', ',3133,3162,3166,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3167', '磐安县', 'mainland', '3162', ',3133,3162,3167,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3168', '兰溪市', 'mainland', '3162', ',3133,3162,3168,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3169', '义乌市', 'mainland', '3162', ',3133,3162,3169,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3170', '东阳市', 'mainland', '3162', ',3133,3162,3170,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3171', '永康市', 'mainland', '3162', ',3133,3162,3171,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3172', '丽水市', 'mainland', '3133', ',3133,3172,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3173', '莲都区', 'mainland', '3172', ',3133,3172,3173,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3174', '青田县', 'mainland', '3172', ',3133,3172,3174,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3175', '缙云县', 'mainland', '3172', ',3133,3172,3175,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3176', '遂昌县', 'mainland', '3172', ',3133,3172,3176,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3177', '松阳县', 'mainland', '3172', ',3133,3172,3177,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3178', '云和县', 'mainland', '3172', ',3133,3172,3178,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3179', '庆元县', 'mainland', '3172', ',3133,3172,3179,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3180', '景宁畲族自治县', 'mainland', '3172', ',3133,3172,3180,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3181', '龙泉市', 'mainland', '3172', ',3133,3172,3181,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3182', '宁波市', 'mainland', '3133', ',3133,3182,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3183', '海曙区', 'mainland', '3182', ',3133,3182,3183,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3184', '江东区', 'mainland', '3182', ',3133,3182,3184,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3185', '江北区', 'mainland', '3182', ',3133,3182,3185,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3186', '北仑区', 'mainland', '3182', ',3133,3182,3186,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3187', '镇海区', 'mainland', '3182', ',3133,3182,3187,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3188', '鄞州区', 'mainland', '3182', ',3133,3182,3188,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3189', '象山县', 'mainland', '3182', ',3133,3182,3189,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3190', '宁海县', 'mainland', '3182', ',3133,3182,3190,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3191', '余姚市', 'mainland', '3182', ',3133,3182,3191,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3192', '慈溪市', 'mainland', '3182', ',3133,3182,3192,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3193', '奉化市', 'mainland', '3182', ',3133,3182,3193,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3194', '衢州市', 'mainland', '3133', ',3133,3194,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3195', '柯城区', 'mainland', '3194', ',3133,3194,3195,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3196', '衢江区', 'mainland', '3194', ',3133,3194,3196,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3197', '常山县', 'mainland', '3194', ',3133,3194,3197,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3198', '开化县', 'mainland', '3194', ',3133,3194,3198,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3199', '龙游县', 'mainland', '3194', ',3133,3194,3199,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3200', '江山市', 'mainland', '3194', ',3133,3194,3200,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3201', '绍兴市', 'mainland', '3133', ',3133,3201,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3202', '越城区', 'mainland', '3201', ',3133,3201,3202,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3203', '绍兴县', 'mainland', '3201', ',3133,3201,3203,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3204', '新昌县', 'mainland', '3201', ',3133,3201,3204,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3205', '诸暨市', 'mainland', '3201', ',3133,3201,3205,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3206', '上虞市', 'mainland', '3201', ',3133,3201,3206,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3207', '嵊州市', 'mainland', '3201', ',3133,3201,3207,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3208', '台州市', 'mainland', '3133', ',3133,3208,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3209', '椒江区', 'mainland', '3208', ',3133,3208,3209,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3210', '黄岩区', 'mainland', '3208', ',3133,3208,3210,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3211', '路桥区', 'mainland', '3208', ',3133,3208,3211,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3212', '玉环县', 'mainland', '3208', ',3133,3208,3212,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3213', '三门县', 'mainland', '3208', ',3133,3208,3213,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3214', '天台县', 'mainland', '3208', ',3133,3208,3214,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3215', '仙居县', 'mainland', '3208', ',3133,3208,3215,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3216', '温岭市', 'mainland', '3208', ',3133,3208,3216,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3217', '临海市', 'mainland', '3208', ',3133,3208,3217,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3218', '温州市', 'mainland', '3133', ',3133,3218,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3219', '鹿城区', 'mainland', '3218', ',3133,3218,3219,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3220', '龙湾区', 'mainland', '3218', ',3133,3218,3220,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3221', '瓯海区', 'mainland', '3218', ',3133,3218,3221,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3222', '洞头县', 'mainland', '3218', ',3133,3218,3222,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3223', '永嘉县', 'mainland', '3218', ',3133,3218,3223,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3224', '平阳县', 'mainland', '3218', ',3133,3218,3224,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3225', '苍南县', 'mainland', '3218', ',3133,3218,3225,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3226', '文成县', 'mainland', '3218', ',3133,3218,3226,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3227', '泰顺县', 'mainland', '3218', ',3133,3218,3227,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3228', '瑞安市', 'mainland', '3218', ',3133,3218,3228,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3229', '乐清市', 'mainland', '3218', ',3133,3218,3229,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3230', '舟山市', 'mainland', '3133', ',3133,3230,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3231', '定海区', 'mainland', '3230', ',3133,3230,3231,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3232', '普陀区', 'mainland', '3230', ',3133,3230,3232,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3233', '岱山县', 'mainland', '3230', ',3133,3230,3233,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3234', '嵊泗县', 'mainland', '3230', ',3133,3230,3234,', '3', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3235', '香港', 'mainland', null, ',3235,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('3236', '九龙', 'mainland', '3235', ',3235,3236,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3237', '香港岛', 'mainland', '3235', ',3235,3237,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3238', '新界', 'mainland', '3235', ',3235,3238,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3239', '澳门', 'mainland', null, ',3239,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('3240', '澳门半岛', 'mainland', '3239', ',3239,3240,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3241', '离岛', 'mainland', '3239', ',3239,3241,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3242', '台湾', 'mainland', null, ',3242,', '1', null, null, '50', 'false');
INSERT INTO `car_ectools_regions` VALUES ('3243', '台北市', 'mainland', '3242', ',3242,3243,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3244', '高雄市', 'mainland', '3242', ',3242,3244,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3245', '高雄县', 'mainland', '3242', ',3242,3245,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3246', '花莲县', 'mainland', '3242', ',3242,3246,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3247', '基隆市', 'mainland', '3242', ',3242,3247,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3248', '嘉义市', 'mainland', '3242', ',3242,3248,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3249', '嘉义县', 'mainland', '3242', ',3242,3249,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3250', '金门县', 'mainland', '3242', ',3242,3250,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3251', '苗栗县', 'mainland', '3242', ',3242,3251,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3252', '南投县', 'mainland', '3242', ',3242,3252,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3253', '澎湖县', 'mainland', '3242', ',3242,3253,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3254', '屏东县', 'mainland', '3242', ',3242,3254,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3255', '台北县', 'mainland', '3242', ',3242,3255,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3256', '台东县', 'mainland', '3242', ',3242,3256,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3257', '台南市', 'mainland', '3242', ',3242,3257,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3258', '台南县', 'mainland', '3242', ',3242,3258,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3259', '台中市', 'mainland', '3242', ',3242,3259,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3260', '台中县', 'mainland', '3242', ',3242,3260,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3261', '桃园县', 'mainland', '3242', ',3242,3261,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3262', '新竹市', 'mainland', '3242', ',3242,3262,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3263', '新竹县', 'mainland', '3242', ',3242,3263,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3264', '宜兰县', 'mainland', '3242', ',3242,3264,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3265', '云林县', 'mainland', '3242', ',3242,3265,', '2', null, null, null, 'false');
INSERT INTO `car_ectools_regions` VALUES ('3266', '彰化县', 'mainland', '3242', ',3242,3266,', '2', null, null, null, 'false');

-- ----------------------------
-- Table structure for car_image_image
-- ----------------------------
DROP TABLE IF EXISTS `car_image_image`;
CREATE TABLE `car_image_image` (
  `image_id` char(32) NOT NULL COMMENT '图片ID',
  `ident` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL COMMENT '网址',
  `l_ident` varchar(200) DEFAULT NULL COMMENT '大图唯一标识',
  `l_url` varchar(200) DEFAULT NULL COMMENT '大图URL地址',
  `m_ident` varchar(200) DEFAULT NULL COMMENT '中图唯一标识',
  `m_url` varchar(200) DEFAULT NULL COMMENT '中图URL地址',
  `s_ident` varchar(200) DEFAULT NULL COMMENT '小图唯一标识',
  `s_url` varchar(200) DEFAULT NULL COMMENT '小图URL地址',
  `last_modified` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_image_image
-- ----------------------------
INSERT INTO `car_image_image` VALUES ('3c4dbe88f59e9d6f3c8e049e63cb67fc', '20150402/cb4b69eb9bd10da82c15dca2f86a1385_2015_04_02_210118.jpg', 'images/20150402/cb4b69eb9bd10da82c15dca2f86a1385_2015_04_02_210118.jpg', '20150402/cb4b69eb9bd10da82c15dca2f86a1385_2015_04_02_210118_l.jpg', 'images/20150402/cb4b69eb9bd10da82c15dca2f86a1385_2015_04_02_210118_l.jpg', '20150402/cb4b69eb9bd10da82c15dca2f86a1385_2015_04_02_210118_m.jpg', 'images/20150402/cb4b69eb9bd10da82c15dca2f86a1385_2015_04_02_210118_m.jpg', '20150402/cb4b69eb9bd10da82c15dca2f86a1385_2015_04_02_210118_s.jpg', 'images/20150402/cb4b69eb9bd10da82c15dca2f86a1385_2015_04_02_210118_s.jpg', '1427979714');
INSERT INTO `car_image_image` VALUES ('424d272a4998c1f38c1cbfd7264a9833', '20150402/79cae1be0fbae74dafbf8399ee2209cb_2015_04_02_210226.jpg', 'images/20150402/79cae1be0fbae74dafbf8399ee2209cb_2015_04_02_210226.jpg', '20150402/79cae1be0fbae74dafbf8399ee2209cb_2015_04_02_210226_l.jpg', 'images/20150402/79cae1be0fbae74dafbf8399ee2209cb_2015_04_02_210226_l.jpg', '20150402/79cae1be0fbae74dafbf8399ee2209cb_2015_04_02_210226_m.jpg', 'images/20150402/79cae1be0fbae74dafbf8399ee2209cb_2015_04_02_210226_m.jpg', '20150402/79cae1be0fbae74dafbf8399ee2209cb_2015_04_02_210226_s.jpg', 'images/20150402/79cae1be0fbae74dafbf8399ee2209cb_2015_04_02_210226_s.jpg', '1427979795');
INSERT INTO `car_image_image` VALUES ('4a741c5ab9b43ab073d755918cf5c5ad', '20150402/b0a665a28efd91535abb111d656ecd04_2015_04_02_204908.jpg', 'images/20150402/b0a665a28efd91535abb111d656ecd04_2015_04_02_204908.jpg', '20150402/b0a665a28efd91535abb111d656ecd04_2015_04_02_204908_l.jpg', 'images/20150402/b0a665a28efd91535abb111d656ecd04_2015_04_02_204908_l.jpg', '20150402/b0a665a28efd91535abb111d656ecd04_2015_04_02_204908_m.jpg', 'images/20150402/b0a665a28efd91535abb111d656ecd04_2015_04_02_204908_m.jpg', '20150402/b0a665a28efd91535abb111d656ecd04_2015_04_02_204908_s.jpg', 'images/20150402/b0a665a28efd91535abb111d656ecd04_2015_04_02_204908_s.jpg', '1427979015');
INSERT INTO `car_image_image` VALUES ('4e2711c1d6e2b3780e997587047926c6', '20150402/97785e0500ad16c18574c64189ccf4b4_2015_04_02_205622.jpg', 'images/20150402/97785e0500ad16c18574c64189ccf4b4_2015_04_02_205622.jpg', '20150402/97785e0500ad16c18574c64189ccf4b4_2015_04_02_205622_l.jpg', 'images/20150402/97785e0500ad16c18574c64189ccf4b4_2015_04_02_205622_l.jpg', '20150402/97785e0500ad16c18574c64189ccf4b4_2015_04_02_205622_m.jpg', 'images/20150402/97785e0500ad16c18574c64189ccf4b4_2015_04_02_205622_m.jpg', '20150402/97785e0500ad16c18574c64189ccf4b4_2015_04_02_205622_s.jpg', 'images/20150402/97785e0500ad16c18574c64189ccf4b4_2015_04_02_205622_s.jpg', '1427979414');
INSERT INTO `car_image_image` VALUES ('61af9737273eec0a61966903ddf42333', '20150402/86b3e165b8154656a71ffe8a327ded7d_2015_04_02_143636.jpg', 'images/20150402/86b3e165b8154656a71ffe8a327ded7d_2015_04_02_143636.jpg', '20150402/86b3e165b8154656a71ffe8a327ded7d_2015_04_02_143636_l.jpg', 'images/20150402/86b3e165b8154656a71ffe8a327ded7d_2015_04_02_143636_l.jpg', '20150402/86b3e165b8154656a71ffe8a327ded7d_2015_04_02_143636_m.jpg', 'images/20150402/86b3e165b8154656a71ffe8a327ded7d_2015_04_02_143636_m.jpg', '20150402/86b3e165b8154656a71ffe8a327ded7d_2015_04_02_143636_s.jpg', 'images/20150402/86b3e165b8154656a71ffe8a327ded7d_2015_04_02_143636_s.jpg', '1427956676');
INSERT INTO `car_image_image` VALUES ('6c6e287ca4add29cdc0302a0e3529775', '20150413/b6f76d7dbb84020faf70b18a13d73a27_2015_04_13_183454.png', 'images/20150413/b6f76d7dbb84020faf70b18a13d73a27_2015_04_13_183454.png', '20150413/b6f76d7dbb84020faf70b18a13d73a27_2015_04_13_183454_l.png', 'images/20150413/b6f76d7dbb84020faf70b18a13d73a27_2015_04_13_183454_l.png', '20150413/b6f76d7dbb84020faf70b18a13d73a27_2015_04_13_183454_m.png', 'images/20150413/b6f76d7dbb84020faf70b18a13d73a27_2015_04_13_183454_m.png', '20150413/b6f76d7dbb84020faf70b18a13d73a27_2015_04_13_183454_s.png', 'images/20150413/b6f76d7dbb84020faf70b18a13d73a27_2015_04_13_183454_s.png', '1428921307');
INSERT INTO `car_image_image` VALUES ('6e3f795c9a8edb93dc6ce383697f57b2', '20150403/696b35cc35e710279b9c2dedc08e22d7_2015_04_03_020809.jpg', 'images/20150403/696b35cc35e710279b9c2dedc08e22d7_2015_04_03_020809.jpg', '20150403/696b35cc35e710279b9c2dedc08e22d7_2015_04_03_020809_l.jpg', 'images/20150403/696b35cc35e710279b9c2dedc08e22d7_2015_04_03_020809_l.jpg', '20150403/696b35cc35e710279b9c2dedc08e22d7_2015_04_03_020809_m.jpg', 'images/20150403/696b35cc35e710279b9c2dedc08e22d7_2015_04_03_020809_m.jpg', '20150403/696b35cc35e710279b9c2dedc08e22d7_2015_04_03_020809_s.jpg', 'images/20150403/696b35cc35e710279b9c2dedc08e22d7_2015_04_03_020809_s.jpg', '1427998093');
INSERT INTO `car_image_image` VALUES ('7282b27d456b42f6a0f0be015806bd3e', '20150413/a33f5792b2a9a51ddd0111b3ac6e0e76_2015_04_13_183459.png', 'images/20150413/a33f5792b2a9a51ddd0111b3ac6e0e76_2015_04_13_183459.png', '20150413/a33f5792b2a9a51ddd0111b3ac6e0e76_2015_04_13_183459_l.png', 'images/20150413/a33f5792b2a9a51ddd0111b3ac6e0e76_2015_04_13_183459_l.png', '20150413/a33f5792b2a9a51ddd0111b3ac6e0e76_2015_04_13_183459_m.png', 'images/20150413/a33f5792b2a9a51ddd0111b3ac6e0e76_2015_04_13_183459_m.png', '20150413/a33f5792b2a9a51ddd0111b3ac6e0e76_2015_04_13_183459_s.png', 'images/20150413/a33f5792b2a9a51ddd0111b3ac6e0e76_2015_04_13_183459_s.png', '1428921307');
INSERT INTO `car_image_image` VALUES ('783f94af1c031ac26e3d8836ba19e397', '20150402/4d386d01419c083e8df5de53eb5a0254_2015_04_02_205428.jpg', 'images/20150402/4d386d01419c083e8df5de53eb5a0254_2015_04_02_205428.jpg', '20150402/4d386d01419c083e8df5de53eb5a0254_2015_04_02_205428_l.jpg', 'images/20150402/4d386d01419c083e8df5de53eb5a0254_2015_04_02_205428_l.jpg', '20150402/4d386d01419c083e8df5de53eb5a0254_2015_04_02_205428_m.jpg', 'images/20150402/4d386d01419c083e8df5de53eb5a0254_2015_04_02_205428_m.jpg', '20150402/4d386d01419c083e8df5de53eb5a0254_2015_04_02_205428_s.jpg', 'images/20150402/4d386d01419c083e8df5de53eb5a0254_2015_04_02_205428_s.jpg', '1427979308');
INSERT INTO `car_image_image` VALUES ('7a7143ec02f666ee61b23f83addcfd44', '20150412/8c620c2faaafd489b4c45b448acac3a0_2015_04_12_194327.jpg', 'images/20150412/8c620c2faaafd489b4c45b448acac3a0_2015_04_12_194327.jpg', '20150412/8c620c2faaafd489b4c45b448acac3a0_2015_04_12_194327_l.jpg', 'images/20150412/8c620c2faaafd489b4c45b448acac3a0_2015_04_12_194327_l.jpg', '20150412/8c620c2faaafd489b4c45b448acac3a0_2015_04_12_194327_m.jpg', 'images/20150412/8c620c2faaafd489b4c45b448acac3a0_2015_04_12_194327_m.jpg', '20150412/8c620c2faaafd489b4c45b448acac3a0_2015_04_12_194327_s.jpg', 'images/20150412/8c620c2faaafd489b4c45b448acac3a0_2015_04_12_194327_s.jpg', '1428839013');
INSERT INTO `car_image_image` VALUES ('9b86c5197e97ca3020f74e979ac39792', '20150402/488e4104520c6aab692863cc1dba45af_2015_04_02_205920.jpg', 'images/20150402/488e4104520c6aab692863cc1dba45af_2015_04_02_205920.jpg', '20150402/488e4104520c6aab692863cc1dba45af_2015_04_02_205920_l.jpg', 'images/20150402/488e4104520c6aab692863cc1dba45af_2015_04_02_205920_l.jpg', '20150402/488e4104520c6aab692863cc1dba45af_2015_04_02_205920_m.jpg', 'images/20150402/488e4104520c6aab692863cc1dba45af_2015_04_02_205920_m.jpg', '20150402/488e4104520c6aab692863cc1dba45af_2015_04_02_205920_s.jpg', 'images/20150402/488e4104520c6aab692863cc1dba45af_2015_04_02_205920_s.jpg', '1427979623');
INSERT INTO `car_image_image` VALUES ('9b911d5a385705552186913e25923b56', '20150413/4b7a55505729b7f664e7222960e9c2d5_2015_04_13_105757.jpg', 'images/20150413/4b7a55505729b7f664e7222960e9c2d5_2015_04_13_105757.jpg', '20150413/4b7a55505729b7f664e7222960e9c2d5_2015_04_13_105757_l.jpg', 'images/20150413/4b7a55505729b7f664e7222960e9c2d5_2015_04_13_105757_l.jpg', '20150413/4b7a55505729b7f664e7222960e9c2d5_2015_04_13_105757_m.jpg', 'images/20150413/4b7a55505729b7f664e7222960e9c2d5_2015_04_13_105757_m.jpg', '20150413/4b7a55505729b7f664e7222960e9c2d5_2015_04_13_105757_s.jpg', 'images/20150413/4b7a55505729b7f664e7222960e9c2d5_2015_04_13_105757_s.jpg', '1428893891');
INSERT INTO `car_image_image` VALUES ('ccaa2e67fe4c9dd2903424ca35018605', '20150402/10493aa88605cad5ab4752b04a63d172_2015_04_02_210358.jpg', 'images/20150402/10493aa88605cad5ab4752b04a63d172_2015_04_02_210358.jpg', '20150402/10493aa88605cad5ab4752b04a63d172_2015_04_02_210358_l.jpg', 'images/20150402/10493aa88605cad5ab4752b04a63d172_2015_04_02_210358_l.jpg', '20150402/10493aa88605cad5ab4752b04a63d172_2015_04_02_210358_m.jpg', 'images/20150402/10493aa88605cad5ab4752b04a63d172_2015_04_02_210358_m.jpg', '20150402/10493aa88605cad5ab4752b04a63d172_2015_04_02_210358_s.jpg', 'images/20150402/10493aa88605cad5ab4752b04a63d172_2015_04_02_210358_s.jpg', '1427979873');
INSERT INTO `car_image_image` VALUES ('d99cc9f16e879ba093b38b7151cdfb2e', '20150402/acfe22eeddf82266e32f8f17912d59fe_2015_04_02_144059.jpg', 'images/20150402/acfe22eeddf82266e32f8f17912d59fe_2015_04_02_144059.jpg', '20150402/acfe22eeddf82266e32f8f17912d59fe_2015_04_02_144059_l.jpg', 'images/20150402/acfe22eeddf82266e32f8f17912d59fe_2015_04_02_144059_l.jpg', '20150402/acfe22eeddf82266e32f8f17912d59fe_2015_04_02_144059_m.jpg', 'images/20150402/acfe22eeddf82266e32f8f17912d59fe_2015_04_02_144059_m.jpg', '20150402/acfe22eeddf82266e32f8f17912d59fe_2015_04_02_144059_s.jpg', 'images/20150402/acfe22eeddf82266e32f8f17912d59fe_2015_04_02_144059_s.jpg', '1427956900');
INSERT INTO `car_image_image` VALUES ('da2d0766e785419cf7dd54ad2c54b854', '20150403/a3a3e8b30dd6eadfc78c77bb2b8e6b60_2015_04_03_013923.jpg', 'images/20150403/a3a3e8b30dd6eadfc78c77bb2b8e6b60_2015_04_03_013923.jpg', '20150403/a3a3e8b30dd6eadfc78c77bb2b8e6b60_2015_04_03_013923_l.jpg', 'images/20150403/a3a3e8b30dd6eadfc78c77bb2b8e6b60_2015_04_03_013923_l.jpg', '20150403/a3a3e8b30dd6eadfc78c77bb2b8e6b60_2015_04_03_013923_m.jpg', 'images/20150403/a3a3e8b30dd6eadfc78c77bb2b8e6b60_2015_04_03_013923_m.jpg', '20150403/a3a3e8b30dd6eadfc78c77bb2b8e6b60_2015_04_03_013923_s.jpg', 'images/20150403/a3a3e8b30dd6eadfc78c77bb2b8e6b60_2015_04_03_013923_s.jpg', '1427996367');
INSERT INTO `car_image_image` VALUES ('e2c39579d7451f2b83fd594e63a0b15b', '20150402/1f490b64a7d1716e9952d627b9baa45e_2015_04_02_205155.jpg', 'images/20150402/1f490b64a7d1716e9952d627b9baa45e_2015_04_02_205155.jpg', '20150402/1f490b64a7d1716e9952d627b9baa45e_2015_04_02_205155_l.jpg', 'images/20150402/1f490b64a7d1716e9952d627b9baa45e_2015_04_02_205155_l.jpg', '20150402/1f490b64a7d1716e9952d627b9baa45e_2015_04_02_205155_m.jpg', 'images/20150402/1f490b64a7d1716e9952d627b9baa45e_2015_04_02_205155_m.jpg', '20150402/1f490b64a7d1716e9952d627b9baa45e_2015_04_02_205155_s.jpg', 'images/20150402/1f490b64a7d1716e9952d627b9baa45e_2015_04_02_205155_s.jpg', '1427979153');

-- ----------------------------
-- Table structure for car_image_image_attach
-- ----------------------------
DROP TABLE IF EXISTS `car_image_image_attach`;
CREATE TABLE `car_image_image_attach` (
  `attach_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片关联表ID',
  `target_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对象id-外键',
  `target_type` varchar(20) NOT NULL DEFAULT '0' COMMENT '对象类型',
  `image_id` char(32) NOT NULL DEFAULT '0' COMMENT '图片的主键-外键关联image表',
  `last_modified` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attach_id`),
  KEY `index_1` (`target_id`,`target_type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_image_image_attach
-- ----------------------------
INSERT INTO `car_image_image_attach` VALUES ('1', '1', 'goods', '61af9737273eec0a61966903ddf42333', '1427956676');
INSERT INTO `car_image_image_attach` VALUES ('2', '2', 'goods', 'd99cc9f16e879ba093b38b7151cdfb2e', '1427956900');
INSERT INTO `car_image_image_attach` VALUES ('3', '3', 'goods', '4a741c5ab9b43ab073d755918cf5c5ad', '1427979015');
INSERT INTO `car_image_image_attach` VALUES ('4', '4', 'goods', 'e2c39579d7451f2b83fd594e63a0b15b', '1427979153');
INSERT INTO `car_image_image_attach` VALUES ('5', '5', 'goods', '783f94af1c031ac26e3d8836ba19e397', '1427979308');
INSERT INTO `car_image_image_attach` VALUES ('6', '6', 'goods', '4e2711c1d6e2b3780e997587047926c6', '1427979414');
INSERT INTO `car_image_image_attach` VALUES ('7', '7', 'goods', '9b86c5197e97ca3020f74e979ac39792', '1427979623');
INSERT INTO `car_image_image_attach` VALUES ('8', '8', 'goods', '3c4dbe88f59e9d6f3c8e049e63cb67fc', '1427979714');
INSERT INTO `car_image_image_attach` VALUES ('9', '9', 'goods', '424d272a4998c1f38c1cbfd7264a9833', '1427979795');
INSERT INTO `car_image_image_attach` VALUES ('10', '10', 'goods', 'ccaa2e67fe4c9dd2903424ca35018605', '1427979873');
INSERT INTO `car_image_image_attach` VALUES ('11', '9', 'goods', 'da2d0766e785419cf7dd54ad2c54b854', '1427996367');
INSERT INTO `car_image_image_attach` VALUES ('12', '9', 'goods', '6e3f795c9a8edb93dc6ce383697f57b2', '1427998093');
INSERT INTO `car_image_image_attach` VALUES ('15', '9', 'goods', '6c6e287ca4add29cdc0302a0e3529775', '1428921307');
INSERT INTO `car_image_image_attach` VALUES ('16', '9', 'goods', '7282b27d456b42f6a0f0be015806bd3e', '1428921307');

-- ----------------------------
-- Table structure for car_imicms_wxuser
-- ----------------------------
DROP TABLE IF EXISTS `car_imicms_wxuser`;
CREATE TABLE `car_imicms_wxuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `wxname` varchar(60) NOT NULL COMMENT '公众号名称',
  `winxintype` smallint(2) NOT NULL DEFAULT '1',
  `appid` varchar(50) NOT NULL DEFAULT '',
  `appsecret` varchar(50) NOT NULL DEFAULT '',
  `wxid` varchar(20) NOT NULL COMMENT '公众号原始ID',
  `weixin` char(20) NOT NULL COMMENT '微信号',
  `headerpic` char(255) NOT NULL COMMENT '头像地址',
  `token` char(255) NOT NULL,
  `province` varchar(30) NOT NULL COMMENT '省',
  `city` varchar(60) NOT NULL COMMENT '市',
  `areaid` varchar(50) NOT NULL,
  `qq` char(25) NOT NULL COMMENT '公众号邮箱',
  `wxfans` int(11) NOT NULL COMMENT '微信粉丝',
  `typeid` int(11) NOT NULL COMMENT '分类ID',
  `typename` varchar(90) NOT NULL DEFAULT '0' COMMENT '分类名',
  `tongji` text NOT NULL,
  `allcardnum` int(11) NOT NULL,
  `cardisok` int(11) NOT NULL,
  `yetcardnum` int(11) NOT NULL,
  `totalcardnum` int(11) NOT NULL,
  `createtime` varchar(13) NOT NULL,
  `tpltypeid` int(10) NOT NULL,
  `updatetime` varchar(13) NOT NULL,
  `tpltypename` varchar(20) NOT NULL COMMENT '首页模版名',
  `tpllistid` int(10) NOT NULL,
  `tpllistname` varchar(20) NOT NULL COMMENT '列表模版名',
  `tplcontentid` int(10) NOT NULL,
  `menuid` int(10) NOT NULL,
  `tplcontentname` varchar(20) NOT NULL COMMENT '内容模版名',
  `copyright` varchar(255) NOT NULL DEFAULT '亚蓝信息技术有限公司技术支持',
  `namecolor` varchar(20) NOT NULL DEFAULT '#B2B789',
  `copyid` int(10) NOT NULL,
  `smtp_plat_status` int(1) NOT NULL DEFAULT '0' COMMENT '邮件提醒|0为关闭|1为开启',
  `smtp_plat_host` varchar(60) NOT NULL COMMENT '邮件服务器地址',
  `smtp_plat_port` int(5) NOT NULL DEFAULT '25' COMMENT '邮件服务器端口',
  `smtp_plat_send` varchar(60) NOT NULL COMMENT '邮件发送帐号',
  `smtp_plat_pass` varchar(60) NOT NULL COMMENT '邮件发送密码',
  `smtp_plat_reply` varchar(60) NOT NULL COMMENT '邮件回复地址',
  `smtp_plat_ssl` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否加密连接|0为不加密|1为加密',
  `smtp_plat_order_feed` int(1) NOT NULL DEFAULT '0' COMMENT '下单后邮件通知',
  `smtp_plat_pay_feed` int(1) NOT NULL DEFAULT '0' COMMENT '付款后邮件通知',
  `sms_plat_status` int(1) NOT NULL DEFAULT '0' COMMENT '短信提醒|0为关闭|1为开启',
  `sms_plat_reply` varchar(60) NOT NULL COMMENT '用于接收订单的手机号',
  `sms_plat_user` varchar(60) NOT NULL COMMENT '短信平台帐号',
  `sms_plat_pass` varchar(60) NOT NULL COMMENT '短信平台密码',
  `sms_plat_order_feed` int(1) NOT NULL DEFAULT '0' COMMENT '下单后短信通知',
  `sms_plat_pay_feed` int(1) NOT NULL DEFAULT '0' COMMENT '付款后短信通知',
  `shoptpltypeid` int(11) NOT NULL DEFAULT '1',
  `shoptpltypename` varchar(20) DEFAULT '101_index_wis2a',
  `routerid` varchar(50) NOT NULL DEFAULT '',
  `pigsecret` varchar(150) NOT NULL DEFAULT '',
  `transfer_customer_service` tinyint(1) NOT NULL DEFAULT '0',
  `color_id` int(2) NOT NULL,
  `smsstatus` int(1) DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `smsuser` varchar(20) DEFAULT NULL,
  `smspassword` varchar(20) DEFAULT NULL,
  `emailstatus` int(1) DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `emailuser` varchar(20) DEFAULT NULL,
  `emailpassword` varchar(20) DEFAULT NULL,
  `printstatus` int(1) DEFAULT '0',
  `member_code` varchar(50) DEFAULT NULL,
  `feiyin_key` varchar(50) DEFAULT NULL,
  `device_no` varchar(30) DEFAULT NULL,
  `agentid` int(10) NOT NULL DEFAULT '0',
  `openphotoprint` tinyint(1) NOT NULL DEFAULT '0',
  `freephotocount` mediumint(4) NOT NULL DEFAULT '3',
  `oauth` tinyint(1) NOT NULL DEFAULT '0',
  `aeskey` varchar(45) NOT NULL DEFAULT '',
  `encode` tinyint(1) NOT NULL DEFAULT '0',
  `ifbiz` tinyint(1) DEFAULT '0',
  `fuwuappid` char(20) DEFAULT NULL,
  `oauthinfo` tinyint(1) NOT NULL DEFAULT '1',
  `share_ticket` varchar(150) NOT NULL,
  `share_dated` char(15) NOT NULL,
  `authorizer_access_token` varchar(200) NOT NULL,
  `authorizer_refresh_token` varchar(200) NOT NULL,
  `authorizer_expires` char(10) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `web_access_token` varchar(200) NOT NULL COMMENT ' 网页授权token',
  `web_refresh_token` varchar(200) NOT NULL,
  `web_expires` char(10) NOT NULL,
  `wx_coupons` tinyint(4) NOT NULL,
  `card_ticket` char(120) NOT NULL,
  `wx_liaotian` tinyint(4) NOT NULL,
  `card_expires` char(15) NOT NULL,
  `qr` varchar(1000) NOT NULL,
  `dynamicTmpls` tinyint(1) NOT NULL DEFAULT '0',
  `sub_notice` varchar(255) DEFAULT NULL,
  `need_phone_notice` varchar(255) DEFAULT NULL,
  `sub_notice_btn` varchar(60) DEFAULT NULL,
  `eqx` varchar(5) NOT NULL,
  `eqxpassword` varchar(32) NOT NULL,
  `guanhuai` int(10) NOT NULL,
  `title1` varchar(255) NOT NULL,
  `title2` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uid_2` (`uid`),
  KEY `agentid` (`agentid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_imicms_wxuser
-- ----------------------------
INSERT INTO `car_imicms_wxuser` VALUES ('1', '1', '亚蓝网公众服务', '1', 'wxbd7cf9b1d6970a54', 'b40932be7ca4762cb9e45ec7dde16c7b', 'gh_56dc11cd5df9', 'eakecn', 'http://wx.eake.cn/tpl/Static/kindeditors/attached/99630ff411650cfa/image/20140912/99630ff411650cfa2014091214262498428.jpg', '99630ff411650cfa', '云南省', '昆明市', '安宁市', '4115037@qq.com', '17', '0', '', '', '10000', '0', '10000', '10000', '1409736179', '40', '1423721635', '140_index_qesf', '1', 'yl_list', '1', '0', 'ktv_content', '由亚蓝提供技术支持', '#B2B789', '0', '1', 'smtp.qq.com', '25', 'eakecn', 'www.eake.org.cn', 'eakecn@qq.com', '0', '0', '0', '0', '', '', '', '0', '0', '1', '101_index_wis2a', '', '', '1', '2', '0', null, null, null, '0', null, null, null, '0', null, null, null, '0', '0', '3', '0', '', '0', '0', null, '1', 'sM4AOVdWfPE4DxkXGEs8VJOzi6EkFesjLI9bwDGr5vgb24uvRaEFjziMXi97dRtzlBPeiUYjS_xhxHmgLewgPw', '1436244134', '', '', '', '0', '', '', '', '0', '', '0', '', '', '0', null, null, null, '1', 'c5db244dbfc91ca5dc46626cc21d5594', '0', '', '', '', '');
INSERT INTO `car_imicms_wxuser` VALUES ('2', '3', '昆明非凡灯改', '1', '', '', 'gh_c98518f7cf2f', 'KUNMINGFEIFA', 'http://wx.eake.cn/tpl/Static/kindeditors/attached/image/20140923/2014092320570434864.jpg', '0766c9e6242e738e', '云南省', '昆明市', '市辖区', '583713996@qq.com', '0', '0', '', '', '0', '0', '0', '0', '1411477557', '1', '1411480027', 'ty_index', '1', 'yl_list', '1', '0', 'ktv_content', '由亚蓝提供技术支持', '#B2B789', '0', '0', '', '25', '', '', '', '0', '0', '0', '0', '', '', '', '0', '0', '1', '101_index_wis2a', '', '', '0', '0', '0', null, null, null, '0', null, null, null, '0', null, null, null, '0', '0', '3', '0', '', '0', '0', null, '1', '', '', '', '', '', '0', '', '', '', '0', '', '0', '', '', '0', null, null, null, '', '', '0', '', '', '', '');
INSERT INTO `car_imicms_wxuser` VALUES ('4', '6', '杰诚家政服务有限公司', '2', 'wxabe07624b4c3afa3', 'b575cc3e180e28e07643386eec9f07b4', 'gh_61326fdec3ba', 'j2334066415', 'http://wx.eake.cn/tpl/Static/kindeditors/attached/image/20140929/2014092917151422403.jpg', '257e21c8a9e1be8c', '云南省', '昆明市', '安宁市', '1457963911@qq.com', '100', '0', '', '', '10000', '0', '0', '0', '1411983456', '327', '1412043408', '1327_index_n4fb', '1', 'yl_list', '1', '0', 'ktv_content', '由亚蓝提供技术支持', '#B2B789', '0', '1', 'smtp.qq.com', '110', 'cyangkun@qq.com', 'y13888384509', '1457963911@qq.com ', '0', '1', '1', '0', '', '', '', '0', '0', '1', '101_index_wis2a', '', '', '0', '0', '0', null, null, null, '0', null, null, null, '0', null, null, null, '0', '0', '3', '0', '', '0', '0', null, '1', 'bxLdikRXVbTPdHSM05e5u0RAPxbj0X73i1bHqIMmF2PmCwsX4Z9HiHIImZruSCsFnWPWuEg11RsQRZd0Uj9PkQ', '1436234744', '', '', '', '0', '', '', '', '0', '', '0', '', '', '0', null, null, null, '', '', '0', '', '', '', '');
INSERT INTO `car_imicms_wxuser` VALUES ('9', '15', '雁鹰美体', '1', '', '', 'gh_b76e3525ae30', 'yuanzimeiti', 'http://wx.eake.cn/tpl/Static/kindeditors/attached/image/20141207/2014120721315040215.jpg', '2a94af5381fcc932', '云南省', '昆明市', '安宁市', '695546574@qq.com', '5', '0', '', '', '0', '0', '0', '0', '1417959127', '230', '1432385423', '1230_index_n4fb', '1', 'yl_list', '1', '0', 'ktv_content', '亚蓝信息技术有限公司技术支持', '#B2B789', '0', '0', '', '25', '', '', '', '0', '0', '0', '0', '', '', '', '0', '0', '1', '101_index_wis2a', '', '', '0', '0', '0', null, null, null, '0', null, null, null, '0', null, null, null, '0', '0', '3', '0', 'pvdKIX2TrOvi9WSsLcxkWIVPoZYROZcqa8j9k3NyQ1q', '0', '0', null, '1', '', '', '', '', '', '0', '', '', '', '0', '', '0', '', '', '0', null, null, null, '', '', '0', '', '', '', '');
INSERT INTO `car_imicms_wxuser` VALUES ('8', '14', '杰诚生活 ', '1', '', '', 'gh_a9c20f405190', 'cyangkun', 'http://wx.eake.cn/tpl/Static/kindeditors/attached/image/20141119/2014111914150391540.jpg', 'c4448ac95e30a1eb', '云南省', '昆明市', '安宁市', 'cyangkun@qq.com', '39', '7', '生活', '', '0', '0', '0', '0', '1416377705', '111', '1416377705', '1111_index_cveg', '1', 'yl_list', '1', '0', 'ktv_content', '亚蓝信息技术有限公司技术支持', '#B2B789', '0', '0', '', '25', '', '', '', '0', '0', '0', '0', '', '', '', '0', '0', '1', '101_index_wis2a', '', '', '0', '0', '0', null, null, null, '0', null, null, null, '0', null, null, null, '0', '0', '3', '0', '', '0', '0', null, '1', '', '', '', '', '', '0', '', '', '', '0', '', '0', '', '', '0', null, null, null, '', '', '0', '', '', '', '');
INSERT INTO `car_imicms_wxuser` VALUES ('10', '16', '房贷放松的', '1', '', '', 'gh_40cf14c948b4', '骚的', 'http://wx.eake.cn/tpl/static/kindeditors/attached/image/20150628/2015062822202425147.jpg', 'c6402a3e1bd9cf46', '北京市', '市辖区', '东城区', '123456@qq.com', '123', '8', '服务', '', '0', '0', '0', '0', '1435501242', '1', '1435501242', 'ty_index', '1', 'yl_list', '1', '0', 'ktv_content', '亚蓝信息技术有限公司技术支持', '#B2B789', '0', '0', '', '25', '', '', '', '0', '0', '0', '0', '', '', '', '0', '0', '1', '101_index_wis2a', '', '', '0', '0', '0', null, null, null, '0', null, null, null, '0', null, null, null, '0', '0', '3', '0', '', '0', '0', null, '1', '', '', '', '', '', '0', '', '', '', '0', '', '0', '', '', '0', null, null, null, '', '', '0', '', '', '', '');
INSERT INTO `car_imicms_wxuser` VALUES ('11', '17', '虹贝儿摄影', '1', '', '', 'gh_a6d67cd453d4', 'h15025106511', 'http://wx.eake.cn/tpl/static/kindeditors/attached/image/20150902/2015090210190970232.jpg', '1c5990460d702b81', '云南省', '昆明市', '安宁市', '2224245092@qq.com', '50', '8', '服务', '', '0', '0', '0', '0', '1441160352', '258', '1441160352', '1258_index_n4fb', '1', 'yl_list', '1', '0', 'ktv_content', '亚蓝信息技术有限公司技术支持', '#B2B789', '0', '0', '', '25', '', '', '', '0', '0', '0', '0', '', '', '', '0', '0', '1', '101_index_wis2a', '', '', '0', '0', '0', null, null, null, '0', null, null, null, '0', null, null, null, '0', '0', '3', '0', '', '0', '0', null, '1', '', '', '', '', '', '0', '', '', '', '0', '', '0', '', '', '0', null, null, null, '', '', '0', '', '', '', '');
INSERT INTO `car_imicms_wxuser` VALUES ('12', '18', 'kakaka', '1', '', '', 'kakaka', 'kakaka', 'http://wx.eake.cn/tpl/static/kindeditors/attached/image/20151026/2015102622575029451.jpg', 'a30137baf3b46e82', '北京市', '市辖区', '东城区', 'kakaka@qq.com', '100', '8', '服务', '', '0', '0', '0', '0', '1445871481', '1', '1445871481', 'ty_index', '1', 'yl_list', '1', '0', 'ktv_content', '亚蓝信息技术有限公司技术支持', '#B2B789', '0', '0', '', '25', '', '', '', '0', '0', '0', '0', '', '', '', '0', '0', '1', '101_index_wis2a', '', '', '0', '0', '0', null, null, null, '0', null, null, null, '0', null, null, null, '0', '0', '3', '0', '', '0', '0', null, '1', '', '', '', '', '', '0', '', '', '', '0', '', '0', '', '', '0', null, null, null, '', '', '0', '', '', '', '');
INSERT INTO `car_imicms_wxuser` VALUES ('13', '19', 'kaka', '1', '', '', 'kaka', 'kaka', 'http://wx.eake.cn/tpl/static/kindeditors/attached/image/20151029/2015102921565474528.jpg', 'a06c39b267a5efae', '北京市', '市辖区', '东城区', 'kakaka@qq.com', '88', '8', '服务', '', '0', '0', '0', '0', '1446127018', '1', '1446127018', 'ty_index', '1', 'yl_list', '1', '0', 'ktv_content', '亚蓝信息技术有限公司技术支持', '#B2B789', '0', '0', '', '25', '', '', '', '0', '0', '0', '0', '', '', '', '0', '0', '1', '101_index_wis2a', '', '', '0', '0', '0', null, null, null, '0', null, null, null, '0', null, null, null, '0', '0', '3', '0', '', '0', '0', null, '1', '', '', '', '', '', '0', '', '', '', '0', '', '0', '', '', '0', null, null, null, '', '', '0', '', '', '', '');

-- ----------------------------
-- Table structure for car_pam_members
-- ----------------------------
DROP TABLE IF EXISTS `car_pam_members`;
CREATE TABLE `car_pam_members` (
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '账户序号ID',
  `login_account` varchar(100) NOT NULL COMMENT '登录名',
  `login_type` enum('local','mobile','email') NOT NULL DEFAULT 'local' COMMENT '账户类型',
  `login_password` varchar(32) NOT NULL COMMENT '登录密码',
  `password_account` varchar(100) NOT NULL COMMENT '登录密码加密所用账号',
  `disabled` enum('true','false') DEFAULT 'false',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`member_id`,`login_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_pam_members
-- ----------------------------
INSERT INTO `car_pam_members` VALUES ('1', 'chen', 'mobile', 's66316d36396932e9c036dc5cd6188bb', 'chen', 'false', '1428030759');
INSERT INTO `car_pam_members` VALUES ('2', 'bfoursix', 'mobile', 'se71ece0e9ef768f739af4be2dde80ef', 'bfoursix', 'false', '1428472963');
INSERT INTO `car_pam_members` VALUES ('4', 'parishe', 'mobile', 'sbb04b213e0cc7e50487e0e62a4e30ce', 'parishe', 'false', '1428591591');
INSERT INTO `car_pam_members` VALUES ('5', 'kenday', 'mobile', 's58872fd37aa97ad9ff235ae62b635aa', 'kenday', 'false', '1428637005');
INSERT INTO `car_pam_members` VALUES ('6', '1111', 'mobile', 's26e5bc70d4e503e229374566dcd9900', '1111', 'false', '1428657153');
INSERT INTO `car_pam_members` VALUES ('7', 'msln', 'mobile', 'sa4a5c8df2e59df630714d201a8c77de', 'msln', 'false', '1428729525');
INSERT INTO `car_pam_members` VALUES ('8', 'iecel1990', 'mobile', 's48219c38b9c8b0367a9383d31e3942d', 'iecel1990', 'false', '1428800589');
INSERT INTO `car_pam_members` VALUES ('9', 'chen123', 'mobile', 's69243b4cbaaf037c3fcd155ed0930d1', 'chen123', 'false', '1428812438');
INSERT INTO `car_pam_members` VALUES ('10', 'testadmin', 'mobile', 's68163bcd8f49c6be70786a48d64e113', 'testadmin', 'false', '1428886171');
INSERT INTO `car_pam_members` VALUES ('11', 'lamllack0813', 'mobile', 'sf7fcd9028dea73d630642f2a3af7cab', 'lamllack0813', 'false', '1428900202');
INSERT INTO `car_pam_members` VALUES ('12', '5645', 'mobile', 's99d005e91f8576b099b001855307a37', '5645', 'false', '1428911130');
INSERT INTO `car_pam_members` VALUES ('13', 'admin', 'mobile', 's9ffe37314b3adc44e8825426981e878', 'admin', 'false', '1428911782');
INSERT INTO `car_pam_members` VALUES ('14', 'cndong', 'mobile', 's125a6053e422eeffca459a8b54f1f96', 'cndong', 'false', '1428978230');
INSERT INTO `car_pam_members` VALUES ('15', 'chinkei', 'mobile', 'sc58e329bd43fc5f8be26ca7c2cf8959', 'chinkei', 'false', '1428980109');
INSERT INTO `car_pam_members` VALUES ('16', 'sbfnxk201@126.com', 'mobile', 's081d95d25932c36a2da0b9b6eef3338', 'sbfnxk201@126.com', 'false', '1428980237');
INSERT INTO `car_pam_members` VALUES ('17', 'davidwang', 'mobile', 's94126747621bfe76cbd130f4b3bb444', 'davidwang', 'false', '1428983392');
INSERT INTO `car_pam_members` VALUES ('18', 'skywalkerwei', 'mobile', 's1c48e26a3acbe7d683401738972afcf', 'skywalkerwei', 'false', '1428990005');
INSERT INTO `car_pam_members` VALUES ('19', 'admin1', 'mobile', 's613f74543b9f2512caf9a65fd1cf156', 'admin1', 'false', '1428992645');
INSERT INTO `car_pam_members` VALUES ('20', 'James Bonde', 'mobile', 's1507b2c3a8e0500fb490306490f79a1', 'James Bonde', 'false', '1429001666');
INSERT INTO `car_pam_members` VALUES ('21', 'lyh', 'mobile', 'scafdf9c505e91158ccbc7e6576038b7', 'lyh', 'false', '1429001886');
INSERT INTO `car_pam_members` VALUES ('22', 'tyears', 'mobile', 's9faade2d9f7831e37db9d736c423e79', 'tyears', 'false', '1429012043');
INSERT INTO `car_pam_members` VALUES ('23', 'listenan', 'mobile', 's1a0df97e4be84f2d6daa6b8617da7ab', 'listenan', 'false', '1429018868');
INSERT INTO `car_pam_members` VALUES ('24', 'paul52430', 'mobile', 's036f569e473a3999752df46d8f5c42c', 'paul52430', 'false', '1429065119');
INSERT INTO `car_pam_members` VALUES ('25', 'lijiafei01', 'mobile', 's61661436c36a2e03ddc9b63e5ab5a94', 'lijiafei01', 'false', '1429065319');
INSERT INTO `car_pam_members` VALUES ('26', '123', 'mobile', 'sddfac628911eae6e6e5ba7581a1f60a', '123', 'false', '1429070898');
INSERT INTO `car_pam_members` VALUES ('27', 'test', 'mobile', 's80571c121b567f9b2f058141e3a9235', 'test', 'false', '1429074641');
INSERT INTO `car_pam_members` VALUES ('28', '2', 'mobile', 's20077ad55c6ffce66c2736612919604', '2', 'false', '1429078395');

-- ----------------------------
-- Table structure for car_recommend_dimension
-- ----------------------------
DROP TABLE IF EXISTS `car_recommend_dimension`;
CREATE TABLE `car_recommend_dimension` (
  `dimension_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `channel` enum('app','wap','web') NOT NULL COMMENT '所属渠道',
  `page_type` tinyint(3) unsigned NOT NULL COMMENT '0:所有页面;1:首页;2:一级类页面;3:二级类页面;4:三级类页面;5:品牌页面;6:产品详细页面;7:促销页面;8:登录、注册页面;9:下单页面',
  `position` varchar(30) NOT NULL COMMENT '页面中广告具体位置',
  `position_no` mediumint(3) unsigned NOT NULL COMMENT '页面中广告位具体位置编号：如10,21,22,23,31,32',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `creator` mediumint(5) unsigned NOT NULL COMMENT '创建人',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '编辑时间',
  `updater` mediumint(5) unsigned DEFAULT NULL COMMENT '编辑人',
  `disabled` enum('false','true') NOT NULL DEFAULT 'false' COMMENT '是否失效',
  PRIMARY KEY (`dimension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_recommend_dimension
-- ----------------------------
INSERT INTO `car_recommend_dimension` VALUES ('1', 'web', '1', '每日精选', '10', '1427982172', '1', null, null, 'false');
INSERT INTO `car_recommend_dimension` VALUES ('2', 'web', '1', '热卖商品', '11', '1427984209', '1', null, null, 'false');
INSERT INTO `car_recommend_dimension` VALUES ('3', 'web', '0', '促销商品', '1', '1427984674', '1', null, null, 'false');

-- ----------------------------
-- Table structure for car_recommend_loaction
-- ----------------------------
DROP TABLE IF EXISTS `car_recommend_loaction`;
CREATE TABLE `car_recommend_loaction` (
  `location_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `dimension_id` mediumint(8) unsigned NOT NULL COMMENT 'RecommendDimension关联外键',
  `goods_id` bigint(20) unsigned NOT NULL COMMENT '商品编号',
  `title` varchar(200) DEFAULT NULL COMMENT '推荐促销语',
  `p_order` mediumint(5) unsigned NOT NULL DEFAULT '99' COMMENT '数字越大优先级越高',
  `start_time` int(11) unsigned NOT NULL COMMENT '设置生效开始时间',
  `end_time` int(11) unsigned NOT NULL COMMENT '设置生效结束时间',
  `status` enum('D','A') NOT NULL DEFAULT 'A' COMMENT '显示状态 A:表示有效,D:表示无效',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `creator` mediumint(5) unsigned NOT NULL COMMENT '创建人',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '编辑人',
  `updater` mediumint(5) unsigned DEFAULT NULL COMMENT '编辑人',
  `disabled` enum('false','true') NOT NULL DEFAULT 'false' COMMENT '是否失效',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_recommend_loaction
-- ----------------------------
INSERT INTO `car_recommend_loaction` VALUES ('1', '1', '10', '精选1', '1', '1427817600', '1430323200', 'A', '1427982224', '1', null, null, 'false');
INSERT INTO `car_recommend_loaction` VALUES ('2', '1', '9', '精选2', '2', '1427817600', '1430323200', 'A', '1427982370', '1', null, null, 'false');
INSERT INTO `car_recommend_loaction` VALUES ('3', '1', '5', '精选3', '3', '1427817600', '1430323200', 'A', '1427982396', '1', null, null, 'false');
INSERT INTO `car_recommend_loaction` VALUES ('4', '2', '4', '热卖1', '1', '1427817600', '1430323200', 'A', '1427984236', '1', null, null, 'false');
INSERT INTO `car_recommend_loaction` VALUES ('5', '2', '8', '热卖2', '2', '1427817600', '1430323200', 'A', '1427984258', '1', null, null, 'false');
INSERT INTO `car_recommend_loaction` VALUES ('6', '3', '10', '促销1', '1', '1427817600', '1430323200', 'A', '1427984698', '1', null, null, 'false');
INSERT INTO `car_recommend_loaction` VALUES ('7', '3', '9', '促销2', '2', '1427817600', '1430323200', 'A', '1427984721', '1', null, null, 'false');
INSERT INTO `car_recommend_loaction` VALUES ('8', '3', '5', '促销3', '3', '1427817600', '1430323200', 'A', '1427984747', '1', null, null, 'false');
INSERT INTO `car_recommend_loaction` VALUES ('9', '1', '7', '阿飞飞', '99', '1428508800', '1429200000', 'A', '1428911712', '1', null, null, 'false');
