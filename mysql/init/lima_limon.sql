/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : lima_limon

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 21/05/2023 11:30:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES (1, 'Cat', 'TEst', 1);

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `telefono` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deuda` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES (1, 'Cliente', 'CX', 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for marca
-- ----------------------------
DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `proveedorId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Marca_proveedorId_fkey`(`proveedorId`) USING BTREE,
  CONSTRAINT `Marca_proveedorId_fkey` FOREIGN KEY (`proveedorId`) REFERENCES `proveedor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marca
-- ----------------------------
INSERT INTO `marca` VALUES (1, 'Marca', 'M Test', 1, NULL);

-- ----------------------------
-- Table structure for pago
-- ----------------------------
DROP TABLE IF EXISTS `pago`;
CREATE TABLE `pago`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `clienteId` int NOT NULL,
  `monto` double NOT NULL,
  `fecha` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `nota` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Pago_clienteId_fkey`(`clienteId`) USING BTREE,
  CONSTRAINT `Pago_clienteId_fkey` FOREIGN KEY (`clienteId`) REFERENCES `cliente` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pago
-- ----------------------------

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `productoId` int NOT NULL,
  `clienteId` int NOT NULL,
  `cantidad` int NOT NULL,
  `pricio` double NOT NULL,
  `total` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pedidos
-- ----------------------------

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `precio` double NOT NULL DEFAULT 0,
  `stock` int NOT NULL DEFAULT 0,
  `estado` tinyint(1) NULL DEFAULT 1,
  `categoriaId` int NOT NULL,
  `marcaId` int NOT NULL,
  `proveedorId` int NOT NULL,
  `ventaId` int NULL DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 'Producto', 'KL', 100, 5, 1, 1, 1, 1, NULL, '2023-05-21 14:02:12.695', '2023-05-21 14:01:39.613');
INSERT INTO `productos` VALUES (2, 'QLGO', '', 150.5, 6, 1, 1, 1, 1, NULL, '2023-05-21 14:27:06.772', '2023-05-21 14:27:06.772');

-- ----------------------------
-- Table structure for proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `telefono` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
INSERT INTO `proveedor` VALUES (1, 'Proveedor', 'P', 1, NULL, NULL);

-- ----------------------------
-- Table structure for venta
-- ----------------------------
DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime(3) NULL DEFAULT current_timestamp(3),
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 0,
  `clienteId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Venta_clienteId_fkey`(`clienteId`) USING BTREE,
  CONSTRAINT `Venta_clienteId_fkey` FOREIGN KEY (`clienteId`) REFERENCES `cliente` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of venta
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
