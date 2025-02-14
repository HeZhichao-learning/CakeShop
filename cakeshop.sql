/*
 Navicat MySQL Dump SQL

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : cakeshop

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 23/12/2024 16:56:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cover` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `image1` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `image2` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `intro` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_type_id_idx`(`type_id` ASC) USING BTREE,
  CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (9, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (10, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 15, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 3);
INSERT INTO `goods` VALUES (11, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 22, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 3);
INSERT INTO `goods` VALUES (12, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (13, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (14, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (15, 'xiao1', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 30, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (16, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 32, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (18, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (19, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 4);
INSERT INTO `goods` VALUES (20, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 4);
INSERT INTO `goods` VALUES (21, '意大利芝士饼干0001', '/picture/9-3.jpg', '/picture/9-1.jpg', '/picture/1733818491773.jpg', 49.999, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 11);
INSERT INTO `goods` VALUES (23, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 28, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (24, '玫瑰舒芙蕾2', '/picture/9-3.jpg', '/picture/9-3.jpg', '/picture/10-3.jpg', 28.8, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (25, '半熟芝士1', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 11);
INSERT INTO `goods` VALUES (26, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (27, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 8);
INSERT INTO `goods` VALUES (28, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (29, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 29, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (30, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 29, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (31, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 11);
INSERT INTO `goods` VALUES (32, '半熟芝士111', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-3.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (33, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 5);
INSERT INTO `goods` VALUES (34, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 5);
INSERT INTO `goods` VALUES (35, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (36, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 188, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (37, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 15, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (38, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 8);
INSERT INTO `goods` VALUES (40, '黑森林', '/picture/15-1.jpg', '/picture/15-2.jpg', '/picture/15-3.jpg', 200, '黑森林蛋糕（Schwarzwlder Kirschtorte），又名“黑森林樱桃蛋糕”，发源于德国南部黑森林地区，是德国著名的甜点代表之一。  黑森林蛋糕融合了樱桃的酸、奶油的甜、巧克力的苦、樱桃酒的醇香；不仅在德国广受欢迎，在全世界也美名远扬。', 8, 11);
INSERT INTO `goods` VALUES (41, '黑森林', '/picture/15-2.jpg', '/picture/15-1.jpg', '/picture/15-3.jpg', 188, '黑森林蛋糕（Schwarzwlder Kirschtorte），又名“黑森林樱桃蛋糕”，发源于德国南部黑森林地区，是德国著名的甜点代表之一。  黑森林蛋糕融合了樱桃的酸、奶油的甜、巧克力的苦、樱桃酒的醇香；不仅在德国广受欢迎，在全世界也美名远扬。', 8, 5);
INSERT INTO `goods` VALUES (43, '网红产品1', '/picture/15-1.jpg', '/picture/15-1.jpg', '/picture/15-1.jpg', 39.9, '手动阀沙发斯蒂芬', 6, 15);
INSERT INTO `goods` VALUES (44, '小小蛋糕', '/picture/10-5.jpg', '/picture/10-5.jpg', '/picture/10-5.jpg', 188, '黑森林蛋糕（Schwarzwlder Kirschtorte），又名“黑森林樱桃蛋糕”，发源于德国南部黑森林地区，是德国著名的甜点代表之一。  黑森林蛋糕融合了樱桃的酸、奶油的甜、巧克力的苦、樱桃酒的醇香；不仅在德国广受欢迎，在全世界也美名远扬。', 8, 15);
INSERT INTO `goods` VALUES (46, '蛋糕王子', '/picture/10-2.jpg', '/picture/10-5.png', '/picture/10-6.jpg', 188, '黑森林蛋糕（Schwarzwlder Kirschtorte），又名“黑森林樱桃蛋糕”，发源于德国南部黑森林地区，是德国著名的甜点代表之一。  黑森林蛋糕融合了樱桃的酸、奶油的甜、巧克力的苦、樱桃酒的醇香；不仅在德国广受欢迎，在全世界也美名远扬。', 8, 15);
INSERT INTO `goods` VALUES (50, 'bbbb', '/picture/1733735790196.jpg', '/picture/1733735790208.jpg', '/picture/1733735790221.jpg', 11.11, 'abcdefg', 10, 15);
INSERT INTO `goods` VALUES (54, '汇华大米饭', '/picture/1733885114334.jpg', '/picture/1733885114339.jpg', '/picture/1733885114342.jpg', 12, 'abcdefg', 10, 18);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` float NULL DEFAULT NULL,
  `amount` int NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `paytype` tinyint(1) NULL DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_id_idx`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (75, 28, 1, 1, 2, '管理员', '1333333333', '中华人民共和国', '2023-10-07 12:31:07', 1);
INSERT INTO `order` VALUES (78, 102, 3, 3, 1, '张大飞', '1344432311', '石家庄市红旗大街469号', '2023-12-04 16:57:30', 3);
INSERT INTO `order` VALUES (81, 100, 3, 2, 2, '张大飞', '1344432311', '石家庄市红旗大街469号', '2023-12-06 10:18:36', 3);
INSERT INTO `order` VALUES (83, 72, 2, 2, 2, '宋晓', '15631142345', '石家庄市友谊大街345号', '2023-12-18 16:15:43', 7);
INSERT INTO `order` VALUES (93, 36, 1, 3, 1, '笑笑', '1773211234', '石家庄市红旗大街469号', '2024-03-30 21:18:44', 3);
INSERT INTO `order` VALUES (94, 70, 2, 2, 1, '笑笑', '1773211234', '石家庄市红旗大街469号', '2024-03-30 21:20:11', 3);
INSERT INTO `order` VALUES (95, 72, 2, 4, 2, '张丽丽', '1773211234', '石家庄市红旗大街469号', '2024-04-02 15:38:17', 3);
INSERT INTO `order` VALUES (96, 22, 1, 2, 1, '张丽丽', '1773211234', '石家庄市红旗大街469号', '2024-04-07 08:32:17', 3);
INSERT INTO `order` VALUES (98, 176, 8, 2, 2, '管理员12', '1333333333', '中华人民共和国', '2024-11-28 16:22:50', 1);
INSERT INTO `order` VALUES (99, 78, 2, 2, 1, '管理员12', '1333333333', '中华人民共和国', '2024-11-28 16:23:58', 1);
INSERT INTO `order` VALUES (100, 331, 6, 4, 2, '管理员12', '1333333333', '中华人民共和国', '2024-12-11 08:13:30', 1);
INSERT INTO `order` VALUES (101, 322, 10, 2, 2, '管理员12', '1333333333', '中华人民共和国', '2024-12-02 14:08:29', 1);
INSERT INTO `order` VALUES (102, 122, 4, 2, 2, '张丽丽', '1773211234', '石家庄市红旗大街469号', '2024-12-02 14:10:52', 3);
INSERT INTO `order` VALUES (103, 152, 4, 4, 1, '张丽丽111', '1773211234', '石家庄市红旗大街469号', '2024-12-11 10:47:58', 3);
INSERT INTO `order` VALUES (106, 247, 9, 4, 2, '管理员12', '1333333333', '中华人民共和国', '2024-12-11 10:43:05', 1);
INSERT INTO `order` VALUES (108, 33.33, 3, 2, 1, '管理员12', '1333333333', '中华人民共和国', '2024-12-11 10:43:56', 1);
INSERT INTO `order` VALUES (109, 108, 9, 2, 1, '管理员12', '1333333333', '中华人民共和国', '2024-12-11 10:45:53', 1);
INSERT INTO `order` VALUES (110, 180, 15, 2, 2, '管理员123456780', '1333333333', '中华人民共和国', '2024-12-11 10:49:17', 1);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` float NULL DEFAULT NULL,
  `amount` int NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL,
  `order_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_id_idx`(`order_id` ASC) USING BTREE,
  INDEX `fk_orderitem_goods_id_idx`(`goods_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orderitem_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (78, 28, 1, 10, 75);
INSERT INTO `orderitem` VALUES (83, 36, 1, 12, 78);
INSERT INTO `orderitem` VALUES (84, 36, 1, 13, 78);
INSERT INTO `orderitem` VALUES (85, 30, 1, 15, 78);
INSERT INTO `orderitem` VALUES (87, 32, 2, 16, 81);
INSERT INTO `orderitem` VALUES (88, 36, 1, 13, 81);
INSERT INTO `orderitem` VALUES (90, 36, 1, 12, 83);
INSERT INTO `orderitem` VALUES (91, 36, 1, 13, 83);
INSERT INTO `orderitem` VALUES (96, 36, 1, 12, 93);
INSERT INTO `orderitem` VALUES (97, 32, 1, 16, 94);
INSERT INTO `orderitem` VALUES (98, 38, 1, 18, 94);
INSERT INTO `orderitem` VALUES (99, 36, 1, 12, 95);
INSERT INTO `orderitem` VALUES (100, 36, 1, 13, 95);
INSERT INTO `orderitem` VALUES (101, 22, 1, 11, 96);
INSERT INTO `orderitem` VALUES (103, 22, 8, 11, 98);
INSERT INTO `orderitem` VALUES (104, 39, 2, 14, 99);
INSERT INTO `orderitem` VALUES (105, 38, 1, 18, 100);
INSERT INTO `orderitem` VALUES (106, 29, 1, 9, 100);
INSERT INTO `orderitem` VALUES (107, 15, 1, 10, 100);
INSERT INTO `orderitem` VALUES (108, 22, 1, 11, 100);
INSERT INTO `orderitem` VALUES (109, 188, 1, 44, 100);
INSERT INTO `orderitem` VALUES (110, 39, 1, 14, 100);
INSERT INTO `orderitem` VALUES (111, 36, 1, 34, 101);
INSERT INTO `orderitem` VALUES (112, 29, 1, 9, 101);
INSERT INTO `orderitem` VALUES (113, 22, 2, 11, 101);
INSERT INTO `orderitem` VALUES (114, 36, 1, 12, 101);
INSERT INTO `orderitem` VALUES (115, 39, 3, 14, 101);
INSERT INTO `orderitem` VALUES (116, 30, 2, 15, 101);
INSERT INTO `orderitem` VALUES (117, 15, 1, 10, 102);
INSERT INTO `orderitem` VALUES (118, 29, 1, 29, 102);
INSERT INTO `orderitem` VALUES (119, 39, 2, 14, 102);
INSERT INTO `orderitem` VALUES (120, 38, 1, 18, 103);
INSERT INTO `orderitem` VALUES (121, 36, 1, 19, 103);
INSERT INTO `orderitem` VALUES (122, 39, 2, 14, 103);
INSERT INTO `orderitem` VALUES (129, 32, 1, 16, 106);
INSERT INTO `orderitem` VALUES (130, 29, 1, 9, 106);
INSERT INTO `orderitem` VALUES (131, 15, 1, 10, 106);
INSERT INTO `orderitem` VALUES (132, 22, 3, 11, 106);
INSERT INTO `orderitem` VALUES (133, 36, 1, 13, 106);
INSERT INTO `orderitem` VALUES (134, 39, 1, 14, 106);
INSERT INTO `orderitem` VALUES (135, 30, 1, 15, 106);
INSERT INTO `orderitem` VALUES (137, 11.11, 3, 50, 108);
INSERT INTO `orderitem` VALUES (138, 12, 9, 54, 109);
INSERT INTO `orderitem` VALUES (139, 12, 15, 54, 110);

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_goods_id_idx`(`goods_id` ASC) USING BTREE,
  CONSTRAINT `fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (12, 1, 13);
INSERT INTO `recommend` VALUES (13, 1, 14);
INSERT INTO `recommend` VALUES (14, 3, 15);
INSERT INTO `recommend` VALUES (17, 3, 18);
INSERT INTO `recommend` VALUES (18, 3, 19);
INSERT INTO `recommend` VALUES (34, 2, 11);
INSERT INTO `recommend` VALUES (35, 2, 12);
INSERT INTO `recommend` VALUES (36, 2, 13);
INSERT INTO `recommend` VALUES (39, 2, 16);
INSERT INTO `recommend` VALUES (40, 2, 18);
INSERT INTO `recommend` VALUES (45, 3, 21);
INSERT INTO `recommend` VALUES (46, 3, 20);
INSERT INTO `recommend` VALUES (49, 2, 28);
INSERT INTO `recommend` VALUES (50, 1, 29);
INSERT INTO `recommend` VALUES (51, 2, 23);
INSERT INTO `recommend` VALUES (62, 2, 44);
INSERT INTO `recommend` VALUES (63, 1, 13);
INSERT INTO `recommend` VALUES (64, 1, 13);
INSERT INTO `recommend` VALUES (65, 3, 13);
INSERT INTO `recommend` VALUES (66, 1, 13);
INSERT INTO `recommend` VALUES (70, 1, 10);
INSERT INTO `recommend` VALUES (71, 1, 10);
INSERT INTO `recommend` VALUES (72, 1, 46);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '冰淇淋系列');
INSERT INTO `type` VALUES (2, '零食系列');
INSERT INTO `type` VALUES (3, '儿童系列');
INSERT INTO `type` VALUES (4, '法式系列');
INSERT INTO `type` VALUES (5, '经典系列');
INSERT INTO `type` VALUES (8, '节日系列');
INSERT INTO `type` VALUES (11, '买不起系列');
INSERT INTO `type` VALUES (12, '网红系列1');
INSERT INTO `type` VALUES (15, '特色系列');
INSERT INTO `type` VALUES (18, 'aa1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isadmin` bit(1) NULL DEFAULT NULL,
  `isvalidate` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username` ASC) USING BTREE,
  UNIQUE INDEX `email_UNIQUE`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin@vilicode.com', '111', '管理员12', '1333333333', '中华人民共和国', b'1', b'0');
INSERT INTO `user` VALUES (2, 'vili', 'vili@vilicode.com', 'vili', '小张1', '1344444456', '石家庄市红旗大街469', b'0', b'0');
INSERT INTO `user` VALUES (3, 'aa', 'aa', 'a111', '张丽丽11112', '177321123456', '石家庄市红旗大街469号', b'0', b'0');
INSERT INTO `user` VALUES (6, 'bb122', 'bb1', '222', '李思1', '13432432423', '石家庄市红旗大街469', b'0', b'0');
INSERT INTO `user` VALUES (7, 'bb', 'bb', 'bb1', '宋晓11', '15631142345', '石家庄市友谊大街3451号', b'0', b'0');
INSERT INTO `user` VALUES (8, 'lina', 'lina@qq.com', 'lina', '李娜娜', '138311234322', '石家庄市红旗大街456号', b'0', b'0');
INSERT INTO `user` VALUES (9, 'jack1', 'jack', 'jack2', 'jack2', '13544322344', '石家庄市红旗大街469', b'0', b'0');
INSERT INTO `user` VALUES (10, '曹薇', 'caowei@qq.com', 'caowei123', 'xiaocao ', '1592313433', '石家庄桥西区时光街荣盛城', b'0', b'0');
INSERT INTO `user` VALUES (15, '梅兰芳', 'mm', 'mm', '李晓雨', '15832212345', '石家庄市友谊大街345号', b'0', b'0');
INSERT INTO `user` VALUES (17, 'lily', 'lily@qq.com', '111', '丽丽1', '13432432423', '石家庄市红旗大街234号', b'0', b'0');
INSERT INTO `user` VALUES (20, '魏岩', 'wei123@qq.com', 'wei123', '小小', '1393116322', '石家庄桥西区荣盛城', b'0', b'0');
INSERT INTO `user` VALUES (21, 'Mary', 'Mary@qq.com', 'Mary', '玛丽', '157439435', '石家庄市友谊大街311号', b'1', b'0');
INSERT INTO `user` VALUES (22, 'Danny11', 'danny@qq.com', 'danny', '丹尼', '1583774480', '汇华学院', b'0', b'0');
INSERT INTO `user` VALUES (30, 'jjjjhhgggfff44', '3291008095@qq.com', '1111', 'aa1', '12121212', '石家庄市友谊大街3451号', b'0', b'0');
INSERT INTO `user` VALUES (31, '123ASDasd', '32910080915@qq.com', '111', '张丽丽1112223', '12121212', '石家庄市友谊大街3451号', b'0', b'0');
INSERT INTO `user` VALUES (34, '111122222', '32910008095@qq.com', '1111', '管理员123', '15832212345', '石家庄市友谊大街11号', b'0', b'0');
INSERT INTO `user` VALUES (35, 'jjjjhhgggfff441', '329100080915@qq.com', '1', '管理员123456780', 'a', 'aa', b'0', b'0');

SET FOREIGN_KEY_CHECKS = 1;
