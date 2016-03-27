/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : yiishop

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-02-23 16:47:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `car_b2c_goods`
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
  `totalcnf` int(11) DEFAULT NULL COMMENT '0 拍下减库存 1 付款减库存 2 永久不减',
  `issendfree` int(11) DEFAULT NULL COMMENT '是否免运费商品',
  `istime` int(1) DEFAULT '0' COMMENT '限时促销',
  `timestart` int(11) DEFAULT NULL COMMENT '促销开始时间',
  `timeend` int(11) DEFAULT NULL COMMENT '促销结束时间',
  `credit` int(11) DEFAULT NULL,
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
INSERT INTO `car_b2c_goods` VALUES ('1', '20150402001', '德国进口牛奶 欧德堡全脂牛奶1L装', null, '9', '1', null, '25.000', '15.000', '28.000', '14.000', '瓶', 'normal', '61af9737273eec0a61966903ddf42333', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/1.jpg\" width=\"749\" height=\"458\" alt=\"\" />&nbsp;\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/3.jpg\" width=\"749\" height=\"382\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/2.jpg\" width=\"749\" height=\"498\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/4.jpg\" width=\"749\" height=\"439\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/6.jpg\" width=\"749\" height=\"549\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://baidixiaoshi88.no29.cuttle.com.cn/images/upload/Image/oudebao/5.jpg\" width=\"749\" height=\"477\" alt=\"\" />\r\n</p>', null, 'false', 'false', null, null, 'true', '30', null, '1427956720', 'false', '1', '0', '0', null, null, null);
INSERT INTO `car_b2c_goods` VALUES ('2', '20150402002', 'yum earth棒棒糖', null, '4', '38', '300', '15.000', '10.000', '25.000', '15.000', '瓶', 'normal', 'd99cc9f16e879ba093b38b7151cdfb2e', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '', null, 'false', null, null, null, 'true', '30', null, '1427956899', 'false', '0', '0', '0', null, null, null);
INSERT INTO `car_b2c_goods` VALUES ('3', '20150402003', '法国进口 皮埃尔虞埃 昂日地区半干型苹果酒750ml', null, '14', '1', '200', '129.000', '100.000', '140.000', '1350.000', '瓶', 'normal', '4a741c5ab9b43ab073d755918cf5c5ad', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/piaieryuaipingguojiu/1.jpg\" width=\"800\" height=\"800\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/piaieryuaipingguojiu/2.jpg\" width=\"750\" height=\"653\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/piaieryuaipingguojiu/3.jpg\" width=\"750\" height=\"125\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/piaieryuaipingguojiu/4.jpg\" width=\"750\" height=\"499\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/piaieryuaipingguojiu/5.jpg\" width=\"750\" height=\"502\" alt=\"\" />\r\n</p>', null, 'false', null, null, null, 'true', '30', null, '1427979015', 'false', '0', '0', '0', null, null, null);
INSERT INTO `car_b2c_goods` VALUES ('4', '20150402004', '法国进口 科瑞萨干型苹果酒750ml', null, '14', '1', '200', '109.000', '90.000', '120.000', '1350.000', '瓶', 'normal', 'e2c39579d7451f2b83fd594e63a0b15b', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/7.jpg\" width=\"800\" height=\"800\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/1.jpg\" width=\"750\" height=\"653\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/2.jpg\" width=\"750\" height=\"125\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/3.jpg\" width=\"800\" height=\"800\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/4.jpg\" width=\"750\" height=\"499\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/5.jpg\" width=\"750\" height=\"499\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.baidi77.com/images/upload/Image/keruisapingguojiu/6.jpg\" width=\"750\" height=\"499\" alt=\"\" />\r\n</p>', null, 'false', null, null, null, 'true', '30', null, '1427979153', 'false', '0', '0', '0', null, null, null);
INSERT INTO `car_b2c_goods` VALUES ('5', '20150402005', '牙买加进口 摩根船长朗姆酒 700ml', null, '14', '1', '200', '150.000', '120.000', '180.000', '1200.000', '瓶', 'normal', '783f94af1c031ac26e3d8836ba19e397', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<img alt=\"\" width=\"790\" height=\"2500\" src=\"http://www.baidi77.com/images/upload/Image/CAPTAIN%20MORGAN/100.jpg\" />', null, 'false', null, null, null, 'true', '30', null, '1427979308', 'false', '0', '0', '0', null, null, null);
INSERT INTO `car_b2c_goods` VALUES ('6', '20150402006', '土气和 绿色食品 五谷杂粮 莲子 280g', null, '16', '1', '1000', '20.000', '15.000', '25.000', '350.000', '袋', 'normal', '4e2711c1d6e2b3780e997587047926c6', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '', null, 'false', null, null, null, 'true', '30', null, '1427979414', 'false', '0', '0', '0', null, null, null);
INSERT INTO `car_b2c_goods` VALUES ('7', '20150402007看', '进口柠檬5粒装进口柠檬5粒装进口柠檬5粒装', null, '22', '1', '200', '16.900', '12.000', '20.000', '400.000', '个', 'normal', '9b86c5197e97ca3020f74e979ac39792', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img alt=\"\" src=\"http://www.baidi77.com/images/upload/Image/ningmeng/2(1).jpg\" style=\"width:969px;height:597px;\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img width=\"970\" height=\"633\" alt=\"\" src=\"http://www.baidi77.com/images/upload/Image/ningmeng/1(1).jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img alt=\"\" src=\"http://www.baidi77.com/images/upload/Image/ningmeng/4.jpg\" style=\"width:968px;height:608px;\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img alt=\"\" src=\"http://www.baidi77.com/images/upload/Image/ningmeng/8821914_195210692117_2.jpg\" style=\"width:931px;height:565px;\" /> \r\n</p>', null, 'false', 'false', null, null, 'true', '30', null, '1428906229', 'false', '0', '0', '0', null, null, null);
INSERT INTO `car_b2c_goods` VALUES ('8', '20150402008', '精品赣南橙子3粒装（单粒230g以上）', null, '22', '1', '200', '15.900', '20.000', '77878.000', '750.000', '克', 'normal', '3c4dbe88f59e9d6f3c8e049e63cb67fc', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<img alt=\"\" src=\"/images/20150412/2015041219571112536.png\" />', null, 'false', 'false', null, null, 'true', '30', null, '1429079377', 'false', '0', '0', '0', null, null, null);
INSERT INTO `car_b2c_goods` VALUES ('9', '20150402009', '新西兰进口猕猴桃30/33/36（单果80g以上）', null, '22', '5', '198', '147.000', '100.000', '180.000', '1500.000', '克', 'normal', '6e3f795c9a8edb93dc6ce383697f57b2', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img alt=\"\" width=\"772\" height=\"600\" src=\"http://www.baidi77.com/images/upload/Image/mihoutao/1.jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<img alt=\"\" width=\"600\" height=\"829\" src=\"http://www.baidi77.com/images/upload/Image/mihoutao/4.jpg\" /> \r\n</p>', null, 'false', 'false', null, null, 'true', '30', null, '1429069492', 'false', '0', '0', '0', null, null, null);
INSERT INTO `car_b2c_goods` VALUES ('10', '2015040201d0', '德国进口食品 劳仑兹薯片 清新咸味', '2', '18', null, '197', '16.600', '10.000', '18.000', '150.000', '袋', 'normal', 'ccaa2e67fe4c9dd2903424ca35018605', '测试：小黄蘑丁颜色鲜黄，外形小巧，散落于松林内，非常不好采摘。但营养价值极高，味道鲜美，是非常好的山珍美味和滋补食品。', '<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:Verdana, Arial, Helvetica, sans-serif, 宋体;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>', null, 'true', 'true', null, null, 'true', '30', null, '1429081361', 'false', '1', '0', '0', null, null, null);
