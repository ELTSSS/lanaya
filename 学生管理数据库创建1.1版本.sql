/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : student_informationa1

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 13/04/2019 18:24:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 学生信息总表
-- ----------------------------
DROP TABLE IF EXISTS `学生信息总表`;
CREATE TABLE `学生信息总表`  (
  `学生证号码` int(10) NOT NULL COMMENT '学生总表',
  `姓名` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `性别` enum('男','女','中性') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `院系` enum('电子科学与工程学院','文学院','历史学院','地球科学与工程学院') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `专业` enum('考古文物系0001','世界历史系0002','中国历史系0003','文学系0004','语言学系0005','文献学系0006','戏剧影视艺术系0007','地球科学系0008','水科学系0009','地质工程与信息技术系0010','电子工程系0011','微电子与光电子学系0012','信息电子学系0013') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '世界历史系0002',
  INDEX `学生证号码索引`(`学生证号码`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 学生信息总表
-- ----------------------------
INSERT INTO `学生信息总表` VALUES (1403101120, '张三', '男', '历史学院', '考古文物系0001');
INSERT INTO `学生信息总表` VALUES (1403101121, '李四', '女', '历史学院', '世界历史系0002');
INSERT INTO `学生信息总表` VALUES (1403101122, '王麻子', '男', '电子科学与工程学院', '世界历史系0002');
INSERT INTO `学生信息总表` VALUES (1403101123, '小团团', '女', '文学院', '文学系0004');
INSERT INTO `学生信息总表` VALUES (1403101124, '卢本伟', '男', '文学院', '语言学系0005');
INSERT INTO `学生信息总表` VALUES (1403101125, '司马怡', '女', '文学院', '文献学系0006');
INSERT INTO `学生信息总表` VALUES (1403101126, '批弟弟', '男', '文学院', '戏剧影视艺术系0007');
INSERT INTO `学生信息总表` VALUES (1403101127, '赵留言', '中性', '文学院', '戏剧影视艺术系0007');
INSERT INTO `学生信息总表` VALUES (1403101128, '系运费', '女', '地球科学与工程学院', '地球科学系0008');
INSERT INTO `学生信息总表` VALUES (1403101129, '小苍蝇', '男', '电子科学与工程学院', '世界历史系0002');
INSERT INTO `学生信息总表` VALUES (1403101130, '大苍蝇', '女', '地球科学与工程学院', '地质工程与信息技术系0010');
INSERT INTO `学生信息总表` VALUES (1403101131, '中苍蝇', '男', '电子科学与工程学院', '电子工程系0011');
INSERT INTO `学生信息总表` VALUES (1403101132, '一条狗', '男', '电子科学与工程学院', '微电子与光电子学系0012');
INSERT INTO `学生信息总表` VALUES (1403101133, '另一条狗', '女', '电子科学与工程学院', '信息电子学系0013');
INSERT INTO `学生信息总表` VALUES (1403101134, '绿苍蝇', '女', '地球科学与工程学院', '地质工程与信息技术系0010');
INSERT INTO `学生信息总表` VALUES (1403101134, '绿苍蝇', '女', '地球科学与工程学院', '地质工程与信息技术系0010');
INSERT INTO `学生信息总表` VALUES (1403101134, '绿苍蝇', '女', '地球科学与工程学院', '地质工程与信息技术系0010');

-- ----------------------------
-- Table structure for 学生登陆密码表
-- ----------------------------
DROP TABLE IF EXISTS `学生登陆密码表`;
CREATE TABLE `学生登陆密码表`  (
  `学生证号码` int(10) NULL DEFAULT NULL,
  `密码` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 学生登陆密码表
-- ----------------------------
INSERT INTO `学生登陆密码表` VALUES (1403101121, '1403101121');
INSERT INTO `学生登陆密码表` VALUES (1403101122, '1403101122');
INSERT INTO `学生登陆密码表` VALUES (1403101123, '1403101123');
INSERT INTO `学生登陆密码表` VALUES (1403101124, '1403101124');
INSERT INTO `学生登陆密码表` VALUES (1403101125, '1403101125');
INSERT INTO `学生登陆密码表` VALUES (1403101126, '1403101126');
INSERT INTO `学生登陆密码表` VALUES (1403101127, '1403101127');
INSERT INTO `学生登陆密码表` VALUES (1403101128, '1403101128');
INSERT INTO `学生登陆密码表` VALUES (1403101129, '1403101129');
INSERT INTO `学生登陆密码表` VALUES (1403101130, '1403101130');
INSERT INTO `学生登陆密码表` VALUES (1403101131, '1403101131');
INSERT INTO `学生登陆密码表` VALUES (1403101132, '1403101132');
INSERT INTO `学生登陆密码表` VALUES (1403101133, '1403101133');

-- ----------------------------
-- Table structure for 成绩表
-- ----------------------------
DROP TABLE IF EXISTS `成绩表`;
CREATE TABLE `成绩表`  (
  `学生证号码` int(10) NOT NULL,
  `姓名` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `语文` tinyint(2) NOT NULL,
  `数学` tinyint(2) NOT NULL,
  `英语` tinyint(2) NOT NULL,
  `历史` tinyint(2) NOT NULL,
  `生物` tinyint(2) NOT NULL,
  `化学` tinyint(2) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 成绩表
-- ----------------------------
INSERT INTO `成绩表` VALUES (1403101121, '李四', 1, 2, 2, 2, 2, 2);
INSERT INTO `成绩表` VALUES (1403101122, '王麻子', 111, 111, 111, 111, 111, 111);
INSERT INTO `成绩表` VALUES (1403101123, '小团团', 23, 54, 54, 55, 55, 100);
INSERT INTO `成绩表` VALUES (1403101124, '卢本伟', 4, 4, 4, 4, 4, 4);
INSERT INTO `成绩表` VALUES (1403101125, '司马怡', 5, 5, 15, 56, 55, 11);
INSERT INTO `成绩表` VALUES (1403101126, '批弟弟', 6, 40, 62, 77, 88, 65);
INSERT INTO `成绩表` VALUES (1403101127, '赵留言', 100, 55, 52, 87, 85, 120);
INSERT INTO `成绩表` VALUES (1403101128, '系运费', 6, 37, 45, 10, 2, 4);
INSERT INTO `成绩表` VALUES (1403101129, '小苍蝇', 50, 50, 50, 50, 50, 50);
INSERT INTO `成绩表` VALUES (1403101130, '大苍蝇', 66, 66, 66, 6, 66, 66);
INSERT INTO `成绩表` VALUES (1403101131, '中苍蝇', 77, 77, 77, 77, 77, 77);
INSERT INTO `成绩表` VALUES (1403101132, '一条狗', 85, 88, 88, 88, 88, 88);
INSERT INTO `成绩表` VALUES (1403101133, '另一条狗', 22, 22, 22, 22, 22, 22);

-- ----------------------------
-- Table structure for 管理员登陆密码表
-- ----------------------------
DROP TABLE IF EXISTS `管理员登陆密码表`;
CREATE TABLE `管理员登陆密码表`  (
  `教师账号` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `教师密码` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管理员登陆密码表
-- ----------------------------
INSERT INTO `管理员登陆密码表` VALUES ('1403100011', '1403100011');
INSERT INTO `管理员登陆密码表` VALUES ('1403100012', '1403100012');
INSERT INTO `管理员登陆密码表` VALUES ('1403100013', '1403100013');
INSERT INTO `管理员登陆密码表` VALUES ('1403100014', '1403100014');
INSERT INTO `管理员登陆密码表` VALUES ('1403100015', '1403100015');
INSERT INTO `管理员登陆密码表` VALUES ('1403100016', '1403100016');

-- ----------------------------
-- Table structure for 管理员表
-- ----------------------------
DROP TABLE IF EXISTS `管理员表`;
CREATE TABLE `管理员表`  (
  `证件编号` int(10) NOT NULL,
  `姓名` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `院系` enum('电子科学与工程学院','文学院','历史学院','地球科学与工程学院') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `职称` enum('辅导员','助理教授','副教授','正教授','院长','root') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `权限等级` enum('一级权限','两级权限','终极权限') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管理员表
-- ----------------------------
INSERT INTO `管理员表` VALUES (1000000000, '大神', '电子科学与工程学院', 'root', '终极权限');
INSERT INTO `管理员表` VALUES (1403100011, '狗管理', '文学院', '辅导员', '一级权限');
INSERT INTO `管理员表` VALUES (1403100012, '猪妖', '历史学院', '助理教授', '一级权限');
INSERT INTO `管理员表` VALUES (1403100013, '吃人', '历史学院', '副教授', '两级权限');
INSERT INTO `管理员表` VALUES (1403100014, '小白脸', '文学院', '正教授', '两级权限');
INSERT INTO `管理员表` VALUES (1403100015, '预言家', '文学院', '院长', '终极权限');
INSERT INTO `管理员表` VALUES (1403100016, '狼人', '历史学院', '院长', '两级权限');

SET FOREIGN_KEY_CHECKS = 1;
