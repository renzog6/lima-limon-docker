/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100137
 Source Host           : localhost:3306
 Source Schema         : lima_limon

 Target Server Type    : MySQL
 Target Server Version : 100137
 File Encoding         : 65001

 Date: 29/05/2023 10:23:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES (1, 'Cat X', '', 1);
INSERT INTO `categoria` VALUES (2, 'Perfume MUJER', '', 1);
INSERT INTO `categoria` VALUES (3, 'Difusor 500 ml', '', 1);
INSERT INTO `categoria` VALUES (4, 'Perfume Hombre', 'Hombre', 1);
INSERT INTO `categoria` VALUES (11, 'Cat 03', 'X', 1);
INSERT INTO `categoria` VALUES (13, 'AAAS', '', 1);

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `telefono` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deuda` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES (1, 'Pedro', 'Sa', 1, NULL, NULL, 0);
INSERT INTO `cliente` VALUES (2, 'Renzo G', '', 1, NULL, NULL, 0);
INSERT INTO `cliente` VALUES (3, 'Lalo', 'de Lejos', 1, NULL, NULL, 0);
INSERT INTO `cliente` VALUES (7, 'AXXXXXAAS', 'X', 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for marca
-- ----------------------------
DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `proveedorId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Marca_proveedorId_fkey`(`proveedorId`) USING BTREE,
  CONSTRAINT `Marca_proveedorId_fkey` FOREIGN KEY (`proveedorId`) REFERENCES `proveedor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of marca
-- ----------------------------
INSERT INTO `marca` VALUES (1, 'Ambar', 'Etc, etc, etc ...', 1, NULL);
INSERT INTO `marca` VALUES (2, 'Saphirus', '', 1, NULL);
INSERT INTO `marca` VALUES (3, 'Iciar', 'Perfumes', 1, NULL);
INSERT INTO `marca` VALUES (4, 'X Test', 'X', 1, NULL);
INSERT INTO `marca` VALUES (5, 'Cat XXX', 'X', 1, NULL);
INSERT INTO `marca` VALUES (12, 'AM', 'AM', 1, NULL);
INSERT INTO `marca` VALUES (13, 'asda', 'da', 1, NULL);
INSERT INTO `marca` VALUES (14, 'AAASSSSS', '', 1, NULL);

-- ----------------------------
-- Table structure for pago
-- ----------------------------
DROP TABLE IF EXISTS `pago`;
CREATE TABLE `pago`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clienteId` int(11) NOT NULL,
  `monto` double NOT NULL,
  `fecha` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nota` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Pago_clienteId_fkey`(`clienteId`) USING BTREE,
  CONSTRAINT `Pago_clienteId_fkey` FOREIGN KEY (`clienteId`) REFERENCES `cliente` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productoId` int(11) NOT NULL,
  `clienteId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `pricio` double NOT NULL,
  `total` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `precio` double NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `categoriaId` int(11) NOT NULL,
  `marcaId` int(11) NOT NULL,
  `proveedorId` int(11) NOT NULL,
  `ventaId` int(11) NULL DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productos_categoriaId_fkey`(`categoriaId`) USING BTREE,
  INDEX `productos_marcaId_fkey`(`marcaId`) USING BTREE,
  INDEX `productos_proveedorId_fkey`(`proveedorId`) USING BTREE,
  INDEX `productos_ventaId_fkey`(`ventaId`) USING BTREE,
  CONSTRAINT `productos_categoriaId_fkey` FOREIGN KEY (`categoriaId`) REFERENCES `categoria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `productos_marcaId_fkey` FOREIGN KEY (`marcaId`) REFERENCES `marca` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `productos_proveedorId_fkey` FOREIGN KEY (`proveedorId`) REFERENCES `proveedor` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `productos_ventaId_fkey` FOREIGN KEY (`ventaId`) REFERENCES `venta` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 'Difusor', NULL, 100, 5, 1, 1, 1, 1, NULL, '2023-05-19 14:12:26.582', '2023-05-19 14:11:57.553');
INSERT INTO `productos` VALUES (2, 'SQAERT', 'KL', 40.53, 10, 1, 2, 2, 1, NULL, '2023-05-19 15:04:33.382', '2023-05-19 15:04:33.382');
INSERT INTO `productos` VALUES (3, 'Naranja', '', 200, 5, 1, 3, 4, 2, NULL, '2023-05-19 21:10:32.497', '2023-05-19 21:10:32.497');
INSERT INTO `productos` VALUES (4, '212 - 60 ml', '', 500.5, 6, 1, 2, 5, 3, NULL, '2023-05-19 21:54:27.333', '2023-05-19 21:54:27.333');
INSERT INTO `productos` VALUES (5, 'AD RT', 'X', 5.55, 2, 1, 11, 1, 3, NULL, '2023-05-26 14:08:49.668', '2023-05-26 14:08:49.668');
INSERT INTO `productos` VALUES (6, '212', '', 65.75, 2, 1, 4, 2, 2, NULL, '2023-05-26 19:04:23.352', '2023-05-26 19:04:23.352');
INSERT INTO `productos` VALUES (7, 'Limon', '', 45.45, 3, 1, 3, 3, 1, NULL, '2023-05-26 19:06:30.294', '2023-05-26 19:06:30.294');
INSERT INTO `productos` VALUES (8, 'XXX', '', 56, 8, 1, 4, 2, 3, NULL, '2023-05-26 19:36:03.796', '2023-05-26 19:36:03.796');
INSERT INTO `productos` VALUES (9, 'Pomelo', '', 123, 78, 1, 3, 1, 1, NULL, '2023-05-26 19:37:33.342', '2023-05-26 19:37:33.342');
INSERT INTO `productos` VALUES (10, 'QSA', '', 123, 56, 1, 3, 3, 2, NULL, '2023-05-26 19:39:18.922', '2023-05-26 19:39:18.922');
INSERT INTO `productos` VALUES (11, 'aaaaaa', '', 3, 4, 1, 3, 3, 2, NULL, '2023-05-26 19:40:57.399', '2023-05-26 19:40:57.399');

-- ----------------------------
-- Table structure for proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `telefono` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
INSERT INTO `proveedor` VALUES (1, 'Proveedor 01', 'P01', 1, 'mail@host.com', '123456789');
INSERT INTO `proveedor` VALUES (2, 'Santo Toto', 'ST', 1, NULL, NULL);
INSERT INTO `proveedor` VALUES (3, 'Pedro', 'de por ahi', 1, NULL, NULL);
INSERT INTO `proveedor` VALUES (4, 'Pro 02', '02', 1, NULL, NULL);
INSERT INTO `proveedor` VALUES (5, 'ASA', '', 0, NULL, NULL);

-- ----------------------------
-- Table structure for venta
-- ----------------------------
DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(3) NULL DEFAULT CURRENT_TIMESTAMP,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 0,
  `clienteId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Venta_clienteId_fkey`(`clienteId`) USING BTREE,
  CONSTRAINT `Venta_clienteId_fkey` FOREIGN KEY (`clienteId`) REFERENCES `cliente` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
