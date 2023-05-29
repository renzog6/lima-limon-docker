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

 Date: 29/05/2023 17:05:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for _marcatoproveedor
-- ----------------------------
DROP TABLE IF EXISTS `_marcatoproveedor`;
CREATE TABLE `_marcatoproveedor`  (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE INDEX `_MarcaToProveedor_AB_unique`(`A`, `B`) USING BTREE,
  INDEX `_MarcaToProveedor_B_index`(`B`) USING BTREE,
  CONSTRAINT `_MarcaToProveedor_A_fkey` FOREIGN KEY (`A`) REFERENCES `marcas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_MarcaToProveedor_B_fkey` FOREIGN KEY (`B`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES (1, 'SDad', '', 1);

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `telefono` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deuda` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 'SAD', '', 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for marcas
-- ----------------------------
DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of marcas
-- ----------------------------
INSERT INTO `marcas` VALUES (1, 'DASDSAD', '', 1);

-- ----------------------------
-- Table structure for pagos
-- ----------------------------
DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clienteId` int(11) NOT NULL,
  `monto` double NOT NULL,
  `fecha` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nota` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pagos_clienteId_fkey`(`clienteId`) USING BTREE,
  CONSTRAINT `pagos_clienteId_fkey` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
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
  `precio` double NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
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
  CONSTRAINT `productos_categoriaId_fkey` FOREIGN KEY (`categoriaId`) REFERENCES `categorias` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `productos_marcaId_fkey` FOREIGN KEY (`marcaId`) REFERENCES `marcas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `productos_proveedorId_fkey` FOREIGN KEY (`proveedorId`) REFERENCES `proveedores` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `productos_ventaId_fkey` FOREIGN KEY (`ventaId`) REFERENCES `ventas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 'Renzo', '', 12, 2, 1, 1, 1, 1, NULL, '2023-05-29 19:34:34.801', '2023-05-29 19:34:34.801');

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 1,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `telefono` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES (1, 'zxaASa', '', 1, NULL, NULL);

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(3) NULL DEFAULT CURRENT_TIMESTAMP,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT 0,
  `clienteId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Venta_clienteId_fkey`(`clienteId`) USING BTREE,
  CONSTRAINT `Venta_clienteId_fkey` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
