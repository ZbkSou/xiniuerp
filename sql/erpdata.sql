/*
Navicat MySQL Data Transfer

Source Server         : erp
Source Server Version : 50650
Source Host           : 82.157.112.124:3306
Source Database       : erpdata

Target Server Type    : MYSQL
Target Server Version : 50650
File Encoding         : 65001

Date: 2021-09-05 06:13:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for biz_delivery_cost
-- ----------------------------
DROP TABLE IF EXISTS `biz_delivery_cost`;
CREATE TABLE `biz_delivery_cost` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '发货成本表ID',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT '订单商品ID',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT '产品分类ID',
  `product_code` varchar(50) NOT NULL COMMENT '商品编号',
  `supplier_code` varchar(50) NOT NULL COMMENT '供货商编号',
  `split_shipment` int(11) NOT NULL DEFAULT '1' COMMENT '是否拆单',
  `box_id` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '包装盒商品id',
  `box_cnt` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '包装盒数量',
  `extra_package_cost` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '额外包装成本',
  `package_cost` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '打包人工成本需要单独支付',
  `w_id` int(10) unsigned NOT NULL COMMENT '仓库ID',
  `unpay_delivery_cost` decimal(10,2) DEFAULT NULL COMMENT '单独支付给仓库快递费',
  `delivery_cost` decimal(10,2) DEFAULT NULL COMMENT '统一结算快递费',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发货成本表';

-- ----------------------------
-- Records of biz_delivery_cost
-- ----------------------------

-- ----------------------------
-- Table structure for biz_delivery_log
-- ----------------------------
DROP TABLE IF EXISTS `biz_delivery_log`;
CREATE TABLE `biz_delivery_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '发货记录表ID',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT '订单ID',
  `order_cache` varchar(500) DEFAULT NULL COMMENT '订单快照',
  `box_json` varchar(200) DEFAULT NULL COMMENT '包装盒使用记录',
  `split_shipment` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否拆单0否1是',
  `extra_package_cost` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '额外包装成本',
  `package_cost` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '人工成本需要单独支付',
  `delivery_cost` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '单独支付快递成本',
  `w_id` int(10) unsigned NOT NULL COMMENT '仓库ID',
  `pay_extra_package` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否结清包装人工0否1是',
  `pay_extra_delivery` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否结清快递0否1是',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发货记录表';

-- ----------------------------
-- Records of biz_delivery_log
-- ----------------------------

-- ----------------------------
-- Table structure for biz_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `biz_order_detail`;
CREATE TABLE `biz_order_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单详情表ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单表ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '订单商品ID',
  `product_name` varchar(50) NOT NULL COMMENT '商品名称',
  `product_code` varchar(50) NOT NULL COMMENT '商品编号',
  `supplier_code` varchar(50) NOT NULL COMMENT '供货商编号',
  `product_cnt` int(11) NOT NULL DEFAULT '1' COMMENT '购买商品数量',
  `product_price` decimal(8,2) NOT NULL COMMENT '购买商品单价',
  `average_cost` decimal(8,2) NOT NULL COMMENT '平均成本价格',
  `weight` float DEFAULT NULL COMMENT '商品重量',
  `fee_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '优惠分摊金额',
  `w_id` int(10) unsigned NOT NULL COMMENT '仓库ID',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of biz_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for biz_order_master
-- ----------------------------
DROP TABLE IF EXISTS `biz_order_master`;
CREATE TABLE `biz_order_master` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `customer_id` int(10) unsigned NOT NULL COMMENT '下单人ID',
  `shipping_user` varchar(10) NOT NULL COMMENT '收货人姓名',
  `province` smallint(6) DEFAULT NULL COMMENT '省',
  `city` smallint(6) DEFAULT NULL COMMENT '市',
  `district` smallint(6) DEFAULT NULL COMMENT '区',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `payment_method` tinyint(4) NOT NULL COMMENT '支付方式：1现金，2余额，3网银，4支付宝，5微信',
  `order_money` decimal(8,2) NOT NULL COMMENT '订单金额',
  `district_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `shipping_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '运费金额',
  `payment_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `shipping_comp_name` varchar(10) DEFAULT NULL COMMENT '快递公司名称',
  `shipping_sn` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `split_shipment` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否拆分发货0否1是',
  `channel_sn` varchar(50) DEFAULT NULL COMMENT '渠道单号',
  `channel_name` varchar(50) DEFAULT NULL COMMENT '渠道名',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '订单所在部门id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `shipping_time` datetime DEFAULT NULL COMMENT '发货时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单主表';

-- ----------------------------
-- Records of biz_order_master
-- ----------------------------

-- ----------------------------
-- Table structure for biz_platform_token
-- ----------------------------
DROP TABLE IF EXISTS `biz_platform_token`;
CREATE TABLE `biz_platform_token` (
  `id` int(11) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `refresh_token` varchar(50) DEFAULT NULL,
  `access_token` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL COMMENT '到期时间',
  `platform` varchar(50) DEFAULT NULL COMMENT '平台类型',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) NOT NULL COMMENT '备注',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三方平台';

-- ----------------------------
-- Records of biz_platform_token
-- ----------------------------

-- ----------------------------
-- Table structure for biz_product_category
-- ----------------------------
DROP TABLE IF EXISTS `biz_product_category`;
CREATE TABLE `biz_product_category` (
  `category_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(10) NOT NULL COMMENT '分类名称',
  `category_code` varchar(10) NOT NULL COMMENT '分类编码',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父分类ID',
  `category_level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '分类层级',
  `category_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '分类状态',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of biz_product_category
-- ----------------------------

-- ----------------------------
-- Table structure for biz_product_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_product_info`;
CREATE TABLE `biz_product_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `product_code` char(16) NOT NULL COMMENT '商品编码',
  `product_name` varchar(20) NOT NULL COMMENT '商品名称',
  `bar_code` varchar(50) NOT NULL COMMENT '国条码',
  `one_category_id` smallint(5) unsigned NOT NULL COMMENT '一级分类ID',
  `two_category_id` smallint(5) unsigned NOT NULL COMMENT '二级分类ID',
  `three_category_id` smallint(5) unsigned NOT NULL COMMENT '三级分类ID',
  `supplier_id` int(10) unsigned NOT NULL COMMENT '商品的供应商ID',
  `supplier_code` char(16) NOT NULL COMMENT '供应商编码',
  `publish_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '上下架状态：0下架1上架',
  `audit_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态：0未审核，1已审核',
  `weight` float DEFAULT NULL COMMENT '商品重量',
  `length` float DEFAULT NULL COMMENT '商品长度',
  `height` float DEFAULT NULL COMMENT '商品高度',
  `width` float DEFAULT NULL COMMENT '商品宽度',
  `product_models` varchar(20) NOT NULL COMMENT '产品型号',
  `default_cost` decimal(18,2) NOT NULL COMMENT '商品默认出厂成本',
  `shelf_life` int(11) NOT NULL COMMENT '商品有效期',
  `descript` text NOT NULL COMMENT '商品描述',
  `remind` varchar(50) NOT NULL COMMENT '商品提醒',
  `many_models` tinyint(4) NOT NULL DEFAULT '0' COMMENT '拥有多型号：0否1是',
  `indate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品录入时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) NOT NULL COMMENT '备注',
  `remark2` varchar(500) NOT NULL COMMENT '备注2',
  `remark3` varchar(500) NOT NULL COMMENT '备注3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of biz_product_info
-- ----------------------------

-- ----------------------------
-- Table structure for biz_purchasing
-- ----------------------------
DROP TABLE IF EXISTS `biz_purchasing`;
CREATE TABLE `biz_purchasing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '进货表ID',
  `total_goods_pice` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '货物总价',
  `extra_package_cost` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '额外包装成本',
  `delivery_cost` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '运输成本',
  `w_id` int(10) unsigned NOT NULL COMMENT '仓库ID',
  `purchasing_time` datetime DEFAULT NULL COMMENT '进货时间',
  `pay_time` datetime DEFAULT NULL COMMENT '结算时间',
  `enter_time` datetime DEFAULT NULL COMMENT '进仓时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进货表表';

-- ----------------------------
-- Records of biz_purchasing
-- ----------------------------

-- ----------------------------
-- Table structure for biz_purchasing_detail
-- ----------------------------
DROP TABLE IF EXISTS `biz_purchasing_detail`;
CREATE TABLE `biz_purchasing_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '进货表详情ID',
  `purchasing_id` int(10) unsigned NOT NULL COMMENT '进货单ID',
  `product_code` char(16) NOT NULL COMMENT '商品编码',
  `product_name` varchar(20) NOT NULL COMMENT '商品名称',
  `product_models_id` varchar(20) DEFAULT NULL COMMENT '商品型号id',
  `count` int(10) NOT NULL DEFAULT '0' COMMENT '数量',
  `pice` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '单价',
  `supplier_id` int(10) unsigned NOT NULL COMMENT '商品的供应商ID',
  `supplier_code` char(16) NOT NULL COMMENT '供应商编码',
  `w_id` int(10) unsigned NOT NULL COMMENT '仓库ID',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进货单详情表';

-- ----------------------------
-- Records of biz_purchasing_detail
-- ----------------------------

-- ----------------------------
-- Table structure for biz_supplier_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_supplier_info`;
CREATE TABLE `biz_supplier_info` (
  `supplier_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `supplier_code` char(8) NOT NULL COMMENT '供应商编码',
  `supplier_name` char(50) NOT NULL COMMENT '供应商名称',
  `supplier_type` tinyint(4) NOT NULL COMMENT '供应商类型：1.自营，2.平台',
  `link_man` varchar(10) NOT NULL COMMENT '供应商联系人',
  `principal_man` varchar(10) NOT NULL COMMENT '供应商负责人',
  `phone_number` varchar(50) NOT NULL COMMENT '联系电话',
  `bank_name` varchar(50) NOT NULL COMMENT '供应商开户银行名称',
  `bank_account` varchar(50) NOT NULL COMMENT '银行账号',
  `address` varchar(200) NOT NULL COMMENT '供应商地址',
  `supplier_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0禁止，1启用',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商信息表';

-- ----------------------------
-- Records of biz_supplier_info
-- ----------------------------

-- ----------------------------
-- Table structure for biz_warehouse_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_warehouse_info`;
CREATE TABLE `biz_warehouse_info` (
  `w_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '仓库ID',
  `warehouse_sn` char(5) NOT NULL COMMENT '仓库编码',
  `warehoust_name` varchar(10) NOT NULL COMMENT '仓库名称',
  `warehouse_phone` varchar(20) NOT NULL COMMENT '仓库电话',
  `contact` varchar(10) NOT NULL COMMENT '仓库联系人',
  `province` smallint(6) NOT NULL COMMENT '省',
  `city` smallint(6) NOT NULL COMMENT '市',
  `distrct` smallint(6) NOT NULL COMMENT '区',
  `address` varchar(100) NOT NULL COMMENT '仓库地址',
  `warehouse_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '仓库状态：0禁用，1启用',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库信息表';

-- ----------------------------
-- Records of biz_warehouse_info
-- ----------------------------

-- ----------------------------
-- Table structure for biz_warehouse_product
-- ----------------------------
DROP TABLE IF EXISTS `biz_warehouse_product`;
CREATE TABLE `biz_warehouse_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `model_id` int(10) unsigned DEFAULT NULL COMMENT '型号ID',
  `w_id` smallint(5) unsigned NOT NULL COMMENT '仓库ID',
  `place` varchar(50) DEFAULT NULL COMMENT '位置',
  `current_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前商品数量',
  `lock_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前占用数据',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库存表';

-- ----------------------------
-- Records of biz_warehouse_product
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'biz_delivery_cost', '发货成本表', null, null, 'BizDeliveryCost', 'crud', 'com.ruoyi.system', 'system', 'cost', '发货成本', 'ruoyi', '0', '/', null, 'admin', '2021-09-04 23:57:42', '', null, null);
INSERT INTO `gen_table` VALUES ('2', 'biz_delivery_log', '发货记录表', null, null, 'BizDeliveryLog', 'crud', 'com.ruoyi.system', 'system', 'log', '发货记录', 'ruoyi', '0', '/', null, 'admin', '2021-09-04 23:57:42', '', null, null);
INSERT INTO `gen_table` VALUES ('3', 'biz_order_detail', '订单详情表', null, null, 'BizOrderDetail', 'crud', 'com.ruoyi.system', 'system', 'detail', '订单详情', 'ruoyi', '0', '/', null, 'admin', '2021-09-04 23:57:42', '', null, null);
INSERT INTO `gen_table` VALUES ('4', 'biz_order_master', '订单主表', null, null, 'BizOrderMaster', 'crud', 'com.ruoyi.system', 'system', 'master', '订单主', 'ruoyi', '0', '/', null, 'admin', '2021-09-04 23:57:43', '', null, null);
INSERT INTO `gen_table` VALUES ('5', 'biz_platform_token', '三方平台', null, null, 'BizPlatformToken', 'crud', 'com.ruoyi.system', 'system', 'token', '三方平台', 'ruoyi', '0', '/', null, 'admin', '2021-09-04 23:57:44', '', null, null);
INSERT INTO `gen_table` VALUES ('6', 'biz_product_category', '商品分类表', null, null, 'BizProductCategory', 'crud', 'com.ruoyi.system', 'system', 'category', '商品分类', 'ruoyi', '0', '/', null, 'admin', '2021-09-04 23:57:44', '', null, null);
INSERT INTO `gen_table` VALUES ('7', 'biz_product_info', '商品信息表', null, null, 'BizProductInfo', 'crud', 'com.ruoyi.system', 'system', 'info', '商品信息', 'ruoyi', '0', '/', null, 'admin', '2021-09-04 23:57:44', '', null, null);
INSERT INTO `gen_table` VALUES ('8', 'biz_purchasing', '进货表表', null, null, 'BizPurchasing', 'crud', 'com.ruoyi.system', 'system', 'purchasing', '进货', 'ruoyi', '0', '/', null, 'admin', '2021-09-04 23:57:45', '', null, null);
INSERT INTO `gen_table` VALUES ('9', 'biz_purchasing_detail', '进货单详情表', null, null, 'BizPurchasingDetail', 'crud', 'com.ruoyi.system', 'system', 'detail', '进货单详情', 'ruoyi', '0', '/', null, 'admin', '2021-09-04 23:57:45', '', null, null);
INSERT INTO `gen_table` VALUES ('10', 'biz_supplier_info', '供应商信息表', null, null, 'BizSupplierInfo', 'crud', 'com.ruoyi.system', 'system', 'info', '供应商信息', 'ruoyi', '0', '/', null, 'admin', '2021-09-04 23:57:45', '', null, null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'id', '发货成本表ID', 'int(10) unsigned', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('2', '1', 'product_id', '订单商品ID', 'int(10) unsigned', 'Integer', 'productId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('3', '1', 'category_id', '产品分类ID', 'int(10) unsigned', 'Integer', 'categoryId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('4', '1', 'product_code', '商品编号', 'varchar(50)', 'String', 'productCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('5', '1', 'supplier_code', '供货商编号', 'varchar(50)', 'String', 'supplierCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('6', '1', 'split_shipment', '是否拆单', 'int(11)', 'Long', 'splitShipment', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('7', '1', 'box_id', '包装盒商品id', 'decimal(8,0)', 'Long', 'boxId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('8', '1', 'box_cnt', '包装盒数量', 'decimal(8,0)', 'Long', 'boxCnt', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('9', '1', 'extra_package_cost', '额外包装成本', 'decimal(8,2)', 'BigDecimal', 'extraPackageCost', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('10', '1', 'package_cost', '打包人工成本需要单独支付', 'decimal(8,2)', 'BigDecimal', 'packageCost', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('11', '1', 'w_id', '仓库ID', 'int(10) unsigned', 'Integer', 'wId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('12', '1', 'unpay_delivery_cost', '单独支付给仓库快递费', 'decimal(10,2)', 'BigDecimal', 'unpayDeliveryCost', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('13', '1', 'delivery_cost', '统一结算快递费', 'decimal(10,2)', 'BigDecimal', 'deliveryCost', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '13', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('14', '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '14', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('15', '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '15', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('16', '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '16', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('17', '1', 'modified_time', '最后修改时间', 'timestamp', 'Date', 'modifiedTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '17', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('18', '2', 'id', '发货记录表ID', 'int(10) unsigned', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('19', '2', 'order_id', '订单ID', 'int(10) unsigned', 'Integer', 'orderId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('20', '2', 'order_cache', '订单快照', 'varchar(500)', 'String', 'orderCache', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '3', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('21', '2', 'box_json', '包装盒使用记录', 'varchar(200)', 'String', 'boxJson', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('22', '2', 'split_shipment', '是否拆单0否1是', 'tinyint(4)', 'Integer', 'splitShipment', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('23', '2', 'extra_package_cost', '额外包装成本', 'decimal(8,0)', 'Long', 'extraPackageCost', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('24', '2', 'package_cost', '人工成本需要单独支付', 'decimal(8,0)', 'Long', 'packageCost', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('25', '2', 'delivery_cost', '单独支付快递成本', 'decimal(8,0)', 'Long', 'deliveryCost', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('26', '2', 'w_id', '仓库ID', 'int(10) unsigned', 'Integer', 'wId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('27', '2', 'pay_extra_package', '是否结清包装人工0否1是', 'tinyint(4)', 'Integer', 'payExtraPackage', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('28', '2', 'pay_extra_delivery', '是否结清快递0否1是', 'tinyint(4)', 'Integer', 'payExtraDelivery', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('29', '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '12', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('30', '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '13', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('31', '2', 'remark', '备注', 'varchar(100)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '14', 'admin', '2021-09-04 23:57:42', '', null);
INSERT INTO `gen_table_column` VALUES ('32', '3', 'id', '订单详情表ID', 'int(10) unsigned', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('33', '3', 'order_id', '订单表ID', 'int(10) unsigned', 'Integer', 'orderId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('34', '3', 'product_id', '订单商品ID', 'int(10) unsigned', 'Integer', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('35', '3', 'product_name', '商品名称', 'varchar(50)', 'String', 'productName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('36', '3', 'product_code', '商品编号', 'varchar(50)', 'String', 'productCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('37', '3', 'supplier_code', '供货商编号', 'varchar(50)', 'String', 'supplierCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('38', '3', 'product_cnt', '购买商品数量', 'int(11)', 'Long', 'productCnt', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('39', '3', 'product_price', '购买商品单价', 'decimal(8,2)', 'BigDecimal', 'productPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('40', '3', 'average_cost', '平均成本价格', 'decimal(8,2)', 'BigDecimal', 'averageCost', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('41', '3', 'weight', '商品重量', 'float', 'Long', 'weight', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('42', '3', 'fee_money', '优惠分摊金额', 'decimal(8,2)', 'BigDecimal', 'feeMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('43', '3', 'w_id', '仓库ID', 'int(10) unsigned', 'Integer', 'wId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('44', '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '13', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('45', '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '14', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('46', '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '15', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('47', '3', 'modified_time', '最后修改时间', 'timestamp', 'Date', 'modifiedTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '16', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('48', '4', 'id', '订单ID', 'int(10) unsigned', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('49', '4', 'order_sn', '订单编号', 'bigint(20) unsigned', 'Long', 'orderSn', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('50', '4', 'customer_id', '下单人ID', 'int(10) unsigned', 'Integer', 'customerId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('51', '4', 'shipping_user', '收货人姓名', 'varchar(10)', 'String', 'shippingUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('52', '4', 'province', '省', 'smallint(6)', 'Integer', 'province', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('53', '4', 'city', '市', 'smallint(6)', 'Integer', 'city', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('54', '4', 'district', '区', 'smallint(6)', 'Integer', 'district', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('55', '4', 'address', '地址', 'varchar(100)', 'String', 'address', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('56', '4', 'payment_method', '支付方式：1现金，2余额，3网银，4支付宝，5微信', 'tinyint(4)', 'Integer', 'paymentMethod', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('57', '4', 'order_money', '订单金额', 'decimal(8,2)', 'BigDecimal', 'orderMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('58', '4', 'district_money', '优惠金额', 'decimal(8,2)', 'BigDecimal', 'districtMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('59', '4', 'shipping_money', '运费金额', 'decimal(8,2)', 'BigDecimal', 'shippingMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('60', '4', 'payment_money', '支付金额', 'decimal(8,2)', 'BigDecimal', 'paymentMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '13', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('61', '4', 'shipping_comp_name', '快递公司名称', 'varchar(10)', 'String', 'shippingCompName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '14', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('62', '4', 'shipping_sn', '快递单号', 'varchar(50)', 'String', 'shippingSn', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '15', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('63', '4', 'split_shipment', '是否拆分发货0否1是', 'tinyint(4)', 'Integer', 'splitShipment', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '16', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('64', '4', 'channel_sn', '渠道单号', 'varchar(50)', 'String', 'channelSn', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '17', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('65', '4', 'channel_name', '渠道名', 'varchar(50)', 'String', 'channelName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '18', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('66', '4', 'dept_id', '订单所在部门id', 'bigint(20)', 'Long', 'deptId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '19', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('67', '4', 'create_time', '下单时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '20', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('68', '4', 'shipping_time', '发货时间', 'datetime', 'Date', 'shippingTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '21', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('69', '4', 'pay_time', '支付时间', 'datetime', 'Date', 'payTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '22', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('70', '4', 'receive_time', '收货时间', 'datetime', 'Date', 'receiveTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '23', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('71', '4', 'order_status', '订单状态', 'tinyint(4)', 'Integer', 'orderStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '24', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('72', '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '25', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('73', '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '26', 'admin', '2021-09-04 23:57:43', '', null);
INSERT INTO `gen_table_column` VALUES ('74', '4', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '27', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('75', '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '28', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('76', '5', 'id', null, 'int(11)', 'Long', 'id', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('77', '5', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('78', '5', 'refresh_token', null, 'varchar(50)', 'String', 'refreshToken', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('79', '5', 'access_token', null, 'varchar(50)', 'String', 'accessToken', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('80', '5', 'code', null, 'varchar(50)', 'String', 'code', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('81', '5', 'expire_time', '到期时间', 'datetime', 'Date', 'expireTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '6', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('82', '5', 'platform', '平台类型', 'varchar(50)', 'String', 'platform', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('83', '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '8', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('84', '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '9', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('85', '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '10', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('86', '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '11', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('87', '5', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '1', '1', '1', '1', null, 'EQ', 'textarea', '', '12', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('88', '5', 'store_name', '店铺名', 'varchar(50)', 'String', 'storeName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '13', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('89', '6', 'category_id', '分类ID', 'smallint(5) unsigned', 'Integer', 'categoryId', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('90', '6', 'category_name', '分类名称', 'varchar(10)', 'String', 'categoryName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('91', '6', 'category_code', '分类编码', 'varchar(10)', 'String', 'categoryCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('92', '6', 'parent_id', '父分类ID', 'smallint(5) unsigned', 'Integer', 'parentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('93', '6', 'category_level', '分类层级', 'tinyint(4)', 'Integer', 'categoryLevel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('94', '6', 'category_status', '分类状态', 'tinyint(4)', 'Integer', 'categoryStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '6', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('95', '6', 'modified_time', '最后修改时间', 'timestamp', 'Date', 'modifiedTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '7', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('96', '7', 'id', '商品ID', 'int(10) unsigned', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('97', '7', 'product_code', '商品编码', 'char(16)', 'String', 'productCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('98', '7', 'product_name', '商品名称', 'varchar(20)', 'String', 'productName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('99', '7', 'bar_code', '国条码', 'varchar(50)', 'String', 'barCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('100', '7', 'one_category_id', '一级分类ID', 'smallint(5) unsigned', 'Integer', 'oneCategoryId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('101', '7', 'two_category_id', '二级分类ID', 'smallint(5) unsigned', 'Integer', 'twoCategoryId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('102', '7', 'three_category_id', '三级分类ID', 'smallint(5) unsigned', 'Integer', 'threeCategoryId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('103', '7', 'supplier_id', '商品的供应商ID', 'int(10) unsigned', 'Integer', 'supplierId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('104', '7', 'supplier_code', '供应商编码', 'char(16)', 'String', 'supplierCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('105', '7', 'publish_status', '上下架状态：0下架1上架', 'tinyint(4)', 'Integer', 'publishStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '10', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('106', '7', 'audit_status', '审核状态：0未审核，1已审核', 'tinyint(4)', 'Integer', 'auditStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '11', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('107', '7', 'weight', '商品重量', 'float', 'Long', 'weight', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('108', '7', 'length', '商品长度', 'float', 'Long', 'length', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '13', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('109', '7', 'height', '商品高度', 'float', 'Long', 'height', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('110', '7', 'width', '商品宽度', 'float', 'Long', 'width', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '15', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('111', '7', 'product_models', '产品型号', 'varchar(20)', 'String', 'productModels', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '16', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('112', '7', 'default_cost', '商品默认出厂成本', 'decimal(18,2)', 'BigDecimal', 'defaultCost', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '17', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('113', '7', 'shelf_life', '商品有效期', 'int(11)', 'Long', 'shelfLife', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '18', 'admin', '2021-09-04 23:57:44', '', null);
INSERT INTO `gen_table_column` VALUES ('114', '7', 'descript', '商品描述', 'text', 'String', 'descript', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', '19', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('115', '7', 'remind', '商品提醒', 'varchar(50)', 'String', 'remind', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '20', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('116', '7', 'many_models', '拥有多型号：0否1是', 'tinyint(4)', 'Integer', 'manyModels', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '21', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('117', '7', 'indate', '商品录入时间', 'timestamp', 'Date', 'indate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '22', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('118', '7', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '23', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('119', '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '24', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('120', '7', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '25', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('121', '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '26', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('122', '7', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '1', '1', '1', '1', null, 'EQ', 'textarea', '', '27', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('123', '7', 'remark2', '备注2', 'varchar(500)', 'String', 'remark2', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', '28', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('124', '7', 'remark3', '备注3', 'varchar(500)', 'String', 'remark3', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', '29', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('125', '8', 'id', '进货表ID', 'int(10) unsigned', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('126', '8', 'total_goods_pice', '货物总价', 'decimal(8,0)', 'Long', 'totalGoodsPice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('127', '8', 'extra_package_cost', '额外包装成本', 'decimal(8,0)', 'Long', 'extraPackageCost', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('128', '8', 'delivery_cost', '运输成本', 'decimal(8,0)', 'Long', 'deliveryCost', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('129', '8', 'w_id', '仓库ID', 'int(10) unsigned', 'Integer', 'wId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('130', '8', 'purchasing_time', '进货时间', 'datetime', 'Date', 'purchasingTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '6', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('131', '8', 'pay_time', '结算时间', 'datetime', 'Date', 'payTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '7', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('132', '8', 'enter_time', '进仓时间', 'datetime', 'Date', 'enterTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '8', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('133', '8', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '9', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('134', '8', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '10', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('135', '8', 'remark', '备注', 'varchar(100)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '11', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('136', '9', 'id', '进货表详情ID', 'int(10) unsigned', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('137', '9', 'purchasing_id', '进货单ID', 'int(10) unsigned', 'Integer', 'purchasingId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('138', '9', 'product_code', '商品编码', 'char(16)', 'String', 'productCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('139', '9', 'product_name', '商品名称', 'varchar(20)', 'String', 'productName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('140', '9', 'product_models_id', '商品型号id', 'varchar(20)', 'String', 'productModelsId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('141', '9', 'count', '数量', 'int(10)', 'Integer', 'count', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('142', '9', 'pice', '单价', 'decimal(8,0)', 'Long', 'pice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('143', '9', 'supplier_id', '商品的供应商ID', 'int(10) unsigned', 'Integer', 'supplierId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('144', '9', 'supplier_code', '供应商编码', 'char(16)', 'String', 'supplierCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('145', '9', 'w_id', '仓库ID', 'int(10) unsigned', 'Integer', 'wId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('146', '9', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '11', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('147', '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '12', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('148', '9', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '13', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('149', '9', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '14', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('150', '9', 'remark', '备注', 'varchar(100)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '15', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('151', '10', 'supplier_id', '供应商ID', 'int(10) unsigned', 'Integer', 'supplierId', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('152', '10', 'supplier_code', '供应商编码', 'char(8)', 'String', 'supplierCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('153', '10', 'supplier_name', '供应商名称', 'char(50)', 'String', 'supplierName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('154', '10', 'supplier_type', '供应商类型：1.自营，2.平台', 'tinyint(4)', 'Integer', 'supplierType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '4', 'admin', '2021-09-04 23:57:45', '', null);
INSERT INTO `gen_table_column` VALUES ('155', '10', 'link_man', '供应商联系人', 'varchar(10)', 'String', 'linkMan', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-09-04 23:57:46', '', null);
INSERT INTO `gen_table_column` VALUES ('156', '10', 'principal_man', '供应商负责人', 'varchar(10)', 'String', 'principalMan', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2021-09-04 23:57:46', '', null);
INSERT INTO `gen_table_column` VALUES ('157', '10', 'phone_number', '联系电话', 'varchar(50)', 'String', 'phoneNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2021-09-04 23:57:46', '', null);
INSERT INTO `gen_table_column` VALUES ('158', '10', 'bank_name', '供应商开户银行名称', 'varchar(50)', 'String', 'bankName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '8', 'admin', '2021-09-04 23:57:46', '', null);
INSERT INTO `gen_table_column` VALUES ('159', '10', 'bank_account', '银行账号', 'varchar(50)', 'String', 'bankAccount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2021-09-04 23:57:46', '', null);
INSERT INTO `gen_table_column` VALUES ('160', '10', 'address', '供应商地址', 'varchar(200)', 'String', 'address', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2021-09-04 23:57:46', '', null);
INSERT INTO `gen_table_column` VALUES ('161', '10', 'supplier_status', '状态：0禁止，1启用', 'tinyint(4)', 'Integer', 'supplierStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '11', 'admin', '2021-09-04 23:57:46', '', null);
INSERT INTO `gen_table_column` VALUES ('162', '10', 'modified_time', '最后修改时间', 'timestamp', 'Date', 'modifiedTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2021-09-04 23:57:46', '', null);

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历信息表';

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务详细信息表';

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017B97994EE078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017B97994EE078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017B97994EE078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '之前配置文件中org.quartz.scheduler.instanceId配置的名字，就会写入该字段',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态表';

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'DESKTOP-RCVRJ6D1630765872651', '1630771254584', '15000');

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_ name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_ name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1630765880000', '-1', '5', 'PAUSED', 'CRON', '1630765873000', '0', null, '2', '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1630765875000', '-1', '5', 'PAUSED', 'CRON', '1630765873000', '0', null, '2', '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1630765880000', '-1', '5', 'PAUSED', 'CRON', '1630765874000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-08-30 23:06:52', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-08-30 23:06:52', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-08-30 23:06:52', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2021-08-30 23:06:52', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-08-30 23:06:52', '', null, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-30 23:06:51', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-30 23:06:51', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-30 23:06:51', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-30 23:06:51', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-30 23:06:51', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-30 23:06:51', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-30 23:06:51', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-30 23:06:51', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-30 23:06:51', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-30 23:06:51', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-08-30 23:06:51', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-08-30 23:06:51', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-08-30 23:06:51', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-08-30 23:06:51', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-08-30 23:06:51', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-08-30 23:06:51', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-08-30 23:06:51', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-08-30 23:06:51', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-08-30 23:06:51', '', null, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2021-08-30 23:06:51', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2021-08-30 23:06:51', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2021-08-30 23:06:51', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2021-08-30 23:06:51', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2021-08-30 23:06:51', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2021-08-30 23:06:51', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2021-08-30 23:06:51', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2021-08-30 23:06:51', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2021-08-30 23:06:51', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2021-08-30 23:06:51', '', null, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-08-30 23:06:52', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-08-30 23:06:52', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-08-30 23:06:52', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 23:13:04');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 23:48:07');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-04 23:56:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '1', '0', 'M', '0', '0', '', 'system', 'admin', '2021-08-30 23:06:51', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2021-08-30 23:06:51', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2021-08-30 23:06:51', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '若依官网', '0', '4', 'http://ruoyi.vip', null, '0', '0', 'M', '0', '0', '', 'guide', 'admin', '2021-08-30 23:06:51', '', null, '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-08-30 23:06:51', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-08-30 23:06:51', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-08-30 23:06:51', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-08-30 23:06:51', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-08-30 23:06:51', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-08-30 23:06:51', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-08-30 23:06:51', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-08-30 23:06:51', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2021-08-30 23:06:51', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-08-30 23:06:51', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-08-30 23:06:51', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-08-30 23:06:51', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-08-30 23:06:51', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-08-30 23:06:51', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', 'build', 'tool/build/index', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-08-30 23:06:51', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', 'gen', 'tool/gen/index', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-08-30 23:06:51', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-08-30 23:06:51', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-08-30 23:06:51', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-08-30 23:06:51', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告查询', '107', '1', '#', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告新增', '107', '2', '#', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告修改', '107', '3', '#', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '公告删除', '107', '4', '#', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '7', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '115', '1', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '115', '2', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '115', '3', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '115', '2', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '115', '4', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '115', '5', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-08-30 23:06:51', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-08-30 23:06:52', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-08-30 23:06:52', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'biz_delivery_cost,biz_delivery_log,biz_order_detail,biz_order_master,biz_platform_token,biz_product_category,biz_product_info,biz_purchasing,biz_purchasing_detail,biz_supplier_info', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-09-04 23:57:46');
INSERT INTO `sys_oper_log` VALUES ('101', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-09-04 23:58:24');
INSERT INTO `sys_oper_log` VALUES ('102', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-09-05 00:00:04');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2021-08-30 23:06:51', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2021-08-30 23:06:51', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2021-08-30 23:06:51', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2021-08-30 23:06:51', '', null, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) NOT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-09-04 23:56:42', 'admin', '2021-08-30 23:06:51', '', '2021-09-04 23:56:44', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-08-30 23:06:51', 'admin', '2021-08-30 23:06:51', '', null, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
