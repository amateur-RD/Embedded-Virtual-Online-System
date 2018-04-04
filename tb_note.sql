/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : embed

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-06-02 19:10:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_note
-- ----------------------------
DROP TABLE IF EXISTS `tb_note`;
CREATE TABLE `tb_note` (
  `id` varchar(32) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `userid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_note
-- ----------------------------
INSERT INTO `tb_note` VALUES ('4028b8815c1028d5015c102a76e10001', '苏护    我去二群我去 我去二群 去玩儿翁请问千万人 我去去   人情味 ', '2017-06-02 19:02:33', '4028b8815bed30b3015bed30e8450000');
INSERT INTO `tb_note` VALUES ('4028b8815c1028d5015c102a90d90002', '苏护发素加上吊死发送到设计费哈萨我去二群无若无群若我去 克减肥还是卡防水防汗卡萨丁 去玩儿去玩儿去玩儿去玩儿请问请问阿三  我去二翁人情味无群', '2017-06-02 19:02:28', '4028b8815bed30b3015bed30e8450000');
INSERT INTO `tb_note` VALUES ('4028b8815c105f1b015c10666b970000', '阿斯蒂芬阿斯顿发送到是啊实打实的啊实打实', '2017-06-02 19:02:29', '4028b8815bed30b3015bed30e8450000');
INSERT INTO `tb_note` VALUES ('4028b8815c113af6015c114994f70000', '啊实打实大苏打啊实打实士大夫胜多负少啊实打实大', '2017-06-02 19:01:51', '4028b8815bed30b3015bed4451fe0001');
INSERT INTO `tb_note` VALUES ('4028b8815c11b18b015c11b3c1630000', '请问人情味人情味', '2017-05-16 22:40:12', '4028b8815bed30b3015bed4451fe0001');
INSERT INTO `tb_note` VALUES ('4028b8815c140250015c14233e870000', '特别要', '2017-05-17 10:01:13', '4028b8815bed30b3015bed4451fe0001');
