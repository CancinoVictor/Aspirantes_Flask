/*
 Navicat Premium Data Transfer

 Source Server         : Local_Server
 Source Server Type    : MySQL
 Source Server Version : 100432
 Source Host           : 127.0.0.1:3306
 Source Schema         : db_cursos

 Target Server Type    : MySQL
 Target Server Version : 100432
 File Encoding         : 65001

 Date: 27/06/2024 14:56:13
*/
CREATE DATABASE IF NOT EXISTS db_cursos;
USE db_cursos;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
SET sql_mode = '';

-- ----------------------------
-- Table structure for aspirantes
-- ----------------------------
DROP TABLE IF EXISTS `aspirantes`;
CREATE TABLE `aspirantes`  (
  `RFC` char(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ID_EMPRESA` int(11) NULL DEFAULT NULL,
  `NOMBRE` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PATERNO` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `MATERNO` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TELEFONO` bigint(20) NULL DEFAULT NULL,
  `EMAIL` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `FECHA_REGISTRO` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`RFC`) USING BTREE,
  INDEX `fk_empresa_aspirantes`(`ID_EMPRESA`) USING BTREE,
  CONSTRAINT `fk_empresa_aspirantes` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `empresa` (`ID_EMPRESA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aspirantes
-- ----------------------------
INSERT INTO `aspirantes` VALUES ('PETD740714111', 3, 'DAVID', 'PEREZ', 'PEREZ', 8441013994, 'slashpage15@hotmail.com', '2023-11-06 18:55:31');
INSERT INTO `aspirantes` VALUES ('PETE740714000', 2, 'FIDEL', 'PEREZ', 'GARCIA', 9567757307, 'pereztinocodavid@gmail.com', '2024-04-06 10:42:25');
INSERT INTO `aspirantes` VALUES ('PETE740714810', 1, 'PEPITO', 'PEPO', 'PEPON', 8441013994, 'slashpage15@hotmail.com', '2023-11-14 18:48:49');
INSERT INTO `aspirantes` VALUES ('PETE7407148X1', 2, 'DAVID', 'PEREZ', 'PEREZ', 8441013994, 'slashpage15@hotmail.com', '2023-11-06 18:51:55');

-- ----------------------------
-- Table structure for aspirantes_cursos
-- ----------------------------
DROP TABLE IF EXISTS `aspirantes_cursos`;
CREATE TABLE `aspirantes_cursos`  (
  `ID_CURSO` int(11) NOT NULL,
  `RFC` char(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FECHA_REGISTRO` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CURSO`, `RFC`) USING BTREE,
  INDEX `FK_ASPIRANTES_CURSOS2`(`RFC`) USING BTREE,
  INDEX `FK_ASPIRANTES_CURSO`(`ID_CURSO`) USING BTREE,
  CONSTRAINT `FK_ASPIRANTES_CURSOS2` FOREIGN KEY (`RFC`) REFERENCES `aspirantes` (`RFC`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_aspirante_curso` FOREIGN KEY (`ID_CURSO`) REFERENCES `catalogo_curso` (`ID_CURSO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aspirantes_cursos
-- ----------------------------
INSERT INTO `aspirantes_cursos` VALUES (1, 'PETE740714000', '2024-04-06 10:42:25');
INSERT INTO `aspirantes_cursos` VALUES (1, 'PETE7407148X1', '2023-11-06 18:53:01');
INSERT INTO `aspirantes_cursos` VALUES (8, 'PETE7407148X1', '2023-11-06 18:55:52');
INSERT INTO `aspirantes_cursos` VALUES (13, 'PETD740714111', '2023-11-06 18:55:31');
INSERT INTO `aspirantes_cursos` VALUES (15, 'PETE7407148X1', '2023-11-06 18:55:45');
INSERT INTO `aspirantes_cursos` VALUES (16, 'PETE740714810', '2023-11-14 18:48:49');
INSERT INTO `aspirantes_cursos` VALUES (16, 'PETE7407148X1', '2023-11-06 18:51:55');
INSERT INTO `aspirantes_cursos` VALUES (17, 'PETD740714111', '2023-11-14 18:42:30');

-- ----------------------------
-- Table structure for catalogo_curso
-- ----------------------------
DROP TABLE IF EXISTS `catalogo_curso`;
CREATE TABLE `catalogo_curso`  (
  `ID_CURSO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_CURSO` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `FECHA_ALTA` date NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CURSO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalogo_curso
-- ----------------------------
INSERT INTO `catalogo_curso` VALUES (1, 'python 5', '2024-03-11');
INSERT INTO `catalogo_curso` VALUES (4, 'ANGULAR 12', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (5, 'Administración de redes y sistemas.', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (6, 'PATRONES DE DISEÑOS', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (8, 'Computación en la nube.', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (9, 'Desarrollo de software.', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (10, 'Desarrollo móvil.', '2023-12-24');
INSERT INTO `catalogo_curso` VALUES (11, 'Desarrollo web.', '2023-12-24');
INSERT INTO `catalogo_curso` VALUES (12, 'DevOps.', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (13, 'Gestión de base de datos', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (14, 'Diseño web', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (15, 'Programación web', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (16, 'Introducción a Photoshop, Blender o cualquier otro software', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (17, 'Uso de Word, Excel, etc.', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (18, 'Programación para niños', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (19, 'Desarrollo móvil', '2023-10-28');
INSERT INTO `catalogo_curso` VALUES (20, 'Crear un sitio web sin conocimientos técnicos', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (21, 'Análisis de datos', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (22, 'Modelado e impresión 3D', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (23, 'Ciberseguridad', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (24, 'Construir una casa inteligente', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (25, 'Reparación de un ordenador, móvil, etc.', '2023-10-24');
INSERT INTO `catalogo_curso` VALUES (26, 'XCZXCXZCXZC', '2023-11-07');
INSERT INTO `catalogo_curso` VALUES (27, 'DALAY', '2023-11-07');
INSERT INTO `catalogo_curso` VALUES (28, 'ALGOO', '2023-11-07');
INSERT INTO `catalogo_curso` VALUES (29, 'JOSE', '2023-11-07');
INSERT INTO `catalogo_curso` VALUES (30, 'WWWWWW', '2023-11-07');
INSERT INTO `catalogo_curso` VALUES (31, 'MAIRO', '2023-11-07');
INSERT INTO `catalogo_curso` VALUES (32, 'EEEEE', '2023-11-07');
INSERT INTO `catalogo_curso` VALUES (34, 'YYYY', '2023-11-07');
INSERT INTO `catalogo_curso` VALUES (54, 'DAVID PEREZ TINO', '2023-11-14');
INSERT INTO `catalogo_curso` VALUES (59, 'HUMANIDADES III', '2023-11-15');
INSERT INTO `catalogo_curso` VALUES (60, 'PLASTILINA I', '2023-11-15');
INSERT INTO `catalogo_curso` VALUES (61, 'PLASTILINA 1', '2021-01-01');
INSERT INTO `catalogo_curso` VALUES (62, 'PLASTILINA 1', '0000-00-00');
INSERT INTO `catalogo_curso` VALUES (63, 'PLASTILINA 1', '2021-01-01');
INSERT INTO `catalogo_curso` VALUES (64, 'PLASTILINA 1', '2021-01-01');
INSERT INTO `catalogo_curso` VALUES (65, 'PLASTILINA 1', '2021-01-01');
INSERT INTO `catalogo_curso` VALUES (66, 'PLASTILINA 1', '2021-01-01');
INSERT INTO `catalogo_curso` VALUES (67, 'PLASTILINA 1', '0000-00-00');
INSERT INTO `catalogo_curso` VALUES (68, 'PLASTILINA 1', '0000-00-00');
INSERT INTO `catalogo_curso` VALUES (73, 'HUMANIDADES II', '2024-04-06');

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa`  (
  `ID_EMPRESA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_EMPRESA` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_EMPRESA`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES (1, 'COCA COLA');
INSERT INTO `empresa` VALUES (2, 'MAGNA ACEITES');
INSERT INTO `empresa` VALUES (3, 'HEXAWARE');
INSERT INTO `empresa` VALUES (4, 'CIEL');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `usuario` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pwd` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`usuario`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('tino', '123', 'DAVID PEREZ TINOCO');

SET FOREIGN_KEY_CHECKS = 1;