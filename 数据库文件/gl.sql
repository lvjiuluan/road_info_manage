/*
 Navicat Premium Data Transfer

 Source Server         : lvjiulua
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : gl

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 24/02/2021 15:14:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xname`(`xname`) USING BTREE,
  INDEX `dname`(`dname`) USING BTREE,
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`xname`) REFERENCES `ren` (`xname`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`dname`) REFERENCES `list` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'TZ_0001', 'DL_0001', '长江一路', 'XC_0001', '张三', '长江一路长江一路T708路公交站', '公交站牌损坏', '无');
INSERT INTO `admin` VALUES (2, 'TZ_0002', 'DL_0003', '菜袁路', 'XC_0003', '王五', '交通街与菜袁路交叉口', '树池被损坏', '无');

-- ----------------------------
-- Table structure for dllx
-- ----------------------------
DROP TABLE IF EXISTS `dllx`;
CREATE TABLE `dllx`  (
  `dllx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dllx_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dllx
-- ----------------------------
INSERT INTO `dllx` VALUES ('主干路');
INSERT INTO `dllx` VALUES ('快速路');
INSERT INTO `dllx` VALUES ('支路');
INSERT INTO `dllx` VALUES ('次干路');

-- ----------------------------
-- Table structure for dq
-- ----------------------------
DROP TABLE IF EXISTS `dq`;
CREATE TABLE `dq`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iri` decimal(4, 2) NOT NULL,
  `bz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dname`(`dname`) USING BTREE,
  INDEX `xname`(`xname`) USING BTREE,
  CONSTRAINT `dq_ibfk_1` FOREIGN KEY (`dname`) REFERENCES `list` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dq_ibfk_2` FOREIGN KEY (`xname`) REFERENCES `ren` (`xname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dq
-- ----------------------------
INSERT INTO `dq` VALUES (1, 'PZD_0001', 'DL_0005', '澳渝大道', 'XC_0001', '张三', '2020-06-30', 0.75, '无');
INSERT INTO `dq` VALUES (3, 'PZD_0003', 'DL_0001', '长江一路', 'XC_0001', '张三', '2020-06-30', 0.40, '无');
INSERT INTO `dq` VALUES (4, 'PZD_0004', 'DL_0003', '菜袁路', 'XC_0003', '王五', '2020-06-30', 0.50, '无');
INSERT INTO `dq` VALUES (5, 'PZD_0005', 'DL_0006', '通江大道', 'XC_0002', '李四', '2020-06-29', 0.40, '无');
INSERT INTO `dq` VALUES (7, 'PZD_0006', 'DL_0001', '长江一路', 'XC_0001', '张三', '2020-07-06', 0.51, '无');
INSERT INTO `dq` VALUES (9, 'PZD_0007', 'DL_0003', '菜袁路', 'XC_0005', '刘华', '2020-07-07', 0.61, '无');

-- ----------------------------
-- Table structure for kfbz
-- ----------------------------
DROP TABLE IF EXISTS `kfbz`;
CREATE TABLE `kfbz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AUTO_INCREMENT',
  `lmlx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shfl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shlx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shmd` decimal(10, 2) NOT NULL,
  `kfz` int(11) NOT NULL,
  `jsff` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lmlx_name`(`lmlx_name`) USING BTREE,
  INDEX `shlx_name`(`shlx_name`) USING BTREE,
  CONSTRAINT `kfbz_ibfk_1` FOREIGN KEY (`lmlx_name`) REFERENCES `lmlx` (`lmlx_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kfbz_ibfk_2` FOREIGN KEY (`shlx_name`) REFERENCES `shlx` (`shlx_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 176 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kfbz
-- ----------------------------
INSERT INTO `kfbz` VALUES (1, '沥青路', '裂缝类', '线裂', 0.01, 3, 1);
INSERT INTO `kfbz` VALUES (2, '沥青路', '裂缝类', '线裂', 0.10, 5, 1);
INSERT INTO `kfbz` VALUES (3, '沥青路', '裂缝类', '线裂', 1.00, 8, 1);
INSERT INTO `kfbz` VALUES (4, '沥青路', '裂缝类', '线裂', 10.00, 16, 1);
INSERT INTO `kfbz` VALUES (5, '沥青路', '裂缝类', '线裂', 50.00, 38, 1);
INSERT INTO `kfbz` VALUES (6, '沥青路', '裂缝类', '线裂', 100.00, 48, 1);
INSERT INTO `kfbz` VALUES (7, '沥青路', '裂缝类', '网裂', 0.01, 5, 2);
INSERT INTO `kfbz` VALUES (8, '沥青路', '裂缝类', '网裂', 0.10, 8, 2);
INSERT INTO `kfbz` VALUES (9, '沥青路', '裂缝类', '网裂', 1.00, 10, 2);
INSERT INTO `kfbz` VALUES (10, '沥青路', '裂缝类', '网裂', 10.00, 20, 2);
INSERT INTO `kfbz` VALUES (11, '沥青路', '裂缝类', '网裂', 50.00, 45, 2);
INSERT INTO `kfbz` VALUES (12, '沥青路', '裂缝类', '网裂', 100.00, 70, 2);
INSERT INTO `kfbz` VALUES (13, '沥青路', '裂缝类', '龟裂', 0.01, 8, 3);
INSERT INTO `kfbz` VALUES (14, '沥青路', '裂缝类', '龟裂', 0.10, 10, 3);
INSERT INTO `kfbz` VALUES (15, '沥青路', '裂缝类', '龟裂', 1.00, 15, 3);
INSERT INTO `kfbz` VALUES (16, '沥青路', '裂缝类', '龟裂', 10.00, 30, 3);
INSERT INTO `kfbz` VALUES (17, '沥青路', '裂缝类', '龟裂', 50.00, 55, 3);
INSERT INTO `kfbz` VALUES (18, '沥青路', '裂缝类', '龟裂', 100.00, 80, 3);
INSERT INTO `kfbz` VALUES (19, '沥青路', '变形类', '拥包', 0.01, 3, 4);
INSERT INTO `kfbz` VALUES (20, '沥青路', '变形类', '拥包', 0.10, 10, 4);
INSERT INTO `kfbz` VALUES (21, '沥青路', '变形类', '拥包', 1.00, 15, 4);
INSERT INTO `kfbz` VALUES (22, '沥青路', '变形类', '拥包', 10.00, 30, 4);
INSERT INTO `kfbz` VALUES (23, '沥青路', '变形类', '拥包', 50.00, 52, 4);
INSERT INTO `kfbz` VALUES (24, '沥青路', '变形类', '拥包', 100.00, 65, 4);
INSERT INTO `kfbz` VALUES (25, '沥青路', '变形类', '车辙', 0.01, 2, 5);
INSERT INTO `kfbz` VALUES (26, '沥青路', '变形类', '车辙', 0.10, 7, 5);
INSERT INTO `kfbz` VALUES (27, '沥青路', '变形类', '车辙', 1.00, 12, 5);
INSERT INTO `kfbz` VALUES (28, '沥青路', '变形类', '车辙', 10.00, 25, 5);
INSERT INTO `kfbz` VALUES (29, '沥青路', '变形类', '车辙', 50.00, 45, 5);
INSERT INTO `kfbz` VALUES (30, '沥青路', '变形类', '车辙', 100.00, 55, 5);
INSERT INTO `kfbz` VALUES (31, '沥青路', '变形类', '沉陷', 0.01, 3, 6);
INSERT INTO `kfbz` VALUES (32, '沥青路', '变形类', '沉陷', 0.10, 5, 6);
INSERT INTO `kfbz` VALUES (33, '沥青路', '变形类', '沉陷', 1.00, 12, 6);
INSERT INTO `kfbz` VALUES (34, '沥青路', '变形类', '沉陷', 10.00, 25, 6);
INSERT INTO `kfbz` VALUES (35, '沥青路', '变形类', '沉陷', 50.00, 47, 6);
INSERT INTO `kfbz` VALUES (36, '沥青路', '变形类', '沉陷', 100.00, 63, 6);
INSERT INTO `kfbz` VALUES (37, '沥青路', '变形类', '翻浆', 0.01, 10, 7);
INSERT INTO `kfbz` VALUES (38, '沥青路', '变形类', '翻浆', 0.10, 15, 7);
INSERT INTO `kfbz` VALUES (39, '沥青路', '变形类', '翻浆', 1.00, 20, 7);
INSERT INTO `kfbz` VALUES (40, '沥青路', '变形类', '翻浆', 10.00, 40, 7);
INSERT INTO `kfbz` VALUES (41, '沥青路', '变形类', '翻浆', 50.00, 65, 7);
INSERT INTO `kfbz` VALUES (42, '沥青路', '变形类', '翻浆', 100.00, 80, 7);
INSERT INTO `kfbz` VALUES (43, '沥青路', '松散类', '剥落', 0.01, 2, 8);
INSERT INTO `kfbz` VALUES (44, '沥青路', '松散类', '剥落', 0.10, 5, 8);
INSERT INTO `kfbz` VALUES (45, '沥青路', '松散类', '剥落', 1.00, 8, 8);
INSERT INTO `kfbz` VALUES (46, '沥青路', '松散类', '剥落', 10.00, 15, 8);
INSERT INTO `kfbz` VALUES (47, '沥青路', '松散类', '剥落', 50.00, 35, 8);
INSERT INTO `kfbz` VALUES (48, '沥青路', '松散类', '剥落', 100.00, 45, 8);
INSERT INTO `kfbz` VALUES (49, '沥青路', '松散类', '坑槽', 0.01, 10, 9);
INSERT INTO `kfbz` VALUES (50, '沥青路', '松散类', '坑槽', 0.10, 15, 9);
INSERT INTO `kfbz` VALUES (51, '沥青路', '松散类', '坑槽', 1.00, 25, 9);
INSERT INTO `kfbz` VALUES (52, '沥青路', '松散类', '坑槽', 10.00, 40, 9);
INSERT INTO `kfbz` VALUES (53, '沥青路', '松散类', '坑槽', 50.00, 65, 9);
INSERT INTO `kfbz` VALUES (54, '沥青路', '松散类', '坑槽', 100.00, 72, 9);
INSERT INTO `kfbz` VALUES (55, '沥青路', '松散类', '啃边', 0.01, 2, 10);
INSERT INTO `kfbz` VALUES (56, '沥青路', '松散类', '啃边', 0.10, 4, 10);
INSERT INTO `kfbz` VALUES (57, '沥青路', '松散类', '啃边', 1.00, 8, 10);
INSERT INTO `kfbz` VALUES (58, '沥青路', '松散类', '啃边', 10.00, 15, 10);
INSERT INTO `kfbz` VALUES (59, '沥青路', '松散类', '啃边', 50.00, 30, 10);
INSERT INTO `kfbz` VALUES (60, '沥青路', '松散类', '啃边', 100.00, 40, 10);
INSERT INTO `kfbz` VALUES (61, '沥青路', '其他类', '路框差', 0.01, 3, 11);
INSERT INTO `kfbz` VALUES (62, '沥青路', '其他类', '路框差', 0.10, 8, 11);
INSERT INTO `kfbz` VALUES (63, '沥青路', '其他类', '路框差', 1.00, 12, 11);
INSERT INTO `kfbz` VALUES (64, '沥青路', '其他类', '路框差', 10.00, 12, 11);
INSERT INTO `kfbz` VALUES (65, '沥青路', '其他类', '路框差', 50.00, 12, 11);
INSERT INTO `kfbz` VALUES (66, '沥青路', '其他类', '路框差', 100.00, 12, 11);
INSERT INTO `kfbz` VALUES (67, '沥青路', '其他类', '唧浆', 0.01, 5, 12);
INSERT INTO `kfbz` VALUES (68, '沥青路', '其他类', '唧浆', 0.10, 10, 12);
INSERT INTO `kfbz` VALUES (69, '沥青路', '其他类', '唧浆', 1.00, 15, 12);
INSERT INTO `kfbz` VALUES (70, '沥青路', '其他类', '唧浆', 10.00, 25, 12);
INSERT INTO `kfbz` VALUES (71, '沥青路', '其他类', '唧浆', 50.00, 50, 12);
INSERT INTO `kfbz` VALUES (72, '沥青路', '其他类', '唧浆', 100.00, 80, 12);
INSERT INTO `kfbz` VALUES (73, '沥青路', '其他类', '泛油', 0.01, 2, 13);
INSERT INTO `kfbz` VALUES (74, '沥青路', '其他类', '泛油', 0.10, 4, 13);
INSERT INTO `kfbz` VALUES (75, '沥青路', '其他类', '泛油', 1.00, 8, 13);
INSERT INTO `kfbz` VALUES (76, '沥青路', '其他类', '泛油', 10.00, 20, 13);
INSERT INTO `kfbz` VALUES (77, '沥青路', '其他类', '泛油', 50.00, 40, 13);
INSERT INTO `kfbz` VALUES (78, '沥青路', '其他类', '泛油', 100.00, 70, 13);
INSERT INTO `kfbz` VALUES (79, '水泥路', '裂缝类', '板角撕裂', 0.02, 9, 14);
INSERT INTO `kfbz` VALUES (80, '水泥路', '裂缝类', '板角撕裂', 0.10, 10, 14);
INSERT INTO `kfbz` VALUES (81, '水泥路', '裂缝类', '板角撕裂', 0.20, 11, 14);
INSERT INTO `kfbz` VALUES (82, '水泥路', '裂缝类', '板角撕裂', 0.50, 12, 14);
INSERT INTO `kfbz` VALUES (83, '水泥路', '裂缝类', '板角撕裂', 0.60, 13, 14);
INSERT INTO `kfbz` VALUES (84, '水泥路', '裂缝类', '板角撕裂', 1.00, 25, 14);
INSERT INTO `kfbz` VALUES (85, '水泥路', '裂缝类', '板角撕裂', 3.00, 33, 14);
INSERT INTO `kfbz` VALUES (86, '水泥路', '裂缝类', '板角撕裂', 5.00, 44, 14);
INSERT INTO `kfbz` VALUES (87, '水泥路', '裂缝类', '板角撕裂', 7.00, 55, 14);
INSERT INTO `kfbz` VALUES (88, '水泥路', '裂缝类', '板角撕裂', 10.00, 56, 14);
INSERT INTO `kfbz` VALUES (89, '水泥路', '裂缝类', '板角撕裂', 20.00, 60, 14);
INSERT INTO `kfbz` VALUES (90, '水泥路', '裂缝类', '板角撕裂', 30.00, 70, 14);
INSERT INTO `kfbz` VALUES (91, '水泥路', '裂缝类', '板角撕裂', 50.00, 80, 14);
INSERT INTO `kfbz` VALUES (92, '水泥路', '裂缝类', '板角撕裂', 100.00, 90, 14);
INSERT INTO `kfbz` VALUES (93, '水泥路', '裂缝类', '边角裂缝', 0.02, 3, 15);
INSERT INTO `kfbz` VALUES (94, '水泥路', '裂缝类', '边角裂缝', 0.10, 4, 15);
INSERT INTO `kfbz` VALUES (95, '水泥路', '裂缝类', '边角裂缝', 0.20, 5, 15);
INSERT INTO `kfbz` VALUES (96, '水泥路', '裂缝类', '边角裂缝', 0.50, 6, 15);
INSERT INTO `kfbz` VALUES (97, '水泥路', '裂缝类', '边角裂缝', 0.60, 12, 15);
INSERT INTO `kfbz` VALUES (98, '水泥路', '裂缝类', '边角裂缝', 1.00, 12, 15);
INSERT INTO `kfbz` VALUES (99, '水泥路', '裂缝类', '边角裂缝', 3.00, 17, 15);
INSERT INTO `kfbz` VALUES (100, '水泥路', '裂缝类', '边角裂缝', 5.00, 23, 15);
INSERT INTO `kfbz` VALUES (101, '水泥路', '裂缝类', '边角裂缝', 7.00, 29, 15);
INSERT INTO `kfbz` VALUES (102, '水泥路', '裂缝类', '边角裂缝', 10.00, 32, 15);
INSERT INTO `kfbz` VALUES (103, '水泥路', '裂缝类', '边角裂缝', 20.00, 33, 15);
INSERT INTO `kfbz` VALUES (104, '水泥路', '裂缝类', '边角裂缝', 30.00, 44, 15);
INSERT INTO `kfbz` VALUES (105, '水泥路', '裂缝类', '边角裂缝', 50.00, 55, 15);
INSERT INTO `kfbz` VALUES (106, '水泥路', '裂缝类', '边角裂缝', 100.00, 60, 15);
INSERT INTO `kfbz` VALUES (107, '水泥路', '裂缝类', '交叉裂缝和破碎板', 0.02, 3, 16);
INSERT INTO `kfbz` VALUES (108, '水泥路', '裂缝类', '交叉裂缝和破碎板', 0.10, 4, 16);
INSERT INTO `kfbz` VALUES (109, '水泥路', '裂缝类', '交叉裂缝和破碎板', 0.20, 4, 16);
INSERT INTO `kfbz` VALUES (110, '水泥路', '裂缝类', '交叉裂缝和破碎板', 0.50, 4, 16);
INSERT INTO `kfbz` VALUES (111, '水泥路', '裂缝类', '交叉裂缝和破碎板', 0.60, 5, 16);
INSERT INTO `kfbz` VALUES (112, '水泥路', '裂缝类', '交叉裂缝和破碎板', 1.00, 8, 16);
INSERT INTO `kfbz` VALUES (113, '水泥路', '裂缝类', '交叉裂缝和破碎板', 3.00, 10, 16);
INSERT INTO `kfbz` VALUES (114, '水泥路', '裂缝类', '交叉裂缝和破碎板', 5.00, 17, 16);
INSERT INTO `kfbz` VALUES (115, '水泥路', '裂缝类', '交叉裂缝和破碎板', 7.00, 19, 16);
INSERT INTO `kfbz` VALUES (116, '水泥路', '裂缝类', '交叉裂缝和破碎板', 10.00, 27, 16);
INSERT INTO `kfbz` VALUES (117, '水泥路', '裂缝类', '交叉裂缝和破碎板', 20.00, 28, 16);
INSERT INTO `kfbz` VALUES (118, '水泥路', '裂缝类', '交叉裂缝和破碎板', 30.00, 55, 16);
INSERT INTO `kfbz` VALUES (119, '水泥路', '裂缝类', '交叉裂缝和破碎板', 50.00, 65, 16);
INSERT INTO `kfbz` VALUES (120, '水泥路', '裂缝类', '交叉裂缝和破碎板', 100.00, 75, 16);
INSERT INTO `kfbz` VALUES (121, '水泥路', '接缝破坏类', '接缝料损坏', 0.02, 1, 17);
INSERT INTO `kfbz` VALUES (122, '水泥路', '接缝破坏类', '接缝料损坏', 0.10, 1, 17);
INSERT INTO `kfbz` VALUES (123, '水泥路', '接缝破坏类', '接缝料损坏', 0.20, 2, 17);
INSERT INTO `kfbz` VALUES (124, '水泥路', '接缝破坏类', '接缝料损坏', 0.50, 3, 17);
INSERT INTO `kfbz` VALUES (125, '水泥路', '接缝破坏类', '接缝料损坏', 0.60, 3, 17);
INSERT INTO `kfbz` VALUES (126, '水泥路', '接缝破坏类', '接缝料损坏', 1.00, 3, 17);
INSERT INTO `kfbz` VALUES (127, '水泥路', '接缝破坏类', '接缝料损坏', 3.00, 4, 17);
INSERT INTO `kfbz` VALUES (128, '水泥路', '接缝破坏类', '接缝料损坏', 5.00, 5, 17);
INSERT INTO `kfbz` VALUES (129, '水泥路', '接缝破坏类', '接缝料损坏', 7.00, 7, 17);
INSERT INTO `kfbz` VALUES (130, '水泥路', '接缝破坏类', '接缝料损坏', 10.00, 7, 17);
INSERT INTO `kfbz` VALUES (131, '水泥路', '接缝破坏类', '接缝料损坏', 20.00, 10, 17);
INSERT INTO `kfbz` VALUES (132, '水泥路', '接缝破坏类', '接缝料损坏', 30.00, 15, 17);
INSERT INTO `kfbz` VALUES (133, '水泥路', '接缝破坏类', '接缝料损坏', 50.00, 20, 17);
INSERT INTO `kfbz` VALUES (134, '水泥路', '接缝破坏类', '接缝料损坏', 100.00, 35, 17);
INSERT INTO `kfbz` VALUES (135, '水泥路', '接缝破坏类', '边角剥落', 0.02, 1, 18);
INSERT INTO `kfbz` VALUES (136, '水泥路', '接缝破坏类', '边角剥落', 0.10, 2, 18);
INSERT INTO `kfbz` VALUES (137, '水泥路', '接缝破坏类', '边角剥落', 0.20, 3, 18);
INSERT INTO `kfbz` VALUES (138, '水泥路', '接缝破坏类', '边角剥落', 0.50, 4, 18);
INSERT INTO `kfbz` VALUES (139, '水泥路', '接缝破坏类', '边角剥落', 0.60, 7, 18);
INSERT INTO `kfbz` VALUES (140, '水泥路', '接缝破坏类', '边角剥落', 1.00, 11, 18);
INSERT INTO `kfbz` VALUES (141, '水泥路', '接缝破坏类', '边角剥落', 3.00, 15, 18);
INSERT INTO `kfbz` VALUES (142, '水泥路', '接缝破坏类', '边角剥落', 5.00, 21, 18);
INSERT INTO `kfbz` VALUES (143, '水泥路', '接缝破坏类', '边角剥落', 7.00, 27, 18);
INSERT INTO `kfbz` VALUES (144, '水泥路', '接缝破坏类', '边角剥落', 10.00, 34, 18);
INSERT INTO `kfbz` VALUES (145, '水泥路', '接缝破坏类', '边角剥落', 30.00, 40, 18);
INSERT INTO `kfbz` VALUES (146, '水泥路', '接缝破坏类', '边角剥落', 50.00, 60, 18);
INSERT INTO `kfbz` VALUES (147, '水泥路', '接缝破坏类', '边角剥落', 100.00, 70, 18);
INSERT INTO `kfbz` VALUES (148, '水泥路', '表面破坏类', '坑洞', 0.02, 9, 19);
INSERT INTO `kfbz` VALUES (149, '水泥路', '表面破坏类', '坑洞', 0.10, 19, 19);
INSERT INTO `kfbz` VALUES (150, '水泥路', '表面破坏类', '坑洞', 0.20, 30, 19);
INSERT INTO `kfbz` VALUES (151, '水泥路', '表面破坏类', '坑洞', 0.50, 40, 19);
INSERT INTO `kfbz` VALUES (152, '水泥路', '表面破坏类', '坑洞', 0.60, 60, 19);
INSERT INTO `kfbz` VALUES (153, '水泥路', '表面破坏类', '坑洞', 1.00, 70, 19);
INSERT INTO `kfbz` VALUES (154, '水泥路', '表面破坏类', '坑洞', 3.00, 75, 19);
INSERT INTO `kfbz` VALUES (155, '水泥路', '表面破坏类', '坑洞', 5.00, 76, 19);
INSERT INTO `kfbz` VALUES (156, '水泥路', '表面破坏类', '坑洞', 7.00, 76, 19);
INSERT INTO `kfbz` VALUES (157, '水泥路', '表面破坏类', '坑洞', 10.00, 80, 19);
INSERT INTO `kfbz` VALUES (158, '水泥路', '表面破坏类', '坑洞', 20.00, 85, 19);
INSERT INTO `kfbz` VALUES (159, '水泥路', '表面破坏类', '坑洞', 30.00, 86, 19);
INSERT INTO `kfbz` VALUES (160, '水泥路', '表面破坏类', '坑洞', 50.00, 87, 19);
INSERT INTO `kfbz` VALUES (161, '水泥路', '表面破坏类', '坑洞', 100.00, 90, 19);
INSERT INTO `kfbz` VALUES (162, '水泥路', '表面破坏类', '表面裂纹', 0.02, 2, 20);
INSERT INTO `kfbz` VALUES (163, '水泥路', '表面破坏类', '表面裂纹', 0.10, 3, 20);
INSERT INTO `kfbz` VALUES (164, '水泥路', '表面破坏类', '表面裂纹', 0.20, 4, 20);
INSERT INTO `kfbz` VALUES (165, '水泥路', '表面破坏类', '表面裂纹', 0.50, 5, 20);
INSERT INTO `kfbz` VALUES (166, '水泥路', '表面破坏类', '表面裂纹', 0.60, 7, 20);
INSERT INTO `kfbz` VALUES (167, '水泥路', '表面破坏类', '表面裂纹', 1.00, 8, 20);
INSERT INTO `kfbz` VALUES (168, '水泥路', '表面破坏类', '表面裂纹', 3.00, 9, 20);
INSERT INTO `kfbz` VALUES (169, '水泥路', '表面破坏类', '表面裂纹', 5.00, 10, 20);
INSERT INTO `kfbz` VALUES (170, '水泥路', '表面破坏类', '表面裂纹', 7.00, 15, 20);
INSERT INTO `kfbz` VALUES (171, '水泥路', '表面破坏类', '表面裂纹', 10.00, 16, 20);
INSERT INTO `kfbz` VALUES (172, '水泥路', '表面破坏类', '表面裂纹', 20.00, 19, 20);
INSERT INTO `kfbz` VALUES (173, '水泥路', '表面破坏类', '表面裂纹', 30.00, 25, 20);
INSERT INTO `kfbz` VALUES (174, '水泥路', '表面破坏类', '表面裂纹', 50.00, 33, 20);
INSERT INTO `kfbz` VALUES (175, '水泥路', '表面破坏类', '表面裂纹', 100.00, 42, 20);

-- ----------------------------
-- Table structure for list
-- ----------------------------
DROP TABLE IF EXISTS `list`;
CREATE TABLE `list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lmlx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bsite` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dllx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sjdw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ssxz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `length` decimal(4, 2) NOT NULL,
  `speed` float NOT NULL,
  `ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `yhdj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pqi_dj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `name`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `name_2`(`name`) USING BTREE,
  INDEX `FK_lmlx_list`(`lmlx_name`) USING BTREE,
  INDEX `dllx_name`(`dllx_name`) USING BTREE,
  CONSTRAINT `FK_lmlx_list` FOREIGN KEY (`lmlx_name`) REFERENCES `lmlx` (`lmlx_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `list_ibfk_1` FOREIGN KEY (`dllx_name`) REFERENCES `dllx` (`dllx_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list
-- ----------------------------
INSERT INTO `list` VALUES (1, '长江一路', '沥青路', '两路口', '爱华龙都大厦', '快速路', '重庆市同信公路勘察设计有限公司', '渝中区', 25.40, 60, 'DL_0001', 'I级', 'B');
INSERT INTO `list` VALUES (3, '菜袁路', '沥青路', '重庆站', '重医一院', '支路', '重庆市路苑公路服务有限公司', '渝中区', 12.40, 80, 'DL_0003', 'I级', 'A');
INSERT INTO `list` VALUES (5, '澳渝大道', '沥青路', '东方家园B区', '富悦阳光', '主干路', '重庆高速公路路网管理有限公司', '江北区', 23.40, 80, 'DL_0005', 'I级', 'A');
INSERT INTO `list` VALUES (6, '通江大道', '水泥路', '滩子口', '汤家湾', '次干路', '重庆通联路桥建设有限公司', '南岸区', 56.30, 40, 'DL_0006', 'II级', 'A');

-- ----------------------------
-- Table structure for lm
-- ----------------------------
DROP TABLE IF EXISTS `lm`;
CREATE TABLE `lm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chang` decimal(10, 2) NOT NULL,
  `kuan` decimal(10, 2) NOT NULL,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xchang` decimal(10, 2) NOT NULL,
  `xkuan` decimal(10, 2) NOT NULL,
  `xgao` decimal(10, 2) NOT NULL,
  `mian` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `class`(`class`) USING BTREE,
  INDEX `dname`(`dname`) USING BTREE,
  INDEX `xname`(`xname`) USING BTREE,
  CONSTRAINT `lm_ibfk_1` FOREIGN KEY (`class`) REFERENCES `shlx` (`shlx_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lm_ibfk_2` FOREIGN KEY (`dname`) REFERENCES `list` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lm_ibfk_3` FOREIGN KEY (`xname`) REFERENCES `ren` (`xname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lm
-- ----------------------------
INSERT INTO `lm` VALUES (12, 'SHJL_0007', 'DL_0001', '长江一路', 'XC_0005', '刘华', 600.00, 3.00, '拥包', 2.20, 0.90, 0.40, 2.34);
INSERT INTO `lm` VALUES (13, 'SHJL_0008', 'DL_0003', '菜袁路', 'XC_0005', '刘华', 700.00, 4.00, '剥落', 2.00, 0.80, 0.50, 2.00);
INSERT INTO `lm` VALUES (14, 'SHJL_0009', 'DL_0003', '菜袁路', 'XC_0004', '李婷', 600.00, 5.00, '网裂', 4.00, 1.50, 0.10, 6.15);
INSERT INTO `lm` VALUES (15, 'SHJL_0010', 'DL_0001', '长江一路', 'XC_0001', '张三', 590.00, 3.20, '车辙', 5.00, 1.80, 0.90, 10.62);

-- ----------------------------
-- Table structure for lmlx
-- ----------------------------
DROP TABLE IF EXISTS `lmlx`;
CREATE TABLE `lmlx`  (
  `lmlx_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`lmlx_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lmlx
-- ----------------------------
INSERT INTO `lmlx` VALUES ('水泥路');
INSERT INTO `lmlx` VALUES ('沥青路');

-- ----------------------------
-- Table structure for pbzt
-- ----------------------------
DROP TABLE IF EXISTS `pbzt`;
CREATE TABLE `pbzt`  (
  `pbzt_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pbzt_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pbzt
-- ----------------------------
INSERT INTO `pbzt` VALUES ('IRI测量');
INSERT INTO `pbzt` VALUES ('外观检查');
INSERT INTO `pbzt` VALUES ('结构变化');
INSERT INTO `pbzt` VALUES ('路面损坏情况');
INSERT INTO `pbzt` VALUES ('道路施工作业情况');
INSERT INTO `pbzt` VALUES ('附属设施状况');

-- ----------------------------
-- Table structure for pg
-- ----------------------------
DROP TABLE IF EXISTS `pg`;
CREATE TABLE `pg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dllx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rq` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `pqi` decimal(4, 2) NOT NULL,
  `pqi_dj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rqi_iri` decimal(4, 2) NOT NULL,
  `rqi_dj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pci` decimal(4, 2) NOT NULL,
  `pci_dj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dllx_name`(`dllx_name`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  CONSTRAINT `pg_ibfk_1` FOREIGN KEY (`dllx_name`) REFERENCES `dllx` (`dllx_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pg_ibfk_2` FOREIGN KEY (`name`) REFERENCES `list` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pg
-- ----------------------------
INSERT INTO `pg` VALUES (20, 'PG_0004', 'DL_0003', '菜袁路', '支路', '2020-07-01 20:07:43', 84.92, 'A', 9.62, 'A', 68.00, 'B');
INSERT INTO `pg` VALUES (25, 'PG_0005', 'DL_0001', '长江一路', '快速路', '2020-07-01 20:18:49', 95.52, 'A', 12.10, 'A', 93.60, 'A');
INSERT INTO `pg` VALUES (26, 'PG_0006', 'DL_0005', '澳渝大道', '主干路', '2020-07-01 20:18:54', 94.20, 'A', 6.31, 'A', 93.60, 'A');
INSERT INTO `pg` VALUES (27, 'PG_0007', 'DL_0003', '菜袁路', '支路', '2020-07-02 20:34:45', 84.92, 'A', 9.62, 'A', 68.00, 'B');
INSERT INTO `pg` VALUES (29, 'PG_0009', 'DL_0005', '澳渝大道', '主干路', '2020-07-02 20:34:55', 94.20, 'A', 6.31, 'A', 93.60, 'A');
INSERT INTO `pg` VALUES (34, 'PG_0012', 'DL_0006', '通江大道', '次干路', '2020-07-03 01:44:59', 93.92, 'A', 12.10, 'A', 89.60, 'A');
INSERT INTO `pg` VALUES (37, 'PG_0013', 'DL_0001', '长江一路', '快速路', '2020-07-07 18:27:44', 85.56, 'B', 9.43, 'A', 69.60, 'C');
INSERT INTO `pg` VALUES (38, 'PG_0014', 'DL_0001', '长江一路', '快速路', '2020-07-07 19:19:13', 92.92, 'A', 9.43, 'A', 88.00, 'B');
INSERT INTO `pg` VALUES (39, 'PG_0015', 'DL_0003', '菜袁路', '支路', '2020-07-07 19:37:12', 95.64, 'A', 7.82, 'A', 96.00, 'A');
INSERT INTO `pg` VALUES (40, 'PG_0016', 'DL_0001', '长江一路', '快速路', '2020-07-07 19:42:39', 89.08, 'B', 9.43, 'A', 78.40, 'B');
INSERT INTO `pg` VALUES (41, 'PG_0017', 'DL_0003', '菜袁路', '支路', '2020-07-07 19:43:30', 92.44, 'A', 7.82, 'A', 88.00, 'A');

-- ----------------------------
-- Table structure for ren
-- ----------------------------
DROP TABLE IF EXISTS `ren`;
CREATE TABLE `ren`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xsex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`, `xname`) USING BTREE,
  UNIQUE INDEX `xname`(`xname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ren
-- ----------------------------
INSERT INTO `ren` VALUES (1, 'XC_0001', '张三', '17384775461', '男');
INSERT INTO `ren` VALUES (2, 'XC_0002', '李四', '13424094851', '男');
INSERT INTO `ren` VALUES (3, 'XC_0003', '王五', '13111019726', '女');
INSERT INTO `ren` VALUES (4, 'XC_0004', '李婷', '13896867735', '女');
INSERT INTO `ren` VALUES (5, 'XC_0005', '刘华', '15923648591', '男');

-- ----------------------------
-- Table structure for ri
-- ----------------------------
DROP TABLE IF EXISTS `ri`;
CREATE TABLE `ri`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dname`(`dname`) USING BTREE,
  INDEX `xname`(`xname`) USING BTREE,
  CONSTRAINT `ri_ibfk_1` FOREIGN KEY (`dname`) REFERENCES `list` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ri_ibfk_2` FOREIGN KEY (`xname`) REFERENCES `ren` (`xname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ri
-- ----------------------------
INSERT INTO `ri` VALUES (1, 'RCXC_0001', 'XC_0002', '李四', 'DL_0005', '澳渝大道', '2020-06-30', '路面状况较为良好', '无');
INSERT INTO `ri` VALUES (2, 'RCXC_0002', 'XC_0002', '李四', 'DL_0001', '长江一路', '2020-07-05', ' 八一隧道与长江一路交叉口路面侧石破损', '请尽快维修');
INSERT INTO `ri` VALUES (3, 'RCXC_0003', 'XC_0005', '刘华', 'DL_0003', '菜袁路', '2020-07-07', '九滨路与菜袁路交叉口', '无');

-- ----------------------------
-- Table structure for shlx
-- ----------------------------
DROP TABLE IF EXISTS `shlx`;
CREATE TABLE `shlx`  (
  `shlx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`shlx_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shlx
-- ----------------------------
INSERT INTO `shlx` VALUES ('交叉裂缝和破碎板');
INSERT INTO `shlx` VALUES ('剥落');
INSERT INTO `shlx` VALUES ('唧浆');
INSERT INTO `shlx` VALUES ('啃边');
INSERT INTO `shlx` VALUES ('坑槽');
INSERT INTO `shlx` VALUES ('坑洞');
INSERT INTO `shlx` VALUES ('层状剥落');
INSERT INTO `shlx` VALUES ('拥包');
INSERT INTO `shlx` VALUES ('拱胀');
INSERT INTO `shlx` VALUES ('接缝料损坏');
INSERT INTO `shlx` VALUES ('板角撕裂');
INSERT INTO `shlx` VALUES ('沉陷');
INSERT INTO `shlx` VALUES ('泛油');
INSERT INTO `shlx` VALUES ('线裂');
INSERT INTO `shlx` VALUES ('网裂');
INSERT INTO `shlx` VALUES ('翻浆');
INSERT INTO `shlx` VALUES ('表面裂纹');
INSERT INTO `shlx` VALUES ('路框差');
INSERT INTO `shlx` VALUES ('车辙');
INSERT INTO `shlx` VALUES ('边角剥落');
INSERT INTO `shlx` VALUES ('边角裂缝');
INSERT INTO `shlx` VALUES ('错台');
INSERT INTO `shlx` VALUES ('龟裂');

-- ----------------------------
-- Table structure for temp
-- ----------------------------
DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp`  (
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AUTO_INCREMENT',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of temp
-- ----------------------------
INSERT INTO `temp` VALUES ('通江大道', 1);
INSERT INTO `temp` VALUES ('澳渝大道', 2);
INSERT INTO `temp` VALUES ('建新南路', 3);
INSERT INTO `temp` VALUES ('菜袁路', 4);
INSERT INTO `temp` VALUES ('长江一路', 5);
INSERT INTO `temp` VALUES ('长江一路', 6);
INSERT INTO `temp` VALUES ('通江大道', 7);
INSERT INTO `temp` VALUES ('长江一路', 8);
INSERT INTO `temp` VALUES ('菜袁路', 9);
INSERT INTO `temp` VALUES ('澳渝大道', 10);
INSERT INTO `temp` VALUES ('长江一路', 11);
INSERT INTO `temp` VALUES ('菜袁路', 12);
INSERT INTO `temp` VALUES ('长江一路', 13);
INSERT INTO `temp` VALUES ('菜袁路', 14);
INSERT INTO `temp` VALUES ('通江大道', 15);
INSERT INTO `temp` VALUES ('金源路', 16);
INSERT INTO `temp` VALUES ('澳渝大道', 17);
INSERT INTO `temp` VALUES ('澳渝大道', 18);
INSERT INTO `temp` VALUES ('菜袁路', 19);
INSERT INTO `temp` VALUES ('菜袁路', 20);
INSERT INTO `temp` VALUES ('菜袁路', 21);
INSERT INTO `temp` VALUES ('长江一路', 22);
INSERT INTO `temp` VALUES ('菜袁路', 23);
INSERT INTO `temp` VALUES ('金源路', 24);
INSERT INTO `temp` VALUES ('澳渝大道', 25);
INSERT INTO `temp` VALUES ('澳渝大道', 26);
INSERT INTO `temp` VALUES ('长江一路', 27);
INSERT INTO `temp` VALUES ('金源路', 28);
INSERT INTO `temp` VALUES ('长江一路', 29);
INSERT INTO `temp` VALUES ('长江一路', 30);
INSERT INTO `temp` VALUES ('澳渝大道', 31);
INSERT INTO `temp` VALUES ('金源路', 32);
INSERT INTO `temp` VALUES ('建新南路', 33);
INSERT INTO `temp` VALUES ('长江一路', 34);
INSERT INTO `temp` VALUES ('澳渝大道', 35);
INSERT INTO `temp` VALUES ('建新南路', 36);
INSERT INTO `temp` VALUES ('金源路', 37);
INSERT INTO `temp` VALUES ('长江一路', 38);
INSERT INTO `temp` VALUES ('澳渝大道', 39);
INSERT INTO `temp` VALUES ('长江一路', 40);
INSERT INTO `temp` VALUES ('菜袁路', 41);
INSERT INTO `temp` VALUES ('菜袁路', 42);
INSERT INTO `temp` VALUES ('长江一路', 43);
INSERT INTO `temp` VALUES ('建新南路', 44);
INSERT INTO `temp` VALUES ('澳渝大道', 45);
INSERT INTO `temp` VALUES ('建新南路', 46);
INSERT INTO `temp` VALUES ('菜袁路', 47);
INSERT INTO `temp` VALUES ('通江大道', 48);
INSERT INTO `temp` VALUES ('金源路', 49);
INSERT INTO `temp` VALUES ('长江一路', 50);
INSERT INTO `temp` VALUES ('澳渝大道', 51);
INSERT INTO `temp` VALUES ('长江一路', 52);
INSERT INTO `temp` VALUES ('长江一路', 53);
INSERT INTO `temp` VALUES ('长江一路', 54);
INSERT INTO `temp` VALUES ('长江一路', 55);
INSERT INTO `temp` VALUES ('菜袁路', 56);
INSERT INTO `temp` VALUES ('菜袁路', 57);
INSERT INTO `temp` VALUES ('菜袁路', 58);
INSERT INTO `temp` VALUES ('菜袁路', 59);
INSERT INTO `temp` VALUES ('长江一路', 60);
INSERT INTO `temp` VALUES ('菜袁路', 61);
INSERT INTO `temp` VALUES ('长江一路', 62);
INSERT INTO `temp` VALUES ('长江一路', 63);
INSERT INTO `temp` VALUES ('菜袁路', 64);
INSERT INTO `temp` VALUES ('长江一路', 65);
INSERT INTO `temp` VALUES ('澳渝大道', 66);
INSERT INTO `temp` VALUES ('通江大道', 67);
INSERT INTO `temp` VALUES ('澳渝大道', 68);
INSERT INTO `temp` VALUES ('长江一路', 69);
INSERT INTO `temp` VALUES ('菜袁路', 70);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123');

-- ----------------------------
-- Table structure for xjjh
-- ----------------------------
DROP TABLE IF EXISTS `xjjh`;
CREATE TABLE `xjjh`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AUTO_INCREMENT',
  `nurseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mondayStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thursdayStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wednesdayStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thuesdayStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fridayStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `saturdayStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sundayStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nurseName`(`nurseName`) USING BTREE,
  INDEX `dname`(`dname`) USING BTREE,
  CONSTRAINT `xjjh_ibfk_1` FOREIGN KEY (`nurseName`) REFERENCES `ren` (`xname`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xjjh_ibfk_2` FOREIGN KEY (`dname`) REFERENCES `list` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xjjh
-- ----------------------------
INSERT INTO `xjjh` VALUES (10, '李四', '通江大道', '', '', '', '', '附属设施状况', '', '');
INSERT INTO `xjjh` VALUES (11, '张三', '澳渝大道', 'IRI测量', NULL, NULL, '外观检查', NULL, NULL, '路面损坏情况');
INSERT INTO `xjjh` VALUES (14, '刘华', '菜袁路', '路面损坏情况', '', '', '外观检查', '', '道路施工作业情况', '附属设施状况');

-- ----------------------------
-- Table structure for xren
-- ----------------------------
DROP TABLE IF EXISTS `xren`;
CREATE TABLE `xren`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jsex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`, `jname`) USING BTREE,
  UNIQUE INDEX `jname`(`jname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xren
-- ----------------------------
INSERT INTO `xren` VALUES (1, 'JS_0001', '吕九峦', '15320925943', '男');
INSERT INTO `xren` VALUES (7, 'JS_0002', '焦澳', '13436028193', '男');
INSERT INTO `xren` VALUES (8, 'JS_0003', '杨林翰', '13896876642', '男');
INSERT INTO `xren` VALUES (9, 'JS_0004', '龚潮宁', '15310184745', '男');

-- ----------------------------
-- Table structure for zpg
-- ----------------------------
DROP TABLE IF EXISTS `zpg`;
CREATE TABLE `zpg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xhao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mian` decimal(10, 2) NOT NULL,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xmian` decimal(10, 2) NOT NULL,
  `xmi` decimal(10, 2) NOT NULL,
  `fen` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dname`(`dname`) USING BTREE,
  INDEX `xname`(`xname`) USING BTREE,
  CONSTRAINT `zpg_ibfk_1` FOREIGN KEY (`dname`) REFERENCES `list` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `zpg_ibfk_2` FOREIGN KEY (`xname`) REFERENCES `ren` (`xname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zpg
-- ----------------------------
INSERT INTO `zpg` VALUES (12, 'SHDC_0001', 'SHJL_0007', 'DL_0001', '长江一路', 'XC_0005', '刘华', 1800.00, '拥包', 2.34, 1.00, 15);
INSERT INTO `zpg` VALUES (13, 'SHDC_0002', 'SHJL_0008', 'DL_0003', '菜袁路', 'XC_0005', '刘华', 2800.00, '剥落', 2.00, 0.10, 5);
INSERT INTO `zpg` VALUES (14, 'SHDC_0003', 'SHJL_0009', 'DL_0003', '菜袁路', 'XC_0004', '李婷', 3000.00, '网裂', 6.15, 1.00, 10);
INSERT INTO `zpg` VALUES (15, 'SHDC_0004', 'SHJL_0010', 'DL_0001', '长江一路', 'XC_0001', '张三', 1888.00, '车辙', 10.62, 1.00, 12);

-- ----------------------------
-- Triggers structure for table admin
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_insert`;
delimiter ;;
CREATE TRIGGER `tr_insert` BEFORE INSERT ON `admin` FOR EACH ROW BEGIN
DECLARE Zxname CHARACTER(100);
DECLARE Zdname CHARACTER(100);
DECLARE Zxhao CHARACTER(100);
DECLARE Zdhao CHARACTER(100);
DECLARE Zids CHARACTER(10);
DECLARE Zlen_bz int;

SET Zxname=NEW.xname;
SET Zdname =NEW.dname;
SET Zlen_bz =length(NEW.bz);

SELECT xhao INTO Zxhao FROM ren WHERE xname=Zxname;
SELECT ids INTO Zdhao FROM list WHERE name=Zdname;
SET NEW.xhao =Zxhao;
SET NEW.dhao=Zdhao;


SELECT MAX(hao)INTO Zids FROM admin;
IF Zids IS NULL THEN SET Zids='TZ_0001';
ELSE SET Zids=concat('TZ_',lpad(substring(Zids,instr(Zids,'_')+1)+1,4,0));
END IF;
SET NEW.hao=Zids;

IF Zlen_bz<1 THEN
SET NEW.bz='无';
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table admin
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_admin_update`;
delimiter ;;
CREATE TRIGGER `tr_admin_update` BEFORE UPDATE ON `admin` FOR EACH ROW BEGIN
DECLARE Zxname CHARACTER(100);
DECLARE Zdname CHARACTER(100);
DECLARE Zxhao CHARACTER(100);
DECLARE Zdhao CHARACTER(100);
DECLARE Zlen_bz int;

SET Zxname=NEW.xname;
SET Zdname =NEW.dname;
SET Zlen_bz =length(NEW.bz);

SELECT xhao INTO Zxhao FROM ren WHERE xname=Zxname;
SELECT ids INTO Zdhao FROM list WHERE name=Zdname;
SET NEW.xhao =Zxhao;
SET NEW.dhao=Zdhao;

IF Zlen_bz<1 THEN
SET NEW.bz='无';
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table dq
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_dq_insert`;
delimiter ;;
CREATE TRIGGER `tr_dq_insert` BEFORE INSERT ON `dq` FOR EACH ROW BEGIN
DECLARE Zxname CHARACTER(100);
DECLARE Zdname CHARACTER(100);
DECLARE Zxhao CHARACTER(100);
DECLARE Zdhao CHARACTER(100);
DECLARE Ztime CHARACTER(100);
DECLARE Zids CHARACTER(10);
DECLARE Zlen_bz int;

SET Zxname=NEW.xname;
SET Zdname =NEW.dname;
SET Ztime=NEW.time;
SET Zlen_bz =length(NEW.bz);

SELECT xhao INTO Zxhao FROM ren WHERE xname=Zxname;
SELECT ids INTO Zdhao FROM list WHERE name=Zdname;
SET NEW.xhao =Zxhao;
SET NEW.dhao=Zdhao;
SET NEW.time=substring_index(Ztime,'T',1);

SELECT MAX(hao)INTO Zids FROM dq;
IF Zids IS NULL THEN SET Zids='PZD_0001';
ELSE SET Zids=concat('PZD_',lpad(substring(Zids,instr(Zids,'_')+1)+1,4,0));
END IF;
SET NEW.hao=Zids;

IF Zlen_bz<1 THEN
SET NEW.bz='无';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table dq
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_dq_update`;
delimiter ;;
CREATE TRIGGER `tr_dq_update` BEFORE UPDATE ON `dq` FOR EACH ROW BEGIN
DECLARE Zxname CHARACTER(100);
DECLARE Zdname CHARACTER(100);
DECLARE Zxhao CHARACTER(100);
DECLARE Zdhao CHARACTER(100);
DECLARE Ztime CHARACTER(100);
SET Zxname=NEW.xname;
SET Zdname =NEW.dname;
SET Ztime=NEW.time;
SELECT xhao INTO Zxhao FROM ren WHERE xname=Zxname;
SELECT ids INTO Zdhao FROM list WHERE name=Zdname;
SET NEW.xhao =Zxhao;
SET NEW.dhao=Zdhao;
SET NEW.time=substring_index(Ztime,'T',1);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table list
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_list_insert`;
delimiter ;;
CREATE TRIGGER `tr_list_insert` BEFORE INSERT ON `list` FOR EACH ROW BEGIN
DECLARE Zids CHARACTER(10);
SELECT MAX(ids)INTO Zids FROM list;
IF Zids IS NULL THEN
SET Zids='DL_0001';
ELSE 
SET Zids=concat('DL_',lpad(substring(Zids,instr(Zids,'_')+1)+1,4,0));
END IF;
SET NEW.ids=Zids;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table lm
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_lm_insert`;
delimiter ;;
CREATE TRIGGER `tr_lm_insert` BEFORE INSERT ON `lm` FOR EACH ROW BEGIN
DECLARE Zxname CHARACTER(100);
DECLARE Zdname CHARACTER(100);
DECLARE Zxhao CHARACTER(100);
DECLARE Zdhao CHARACTER(100);
DECLARE Zmian decimal(10,2);
DECLARE Zxchang decimal(10,2);
DECLARE Zxkuan decimal(10,2);
DECLARE Zxgao decimal(10,2);
DECLARE Zmidu decimal(10,2);
DECLARE Zchang decimal(10,2);
DECLARE Zkuan decimal(10,2);
DECLARE Zjmian decimal(10,2);
DECLARE Zshlx_name CHARACTER(100);
DECLARE Zshmj decimal(10,2);
DECLARE Zlmlx_name CHARACTER(100);
DECLARE Zkfz int;
DECLARE Zids CHARACTER(10);

SELECT MAX(hao)INTO Zids FROM lm;
IF Zids IS NULL THEN SET Zids='SHJL_0001';
ELSE SET Zids=concat('SHJL_',lpad(substring(Zids,instr(Zids,'_')+1)+1,4,0));
END IF;
SET NEW.hao=Zids;

SET Zxname=NEW.xname;
SET Zdname=NEW.dname;
SELECT xhao INTO Zxhao FROM ren WHERE xname=Zxname;
SELECT ids INTO Zdhao FROM list WHERE name=Zdname;
SELECT lmlx_name INTO Zlmlx_name FROM list WHERE name=Zdname;
SET Zxchang=NEW.xchang;
SET Zxkuan=NEW.xkuan;
SET Zxgao=NEW.xgao;
SET Zchang=NEW.chang;
SET Zkuan=NEW.kuan;
SET Zshlx_name=NEW.class;
SET Zmian=Zxchang*Zxkuan+Zxkuan*Zxgao;
SET NEW.xhao =Zxhao;
SET NEW.dhao=Zdhao;
SET NEW.mian=Zmian;
SET Zjmian=Zchang*Zkuan;
SET Zmidu=Zmian/Zjmian*100;
IF Zlmlx_name='沥青路'
THEN
IF Zmidu>0 AND Zmidu<=0.01 THEN SET Zmidu=0.01; END IF;
IF Zmidu>0.01 AND Zmidu<=0.1 THEN SET Zmidu=0.1; END IF;
IF Zmidu>0.1 AND Zmidu<=1 THEN SET Zmidu=1; END IF;
IF Zmidu>1 AND Zmidu<=10 THEN SET Zmidu=10; END IF;
IF Zmidu>10 AND Zmidu<=50 THEN SET Zmidu=50; END IF;
IF Zmidu>50 AND Zmidu<=100 THEN SET Zmidu=100; END IF;
END IF;

IF Zlmlx_name='水泥路'
THEN
IF Zmidu>0 AND Zmidu<=0.02 THEN SET Zmidu=0.02; END IF;
IF Zmidu>0.02 AND Zmidu<=0.1 THEN SET Zmidu=0.1; END IF;
IF Zmidu>0.1 AND Zmidu<=0.2 THEN SET Zmidu=0.2; END IF;
IF Zmidu>0.2 AND Zmidu<=0.5 THEN SET Zmidu=0.5; END IF;
IF Zmidu>0.5 AND Zmidu<=0.6 THEN SET Zmidu=0.6; END IF;
IF Zmidu>0.6 AND Zmidu<=1 THEN SET Zmidu=1; END IF;
IF Zmidu>1 AND Zmidu<=3 THEN SET Zmidu=3; END IF;
IF Zmidu>3 AND Zmidu<=5 THEN SET Zmidu=5; END IF;
IF Zmidu>5 AND Zmidu<=7 THEN SET Zmidu=7; END IF;
IF Zmidu>7 AND Zmidu<=10 THEN SET Zmidu=10; END IF;
IF Zmidu>10 AND Zmidu<=20 THEN SET Zmidu=20; END IF;
IF Zmidu>20 AND Zmidu<=30 THEN SET Zmidu=30; END IF;
IF Zmidu>30 AND Zmidu<=50 THEN SET Zmidu=50; END IF;
IF Zmidu>50 AND Zmidu<=100 THEN SET Zmidu=100; END IF;
END IF;


SELECT kfz INTO Zkfz from kfbz 
WHERE Zlmlx_name=lmlx_name AND Zshlx_name=shlx_name AND Zmidu=shmd;

INSERT INTO zpg(dhao,dname,xhao,xname,mian,class,xmian,xmi,fen) 
VALUES(Zdhao,Zdname,Zxhao,Zxname,Zjmian,Zshlx_name,NEW.mian,Zmidu,Zkfz);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table lm
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_delete`;
delimiter ;;
CREATE TRIGGER `tr_delete` AFTER DELETE ON `lm` FOR EACH ROW BEGIN
DELETE FROM zpg
WHERE fhao=old.hao;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pg
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_pg`;
delimiter ;;
CREATE TRIGGER `tr_pg` BEFORE INSERT ON `pg` FOR EACH ROW BEGIN
DECLARE Zids CHARACTER(10);
DECLARE Zrqi decimal(4,2);
DECLARE Ziri decimal(4,2);
DECLARE Zpci decimal(4,2);
DECLARE Zpqi decimal(4,2);
DECLARE Zrqi_dj CHARACTER(100);
DECLARE Zpci_dj CHARACTER(100);
DECLARE Zpqi_dj CHARACTER(100);
DECLARE Ztemphao CHARACTER(100);
DECLARE Zdids CHARACTER(100);

SELECT MAX(hao)INTO Zids FROM pg;
IF Zids IS NULL THEN SET Zids='PG_0001';
ELSE SET Zids=concat('PG_',lpad(substring(Zids,instr(Zids,'_')+1)+1,4,0));
END IF;
SET NEW.hao=Zids;

SELECT ids INTO Zdids FROM list WHERE name=NEW.name;
SET NEW.ids=Zdids;

SELECT MAX(hao) INTO Ztemphao FROM dq WHERE dhao=NEW.ids;
SELECT iri INTO Ziri FROM dq WHERE hao=Ztemphao;
SET Zrqi=4.98-0.34*Ziri;
IF Zrqi<0 THEN SET Zrqi=0;END IF;

SET NEW.rqi_iri=Zrqi/Ziri;

IF NEW.dllx_name<=>'快速路' THEN
IF Zrqi>0 AND Zrqi<=2.5 THEN SET New.rqi_dj='D'; END IF;
IF Zrqi>2.5 AND Zrqi<=3.6 THEN SET New.rqi_dj='C'; END IF;
IF Zrqi>3.6 AND Zrqi<=4.1 THEN SET New.rqi_dj='B'; END IF;
IF Zrqi>4.1 AND Zrqi<=4.98 THEN SET New.rqi_dj='A'; END IF;
END IF;

IF NEW.dllx_name<=>'主干路' OR NEW.dllx_name<=>'次干路' THEN
IF Zrqi>0 AND Zrqi<=2.40 THEN SET New.rqi_dj='D'; END IF;
IF Zrqi>2.40 AND Zrqi<=3.0 THEN SET New.rqi_dj='C'; END IF;
IF Zrqi>3.0 AND Zrqi<=3.6 THEN SET New.rqi_dj='B'; END IF;
IF Zrqi>3.6 AND Zrqi<=4.98 THEN SET New.rqi_dj='A'; END IF;
END IF;

IF NEW.dllx_name<=>'支路' THEN
IF Zrqi>0 AND Zrqi<=2.2 THEN SET New.rqi_dj='D'; END IF;
IF Zrqi>2.2 AND Zrqi<=2.8 THEN SET New.rqi_dj='C'; END IF;
IF Zrqi>2.8 AND Zrqi<=3.4 THEN SET New.rqi_dj='B'; END IF;
IF Zrqi>3.4 AND Zrqi<=4.98 THEN SET New.rqi_dj='A'; END IF;
END IF;

SELECT SUM(fen) INTO Zpci FROM zpg WHERE dname=NEW.name;
SET Zpci=100-Zpci*0.8;
SET NEW.pci=Zpci;

IF NEW.dllx_name<=>'快速路' THEN
IF Zpci>0 AND Zpci<=65 THEN SET NEW.pci_dj='D';END IF;
IF Zpci>65 AND Zpci<=75 THEN SET NEW.pci_dj='C';END IF;
IF Zpci>75 AND Zpci<=90 THEN SET NEW.pci_dj='B';END IF;
IF Zpci>90 AND Zpci<=100 THEN SET NEW.pci_dj='A';END IF;
END IF;
IF NEW.dllx_name<=>'主干路' OR NEW.dllx_name<=>'次干路' THEN
IF Zpci>0 AND Zpci<=60 THEN SET NEW.pci_dj='D';END IF;
IF Zpci>60 AND Zpci<=70 THEN SET NEW.pci_dj='C';END IF;
IF Zpci>70 AND Zpci<=85 THEN SET NEW.pci_dj='B';END IF;
IF Zpci>85 AND Zpci<=100 THEN SET NEW.pci_dj='A';END IF;
END IF;
IF NEW.dllx_name<=>'支路' THEN
IF Zpci>0 AND Zpci<=60 THEN SET NEW.pci_dj='D';END IF;
IF Zpci>60 AND Zpci<=65 THEN SET NEW.pci_dj='C';END IF;
IF Zpci>65 AND Zpci<=80 THEN SET NEW.pci_dj='B';END IF;
IF Zpci>80 AND Zpci<=100 THEN SET NEW.pci_dj='A';END IF;
END IF;

SET Zpqi=20*0.6*Zrqi+Zpci*0.4;
SET NEW.pqi=Zpqi;

IF NEW.dllx_name<=>'快速路' THEN
IF Zpqi>0 AND Zpqi<=65 THEN SET NEW.pqi_dj='D';END IF;
IF Zpqi>65 AND Zpqi<=75 THEN SET NEW.pqi_dj='C';END IF;
IF Zpqi>75 AND Zpqi<=90 THEN SET NEW.pqi_dj='B';END IF;
IF Zpqi>90 AND Zpqi<=100 THEN SET NEW.pqi_dj='A';END IF;
END IF;
IF NEW.dllx_name<=>'主干路' OR NEW.dllx_name<=>'次干路' THEN
IF Zpqi>0 AND Zpqi<=60 THEN SET NEW.pqi_dj='D';END IF;
IF Zpqi>60 AND Zpqi<=70 THEN SET NEW.pqi_dj='C';END IF;
IF Zpqi>70 AND Zpqi<=85 THEN SET NEW.pqi_dj='B';END IF;
IF Zpqi>85 AND Zpqi<=100 THEN SET NEW.pqi_dj='A';END IF;
END IF;
IF NEW.dllx_name<=>'支路' THEN
IF Zpqi>0 AND Zpqi<=60 THEN SET NEW.pqi_dj='D';END IF;
IF Zpqi>60 AND Zpqi<=65 THEN SET NEW.pqi_dj='C';END IF;
IF Zpqi>65 AND Zpqi<=80 THEN SET NEW.pqi_dj='B';END IF;
IF Zpqi>80 AND Zpqi<=100 THEN SET NEW.pqi_dj='A';END IF;
END IF;


UPDATE list
SET list.pqi_dj=NEW.pqi_dj
WHERE list.name=NEW.name;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ren
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_ren_insert`;
delimiter ;;
CREATE TRIGGER `tr_ren_insert` BEFORE INSERT ON `ren` FOR EACH ROW BEGIN
DECLARE Zids CHARACTER(10);
SELECT MAX(xhao)INTO Zids FROM ren;
IF Zids IS NULL THEN SET Zids='XC_0001';
ELSE SET Zids=concat('XC_',lpad(substring(Zids,instr(Zids,'_')+1)+1,4,0));
END IF;
SET NEW.xhao=Zids;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ri
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_ri_insert`;
delimiter ;;
CREATE TRIGGER `tr_ri_insert` BEFORE INSERT ON `ri` FOR EACH ROW BEGIN
DECLARE Zxname CHARACTER(100);
DECLARE Zdname CHARACTER(100);
DECLARE Zxhao CHARACTER(100);
DECLARE Zdhao CHARACTER(100);
DECLARE Ztime CHARACTER(100);
DECLARE Zids CHARACTER(10);
DECLARE Zlen_bz int;

SET Zxname=NEW.xname;
SET Zdname =NEW.dname;
SET Ztime=NEW.time;
SET Zlen_bz =length(NEW.bz);

SELECT xhao INTO Zxhao FROM ren WHERE xname=Zxname;
SELECT ids INTO Zdhao FROM list WHERE name=Zdname;
SET NEW.xhao =Zxhao;
SET NEW.dhao=Zdhao;
SET NEW.time=substring_index(Ztime,'T',1);



SELECT MAX(rhao)INTO Zids FROM ri;
IF Zids IS NULL THEN SET Zids='RCXC_0001';
ELSE SET Zids=concat('RCXC_',lpad(substring(Zids,instr(Zids,'_')+1)+1,4,0));
END IF;
SET NEW.rhao=Zids;

IF Zlen_bz<1 THEN
SET NEW.bz='无';
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ri
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_ri_update`;
delimiter ;;
CREATE TRIGGER `tr_ri_update` BEFORE UPDATE ON `ri` FOR EACH ROW BEGIN
DECLARE Zxname CHARACTER(100);
DECLARE Zdname CHARACTER(100);
DECLARE Zxhao CHARACTER(100);
DECLARE Zdhao CHARACTER(100);
DECLARE Ztime CHARACTER(100);
DECLARE Zlen_bz int;

SET Zxname=NEW.xname;
SET Zdname =NEW.dname;
SET Ztime=NEW.time;
SET Zlen_bz =length(NEW.bz);

SELECT xhao INTO Zxhao FROM ren WHERE xname=Zxname;
SELECT ids INTO Zdhao FROM list WHERE name=Zdname;
SET NEW.xhao =Zxhao;
SET NEW.dhao=Zdhao;
SET NEW.time=substring_index(Ztime,'T',1);

IF Zlen_bz<1 THEN
SET NEW.bz='无';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table xren
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_xren_insert`;
delimiter ;;
CREATE TRIGGER `tr_xren_insert` BEFORE INSERT ON `xren` FOR EACH ROW BEGIN
DECLARE Zids CHARACTER(10);
SELECT MAX(jhao)INTO Zids FROM xren;
IF Zids IS NULL THEN SET Zids='JS_0001';
ELSE SET Zids=concat('JS_',lpad(substring(Zids,instr(Zids,'_')+1)+1,4,0));
END IF;
SET NEW.jhao=Zids;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table zpg
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_zpg_insert`;
delimiter ;;
CREATE TRIGGER `tr_zpg_insert` BEFORE INSERT ON `zpg` FOR EACH ROW BEGIN
DECLARE Zids CHARACTER(10);
DECLARE Zfhao CHARACTER(100);

SELECT MAX(hao)INTO Zids FROM zpg;
IF Zids IS NULL THEN SET Zids='SHDC_0001';
ELSE SET Zids=concat('SHDC_',lpad(substring(Zids,instr(Zids,'_')+1)+1,4,0));
END IF;
SET NEW.hao=Zids;

SELECT hao INTO Zfhao FROM lm ORDER BY id DESC LIMIT 0,1;

SET Zfhao=concat('SHJL_',lpad(substring( Zfhao,instr( Zfhao,'_')+1)+1,4,0));

SET NEW.fhao=Zfhao;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
