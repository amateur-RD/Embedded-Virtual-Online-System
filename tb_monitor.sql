/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : embed

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-05-17 16:10:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_monitor
-- ----------------------------
DROP TABLE IF EXISTS `tb_monitor`;
CREATE TABLE `tb_monitor` (
  `id` varchar(32) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_monitor
-- ----------------------------
INSERT INTO `tb_monitor` VALUES ('1111', '192.168.199.173', 'N');
INSERT INTO `tb_monitor` VALUES ('1112', '192.168.122.11', 'Y');
INSERT INTO `tb_monitor` VALUES ('1113', '192.168.199.111', 'Y');
