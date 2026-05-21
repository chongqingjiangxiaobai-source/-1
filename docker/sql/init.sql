-- =====================================================
-- warehouse 仓库管理系统 数据库初始化脚本
-- =====================================================

DROP TABLE IF EXISTS `goods_id`;
DROP TABLE IF EXISTS `client`;
DROP TABLE IF EXISTS `goods`;
DROP TABLE IF EXISTS `user`;

-- -------------------------------------------------------
-- 用户表
-- -------------------------------------------------------
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 插入默认测试用户
INSERT INTO `user` VALUES
  (1,'test','123456',NULL,NULL),
  (10,'admin','123456',NULL,NULL);

-- -------------------------------------------------------
-- 货物表
-- -------------------------------------------------------
CREATE TABLE `goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `num` int DEFAULT NULL,
  `site` varchar(200) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -------------------------------------------------------
-- 客户表
-- -------------------------------------------------------
CREATE TABLE `client` (
  `clientId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `goodsId` int DEFAULT NULL,
  `goodsNum` int DEFAULT NULL,
  PRIMARY KEY (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -------------------------------------------------------
-- 货物与客户关联表
-- -------------------------------------------------------
CREATE TABLE `goods_id` (
  `uid` int DEFAULT NULL,
  `id` int DEFAULT NULL,
  `clientId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;