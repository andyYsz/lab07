/*
 Navicat Premium Data Transfer

 Source Server         : conn
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : test2

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 01/09/2019 17:52:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for relationship
-- ----------------------------
DROP TABLE IF EXISTS `relationship`;
CREATE TABLE `relationship`  (
  `user_one_id` int(11) NOT NULL,
  `user_two_id` int(11) NOT NULL,
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '0-Pending,1-Accepted,2-Declined,3-Blocked',
  `action_user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_one_id`, `user_two_id`) USING BTREE,
  INDEX `FK_relationship_users_2`(`user_two_id`) USING BTREE,
  INDEX `FK_relationship_users_3`(`action_user_id`) USING BTREE,
  CONSTRAINT `relationship__action_user_id` FOREIGN KEY (`action_user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `relationship_user_one_id` FOREIGN KEY (`user_one_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `relationship_user_two_id` FOREIGN KEY (`user_two_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relationship
-- ----------------------------
INSERT INTO `relationship` VALUES (1, 2, 1, 1);
INSERT INTO `relationship` VALUES (1, 3, 1, 3);
INSERT INTO `relationship` VALUES (1, 4, 1, 4);
INSERT INTO `relationship` VALUES (1, 5, 0, 5);
INSERT INTO `relationship` VALUES (1, 6, 3, 1);
INSERT INTO `relationship` VALUES (1, 7, 0, 1);
INSERT INTO `relationship` VALUES (2, 3, 1, 2);
INSERT INTO `relationship` VALUES (2, 4, 1, 4);
INSERT INTO `relationship` VALUES (3, 5, 1, 3);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'test1', 'test1@fsd.com', '123456');
INSERT INTO `users` VALUES (2, 'test2', 'test2@fsd.com', '123456');
INSERT INTO `users` VALUES (3, 'test3', 'test3@fsd.com', '123456');
INSERT INTO `users` VALUES (4, 'test4', 'test4@fsd.com', '123456');
INSERT INTO `users` VALUES (5, 'test5', 'test5@fsd.com', '123456');
INSERT INTO `users` VALUES (6, 'test6', 'test6@fsd.com', '123456');
INSERT INTO `users` VALUES (7, 'test7', 'test7@fsd.com', '123456');

SET FOREIGN_KEY_CHECKS = 1;
