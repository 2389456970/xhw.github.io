-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 12 月 20 日 13:25
-- 服务器版本: 5.5.53
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `dianpu`
--

-- --------------------------------------------------------

--
-- 表的结构 `ci_account`
--

CREATE TABLE IF NOT EXISTS `ci_account` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `number` varchar(15) COLLATE utf8_unicode_ci DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `amount` double DEFAULT '0',
  `date` date DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `number` (`number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_account_info`
--

CREATE TABLE IF NOT EXISTS `ci_account_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billNo` varchar(25) DEFAULT '' COMMENT '销售单号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `accId` int(11) DEFAULT '0' COMMENT '结算账户ID',
  `payment` double DEFAULT '0' COMMENT '收款金额  采购退回为正',
  `wayId` int(11) DEFAULT '0' COMMENT '结算方式ID',
  `settlement` varchar(50) DEFAULT '' COMMENT '结算号',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  `transType` int(11) DEFAULT '0',
  `transTypeName` varchar(50) DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `billdate` (`billDate`) USING BTREE,
  KEY `iid` (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_address`
--

CREATE TABLE IF NOT EXISTS `ci_address` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `shortName` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT ' ',
  `postalcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `area` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `linkman` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `isdefault` tinyint(1) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`postalcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_admin`
--

CREATE TABLE IF NOT EXISTS `ci_admin` (
  `uid` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户名称',
  `userpwd` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否锁定',
  `name` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `lever` text COLLATE utf8_unicode_ci COMMENT '权限',
  `roleid` tinyint(1) DEFAULT '1' COMMENT '角色ID',
  `rightids` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1,2,4,8',
  `righttype1` text COLLATE utf8_unicode_ci,
  `righttype2` text COLLATE utf8_unicode_ci,
  `righttype3` text COLLATE utf8_unicode_ci,
  `righttype4` text COLLATE utf8_unicode_ci,
  `righttype8` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ci_admin`
--

INSERT INTO `ci_admin` (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`, `rightids`, `righttype1`, `righttype2`, `righttype3`, `righttype4`, `righttype8`) VALUES
(1, 'admin', 'd451119cf9093ecaa9a2b1190b7b2421', 1, '小阳', '13616216627', NULL, 0, '', NULL, NULL, NULL, NULL, NULL),
(2, 'qq123456', '633cf9a94c83a223a91adcb8f42bc3c3', 1, '小丽', '13616216521', '188,189,190,191,192,193', 1, '1,2,4,8', '1', '2', NULL, 'a:1:{i:0;a:2:{s:7:"FITEMID";i:2;s:6:"FRIGHT";i:1;}}', '2');

-- --------------------------------------------------------

--
-- 表的结构 `ci_assistingprop`
--

CREATE TABLE IF NOT EXISTS `ci_assistingprop` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `disable` tinyint(1) DEFAULT '0' COMMENT '状态',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_assistsku`
--

CREATE TABLE IF NOT EXISTS `ci_assistsku` (
  `skuId` int(11) NOT NULL AUTO_INCREMENT,
  `skuClassId` int(11) DEFAULT '0',
  `skuAssistId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skuName` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`skuId`),
  KEY `id` (`skuClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_category`
--

CREATE TABLE IF NOT EXISTS `ci_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `parentId` smallint(6) DEFAULT '0' COMMENT '上级栏目ID',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目路径',
  `level` tinyint(2) DEFAULT '1' COMMENT '层次',
  `ordnum` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `typeNumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '区别',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `detail` tinyint(4) DEFAULT '1',
  `sortIndex` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parentId` (`parentId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- 转存表中的数据 `ci_category`
--

INSERT INTO `ci_category` (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES
(51, '饭店', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0),
(52, '大米油', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0),
(53, '调味', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0),
(54, '酒水', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0),
(55, '大米', 0, '', 1, 0, 1, 'paccttype', '', 1, 0, 0),
(56, '大米', 0, '56', 1, 0, 1, 'trade', '', 1, 0, 0),
(57, '油', 0, '57', 1, 0, 1, 'trade', '', 1, 0, 0),
(58, '水', 0, '58', 1, 0, 1, 'trade', '', 1, 0, 0),
(59, '酒', 0, '59', 1, 0, 1, 'trade', '', 1, 0, 0),
(60, '饮料', 0, '60', 1, 0, 1, 'trade', '', 1, 0, 0),
(61, '调料', 0, '61', 1, 0, 1, 'trade', '', 1, 0, 0),
(62, '烟', 0, '62', 1, 0, 1, 'trade', '', 1, 0, 0),
(63, '烟草', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0),
(64, 'RMB', 0, '', 1, 0, 1, 'raccttype', '', 1, 0, 0),
(65, '现金', 0, '', 1, 0, 1, 'PayMethod', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_contact`
--

CREATE TABLE IF NOT EXISTS `ci_contact` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '客户名称',
  `number` varchar(50) DEFAULT '0' COMMENT '客户编号',
  `cCategory` smallint(6) DEFAULT '0' COMMENT '客户类别',
  `cCategoryName` varchar(50) DEFAULT '' COMMENT '分类名称',
  `taxRate` double DEFAULT '0' COMMENT '税率',
  `amount` double DEFAULT '0' COMMENT '期初应付款',
  `periodMoney` double DEFAULT '0' COMMENT '期初预付款',
  `difMoney` double DEFAULT '0' COMMENT '初期往来余额',
  `beginDate` date DEFAULT NULL COMMENT '余额日期',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `linkMans` text COMMENT '客户联系方式',
  `type` tinyint(1) DEFAULT '-10' COMMENT '-10客户  10供应商',
  `contact` varchar(255) DEFAULT '',
  `cLevel` smallint(5) DEFAULT '1' COMMENT '客户等级ID',
  `cLevelName` varchar(50) DEFAULT '' COMMENT '客户等级',
  `pinYin` varchar(50) DEFAULT '',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用   1禁用',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '0正常 1删除',
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ci_contact`
--

INSERT INTO `ci_contact` (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES
(1, '康志', '100', 5, '001', 0, 1, 1, 0, '2015-10-01', '', '[{"linkName":"1","linkMobile":"","linkPhone":"","linkIm":"","linkFirst":1,"id":0}]', -10, '', 0, '零售客户', '', 0, 1),
(2, '饭店', 'AA', 51, '饭店', 0, 0, 0, 0, '2015-10-01', '123123333333333311111', '[]', -10, '', 0, '零售客户', '', 1, 0),
(3, '烟草公司', 'AB', 63, '烟草', 0, 11, 111, -100, '2015-10-21', '', '[]', 10, '', 1, '', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_goods`
--

CREATE TABLE IF NOT EXISTS `ci_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '商品编号',
  `quantity` double DEFAULT '0' COMMENT '起初数量',
  `spec` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '规格',
  `baseUnitId` smallint(6) DEFAULT '0' COMMENT '单位ID',
  `unitName` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单位名称',
  `categoryId` smallint(6) DEFAULT '0' COMMENT '商品分类ID',
  `categoryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '分类名称',
  `purPrice` double DEFAULT '0' COMMENT '预计采购价',
  `salePrice` double DEFAULT '0' COMMENT '预计销售价',
  `unitCost` double DEFAULT '0' COMMENT '单位成本',
  `amount` double DEFAULT '0' COMMENT '期初总价',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `goods` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `propertys` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '初期设置',
  `vipPrice` double DEFAULT '0' COMMENT '会员价',
  `lowQty` double DEFAULT '0',
  `length` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `height` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `highQty` double DEFAULT '0',
  `isSerNum` double DEFAULT '0',
  `barCode` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `discountRate1` double DEFAULT '0' COMMENT '0',
  `discountRate2` double DEFAULT '0',
  `locationId` int(11) DEFAULT '0',
  `locationName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `wholesalePrice` double DEFAULT '0',
  `width` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `skuAssistId` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '辅助属性分类',
  `pinYin` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `unitId` smallint(6) DEFAULT '0',
  `files` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '图片路径',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用   1禁用',
  `unitTypeId` int(11) DEFAULT '0',
  `assistIds` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `assistName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `assistUnit` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `jianxing` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `josl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `skuClassId` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `property` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `safeDays` double DEFAULT '0',
  `advanceDay` double DEFAULT '0',
  `isWarranty` double DEFAULT '0',
  `delete` int(11) DEFAULT '0',
  `weight` double DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '0正常  1删除',
  `warehouseWarning` text,
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- 转存表中的数据 `ci_goods`
--

INSERT INTO `ci_goods` (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`, `warehouseWarning`) VALUES
(1, '石狮烟', 'B119', 0, '10包', 5, '条', 62, '烟', 23.9, 30, 0, 0, '', 1, '', NULL, 0, 1, '', '', 2, 0, '6901028137423', 0, 0, 1, '仓库', 30, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(2, '（蓝）七匹狼烟', 'B178', 0, '10包', 5, '条', 62, '烟', 66.8, 69, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028141147', 0, 0, 1, '仓库', 69, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(3, '（白）七匹狼烟', 'B179', 0, '10包', 5, '条', 62, '烟', 66.8, 69, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028137270', 0, 0, 1, '仓库', 69, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(4, '（豪迈）七匹狼烟', 'B176', 0, '10包', 5, '条', 62, '烟', 93.3, 97, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028141789', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(5, '(豪运)七匹狼烟', 'B175', 0, '10包', 5, '条', 62, '烟', 85.9, 89, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028141444', 0, 0, 1, '仓库', 89, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(6, '（如意紫软）云烟', 'B118', 0, '10包', 5, '条', 62, '烟', 93.3, 96, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028310628', 0, 0, 1, '仓库', 96, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(7, '（紫硬）云烟', 'B117', 0, '10包', 5, '条', 62, '烟', 88, 90, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028046893', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(8, '（硬）中华香烟', 'B116', 0, '10包', 5, '条', 62, '烟', 381.8, 400, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028075015', 0, 0, 1, '仓库', 395, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(9, '（硬）红双喜烟', 'B115', 0, '10包', 5, '条', 62, '烟', 75.3, 79, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028075145', 0, 0, 1, '仓库', 79, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(10, '（软蓝）利群烟', 'B114', 0, '10包', 5, '条', 62, '烟', 159, 164, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028117586', 0, 0, 1, '仓库', 164, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(11, '（硬红）七匹狼烟', 'B174', 0, '10包', 5, '条', 62, '烟', 132.5, 137, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028137492', 0, 0, 1, '仓库', 137, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(12, '(软红)七匹锒烟', 'B173', 0, '10包', 5, '条', 62, '烟', 143.1, 149, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028137676', 0, 0, 1, '仓库', 149, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(13, '(灰软)七匹狼烟', 'B172', 0, '10包', 5, '条', 62, '烟', 185.5, 190, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028138536', 0, 0, 1, '仓库', 190, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(14, '（纯雅）七匹狼烟', 'B171', 0, '10包', 5, '条', 62, '烟', 143.1, 150, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028142168', 0, 0, 1, '仓库', 150, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(15, '（金满堂）黄金叶烟', 'B113', 0, '10包', 5, '条', 62, '烟', 92.8, 100, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028169257', 0, 0, 1, '仓库', 100, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(16, '（软蓝）黄鹤楼精品烟', 'B112', 0, '10包', 5, '条', 62, '烟', 164.3, 170, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028180580', 0, 0, 1, '仓库', 170, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(17, '（硬）芙蓉王烟', 'B111', 0, '10包', 5, '条', 62, '烟', 218.4, 222, 0, 0, '', 1, '', NULL, 0, 1, '', '', 5, 0, '6901028193504', 0, 0, 1, '仓库', 222, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(18, '（鸿福）七匹狼烟', 'B1791', 0, '10包', 5, '条', 62, '烟', 93, 96, 0, 0, '', 1, '', NULL, 0, 1, '', '', 2, 0, '6901028142571', 0, 0, 1, '仓库', 96, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(19, '洛河香米长粒香 (50)', 'A501', 0, '50斤', 2, '斤', 56, '大米', 112, 118, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6950293703789', 0, 0, 1, '仓库', 116, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(20, '管家猫  泰香米 (50)', 'A502', 0, '50斤', 2, '斤', 56, '大米', 112, 120, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6940727400193', 0, 0, 1, '仓库', 116, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(21, '太禾米业长腰香 (50)', 'A503', 0, '50斤', 2, '斤', 56, '大米', 127, 140, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6937903725218', 0, 0, 1, '仓库', 135, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(22, '君雪米     珍珠粥（50）', 'A504', 0, '50斤', 2, '斤', 56, '大米', 130, 137, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6936930100012', 0, 0, 1, '仓库', 135, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(23, '红乔府大院(50)长粒王', 'A505', 0, '50斤', 2, '斤', 56, '大米', 155, 165, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6937004400885', 0, 0, 1, '仓库', 160, '', NULL, '', 0, NULL, 1, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(24, '状元系列小灶台 (50）', 'A506', 0, '50斤', 2, '斤', 56, '大米', 125, 135, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6958898300167', 0, 0, 1, '仓库', 132, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(25, '七星湖  珍珠米 (50)', 'A507', 0, '50斤', 2, '斤', 56, '大米', 127, 135, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6959731600017', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(26, '金龙长粒香米（50）', 'A508', 0, '50斤', 2, '斤', 56, '大米', 0, 0, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6956496800317', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 1, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(27, '淮猫橄榄米（50）香米', 'A509', 0, '50斤', 2, '斤', 56, '大米', 115, 130, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6951439000120', 0, 0, 1, '仓库', 128, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(28, '今见福中国香米 (50)', 'A5010', 0, '50斤', 2, '斤', 56, '大米', 0, 0, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6951679800016', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 1, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(29, '田夫  纯真香米 (50)', 'A5011', 0, '50斤', 2, '斤', 56, '大米', 177.5, 188, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6934544600560', 0, 0, 1, '仓库', 186, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(30, '金润酒店专用米 (50)', 'A5012', 0, '50', 2, '斤', 56, '大米', 150, 163, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6925776560777', 0, 0, 1, '仓库', 160, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(31, '牡丹香米       (50)', 'A5013', 0, '50斤', 2, '斤', 56, '大米', 126, 128, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6923722161368', 0, 0, 1, '仓库', 126, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(32, '青橄榄  月芽米 (50)', 'A5014', 0, '50斤', 2, '斤', 56, '大米', 112.5, 118, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6934688900052', 0, 0, 1, '仓库', 116, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(33, '今知香一见飘香 (49)', 'A5015', 0, '49斤', 2, '斤', 56, '大米', 120, 129, 0, 0, '', 1, '', NULL, 126, 2, '', '', 5, 0, '6952032581849', 0, 0, 1, '仓库', 125, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(34, '迪  香一见飘香 (49)', 'A5016', 0, '49斤', 2, '斤', 56, '大米', 120, 125, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6925776535317', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 1, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(35, '湘  美一见飘香 (49）', 'A5017', 0, '49斤', 2, '斤', 56, '大米', 130, 135, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6956732600077', 0, 0, 1, '仓库', 132, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(36, '牡丹香米       (20)', 'A201', 0, '20斤', 2, '斤', 56, '大米', 48, 53, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6923722161375', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(37, '今见福中国香米 (20)', 'A202', 0, '20斤', 2, '斤', 56, '大米', 50, 55, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6951679800023', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(38, '状元系列小灶台 (20）', 'A203', 0, '20斤', 2, '斤', 56, '大米', 49, 55, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6958898300181', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(39, '绿乔府大院(20)长香王金福', 'A204', 0, '20斤', 2, '斤', 56, '大米', 84, 87, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6937004400724', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(40, '昌原  稻花香米 (20)', 'A205', 0, '20斤', 2, '斤', 56, '大米', 72, 80, 0, 0, '', 1, '', NULL, 75, 2, '', '', 5, 0, '6935953800664', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(41, '青橄榄  月芽米 (20)', 'A206', 0, '20斤', 2, '斤', 56, '大米', 46, 48, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6934688900069', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(42, '田夫  纯真香米 (20)', 'A207', 0, '20斤', 2, '斤', 56, '大米', 71, 75, 0, 0, '', 1, '', NULL, 76, 2, '', '', 5, 0, '6934544600553', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(43, '老哥俩（20）', 'A208', 0, '20斤', 2, '斤', 56, '大米', 0, 0, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6947475900364', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(44, '田夫  经典香米 (20)', 'A209', 0, '20斤', 2, '斤', 56, '大米', 71, 76, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6934544600225', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(45, '今知香一见飘香 (19)', 'A2010', 0, '19斤', 2, '斤', 56, '大米', 47, 52, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6952032581863', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(46, '泰清香茉莉香米（10）', 'A1011', 0, '10斤', 2, '斤', 56, '大米', 29, 34, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6948195862772', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(47, '老哥俩（10）', 'A1012', 0, '10斤', 2, '斤', 56, '大米', 0, 0, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6947475900371', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(48, '迪香    新早米 (10)', 'A1013', 0, '10斤', 2, '斤', 56, '大米', 24, 25, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6925776571216', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(49, '田夫  纯真香米 (10)', 'A1014', 0, '10斤', 2, '斤', 56, '大米', 0, 0, 0, 0, '', 1, '', NULL, 0, 2, '', '', 5, 0, '6934544600065', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(50, '绿乔府大院(10)长香王金福', 'A1015', 0, '10斤', 2, '斤', 56, '大米', 44, 45, 0, 0, '', 1, '', NULL, 0, 1, '', '', 2, 0, '6937004401202', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(51, '集分宝金泰香米', 'A1016', 0, '10斤', 2, '斤', 56, '大米', 30, 35, 0, 0, '', 1, '', NULL, 0, 1, '', '', 2, 0, '6925462900160', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(52, '湘  美一见飘香 (19）', 'A2011', 0, '19斤', 2, '斤', 56, '大米', 48, 55, 0, 0, '', 1, '', NULL, 0, 1, '', '', 2, 0, '6956732600145', 0, 0, 1, '仓库', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(53, '鑫龙人 盘锦大米', 'A2012', 0, '20斤', 2, '斤', 56, '大米', 50, 66, 0, 0, '', 1, '', NULL, 0, 0, '', '', 0, 0, '6935030901222', 0, 0, 1, '仓库', 66, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ci_goods_img`
--

CREATE TABLE IF NOT EXISTS `ci_goods_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `invId` int(11) DEFAULT '0',
  `type` varchar(100) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `thumbnailUrl` varchar(255) DEFAULT '',
  `size` int(11) DEFAULT '0',
  `deleteUrl` varchar(255) DEFAULT '',
  `deleteType` varchar(50) DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `invId` (`invId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_invoice`
--

CREATE TABLE IF NOT EXISTS `ci_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `userName` varchar(50) DEFAULT '' COMMENT '制单人',
  `transType` int(11) DEFAULT '0' COMMENT '150501购货 150502退货 150601销售 150602退销 150706其他入库',
  `totalAmount` double DEFAULT '0' COMMENT '购货总金额',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpAmount` double DEFAULT '0' COMMENT '本次付款',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disRate` double DEFAULT '0' COMMENT '折扣率',
  `disAmount` double DEFAULT '0' COMMENT '折扣金额',
  `totalQty` double DEFAULT '0' COMMENT '总数量',
  `totalArrears` double DEFAULT '0',
  `billStatus` tinyint(1) DEFAULT '0' COMMENT '订单状态 ',
  `checkName` varchar(50) DEFAULT '' COMMENT '采购单审核人',
  `totalTax` double DEFAULT '0',
  `totalTaxAmount` double DEFAULT '0',
  `checked` tinyint(1) DEFAULT '0' COMMENT '采购单状态',
  `accId` tinyint(4) DEFAULT '0' COMMENT '结算账户ID',
  `billType` varchar(20) DEFAULT '' COMMENT 'PO采购订单 OI其他入库 PUR采购入库 BAL初期余额',
  `modifyTime` datetime DEFAULT NULL COMMENT '更新时间',
  `hxStateCode` tinyint(4) DEFAULT '0' COMMENT '0未付款  1部分付款  2全部付款',
  `transTypeName` varchar(20) DEFAULT '',
  `totalDiscount` double DEFAULT '0',
  `salesId` smallint(6) DEFAULT '0' COMMENT '销售人员ID',
  `customerFree` double DEFAULT '0' COMMENT '客户承担费用',
  `hxAmount` double DEFAULT '0' COMMENT '本次核销金额',
  `hasCheck` double DEFAULT '0' COMMENT '已核销',
  `notCheck` double DEFAULT '0' COMMENT '未核销',
  `nowCheck` double DEFAULT '0' COMMENT '本次核销',
  `payment` double DEFAULT '0' COMMENT '本次预收款',
  `discount` double DEFAULT '0' COMMENT '整单折扣',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除  0正常',
  `srcOrderId` int(11) DEFAULT '0',
  `srcOrderNo` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `accId` (`accId`),
  KEY `buId` (`buId`),
  KEY `salesId` (`salesId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `ci_invoice`
--

INSERT INTO `ci_invoice` (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`, `srcOrderId`, `srcOrderNo`) VALUES
(1, 0, 'CG201509291033157', 1, '小阳', 150501, 1, 1, 0, '2015-09-29', '111111', 1, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'PUR', '2015-09-29 10:37:38', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2, 0, 'XS201509291048510', 1, '小阳', 150601, 1, 1, 0, '2015-09-29', '2121312', 1, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2015-09-29 10:49:02', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(3, 3, 'CG201510211000285', 1, '小阳', 150501, 10000, 10000, 0, '2015-08-01', '', 10000, 0, 0, 100, 0, 0, '', 0, 0, 0, 0, 'PUR', '2015-10-21 10:11:15', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4, 2, 'XS201510211000450', 1, '小阳', 150601, 4000, 4000, 0, '2015-10-21', '', 4000, 0, 0, 20, 0, 0, '', 0, 0, 0, 0, 'SALE', '2015-10-21 10:00:45', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(10, 2, 'QTCK201510211027058', 1, '小阳', 150806, -588, 0, 0, '2015-10-21', '', 0, 0, 0, 6, 0, 0, '', 0, 0, 0, 0, 'OO', '2015-10-21 10:33:10', 0, '其他出库', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(11, 3, 'CG201510211032557', 1, '小阳', 150501, 1760, 1760, 0, '2015-10-21', '', 1760, 0, 0, 20, 0, 0, '', 0, 0, 0, 0, 'PUR', '2015-10-21 10:32:55', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(12, 3, 'CG201511070859066', 1, '小阳', 150501, 1000, 1000, 0, '2015-11-07', '', 1000, 0, 0, 200, 0, 0, '', 0, 0, 0, 0, 'PUR', '2015-11-07 08:59:06', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(13, 2, 'XS201511070859106', 1, '小阳', 150601, 1, 1, 0, '2015-11-07', '', 1, 0, 0, 3, 0, 0, '', 0, 0, 0, 0, 'SALE', '2015-11-07 08:59:10', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ci_invoice_info`
--

CREATE TABLE IF NOT EXISTS `ci_invoice_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `transType` int(11) DEFAULT '0' COMMENT '150501采购 150502退货',
  `amount` double DEFAULT '0' COMMENT '购货金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `invId` int(11) DEFAULT '0' COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountRate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  `locationId` smallint(6) DEFAULT '0',
  `tax` double DEFAULT '0',
  `taxRate` double DEFAULT '0',
  `taxAmount` double DEFAULT '0',
  `unitId` smallint(6) DEFAULT '0',
  `skuId` int(11) DEFAULT '0',
  `entryId` tinyint(1) DEFAULT '1' COMMENT '区分调拨单  进和出',
  `transTypeName` varchar(25) DEFAULT '',
  `srcOrderEntryId` int(11) DEFAULT '0',
  `srcOrderId` int(11) DEFAULT '0',
  `srcOrderNo` varchar(25) DEFAULT '',
  `billType` varchar(20) DEFAULT '',
  `checked` tinyint(1) DEFAULT '0' COMMENT '0 1',
  `checkName` varchar(30) DEFAULT '',
  `salesId` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除 0正常',
  PRIMARY KEY (`id`),
  KEY `type` (`transType`),
  KEY `billdate` (`billDate`),
  KEY `invId` (`invId`) USING BTREE,
  KEY `transType` (`transType`),
  KEY `iid` (`iid`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `ci_invoice_info`
--

INSERT INTO `ci_invoice_info` (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES
(4, 1, 0, 'CG201509291033157', 150501, 1, '2015-09-29', '', 1, 1, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(6, 2, 0, 'XS201509291048510', 150601, 1, '2015-09-29', '', 1, 1, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(7, 0, 0, '期初数量', 0, 4000, '2015-10-08', '', 1, 200, 0, 0, 20, 1, 0, 0, 0, 0, 0, 1, '期初数量', 0, 0, '', 'INI', 0, '', 0, 0),
(9, 4, 2, 'XS201510211000450', 150601, 4000, '2015-10-21', '', 3, 200, 0, 0, -20, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(10, 3, 3, 'CG201510211000285', 150501, 10000, '2015-08-01', '', 3, 100, 0, 0, 100, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(20, 11, 3, 'CG201510211032557', 150501, 1760, '2015-10-21', '', 3, 88, 0, 0, 20, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(21, 10, 2, 'QTCK201510211027058', 150806, -588, '2015-10-21', '', 3, 98, 0, 0, -6, 1, 0, 0, 0, -1, -1, 1, '其他出库', 0, 0, '', 'OO', 0, '', 0, 0),
(22, 12, 3, 'CG201511070859066', 150501, 500, '2015-11-07', '', 1, 5, 0, 0, 100, 1, 0, 0, 0, 0, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(23, 12, 3, 'CG201511070859066', 150501, 500, '2015-11-07', '', 2, 5, 0, 0, 100, 1, 0, 0, 0, 0, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(24, 12, 3, 'CG201511070859066', 150501, 0, '2015-11-07', '', 3, 5, 0, 0, 0, 1, 0, 0, 0, 0, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(25, 13, 2, 'XS201511070859106', 150601, 1, '2015-11-07', '', 1, 1, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(26, 13, 2, 'XS201511070859106', 150601, 0, '2015-11-07', '', 2, 0, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(27, 13, 2, 'XS201511070859106', 150601, 0, '2015-11-07', '', 3, 0, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invoice_type`
--

CREATE TABLE IF NOT EXISTS `ci_invoice_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `inout` tinyint(1) DEFAULT '1' COMMENT '1 入库  -1出库',
  `status` tinyint(1) DEFAULT '1',
  `type` varchar(10) DEFAULT '',
  `default` tinyint(1) DEFAULT '0',
  `number` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ci_invoice_type`
--

INSERT INTO `ci_invoice_type` (`id`, `name`, `inout`, `status`, `type`, `default`, `number`) VALUES
(1, '其他入库', 1, 1, 'in', 1, 150706),
(2, '盘盈', 1, 1, 'in', 0, 150701),
(3, '其他出库', -1, 1, 'out', 1, 150806),
(4, '盘亏', -1, 1, 'out', 0, 150801);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invps`
--

CREATE TABLE IF NOT EXISTS `ci_invps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `userName` varchar(50) DEFAULT '' COMMENT '制单人',
  `transType` int(11) DEFAULT '0' COMMENT '150501购货 150502退货 150601销售 150602退销 150706其他入库',
  `totalAmount` double DEFAULT '0' COMMENT '购货总金额',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpAmount` double DEFAULT '0' COMMENT '本次付款',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disRate` double DEFAULT '0' COMMENT '折扣率',
  `disAmount` double DEFAULT '0' COMMENT '折扣金额',
  `totalQty` double DEFAULT '0' COMMENT '总数量',
  `totalArrears` double DEFAULT '0',
  `billStatus` tinyint(1) DEFAULT '0' COMMENT '订单状态 0未入库  1 2全部入库',
  `checkName` varchar(50) DEFAULT '' COMMENT '采购单审核人',
  `totalTax` double DEFAULT '0',
  `totalTaxAmount` double DEFAULT '0',
  `checked` tinyint(1) DEFAULT '0' COMMENT '采购单状态',
  `accId` tinyint(4) DEFAULT '0' COMMENT '结算账户ID',
  `billType` varchar(20) DEFAULT '' COMMENT 'PO采购订单 OI其他入库 PUR采购入库 BAL初期余额',
  `modifyTime` datetime DEFAULT NULL COMMENT '更新时间',
  `hxStateCode` tinyint(4) DEFAULT '0' COMMENT '0未付款  1部分付款  2全部付款',
  `transTypeName` varchar(20) DEFAULT '',
  `totalDiscount` double DEFAULT '0',
  `salesId` smallint(6) DEFAULT '0' COMMENT '销售人员ID',
  `customerFree` double DEFAULT '0' COMMENT '客户承担费用',
  `hxAmount` double DEFAULT '0' COMMENT '本次核销金额',
  `hasCheck` double DEFAULT '0' COMMENT '已核销',
  `notCheck` double DEFAULT '0' COMMENT '未核销',
  `nowCheck` double DEFAULT '0' COMMENT '本次核销',
  `payment` double DEFAULT '0' COMMENT '本次预收款',
  `discount` double DEFAULT '0' COMMENT '整单折扣',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除  0正常',
  `deliveryDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accId` (`accId`),
  KEY `buId` (`buId`),
  KEY `salesId` (`salesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_invps_info`
--

CREATE TABLE IF NOT EXISTS `ci_invps_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `transType` int(11) DEFAULT '0' COMMENT '150501采购 150502退货',
  `amount` double DEFAULT '0' COMMENT '购货金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `invId` int(11) DEFAULT '0' COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountRate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  `locationId` smallint(6) DEFAULT '0',
  `tax` double DEFAULT '0',
  `taxRate` double DEFAULT '0',
  `taxAmount` double DEFAULT '0',
  `unitId` smallint(6) DEFAULT '0',
  `skuId` int(11) DEFAULT '0',
  `entryId` tinyint(1) DEFAULT '1' COMMENT '区分调拨单  进和出',
  `transTypeName` varchar(25) DEFAULT '',
  `srcOrderEntryId` int(11) DEFAULT '0',
  `srcOrderId` int(11) DEFAULT '0',
  `srcOrderNo` varchar(25) DEFAULT '',
  `billType` varchar(20) DEFAULT '',
  `checked` tinyint(1) DEFAULT '0' COMMENT '0 1',
  `checkName` varchar(30) DEFAULT '',
  `salesId` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除 0正常',
  PRIMARY KEY (`id`),
  KEY `type` (`transType`),
  KEY `billdate` (`billDate`),
  KEY `invId` (`invId`) USING BTREE,
  KEY `transType` (`transType`),
  KEY `iid` (`iid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_log`
--

CREATE TABLE IF NOT EXISTS `ci_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` smallint(6) DEFAULT '0' COMMENT '用户ID',
  `ip` varchar(25) DEFAULT '',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '姓名',
  `log` text COMMENT '日志内容',
  `type` tinyint(1) DEFAULT '1' COMMENT ' ',
  `loginName` varchar(50) DEFAULT '' COMMENT '用户名',
  `modifyTime` datetime DEFAULT NULL COMMENT '写入日期',
  `operateTypeName` varchar(50) DEFAULT '',
  `adddate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `adddate` (`adddate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=136 ;

--
-- 转存表中的数据 `ci_log`
--

INSERT INTO `ci_log` (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES
(1, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-15 09:31:48', '', '2015-09-15'),
(2, 1, '127.0.0.1', '小阳', '备份与恢复,备份文件名:201509150931597.sql', 1, 'admin', '2015-09-15 09:31:59', '', '2015-09-15'),
(3, 1, '127.0.0.1', '小阳', '备份与恢复,删除文件名:201508191603041.sql', 1, 'admin', '2015-09-15 09:32:03', '', '2015-09-15'),
(4, 1, '127.0.0.1', '小阳', '备份与恢复,删除文件名:201508190955474.sql', 1, 'admin', '2015-09-15 09:32:04', '', '2015-09-15'),
(5, 1, '127.0.0.1', '小阳', '备份与恢复,删除文件名:201509150931597.sql', 1, 'admin', '2015-09-15 09:32:06', '', '2015-09-15'),
(6, 1, '127.0.0.1', '小阳', '备份与恢复,备份文件名:201509150932070.sql', 1, 'admin', '2015-09-15 09:32:07', '', '2015-09-15'),
(7, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-17 10:06:21', '', '2015-09-17'),
(8, 1, '127.0.0.1', '小阳', '新增商品类别:1111', 1, 'admin', '2015-09-17 10:30:51', '', '2015-09-17'),
(9, 1, '127.0.0.1', '小阳', '新增仓库:11', 1, 'admin', '2015-09-17 10:31:09', '', '2015-09-17'),
(10, 1, '127.0.0.1', '小阳', '新增单位:分', 1, 'admin', '2015-09-17 10:31:14', '', '2015-09-17'),
(11, 1, '127.0.0.1', '小阳', '新增单位:1312', 1, 'admin', '2015-09-17 10:38:49', '', '2015-09-17'),
(12, 1, '127.0.0.1', '小阳', '新增单位:123', 1, 'admin', '2015-09-17 10:39:55', '', '2015-09-17'),
(13, 1, '127.0.0.1', '小阳', '新增商品:小不点', 1, 'admin', '2015-09-17 10:45:32', '', '2015-09-17'),
(14, 1, '127.0.0.1', '小阳', '修改商品:ID=1名称:小不点', 1, 'admin', '2015-09-17 10:54:11', '', '2015-09-17'),
(15, 1, '127.0.0.1', '小阳', '修改商品:ID=1名称:小不点', 1, 'admin', '2015-09-17 11:01:29', '', '2015-09-17'),
(16, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-24 14:16:15', '', '2015-09-24'),
(17, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-28 09:27:57', '', '2015-09-28'),
(18, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-29 10:25:30', '', '2015-09-29'),
(19, 1, '127.0.0.1', '小阳', '新增购货 单据编号：CG201509291033157', 1, 'admin', '2015-09-29 10:33:15', '', '2015-09-29'),
(20, 1, '127.0.0.1', '小阳', '修改购货单 单据编号：CG201509291033157', 1, 'admin', '2015-09-29 10:37:24', '', '2015-09-29'),
(21, 1, '127.0.0.1', '小阳', '修改购货单 单据编号：CG201509291033157', 1, 'admin', '2015-09-29 10:37:38', '', '2015-09-29'),
(22, 1, '127.0.0.1', '小阳', '新增销货 单据编号：XS201509291048510', 1, 'admin', '2015-09-29 10:48:51', '', '2015-09-29'),
(23, 1, '127.0.0.1', '小阳', '修改销货 单据编号：XS201509291048510', 1, 'admin', '2015-09-29 10:49:02', '', '2015-09-29'),
(24, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-08 13:15:54', '', '2015-10-08'),
(25, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-08 16:43:39', '', '2015-10-08'),
(26, 1, '127.0.0.1', '小阳', '删除单位:ID=1 名称:分', 1, 'admin', '2015-10-08 16:44:21', '', '2015-10-08'),
(27, 1, '127.0.0.1', '小阳', '新增单位:分', 1, 'admin', '2015-10-08 16:44:25', '', '2015-10-08'),
(28, 1, '127.0.0.1', '小阳', '新增员工:编号001 名称111', 1, 'admin', '2015-10-08 16:44:34', '', '2015-10-08'),
(29, 1, '127.0.0.1', '小阳', '删除员工:ID=1 名称:111', 1, 'admin', '2015-10-08 16:44:40', '', '2015-10-08'),
(30, 1, '127.0.0.1', '小阳', '新增员工:编号001 名称111', 1, 'admin', '2015-10-08 16:44:45', '', '2015-10-08'),
(31, 1, '127.0.0.1', '小阳', '新增结算方式:001', 1, 'admin', '2015-10-08 16:44:59', '', '2015-10-08'),
(32, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-08 17:55:05', '', '2015-10-08'),
(33, 1, '127.0.0.1', '小阳', '采购明细表导出:pu_detail_20151008175652.xls', 1, 'admin', '2015-10-08 17:56:52', '', '2015-10-08'),
(34, 1, '127.0.0.1', '小阳', '删除客户类别:ID=2 名称:001', 1, 'admin', '2015-10-08 18:05:20', '', '2015-10-08'),
(35, 1, '127.0.0.1', '小阳', '新增结算方式:001', 1, 'admin', '2015-10-08 18:05:29', '', '2015-10-08'),
(36, 1, '127.0.0.1', '小阳', '新增结算方式:002', 1, 'admin', '2015-10-08 18:05:31', '', '2015-10-08'),
(37, 1, '127.0.0.1', '小阳', '新增客户类别:001', 1, 'admin', '2015-10-08 18:06:23', '', '2015-10-08'),
(38, 1, '127.0.0.1', '小阳', '新增供应商类别:001', 1, 'admin', '2015-10-08 18:06:28', '', '2015-10-08'),
(39, 1, '127.0.0.1', '小阳', '新增商品类别:001', 1, 'admin', '2015-10-08 18:06:34', '', '2015-10-08'),
(40, 1, '127.0.0.1', '小阳', '新增支出类别:001', 1, 'admin', '2015-10-08 18:06:39', '', '2015-10-08'),
(41, 1, '127.0.0.1', '小阳', '新增收入类别:001', 1, 'admin', '2015-10-08 18:06:43', '', '2015-10-08'),
(42, 1, '127.0.0.1', '小阳', '新增供应商:康志', 1, 'admin', '2015-10-08 18:07:06', '', '2015-10-08'),
(43, 1, '127.0.0.1', '小阳', '删除供应商:ID=1 名称:康志', 1, 'admin', '2015-10-08 18:07:14', '', '2015-10-08'),
(44, 1, '127.0.0.1', '小阳', '新增供应商:001', 1, 'admin', '2015-10-08 18:07:38', '', '2015-10-08'),
(45, 1, '127.0.0.1', '小阳', '修改供应商:0011', 1, 'admin', '2015-10-08 18:09:17', '', '2015-10-08'),
(46, 1, '127.0.0.1', '小阳', '修改供应商:0011', 1, 'admin', '2015-10-08 18:09:18', '', '2015-10-08'),
(47, 1, '127.0.0.1', '小阳', '修改供应商:0011', 1, 'admin', '2015-10-08 18:09:22', '', '2015-10-08'),
(48, 1, '127.0.0.1', '小阳', '修改供应商:0011', 1, 'admin', '2015-10-08 18:09:49', '', '2015-10-08'),
(49, 1, '127.0.0.1', '小阳', '修改商品:ID=1名称:小不点', 1, 'admin', '2015-10-08 18:10:04', '', '2015-10-08'),
(50, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-08 18:10:50', '', '2015-10-08'),
(51, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-10 08:56:57', '', '2015-10-10'),
(52, 1, '127.0.0.1', '小阳', '新增商品:25112', 1, 'admin', '2015-10-10 08:57:27', '', '2015-10-10'),
(53, 1, '127.0.0.1', '小阳', '新增商品:123', 1, 'admin', '2015-10-10 09:42:33', '', '2015-10-10'),
(54, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-11 10:14:18', '', '2015-10-11'),
(55, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-21 09:57:50', '', '2015-10-21'),
(56, 1, '127.0.0.1', '小阳', '新增客户:111', 1, 'admin', '2015-10-21 10:00:25', '', '2015-10-21'),
(57, 1, '127.0.0.1', '小阳', '新增购货 单据编号：CG201510211000285', 1, 'admin', '2015-10-21 10:00:28', '', '2015-10-21'),
(58, 1, '127.0.0.1', '小阳', '新增销货 单据编号：XS201510211000450', 1, 'admin', '2015-10-21 10:00:45', '', '2015-10-21'),
(59, 1, '127.0.0.1', '小阳', '修改购货单 单据编号：CG201510211000285', 1, 'admin', '2015-10-21 10:11:15', '', '2015-10-21'),
(60, 1, '127.0.0.1', '小阳', '新增其他出库 单据编号：QTCK201510211027058', 1, 'admin', '2015-10-21 10:27:05', '', '2015-10-21'),
(61, 1, '127.0.0.1', '小阳', '修改其他出库 单据编号：QTCK201510211027058', 1, 'admin', '2015-10-21 10:27:16', '', '2015-10-21'),
(62, 1, '127.0.0.1', '小阳', '修改其他出库 单据编号：QTCK201510211027058', 1, 'admin', '2015-10-21 10:27:40', '', '2015-10-21'),
(63, 1, '127.0.0.1', '小阳', '修改其他出库 单据编号：QTCK201510211027058', 1, 'admin', '2015-10-21 10:28:33', '', '2015-10-21'),
(64, 1, '127.0.0.1', '小阳', '新增购货 单据编号：CG201510211032557', 1, 'admin', '2015-10-21 10:32:55', '', '2015-10-21'),
(65, 1, '127.0.0.1', '小阳', '修改其他出库 单据编号：QTCK201510211027058', 1, 'admin', '2015-10-21 10:33:10', '', '2015-10-21'),
(66, 1, '127.0.0.1', '小阳', '商品收发汇总表导出:deliver_summary_20151021104252.xls', 1, 'admin', '2015-10-21 10:42:52', '', '2015-10-21'),
(67, 1, '127.0.0.1', '小阳', '商品收发汇总表导出:deliver_summary_20151021105459.xls', 1, 'admin', '2015-10-21 10:54:59', '', '2015-10-21'),
(68, 1, '127.0.0.1', '小阳', '商品收发汇总表导出:deliver_summary_20151021105631.xls', 1, 'admin', '2015-10-21 10:56:31', '', '2015-10-21'),
(69, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-25 16:11:10', '', '2015-10-25'),
(70, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:11:38', '', '2015-10-25'),
(71, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:14:42', '', '2015-10-25'),
(72, 1, '127.0.0.1', '小阳', '导出客户:customer_20151025161541.xls', 1, 'admin', '2015-10-25 16:15:41', '', '2015-10-25'),
(73, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:16:02', '', '2015-10-25'),
(74, 1, '127.0.0.1', '小阳', '导出客户:customer_20151025161605.xls', 1, 'admin', '2015-10-25 16:16:05', '', '2015-10-25'),
(75, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:16:13', '', '2015-10-25'),
(76, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:18:19', '', '2015-10-25'),
(77, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:18:24', '', '2015-10-25'),
(78, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:20:30', '', '2015-10-25'),
(79, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:20:33', '', '2015-10-25'),
(80, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:21:25', '', '2015-10-25'),
(81, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:21:38', '', '2015-10-25'),
(82, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:50:15', '', '2015-10-25'),
(83, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:50:20', '', '2015-10-25'),
(84, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:56:29', '', '2015-10-25'),
(85, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:00:37', '', '2015-10-25'),
(86, 1, '127.0.0.1', '小阳', '切换皮肤：green', 1, 'admin', '2015-10-25 17:10:19', '', '2015-10-25'),
(87, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:10:41', '', '2015-10-25'),
(88, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:11:06', '', '2015-10-25'),
(89, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:27:31', '', '2015-10-25'),
(90, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:27:41', '', '2015-10-25'),
(91, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:28:09', '', '2015-10-25'),
(92, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:29:09', '', '2015-10-25'),
(93, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:29:44', '', '2015-10-25'),
(94, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:30:01', '', '2015-10-25'),
(95, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:30:09', '', '2015-10-25'),
(96, 1, '127.0.0.1', '小阳', '切换皮肤：green', 1, 'admin', '2015-11-06 09:59:25', '', '2015-11-06'),
(97, 1, '127.0.0.1', '小阳', '新增用户:qq123456', 1, 'admin', '2015-11-06 10:01:38', '', '2015-11-06'),
(98, 1, '127.0.0.1', '小阳', '更新权限:qq123456', 1, 'admin', '2015-11-06 10:01:42', '', '2015-11-06'),
(99, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-06 10:18:29', '', '2015-11-06'),
(100, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-06 11:31:03', '', '2015-11-06'),
(101, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-06 11:31:48', '', '2015-11-06'),
(102, 1, '127.0.0.1', '小阳', '新增销货 单据编号：XSDD201511070854553', 1, 'admin', '2015-11-07 08:54:55', '', '2015-11-07'),
(103, 1, '127.0.0.1', '小阳', '销货单编号：XSDD201511070854553的单据已被审核！', 1, 'admin', '2015-11-07 08:57:40', '', '2015-11-07'),
(104, 1, '127.0.0.1', '小阳', '销货订单：XSDD201511070854553的单据已被反审核！', 1, 'admin', '2015-11-07 08:57:41', '', '2015-11-07'),
(105, 1, '127.0.0.1', '小阳', '新增购货 单据编号：CG201511070859066', 1, 'admin', '2015-11-07 08:59:06', '', '2015-11-07'),
(106, 1, '127.0.0.1', '小阳', '新增销货 单据编号：XS201511070859106', 1, 'admin', '2015-11-07 08:59:10', '', '2015-11-07'),
(107, 1, '127.0.0.1', '小阳', '销货单编号：XS201511070859106的单据已被审核！', 1, 'admin', '2015-11-07 09:20:47', '', '2015-11-07'),
(108, 1, '127.0.0.1', '小阳', '销货单：XS201511070859106的单据已被反审核！', 1, 'admin', '2015-11-07 09:20:48', '', '2015-11-07'),
(109, 1, '127.0.0.1', '小阳', '销货单编号：XS201511070859106的单据已被审核！', 1, 'admin', '2015-11-07 09:20:50', '', '2015-11-07'),
(110, 1, '127.0.0.1', '小阳', '销货单：XS201511070859106的单据已被反审核！', 1, 'admin', '2015-11-07 09:20:50', '', '2015-11-07'),
(111, 1, '127.0.0.1', '小阳', '销货单编号：XS201511070859106的单据已被审核！', 1, 'admin', '2015-11-07 09:20:51', '', '2015-11-07'),
(112, 1, '127.0.0.1', '小阳', '销货单：XS201511070859106的单据已被反审核！', 1, 'admin', '2015-11-07 09:20:52', '', '2015-11-07'),
(113, 1, '127.0.0.1', '小阳', '更新权限:qq123456', 1, 'admin', '2015-11-07 09:31:43', '', '2015-11-07'),
(114, NULL, '127.0.0.1', NULL, '登陆成功 用户名：qq123456', 1, NULL, '2015-11-07 09:32:25', '', '2015-11-07'),
(115, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-07 17:27:54', '', '2015-11-07'),
(116, 1, '127.0.0.1', '小阳', '登陆成功 用户名：admin', 1, 'admin', '2015-11-07 17:42:50', '', '2015-11-07'),
(117, 1, '127.0.0.1', '小阳', '登陆成功 用户名：admin', 1, 'admin', '2015-11-07 17:42:56', '', '2015-11-07'),
(118, 1, '127.0.0.1', '小阳', '登陆成功 用户名：admin', 1, 'admin', '2015-11-07 17:44:43', '', '2015-11-07'),
(119, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-07 17:45:47', '', '2015-11-07'),
(120, NULL, '127.0.0.1', NULL, '登陆成功 用户名：qq123456', 1, NULL, '2015-11-07 17:46:03', '', '2015-11-07'),
(121, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-07 17:54:28', '', '2015-11-07'),
(122, 1, '127.0.0.1', '小阳', '更新权限:qq123456', 1, 'admin', '2015-11-07 17:55:44', '', '2015-11-07'),
(123, NULL, '127.0.0.1', NULL, '登陆成功 用户名：qq123456', 1, NULL, '2015-11-07 17:56:15', '', '2015-11-07'),
(124, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-10 10:23:02', '', '2015-11-10'),
(125, 1, '127.0.0.1', '小阳', '新增单位:23', 1, 'admin', '2015-11-18 16:00:13', '', '2015-11-18'),
(126, 1, '127.0.0.1', '小阳', '新增商品:123', 1, 'admin', '2015-11-18 16:00:48', '', '2015-11-18'),
(127, 1, '127.0.0.1', '小阳', '删除商品:ID=4 名称:123', 1, 'admin', '2015-11-18 16:03:08', '', '2015-11-18'),
(128, 1, '127.0.0.1', '小阳', '新增商品:123', 1, 'admin', '2015-11-18 16:05:38', '', '2015-11-18'),
(129, 1, '127.0.0.1', '小阳', '删除商品:ID=5 名称:123', 1, 'admin', '2015-11-18 16:05:46', '', '2015-11-18'),
(130, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2016-12-20 12:37:13', '', '2016-12-20'),
(131, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2016-12-20 12:53:13', '', '2016-12-20'),
(132, 1, '::1', '小阳', '修改供应商:饭店', 1, 'admin', '2016-12-20 12:55:08', '', '2016-12-20'),
(133, 1, '::1', '小阳', '修改客户:烟草公司', 1, 'admin', '2016-12-20 12:55:40', '', '2016-12-20'),
(134, 1, '::1', '小阳', '启用:ID:2', 1, 'admin', '2016-12-20 13:04:52', '', '2016-12-20'),
(135, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2016-12-20 13:24:27', '', '2016-12-20');

-- --------------------------------------------------------

--
-- 表的结构 `ci_menu`
--

CREATE TABLE IF NOT EXISTS `ci_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `parentId` smallint(5) DEFAULT '0' COMMENT '上级栏目ID',
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目路径',
  `level` tinyint(2) DEFAULT '1' COMMENT '层次',
  `ordnum` smallint(6) DEFAULT '0' COMMENT '排序',
  `module` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `typeNumber` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `detail` tinyint(1) DEFAULT '1',
  `sortIndex` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parentId` (`parentId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=203 ;

--
-- 转存表中的数据 `ci_menu`
--

INSERT INTO `ci_menu` (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `module`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES
(1, '购货单', 0, '1', 1, 99, 'PU_QUERY', 1, 'trade', 1, 0, 0, ''),
(2, '新增', 1, '1,2', 2, 99, 'PU_ADD', 1, 'trade', 1, 0, 0, ''),
(3, '修改', 1, '1,3', 2, 99, 'PU_UPDATE', 1, 'trade', 1, 0, 0, ''),
(4, '删除', 1, '1,4', 2, 99, 'PU_DELETE', 1, 'trade', 1, 0, 0, ''),
(5, '导出', 1, '1,5', 2, 99, 'PU_EXPORT', 1, 'trade', 1, 0, 0, ''),
(6, '销货单', 0, '6', 1, 99, 'SA_QUERY', 1, 'trade', 1, 0, 0, ''),
(7, '新增', 6, '6,7', 2, 99, 'SA_ADD', 1, 'trade', 1, 0, 0, ''),
(8, '修改', 6, '6,8', 2, 99, 'SA_UPDATE', 1, 'trade', 1, 0, 0, ''),
(9, '删除', 6, '6,9', 2, 99, 'SA_DELETE', 1, 'trade', 1, 0, 0, ''),
(10, '导出', 6, '6,10', 2, 99, 'SA_EXPORT', 1, 'trade', 1, 0, 0, ''),
(11, '盘点', 0, '11', 1, 99, 'PD_GENPD', 1, 'trade', 1, 0, 0, ''),
(12, '生成盘点记录', 11, '11,12', 2, 99, 'PD_GENPD', 1, 'trade', 1, 0, 0, ''),
(13, '导出', 11, '11,13', 2, 99, 'PD_EXPORT', 1, 'trade', 1, 0, 0, ''),
(14, '其他入库单', 0, '14', 1, 99, 'IO_QUERY', 1, 'trade', 1, 0, 0, ''),
(15, '新增', 14, '14,15', 2, 99, 'IO_ADD', 1, 'trade', 1, 0, 0, ''),
(16, '修改', 14, '14,16', 2, 99, 'IO_UPDATE', 1, 'trade', 1, 0, 0, ''),
(17, '删除', 14, '14,17', 2, 99, 'IO_DELETE', 1, 'trade', 1, 0, 0, ''),
(18, '其他出库单', 0, '18', 1, 99, 'OO_QUERY', 1, 'trade', 1, 0, 0, ''),
(19, '新增', 18, '18,19', 2, 99, 'OO_ADD', 1, 'trade', 1, 0, 0, ''),
(20, '修改', 18, '18,20', 2, 99, 'OO_UPDATE', 1, 'trade', 1, 0, 0, ''),
(21, '删除', 18, '18,21', 2, 99, 'OO_DELETE', 1, 'trade', 1, 0, 0, ''),
(22, '采购明细表', 0, '22', 1, 99, 'PUREOORTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(23, '导出', 22, '22,23', 2, 99, 'PUREOORTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(24, '打印', 22, '22,24', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(25, '采购汇总表（按商品）', 0, '25', 1, 99, 'PUREPORTINV_QUERY', 1, 'trade', 1, 0, 0, ''),
(26, '导出', 25, '25,26', 2, 99, 'PUREPORTINV_QUERY', 1, 'trade', 1, 0, 0, ''),
(27, '打印', 25, '25,27', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(28, '采购汇总表（按供应商）', 0, '28', 1, 99, 'PUREPORTPUR_QUERY', 1, 'trade', 1, 0, 0, ''),
(29, '导出', 28, '28,29', 2, 99, 'PUREPORTPUR_QUERY', 1, 'trade', 1, 0, 0, ''),
(30, '打印', 28, '28,30', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(31, '销售明细表', 0, '31', 1, 99, 'SAREPORTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(32, '导出', 31, '31,32', 2, 99, 'SAREPORTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(33, '打印', 31, '31,33', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(34, '销售汇总表（按商品）', 0, '34', 1, 99, 'SAREPORTINV_QUERY', 1, 'trade', 1, 0, 0, ''),
(35, '导出', 34, '34,35', 2, 99, 'SAREPORTINV_QUERY', 1, 'trade', 1, 0, 0, ''),
(36, '打印', 34, '34,36', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(37, '销售汇总表（按客户）', 0, '37', 1, 99, 'SAREPORTBU_QUERY', 1, 'trade', 1, 0, 0, ''),
(38, '导出', 37, '37,38', 2, 99, 'SAREPORTBU_QUERY', 1, 'trade', 1, 0, 0, ''),
(39, '打印', 37, '37,39', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(40, '商品库存余额表', 0, '40', 1, 99, 'InvBalanceReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(41, '导出', 40, '40,41', 2, 99, 'InvBalanceReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(42, '打印', 40, '40,42', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(43, '商品收发明细表', 0, '43', 1, 99, 'DeliverDetailReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(44, '导出', 43, '43,44', 2, 99, 'DeliverDetailReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(45, '打印', 43, '43,45', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(46, '商品收发汇总表', 0, '46', 1, 99, 'DeliverSummaryReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(47, '导出', 46, '46,47', 2, 99, 'DeliverSummaryReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(48, '打印', 46, '46,48', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(49, '往来单位欠款表', 0, '49', 1, 99, 'ContactDebtReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(50, '导出', 49, '49,50', 2, 99, 'ContactDebtReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(51, '打印', 49, '49,51', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(52, '应付账款明细表', 0, '52', 1, 99, 'PAYMENTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(53, '导出', 52, '52,53', 2, 99, 'PAYMENTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(54, '打印', 52, '52,54', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(55, '应收账款明细表', 0, '55', 1, 99, 'RECEIPTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(56, '导出', 55, '55,56', 2, 99, 'RECEIPTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(57, '打印', 55, '55,57', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(58, '客户管理', 0, '58', 1, 99, 'BU_QUERY', 1, 'trade', 1, 0, 0, ''),
(59, '新增', 58, '58,59', 2, 99, 'BU_ADD', 1, 'trade', 1, 0, 0, ''),
(60, '修改', 58, '58,60', 2, 99, 'BU_UPDATE', 1, 'trade', 1, 0, 0, ''),
(61, '删除', 58, '58,61', 2, 99, 'BU_DELETE', 1, 'trade', 1, 0, 0, ''),
(62, '导出', 58, '58,62', 2, 99, 'BU_EXPORT', 1, 'trade', 1, 0, 0, ''),
(63, '供应商管理', 0, '63', 1, 99, 'PUR_QUERY', 1, 'trade', 1, 0, 0, ''),
(64, '新增', 63, '63,64', 2, 99, 'PUR_ADD', 1, 'trade', 1, 0, 0, ''),
(65, '修改', 63, '63,65', 2, 99, 'PUR_UPDATE', 1, 'trade', 1, 0, 0, ''),
(66, '删除', 63, '63,66', 2, 99, 'PUR_DELETE', 1, 'trade', 1, 0, 0, ''),
(67, '导出', 63, '63,67', 2, 99, 'PUR_EXPORT', 1, 'trade', 1, 0, 0, ''),
(68, '商品管理', 0, '68', 1, 99, 'INVENTORY_QUERY', 1, 'trade', 1, 0, 0, ''),
(69, '新增', 68, '68,69', 2, 99, 'INVENTORY_ADD', 1, 'trade', 1, 0, 0, ''),
(70, '修改', 68, '68,70', 2, 99, 'INVENTORY_UPDATE', 1, 'trade', 1, 0, 0, ''),
(71, '删除', 68, '68,71', 2, 99, 'INVENTORY_DELETE', 1, 'trade', 1, 0, 0, ''),
(72, '导出', 68, '68,72', 2, 99, 'INVENTORY_EXPORT', 1, 'trade', 1, 0, 0, ''),
(73, '客户类别', 0, '73', 1, 99, 'BUTYPE_QUERY', 1, 'trade', 1, 0, 0, ''),
(74, '新增', 73, '73,74', 2, 99, 'BUTYPE_ADD', 1, 'trade', 1, 0, 0, ''),
(75, '修改', 73, '73,75', 2, 99, 'BUTYPE_UPDATE', 1, 'trade', 1, 0, 0, ''),
(76, '删除', 73, '73,76', 2, 99, 'BUTYPE_DELETE', 1, 'trade', 1, 0, 0, ''),
(77, '计量单位', 0, '77', 1, 99, 'UNIT_QUERY', 1, 'trade', 1, 0, 0, ''),
(78, '新增', 77, '77,78', 2, 99, 'UNIT_ADD', 1, 'trade', 1, 0, 0, ''),
(79, '修改', 77, '77,79', 2, 99, 'UNIT_UPDATE', 1, 'trade', 1, 0, 0, ''),
(80, '删除', 77, '77,80', 2, 99, 'UNIT_DELETE', 1, 'trade', 1, 0, 0, ''),
(81, '系统参数', 0, '81', 1, 99, '', 1, 'trade', 1, 0, 0, ''),
(82, '权限设置', 0, '82', 1, 99, '', 1, 'trade', 1, 0, 0, ''),
(83, '操作日志', 0, '83', 1, 99, 'OPERATE_QUERY', 1, 'trade', 1, 0, 0, ''),
(84, '数据备份', 0, '84', 1, 99, '', 0, 'trade', 1, 0, 0, ''),
(85, '打印', 1, '1,85', 2, 99, 'PU_PRINT', 1, 'trade', 1, 0, 0, ''),
(86, '审核', 1, '1,86', 2, 0, 'PU_CHECK', 1, 'trade', 1, 0, 0, ''),
(87, '反审核', 1, '1,87', 2, 0, 'PU_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(88, '打印', 6, '6,88', 2, 0, 'SA_PRINT', 1, 'trade', 1, 0, 0, ''),
(89, '审核', 6, '6,89', 2, 0, 'SA_CHECK', 1, 'trade', 1, 0, 0, ''),
(90, '反审核', 6, '6,90', 2, 0, 'SA_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(91, '禁用', 58, '58,91', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(92, '启用', 58, '58,92', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(93, '禁用', 63, '63,93', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(94, '启用', 63, '63,94', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(95, '禁用', 68, '68,95', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(96, '启用', 68, '68,96', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(97, '职员管理', 0, '97', 1, 0, '', 1, 'trade', 1, 0, 0, ''),
(98, '账号管理', 0, '98', 1, 0, 'SettAcct_QUERY', 1, 'trade', 1, 0, 0, ''),
(99, '导入', 11, '11,99', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(100, '审核', 14, '14,100', 2, 0, 'IO_CHECK', 1, 'trade', 1, 0, 0, ''),
(101, '反审核', 14, '14,101', 2, 0, 'IO_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(102, '导出', 14, '14,102', 2, 0, 'IO_EXPORT', 1, 'trade', 1, 0, 0, ''),
(103, '审核', 18, '18,103', 2, 0, 'OO_CHECK', 1, 'trade', 1, 0, 0, ''),
(104, '反审核', 18, '18,104', 2, 0, 'OO_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(105, '导出', 18, '18,105', 2, 0, 'OO_EXPORT', 1, 'trade', 1, 0, 0, ''),
(106, '现金银行报表', 0, '106', 1, 0, 'SettAcctReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(107, '打印', 106, '106,107', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(108, '导出', 106, '106,108', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(109, '客户对账单', 0, '109', 1, 0, 'CUSTOMERBALANCE_QUERY', 1, 'trade', 1, 0, 0, ''),
(110, '打印', 109, '109,110', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(111, '导出', 109, '109,111', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(112, '供应商对账单', 0, '112', 1, 0, 'SUPPLIERBALANCE_QUERY', 1, 'trade', 1, 0, 0, ''),
(113, '打印', 112, '112,113', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(114, '导出', 112, '112,114', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(115, '其他收支明细表', 0, '115', 1, 0, 'ORIDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(116, '打印', 115, '115,116', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(117, '导出', 115, '115,117', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(118, '新增', 97, '97,118', 2, 0, 'INVLOCTION_ADD', 1, 'trade', 1, 0, 0, ''),
(119, '修改', 97, '97,119', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(120, '删除', 97, '97,120', 2, 0, 'INVLOCTION_DELETE', 1, 'trade', 1, 0, 0, ''),
(121, '新增', 98, '98,121', 2, 0, 'SettAcct_ADD', 1, 'trade', 1, 0, 0, ''),
(122, '修改', 98, '98,122', 2, 0, 'SettAcct_UPDATE', 1, 'trade', 1, 0, 0, ''),
(123, '删除', 98, '98,123', 2, 0, 'SettAcct_DELETE', 1, 'trade', 1, 0, 0, ''),
(124, '收款单', 0, '124', 1, 0, 'RECEIPT_QUERY', 1, 'trade', 1, 0, 0, ''),
(125, '新增', 124, '124,125', 2, 0, 'RECEIPT_ADD', 1, 'trade', 1, 0, 0, ''),
(126, '修改', 124, '124,126', 2, 0, 'RECEIPT_UPDATE', 1, 'trade', 1, 0, 0, ''),
(127, '删除', 124, '124,127', 2, 0, 'RECEIPT_DELETE', 1, 'trade', 1, 0, 0, ''),
(128, '导出', 124, '124,128', 2, 0, 'RECEIPT_EXPORT', 1, 'trade', 1, 0, 0, ''),
(129, '付款单', 0, '129', 1, 0, 'PAYMENT_QUERY', 1, 'trade', 1, 0, 0, ''),
(130, '新增', 129, '129,130', 2, 0, 'PAYMENT_ADD', 1, 'trade', 1, 0, 0, ''),
(131, '修改', 129, '129,131', 2, 0, 'PAYMENT_UPDATE', 1, 'trade', 1, 0, 0, ''),
(132, '删除', 129, '129,132', 2, 0, 'PAYMENT_DELETE', 1, 'trade', 1, 0, 0, ''),
(133, '导出', 129, '129,133', 2, 0, 'PAYMENT_EXPORT', 1, 'trade', 1, 0, 0, ''),
(134, '其他收入单', 0, '134', 1, 0, 'QTSR_QUERY', 1, 'trade', 1, 0, 0, ''),
(135, '新增', 134, '134,135', 2, 0, 'QTSR_ADD', 1, 'trade', 1, 0, 0, ''),
(136, '修改', 134, '134,136', 2, 0, 'QTSR_UPDATE', 1, 'trade', 1, 0, 0, ''),
(137, '删除', 134, '134,137', 2, 0, 'QTSR_DELETE', 1, 'trade', 1, 0, 0, ''),
(138, '导出', 134, '134,138', 2, 0, 'QTSR_EXPORT', 1, 'trade', 1, 0, 0, ''),
(139, '其他支出单', 0, '139', 1, 0, 'QTZC_QUERY', 1, 'trade', 1, 0, 0, ''),
(140, '新增', 139, '139,140', 2, 0, 'QTZC_ADD', 1, 'trade', 1, 0, 0, ''),
(141, '修改', 139, '139,141', 2, 0, 'QTZC_UPDATE', 1, 'trade', 1, 0, 0, ''),
(142, '删除', 139, '139,142', 2, 0, 'QTZC_DELETE', 1, 'trade', 1, 0, 0, ''),
(143, '导出', 139, '139,143', 2, 0, 'QTZC_EXPORT', 1, 'trade', 1, 0, 0, ''),
(144, '调拨单', 0, '144', 1, 0, 'TF_QUERY', 1, 'trade', 1, 0, 0, ''),
(145, '新增', 144, '144,145', 2, 0, 'TF_ADD', 1, 'trade', 1, 0, 0, ''),
(146, '修改', 144, '144,146', 2, 0, 'TF_UPDATE', 1, 'trade', 1, 0, 0, ''),
(147, '删除', 144, '144,147', 2, 0, 'TF_DELETE', 1, 'trade', 1, 0, 0, ''),
(148, '导出', 144, '144,148', 2, 0, 'TF_EXPORT', 1, 'trade', 1, 0, 0, ''),
(149, '重新初始化', 0, '149', 1, 0, '', 0, 'trade', 1, 0, 0, ''),
(151, '成本调整单', 0, '151', 1, 0, 'CADJ_QUERY', 1, 'trade', 1, 0, 0, ''),
(152, '新增', 151, '151,152', 2, 0, 'CADJ_ADD', 1, 'trade', 1, 0, 0, ''),
(153, '修改', 151, '151,153', 2, 0, 'CADJ_UPDATE', 1, 'trade', 1, 0, 0, ''),
(154, '删除', 151, '151,154', 2, 0, 'CADJ_DELETE', 1, 'trade', 1, 0, 0, ''),
(155, '仓库管理', 0, '155', 1, 0, 'INVLOCTION_QUERY', 1, 'trade', 1, 0, 0, ''),
(156, '新增', 155, '155,156', 2, 0, 'INVLOCTION_ADD', 1, 'trade', 1, 0, 0, ''),
(157, '修改', 155, '155,157', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(158, '删除', 155, '155,158', 2, 0, 'INVLOCTION_DELETE', 1, 'trade', 1, 0, 0, ''),
(159, '结算方式', 0, '159', 1, 0, 'Assist_QUERY', 1, 'trade', 1, 0, 0, ''),
(160, '新增', 159, '159,160', 2, 0, 'Assist_ADD', 1, 'trade', 1, 0, 0, ''),
(161, '修改', 159, '159,161', 2, 0, 'Assist_UPDATE', 1, 'trade', 1, 0, 0, ''),
(162, '删除', 159, '159,162', 2, 0, 'Assist_DELETE', 1, 'trade', 1, 0, 0, ''),
(163, '供应商类别', 0, '163', 1, 0, 'SUPPLYTYPE_QUERY', 1, 'trade', 1, 0, 0, ''),
(164, '新增', 163, '163,164', 2, 0, 'SUPPLYTYPE_ADD', 1, 'trade', 1, 0, 0, ''),
(165, '修改', 163, '163,165', 2, 0, 'SUPPLYTYPE_UPDATE', 1, 'trade', 1, 0, 0, ''),
(166, '删除', 163, '163,166', 2, 0, 'SUPPLYTYPE_DELETE', 1, 'trade', 1, 0, 0, ''),
(167, '商品类别', 0, '167', 1, 0, 'TRADETYPE_QUERY', 1, 'trade', 1, 0, 0, ''),
(168, '新增', 167, '167,168', 2, 0, 'TRADETYPE_ADD', 1, 'trade', 1, 0, 0, ''),
(169, '修改', 167, '167,169', 2, 0, 'TRADETYPE_UPDATE', 1, 'trade', 1, 0, 0, ''),
(170, '删除', 167, '167,170', 2, 0, 'TRADETYPE_DELETE', 1, 'trade', 1, 0, 0, ''),
(171, '支出类别', 0, '171', 1, 0, 'PACCTTYPE_QUERY', 1, 'trade', 1, 0, 0, ''),
(172, '新增', 171, '171,172', 2, 0, 'PACCTTYPE_ADD', 1, 'trade', 1, 0, 0, ''),
(173, '修改', 171, '171,173', 2, 0, 'PACCTTYPE_UPDATE', 1, 'trade', 1, 0, 0, ''),
(174, '删除', 171, '171,174', 2, 0, 'PACCTTYPE_DELETE', 1, 'trade', 1, 0, 0, ''),
(175, '收入类别', 0, '175', 1, 0, 'RACCTTYPE_QUERY', 1, 'trade', 1, 0, 0, ''),
(176, '新增', 175, '175,176', 2, 0, 'RACCTTYPE_ADD', 1, 'trade', 1, 0, 0, ''),
(177, '修改', 175, '175,177', 2, 0, 'RACCTTYPE_UPDATE', 1, 'trade', 1, 0, 0, ''),
(178, '删除', 175, '175,178', 2, 0, 'RACCTTYPE_DELETE', 1, 'trade', 1, 0, 0, ''),
(179, '打印', 144, '144,179', 2, 0, 'TF_PRINT', 1, 'trade', 1, 0, 0, ''),
(180, '采购订单', 0, '180', 1, 0, 'PO_QUERY', 1, 'trade', 1, 0, 0, ''),
(181, '新增', 180, '180,181', 2, 0, 'PO_ADD', 1, 'trade', 1, 0, 0, ''),
(182, '修改', 180, '180,182', 2, 0, 'PO_UPDATE', 1, 'trade', 1, 0, 0, ''),
(183, '删除', 180, '180,183', 2, 0, 'PO_DELETE', 1, 'trade', 1, 0, 0, ''),
(184, '导出', 180, '180,184', 2, 0, 'PO_EXPORT', 1, 'trade', 1, 0, 0, ''),
(185, '打印', 180, '180,185', 2, 0, 'PO_PRINT', 1, 'trade', 1, 0, 0, ''),
(186, '审核', 180, '180,186', 2, 0, 'PO_CHECK', 1, 'trade', 1, 0, 0, ''),
(187, '反审核', 180, '180,187', 2, 0, 'PO_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(188, '销售订单', 0, '188', 1, 0, 'SO_QUERY', 1, 'trade', 1, 0, 0, ''),
(189, '新增', 188, '188,189', 2, 0, 'SO_ADD', 1, 'trade', 1, 0, 0, ''),
(190, '修改', 188, '188,190', 2, 0, 'SO_UPDATE', 1, 'trade', 1, 0, 0, ''),
(191, '删除', 188, '188,191', 2, 0, 'SO_DELETE', 1, 'trade', 1, 0, 0, ''),
(192, '导出', 188, '188,192', 2, 0, 'SO_EXPORT', 1, 'trade', 1, 0, 0, ''),
(193, '打印', 188, '188,193', 2, 0, 'SO_PRINT', 1, 'trade', 1, 0, 0, ''),
(194, '审核', 188, '188,194', 2, 0, 'SO_CHECK', 1, 'trade', 1, 0, 0, ''),
(195, '反审核', 188, '188,195', 2, 0, 'SO_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(196, '审核', 144, '144,196', 2, 0, 'TF_CHECK', 1, 'trade', 1, 0, 0, ''),
(197, '反审核', 144, '144,197', 2, 0, 'TF_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(198, '审核', 124, '124,198', 2, 0, 'RECEIPT_CHECK', 1, 'trade', 1, 0, 0, ''),
(199, '反审核', 124, '124,199', 2, 0, 'RECEIPT_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(200, '审核', 129, '129,200', 2, 0, 'PAYMENT_CHECK', 1, 'trade', 1, 0, 0, ''),
(201, '反审核', 129, '129,201', 2, 0, 'PAYMENT_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(202, '库存预警', 0, '202', 1, 0, 'INVENTORY_WARNING', 1, 'trade', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ci_options`
--

CREATE TABLE IF NOT EXISTS `ci_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `ci_options`
--

INSERT INTO `ci_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'system', 'a:10:{s:11:"companyName";s:18:"某某集团公司";s:11:"companyAddr";s:6:"123213";s:5:"phone";s:5:"12312";s:3:"fax";s:3:"312";s:8:"postcode";s:4:"3123";s:9:"qtyPlaces";s:1:"1";s:11:"pricePlaces";s:1:"1";s:12:"amountPlaces";s:1:"2";s:10:"valMethods";s:13:"movingAverage";s:18:"requiredCheckStore";s:1:"1";}', 'yes'),
(2, 'sales', 's:3893:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">扫描枪录入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"数量"},{"name":"price","label":"销售单价","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"销售单价","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣额","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣额","defhidden":false},{"name":"amount","label":"销售金额","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"销售金额","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"},{"name":"srcOrderEntryId","label":"源单分录ID","width":0,"hidden":true,"defLabel":"源单分录ID","defhidden":true},{"name":"srcOrderId","label":"源单ID","width":0,"hidden":true,"defLabel":"源单ID","defhidden":true},{"name":"srcOrderNo","label":"源单号","width":120,"fixed":true,"hidden":true,"defLabel":"源单号","defhidden":true}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","销售单价",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣额",false,70],["amount","销售金额",false,100],["description","备注",null,150],["srcOrderEntryId","源单分录ID",true,0],["srcOrderId","源单ID",true,0],["srcOrderNo","源单号",true,120]],"isReg":true}}}";', 'yes'),
(3, 'purchase', 's:797:"{"grids":{"grid":{"colModel":[["operating"," ",null,60],["pic","商品图片",null,77],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","购货单价",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣额",false,70],["amount","购货金额",false,100],["description","备注",null,150],["srcOrderEntryId","源单分录ID",true,0],["srcOrderId","源单ID",true,0],["srcOrderNo","源单号",true,120]],"isReg":true}},"curTime":1441963732000,"modifyTime":1441963732000}";', 'yes'),
(4, 'transfers', 's:2702:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":318,"title":false,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"数量"},{"name":"outLocationName","label":"调出仓库","nameExt":"<small id=\\"batch-storageA\\">(批量)</small>","sortable":false,"width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"调出仓库"},{"name":"inLocationName","label":"调入仓库","nameExt":"<small id=\\"batch-storageB\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"调入仓库"},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"}],"colModel":[["operating"," ",null,40],["goods","商品",null,318],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["outLocationName","调出仓库",null,100],["inLocationName","调入仓库",null,100],["description","备注",null,150]],"isReg":true}}}";', 'yes'),
(5, 'otherWarehouse', 's:2906:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":320,"title":true,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"数量"},{"name":"price","label":"入库单价","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"editable":true,"defLabel":"入库单价","defhidden":false},{"name":"amount","label":"入库金额","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"入库金额","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"}],"colModel":[["operating"," ",null,40],["goods","商品",null,320],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","入库单价",false,100],["amount","入库金额",false,100],["description","备注",null,150]],"isReg":true}}}";', 'yes'),
(6, 'adjustment', 's:1337:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":320,"title":true,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis disableSku"},"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"mainUnit","label":"单位","width":60,"defLabel":"单位"},{"name":"amount","label":"调整金额","hidden":false,"width":100,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"调整金额","defhidden":false},{"name":"locationName","label":"仓库<small id=\\"batchStorage\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库<small id=\\"batchStorage\\">(批量)</small>"},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"}],"colModel":[["operating"," ",null,40],["goods","商品",null,320],["skuId","属性ID",true,null],["mainUnit","单位",null,60],["amount","调整金额",false,100],["locationName","仓库<small id=\\"batchStorage\\">(批量)</small>",null,100],["description","备注",null,150]],"isReg":true}}}";', 'yes'),
(7, 'purchaseBack', 's:3824:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">扫描枪录入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":2},"editable":true,"defLabel":"数量"},{"name":"price","label":"购货单价","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"购货单价","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣额","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣额","defhidden":false},{"name":"amount","label":"购货金额","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"购货金额","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"},{"name":"srcOrderEntryId","label":"源单分录ID","width":0,"hidden":true,"defLabel":"源单分录ID","defhidden":true},{"name":"srcOrderId","label":"源单ID","width":0,"hidden":true,"defLabel":"源单ID","defhidden":true},{"name":"srcOrderNo","label":"源单号","width":120,"fixed":true,"hidden":true,"defLabel":"源单号","defhidden":true}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","购货单价",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣额",false,70],["amount","购货金额",false,100],["description","备注",null,150],["srcOrderEntryId","源单分录ID",true,0],["srcOrderId","源单ID",true,0],["srcOrderNo","源单号",true,120]],"isReg":true}}}";', 'yes'),
(8, 'salesBack', 's:3893:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">扫描枪录入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":2},"editable":true,"defLabel":"数量"},{"name":"price","label":"销售单价","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"销售单价","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣额","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣额","defhidden":false},{"name":"amount","label":"销售金额","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"销售金额","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"},{"name":"srcOrderEntryId","label":"源单分录ID","width":0,"hidden":true,"defLabel":"源单分录ID","defhidden":true},{"name":"srcOrderId","label":"源单ID","width":0,"hidden":true,"defLabel":"源单ID","defhidden":true},{"name":"srcOrderNo","label":"源单号","width":120,"fixed":true,"hidden":true,"defLabel":"源单号","defhidden":true}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","销售单价",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣额",false,70],["amount","销售金额",false,100],["description","备注",null,150],["srcOrderEntryId","源单分录ID",true,0],["srcOrderId","源单ID",true,0],["srcOrderNo","源单号",true,120]],"isReg":true}}}";', 'yes'),
(9, 'otherOutbound', 's:2892:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":320,"title":true,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"数量"},{"name":"price","label":"出库单位成本","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"defLabel":"出库单位成本","defhidden":false},{"name":"amount","label":"出库成本","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"defLabel":"出库成本","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"}],"colModel":[["operating"," ",null,40],["goods","商品",null,320],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","出库单位成本",false,100],["amount","出库成本",false,100],["description","备注",null,150]],"isReg":true}}}";', 'yes'),
(10, 'purchaseOrder', 's:2682:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">扫描枪录入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"数量"},{"name":"price","label":"购货单价","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"购货单价","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣额","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣额","defhidden":false},{"name":"amount","label":"购货金额","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"购货金额","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["qty","数量",null,80],["price","购货单价",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣额",false,70],["amount","购货金额",false,100],["description","备注",null,150]],"isReg":true}}}";', 'yes'),
(11, 'salesOrderList', 's:606:"{"grids":{"grid":{"colModel":[["operating","操作",null,60],["billDate","订单日期",null,100],["billNo","订单编号",null,120],["transType","业务类别",null,100],["salesName","销售人员",null,80],["contactName","客户",null,101],["totalAmount","销售金额",false,100],["totalQty","数量",null,57],["billStatusName","订单状态",null,71],["deliveryDate","交货日期",null,100],["userName","制单人",null,80],["checkName","审核人",false,44],["description","备注",null,200],["disEditable","不可编辑",true,null]],"isReg":true}},"curTime":1438079315000,"modifyTime":1438079315000}";', 'yes');

-- --------------------------------------------------------

--
-- 表的结构 `ci_order`
--

CREATE TABLE IF NOT EXISTS `ci_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `userName` varchar(50) DEFAULT '' COMMENT '制单人',
  `transType` int(11) DEFAULT '0' COMMENT '150501购货 150502退货 150601销售 150602退销 150706其他入库',
  `totalAmount` double DEFAULT '0' COMMENT '购货总金额',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpAmount` double DEFAULT '0' COMMENT '本次付款',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disRate` double DEFAULT '0' COMMENT '折扣率',
  `disAmount` double DEFAULT '0' COMMENT '折扣金额',
  `totalQty` double DEFAULT '0' COMMENT '总数量',
  `totalArrears` double DEFAULT '0',
  `billStatus` tinyint(1) DEFAULT '0' COMMENT '订单状态 ',
  `checkName` varchar(50) DEFAULT '' COMMENT '采购单审核人',
  `totalTax` double DEFAULT '0',
  `totalTaxAmount` double DEFAULT '0',
  `checked` tinyint(1) DEFAULT '0' COMMENT '采购单状态',
  `accId` tinyint(4) DEFAULT '0' COMMENT '结算账户ID',
  `billType` varchar(20) DEFAULT '' COMMENT 'PO采购订单 OI其他入库 PUR采购入库 BAL初期余额',
  `modifyTime` datetime DEFAULT NULL COMMENT '更新时间',
  `hxStateCode` tinyint(4) DEFAULT '0' COMMENT '0未付款  1部分付款  2全部付款',
  `transTypeName` varchar(20) DEFAULT '',
  `totalDiscount` double DEFAULT '0',
  `salesId` smallint(6) DEFAULT '0' COMMENT '销售人员ID',
  `customerFree` double DEFAULT '0' COMMENT '客户承担费用',
  `hxAmount` double DEFAULT '0' COMMENT '本次核销金额',
  `hasCheck` double DEFAULT '0' COMMENT '已核销',
  `notCheck` double DEFAULT '0' COMMENT '未核销',
  `nowCheck` double DEFAULT '0' COMMENT '本次核销',
  `payment` double DEFAULT '0' COMMENT '本次预收款',
  `discount` double DEFAULT '0' COMMENT '整单折扣',
  `postData` text COMMENT '提交订单明细 ',
  `locationId` varchar(255) DEFAULT '',
  `inLocationId` varchar(255) DEFAULT '' COMMENT '调入仓库ID多个,分割',
  `outLocationId` varchar(255) DEFAULT '' COMMENT '调出仓库ID多个,分割',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除  0正常',
  `deliveryDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accId` (`accId`),
  KEY `buId` (`buId`),
  KEY `salesId` (`salesId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `ci_order`
--

INSERT INTO `ci_order` (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `postData`, `locationId`, `inLocationId`, `outLocationId`, `isDelete`, `deliveryDate`) VALUES
(1, 2, 'CGDD201510291724412', 1, '小阳', 150501, 5, 5, 0, '2015-10-29', '', 0, 0, 0, 1, 0, 0, '小阳', 0, 0, 1, NULL, 'PUR', '2015-10-29 17:24:43', NULL, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', '', '', 0, '2015-10-29'),
(2, 1, 'XSDD201510291813550', 1, '小阳', 150601, 10, 10, NULL, '2015-10-29', '', 0, 0, 0, 1, NULL, 2, '小阳', 0, 0, 1, NULL, 'SALE', '2015-10-29 18:13:55', NULL, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', '', '', 0, '2015-10-29'),
(3, 1, 'XSDD201510311600030', 3, '小丽', 150601, 10, 10, NULL, '2015-10-31', '', 0, 0, 0, 1, NULL, 0, '', 0, 0, 0, NULL, 'SALE', '2015-10-31 16:00:03', NULL, '销货', 0, 1, 0, 0, 0, 0, 0, 0, 0, 'a:25:{s:2:"id";i:-1;s:4:"buId";i:1;s:11:"contactName";s:4:"2313";s:7:"salesId";i:1;s:9:"salesName";s:6:"小丽";s:4:"date";s:10:"2015-10-31";s:12:"deliveryDate";s:10:"2015-10-31";s:6:"billNo";s:19:"XSDD201510311600030";s:9:"transType";i:150601;s:7:"entries";a:1:{i:0;a:16:{s:5:"invId";s:1:"1";s:9:"invNumber";s:4:"0011";s:7:"invName";s:6:"鞋子";s:7:"invSpec";s:3:"个";s:5:"skuId";i:-1;s:7:"skuName";s:0:"";s:6:"unitId";s:1:"0";s:8:"mainUnit";s:3:"斤";s:3:"qty";s:4:"1.00";s:5:"price";s:5:"10.00";s:12:"discountRate";s:1:"0";s:9:"deduction";s:4:"0.00";s:6:"amount";s:5:"10.00";s:10:"locationId";i:2;s:12:"locationName";s:12:"苏州仓库";s:11:"description";s:0:"";}}s:8:"totalQty";d:1;s:13:"totalDiscount";d:0;s:11:"totalAmount";d:10;s:11:"description";s:0:"";s:7:"disRate";d:0;s:9:"disAmount";d:0;s:6:"amount";d:10;s:8:"billType";s:4:"SALE";s:8:"billDate";s:10:"2015-10-31";s:13:"transTypeName";s:6:"销货";s:8:"totalTax";i:0;s:14:"totalTaxAmount";i:0;s:3:"uid";s:1:"3";s:8:"userName";s:6:"小丽";s:10:"modifyTime";s:19:"2015-10-31 16:00:03";}', '', '', '', 0, '2015-10-31'),
(4, 2, 'CGDD201511021635034', 1, '小阳', 150501, 5, 5, 0, '2015-11-02', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'PUR', '2015-11-02 16:35:03', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a:21:{s:2:"id";i:-1;s:4:"buId";i:2;s:11:"contactName";s:10:"2323211122";s:4:"date";s:10:"2015-11-02";s:12:"deliveryDate";s:10:"2015-11-02";s:6:"billNo";s:19:"CGDD201511021635034";s:9:"transType";i:150501;s:7:"entries";a:1:{i:0;a:16:{s:5:"invId";i:1;s:9:"invNumber";s:4:"0011";s:7:"invName";s:6:"鞋子";s:7:"invSpec";s:3:"个";s:5:"skuId";i:-1;s:7:"skuName";s:0:"";s:6:"unitId";i:-1;s:8:"mainUnit";s:3:"斤";s:3:"qty";s:4:"1.00";s:5:"price";s:4:"5.00";s:12:"discountRate";s:1:"0";s:9:"deduction";s:4:"0.00";s:6:"amount";s:4:"5.00";s:11:"description";s:0:"";s:10:"locationId";i:2;s:12:"locationName";s:12:"苏州仓库";}}s:8:"totalQty";d:1;s:11:"totalAmount";d:5;s:11:"description";s:0:"";s:7:"disRate";d:0;s:9:"disAmount";d:0;s:6:"amount";d:5;s:8:"billType";s:3:"PUR";s:13:"transTypeName";s:6:"购货";s:8:"billDate";s:10:"2015-11-02";s:10:"billStatus";i:0;s:3:"uid";s:1:"1";s:8:"userName";s:6:"小阳";s:10:"modifyTime";s:19:"2015-11-02 16:35:03";}', '', '', '', 0, '2015-11-02'),
(5, 2, 'CGDD201511021635586', 1, '小阳', 150501, 5, 5, 0, '2015-11-02', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'PUR', '2015-11-02 16:35:58', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a:21:{s:2:"id";i:-1;s:4:"buId";i:2;s:11:"contactName";s:10:"2323211122";s:4:"date";s:10:"2015-11-02";s:12:"deliveryDate";s:10:"2015-11-02";s:6:"billNo";s:19:"CGDD201511021635586";s:9:"transType";i:150501;s:7:"entries";a:1:{i:0;a:16:{s:5:"invId";i:1;s:9:"invNumber";s:4:"0011";s:7:"invName";s:6:"鞋子";s:7:"invSpec";s:3:"个";s:5:"skuId";i:-1;s:7:"skuName";s:0:"";s:6:"unitId";i:-1;s:8:"mainUnit";s:3:"斤";s:3:"qty";s:4:"1.00";s:5:"price";s:4:"5.00";s:12:"discountRate";s:1:"0";s:9:"deduction";s:4:"0.00";s:6:"amount";s:4:"5.00";s:11:"description";s:0:"";s:10:"locationId";i:2;s:12:"locationName";s:12:"苏州仓库";}}s:8:"totalQty";d:1;s:11:"totalAmount";d:5;s:11:"description";s:0:"";s:7:"disRate";d:0;s:9:"disAmount";d:0;s:6:"amount";d:5;s:8:"billType";s:3:"PUR";s:13:"transTypeName";s:6:"购货";s:8:"billDate";s:10:"2015-11-02";s:10:"billStatus";i:0;s:3:"uid";s:1:"1";s:8:"userName";s:6:"小阳";s:10:"modifyTime";s:19:"2015-11-02 16:35:58";}', '', '', '', 0, '2015-11-02'),
(6, 2, 'CGDD201511021636268', 1, '小阳', 150501, 5, 5, 0, '2015-11-02', '', 0, 0, 0, 1, 0, 0, '小阳', 0, 0, 1, 0, 'PUR', '2015-11-02 16:37:37', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a:22:{s:2:"id";i:6;s:4:"buId";i:2;s:11:"contactName";s:10:"2323211122";s:4:"date";s:10:"2015-11-02";s:12:"deliveryDate";s:10:"2015-11-02";s:6:"billNo";s:19:"CGDD201511021636268";s:9:"transType";i:150501;s:7:"entries";a:1:{i:0;a:16:{s:5:"invId";i:1;s:9:"invNumber";s:4:"0011";s:7:"invName";s:4:"0011";s:7:"invSpec";s:3:"个";s:5:"skuId";i:-1;s:7:"skuName";s:0:"";s:6:"unitId";i:-1;s:8:"mainUnit";s:3:"斤";s:3:"qty";s:4:"1.00";s:5:"price";s:4:"5.00";s:12:"discountRate";s:1:"0";s:9:"deduction";s:4:"0.00";s:6:"amount";s:4:"5.00";s:11:"description";s:0:"";s:10:"locationId";i:2;s:12:"locationName";s:12:"苏州仓库";}}s:8:"totalQty";d:1;s:11:"totalAmount";d:5;s:11:"description";s:0:"";s:7:"disRate";d:0;s:9:"disAmount";d:0;s:6:"amount";i:5;s:8:"billType";s:3:"PUR";s:13:"transTypeName";s:6:"购货";s:8:"billDate";s:10:"2015-11-02";s:10:"billStatus";i:0;s:3:"uid";s:1:"1";s:8:"userName";s:6:"小阳";s:10:"modifyTime";s:19:"2015-11-02 16:37:37";s:7:"checked";s:1:"0";}', '', '', '', 0, '2015-11-02'),
(7, 1, 'XSDD201511021638063', 1, '小阳', 150601, 10, 10, 0, '2015-11-02', '', 0, 0, 0, 1, 0, 2, '小阳', 0, 0, 1, 0, 'SALE', '2015-11-03 11:34:02', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a:26:{s:2:"id";i:7;s:4:"buId";i:1;s:11:"contactName";s:4:"2313";s:7:"salesId";i:0;s:9:"salesName";s:5:"(空)";s:4:"date";s:10:"2015-11-02";s:12:"deliveryDate";s:10:"2015-11-02";s:6:"billNo";s:19:"XSDD201511021638063";s:9:"transType";i:150601;s:7:"entries";a:1:{i:0;a:16:{s:5:"invId";i:1;s:9:"invNumber";s:4:"0011";s:7:"invName";s:6:"鞋子";s:7:"invSpec";s:3:"个";s:5:"skuId";i:-1;s:7:"skuName";s:0:"";s:6:"unitId";i:-1;s:8:"mainUnit";s:4:"斤1";s:3:"qty";s:4:"1.00";s:5:"price";s:5:"10.00";s:12:"discountRate";s:1:"0";s:9:"deduction";s:4:"0.00";s:6:"amount";s:5:"10.00";s:10:"locationId";i:2;s:12:"locationName";s:12:"苏州仓库";s:11:"description";s:0:"";}}s:8:"totalQty";d:1;s:13:"totalDiscount";d:0;s:11:"totalAmount";d:10;s:11:"description";s:0:"";s:7:"disRate";d:0;s:9:"disAmount";d:0;s:6:"amount";d:10;s:8:"billType";s:4:"SALE";s:8:"billDate";s:10:"2015-11-02";s:13:"transTypeName";s:6:"销货";s:8:"totalTax";i:0;s:14:"totalTaxAmount";i:0;s:3:"uid";s:1:"1";s:8:"userName";s:6:"小阳";s:10:"modifyTime";s:19:"2015-11-03 11:34:02";s:7:"checked";s:1:"0";}', '', '', '', 0, '2015-11-02'),
(8, 1, 'XSDD201511021638135', 1, '小阳', 150601, 10, 10, 0, '2015-11-02', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2015-11-02 16:38:13', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a:25:{s:2:"id";i:-1;s:4:"buId";i:1;s:11:"contactName";s:4:"2313";s:7:"salesId";i:0;s:9:"salesName";s:5:"(空)";s:4:"date";s:10:"2015-11-02";s:12:"deliveryDate";s:10:"2015-11-02";s:6:"billNo";s:19:"XSDD201511021638135";s:9:"transType";i:150601;s:7:"entries";a:1:{i:0;a:16:{s:5:"invId";i:1;s:9:"invNumber";s:4:"0011";s:7:"invName";s:6:"鞋子";s:7:"invSpec";s:3:"个";s:5:"skuId";i:-1;s:7:"skuName";s:0:"";s:6:"unitId";i:-1;s:8:"mainUnit";s:3:"斤";s:3:"qty";s:4:"1.00";s:5:"price";s:5:"10.00";s:12:"discountRate";s:1:"0";s:9:"deduction";s:4:"0.00";s:6:"amount";s:5:"10.00";s:10:"locationId";i:2;s:12:"locationName";s:12:"苏州仓库";s:11:"description";s:0:"";}}s:8:"totalQty";d:1;s:13:"totalDiscount";d:0;s:11:"totalAmount";d:10;s:11:"description";s:0:"";s:7:"disRate";d:0;s:9:"disAmount";d:0;s:6:"amount";d:10;s:8:"billType";s:4:"SALE";s:8:"billDate";s:10:"2015-11-02";s:13:"transTypeName";s:6:"销货";s:8:"totalTax";i:0;s:14:"totalTaxAmount";i:0;s:3:"uid";s:1:"1";s:8:"userName";s:6:"小阳";s:10:"modifyTime";s:19:"2015-11-02 16:38:13";}', '', '', '', 0, '2015-11-02'),
(9, 1, 'XSDD201511021639128', 1, '小阳', 150601, 10, 10, 0, '2015-11-02', '', 0, 0, 0, 1, 0, 2, '小阳', 0, 0, 1, 0, 'SALE', '2015-11-02 16:39:20', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a:26:{s:2:"id";i:9;s:4:"buId";i:1;s:11:"contactName";s:4:"2313";s:7:"salesId";i:0;s:9:"salesName";s:5:"(空)";s:4:"date";s:10:"2015-11-02";s:12:"deliveryDate";s:10:"2015-11-02";s:6:"billNo";s:19:"XSDD201511021639128";s:9:"transType";i:150601;s:7:"entries";a:1:{i:0;a:16:{s:5:"invId";i:1;s:9:"invNumber";s:4:"0011";s:7:"invName";s:6:"鞋子";s:7:"invSpec";s:3:"个";s:5:"skuId";i:-1;s:7:"skuName";s:0:"";s:6:"unitId";i:-1;s:8:"mainUnit";s:3:"斤";s:3:"qty";s:4:"1.00";s:5:"price";s:5:"10.00";s:12:"discountRate";s:1:"0";s:9:"deduction";s:4:"0.00";s:6:"amount";s:5:"10.00";s:10:"locationId";i:2;s:12:"locationName";s:12:"苏州仓库";s:11:"description";s:0:"";}}s:8:"totalQty";d:1;s:13:"totalDiscount";d:0;s:11:"totalAmount";d:10;s:11:"description";s:0:"";s:7:"disRate";d:0;s:9:"disAmount";d:0;s:6:"amount";d:10;s:8:"billType";s:4:"SALE";s:8:"billDate";s:10:"2015-11-02";s:13:"transTypeName";s:6:"销货";s:8:"totalTax";i:0;s:14:"totalTaxAmount";i:0;s:3:"uid";s:1:"1";s:8:"userName";s:6:"小阳";s:10:"modifyTime";s:19:"2015-11-02 16:39:20";s:7:"checked";s:1:"0";}', '', '', '', 0, '2015-11-02'),
(10, 2, 'XSDD201511070854553', 1, '小阳', 150601, 15, 15, 0, '2015-11-07', '', 0, 0, 0, 3, 0, 0, '', 0, 0, 0, 0, 'SALE', '2015-11-07 08:57:40', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a:26:{s:2:"id";i:10;s:4:"buId";i:2;s:11:"contactName";s:5:"00111";s:7:"salesId";i:0;s:9:"salesName";s:5:"(空)";s:4:"date";s:10:"2015-11-07";s:12:"deliveryDate";s:10:"2015-11-07";s:6:"billNo";s:19:"XSDD201511070854553";s:9:"transType";i:150601;s:7:"entries";a:3:{i:0;a:16:{s:5:"invId";s:1:"1";s:9:"invNumber";s:3:"123";s:7:"invName";s:9:"小不点";s:7:"invSpec";s:3:"123";s:5:"skuId";i:-1;s:7:"skuName";s:0:"";s:6:"unitId";s:1:"0";s:8:"mainUnit";s:3:"123";s:3:"qty";s:3:"1.0";s:5:"price";s:3:"5.0";s:12:"discountRate";s:1:"0";s:9:"deduction";s:4:"0.00";s:6:"amount";s:4:"5.00";s:10:"locationId";i:1;s:12:"locationName";i:11;s:11:"description";s:0:"";}i:1;a:16:{s:5:"invId";s:1:"2";s:9:"invNumber";s:5:"32321";s:7:"invName";s:5:"25112";s:7:"invSpec";s:0:"";s:5:"skuId";i:-1;s:7:"skuName";s:0:"";s:6:"unitId";s:1:"0";s:8:"mainUnit";s:3:"123";s:3:"qty";s:3:"1.0";s:5:"price";s:3:"5.0";s:12:"discountRate";s:1:"0";s:9:"deduction";s:4:"0.00";s:6:"amount";s:4:"5.00";s:10:"locationId";i:1;s:12:"locationName";i:11;s:11:"description";s:0:"";}i:2;a:16:{s:5:"invId";s:1:"3";s:9:"invNumber";s:7:"1231213";s:7:"invName";s:3:"123";s:7:"invSpec";s:0:"";s:5:"skuId";i:-1;s:7:"skuName";s:0:"";s:6:"unitId";s:1:"0";s:8:"mainUnit";s:3:"123";s:3:"qty";s:3:"1.0";s:5:"price";s:3:"5.0";s:12:"discountRate";s:1:"0";s:9:"deduction";s:4:"0.00";s:6:"amount";s:4:"5.00";s:10:"locationId";i:1;s:12:"locationName";i:11;s:11:"description";s:0:"";}}s:8:"totalQty";d:3;s:13:"totalDiscount";d:0;s:11:"totalAmount";d:15;s:11:"description";s:0:"";s:7:"disRate";d:0;s:9:"disAmount";d:0;s:6:"amount";d:15;s:8:"billType";s:4:"SALE";s:8:"billDate";s:10:"2015-11-07";s:13:"transTypeName";s:6:"销货";s:8:"totalTax";i:0;s:14:"totalTaxAmount";i:0;s:3:"uid";s:1:"1";s:8:"userName";s:6:"小阳";s:10:"modifyTime";s:19:"2015-11-07 08:57:40";s:7:"checked";s:1:"0";}', '', '', '', 0, '2015-11-07');

-- --------------------------------------------------------

--
-- 表的结构 `ci_order_info`
--

CREATE TABLE IF NOT EXISTS `ci_order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `transType` int(11) DEFAULT '0' COMMENT '150501采购 150502退货',
  `amount` double DEFAULT '0' COMMENT '购货金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `invId` int(11) DEFAULT '0' COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountRate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  `locationId` smallint(6) DEFAULT '0',
  `tax` double DEFAULT '0',
  `taxRate` double DEFAULT '0',
  `taxAmount` double DEFAULT '0',
  `unitId` smallint(6) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `skuId` int(11) DEFAULT '0',
  `entryId` tinyint(1) DEFAULT '1' COMMENT '区分调拨单  进和出',
  `transTypeName` varchar(25) DEFAULT '',
  `srcOrderEntryId` int(11) DEFAULT '0',
  `srcOrderId` int(11) DEFAULT '0',
  `srcOrderNo` varchar(25) DEFAULT '',
  `billType` varchar(20) DEFAULT '',
  `salesId` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除 0正常',
  PRIMARY KEY (`id`),
  KEY `type` (`transType`),
  KEY `billdate` (`billDate`),
  KEY `invId` (`invId`) USING BTREE,
  KEY `transType` (`transType`),
  KEY `iid` (`iid`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=133 ;

--
-- 转存表中的数据 `ci_order_info`
--

INSERT INTO `ci_order_info` (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `uid`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `salesId`, `isDelete`) VALUES
(110, 1, 2, 'CGDD201510291724412', 150501, 5, '2015-10-29', '', 1, 5, 0, 0, 1, 2, 0, 0, 0, 0, 1, -1, 1, '购货', 0, 0, '', 'PUR', 0, 0),
(111, -1, 1, 'XSDD201510291750469', 150601, 10, '2015-10-29', '', 1, 10, 0, 0, -1, 2, 0, 0, 0, 0, 1, -1, 1, '销货', 0, 0, '', 'SALE', 0, 0),
(112, -1, 1, 'XSDD201510291800220', 150601, 10, '2015-10-29', '', 1, 10, 0, 0, -1, 2, 0, 0, 0, 0, 1, -1, 1, '销货', 0, 0, '', 'SALE', 0, 0),
(113, 2, 1, 'XSDD201510291813550', 150601, 10, '2015-10-29', '', 1, 10, 0, 0, -1, 2, 0, 0, 0, 0, 1, -1, 1, '销货', 0, 0, '', 'SALE', 0, 0),
(114, 3, 1, 'XSDD201510311600030', 150601, 10, '2015-10-31', '', 1, 10, 0, 0, -1, 2, 0, 0, 0, 0, 3, -1, 1, '销货', 0, 0, '', 'SALE', 1, 0),
(115, 4, 2, 'CGDD201511021635034', 150501, 5, '2015-11-02', '', 1, 5, 0, 0, 1, 2, 0, 0, 0, -1, 1, -1, 1, '购货', 0, 0, '', 'PUR', 0, 0),
(116, 5, 2, 'CGDD201511021635586', 150501, 5, '2015-11-02', '', 1, 5, 0, 0, 1, 2, 0, 0, 0, -1, 1, -1, 1, '购货', 0, 0, '', 'PUR', 0, 0),
(120, 6, 2, 'CGDD201511021636268', 150501, 5, '2015-11-02', '', 1, 5, 0, 0, 1, 2, 0, 0, 0, -1, 1, -1, 1, '购货', 0, 0, '', 'PUR', 0, 0),
(122, 8, 1, 'XSDD201511021638135', 150601, 10, '2015-11-02', '', 1, 10, 0, 0, -1, 2, 0, 0, 0, -1, 1, -1, 1, '销货', 0, 0, '', 'SALE', 0, 0),
(125, 9, 1, 'XSDD201511021639128', 150601, 10, '2015-11-02', '', 1, 10, 0, 0, -1, 2, 0, 0, 0, -1, 1, -1, 1, '销货', 0, 0, '', 'SALE', 0, 0),
(126, 7, 1, 'XSDD201511021638063', 150601, 10, '2015-11-02', '', 1, 10, 0, 0, -1, 2, 0, 0, 0, -1, 1, -1, 1, '销货', 0, 0, '', 'SALE', 0, 0),
(130, 10, 2, 'XSDD201511070854553', 150601, 5, '2015-11-07', '', 1, 5, 0, 0, -1, 1, 0, 0, 0, 0, 1, -1, 1, '销货', 0, 0, '', 'SALE', 0, 0),
(131, 10, 2, 'XSDD201511070854553', 150601, 5, '2015-11-07', '', 2, 5, 0, 0, -1, 1, 0, 0, 0, 0, 1, -1, 1, '销货', 0, 0, '', 'SALE', 0, 0),
(132, 10, 2, 'XSDD201511070854553', 150601, 5, '2015-11-07', '', 3, 5, 0, 0, -1, 1, 0, 0, 0, 0, 1, -1, 1, '销货', 0, 0, '', 'SALE', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_payment_info`
--

CREATE TABLE IF NOT EXISTS `ci_payment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billId` int(11) DEFAULT '0' COMMENT '销售单号ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '销售单编号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `billPrice` double DEFAULT '0' COMMENT '单据金额',
  `hasCheck` double DEFAULT '0' COMMENT '已收款',
  `notCheck` double DEFAULT '0' COMMENT '未收款',
  `nowCheck` double DEFAULT '0' COMMENT '本次收款',
  `transType` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type,billdate` (`billDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_printtemplates`
--

CREATE TABLE IF NOT EXISTS `ci_printtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `info` text,
  `type` int(11) DEFAULT '0',
  `isDefault` tinyint(1) DEFAULT '0',
  `isSystem` tinyint(1) DEFAULT '0',
  `filePath` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_receipt_info`
--

CREATE TABLE IF NOT EXISTS `ci_receipt_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billId` int(11) DEFAULT '0' COMMENT '销售单号ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '销售单编号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `billPrice` double DEFAULT '0' COMMENT '单据金额',
  `hasCheck` double DEFAULT '0' COMMENT '已收款',
  `notCheck` double DEFAULT '0' COMMENT '未收款',
  `nowCheck` double DEFAULT '0' COMMENT '本次收款',
  `transType` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type,billdate` (`billDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_staff`
--

CREATE TABLE IF NOT EXISTS `ci_staff` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `number` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用  1禁用',
  `allowsms` tinyint(4) DEFAULT '0',
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `commissionrate` tinyint(4) DEFAULT '0',
  `creatorId` int(11) DEFAULT '0',
  `deptId` int(11) DEFAULT '0',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `empId` int(11) DEFAULT '0',
  `empType` tinyint(4) DEFAULT '1',
  `fullId` int(11) DEFAULT '0',
  `leftDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `parentId` smallint(6) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `number` (`number`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ci_staff`
--

INSERT INTO `ci_staff` (`id`, `name`, `number`, `disable`, `allowsms`, `birthday`, `commissionrate`, `creatorId`, `deptId`, `description`, `email`, `empId`, `empType`, `fullId`, `leftDate`, `mobile`, `parentId`, `sex`, `userName`, `isDelete`) VALUES
(1, '111', '001', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 1),
(2, '111', '001', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_storage`
--

CREATE TABLE IF NOT EXISTS `ci_storage` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `locationNo` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `disable` tinyint(1) DEFAULT '0' COMMENT '状态 0正常  1锁定',
  `allowNeg` tinyint(4) DEFAULT '0',
  `deptId` int(11) DEFAULT '0',
  `empId` int(11) DEFAULT '0',
  `groupx` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `locationNo` (`locationNo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ci_storage`
--

INSERT INTO `ci_storage` (`id`, `name`, `locationNo`, `disable`, `allowNeg`, `deptId`, `empId`, `groupx`, `phone`, `type`, `address`, `isDelete`) VALUES
(1, '仓库', '1', 0, 0, 0, 0, NULL, NULL, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_unit`
--

CREATE TABLE IF NOT EXISTS `ci_unit` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `unitTypeId` smallint(6) DEFAULT '0',
  `default` tinyint(1) DEFAULT '0',
  `rate` tinyint(1) DEFAULT '0',
  `guid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ci_unit`
--

INSERT INTO `ci_unit` (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES
(1, '分', 1, 0, 0, 0, '', 1),
(2, '1312', 1, 0, 0, 0, '', 0),
(3, '123', 1, 0, 0, 0, '', 0),
(4, '分', 1, 0, 0, 0, '', 0),
(5, '23', 1, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_unittype`
--

CREATE TABLE IF NOT EXISTS `ci_unittype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
