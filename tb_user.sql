/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : embed

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-05-16 19:13:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` varchar(32) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('4028b8815bed2a91015bed2abd190000', 'qwewq', '222', '2017-05-09 20:24:13');
INSERT INTO `tb_user` VALUES ('4028b8815bed30b3015bed30e8450000', 'user1', '111', '2017-05-09 20:30:57');
INSERT INTO `tb_user` VALUES ('4028b8815bed30b3015bed4451fe0001', 'admin', 'admin', '2017-05-14 01:48:32');
