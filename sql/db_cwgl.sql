/*
Navicat MySQL Data Transfer

Source Server         : mysql_shsxt
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : db_cwgl

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-05-08 20:17:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
                           `userId` int(11) NOT NULL,
                           `userName` varchar(50) DEFAULT NULL,
                           `userPw` varchar(50) DEFAULT NULL,
                           PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');

-- ----------------------------
-- Table structure for t_bumen
-- ----------------------------
DROP TABLE IF EXISTS `t_bumen`;
CREATE TABLE `t_bumen` (
                           `id` int(4) NOT NULL AUTO_INCREMENT,
                           `mingcheng` varchar(50) DEFAULT NULL,
                           `renshu` varchar(50) DEFAULT NULL,
                           `xishu` varchar(50) DEFAULT NULL,
                           `del` varchar(50) DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bumen
-- ----------------------------
INSERT INTO `t_bumen` VALUES ('1', '采购部', '10', '1.2', 'no');
INSERT INTO `t_bumen` VALUES ('2', '技术部', '30', '2.3', 'no');
INSERT INTO `t_bumen` VALUES ('3', '财务部', '20', '1.1', 'no');
INSERT INTO `t_bumen` VALUES ('4', '行政部', '30', '1.5', 'no');


-- ----------------------------
-- Table structure for t_catelog
-- ----------------------------
DROP TABLE IF EXISTS `t_catelog`;
CREATE TABLE `t_catelog` (
                             `id` int(4) NOT NULL AUTO_INCREMENT,
                             `name` varchar(50) DEFAULT NULL,
                             `del` varchar(50) DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_catelog
-- ----------------------------
INSERT INTO `t_catelog` VALUES ('1', '生产经营', 'yes');
INSERT INTO `t_catelog` VALUES ('3', '融资收入', 'no');
INSERT INTO `t_catelog` VALUES ('4', '贷款', 'no');
INSERT INTO `t_catelog` VALUES ('11', '投资', 'no');

-- ----------------------------
-- Table structure for t_feiyong
-- ----------------------------
DROP TABLE IF EXISTS `t_feiyong`;
CREATE TABLE `t_feiyong` (
                             `id` int(4) NOT NULL AUTO_INCREMENT,
                             `mingcheng` varchar(50) DEFAULT NULL,
                             `shijian` varchar(50) DEFAULT NULL,
                             `feiyong` decimal(8,2) DEFAULT NULL,
                             `leixing` int(4) DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_feiyong
-- ----------------------------
INSERT INTO `t_feiyong` VALUES ('1', '货款', '2013-04-01', '5.00', '0');
INSERT INTO `t_feiyong` VALUES ('2', '租场地', '2015-05-04', '222.00', '1');
INSERT INTO `t_feiyong` VALUES ('3', '出租场地', '2015-05-05', '200.00', '0');
INSERT INTO `t_feiyong` VALUES ('5', '采购电脑', '2018-06-13', '10.00', '2');

-- ----------------------------
-- Table structure for t_gongzi
-- ----------------------------
DROP TABLE IF EXISTS `t_gongzi`;
CREATE TABLE `t_gongzi` (
                            `id` int(4) NOT NULL AUTO_INCREMENT,
                            `zhigong_id` int(4) DEFAULT NULL,
                            `jiben` decimal(8,2) DEFAULT NULL,
                            `gongling` decimal(8,2) DEFAULT NULL,
                            `zhiwu` decimal(8,2) DEFAULT NULL,
                            `butie` decimal(8,2) DEFAULT NULL,
                            `date` DATE,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gongzi
-- ----------------------------
INSERT INTO `t_gongzi` VALUES ('1', '1', '2000.00', '300.00', '150.00', '220.00','2010-02-01');
INSERT INTO `t_gongzi` VALUES ('2', '4', '3000.00', '200.00', '300.00', '100.00','2010-02-03');
INSERT INTO `t_gongzi` VALUES ('3', '2', '5000.00', '600.00', '500.00', '300.00','2010-02-05');

-- ----------------------------
-- Table structure for t_jingying
-- ----------------------------
DROP TABLE IF EXISTS `t_jingying`;
CREATE TABLE `t_jingying` (
                              `id` int(4) NOT NULL AUTO_INCREMENT,
                              `mingcheng` varchar(50) DEFAULT NULL,
                              `riqi` varchar(50) DEFAULT NULL,
                              `touru` decimal(8,2) DEFAULT NULL,
                              `shouyi` decimal(8,2) DEFAULT NULL,
                              `lirun` decimal(8,2) DEFAULT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jingying
-- ----------------------------
INSERT INTO `t_jingying` VALUES ('1', '项目A', '2013-03-01', '100.00', '95.00', '-5.00');
INSERT INTO `t_jingying` VALUES ('2', 'a', '2015-05-05', '50.00', '100.00', '50.00');
INSERT INTO `t_jingying` VALUES ('3', 'b', '2015-05-04', '200.00', '100.00', '-100.00');
INSERT INTO `t_jingying` VALUES ('4', '出租', '2015-05-06', '200.00', '100.00', '-100.00');
INSERT INTO `t_jingying` VALUES ('5', '共享单车', '2018-05-07', '100.00', '200.00', '100.00');
INSERT INTO `t_jingying` VALUES ('6', '外卖', '2018-05-12', '100.00', '50.00', '-50.00');

-- ----------------------------
-- Table structure for t_zhigong
-- ----------------------------
DROP TABLE IF EXISTS `t_zhigong`;
CREATE TABLE `t_zhigong` (
                             `id` int(4) NOT NULL AUTO_INCREMENT,
                             `bumen_id` int(4) DEFAULT NULL,
                             `bianhao` varchar(50) DEFAULT NULL,
                             `loginpw` varchar(50) DEFAULT NULL,
                             `xingming` varchar(50) DEFAULT NULL,
                             `xingbie` varchar(50) DEFAULT NULL,
                             `ruzhi` varchar(50) DEFAULT NULL,
                             `del` varchar(50) DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_zhigong
-- ----------------------------
INSERT INTO `t_zhigong` VALUES ('1', '1', '201301', 'a', '赵明', '男', '2008-04-01', 'no');
INSERT INTO `t_zhigong` VALUES ('2', '1', '201302', 'a', '刘红', '男', '2013-04-01', 'no');
INSERT INTO `t_zhigong` VALUES ('3', '2', '030024', '030024', '张三', '男', '2015-04-18', 'yes');
INSERT INTO `t_zhigong` VALUES ('4', '1', '303333', '5555', 'zhangsan', '男', '2015-05-12', 'no');
INSERT INTO `t_zhigong` VALUES ('5', '1', '201100211', 'a', '张三', '男', '2015-05-06', 'no');
INSERT INTO `t_zhigong` VALUES ('6', '1', '123', '123', 'lisi', '男', '2018-05-07', 'no');

-- ----------------------------
-- Table structure for t_zichan
-- ----------------------------
DROP TABLE IF EXISTS `t_zichan`;
CREATE TABLE `t_zichan` (
                            `id` int(4) NOT NULL AUTO_INCREMENT,
                            `catelog_id` int(4) DEFAULT NULL,
                            `bianhao` varchar(50) DEFAULT NULL,
                            `mingcheng` varchar(50) DEFAULT NULL,
                            `shijian` varchar(50) DEFAULT NULL,
                            `jiazhi` varchar(50) DEFAULT NULL,
                            `type` int(4) DEFAULT NULL,
                            `fangshi` int(4) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_zichan
-- ----------------------------
INSERT INTO `t_zichan` VALUES ('1', '1', 'bh', 'mc', '2013-04-01', '2', '0', '2');
INSERT INTO `t_zichan` VALUES ('2', '3', '20150426', '工具出租', '2015-03-11', '1', '0', '2');
INSERT INTO `t_zichan` VALUES ('3', '4', '01111', '融资收入', '2015-05-05', '200', '0', '2');
INSERT INTO `t_zichan` VALUES ('4', '3', '01111', '111', '2015-05-04', '1000', '1', '2');
INSERT INTO `t_zichan` VALUES ('5', '3', '出租', '出租', '2015-05-04', '2', '-1', '-1');
INSERT INTO `t_zichan` VALUES ('12', '11', '234', '阿里巴巴', '2018-05-09', '100', '1', '1');

-- ----------------------------
-- Table structure for t_caiwu
-- ----------------------------
DROP TABLE IF EXISTS `t_caiwu`;
CREATE TABLE `t_caiwu` (
                           `id` int(4) NOT NULL AUTO_INCREMENT,
                           `bumen_id` int(4) DEFAULT NULL,
                           `bianhao` varchar(50) DEFAULT NULL,
                           `loginpw` varchar(50) DEFAULT NULL,
                           `xingming` varchar(50) DEFAULT NULL,
                           `xingbie` varchar(50) DEFAULT NULL,
                           `ruzhi` varchar(50) DEFAULT NULL,
                           `del` varchar(50) DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_zhigong
-- ----------------------------
INSERT INTO `t_caiwu` VALUES ('1', '3', '20030130', 'wyb', '王五', '男', '2018-5-20', 'no');


CREATE TABLE `t_baoxiao` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                             `bumen` varchar(255) NOT NULL,
                             `date` datetime NOT NULL,
                             `bxmingcheng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                             `money` double NOT NULL,
                             `cause` varchar(255) NOT NULL,
                             `del` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t_jiezhi` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) NOT NULL,
                            `bumen` varchar(255) NOT NULL,
                            `date` datetime NOT NULL,
                            `jzmingcheng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `money` double NOT NULL,
                            `cause` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `remoney` double NOT NULL,
                            `redate` datetime NOT NULL,
                            `remethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `del` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
