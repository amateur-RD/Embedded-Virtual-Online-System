/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : embed

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-05-31 16:16:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_demoboard
-- ----------------------------
DROP TABLE IF EXISTS `tb_demoboard`;
CREATE TABLE `tb_demoboard` (
  `id` varchar(32) NOT NULL,
  `devid` int(11) DEFAULT NULL,
  `bt0` int(11) DEFAULT NULL,
  `bt1` int(11) DEFAULT NULL,
  `bt2` int(11) DEFAULT NULL,
  `bt3` int(11) DEFAULT NULL,
  `bt4` int(11) DEFAULT NULL,
  `bt5` int(11) DEFAULT NULL,
  `bt6` int(11) DEFAULT NULL,
  `bt7` int(11) DEFAULT NULL,
  `bt8` int(11) DEFAULT NULL,
  `bt9` int(11) DEFAULT NULL,
  `bt10` int(11) DEFAULT NULL,
  `bt11` int(11) DEFAULT NULL,
  `bt12` int(11) DEFAULT NULL,
  `bt13` int(11) DEFAULT NULL,
  `bt14` int(11) DEFAULT NULL,
  `bt15` int(11) DEFAULT NULL,
  `flag` varchar(1) DEFAULT NULL,
  `monitorip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_demoboard
-- ----------------------------
INSERT INTO `tb_demoboard` VALUES ('1111', '1001', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', 'N', null);
INSERT INTO `tb_demoboard` VALUES ('1112', '1002', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', 'Y', null);
