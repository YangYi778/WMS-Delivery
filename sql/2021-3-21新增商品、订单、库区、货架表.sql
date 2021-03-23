/*
 Navicat Premium Data Transfer

 Source Server         : MySQL57
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 23/03/2021 11:05:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'order_info', '订单主表', NULL, NULL, 'OrderInfo', 'crud', 'com.ruoyi.system', 'system', 'orderMenu', '订单管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1061\"}', 'admin', '2021-03-22 14:01:45', '', '2021-03-22 15:57:11', NULL);
INSERT INTO `gen_table` VALUES (2, 'good_info', '商品信息表', '', '', 'GoodInfo', 'crud', 'com.ruoyi.system', 'system', 'goodMenu', '商品管理', 'HelloWorld', '0', '/', '{\"parentMenuId\":\"1061\"}', 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29', NULL);
INSERT INTO `gen_table` VALUES (3, 'storage_info', '库区信息表', NULL, NULL, 'StorageInfo', 'crud', 'com.ruoyi.system', 'system', 'storageMenu', '库区管理', 'HelloWorld', '0', '/', '{\"parentMenuId\":\"1061\"}', 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13', NULL);
INSERT INTO `gen_table` VALUES (4, 'shelf_info', '货架信息表', NULL, NULL, 'ShelfInfo', 'crud', 'com.ruoyi.system', 'system', 'shelfMenu', '货架管理', 'HelloWorld', '0', '/', '{\"parentMenuId\":\"1061\"}', 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (40, '1', 'order_priority', '订单优先级', 'int(11)', 'Long', 'orderPriority', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'order_priority', 40, 'admin', '2021-03-22 14:01:46', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (41, '1', 'plan_delivery_time', '计划出库时间', 'datetime', 'Date', 'planDeliveryTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 41, 'admin', '2021-03-22 14:01:46', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (45, '1', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (46, '1', 'batch_no', '波次号', 'varchar(20)', 'String', 'batchNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (47, '1', 'order_no', '订单号', 'varchar(20)', 'String', 'orderNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (48, '1', 'order_type', '订单类型', 'varchar(15)', 'String', 'orderType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'order_type', 4, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (49, '1', 'order_status', '订单状态', 'int(4)', 'Integer', 'orderStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'order_status', 5, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (50, '1', 'order_origin', '订单来源', 'varchar(10)', 'String', 'orderOrigin', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'order_origin', 6, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (51, '1', 'order_level', '订单等级', 'varchar(10)', 'String', 'orderLevel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'order_level', 7, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (52, '1', 'cust_no', '客户编码', 'varchar(20)', 'String', 'custNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (53, '1', 'cust_name', '客户名称', 'varchar(20)', 'String', 'custName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 9, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (54, '1', 'total_volume', '订单总体积', 'decimal(10,2)', 'BigDecimal', 'totalVolume', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (55, '1', 'total_weight', '订单总重量', 'decimal(10,2)', 'BigDecimal', 'totalWeight', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (56, '1', 'uuid', '防重码', 'varchar(60)', 'String', 'uuid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (57, '1', 'rece_name', '收货人', 'varchar(20)', 'String', 'receName', '0', '0', '1', '1', '1', '1', NULL, 'LIKE', 'input', '', 13, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (58, '1', 'rece_phone', '收货人联系电话', 'varchar(20)', 'String', 'recePhone', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 14, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (59, '1', 'rece_address', '收货人地址', 'varchar(100)', 'String', 'receAddress', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 15, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (60, '1', 'hodept_name', '交接部门名称', 'varchar(50)', 'String', 'hodeptName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 17, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (61, '1', 'hodept_no', '交接部门编码', 'varchar(50)', 'String', 'hodeptNo', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 18, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (62, '1', 'houser_name', '交接人姓名', 'varchar(50)', 'String', 'houserName', '0', '0', '1', '1', '1', '1', NULL, 'LIKE', 'input', '', 19, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (63, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 21, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (64, '1', 'create_user', '创建人', 'varchar(20)', 'String', 'createUser', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 22, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (65, '1', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, '1', NULL, NULL, 'EQ', 'datetime', '', 23, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (66, '1', 'update_user', '修改人', 'varchar(20)', 'String', 'updateUser', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 24, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (67, '1', 'yn', '删除标记位', 'tinyint(4)', 'Integer', 'yn', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 25, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (68, '1', 'ts', '时间戳', 'timestamp', 'Date', 'ts', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 26, '', '2021-03-22 14:05:27', '', '2021-03-22 15:57:11');
INSERT INTO `gen_table_column` VALUES (69, '2', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (72, '2', 'batch_no', '波次号', 'varchar(20)', 'String', 'batchNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (73, '2', 'order_no', '订单号', 'varchar(20)', 'String', 'orderNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (74, '2', 'good_no', '商品编码', 'varchar(20)', 'String', 'goodNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (75, '2', 'good_name', '商品名称', 'varchar(50)', 'String', 'goodName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (78, '2', 'inventory_num', '库存总数', 'int(11)', 'Long', 'inventoryNum', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (79, '2', 'defect_num', '残次数量', 'int(11)', 'Long', 'defectNum', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (80, '2', 'frozen_num', '冻结数量', 'int(11)', 'Long', 'frozenNum', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (81, '2', 'inventory_type', '库存类型', 'varchar(10)', 'String', 'inventoryType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'storage_type', 13, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (82, '2', 'product_time', '生产日期', 'datetime', 'Date', 'productTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (83, '2', 'expiry_time', '失效日期', 'datetime', 'Date', 'expiryTime', '0', '0', '1', '1', '1', '1', '1', 'GTE', 'datetime', '', 15, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (84, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (85, '2', 'create_user', '创建人', 'varchar(20)', 'String', 'createUser', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (86, '2', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (87, '2', 'update_user', '修改人', 'varchar(20)', 'String', 'updateUser', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (88, '2', 'yn', '删除标记位。0：无效，1：有效', 'tinyint(4)', 'Integer', 'yn', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (89, '2', 'ts', '时间戳', 'timestamp', 'Date', 'ts', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 21, 'admin', '2021-03-22 15:33:59', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (90, '3', 'id', '自增id', 'int(11)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13');
INSERT INTO `gen_table_column` VALUES (91, '3', 'storage_no', '库区编号', 'varchar(20)', 'String', 'storageNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13');
INSERT INTO `gen_table_column` VALUES (92, '3', 'storage_name', '库区名称', 'varchar(20)', 'String', 'storageName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13');
INSERT INTO `gen_table_column` VALUES (93, '3', 'storage_type', '库区类型', 'varchar(15)', 'String', 'storageType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'storage_type', 4, 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13');
INSERT INTO `gen_table_column` VALUES (94, '3', 'storage_status', '库区状态', 'int(4)', 'Integer', 'storageStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'status', 5, 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13');
INSERT INTO `gen_table_column` VALUES (95, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13');
INSERT INTO `gen_table_column` VALUES (96, '3', 'create_user', '创建人', 'varchar(20)', 'String', 'createUser', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13');
INSERT INTO `gen_table_column` VALUES (97, '3', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13');
INSERT INTO `gen_table_column` VALUES (98, '3', 'update_user', '修改人', 'varchar(20)', 'String', 'updateUser', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13');
INSERT INTO `gen_table_column` VALUES (99, '3', 'yn', '删除标记位', 'tinyint(4)', 'Integer', 'yn', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13');
INSERT INTO `gen_table_column` VALUES (100, '3', 'ts', '时间戳', 'timestamp', 'Date', 'ts', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2021-03-22 18:58:13', '', '2021-03-23 09:29:13');
INSERT INTO `gen_table_column` VALUES (101, '2', 'storage_no', '库区编号', 'varchar(20)', 'String', 'storageNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2021-03-23 08:45:21', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (102, '2', 'shelf_no', '库位编号', 'varchar(20)', 'String', 'shelfNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2021-03-23 08:45:21', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (103, '2', 'shelf_position', '货架位置', 'varchar(10)', 'String', 'shelfPosition', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, '', '2021-03-23 08:45:21', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (104, '2', 'uuid', '订单防重码', 'varchar(40)', 'String', 'uuid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, '', '2021-03-23 08:45:21', '', '2021-03-23 09:06:29');
INSERT INTO `gen_table_column` VALUES (105, '4', 'id', '自增主键', 'int(11)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (106, '4', 'storage_no', '库区编号', 'varchar(20)', 'String', 'storageNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (107, '4', 'shelf_no', '货架编号', 'varchar(20)', 'String', 'shelfNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (108, '4', 'shelf_name', '货架名称', 'varchar(20)', 'String', 'shelfName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (109, '4', 'shelf_type', '货架类型', 'int(10)', 'Integer', 'shelfType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'shelf_type', 5, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (110, '4', 'shelf_status', '货架状态', 'int(4)', 'Integer', 'shelfStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'status', 6, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (111, '4', 'shelf_row', '货架层数', 'int(4)', 'Integer', 'shelfRow', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (112, '4', 'shelf_col', '货架列数', 'int(4)', 'Integer', 'shelfCol', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (113, '4', 'shelf_spec', '货架规格', 'varchar(15)', 'String', 'shelfSpec', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (114, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (115, '4', 'create_user', '创建人', 'varchar(20)', 'String', 'createUser', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (116, '4', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (117, '4', 'update_user', '修改人', 'varchar(20)', 'String', 'updateUser', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (118, '4', 'yn', '删除标记位', 'tinyint(4)', 'Integer', 'yn', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');
INSERT INTO `gen_table_column` VALUES (119, '4', 'ts', '时间戳', 'timestamp', 'Date', 'ts', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2021-03-23 09:17:41', '', '2021-03-23 09:25:24');

-- ----------------------------
-- Table structure for good_info
-- ----------------------------
DROP TABLE IF EXISTS `good_info`;
CREATE TABLE `good_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `storage_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '库区编号',
  `shelf_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '库位编号',
  `batch_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '波次号',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `good_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品编码',
  `good_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `shelf_position` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '货架位置',
  `inventory_num` int(11) NULL DEFAULT NULL COMMENT '库存总数',
  `defect_num` int(11) NULL DEFAULT NULL COMMENT '残次数量',
  `frozen_num` int(11) NULL DEFAULT NULL COMMENT '冻结数量',
  `inventory_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库存类型',
  `uuid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单防重码',
  `product_time` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '生产日期',
  `expiry_time` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '失效日期',
  `create_time` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建时间',
  `create_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '修改时间',
  `update_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `yn` tinyint(4) NOT NULL DEFAULT 1 COMMENT '删除标记位',
  `ts` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `good_no`(`good_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of good_info
-- ----------------------------
INSERT INTO `good_info` VALUES (1, 'C1101110112001', 'DP001001', '110112402567', '1616402567100001 ', '1000001100010', 'test', '001001122', 23, 1, 1, '0', '1001001001001', '2021-03-22 00:00:00', '2021-03-31 00:00:00', '2021-03-23 09:05:19', '', '1900-01-01 00:00:00', '', 1, '2021-03-23 09:05:19');

-- ----------------------------
-- Table structure for good_order
-- ----------------------------
DROP TABLE IF EXISTS `good_order`;
CREATE TABLE `good_order`  (
  `good_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  PRIMARY KEY (`good_no`, `order_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `batch_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '波次号',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `order_type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单类型',
  `order_status` int(4) NOT NULL DEFAULT 0 COMMENT '订单状态',
  `order_origin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单来源',
  `order_level` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单等级',
  `cust_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户编码',
  `cust_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户名称',
  `total_volume` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总体积',
  `total_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总重量',
  `uuid` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '防重码',
  `rece_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人',
  `rece_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人联系电话',
  `rece_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人地址',
  `order_priority` int(11) NULL DEFAULT 0 COMMENT '订单优先级',
  `hodept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交接部门名称',
  `hodept_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交接部门编码',
  `houser_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交接人姓名',
  `plan_delivery_time` datetime(0) NULL DEFAULT '1900-01-01 00:00:00' COMMENT '计划出库时间',
  `create_time` datetime(0) NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建时间',
  `create_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT '1900-01-01 00:00:00' COMMENT '修改时间',
  `update_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改人',
  `yn` tinyint(4) NOT NULL DEFAULT 1 COMMENT '删除标记位',
  `ts` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES (1, '0010010001', 'ESL0010010001', '1', 0, '0', '1', 'CUS0010010001', 'test', 23.00, 50.00, '000100010001', 'test', '10086', '河北省秦皇岛市海港区', 2, 'TMS', '青龙运输系统', 'test', '2021-03-23 00:00:00', '2021-03-22 15:20:33', 'test', '1900-01-01 00:00:00', 'test', 1, '2021-03-22 15:20:32');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001777B82BE7078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001777B82BE7078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001777B82BE7078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', '卡米1616463647575', 1616468731091, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1616463650000, -1, 5, 'PAUSED', 'CRON', 1616463647000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1616463660000, -1, 5, 'PAUSED', 'CRON', 1616463647000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1616463660000, -1, 5, 'PAUSED', 'CRON', 1616463647000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for shelf_info
-- ----------------------------
DROP TABLE IF EXISTS `shelf_info`;
CREATE TABLE `shelf_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `storage_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '库区编号',
  `shelf_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '货架编号',
  `shelf_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '货架名称',
  `shelf_type` int(10) NOT NULL DEFAULT 0 COMMENT '货架类型',
  `shelf_status` int(4) NOT NULL DEFAULT 1 COMMENT '货架状态',
  `shelf_row` int(4) NOT NULL DEFAULT 0 COMMENT '货架层数',
  `shelf_col` int(4) NOT NULL DEFAULT 0 COMMENT '货架列数',
  `shelf_spec` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '货架规格',
  `create_time` datetime(0) NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建时间',
  `create_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT '1900-01-01 00:00:00' COMMENT '修改时间',
  `update_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改人',
  `yn` tinyint(4) NOT NULL DEFAULT 1 COMMENT '删除标记位',
  `ts` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shelf_no`(`shelf_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '货架信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shelf_info
-- ----------------------------
INSERT INTO `shelf_info` VALUES (1, 'C1101110112001', 'DP001001', 'test', 1, 1, 6, 24, '12*0.5*6', '2021-03-23 09:44:34', '', '1900-01-01 00:00:00', '', 1, '2021-03-23 09:44:34');

-- ----------------------------
-- Table structure for storage_info
-- ----------------------------
DROP TABLE IF EXISTS `storage_info`;
CREATE TABLE `storage_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `storage_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '库区编号',
  `storage_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '库区名称',
  `storage_type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '库区类型',
  `storage_status` int(4) NOT NULL DEFAULT 1 COMMENT '库区状态',
  `create_time` datetime(0) NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建时间',
  `create_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT '1900-01-01 00:00:00' COMMENT '修改时间',
  `update_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改人',
  `yn` tinyint(4) NOT NULL DEFAULT 1 COMMENT '删除标记位',
  `ts` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `storage_no`(`storage_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库区信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storage_info
-- ----------------------------
INSERT INTO `storage_info` VALUES (1, 'C1101110112001', '常温一号库区', '0', 1, '2021-03-22 19:11:00', '', '1900-01-01 00:00:00', '', 1, '2021-03-22 19:10:59');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-02-07 16:01:42', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-02-07 16:01:42', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-02-07 16:01:42', '', NULL, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-07 16:01:38', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-07 16:01:38', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-07 16:01:38', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-07 16:01:38', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-07 16:01:38', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-07 16:01:38', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-07 16:01:38', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-07 16:01:38', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-07 16:01:38', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-07 16:01:38', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-02-07 16:01:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 1, '高', '1', 'order_priority', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:14:07', '', NULL, '高优先级');
INSERT INTO `sys_dict_data` VALUES (30, 1, '普通', '2', 'order_priority', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:14:20', '', NULL, '正常优先级');
INSERT INTO `sys_dict_data` VALUES (31, 1, '低', '3', 'order_priority', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:14:31', '', NULL, '低优先级');
INSERT INTO `sys_dict_data` VALUES (32, 1, '普通订单', '1', 'order_type', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:15:45', '', NULL, '普通订单类型');
INSERT INTO `sys_dict_data` VALUES (33, 1, '爆品订单', '2', 'order_type', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:15:56', '', NULL, '爆品订单');
INSERT INTO `sys_dict_data` VALUES (34, 1, '大宗订单', '3', 'order_type', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:16:13', '', NULL, '大宗货物订单');
INSERT INTO `sys_dict_data` VALUES (35, 1, '供应商订单', '4', 'order_type', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:16:25', '', NULL, '供应商订单');
INSERT INTO `sys_dict_data` VALUES (43, 1, '自营', '0', 'order_origin', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:42:14', '', NULL, '自营，通过自己的营销平台下发的订单');
INSERT INTO `sys_dict_data` VALUES (44, 1, '第三方', '1', 'order_origin', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:42:56', '', NULL, '第三方，用于其他平台或接入的应用下发的订单');
INSERT INTO `sys_dict_data` VALUES (45, 1, '供应商', '2', 'order_origin', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:43:26', '', NULL, '供应商订单');
INSERT INTO `sys_dict_data` VALUES (46, 1, '爆品订单', '0', 'order_level', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:46:18', '', NULL, '爆品订单，下单频繁且成交额大于某一阈值的订单');
INSERT INTO `sys_dict_data` VALUES (47, 1, '普通订单', '1', 'order_level', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:46:48', '', NULL, '普通订单');
INSERT INTO `sys_dict_data` VALUES (48, 1, '冷门订单', '2', 'order_level', NULL, NULL, 'N', '0', 'admin', '2021-03-22 14:47:14', '', NULL, '冷门订单，订单数量较少且长期较为稳定的订单');
INSERT INTO `sys_dict_data` VALUES (49, 1, '常温库区', '0', 'storage_type', NULL, NULL, 'N', '0', 'admin', '2021-03-22 15:37:31', '', NULL, '常温库区，用于存放常温环境下的商品');
INSERT INTO `sys_dict_data` VALUES (50, 1, '冷藏库区', '1', 'storage_type', NULL, NULL, 'N', '0', 'admin', '2021-03-22 15:37:50', '', NULL, '冷藏库区，用于存放低温下保存的商品');
INSERT INTO `sys_dict_data` VALUES (51, 1, '生鲜库区', '2', 'storage_type', NULL, NULL, 'N', '0', 'admin', '2021-03-22 15:38:24', '', NULL, '生鲜库区，用于存放生鲜类商品');
INSERT INTO `sys_dict_data` VALUES (52, 1, '启用', '1', 'status', NULL, NULL, 'N', '0', 'admin', '2021-03-22 19:03:50', '', NULL, '启用');
INSERT INTO `sys_dict_data` VALUES (53, 1, '禁用', '0', 'status', NULL, NULL, 'N', '0', 'admin', '2021-03-22 19:04:04', '', NULL, '禁用');
INSERT INTO `sys_dict_data` VALUES (54, 1, '数码', '1', 'shelf_type', NULL, NULL, 'N', '0', 'admin', '2021-03-23 09:21:06', '', NULL, '数码货架，类型标识DP');
INSERT INTO `sys_dict_data` VALUES (55, 1, '服装', '2', 'shelf_type', NULL, NULL, 'N', '0', 'admin', '2021-03-23 09:21:44', 'admin', '2021-03-23 09:22:43', '服装货架，类型标识CP（cloth production）');
INSERT INTO `sys_dict_data` VALUES (56, 1, '食品', '3', 'shelf_type', NULL, NULL, 'N', '0', 'admin', '2021-03-23 09:22:37', '', NULL, '食品货架，类型标识 FP（food production）');
INSERT INTO `sys_dict_data` VALUES (57, 1, '饮品', '4', 'shelf_type', NULL, NULL, 'N', '0', 'admin', '2021-03-23 09:23:27', '', NULL, '饮品货架，类型标识DP（drink production）');
INSERT INTO `sys_dict_data` VALUES (58, 1, '订单创建', '101', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:47:43', '', NULL, '订单创建完成');
INSERT INTO `sys_dict_data` VALUES (59, 1, '订单取消', '100', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:48:00', '', NULL, '订单取消');
INSERT INTO `sys_dict_data` VALUES (60, 2, '确认受理', '201', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:48:28', '', NULL, '入库状态-确认受理');
INSERT INTO `sys_dict_data` VALUES (61, 2, '生成批次', '202', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:48:50', '', NULL, '入库状态-生成批次');
INSERT INTO `sys_dict_data` VALUES (62, 2, '任务分配', '203', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:49:08', '', NULL, '入库状态-任务分配');
INSERT INTO `sys_dict_data` VALUES (63, 3, '进货上架', '301', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:49:35', '', NULL, '在库状态-进货上架');
INSERT INTO `sys_dict_data` VALUES (64, 3, '返库上架', '302', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:50:00', '', NULL, '在库状态-返库上架');
INSERT INTO `sys_dict_data` VALUES (65, 3, '拣货下架', '303', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:50:18', '', NULL, '在库状态-拣货下架');
INSERT INTO `sys_dict_data` VALUES (66, 4, '复核差异', '401', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:50:42', '', NULL, '出库状态-复核差异');
INSERT INTO `sys_dict_data` VALUES (67, 4, '复核完', '402', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:50:57', '', NULL, '出库状态-复核完成');
INSERT INTO `sys_dict_data` VALUES (68, 4, '打包装箱', '403', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:51:20', '', NULL, '出库状态-打包装箱');
INSERT INTO `sys_dict_data` VALUES (69, 4, '发货交接', '404', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:51:39', '', NULL, '出库状态-发货交接');
INSERT INTO `sys_dict_data` VALUES (70, 5, '订单完成', '501', 'order_status', NULL, NULL, 'N', '0', 'admin', '2021-03-23 10:51:59', '', NULL, '下游状态-订单完成');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-02-07 16:01:41', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-02-07 16:01:41', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-02-07 16:01:41', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-02-07 16:01:41', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-02-07 16:01:41', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-02-07 16:01:41', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-02-07 16:01:41', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-02-07 16:01:41', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-02-07 16:01:41', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-02-07 16:01:41', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '订单优先级', 'order_priority', '0', 'admin', '2021-03-22 14:13:45', '', NULL, '订单优先级，有高（1）、普通（2）、低（3）');
INSERT INTO `sys_dict_type` VALUES (12, '订单类型', 'order_type', '0', 'admin', '2021-03-22 14:15:29', '', NULL, '订单类型，分为普通订单，爆品订单，大宗订单，供应商订单等');
INSERT INTO `sys_dict_type` VALUES (13, '订单状态', 'order_status', '0', 'admin', '2021-03-22 14:17:44', '', NULL, '订单状态，分为待确认（1），待分配，待拣货，待复核，待打包，待发货');
INSERT INTO `sys_dict_type` VALUES (14, '订单来源', 'order_origin', '0', 'admin', '2021-03-22 14:41:48', '', NULL, '订单来源，包括自营，第三方，供应商等（还包括其他合作伙伴）');
INSERT INTO `sys_dict_type` VALUES (15, '订单等级', 'order_level', '0', 'admin', '2021-03-22 14:45:18', '', NULL, '订单等级，包括爆品订单，普通订单，冷门订单');
INSERT INTO `sys_dict_type` VALUES (16, '库区类型', 'storage_type', '0', 'admin', '2021-03-22 15:37:08', 'admin', '2021-03-22 19:00:56', '库存类型，包括常温库区，冷藏库区，生鲜库区等');
INSERT INTO `sys_dict_type` VALUES (17, '启禁状态', 'status', '0', 'admin', '2021-03-22 19:03:34', 'admin', '2021-03-23 09:25:05', '状态，包括启用，禁用');
INSERT INTO `sys_dict_type` VALUES (18, '货架类型', 'shelf_type', '0', 'admin', '2021-03-23 09:20:33', '', NULL, '货架类型，包括数码货架，服装货架，食品、饮品货架等');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-02-07 16:01:42', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-02-07 16:01:42', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-02-07 16:01:42', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-08 10:44:50');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-08 10:44:58');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-02-09 15:30:50');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2021-02-09 15:32:39');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-02-09 15:40:15');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-02-09 15:40:46');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-09 15:40:57');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 10', '0', '登录成功', '2021-02-09 15:44:45');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-08 07:43:31');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-22 09:22:13');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-22 14:01:31');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-22 14:58:13');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-22 14:58:17');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-03-22 17:14:54');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-22 17:14:59');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-22 18:58:02');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-23 08:45:13');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-23 10:15:58');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1088 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-02-07 16:01:39', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-02-07 16:01:39', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-02-07 16:01:39', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2021-02-07 16:01:39', 'admin', '2021-03-22 09:22:33', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-02-07 16:01:39', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-02-07 16:01:39', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-02-07 16:01:39', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-02-07 16:01:39', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-02-07 16:01:39', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-02-07 16:01:39', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-02-07 16:01:39', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-02-07 16:01:39', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-02-07 16:01:39', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-02-07 16:01:39', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-02-07 16:01:39', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-02-07 16:01:39', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-02-07 16:01:39', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-02-07 16:01:39', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-02-07 16:01:39', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-02-07 16:01:39', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-02-07 16:01:39', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-02-07 16:01:39', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-02-07 16:01:39', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-02-07 16:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '基础信息管理', 0, 1, 'masterBasic', NULL, 1, 0, 'M', '0', '0', '', 'job', 'admin', '2021-03-22 09:26:44', 'admin', '2021-03-22 15:16:50', '');
INSERT INTO `sys_menu` VALUES (1063, '订单管理', 1061, 1, 'orderMenu', 'system/orderMenu/index', 1, 0, 'C', '0', '0', 'system:orderMenu:list', 'form', 'admin', '2021-03-22 14:59:46', 'admin', '2021-03-22 15:16:42', '订单管理菜单');
INSERT INTO `sys_menu` VALUES (1064, '订单管理查询', 1063, 1, '#', '', 1, 0, 'F', '0', '0', 'system:orderMenu:query', '#', 'admin', '2021-03-22 14:59:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '订单管理新增', 1063, 2, '#', '', 1, 0, 'F', '0', '0', 'system:orderMenu:add', '#', 'admin', '2021-03-22 14:59:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, '订单管理修改', 1063, 3, '#', '', 1, 0, 'F', '0', '0', 'system:orderMenu:edit', '#', 'admin', '2021-03-22 14:59:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1067, '订单管理删除', 1063, 4, '#', '', 1, 0, 'F', '0', '0', 'system:orderMenu:remove', '#', 'admin', '2021-03-22 14:59:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1068, '订单管理导出', 1063, 5, '#', '', 1, 0, 'F', '0', '0', 'system:orderMenu:export', '#', 'admin', '2021-03-22 14:59:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1069, '商品管理', 1061, 1, 'goodMenu', 'system/goodMenu/index', 1, 0, 'C', '0', '0', 'system:goodMenu:list', 'list', 'admin', '2021-03-22 15:47:47', 'admin', '2021-03-22 15:53:57', '商品管理菜单');
INSERT INTO `sys_menu` VALUES (1070, '商品管理查询', 1069, 1, '#', '', 1, 0, 'F', '0', '0', 'system:goodMenu:query', '#', 'admin', '2021-03-22 15:47:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1071, '商品管理新增', 1069, 2, '#', '', 1, 0, 'F', '0', '0', 'system:goodMenu:add', '#', 'admin', '2021-03-22 15:47:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1072, '商品管理修改', 1069, 3, '#', '', 1, 0, 'F', '0', '0', 'system:goodMenu:edit', '#', 'admin', '2021-03-22 15:47:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1073, '商品管理删除', 1069, 4, '#', '', 1, 0, 'F', '0', '0', 'system:goodMenu:remove', '#', 'admin', '2021-03-22 15:47:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1074, '商品管理导出', 1069, 5, '#', '', 1, 0, 'F', '0', '0', 'system:goodMenu:export', '#', 'admin', '2021-03-22 15:47:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1075, '库区管理', 1061, 1, 'storageMenu', 'system/storageMenu/index', 1, 0, 'C', '0', '0', 'system:storageMenu:list', 'tree-table', 'admin', '2021-03-22 19:07:29', 'admin', '2021-03-22 19:10:01', '库区管理菜单');
INSERT INTO `sys_menu` VALUES (1076, '库区管理查询', 1075, 1, '#', '', 1, 0, 'F', '0', '0', 'system:storageMenu:query', '#', 'admin', '2021-03-22 19:07:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1077, '库区管理新增', 1075, 2, '#', '', 1, 0, 'F', '0', '0', 'system:storageMenu:add', '#', 'admin', '2021-03-22 19:07:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1078, '库区管理修改', 1075, 3, '#', '', 1, 0, 'F', '0', '0', 'system:storageMenu:edit', '#', 'admin', '2021-03-22 19:07:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1079, '库区管理删除', 1075, 4, '#', '', 1, 0, 'F', '0', '0', 'system:storageMenu:remove', '#', 'admin', '2021-03-22 19:07:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1080, '库区管理导出', 1075, 5, '#', '', 1, 0, 'F', '0', '0', 'system:storageMenu:export', '#', 'admin', '2021-03-22 19:07:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1081, '货架管理', 1061, 1, 'shelfMenu', 'system/shelfMenu/index', 1, 0, 'C', '0', '0', 'system:shelfMenu:list', 'table', 'admin', '2021-03-23 09:41:32', 'admin', '2021-03-23 09:42:46', '货架管理菜单');
INSERT INTO `sys_menu` VALUES (1082, '货架管理查询', 1081, 1, '#', '', 1, 0, 'F', '0', '0', 'system:shelfMenu:query', '#', 'admin', '2021-03-23 09:41:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1083, '货架管理新增', 1081, 2, '#', '', 1, 0, 'F', '0', '0', 'system:shelfMenu:add', '#', 'admin', '2021-03-23 09:41:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1084, '货架管理修改', 1081, 3, '#', '', 1, 0, 'F', '0', '0', 'system:shelfMenu:edit', '#', 'admin', '2021-03-23 09:41:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1085, '货架管理删除', 1081, 4, '#', '', 1, 0, 'F', '0', '0', 'system:shelfMenu:remove', '#', 'admin', '2021-03-23 09:41:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1086, '货架管理导出', 1081, 5, '#', '', 1, 0, 'F', '0', '0', 'system:shelfMenu:export', '#', 'admin', '2021-03-23 09:41:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1087, '入库管理', 0, 1, 'inner', NULL, 1, 0, 'M', '0', '0', NULL, 'input', 'admin', '2021-03-23 10:19:11', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-02-07 16:01:43', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-02-07 16:01:43', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1612684899000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 09:22:33');
INSERT INTO `sys_oper_log` VALUES (2, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"1\",\"menuName\":\"基础信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"masterBasic\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 09:26:44');
INSERT INTO `sys_oper_log` VALUES (3, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"job\",\"orderNum\":\"1\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"order\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 09:49:55');
INSERT INTO `sys_oper_log` VALUES (4, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"job\",\"orderNum\":\"1\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"order\",\"children\":[],\"createTime\":1616377795000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1062,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 09:50:52');
INSERT INTO `sys_oper_log` VALUES (5, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'order_info', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:01:46');
INSERT INTO `sys_oper_log` VALUES (6, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/order_info', '127.0.0.1', '内网IP', '{tableName=order_info}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:02:35');
INSERT INTO `sys_oper_log` VALUES (7, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/order_info', '127.0.0.1', '内网IP', '{tableName=order_info}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:05:27');
INSERT INTO `sys_oper_log` VALUES (8, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"\",\"isPk\":\"1\",\"createTime\":1616393127000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"波次号\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"batch_no\"},{\"capJavaField\":\"OrderNo\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单号\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"order_no\"},{\"capJavaField\":\"OrderType\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"订单类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(15)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:10:15');
INSERT INTO `sys_oper_log` VALUES (9, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单优先级\",\"remark\":\"订单优先级，有高（1）、普通（2）、低（3）\",\"params\":{},\"dictType\":\"order_priority\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:13:45');
INSERT INTO `sys_oper_log` VALUES (10, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"remark\":\"高优先级\",\"params\":{},\"dictType\":\"order_priority\",\"dictLabel\":\"高\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:14:07');
INSERT INTO `sys_oper_log` VALUES (11, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":1,\"remark\":\"正常优先级\",\"params\":{},\"dictType\":\"order_priority\",\"dictLabel\":\"普通\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:14:20');
INSERT INTO `sys_oper_log` VALUES (12, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":1,\"remark\":\"低优先级\",\"params\":{},\"dictType\":\"order_priority\",\"dictLabel\":\"低\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:14:31');
INSERT INTO `sys_oper_log` VALUES (13, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单类型\",\"remark\":\"订单类型，分为普通订单，爆品订单，大宗订单，供应商订单等\",\"params\":{},\"dictType\":\"order_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:15:29');
INSERT INTO `sys_oper_log` VALUES (14, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"remark\":\"普通订单类型\",\"params\":{},\"dictType\":\"order_type\",\"dictLabel\":\"普通订单\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:15:45');
INSERT INTO `sys_oper_log` VALUES (15, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":1,\"remark\":\"爆品订单\",\"params\":{},\"dictType\":\"order_type\",\"dictLabel\":\"爆品订单\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:15:56');
INSERT INTO `sys_oper_log` VALUES (16, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":1,\"remark\":\"大宗货物订单\",\"params\":{},\"dictType\":\"order_type\",\"dictLabel\":\"大宗订单\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:16:13');
INSERT INTO `sys_oper_log` VALUES (17, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"dictSort\":1,\"remark\":\"供应商订单\",\"params\":{},\"dictType\":\"order_type\",\"dictLabel\":\"供应商订单\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:16:25');
INSERT INTO `sys_oper_log` VALUES (18, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单状态\",\"remark\":\"订单状态，分为待确认（1），待分配，待拣货，待复核，待打包，待发货\",\"params\":{},\"dictType\":\"order_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:17:45');
INSERT INTO `sys_oper_log` VALUES (19, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":1,\"remark\":\"待确认，订单到达，还未经主管确认是否处理\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"待确认\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:18:31');
INSERT INTO `sys_oper_log` VALUES (20, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"remark\":\"待分配，主管已确认，还未进行拆分或任务划分\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"待分配\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:19:17');
INSERT INTO `sys_oper_log` VALUES (21, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":1,\"remark\":\"待拣货，订单已受理并发布拣货任务，等待拣货人员拣货\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"待拣货\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:20:07');
INSERT INTO `sys_oper_log` VALUES (22, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":1,\"remark\":\"待复核，订单已经拣货完毕，等待复核员复核\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"待复核\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:21:13');
INSERT INTO `sys_oper_log` VALUES (23, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"dictSort\":1,\"remark\":\"待打包，订单已经复核完毕，等待打包员打包\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"待打包\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:21:45');
INSERT INTO `sys_oper_log` VALUES (24, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"5\",\"dictSort\":1,\"remark\":\"待发货，订单已经打包完毕，等待发货员发货交接\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"待发货\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:22:21');
INSERT INTO `sys_oper_log` VALUES (25, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"6\",\"dictSort\":1,\"remark\":\"待返库，订单发生差异或其他问题进行返库\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"待返库\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:24:27');
INSERT INTO `sys_oper_log` VALUES (26, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单来源\",\"remark\":\"订单来源，包括自营，第三方，供应商等（还包括其他合作伙伴）\",\"params\":{},\"dictType\":\"order_origin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:41:48');
INSERT INTO `sys_oper_log` VALUES (27, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":1,\"remark\":\"自营，通过自己的营销平台下发的订单\",\"params\":{},\"dictType\":\"order_origin\",\"dictLabel\":\"自营\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:42:14');
INSERT INTO `sys_oper_log` VALUES (28, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"remark\":\"第三方，用于其他平台或接入的应用下发的订单\",\"params\":{},\"dictType\":\"order_origin\",\"dictLabel\":\"第三方\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:42:56');
INSERT INTO `sys_oper_log` VALUES (29, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":1,\"remark\":\"供应商订单\",\"params\":{},\"dictType\":\"order_origin\",\"dictLabel\":\"供应商\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:43:26');
INSERT INTO `sys_oper_log` VALUES (30, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单等级\",\"remark\":\"订单等级，包括爆品订单，普通订单，冷门订单\",\"params\":{},\"dictType\":\"order_level\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:45:18');
INSERT INTO `sys_oper_log` VALUES (31, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":1,\"remark\":\"爆品订单，下单频繁且成交额大于某一阈值的订单\",\"params\":{},\"dictType\":\"order_level\",\"dictLabel\":\"爆品订单\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:46:18');
INSERT INTO `sys_oper_log` VALUES (32, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"remark\":\"普通订单\",\"params\":{},\"dictType\":\"order_level\",\"dictLabel\":\"普通订单\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:46:48');
INSERT INTO `sys_oper_log` VALUES (33, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":1,\"remark\":\"冷门订单，订单数量较少且长期较为稳定的订单\",\"params\":{},\"dictType\":\"order_level\",\"dictLabel\":\"冷门订单\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:47:14');
INSERT INTO `sys_oper_log` VALUES (34, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增主键\",\"updateTime\":1616393415000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"\",\"isPk\":\"1\",\"createTime\":1616393127000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"波次号\",\"isQuery\":\"1\",\"updateTime\":1616393415000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"batch_no\"},{\"capJavaField\":\"OrderNo\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单号\",\"isQuery\":\"1\",\"updateTime\":1616393415000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"order_no\"},{\"capJavaField\":\"OrderType\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"order_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"订单类型\",\"isQuery\":\"1\",\"updateTime\":1616393415000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 14:49:29');
INSERT INTO `sys_oper_log` VALUES (35, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-03-22 14:49:32');
INSERT INTO `sys_oper_log` VALUES (36, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1062', '127.0.0.1', '内网IP', '{menuId=1062}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:16:04');
INSERT INTO `sys_oper_log` VALUES (37, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"1\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"orderMenu\",\"component\":\"system/orderMenu/index\",\"children\":[],\"createTime\":1616396386000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1063,\"menuType\":\"C\",\"perms\":\"system:orderMenu:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:16:42');
INSERT INTO `sys_oper_log` VALUES (38, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"job\",\"orderNum\":\"1\",\"menuName\":\"基础信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"masterBasic\",\"children\":[],\"createTime\":1616376404000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1061,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:16:50');
INSERT INTO `sys_oper_log` VALUES (39, '订单管理', 1, 'com.ruoyi.web.controller.system.OrderInfoController.add()', 'POST', 1, 'admin', NULL, '/system/orderMenu', '127.0.0.1', '内网IP', '{\"totalVolume\":23,\"orderType\":\"1\",\"planDeliveryTime\":1616428800000,\"hodeptName\":\"TMS\",\"orderPriority\":2,\"orderStatus\":0,\"uuid\":\"000100010001\",\"recePhone\":\"10086\",\"orderLevel\":\"1\",\"hodeptNo\":\"青龙运输系统\",\"id\":1,\"houserName\":\"test\",\"batchNo\":\"0010010001\",\"custNo\":\"CUS0010010001\",\"orderNo\":\"ESL0010010001\",\"orderOrigin\":\"0\",\"updateUser\":\"test\",\"custName\":\"test\",\"params\":{},\"receAddress\":\"河北省秦皇岛市海港区\",\"createTime\":1616397632613,\"totalWeight\":50,\"createUser\":\"test\",\"receName\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:20:32');
INSERT INTO `sys_oper_log` VALUES (40, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增主键\",\"updateTime\":1616395769000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"\",\"isPk\":\"1\",\"createTime\":1616393127000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"波次号\",\"isQuery\":\"1\",\"updateTime\":1616395769000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"batch_no\"},{\"capJavaField\":\"OrderNo\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单号\",\"isQuery\":\"1\",\"updateTime\":1616395769000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"order_no\"},{\"capJavaField\":\"OrderType\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"order_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"订单类型\",\"isQuery\":\"1\",\"updateTime\":1616395769', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:24:34');
INSERT INTO `sys_oper_log` VALUES (41, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-03-22 15:24:37');
INSERT INTO `sys_oper_log` VALUES (42, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增主键\",\"updateTime\":1616397874000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"\",\"isPk\":\"1\",\"createTime\":1616393127000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"波次号\",\"isQuery\":\"1\",\"updateTime\":1616397874000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"batch_no\"},{\"capJavaField\":\"OrderNo\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单号\",\"isQuery\":\"1\",\"updateTime\":1616397874000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"order_no\"},{\"capJavaField\":\"OrderType\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"order_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"订单类型\",\"isQuery\":\"1\",\"updateTime\":1616397874', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:31:49');
INSERT INTO `sys_oper_log` VALUES (43, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增主键\",\"updateTime\":1616398309000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"\",\"isPk\":\"1\",\"createTime\":1616393127000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"波次号\",\"isQuery\":\"1\",\"updateTime\":1616398309000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"batch_no\"},{\"capJavaField\":\"OrderNo\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单号\",\"isQuery\":\"1\",\"updateTime\":1616398309000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"order_no\"},{\"capJavaField\":\"OrderType\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"order_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"订单类型\",\"isQuery\":\"1\",\"updateTime\":1616398309', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:32:44');
INSERT INTO `sys_oper_log` VALUES (44, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-03-22 15:32:47');
INSERT INTO `sys_oper_log` VALUES (45, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'good_info', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:33:59');
INSERT INTO `sys_oper_log` VALUES (46, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"库存类型\",\"remark\":\"库存类型，包括常温库区，冷藏库区，生鲜库区等\",\"params\":{},\"dictType\":\"storage_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:37:08');
INSERT INTO `sys_oper_log` VALUES (47, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":1,\"remark\":\"常温库区，用于存放常温环境下的商品\",\"params\":{},\"dictType\":\"storage_type\",\"dictLabel\":\"常温库区\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:37:31');
INSERT INTO `sys_oper_log` VALUES (48, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"remark\":\"冷藏库区，用于存放低温下保存的商品\",\"params\":{},\"dictType\":\"storage_type\",\"dictLabel\":\"冷藏库区\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:37:50');
INSERT INTO `sys_oper_log` VALUES (49, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":1,\"remark\":\"生鲜库区，用于存放生鲜类商品\",\"params\":{},\"dictType\":\"storage_type\",\"dictLabel\":\"生鲜库区\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:38:24');
INSERT INTO `sys_oper_log` VALUES (50, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":69,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"记录id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616398439000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageAreaNo\",\"usableColumn\":false,\"columnId\":70,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageAreaNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_area_no\"},{\"capJavaField\":\"StorageShelfNo\",\"usableColumn\":false,\"columnId\":71,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageShelfNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库位编号\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_shelf_no\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"波次号\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryTy', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:38:29');
INSERT INTO `sys_oper_log` VALUES (51, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":69,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"记录id\",\"updateTime\":1616398709000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616398439000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageAreaNo\",\"usableColumn\":false,\"columnId\":70,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageAreaNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616398709000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_area_no\"},{\"capJavaField\":\"StorageShelfNo\",\"usableColumn\":false,\"columnId\":71,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageShelfNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库位编号\",\"isQuery\":\"1\",\"updateTime\":1616398709000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_shelf_no\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:38:43');
INSERT INTO `sys_oper_log` VALUES (52, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":69,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"记录id\",\"updateTime\":1616398723000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616398439000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageAreaNo\",\"usableColumn\":false,\"columnId\":70,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageAreaNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616398723000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_area_no\"},{\"capJavaField\":\"StorageShelfNo\",\"usableColumn\":false,\"columnId\":71,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageShelfNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库位编号\",\"isQuery\":\"1\",\"updateTime\":1616398723000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_shelf_no\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:43:38');
INSERT INTO `sys_oper_log` VALUES (53, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-03-22 15:43:42');
INSERT INTO `sys_oper_log` VALUES (54, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"1\",\"menuName\":\"商品管理\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"goodMenu\",\"component\":\"system/goodMenu/index\",\"children\":[],\"createTime\":1616399267000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1069,\"menuType\":\"C\",\"perms\":\"system:goodMenu:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:53:57');
INSERT INTO `sys_oper_log` VALUES (55, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":69,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"记录id\",\"updateTime\":1616399018000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616398439000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageAreaNo\",\"usableColumn\":false,\"columnId\":70,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageAreaNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616399018000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_area_no\"},{\"capJavaField\":\"StorageShelfNo\",\"usableColumn\":false,\"columnId\":71,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageShelfNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库位编号\",\"isQuery\":\"1\",\"updateTime\":1616399018000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_shelf_no\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:54:36');
INSERT INTO `sys_oper_log` VALUES (56, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":69,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"记录id\",\"updateTime\":1616399676000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616398439000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageAreaNo\",\"usableColumn\":false,\"columnId\":70,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageAreaNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616399676000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_area_no\"},{\"capJavaField\":\"StorageShelfNo\",\"usableColumn\":false,\"columnId\":71,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageShelfNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库位编号\",\"isQuery\":\"1\",\"updateTime\":1616399676000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_shelf_no\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:55:14');
INSERT INTO `sys_oper_log` VALUES (57, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-03-22 15:55:18');
INSERT INTO `sys_oper_log` VALUES (58, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":69,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1616399714000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616398439000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageAreaNo\",\"usableColumn\":false,\"columnId\":70,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageAreaNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616399714000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_area_no\"},{\"capJavaField\":\"StorageShelfNo\",\"usableColumn\":false,\"columnId\":71,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageShelfNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库位编号\",\"isQuery\":\"1\",\"updateTime\":1616399714000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616398439000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_shelf_no\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:57:00');
INSERT INTO `sys_oper_log` VALUES (59, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1616398364000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"\",\"isPk\":\"1\",\"createTime\":1616393127000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"波次号\",\"isQuery\":\"1\",\"updateTime\":1616398364000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"batch_no\"},{\"capJavaField\":\"OrderNo\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单号\",\"isQuery\":\"1\",\"updateTime\":1616398364000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616393127000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"order_no\"},{\"capJavaField\":\"OrderType\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"order_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"订单类型\",\"isQuery\":\"1\",\"updateTime\":161639836400', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 15:57:11');
INSERT INTO `sys_oper_log` VALUES (60, '商品管理', 1, 'com.ruoyi.web.controller.system.GoodInfoController.add()', 'POST', 1, 'admin', NULL, '/system/goodMenu', '127.0.0.1', '内网IP', '{\"defectNum\":1,\"frozenNum\":1,\"productTime\":1616342400000,\"goodNo\":\"6902890884910\",\"goodName\":\"test\",\"storageShelfNo\":\"DP001001\",\"batchNo\":\"110112402567\",\"inventoryType\":\"0\",\"orderNo\":\"1616402567100001 \",\"params\":{},\"customerName\":\"test\",\"inventoryNum\":12,\"createTime\":1616404580139,\"expiryTime\":1617120000000,\"customerNo\":\"100001\",\"storageAreaNo\":\"C1101110112001\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\IDEProject\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\GoodInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.GoodInfoMapper.insertGoodInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into good_info          ( storage_area_no,             storage_shelf_no,             batch_no,             order_no,             good_no,             good_name,             customer_no,             customer_name,             inventory_num,             defect_num,             frozen_num,             inventory_type,             product_time,             expiry_time,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2021-03-22 17:16:20');
INSERT INTO `sys_oper_log` VALUES (61, '商品管理', 1, 'com.ruoyi.web.controller.system.GoodInfoController.add()', 'POST', 1, 'admin', NULL, '/system/goodMenu', '127.0.0.1', '内网IP', '{\"defectNum\":1,\"frozenNum\":1,\"productTime\":1616342400000,\"goodNo\":\"6902890884910\",\"goodName\":\"test\",\"storageShelfNo\":\"DP001001\",\"batchNo\":\"110112402567\",\"inventoryType\":\"0\",\"orderNo\":\"1616402567100001 \",\"params\":{},\"customerName\":\"test\",\"inventoryNum\":12,\"createTime\":1616404653153,\"expiryTime\":1617120000000,\"customerNo\":\"100001\",\"storageAreaNo\":\"C1101110112001\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 17:17:33');
INSERT INTO `sys_oper_log` VALUES (62, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'storage_info', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 18:58:13');
INSERT INTO `sys_oper_log` VALUES (63, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":90,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616410693000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageNo\",\"usableColumn\":false,\"columnId\":91,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616410693000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"storage_no\"},{\"capJavaField\":\"StorageName\",\"usableColumn\":false,\"columnId\":92,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区名称\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616410693000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"storage_name\"},{\"capJavaField\":\"StorageType\",\"usableColumn\":false,\"columnId\":93,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"库区类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 19:00:04');
INSERT INTO `sys_oper_log` VALUES (64, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1616398628000,\"updateBy\":\"admin\",\"dictName\":\"库区类型\",\"remark\":\"库存类型，包括常温库区，冷藏库区，生鲜库区等\",\"dictId\":16,\"params\":{},\"dictType\":\"storage_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 19:00:56');
INSERT INTO `sys_oper_log` VALUES (65, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"库区状态\",\"remark\":\"库区状态，包括启用，禁用\",\"params\":{},\"dictType\":\"storage_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 19:03:34');
INSERT INTO `sys_oper_log` VALUES (66, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"remark\":\"启用\",\"params\":{},\"dictType\":\"storage_status\",\"dictLabel\":\"启用\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 19:03:50');
INSERT INTO `sys_oper_log` VALUES (67, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":1,\"remark\":\"禁用\",\"params\":{},\"dictType\":\"storage_status\",\"dictLabel\":\"禁用\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 19:04:04');
INSERT INTO `sys_oper_log` VALUES (68, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":90,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增id\",\"updateTime\":1616410804000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616410693000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageNo\",\"usableColumn\":false,\"columnId\":91,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616410804000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616410693000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"storage_no\"},{\"capJavaField\":\"StorageName\",\"usableColumn\":false,\"columnId\":92,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区名称\",\"isQuery\":\"1\",\"updateTime\":1616410804000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616410693000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"storage_name\"},{\"capJavaField\":\"StorageType\",\"usableColumn\":false,\"columnId\":93,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"storage_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 19:04:11');
INSERT INTO `sys_oper_log` VALUES (69, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":90,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增id\",\"updateTime\":1616411051000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616410693000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageNo\",\"usableColumn\":false,\"columnId\":91,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616411051000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616410693000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"storage_no\"},{\"capJavaField\":\"StorageName\",\"usableColumn\":false,\"columnId\":92,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区名称\",\"isQuery\":\"1\",\"updateTime\":1616411051000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616410693000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"storage_name\"},{\"capJavaField\":\"StorageType\",\"usableColumn\":false,\"columnId\":93,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"storage_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 19:04:28');
INSERT INTO `sys_oper_log` VALUES (70, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-03-22 19:04:35');
INSERT INTO `sys_oper_log` VALUES (71, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tree-table\",\"orderNum\":\"1\",\"menuName\":\"库区管理\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"storageMenu\",\"component\":\"system/storageMenu/index\",\"children\":[],\"createTime\":1616411249000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1075,\"menuType\":\"C\",\"perms\":\"system:storageMenu:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 19:10:01');
INSERT INTO `sys_oper_log` VALUES (72, '库区管理', 1, 'com.ruoyi.web.controller.system.StorageInfoController.add()', 'POST', 1, 'admin', NULL, '/system/storageMenu', '127.0.0.1', '内网IP', '{\"storageStatus\":1,\"params\":{},\"storageName\":\"常温一号库区\",\"createTime\":1616411459882,\"storageNo\":\"C1101110112001\",\"storageType\":\"0\",\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-22 19:10:59');
INSERT INTO `sys_oper_log` VALUES (73, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/good_info', '127.0.0.1', '内网IP', '{tableName=good_info}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 08:45:22');
INSERT INTO `sys_oper_log` VALUES (74, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":69,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1616399820000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616398439000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageNo\",\"usableColumn\":false,\"columnId\":101,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616460321000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_no\"},{\"capJavaField\":\"ShelfNo\",\"usableColumn\":false,\"columnId\":102,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"shelfNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库位编号\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616460321000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"shelf_no\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"波次号\",\"isQuery\":\"1\",\"updateTime\":1616399820000,\"sort\":4,\"list\":true,\"params\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 08:47:58');
INSERT INTO `sys_oper_log` VALUES (75, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-03-23 08:48:03');
INSERT INTO `sys_oper_log` VALUES (76, '商品管理', 1, 'com.ruoyi.web.controller.system.GoodInfoController.add()', 'POST', 1, 'admin', NULL, '/system/goodMenu', '127.0.0.1', '内网IP', '{\"defectNum\":1,\"frozenNum\":1,\"productTime\":1616342400000,\"goodNo\":\"1000001100010\",\"uuid\":\"1001001001001\",\"goodName\":\"test\",\"shelfPosition\":\"001001122\",\"batchNo\":\"110112402567\",\"inventoryType\":\"0\",\"orderNo\":\"1616402567100001 \",\"params\":{},\"shelfNo\":\"DP001001\",\"inventoryNum\":23,\"createTime\":1616461465142,\"storageNo\":\"C1101110112001\",\"expiryTime\":1617120000000}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\IDEProject\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\GoodInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.GoodInfoMapper.insertGoodInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into good_info          ( storage_no,             shelf_no,             batch_no,             order_no,             good_no,             good_name,             shelf_position,             inventory_num,             defect_num,             frozen_num,             inventory_type,             uuid,             product_time,             expiry_time,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2021-03-23 09:04:25');
INSERT INTO `sys_oper_log` VALUES (77, '商品管理', 1, 'com.ruoyi.web.controller.system.GoodInfoController.add()', 'POST', 1, 'admin', NULL, '/system/goodMenu', '127.0.0.1', '内网IP', '{\"defectNum\":1,\"frozenNum\":1,\"productTime\":1616342400000,\"goodNo\":\"1000001100010\",\"uuid\":\"1001001001001\",\"goodName\":\"test\",\"shelfPosition\":\"001001122\",\"batchNo\":\"110112402567\",\"inventoryType\":\"0\",\"orderNo\":\"1616402567100001 \",\"params\":{},\"shelfNo\":\"DP001001\",\"inventoryNum\":23,\"createTime\":1616461519182,\"storageNo\":\"C1101110112001\",\"expiryTime\":1617120000000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:05:19');
INSERT INTO `sys_oper_log` VALUES (78, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":69,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1616460478000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616398439000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageNo\",\"usableColumn\":false,\"columnId\":101,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616460478000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616460321000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"storage_no\"},{\"capJavaField\":\"ShelfNo\",\"usableColumn\":false,\"columnId\":102,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"shelfNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库位编号\",\"isQuery\":\"1\",\"updateTime\":1616460478000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1616460321000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"shelf_no\"},{\"capJavaField\":\"BatchNo\",\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"波次号\",\"isQuery\":\"1\",\"u', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:06:29');
INSERT INTO `sys_oper_log` VALUES (79, '商品管理', 1, 'com.ruoyi.web.controller.system.GoodInfoController.add()', 'POST', 1, 'admin', NULL, '/system/goodMenu', '127.0.0.1', '内网IP', '{\"defectNum\":1,\"frozenNum\":1,\"productTime\":1616342400000,\"goodNo\":\"1000001100010\",\"uuid\":\"001001001001\",\"goodName\":\"test\",\"shelfPosition\":\"001001122\",\"batchNo\":\"110112402567\",\"inventoryType\":\"0\",\"orderNo\":\"1616402567100001 \",\"params\":{},\"shelfNo\":\"DP001001\",\"inventoryNum\":23,\"createTime\":1616461880656,\"storageNo\":\"C1101110112001\",\"expiryTime\":1617120000000}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1000001100010\' for key \'good_no\'\r\n### The error may exist in file [D:\\IDEProject\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\GoodInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.GoodInfoMapper.insertGoodInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into good_info          ( storage_no,             shelf_no,             batch_no,             order_no,             good_no,             good_name,             shelf_position,             inventory_num,             defect_num,             frozen_num,             inventory_type,             uuid,             product_time,             expiry_time,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1000001100010\' for key \'good_no\'\n; Duplicate entry \'1000001100010\' for key \'good_no\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1000001100010\' for key \'good_no\'', '2021-03-23 09:11:20');
INSERT INTO `sys_oper_log` VALUES (80, '商品管理', 1, 'com.ruoyi.web.controller.system.GoodInfoController.add()', 'POST', 1, 'admin', NULL, '/system/goodMenu', '127.0.0.1', '内网IP', '{\"defectNum\":1,\"frozenNum\":1,\"productTime\":1616342400000,\"goodNo\":\"1000001100010\",\"uuid\":\"001001001001\",\"goodName\":\"test\",\"shelfPosition\":\"001001122\",\"batchNo\":\"110112402567\",\"inventoryType\":\"0\",\"orderNo\":\"1616402567100001 \",\"params\":{},\"shelfNo\":\"DP001001\",\"inventoryNum\":23,\"createTime\":1616461910961,\"storageNo\":\"C1101110112001\",\"expiryTime\":1617120000000}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1000001100010\' for key \'good_no\'\r\n### The error may exist in file [D:\\IDEProject\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\GoodInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.GoodInfoMapper.insertGoodInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into good_info          ( storage_no,             shelf_no,             batch_no,             order_no,             good_no,             good_name,             shelf_position,             inventory_num,             defect_num,             frozen_num,             inventory_type,             uuid,             product_time,             expiry_time,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1000001100010\' for key \'good_no\'\n; Duplicate entry \'1000001100010\' for key \'good_no\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1000001100010\' for key \'good_no\'', '2021-03-23 09:11:50');
INSERT INTO `sys_oper_log` VALUES (81, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'shelf_info', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:17:41');
INSERT INTO `sys_oper_log` VALUES (82, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":105,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616462261000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageNo\",\"usableColumn\":false,\"columnId\":106,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616462261000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"storage_no\"},{\"capJavaField\":\"ShelfNo\",\"usableColumn\":false,\"columnId\":107,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"shelfNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"货架编号\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616462261000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"shelf_no\"},{\"capJavaField\":\"ShelfName\",\"usableColumn\":false,\"columnId\":108,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"shelfName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"货架名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:19:30');
INSERT INTO `sys_oper_log` VALUES (83, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"货架类型\",\"remark\":\"货架类型，包括数码货架，服装货架，食品、饮品货架等\",\"params\":{},\"dictType\":\"shelf_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:20:33');
INSERT INTO `sys_oper_log` VALUES (84, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"remark\":\"数码货架，类型标识DP\",\"params\":{},\"dictType\":\"shelf_type\",\"dictLabel\":\"数码\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:21:06');
INSERT INTO `sys_oper_log` VALUES (85, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":1,\"remark\":\"服装货架，类型标识CP（cloth production）\",\"params\":{},\"dictType\":\"shelf_type\",\"dictLabel\":\"服装货架\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:21:44');
INSERT INTO `sys_oper_log` VALUES (86, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":1,\"remark\":\"食品货架，类型标识 FP（food production）\",\"params\":{},\"dictType\":\"shelf_type\",\"dictLabel\":\"食品\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:22:37');
INSERT INTO `sys_oper_log` VALUES (87, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":1,\"remark\":\"服装货架，类型标识CP（cloth production）\",\"params\":{},\"dictType\":\"shelf_type\",\"dictLabel\":\"服装\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1616462504000,\"dictCode\":55,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:22:43');
INSERT INTO `sys_oper_log` VALUES (88, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"dictSort\":1,\"remark\":\"饮品货架，类型标识DP（drink production）\",\"params\":{},\"dictType\":\"shelf_type\",\"dictLabel\":\"饮品\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:23:27');
INSERT INTO `sys_oper_log` VALUES (89, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":105,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增主键\",\"updateTime\":1616462370000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616462261000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageNo\",\"usableColumn\":false,\"columnId\":106,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616462370000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616462261000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"storage_no\"},{\"capJavaField\":\"ShelfNo\",\"usableColumn\":false,\"columnId\":107,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"shelfNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"货架编号\",\"isQuery\":\"1\",\"updateTime\":1616462370000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616462261000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"shelf_no\"},{\"capJavaField\":\"ShelfName\",\"usableColumn\":false,\"columnId\":108,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"shelfName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"货架名称\",\"isQuery\":\"1\",\"upda', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:24:13');
INSERT INTO `sys_oper_log` VALUES (90, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1616411014000,\"updateBy\":\"admin\",\"dictName\":\"启禁状态\",\"remark\":\"状态，包括启用，禁用\",\"dictId\":17,\"params\":{},\"dictType\":\"status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:25:05');
INSERT INTO `sys_oper_log` VALUES (91, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":105,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增主键\",\"updateTime\":1616462653000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616462261000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageNo\",\"usableColumn\":false,\"columnId\":106,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616462653000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616462261000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"storage_no\"},{\"capJavaField\":\"ShelfNo\",\"usableColumn\":false,\"columnId\":107,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"shelfNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"货架编号\",\"isQuery\":\"1\",\"updateTime\":1616462653000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616462261000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"shelf_no\"},{\"capJavaField\":\"ShelfName\",\"usableColumn\":false,\"columnId\":108,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"shelfName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"货架名称\",\"isQuery\":\"1\",\"upda', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:25:24');
INSERT INTO `sys_oper_log` VALUES (92, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":90,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增id\",\"updateTime\":1616411068000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616410693000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageNo\",\"usableColumn\":false,\"columnId\":91,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616411068000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616410693000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"storage_no\"},{\"capJavaField\":\"StorageName\",\"usableColumn\":false,\"columnId\":92,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区名称\",\"isQuery\":\"1\",\"updateTime\":1616411068000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616410693000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"storage_name\"},{\"capJavaField\":\"StorageType\",\"usableColumn\":false,\"columnId\":93,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"storage_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:25:34');
INSERT INTO `sys_oper_log` VALUES (93, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"HelloWorld\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":90,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"自增id\",\"updateTime\":1616462734000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1616410693000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"StorageNo\",\"usableColumn\":false,\"columnId\":91,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区编号\",\"isQuery\":\"1\",\"updateTime\":1616462734000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616410693000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"storage_no\"},{\"capJavaField\":\"StorageName\",\"usableColumn\":false,\"columnId\":92,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"库区名称\",\"isQuery\":\"1\",\"updateTime\":1616462734000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1616410693000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"storage_name\"},{\"capJavaField\":\"StorageType\",\"usableColumn\":false,\"columnId\":93,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"storage_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:29:13');
INSERT INTO `sys_oper_log` VALUES (94, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-03-23 09:29:19');
INSERT INTO `sys_oper_log` VALUES (95, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-03-23 09:29:28');
INSERT INTO `sys_oper_log` VALUES (96, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"1\",\"menuName\":\"货架管理\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"shelfMenu\",\"component\":\"system/shelfMenu/index\",\"children\":[],\"createTime\":1616463692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1081,\"menuType\":\"C\",\"perms\":\"system:shelfMenu:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:42:46');
INSERT INTO `sys_oper_log` VALUES (97, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"1\",\"menuName\":\"货架管理\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"shelfMenu\",\"component\":\"system/shelfMenu/index\",\"children\":[],\"createTime\":1616463692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1081,\"menuType\":\"C\",\"perms\":\"system:shelfMenu:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:42:46');
INSERT INTO `sys_oper_log` VALUES (98, '货架管理', 1, 'com.ruoyi.web.controller.system.ShelfInfoController.add()', 'POST', 1, 'admin', NULL, '/system/shelfMenu', '127.0.0.1', '内网IP', '{\"shelfStatus\":1,\"params\":{},\"shelfNo\":\"DP001001\",\"shelfName\":\"test\",\"createTime\":1616463874316,\"storageNo\":\"C1101110112001\",\"shelfSpec\":\"12*0.5*6\",\"shelfRow\":6,\"shelfType\":1,\"id\":1,\"shelfCol\":24}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 09:44:34');
INSERT INTO `sys_oper_log` VALUES (99, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"input\",\"orderNum\":\"1\",\"menuName\":\"入库管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"inner\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:19:11');
INSERT INTO `sys_oper_log` VALUES (100, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/36', '127.0.0.1', '内网IP', '{dictCodes=36}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:47:18');
INSERT INTO `sys_oper_log` VALUES (101, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/37', '127.0.0.1', '内网IP', '{dictCodes=37}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:47:19');
INSERT INTO `sys_oper_log` VALUES (102, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/38,39,40,41,42', '127.0.0.1', '内网IP', '{dictCodes=38,39,40,41,42}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:47:24');
INSERT INTO `sys_oper_log` VALUES (103, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"101\",\"dictSort\":1,\"remark\":\"订单创建完成\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"订单创建\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:47:43');
INSERT INTO `sys_oper_log` VALUES (104, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"100\",\"dictSort\":1,\"remark\":\"订单取消\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"订单取消\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:48:00');
INSERT INTO `sys_oper_log` VALUES (105, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"201\",\"dictSort\":2,\"remark\":\"入库状态-确认受理\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"确认受理\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:48:28');
INSERT INTO `sys_oper_log` VALUES (106, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"202\",\"dictSort\":2,\"remark\":\"入库状态-生成批次\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"生成批次\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:48:50');
INSERT INTO `sys_oper_log` VALUES (107, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"203\",\"dictSort\":2,\"remark\":\"入库状态-任务分配\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"任务分配\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:49:08');
INSERT INTO `sys_oper_log` VALUES (108, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"301\",\"dictSort\":3,\"remark\":\"在库状态-进货上架\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"进货上架\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:49:35');
INSERT INTO `sys_oper_log` VALUES (109, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"302\",\"dictSort\":3,\"remark\":\"在库状态-返库上架\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"返库上架\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:50:00');
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"303\",\"dictSort\":3,\"remark\":\"在库状态-拣货下架\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"拣货下架\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:50:18');
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"401\",\"dictSort\":4,\"remark\":\"出库状态-复核差异\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"复核差异\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:50:42');
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"402\",\"dictSort\":4,\"remark\":\"出库状态-复核完成\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"复核完\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:50:57');
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"403\",\"dictSort\":4,\"remark\":\"出库状态-打包装箱\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"打包装箱\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:51:20');
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"404\",\"dictSort\":4,\"remark\":\"出库状态-发货交接\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"发货交接\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:51:39');
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"501\",\"dictSort\":5,\"remark\":\"下游状态-订单完成\",\"params\":{},\"dictType\":\"order_status\",\"dictLabel\":\"订单完成\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-23 10:51:59');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-02-07 16:01:38', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-02-07 16:01:38', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-02-07 16:01:38', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-02-07 16:01:38', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-02-07 16:01:39', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-02-07 16:01:39', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-02-07 16:01:38', 'admin', '2021-02-07 16:01:38', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-02-07 16:01:38', 'admin', '2021-02-07 16:01:38', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
